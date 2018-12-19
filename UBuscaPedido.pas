unit UBuscaPedido;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, ExtCtrls, DBCtrls, StdCtrls, Buttons, RXLookup, Grids,
  DBGrids, RXDBCtrl, Db, DbTables, Mask, ToolEdit, CurrEdit, DBFilter, ALed;

type
  TfBuscaPedido = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    BitBtn4: TBitBtn;
    Bevel1: TBevel;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Edit2: TEdit;
    Label5: TLabel;
    Edit3: TEdit;
    ALed1: TALed;
    Label6: TLabel;
    Label7: TLabel;
    ALed2: TALed;
    ALed3: TALed;
    Label8: TLabel;
    Label9: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    Edit4: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
              AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit3Enter(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fBuscaPedido: TfBuscaPedido;
  vSelecionado: Boolean;
  vPedido: integer;

implementation

uses UDM1, UEmissaoNotaFiscal, UAgendaTelef;

{$R *.DFM}

procedure TfBuscaPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tCliente.IndexFieldNames := 'Codigo';
  DM1.tPedido.IndexFieldNames := 'Pedido';
  Action := CaFree;
end;

procedure TfBuscaPedido.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfBuscaPedido.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
  DM1.tPedido.IndexFieldNames  := 'CodCliente';
end;

procedure TfBuscaPedido.RxDBLookupCombo1Change(Sender: TObject);
begin
  DM1.tPedido.FindNearest([DM1.tClienteCodigo.AsInteger]);
end;

procedure TfBuscaPedido.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
//var
//  Copiado, Selecionado : Boolean;
begin
{  Copiado     := (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Copiado').AsBoolean;
  Selecionado := (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Selecionado').AsBoolean;
  if Copiado then
    begin
      Background  := clTeal;
      AFont.Color := clWhite;
    end
  else
  if not Copiado then
    begin
      Background  := clWhite;
      AFont.Color := clBlack;
    end;
  if Selecionado then
    begin
      Background  := clGreen;
      AFont.Color := clWhite;
    end;}
end;

procedure TfBuscaPedido.RxDBGrid1DblClick(Sender: TObject);
begin
  Edit2.Text := DM1.tPedidoPedido.AsString;
  Edit3.Text := DM1.tPedidoPedidoCliente.AsString;
  Edit4.Text := DM1.tPedidoPedCliDif.AsString;
  Edit1.Text := DM1.tPedidoItemItem.AsString;
  CurrencyEdit1.Value := DM1.tPedidoItemQtdParesRest.AsInteger;
  Edit1Exit(Sender);
end;

procedure TfBuscaPedido.FormShow(Sender: TObject);
begin
  vSelecionado := False;
end;

procedure TfBuscaPedido.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if vSelecionado then
    begin
      ShowMessage('Esta janela não pode ser fechada se há um item selecionado!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfBuscaPedido.BitBtn2Click(Sender: TObject);
begin
  Edit1.Text := '';
  Edit2.Text := '';
  CurrencyEdit1.Value := 0;
  CurrencyEdit2.Value := 0;
  Edit2.SetFocus;
end;

procedure TfBuscaPedido.BitBtn1Click(Sender: TObject);
begin
  DM1.tPedido.IndexFieldNames := 'Pedido';
  vNumPedido  := 0;
  vItemPedido := 0;
  if (Edit2.Text <> '') and (Edit1.Text <> '') and (CurrencyEdit2.Value > 0)then
    begin
      if (Edit1.Text = '') or (CurrencyEdit1.Value = 0) then
        ShowMessage('Campos em branco')
      else
      if MessageDlg('Deseja Copiar o pedido ' + Edit3.Text + ' Item ' + Edit1.Text + ' para a nota?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        begin
          DM1.tPedido.SetKey;
          DM1.tPedidoPedido.AsString := Edit2.Text;
          if DM1.tPedido.GotoKey = False then
            ShowMessage('Pedido não cadastrado!')
          else             
          if DM1.tPedidoCancelado.AsBoolean  then
            ShowMessage('Este Pedido foi cancelado!')
          else
          if DM1.tPedidoSuspenso.AsBoolean  then
            ShowMessage('Este Pedido está suspenso!')
          else
          if not DM1.tPedidoQtdParesRest.AsInteger > 0  then
            ShowMessage('Este Pedido já foi faturado!')
          else                           
            begin
              DM1.tPedidoItem.SetKey;
              DM1.tPedidoItemPedido.AsString := Edit2.Text;
              DM1.tPedidoItemItem.AsInteger  := StrToInt(Edit1.Text);
              if DM1.tPedidoItem.GotoKey = False then
                begin
                  ShowMessage('Item não cadastrado!');
                  BitBtn2Click(Sender);
                end
              else
              if DM1.tPedidoItemCancelado.AsBoolean then
                ShowMessage('Item esta cancelado!')
              else
              if not DM1.tPedidoItemQtdParesRest.AsInteger > 0 then
                ShowMessage('Item já foi faturado!')
              else
              if (DM1.tPedidoItemCopiado.AsBoolean) then
                ShowMessage('Já foi copiado este item!')
              else
                begin
                  if CurrencyEdit1.Value > DM1.tPedidoItemQtdParesRest.AsInteger then
                    begin
                      ShowMessage('Qtde. maior da restante!');
                      CurrencyEdit1.SetFocus;
                    end
                  else
                    begin
                      fEmissaoNotaFiscal.Edit1.Text := DM1.tPedidoItemlkReferencia.AsString;
                      fEmissaoNotaFiscal.Edit2.Text := DM1.tPedidoItemlkUnidade.AsString;
                      fEmissaoNotaFiscal.RxDBLookupCombo4.Value := DM1.tPedidoItemCodCor.AsString;
                      fEmissaoNotaFiscal.Edit1Exit(Sender);
                      if DM1.tPedidoItemSitTrib.AsInteger > 0 then
                        fEmissaoNotaFiscal.RxDBLookupCombo13.KeyValue := DM1.tPedidoItemSitTrib.AsInteger
                      else
                        fEmissaoNotaFiscal.RxDBLookupCombo13.ClearValue;
                      fEmissaoNotaFiscal.Edit3.Text := CurrencyEdit1.Text;
      //                DM1.tNotaFiscalPesoBruto.AsFloat     := DM1.tNotaFiscalPesoBruto.AsFloat   + (StrToInt(fEmissaoNotaFiscal.Edit3.Text) * DM1.tPedidoItemlkPesoBruto.AsFloat);
      //                DM1.tNotaFiscalPesoLiquido.AsFloat   := DM1.tNotaFiscalPesoLiquido.AsFloat + (StrToInt(fEmissaoNotaFiscal.Edit3.Text) * DM1.tPedidoItemlkPesoLiquido.AsFloat);
                      fEmissaoNotaFiscal.Edit7.Text := CurrencyEdit2.Text;
                      fEmissaoNotaFiscal.Edit8.Text := FloatToStr(StrToFloat(fEmissaoNotaFiscal.Edit3.Text) * StrToFloat(fEmissaoNotaFiscal.Edit7.Text));
                      // verifica a sit.tributaria
                      if fEmissaoNotaFiscal.RxDBLookupCombo13.Text <> '' then
                        begin
                          DM1.tSitTributaria.SetKey;
                          DM1.tSitTributariaCodigo.AsInteger := fEmissaoNotaFiscal.RxDBLookupCombo13.KeyValue;
                          if (DM1.tSitTributaria.GotoKey) and (DM1.tSitTributariaSitTributaria.AsFloat = 0) then
                            fEmissaoNotaFiscal.Edit4.Clear;
                        end;
                      vNumPedido                    := DM1.tPedidoPedido.AsInteger;
                      vItemPedido                   := DM1.tPedidoItemItem.AsInteger;
                      fEmissaoNotaFiscal.BitBtn6.Click;
                    end;
                end;
            end;
        end;
    end;
  Edit1.Clear;
  CurrencyEdit1.Clear;
  CurrencyEdit2.Clear;
end;

procedure TfBuscaPedido.RxDBGrid2DblClick(Sender: TObject);
begin
  Edit2.Text := DM1.tPedidoPedido.AsString;
  Edit3.Text := DM1.tPedidoPedidoCliente.AsString;
  Edit4.Text := DM1.tPedidoPedCliDif.AsString;
end;

procedure TfBuscaPedido.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (DM1.tPedidoQtdParesFat.AsInteger > 0) and (DM1.tPedidoQtdParesRest.AsInteger = 0) then
    Background  := $006FDD00;
  if DM1.tPedidoCancelado.AsBoolean then
    Background  := clRed;
end;

procedure TfBuscaPedido.BitBtn4Click(Sender: TObject);
var
  vAux, vTaxa : Real;
begin
  DM1.tPedido.IndexFieldNames := 'Pedido';
  vItemPedido := 0;
  if (Edit2.Text <> '') and (Edit1.Text <> '') then
    begin
      ShowMessage('Para copiar o pedido integral, não pode ter item marcado!');
      Edit1.SetFocus;
    end
  else
  if Edit2.Text <> '' then
    begin
      if MessageDlg('Deseja Copiar o pedido ' + Edit2.Text + ' para a nota?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        begin
          DM1.tPedido.SetKey;
          DM1.tPedidoPedido.AsString := Edit2.Text;
          if DM1.tPedido.GotoKey then
            begin
              if DM1.tPedidoSuspenso.AsBoolean then
                ShowMessage('Este pedido esta suspenso!')
              else
              if DM1.tPedidoCancelado.AsBoolean then
                ShowMessage('Este pedido esta cancelado!')
              else
              if (DM1.tPedidoCopiado.AsBoolean = False) or (DM1.tPedidoQtdParesRest.AsInteger > 0)then
                begin
                  vTaxa := 1;
                  if DM1.tPedidoDolar.AsBoolean then
                    begin
                      DM1.tIndexador.IndexFieldNames := 'Data';
                      DM1.tIndexador.SetKey;
                      DM1.tIndexadorData.AsDateTime  := DM1.tNotaFiscalDtEmissao.AsDateTime;
                      if DM1.tIndexador.GotoKey then
                        vTaxa := DM1.tIndexadorTaxa.AsFloat
                      else
                        ShowMessage('Não possui índice cadastrado!');
                    end;
                  DM1.tNotaFiscalCodNatOper.AsInteger  := DM1.tPedidoCodNatOper.AsInteger;
                  DM1.tNatOperacao.IndexFieldNames := 'Codigo';
                  DM1.tNatOperacao.SetKey;
                  DM1.tNatOperacaoCodigo.AsInteger := DM1.tPedidoCodNatOper.AsInteger;
                  if DM1.tNatOperacao.GotoKey then
                    begin
                      if DM1.tNatOperacaoLei.AsString <> ' ' then
                        DM1.tNotaFiscalObs.AsString := DM1.tNotaFiscalObs.AsString + ' ' + DM1.tNatOperacaoLei.AsString + ' ';
                    end;
                  DM1.tNotaFiscalCodCli.AsInteger      := DM1.tPedidoCodCliente.AsInteger;
                  fEmissaoNotaFiscal.RxDBLookupCombo8Change(Sender);
                  DM1.tNotaFiscalCodVendedor.AsInteger := DM1.tPedidoCodVendedor.AsInteger;
                  DM1.tNotaFiscalPercComissao.AsFloat  := DM1.tPedidoPercComissao.AsFloat;
                  if DM1.tPedidoCodCondPgto.AsInteger < 1 then
                    DM1.tNotaFiscalCondPgto.AsString     := 'N'
                  else
                    DM1.tNotaFiscalCondPgto.AsString     := DM1.tPedidolkPrazoVista.AsString;
                  DM1.tNotaFiscalSituacao.AsInteger    := DM1.tPedidoSituacao.AsInteger;
                  DM1.tNotaFiscalCodTransp.AsInteger   := DM1.tPedidoCodTransp.AsInteger;
                  if DM1.tPedidoTipoFrete.AsString = 'C' then
                    DM1.tNotaFiscalEmitDest.AsInteger := 1
                  else
                    DM1.tNotaFiscalEmitDest.AsInteger := 2;
                  //*** Copia os itens do pedido para os itens da nota
                  DM1.tPedidoItem.First;
                  while not DM1.tPedidoItem.EOF do
                    begin
                      if not(DM1.tPedidoItemCancelado.AsBoolean) and not(DM1.tPedidoItemCopiado.AsBoolean) then
                        begin
                          vNumPedido  := DM1.tPedidoItemPedido.AsInteger;
                          vItemPedido := DM1.tPedidoItemItem.AsInteger;
                          fEmissaoNotaFiscal.Edit1.Text  := DM1.tPedidoItemlkReferencia.AsString;
                          fEmissaoNotaFiscal.Edit1Exit(Sender);
                          if DM1.tPedidoItemSitTrib.AsInteger > 0 then
                            fEmissaoNotaFiscal.RxDBLookupCombo13.KeyValue := DM1.tPedidoItemSitTrib.AsInteger
                          else
                            fEmissaoNotaFiscal.RxDBLookupCombo13.ClearValue;
                          if DM1.tPedidoItemCodCor.AsInteger > 0 then
                            fEmissaoNotaFiscal.RxDBLookupCombo4.KeyValue := DM1.tPedidoItemCodCor.AsInteger;
                          fEmissaoNotaFiscal.Edit2.Text := DM1.tPedidoItemlkUnidade.AsString;
                          fEmissaoNotaFiscal.Edit3.Text := DM1.tPedidoItemQtdParesRest.AsString;
                          // verifica a sit.tributaria
                          if fEmissaoNotaFiscal.RxDBLookupCombo13.Text <> '' then
                            begin
                              DM1.tSitTributaria.SetKey;
                              DM1.tSitTributariaCodigo.AsInteger := fEmissaoNotaFiscal.RxDBLookupCombo13.KeyValue;
                              if (DM1.tSitTributaria.GotoKey) and (DM1.tSitTributariaSitTributaria.AsFloat = 0) then
                                fEmissaoNotaFiscal.Edit4.Clear;
                            end;
                          vAux := DM1.tPedidoItemPreco.AsFloat - DM1.tPedidoItemVlrDesconto.AsFloat;
                          if DM1.tPedidoSituacao.AsString = '2' then
                            vAux := StrToFloat(FormatFloat('0.00',(vAux * DM1.tParametrosPercC200.AsFloat / 100)));
                          if DM1.tPedidoDolar.AsBoolean then                      
                            vAux := StrToFloat(FormatFloat('0.00',(vAux * vTaxa)));
                          fEmissaoNotaFiscal.Edit7.Text := FormatFloat('0.00',vAux);
                          fEmissaoNotaFiscal.Edit7Exit(Sender);
                          fEmissaoNotaFiscal.BitBtn6Click(Sender);
                        end;
                      DM1.tPedidoItem.Next;
                    end;
                  DM1.tNotaFiscalPrazoPgto.AsInteger   := DM1.tPedidoCodCondPgto.AsInteger;
                  if DM1.tNotaFiscalCondPgto.AsString <> 'N' then
                    fEmissaoNotaFiscal.BitBtn8Click(Sender);
                end
              else
               ShowMessage('Este pedido já foi copiado!');
            end;
        end;
    end;
  Close;
end;

procedure TfBuscaPedido.Edit1Exit(Sender: TObject);
var
  vAux, vTaxa : Real;
begin
  if Edit1.Text <> '' then
    begin
      DM1.tPedidoItem.SetKey;
      DM1.tPedidoItemPedido.AsString := Edit2.Text;
      DM1.tPedidoItemItem.AsInteger  := StrToInt(Edit1.Text);
      if DM1.tPedidoItem.GotoKey then
        begin
          vTaxa := 1;
          if DM1.tPedidoDolar.AsBoolean then
            begin
              DM1.tIndexador.IndexFieldNames := 'Data';
              DM1.tIndexador.SetKey;
              DM1.tIndexadorData.AsDateTime  := DM1.tNotaFiscalDtEmissao.AsDateTime;
              if DM1.tIndexador.GotoKey then
                vTaxa := DM1.tIndexadorTaxa.AsFloat
              else
                ShowMessage('Não possui índice cadastrado!');
            end;
          CurrencyEdit1.Value := DM1.tPedidoItemQtdParesRest.AsInteger;
          vAux := DM1.tPedidoItemPreco.AsFloat - DM1.tPedidoItemVlrDesconto.AsFloat;
          if DM1.tPedidoSituacao.AsString = '2' then
            vAux := StrToFloat(FormatFloat('0.00',(vAux * DM1.tParametrosPercC200.AsFloat / 100)));
          if DM1.tPedidoDolar.AsBoolean then
            vAux := StrToFloat(FormatFloat('0.00',(vAux * vTaxa)));
          CurrencyEdit2.Value := vAux;
        end
      else
        begin
          ShowMessage('Item não cadastrado!');
          Edit1.SetFocus;
        end;
    end;
end;

procedure TfBuscaPedido.Edit2Change(Sender: TObject);
begin
  try
    DM1.tPedido.IndexFieldNames := 'Pedido';
    DM1.tPedido.FindNearest([Edit2.Text]);
    CurrencyEdit2.Clear;
  except
    ShowMessage('Digite apenas números aqui!');
  end;
end;

procedure TfBuscaPedido.Edit3Change(Sender: TObject);
begin
  try
    DM1.tPedido.IndexFieldNames := 'PedidoCliente;PedCliDif';
    DM1.tPedido.FindNearest([Edit3.Text]);
    Edit2.Text := DM1.tPedidoPedido.AsString;
  except
    ShowMessage('Digite apenas números aqui!');
  end;
end;

procedure TfBuscaPedido.Edit3Exit(Sender: TObject);
begin
  if Edit3.Text <> '' then
    begin
      DM1.tPedido.IndexFieldNames := 'PedidoCliente;PedCliDif';
      DM1.tPedido.SetKey;
      DM1.tPedidoPedidoCliente.AsString := Edit3.Text;
      DM1.tPedidoPedCliDif.AsString     := Edit4.Text;
      if DM1.tPedido.GotoKey then
        Edit2.Text := DM1.tPedidoPedido.AsString
      else
        begin
          ShowMessage('Pedido não cadastrado');
          Edit3.SetFocus;
          Edit4.Clear;
        end;
    end;
  DM1.tPedido.IndexFieldNames := 'Pedido';
end;

procedure TfBuscaPedido.Edit3Enter(Sender: TObject);
begin
  DM1.tPedido.IndexFieldNames := 'PedidoCliente;PedCliDif';
end;

procedure TfBuscaPedido.Edit2Exit(Sender: TObject);
begin
  if Edit2.Text <> '' then
    begin
      DM1.tPedido.IndexFieldNames := 'Pedido';
      DM1.tPedido.SetKey;
      DM1.tPedidoPedido.AsString := Edit2.Text;
      if DM1.tPedido.GotoKey then
        begin
          Edit3.Text := DM1.tPedidoPedidoCliente.AsString;
          Edit4.Text := DM1.tPedidoPedCliDif.AsString;
        end
      else
        Edit2.SetFocus;
    end;
end;

procedure TfBuscaPedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.

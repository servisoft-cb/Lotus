unit UBaixaPedido;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, RXDBCtrl, DBFilter, StdCtrls, RXLookup,
  Buttons, ExtCtrls, DBIProcs, Mask, ToolEdit, CurrEdit, ALed, Variants;

type
  TfBaixaPedido = class(TForm)
    tPedido: TTable;
    dsPedido: TDataSource;
    tPedidoPedido: TIntegerField;
    tPedidoDtEmissao: TDateField;
    tPedidoCodCliente: TIntegerField;
    tPedidoCodTransp: TIntegerField;
    tPedidoCodRedespacho: TIntegerField;
    tPedidoCodCondPgto: TIntegerField;
    tPedidoTipoFrete: TStringField;
    tPedidoCodVendedor: TIntegerField;
    tPedidoPercComissao: TFloatField;
    tPedidoDtIniEmbarque: TDateField;
    tPedidoDtFinEmbarque: TDateField;
    tPedidoCodNatOper: TIntegerField;
    tPedidoSituacao: TIntegerField;
    tPedidoNumLote: TIntegerField;
    tPedidoQtdPares: TFloatField;
    tPedidoVlrTotal: TFloatField;
    tPedidoVlrMercadoria: TFloatField;
    tPedidoVlrDesconto: TFloatField;
    tPedidoGerarLote: TStringField;
    tPedidoCancelado: TBooleanField;
    tPedidoSuspenso: TBooleanField;
    tPedidoImpresso: TBooleanField;
    tPedidoPesoBruto: TFloatField;
    tPedidoPesoLiquido: TFloatField;
    tPedidoSelecionado: TBooleanField;
    tPedidoCopiado: TBooleanField;
    tPedidoPedidoCliente: TIntegerField;
    tPedidoObs: TMemoField;
    tCliente: TTable;
    dsCliente: TDataSource;
    tClienteCodigo: TIntegerField;
    tClienteNome: TStringField;
    tClienteEndereco: TStringField;
    tClienteBairro: TStringField;
    tClienteCidade: TStringField;
    tClienteUf: TStringField;
    tClienteTelefone: TStringField;
    tClienteTelefone2: TStringField;
    tClienteFax: TStringField;
    tClientePessoa: TStringField;
    tClienteCgcCpf: TStringField;
    tClienteInscrEst: TStringField;
    tClienteContato: TStringField;
    tClienteObs: TMemoField;
    tClienteAprovCredito: TStringField;
    tClienteTipoAprov: TStringField;
    tClienteEndEntrega: TStringField;
    tClienteBairroEntrega: TStringField;
    tClienteCidEntrega: TStringField;
    tClienteUfEntrega: TStringField;
    tClienteCgcCpfEntrega: TStringField;
    tClienteInscEntrega: TStringField;
    tClienteEndPgto: TStringField;
    tClienteBairroPgto: TStringField;
    tClienteCidPgto: TStringField;
    tClienteUfPgto: TStringField;
    tClienteFantasia: TStringField;
    tClienteDtCadastro: TDateField;
    tClienteCodVendedor: TIntegerField;
    tClienteObsCtas: TMemoField;
    tClienteLojas: TIntegerField;
    tPedidolkCliente: TStringField;
    RxDBFilter1: TRxDBFilter;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    tClienteSelecionado: TBooleanField;
    tPedidoItem: TTable;
    dsPedidoItem: TDataSource;
    tPedidoItemPedido: TIntegerField;
    tPedidoItemItem: TIntegerField;
    tPedidoItemCodProduto: TIntegerField;
    tPedidoItemCodCor: TIntegerField;
    tPedidoItemCodGrade: TIntegerField;
    tPedidoItemQtdPares: TFloatField;
    tPedidoItemQtdParesFat: TFloatField;
    tPedidoItemQtdParesRest: TFloatField;
    tPedidoItemPreco: TFloatField;
    tPedidoItemVlrTotal: TFloatField;
    tPedidoItemCodCabedal1: TIntegerField;
    tPedidoItemCodCabedal2: TIntegerField;
    tPedidoItemCodCorForro: TIntegerField;
    tPedidoItemCodCorSolado: TIntegerField;
    tPedidoItemCodCorPalmilha: TIntegerField;
    tPedidoItemCancelado: TBooleanField;
    tPedidoItemCopiado: TBooleanField;
    tPedidoItemSelecionado: TBooleanField;
    tPedidoItemQtdParesCanc: TFloatField;
    tPedidoItemCodForro: TIntegerField;
    tPedidoItemCodEtiqueta: TIntegerField;
    tPedidoItemVlrDesconto: TFloatField;
    tPedidoItemCodSolado: TIntegerField;
    tPedidoItemSitTrib: TSmallintField;
    tPedidoNota: TTable;
    dsPedidoNota: TDataSource;
    tPedidoNotaPedido: TIntegerField;
    tPedidoNotaItem: TIntegerField;
    tPedidoNotaItemNota: TIntegerField;
    tPedidoNotaDtNota: TDateField;
    tPedidoNotaQtdPares: TIntegerField;
    tPedidoNumNota: TFloatField;
    tPedidoDtNota: TDateField;
    tPedidoQtdParesCanc: TFloatField;
    tPedidoQtdParesFat: TFloatField;
    tPedidoQtdParesRest: TFloatField;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    RadioGroup1: TRadioGroup;
    Bevel2: TBevel;
    Bevel3: TBevel;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    BitBtn3: TBitBtn;
    CurrencyEdit3: TCurrencyEdit;
    RxDBGrid2: TRxDBGrid;
    GroupBox2: TGroupBox;
    RxDBGrid1: TRxDBGrid;
    GroupBox3: TGroupBox;
    tPedidoItemlkproduto: TStringField;
    tPedidoItemQtdFatMan: TFloatField;
    tPedidoItemQtdFatAut: TFloatField;
    Label8: TLabel;
    ALed1: TALed;
    Label6: TLabel;
    Label7: TLabel;
    ALed2: TALed;
    Label9: TLabel;
    DateEdit1: TDateEdit;
    Bevel4: TBevel;
    tPedidoQtdFatAut: TFloatField;
    tPedidoQtdFatMan: TFloatField;
    tPedidoItemlkNomeCor: TStringField;
    tExtComissaoIns: TTable;
    tExtComissaoInsNroLancamento: TIntegerField;
    tExtComissaoInsCodVendedor: TIntegerField;
    tExtComissaoInsDtReferencia: TDateField;
    tExtComissaoInsNroDoc: TIntegerField;
    tExtComissaoInsParcDoc: TIntegerField;
    tExtComissaoInsCodCliente: TIntegerField;
    tExtComissaoInsFuncao: TStringField;
    tExtComissaoInsVlrBase: TFloatField;
    tExtComissaoInsPercDescDupl: TFloatField;
    tExtComissaoInsPercComissao: TFloatField;
    tExtComissaoInsVlrComissao: TFloatField;
    tExtComissaoInsTipo: TStringField;
    tExtComissaoInsSuspensa: TBooleanField;
    tPedidoNotaNroLancExtComissao: TIntegerField;
    tExtComissaoModIns: TTable;
    tExtComissaoModInsNroLancamento: TIntegerField;
    tExtComissaoModInsCodModelista: TIntegerField;
    tExtComissaoModInsDtReferencia: TDateField;
    tExtComissaoModInsCodProduto: TIntegerField;
    tExtComissaoModInsFuncao: TStringField;
    tExtComissaoModInsVlrBase: TFloatField;
    tExtComissaoModInsPercComissao: TFloatField;
    tExtComissaoModInsVlrComissao: TFloatField;
    tExtComissaoModInsTipo: TStringField;
    tPedidoNotaNroLancExtComissaoMod: TIntegerField;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    RadioGroup2: TRadioGroup;
    Panel1: TPanel;
    StaticText4: TStaticText;
    CurrencyEdit4: TCurrencyEdit;
    tPedidoItemlkReferencia: TStringField;
    tClienteCep: TStringField;
    tClienteCepEntrega: TStringField;
    tClienteCepPgto: TStringField;
    tClienteCaixaPostal: TStringField;
    tClienteRg: TStringField;
    tExtComissaoModInsNumNota: TIntegerField;
    tExtComissaoModInsCodCliente: TIntegerField;
    tPedidoNotaNumSeqNota: TIntegerField;
    tPedidoNotaNumNota: TIntegerField;
    tExtComissaoModInsParcela: TIntegerField;
    tExtComissaoModInsItemHistCReceber: TIntegerField;
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure tPedidoAfterPost(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure tPedidoItemAfterPost(DataSet: TDataSet);
    procedure tPedidoNotaAfterPost(DataSet: TDataSet);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure CurrencyEdit1Change(Sender: TObject);
    procedure CurrencyEdit2Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure CurrencyEdit4Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Desfaz_Comissoes;
  public
    { Public declarations }
  end;

var
  fBaixaPedido: TfBaixaPedido;
  vCodComModeliata : Integer;

implementation

uses UDM1, UAgendaTelef;

{$R *.DFM}

procedure TfBaixaPedido.Desfaz_Comissoes;
begin
  if tPedidoNotaNroLancExtComissao.AsInteger > 0 then
    begin
      DM1.tExtComissao.Refresh;
      DM1.tExtComissao.IndexFieldNames := 'NroLancamento';
      DM1.tExtComissao.SetKey;
      DM1.tExtComissaoNroLancamento.AsInteger := tPedidoNotaNroLancExtComissao.AsInteger;
      if DM1.tExtComissao.GotoKey then
        DM1.tExtComissao.Delete;
    end;
  if tPedidoNotaNroLancExtComissaoMod.AsInteger > 0 then
    begin
      DM1.tExtComissaoMod.Refresh;
      DM1.tExtComissaoMod.IndexFieldNames := 'NroLancamento';
      DM1.tExtComissaoMod.SetKey;
      DM1.tExtComissaoModNroLancamento.AsInteger := tPedidoNotaNroLancExtComissaoMod.AsInteger;
      if DM1.tExtComissaoMod.GotoKey then
        DM1.tExtComissaoMod.Delete;
    end;
end;

procedure TfBaixaPedido.Edit1Change(Sender: TObject);
begin
  try
    tPedido.IndexFieldNames := 'Pedido';
    tPedido.FindNearest([Edit1.Text]);
  except
    ShowMessage('Digite apenas números aqui!');
  end;
end;

procedure TfBaixaPedido.Edit2Change(Sender: TObject);
begin
  try
    tPedido.IndexFieldNames := 'PedidoCliente';
    tPedido.FindNearest([Edit2.Text]);
  except
    ShowMessage('Digite apenas números aqui!');
  end;
end;

procedure TfBaixaPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tPedido.Close;
  DM1.tPedidoItem.Close;
  DM1.tPedidoGrade.Close;
  DM1.tCliente.Close;
  DM1.tCor.Close;
  DM1.tProduto.Close;
  Action := Cafree;
end;

procedure TfBaixaPedido.BitBtn1Click(Sender: TObject);
var
  vReg     : Integer;
begin
  if RadioGroup2.ItemIndex = 0 then
    CurrencyEdit4.AsInteger := 0;
  if (RadioGroup2.ItemIndex = 1) and (CurrencyEdit4.Value < 1) then
    ShowMessage('Esta faltando o número da nota')
  else
  if MessageDlg('Deseja realmente baixar o pedido ' + CurrencyEdit1.Text + '?',mtConfirmation,
     [mbOK,mbNo],0) = mrOK then
    begin
      case RadioGroup1.ItemIndex of
        0 : Begin
              if CurrencyEdit1.Text <> '' then
                begin
                  tPedido.SetKey;
                  tPedidoPedido.AsInteger := StrToInt(CurrencyEdit1.Text);
                  if (tPedido.GotoKey) and (tPedidoQtdParesRest.AsInteger > 0)  then
                    begin
                      vReg := tPedido.RecNo;
                      tPedido.Edit;
                      tPedidoCopiado.AsBoolean      := True;
                      tPedidoQtdParesRest.AsInteger := 0;
                      tPedidoItem.First;
                      while not tPedidoItem.Eof do
                        begin
                          if tPedidoItemQtdParesRest.AsInteger > 0 then
                            begin
                              tPedidoQtdParesFat.AsFloat      := tPedidoQtdParesFat.AsFloat + tPedidoItemQtdParesRest.AsFloat;
                              tPedidoQtdFatMan.AsFloat        := tPedidoQtdFatMan.AsFloat + tPedidoItemQtdParesRest.AsFloat;
                              tPedidoItem.Edit;
                              tPedidoItemQtdParesFat.AsFloat  := tPedidoItemQtdParesFat.AsFloat + tPedidoItemQtdParesRest.AsFloat;
                              tPedidoItemQtdFatMan.AsFloat    := tPedidoItemQtdFatMan.AsFloat + tPedidoItemQtdParesRest.AsFloat;
                              tPedidoItemQtdParesRest.AsFloat := 0;
                              tPedidoItemCopiado.AsBoolean    := True;
                              tPedidoItem.Post;

                              if tPedidoNota.Locate('NumNota;ItemNota',VarArrayOf([CurrencyEdit4.AsInteger,0]),[locaseinsensitive]) then
                                tPedidoNota.Edit
                              else
                                begin
                                  tPedidoNota.Insert;
                                  tPedidoNotaPedido.AsInteger     := tPedidoItemPedido.AsInteger;
                                  tPedidoNotaItem.AsInteger       := tPedidoItemItem.AsInteger;
                                  tPedidoNotaNumSeqNota.AsInteger := 0;
                                  tPedidoNotaNumNota.AsInteger    := CurrencyEdit4.AsInteger;
                                  tPedidoNotaItemNota.AsInteger   := 0;
                                end;
                              tPedidoNotaDtNota.AsDateTime := DateEdit1.Date;
                              tPedidoNotaQtdPares.AsFloat  := tPedidoItemQtdFatMan.AsFloat;
                              tPedidoNota.Post;
                            end;
                          tPedidoItem.Next;
                        end;
                      tPedido.Post;
                      tPedido.Refresh;
                      tPedido.RecNo := vReg;
                    end
                  else
                    ShowMessage('Pedido não encontrado ou já faturado!');
                end
              else
                ShowMessage('Não foi informado o nº do pedido!');
              CurrencyEdit1.SetFocus;
            end;
        1 : Begin
              if CurrencyEdit3.Value > 0 then
                begin
                  if (CurrencyEdit1.Text <> '') and (CurrencyEdit2.Text <> '') then
                    begin
                      tPedidoItem.SetKey;
                      tPedidoItemPedido.AsInteger := StrToInt(CurrencyEdit1.Text);
                      tPedidoItemItem.AsInteger   := StrToInt(CurrencyEdit2.Text);
                      if tPedidoItem.GotoKey then
                        begin
                          vReg := tPedidoItem.RecNo;
                          if tPedidoItemQtdParesRest.AsFloat >= CurrencyEdit3.Value then
                             begin
                               tPedidoItem.Edit;
                               tPedidoItemQtdParesFat.AsFloat  := tPedidoItemQtdParesFat.AsFloat + CurrencyEdit3.Value;
                               tPedidoItemQtdFatMan.AsFloat    := tPedidoItemQtdFatMan.AsFloat + CurrencyEdit3.Value;
                               tPedidoItemQtdParesRest.AsFloat := tPedidoItemQtdParesRest.AsFloat - CurrencyEdit3.Value;
                               if tPedidoItemQtdParesRest.AsFloat = 0 then
                                 tPedidoItemCopiado.AsBoolean    := True
                               else
                                 tPedidoItemCopiado.AsBoolean    := False;
                               tPedidoItem.Post;

                               tPedido.Edit;
                               tPedidoQtdParesFat.AsFloat  := tPedidoQtdParesFat.AsFloat + CurrencyEdit3.Value;
                               tPedidoQtdParesRest.AsFloat := tPedidoQtdParesRest.AsFloat - CurrencyEdit3.Value;
                               tPedidoQtdFatMan.AsFloat    := tPedidoQtdFatMan.AsFloat + CurrencyEdit3.Value;
                               if tPedidoQtdParesRest.AsFloat > 0 then
                                 tPedidoCopiado.AsBoolean := False
                               else
                                 tPedidoCopiado.AsBoolean := True;
                               tPedido.Post;

                              if tPedidoNota.Locate('NumNota;ItemNota',VarArrayOf([CurrencyEdit4.AsInteger,0]),[locaseinsensitive]) then
                                begin
                                  tPedidoNota.Edit;
                                  if RadioGroup2.ItemIndex = 0 then
                                    Desfaz_Comissoes;
                                end
                               else
                                 begin
                                   tPedidoNota.Insert;
                                   tPedidoNotaPedido.AsInteger     := CurrencyEdit1.AsInteger;
                                   tPedidoNotaItem.AsInteger       := CurrencyEdit2.AsInteger;
                                   tPedidoNotaNumSeqNota.AsInteger := 0;
                                   tPedidoNotaNumNota.AsInteger    := CurrencyEdit4.AsInteger;
                                   tPedidoNotaItemNota.AsInteger   := 0;
                                 end;
                               tPedidoNotaDtNota.AsDateTime := DateEdit1.Date;
                               tPedidoNotaQtdPares.AsFloat  := tPedidoItemQtdFatMan.AsFloat;
                               tPedidoNota.Post;
                             end
                           else
                             ShowMessage('Quantidade de pares restantes é inferior a quantidade ' + #13 +
                                         'de pares informada para baixa!');
                          tPedidoItem.RecNo := vReg;
                        end;
                    end
                  else
                    ShowMessage('É obrigatório informar o pedido e o item!');
                end
              else
                ShowMessage('É obrigatório informar a qtd. de pares!');
              CurrencyEdit1.SetFocus;
            end;
      end;
      CurrencyEdit1.Clear;
      CurrencyEdit2.Clear;
      CurrencyEdit3.Clear;
      CurrencyEdit4.Clear;
      CurrencyEdit1.SetFocus;
    end;
  tPedido.Refresh;
  tPedidoItem.Refresh;
  tPedidoNota.Refresh;
end;

procedure TfBaixaPedido.tPedidoAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tPedido.Handle);
end;

procedure TfBaixaPedido.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfBaixaPedido.Edit2Enter(Sender: TObject);
begin
  Edit1.Text := '';
end;

procedure TfBaixaPedido.Edit1Enter(Sender: TObject);
begin
  Edit2.Text := '';
end;

procedure TfBaixaPedido.tPedidoItemAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tPedidoItem.Handle);
end;

procedure TfBaixaPedido.tPedidoNotaAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tPedidoNota.Handle);
end;

procedure TfBaixaPedido.RadioGroup1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0 : begin
          CurrencyEdit2.Enabled := False;
          CurrencyEdit3.Enabled := False;
          CurrencyEdit3.CleanupInstance;
          CurrencyEdit1.SetFocus;
        end;
    1 : begin
          CurrencyEdit2.Enabled := True;
          CurrencyEdit3.Enabled := True;
          CurrencyEdit1.SetFocus;
        end;
  end;
end;

procedure TfBaixaPedido.BitBtn3Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente cancelar a baixa do pedido ' + CurrencyEdit1.Text + '?',mtConfirmation,
     [mbOK,mbNo],0) = mrOK then
    begin
      case RadioGroup1.ItemIndex of
        0 : Begin
              if CurrencyEdit1.Text <> '' then
                begin
                  tPedido.SetKey;
                  tPedidoPedido.AsInteger := StrToInt(CurrencyEdit1.Text);
                  if tPedido.GotoKey then
                    begin
                      if tPedidoQtdFatMan.AsFloat > 0 then
                        begin
                          tPedido.Edit;
                          tPedidoCopiado.AsBoolean      := False;
                          tPedidoQtdParesRest.AsInteger := tPedidoQtdParesRest.AsInteger + tPedidoQtdFatMan.AsInteger;
                          tPedidoQtdParesFat.AsInteger  := tPedidoQtdParesFat.AsInteger - tPedidoQtdFatMan.AsInteger;
                          tPedidoQtdFatMan.AsInteger    := 0;
                          tPedido.Post;
                          tPedidoItem.First;
                          while not tPedidoItem.Eof do
                            begin
                              if tPedidoItemQtdFatMan.AsFloat > 0 then
                                begin
                                  tPedidoItem.Edit;
                                  tPedidoItemQtdParesFat.AsFloat  := tPedidoItemQtdParesFat.AsFloat - tPedidoItemQtdFatMan.AsFloat;
                                  tPedidoItemQtdParesRest.AsFloat := tPedidoItemQtdParesRest.AsFloat + tPedidoItemQtdFatMan.AsFloat;
                                  tPedidoItemQtdFatMan.AsFloat    := 0;
                                  tPedidoItemCopiado.AsBoolean    := False;
                                  tPedidoItem.Post;

                                  tPedidoNota.Refresh;
                                  tPedidoNota.First;
                                  while not tPedidoNota.Eof do
                                    tPedidoNota.Delete;
                                end;
                              tPedidoItem.Next;
                            end;
                        end;
                    end;
                end
              else
                ShowMessage('Não foi informado o nº do pedido!');
              CurrencyEdit1.SetFocus;
            end;
        1 : Begin
              if CurrencyEdit3.Value > 0 then
                begin
                  if (CurrencyEdit1.Text <> '') and (CurrencyEdit2.Text <> '') and (CurrencyEdit3.Value < 0) then
                    begin
                      tPedidoItem.SetKey;
                      tPedidoItemPedido.AsInteger := StrToInt(CurrencyEdit1.Text);
                      tPedidoItemItem.AsInteger   := StrToInt(CurrencyEdit2.Text);
                      if tPedidoItem.GotoKey then
                        begin
                          if tPedidoItemQtdFatMan.AsFloat >= CurrencyEdit3.Value then
                             begin
                               tPedidoItem.Edit;
                               tPedidoItemQtdParesFat.AsFloat  := tPedidoItemQtdParesFat.AsFloat - CurrencyEdit3.Value;
                               tPedidoItemQtdFatMan.AsFloat    := tPedidoItemQtdFatMan.AsFloat - CurrencyEdit3.Value;
                               tPedidoItemQtdParesRest.AsFloat := tPedidoItemQtdParesRest.AsFloat + CurrencyEdit3.Value;
                               tPedidoItemCopiado.AsBoolean    := False;
                               tPedidoItem.Post;

                               tPedido.Edit;
                               tPedidoCopiado.AsBoolean    := False;
                               tPedidoQtdParesFat.AsFloat  := tPedidoQtdParesFat.AsFloat - CurrencyEdit3.Value;
                               tPedidoQtdFatMan.AsFloat    := tPedidoQtdFatMan.AsFloat - CurrencyEdit3.Value;
                               tPedidoQtdParesRest.AsFloat := tPedidoQtdParesRest.AsFloat + CurrencyEdit3.Value;
                               tPedido.Post;

                               tPedidoNota.Refresh;
                               tPedidoNota.First;
                               while not tPedidoNota.Eof do
                                 begin
                                   Desfaz_Comissoes;
                                   tPedidoNota.Delete;
                                 end;
                             end
                           else
                             ShowMessage('Quantidade de pares faturados manualmente é inferior a quantidade ' + #13 +
                                         'de pares informada para o cancelamento da baixa!');
                        end;
                    end
                  else
                    ShowMessage('É obrigatório informar o pedido e o item!');
                end
              else
                ShowMessage('É obrigatório informar a qtde. de pares!');
              CurrencyEdit1.SetFocus;
            end;
      end;
      CurrencyEdit1.Clear;
      CurrencyEdit2.Clear;
      CurrencyEdit3.Clear;
      CurrencyEdit1.SetFocus;
    end;
  tPedido.Refresh;
  tPedidoItem.Refresh;
  tPedidoNota.Refresh;
end;

procedure TfBaixaPedido.RxDBGrid1DblClick(Sender: TObject);
begin
  CurrencyEdit1.Text := tPedidoPedido.AsString;
end;

procedure TfBaixaPedido.RxDBGrid2DblClick(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 1 then
    begin
      if CurrencyEdit1.Text = '' then
        CurrencyEdit1.Text := tPedidoPedido.AsString;
      CurrencyEdit2.Text := tPedidoItemItem.AsString;
      CurrencyEdit3.Text := tPedidoItemQtdParesRest.AsString;
    end;   
end;

procedure TfBaixaPedido.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if tPedidoQtdPares.AsInteger = tPedidoQtdParesFat.AsInteger then
    Background := $006FDD00;
end;

procedure TfBaixaPedido.CurrencyEdit1Change(Sender: TObject);
begin
  if CurrencyEdit1.Text <> '' then
    begin
      tPedido.SetKey;
      tPedidoPedido.AsInteger := StrToInt(CurrencyEdit1.Text);
      tPedido.GotoKey;
    end;  
end;

procedure TfBaixaPedido.CurrencyEdit2Exit(Sender: TObject);
begin
  if (CurrencyEdit1.Text <> '') and (CurrencyEdit2.Text <> '') then
    begin
      tPedido.SetKey;
      tPedidoPedido.AsInteger := StrToInt(CurrencyEdit1.Text);
      if tPedido.GotoKey then
        begin
          tPedidoItem.SetKey;
          tPedidoItemPedido.AsInteger := StrToInt(CurrencyEdit1.Text);
          tPedidoItemItem.AsInteger   := StrToInt(CurrencyEdit2.Text);
          if tPedidoItem.GotoKey then
            CurrencyEdit3.Text := tPedidoItemQtdParesRest.AsString;
         end;
    end
  else
    begin
      ShowMessage('É Obrigatório informar o pedido e o item!');
      CurrencyEdit1.Clear;
      CurrencyEdit1.SetFocus;
    end;
end;

procedure TfBaixaPedido.FormShow(Sender: TObject);
begin
  DM1.tPedido.Open;
  DM1.tPedidoItem.Open;
  DM1.tPedidoGrade.Open;
  DM1.tCliente.Open;
  DM1.tCor.Open;
  DM1.tProduto.Open;
  DateEdit1.Date := Date;
  CurrencyEdit1.SetFocus;
  CurrencyEdit4.Clear;
  Panel1.Enabled := False
end;

procedure TfBaixaPedido.RadioGroup2Click(Sender: TObject);
begin
  if RadioGroup2.ItemIndex = 0 then
    Panel1.Enabled := False
  else
    Panel1.Enabled := True;
end;

procedure TfBaixaPedido.CurrencyEdit4Exit(Sender: TObject);
begin
  if CurrencyEdit4.AsInteger > 0 then
    begin
      DM1.tNotaFiscal.IndexFieldNames  := 'NumNota';
      DM1.tNotaFiscal.SetKey;
      DM1.tNotaFiscalNumNota.AsInteger := CurrencyEdit4.AsInteger;
      if not DM1.tNotaFiscal.GotoKey then
        begin
          ShowMessage('Nota não está cadastrada!');
          CurrencyEdit4.Clear;
          CurrencyEdit4.SetFocus;
        end;
    end;
end;

procedure TfBaixaPedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.

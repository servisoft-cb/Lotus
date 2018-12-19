unit UConsHistCli;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, RxLookup, Buttons, Grids, DBGrids, RXDBCtrl, ALed,
  Db, DBTables, ComCtrls, CurrEdit, Mask, ToolEdit, DBFilter, DBCtrls,
  RXCtrls, DBVGrids;

type
  TfConsHistCli = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    RxDBGrid2: TRxDBGrid;
    StaticText2: TStaticText;
    qQtd: TQuery;
    qQtdCodCliente: TIntegerField;
    qQtdQtdPares: TFloatField;
    qQtdQtdParesFat: TFloatField;
    qQtdQtdParesRest: TFloatField;
    qQtdQtdParesCanc: TFloatField;
    Label16: TLabel;
    DateEdit1: TDateEdit;
    Label17: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    Label18: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label19: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    Label20: TLabel;
    Label21: TLabel;
    CurrencyEdit4: TCurrencyEdit;
    Label22: TLabel;
    CurrencyEdit5: TCurrencyEdit;
    CurrencyEdit6: TCurrencyEdit;
    Label23: TLabel;
    CurrencyEdit7: TCurrencyEdit;
    ALed2: TALed;
    Label3: TLabel;
    ALed3: TALed;
    Label10: TLabel;
    BitBtn4: TBitBtn;
    Bevel1: TBevel;
    TabSheet4: TTabSheet;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    ALed4: TALed;
    ALed5: TALed;
    Label12: TLabel;
    Label13: TLabel;
    ALed6: TALed;
    Label14: TLabel;
    ALed7: TALed;
    RxDBGrid3: TRxDBGrid;
    RxDBFilter1: TRxDBFilter;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label15: TLabel;
    ALed8: TALed;
    Label7: TLabel;
    ALed9: TALed;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    RxDBGrid4: TRxDBGrid;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    RxLabel2: TRxLabel;
    CurrencyEdit8: TCurrencyEdit;
    VDBGrid1: TVDBGrid;
    RxDBGrid1: TRxDBGrid;
    StaticText1: TStaticText;
    Label2: TLabel;
    ALed1: TALed;
    RxDBGrid5: TRxDBGrid;
    Label24: TLabel;
    DateEdit2: TDateEdit;
    Label25: TLabel;
    CurrencyEdit9: TCurrencyEdit;
    Label27: TLabel;
    CurrencyEdit11: TCurrencyEdit;
    Label28: TLabel;
    CurrencyEdit12: TCurrencyEdit;
    Label26: TLabel;
    CurrencyEdit10: TCurrencyEdit;
    Label29: TLabel;
    CurrencyEdit13: TCurrencyEdit;
    Label30: TLabel;
    CurrencyEdit14: TCurrencyEdit;
    Label31: TLabel;
    CurrencyEdit15: TCurrencyEdit;
    CurrencyEdit16: TCurrencyEdit;
    Bevel2: TBevel;
    Label32: TLabel;
    CurrencyEdit17: TCurrencyEdit;
    Label33: TLabel;
    CurrencyEdit18: TCurrencyEdit;
    Label34: TLabel;
    CurrencyEdit19: TCurrencyEdit;
    Bevel3: TBevel;
    Label35: TLabel;
    CurrencyEdit20: TCurrencyEdit;
    Label36: TLabel;
    CurrencyEdit21: TCurrencyEdit;
    Label37: TLabel;
    CurrencyEdit22: TCurrencyEdit;
    Label38: TLabel;
    Label39: TLabel;
    DateEdit3: TDateEdit;
    CurrencyEdit23: TCurrencyEdit;
    Label40: TLabel;
    CurrencyEdit24: TCurrencyEdit;
    tCReceberParc: TTable;
    dsCReceberParc: TDataSource;
    tCReceberParcNumCReceber: TIntegerField;
    tCReceberParcParcCReceber: TIntegerField;
    tCReceberParcVlrParcCReceber: TFloatField;
    tCReceberParcDtVencCReceber: TDateField;
    tCReceberParcQuitParcCReceber: TBooleanField;
    tCReceberParcJurosParcCReceber: TFloatField;
    tCReceberParcDtPagParcCReceber: TDateField;
    tCReceberParcCodCli: TIntegerField;
    tCReceberParcNumNota: TIntegerField;
    tCReceberParcDesconto: TFloatField;
    tCReceberParcPgtoParcial: TFloatField;
    tCReceberParcRestParcela: TFloatField;
    tCReceberParcContaDupl: TSmallintField;
    tCReceberParcSelecionado: TBooleanField;
    tCReceberParcCodVendedor: TIntegerField;
    tCReceberParcBaixada: TBooleanField;
    tCReceberParcPercComissao: TFloatField;
    tCReceberParcVlrComissao: TFloatField;
    tCReceberParcPlanoContas: TIntegerField;
    tCReceberParcAgencia: TStringField;
    tCReceberParcTitPortador: TStringField;
    tCReceberParcCodTipoCobranca: TIntegerField;
    tCReceberParcDespesas: TFloatField;
    tCReceberParcAbatimentos: TFloatField;
    tCReceberParcCodConta: TIntegerField;
    tCReceberParcPgCartorio: TBooleanField;
    tCReceberParcDiasAtraso: TFloatField;
    tCReceberParcLetraCambio: TBooleanField;
    tCReceberParcNroLancExtComissao: TIntegerField;
    tCReceberParcJurosPagos: TFloatField;
    tCReceberParcCancelado: TBooleanField;
    tCReceberParcTitProtestado: TBooleanField;
    tCReceberParcDtGerado: TDateField;
    tCReceberParcTipoDoc: TStringField;
    tCReceberParcVlrDevolucao: TFloatField;
    qMaiorFatura: TQuery;
    qMaiorFaturaNumNota: TIntegerField;
    qMaiorFaturaDtGerado: TDateField;
    qMaiorFaturaVlrTotal: TFloatField;
    tCReceberParcclDiasAtraso: TIntegerField;
    ComboBox1: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid3GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure ALed2Click(Sender: TObject);
    procedure ALed3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure tCReceberParcCalcFields(DataSet: TDataSet);
    procedure CurrencyEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Exit(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Gera_Dados;
  public
    { Public declarations }
  end;

var
  fConsHistCli: TfConsHistCli;

implementation

uses UDM1, UEmissaoNotaFiscal, UPedido, UAgendaTelef;

{$R *.DFM}

procedure TfConsHistCli.Gera_Dados;
var
  vAux : Real;
  vQtdAtraso, vDiasAtraso : Integer;
  vVlrTotal, vVlrAbatimento, vVlrRestante, vVlrRestAtraso, vVlrDevolucao, vVlrCancelado, vVlrPago, vVlrPagoAtraso : Real;
begin
  Screen.Cursor            := crHourGlass;
  DM1.tNotaFiscal.Filtered := False;
  DM1.tNotaFiscal.Filter   := 'CodCli = '''+IntToStr(RxDBLookupCombo1.KeyValue)+'''';
  DM1.tNotaFiscal.Filtered := True;
              
  //*** Contas
  RxDBGrid3.DataSource := Nil;
  tCReceberParc.IndexFieldNames := 'DtVencCReceber';
  tCReceberParc.Filtered        := False;
  tCReceberParc.Filter          := 'CodCli = '''+IntToStr(RxDBLookupCombo1.KeyValue)+'''';
  tCReceberParc.Filtered        := True;
  vQtdAtraso  := 0;
  vDiasAtraso := 0;
  vVlrTotal      := 0;
  vVlrAbatimento := 0;
  vVlrRestante   := 0;
  vVlrRestAtraso  := 0;
  vVlrDevolucao   := 0;
  vVlrCancelado   := 0;
  vVlrPago        := 0;
  vVlrPagoAtraso  := 0;
  tCReceberParc.First;
  while not tCReceberParc.Eof do
    begin
      vVlrTotal := vVlrTotal + tCReceberParcVlrParcCReceber.AsFloat;
      vVlrAbatimento := vVlrAbatimento + tCReceberParcAbatimentos.AsFloat;
      vVlrRestante := vVlrRestante + tCReceberParcRestParcela.AsFloat;
      if tCReceberParcclDiasAtraso.AsInteger > 0 then
        vVlrRestAtraso := vVlrRestAtraso + tCReceberParcRestParcela.AsFloat;
      vVlrDevolucao := vVlrDevolucao + tCReceberParcVlrDevolucao.AsFloat;
      if tCReceberParcCancelado.AsBoolean then
        vVlrCancelado := vVlrCancelado + tCReceberParcVlrParcCReceber.AsFloat;
      vVlrPago := vVlrPago + tCReceberParcPgtoParcial.AsFloat;
      if tCReceberParcQuitParcCReceber.AsBoolean then
        begin
          if tCReceberParcDiasAtraso.AsInteger > 0 then
            begin
              vVlrPagoAtraso := vVlrPagoAtraso + tCReceberParcPgtoParcial.AsFloat;
              inc(vQtdAtraso);
              vDiasAtraso := vDiasAtraso + tCReceberParcDiasAtraso.AsInteger;
              if tCReceberParcDiasAtraso.AsInteger > CurrencyEdit9.AsInteger then
                begin            
                  DateEdit2.Date := tCReceberParcDtVencCReceber.AsDateTime;
                  CurrencyEdit9.AsInteger := tCReceberParcDiasAtraso.AsInteger;
                  CurrencyEdit12.Value := tCReceberParcVlrParcCReceber.AsFloat;
                  CurrencyEdit15.AsInteger := tCReceberParcNumNota.AsInteger;
                  CurrencyEdit16.AsInteger := tCReceberParcParcCReceber.AsInteger;
                end;
            end;
        end;
      tCReceberParc.Next;
    end;
  RxDBGrid3.DataSource := dsCReceberParc;
  vAux := 0;
  if (vDiasAtraso > 0) and (vQtdAtraso > 0) then
    vAux := vDiasAtraso / vQtdAtraso;
  if vAux < 1 then
    vAux := 0;
  CurrencyEdit17.Value     := vAux;
  CurrencyEdit11.AsInteger := vQtdAtraso;
  CurrencyEdit14.Value := vVlrTotal;
  CurrencyEdit21.Value := vVlrAbatimento;
  CurrencyEdit10.Value := vVlrRestante;
  CurrencyEdit13.Value := vVlrRestAtraso;
  CurrencyEdit20.Value := vVlrDevolucao;
  CurrencyEdit24.Value := vVlrCancelado;
  CurrencyEdit18.Value := vVlrPago;
  CurrencyEdit19.Value := vVlrPagoAtraso;

  //*** Pedidos

  DM1.tPedido.IndexFieldNames := 'DtEmissao';
  DM1.tPedido.Filtered     := False;
  DM1.tPedido.Filter       := 'CodCliente = '''+IntToStr(RxDBLookupCombo1.KeyValue)+'''';
  DM1.tPedido.Filtered     := True;
  DM1.tPedido.Last;
  DateEdit1.Date           := DM1.tPedidoDtEmissao.AsDateTime;
  CurrencyEdit1.Value      := DM1.tPedidoVlrTotal.AsFloat;
  CurrencyEdit2.AsInteger  := DM1.tPedidoQtdPares.AsInteger;
  CurrencyEdit3.AsInteger  := DM1.tPedido.RecordCount;
  DM1.tPedido.IndexFieldNames := 'PedidoCliente';

  qQtd.Close;
  qQtd.Params[0].AsInteger := RxDBLookupCombo1.KeyValue;
  qQtd.Open;
  CurrencyEdit4.AsInteger := qQtdQtdPares.AsInteger;
  CurrencyEdit5.AsInteger := qQtdQtdParesFat.AsInteger;
  CurrencyEdit6.AsInteger := qQtdQtdParesRest.AsInteger;
  CurrencyEdit7.AsInteger := qQtdQtdParesCanc.AsInteger;
  RxDBGrid2.DataSource    := DM1.dsPedido;

  //*** Maior Fatura
  qMaiorFatura.Close;
  qMaiorFatura.Params[0].AsInteger := RxDBLookupCombo1.KeyValue;
  qMaiorFatura.Open;
  qMaiorFatura.Last;
  CurrencyEdit22.Value     := qMaiorFaturaVlrTotal.AsFloat;
  DateEdit3.Date           := qMaiorFaturaDtGerado.AsDateTime;
  CurrencyEdit23.AsInteger := qMaiorFaturaNumNota.AsInteger;

  Screen.Cursor           := crDefault;
end;

procedure TfConsHistCli.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qQtd.Close;
  qMaiorFatura.Close;
  tCReceberParc.Filtered   := False;
  DM1.tNotaFiscal.Filtered := False;
  DM1.tPedido.Filtered     := False;
  Dm1.tCliente.Filtered    := False;

  if Screen.FormCount < 3 then
    begin
      DM1.tCliente.Close;
      DM1.tProduto.Close;
      DM1.tCor.Close;
      DM1.tVendedor.Close;
      DM1.tSitTributaria.Close;
      DM1.tNatOperacao.Close;
      DM1.tNotaFiscal.Close;
      DM1.tNotaFiscalItens.Close;
      DM1.tConstrucao.Close;
      DM1.tPedido.Close;
      DM1.tPedidoItem.Close;
      DM1.tPedidoGrade.Close;
    end;
    
  Action                   := Cafree;
end;

procedure TfConsHistCli.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsHistCli.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if DM1.tNotaFiscalCancelada.AsBoolean then
    begin
      AFont.Color := clWhite;
      Background  := clRed;
    end
  else
    begin
      AFont.Color := clBlack;
      Background  := clWhite;
    end;
end;

procedure TfConsHistCli.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if DM1.tPedidoQtdParesRest.AsFloat > 0 then
    begin
      Background  := clWhite;
      AFont.Color := clBlack;
    end
  else
    begin
      Background  := clTeal;
      AFont.Color := clBlack;
    end;
end;

procedure TfConsHistCli.RxDBGrid3GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if tCReceberParcCancelado.AsBoolean then
    begin
      AFont.Color := clBlack;
      Background  := $00C080FF;
    end
  else
  if tCReceberParcQuitParcCReceber.AsBoolean then
    begin
      AFont.Color := clWhite;
      Background  := clTeal;
    end
  else
  if tCReceberParcclDiasAtraso.AsInteger > 0 then
    begin
      AFont.Color := clWhite;
      Background  := clRed;
    end
  else
    begin
      AFont.Color := clBlack;
      Background  := clWhite;
    end;
end;

procedure TfConsHistCli.RxDBGrid1DblClick(Sender: TObject);
var
  vNumero : Integer;
begin
  if DM1.tUsuarioNotaFiscal.AsBoolean then
    begin
      vNumero                         := DM1.tNotaFiscalNumNota.AsInteger;
      DM1.tNotaFiscal.Filtered        := False;
      DM1.tNotaFiscal.IndexFieldNames := 'NumNota';
      DM1.tNotaFiscal.FindKey([vNumero]);
      fEmissaoNotaFiscal              := TfEmissaoNotaFiscal.Create(Self);
      fEmissaoNotaFiscal.ShowModal;
      if RxDBLookupCombo1.Text <> '' then
        Gera_Dados;
    end
  else
    ShowMessage('Usuário "'+DM1.tUsuarioUsuario.AsString+'" não autorizado a abrir o formulário de Notas Fiscais!');
end;

procedure TfConsHistCli.RxDBGrid2DblClick(Sender: TObject);
var
  vNumero : Integer;
begin
  if DM1.tUsuarioPedido.AsBoolean then
    begin
      vNumero                     := DM1.tPedidoPedido.AsInteger;
      DM1.tPedido.Filtered        := False;
      DM1.tPedido.IndexFieldNames := 'Pedido';
      DM1.tPedido.FindKey([vNumero]);
      fPedido              := TfPedido.Create(Self);
      fPedido.ShowModal;
    end
  else
    ShowMessage('Usuário "'+DM1.tUsuarioUsuario.AsString+'" não autorizado a abrir o formulário de Pedidos!');
end;

procedure TfConsHistCli.BitBtn1Click(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
    Gera_Dados
  else
    begin
      ShowMessage('Você deve selecionar um cliente p/ gerar a consulta!');
      RxDBLookupCombo1.SetFocus;
    end;
end;

procedure TfConsHistCli.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

procedure TfConsHistCli.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Codigo';
end;

procedure TfConsHistCli.ALed2Click(Sender: TObject);
begin
  RxDBFilter1.Active := False;
  RxDBFilter1.Filter.Clear;
  RxDBFilter1.Filter.Add('QtdParesRest > 0');
  RxDBFilter1.Active := True;
end;

procedure TfConsHistCli.ALed3Click(Sender: TObject);
begin
  RxDBFilter1.Active := False;
  RxDBFilter1.Filter.Clear;
  RxDBFilter1.Filter.Add('QtdParesFat > 0');
  RxDBFilter1.Active := True;
end;

procedure TfConsHistCli.BitBtn4Click(Sender: TObject);
begin
  RxDBFilter1.Active := False;
end;

procedure TfConsHistCli.tCReceberParcCalcFields(DataSet: TDataSet);
begin
  if not tCReceberParcQuitParcCReceber.AsBoolean then
    begin
      tCReceberParcclDiasAtraso.AsFloat := Date - tCReceberParcDtVencCReceber.AsDateTime;
      if tCReceberParcclDiasAtraso.AsFloat <= 0 then
        tCReceberParcclDiasAtraso.AsFloat := 0;
    end
  else
    begin
      tCReceberParcclDiasAtraso.AsFloat := tCReceberParcDtPagParcCReceber.AsDateTime - tCReceberParcDtVencCReceber.AsDateTime;
      if tCReceberParcclDiasAtraso.AsFloat <= 0 then
        tCReceberParcclDiasAtraso.AsFloat := 0;
    end;
end;

procedure TfConsHistCli.CurrencyEdit8KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) and (CurrencyEdit8.AsInteger > 0) then
    begin
      PageControl1.ActivePageIndex := 0;
      DM1.tPedido.Locate('PedidoCliente',CurrencyEdit8.AsInteger,[loCaseInsensitive]);
    end;
end;

procedure TfConsHistCli.ComboBox1Exit(Sender: TObject);
begin
  if ComboBox1.Text <> '' then
    begin
      Dm1.tCliente.Filtered := False;
      case ComboBox1.ItemIndex of
        0 : Dm1.tCliente.Filter := 'Mercado = ''I''';
        1 : Dm1.tCliente.Filter := 'Mercado = ''O''';
      end;
      Dm1.tCliente.Filtered := True;
    end
  else
    begin
      ShowMessage('Deve ser escolido o tipo de mercado!');
      ComboBox1.SetFocus;
    end;
end;

procedure TfConsHistCli.ComboBox1Enter(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
end;

procedure TfConsHistCli.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

procedure TfConsHistCli.FormShow(Sender: TObject);
begin
  DM1.tCliente.Open;
  DM1.tProduto.Open;
  DM1.tCor.Open;
  DM1.tVendedor.Open;
  DM1.tSitTributaria.Open;
  DM1.tNatOperacao.Open;
  DM1.tNotaFiscal.Open;
  DM1.tNotaFiscalItens.Open;
  DM1.tConstrucao.Open;
  DM1.tPedido.Open;
  DM1.tPedidoItem.Open;
  DM1.tPedidoGrade.Open;
end;

end.

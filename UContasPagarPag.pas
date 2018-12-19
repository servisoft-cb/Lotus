unit UContasPagarPag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, ComCtrls, Mask, ToolEdit, RXDBCtrl,
  RXLookup, Db, DBTables, CurrEdit, DBFilter;

type
  TfContasPagarPag = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    DBText2: TDBText;
    Label2: TLabel;
    DBText3: TDBText;
    Label3: TLabel;
    Label4: TLabel;
    DBText4: TDBText;
    Panel2: TPanel;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    DBText1: TDBText;
    Label12: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    SpeedButton8: TSpeedButton;
    tCPagarParcHistIns: TTable;
    tCPagarParcHistInsNumCPagar: TIntegerField;
    tCPagarParcHistInsParcCPagar: TIntegerField;
    tCPagarParcHistInsItem: TIntegerField;
    tCPagarParcHistInsCodHistorico: TIntegerField;
    tCPagarParcHistInsDtHistorico: TDateField;
    tCPagarParcHistInsHistorico: TStringField;
    tCPagarParcHistInsDtUltPgto: TDateField;
    tCPagarParcHistInsVlrUltPgto: TFloatField;
    tCPagarParcHistInsVlrUltJuros: TFloatField;
    tCPagarParcHistInsVlrUltDescontos: TFloatField;
    tCPagarParcHistInsVlrUltDespesas: TFloatField;
    tCPagarParcHistInsVlrUltAbatimentos: TFloatField;
    tCPagarParcHistInsPgto: TBooleanField;
    tCPagarParcHistInsJurosPagos: TFloatField;
    Bevel1: TBevel;
    CurrencyEdit1: TCurrencyEdit;
    SpeedButton1: TSpeedButton;
    Label10: TLabel;
    Label11: TLabel;
    DateEdit1: TDateEdit;
    CurrencyEdit2: TCurrencyEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Edit1: TEdit;
    tHistorico: TTable;
    dsHistorico: TDataSource;
    tHistoricoCodigo: TIntegerField;
    tHistoricoNome: TStringField;
    tHistoricoTipo: TStringField;
    RxDBFilter1: TRxDBFilter;
    DBText5: TDBText;
    CurrencyEdit3: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label13: TLabel;
    DBEdit1: TDBEdit;
    Label14: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CurrencyEdit1Enter(Sender: TObject);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CurrencyEdit2Exit(Sender: TObject);
    procedure CurrencyEdit4Exit(Sender: TObject);
    procedure CurrencyEdit5Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo4Enter(Sender: TObject);
  private
    { Private declarations }
    procedure Pgto;
    procedure Grava_Historico;
  public
    { Public declarations }
  end;

var
  fContasPagarPag: TfContasPagarPag;
  ValorJuros : real;
  vHistorico : String;
  vNumMov, vNumMovJuros : Integer;

implementation

uses UDM1, UContasPagar, UPlanoContas, UHistorico, UAgendaTelef;

{$R *.DFM}

procedure TfContasPagarPag.Grava_Historico;
begin
  DM1.tCPagarParcHist.Insert;
  tCPagarParcHistIns.Refresh;
  tCPagarParcHistIns.Last;
  DM1.tCPagarParcHistNumCPagar.AsInteger     := DM1.tCPagarParcNumCPagar.AsInteger;
  DM1.tCPagarParcHistParcCPagar.AsInteger    := DM1.tCPagarParcParcCPagar.AsInteger;
  DM1.tCPagarParcHistItem.AsInteger          := tCPagarParcHistInsItem.AsInteger + 1;
  DM1.tCPagarParcHistDtHistorico.AsDateTime  := Date;
  DM1.tCPagarParcHistCodHistorico.AsCurrency := 0;
  if Edit1.Text <> '' then
    DM1.tCPagarParcHistHistorico.AsString      := Edit1.Text
  else
    DM1.tCPagarParcHistHistorico.AsString      := vHistorico;
  DM1.tCPagarParcHistDtUltPgto.AsDateTime      := DM1.tCPagarParcDtPagParcCPagar.AsDateTime;
  DM1.tCPagarParcHistVlrUltPgto.AsCurrency     := CurrencyEdit2.Value;
  DM1.tCPagarParcHistVlrUltJuros.AsFloat       := CurrencyEdit3.Value;
  DM1.tCPagarParcHistVlrUltDescontos.AsFloat   := CurrencyEdit5.Value;
  DM1.tCPagarParcHistVlrUltDespesas.AsFloat    := DM1.tCPagarParcDespesas.AsFloat;
  DM1.tCPagarParcHistVlrUltAbatimentos.AsFloat := CurrencyEdit4.Value;
  DM1.tCPagarParcHistJurosPagos.AsFloat        := 0;
  DM1.tCPagarParcHistPgto.AsBoolean            := True;
  DM1.tCPagarParcHistNumMov.AsInteger          := vNumMov;
  DM1.tCPagarParcHistNumMovJuros.AsInteger     := vNumMovJuros;
  DM1.tCPagarParcHist.Post;
end;

procedure TfContasPagarPag.Pgto;
var
  NumCPagar, vNumCPagar, vParcCPagar : Integer;
  NumParcCPagar       : String[10];
  DataPagParcCPagar   : TDateTime;
  ValorParcCPagar     : Real;
  Texto1 : String;
procedure QuitaContaPagar;
var Achou : Boolean;
begin
  Achou := False;
  DM1.tCPagarParc.First;
  while not DM1.tCPagarParc.EOF do
    begin
      if not DM1.tCPagarParcQuitParcCPagar.AsBoolean then
        Achou := True;
      DM1.tCPagarParc.Next;
    end;
  if not Achou then
    begin
      DM1.tCPagar.Edit;
      DM1.tCPagarQuitado.AsBoolean := True;
      DM1.tCPagar.Post;
    end;
end;
begin
  vNumMov      := 0;
  vNumMovJuros := 0;
  if RxDBLookupCombo2.Text <> '' then
    begin
      NumCPagar         := 0;
      NumParcCPagar     := '';
      DataPagParcCPagar := 0;
      ValorParcCPagar   := 0;
      vNumCPagar        := DM1.tCPagarParcNumCPagar.AsInteger;
      vParcCPagar       := DM1.tCPagarParcParcCPagar.AsInteger;
      DM1.tCPagarParcRestParcela.AsCurrency := StrToCurr(FormatCurr('0.00',DM1.tCPagarParcRestParcela.AsCurrency - CurrencyEdit4.Value - CurrencyEdit5.Value));
      if StrToCurr(FormatCurr('0.00',CurrencyEdit2.Value)) >= StrToCurr(FormatCurr('0.00',DM1.tCPagarParcRestParcela.AsCurrency)) then
        vHistorico          := 'PAGAMENTO TOTAL'
      else
        vHistorico          := 'PAGAMENTO PARCIAL';
//      DM1.tCPagarParcRestParcela.AsFloat := DM1.tCPagarParcRestParcela.AsFloat - CurrencyEdit4.Value;
      DM1.tCPagarParcDtPagParcCPagar.AsDateTime  := DateEdit1.Date;
      DM1.tMovimentos.MasterSource.Enabled    := False;
      DM1.tMovimentos.Insert;
      DM1.tMovimentosCodConta.AsInteger       := RxDBLookupCombo2.KeyValue;;
      DM1.tMovimentosNumCPagar.AsInteger      := DM1.tCPagarNumCPagar.AsInteger;
      DM1.tMovimentosDtMovimento.AsDateTime   := DM1.tCPagarParcDtPagParcCPagar.AsDateTime;
      DM1.tMovimentosNumNotaEnt.AsInteger     := DM1.tCPagarParcNumNotaEnt.AsInteger;
      Texto1 := '';
      if DM1.tCPagarParcNumNotaEnt.AsInteger > 0 then
        Texto1 := ' nf.nº ' + DM1.tCPagarNumNotaEnt.AsString
      else
      if DM1.tCPagarParcNroDuplicata.AsInteger > 0 then
        Texto1 := ' Dupl.nº ' + DM1.tCPagarNroDuplicata.AsString;
      DM1.tMovimentosCodForn.AsInteger        := DM1.tCPagarParcCodForn.AsInteger;
      DM1.tMovimentosPlanoContas.AsInteger    := DM1.tCPagarParcPlanoContas.AsInteger;
      DM1.tMovimentosVlrMovDebito.AsCurrency := CurrencyEdit2.Value;
      if CurrencyEdit2.Value = DM1.tCPagarParcVlrParcCPagar.AsCurrency then
        DM1.tMovimentosHistorico.AsString := 'Pg.Parc.nº '+ DM1.tCPagarParcParcCPagar.AsString +
                                              Texto1 + ' de ' + DM1.tCPagarlkNomeForn.AsString
      else
        DM1.tMovimentosHistorico.AsString := 'Pg.Parc.Parcial nº '+ DM1.tCPagarParcParcCPagar.AsString +
                                              Texto1 + ' de ' + DM1.tCPagarlkNomeForn.AsString;
      DM1.tContas.FindKey([RxDBLookupCombo2.KeyValue]);
      DM1.tContas.Edit;
      DM1.tContasSaldoConta.AsCurrency := DM1.tContasSaldoConta.AsCurrency
                                          - CurrencyEdit2.Value;
//      if DM1.tCPagarParcJurosParcCPagar.AsFloat > 0 then
      if CurrencyEdit3.Value > 0 then
        begin
          NumCPagar         := DM1.tCPagarNumCPagar.AsInteger;
          DataPagParcCPagar := DM1.tCPagarParcDtPagParcCPagar.AsDateTime;
          ValorParcCPagar   := CurrencyEdit3.Value;
          NumParcCPagar     := DM1.tCPagarParcParcCPagar.AsString;
        end;
      DM1.tContas.Post;
      DM1.tMovimentos.Post;
      vNumMov := DM1.tMovimentosNumMovimento.AsInteger;
      if CurrencyEdit3.Value > 0 then
        begin
          DM1.tMovimentos.Insert;
          DM1.tMovimentosCodConta.AsInteger     := RxDBLookupCombo2.KeyValue;
          DM1.tMovimentosNumCPagar.AsInteger    := NumCPagar;
          DM1.tMovimentosDtMovimento.AsDateTime := DataPagParcCPagar;
          DM1.tMovimentosVlrMovDebito.AsFloat   := ValorParcCPagar;
          DM1.tMovimentosNumNotaEnt.AsInteger   := DM1.tCPagarParcNumNotaEnt.AsInteger;
          DM1.tMovimentosCodForn.AsInteger      := DM1.tCPagarParcCodForn.AsInteger;
          DM1.tMovimentosPlanoContas.AsInteger  := DM1.tCPagarParcPlanoContas.AsInteger;
          if CurrencyEdit2.Value = DM1.tCPagarParcVlrParcCPagar.AsCurrency then
            DM1.tMovimentosHistorico.AsString := 'Pg.Juros s/Parc.nº '+ NumParcCPagar +
                                                 Texto1 + ' de ' + DM1.tCPagarlkNomeForn.AsString
          else
             DM1.tMovimentosHistorico.AsString   := 'Pg.Juros s/Parc.nº '+ NumParcCPagar +
                                                     Texto1 + ' de ' + DM1.tCPagarlkNomeForn.AsString;
          DM1.tContas.FindKey([RxDBLookupCombo2.KeyValue]);
          DM1.tContas.Edit;
          DM1.tContasSaldoConta.AsFloat         := DM1.tContasSaldoConta.AsFloat
                                                   - ValorParcCPagar;
          DM1.tContas.Post;
          DM1.tMovimentos.Post;
          vNumMovJuros := DM1.tMovimentosNumMovimento.AsInteger;
        end;
      DM1.tCPagarParcCodConta.AsInteger         := RxDBLookupCombo2.KeyValue;
      if RxDBLookupCombo4.Text <> '' then
        DM1.tCPagarParcCodTipoCobranca.AsInteger  := RxDBLookupCombo4.KeyValue;
      DM1.tCPagarParcDesconto.AsFloat           := DM1.tCPagarParcDesconto.AsFloat + CurrencyEdit5.Value;
      DM1.tCPagarParcAbatimentos.AsFloat        := DM1.tCPagarParcAbatimentos.AsFloat + CurrencyEdit4.Value;
      DM1.tCPagarParcRestParcela.AsCurrency     := StrToCurr(FormatCurr('0.00',DM1.tCPagarParcRestParcela.AsCurrency - CurrencyEdit4.Value - CurrencyEdit5.Value));
      DM1.tCPagarParcRestParcela.AsCurrency     := StrToCurr(FormatCurr('0.00',DM1.tCPagarParcRestParcela.AsCurrency -
                                                   CurrencyEdit2.Value));
      if StrToCurr(FormatCurr('0.00',DM1.tCPagarParcRestParcela.AsCurrency)) <= 0 then
        DM1.tCPagarParcRestParcela.AsCurrency := StrToCurr(FormatCurr('0.00',0));
      if DM1.tCPagarParcRestParcela.AsCurrency = 0 then
        DM1.tCPagarParcQuitParcCPagar.AsBoolean := True;
      DM1.tCPagarParcJurosParcCPagar.AsFloat    := ValorJuros +  CurrencyEdit3.Value;
      DM1.tCPagarParcDtPagParcCPagar.AsDateTime  := DateEdit1.Date;
      DM1.tCPagarParcDiasAtraso.AsFloat          := DM1.tCPagarParcDtPagParcCPagar.AsFloat - DM1.tCPagarParcDtVencCPagar.AsFloat;
      if DM1.tCPagarParcclDiasAtraso.AsFloat < 0 then
        DM1.tCPagarParcclDiasAtraso.AsFloat := 0;
      DM1.tCPagarParcPgtoParcial.AsCurrency := DM1.tCPagarParcPgtoParcial.AsCurrency + CurrencyEdit2.Value;
      DM1.tCPagarParc.Post;
      Grava_Historico;
      QuitaContaPagar;
      DM1.tMovimentos.MasterSource.Enabled    := True;
      DM1.tCPagarParc.SetKey;
      DM1.tCPagarParcNumCPagar.AsInteger  := vNumCPagar;
      DM1.tCPagarParcParcCPagar.AsInteger := vParcCPagar;
      DM1.tCPagarParc.GotoKey;
      Close;
    end
  else
    ShowMessage('Você deve escolher uma conta!');
end;

procedure TfContasPagarPag.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfContasPagarPag.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DM1.tCPagar.MasterFields <> '' then
    DM1.tCPagar.MasterSource.Enabled := True;
  //fContasPagar.tCPagarParc.Refresh;
  Action := Cafree;
end;

procedure TfContasPagarPag.FormShow(Sender: TObject);
begin
  if DM1.tCPagar.MasterFields <> '' then
    DM1.tCPagar.MasterSource.Enabled          := False;
  DM1.tCPagarParc.Edit;
  if DM1.tCPagarParcCodConta.AsInteger > 0 then
    RxDBLookupCombo2.KeyValue := DM1.tCPagarParcCodConta.AsInteger;
  if DM1.tCPagarParcCodTipoCobranca.AsInteger > 0 then
    RxDBLookupCombo4.KeyValue := DM1.tCPagarParcCodTipoCobranca.AsInteger;
  ValorJuros  := DM1.tCPagarParcJurosParcCPagar.AsFloat;
  CurrencyEdit2.Value := StrToCurr(FormatCurr('0.00',DM1.tCPagarParcRestParcela.AsCurrency));
  CurrencyEdit3.Clear;
  CurrencyEdit4.Clear;
  CurrencyEdit5.Clear;
  DateEdit1.Date := Date();
end;

procedure TfContasPagarPag.BitBtn1Click(Sender: TObject);
begin
  if StrToCurr(FormatCurr('0.00',CurrencyEdit2.Value)) > StrToCurr(FormatCurr('0.00',DM1.tCPagarParcRestParcela.AsCurrency)) then
    ShowMessage('Valor do pagamento não pode ser maior que restante a pagar!')
  else
  if CurrencyEdit2.Value <= 0 then
    ShowMessage('Valor de pagamento não pode ser zero!')
  else
    Pgto;
end;

procedure TfContasPagarPag.SpeedButton8Click(Sender: TObject);
begin
  if DM1.tUsuarioPlanoCtas.AsBoolean then
    begin
      fPlanoContas := TfPlanoContas.Create(Self);
      fPlanoContas.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfContasPagarPag.RxDBLookupCombo3Enter(Sender: TObject);
begin
  DM1.tPlanoContas.IndexFieldNames := 'Descricao';
end;

procedure TfContasPagarPag.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioHistoricos.AsBoolean then
    begin
      fHistorico := TfHistorico.Create(Self);
      fHistorico.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfContasPagarPag.CurrencyEdit1Enter(Sender: TObject);
begin
  DM1.tHistorico.IndexFieldNames := 'Codigo';
end;

procedure TfContasPagarPag.CurrencyEdit1Exit(Sender: TObject);
begin
  if CurrencyEdit1.Text <> '' then
    begin
      DM1.tHistorico.SetKey;
      DM1.tHistoricoCodigo.AsInteger := StrToInt(CurrencyEdit1.Text);
      if DM1.tHistorico.GotoKey then
        Edit1.Text := DM1.tHistoricoNome.AsString;
    end;
end;

procedure TfContasPagarPag.RxDBLookupCombo1Enter(Sender: TObject);
begin
  tHistorico.IndexFieldNames := 'Nome';
  Edit1.Text := RxDBLookupCombo1.Text;
  CurrencyEdit1.Text := tHistoricoCodigo.AsString;
end;

procedure TfContasPagarPag.RxDBLookupCombo1Exit(Sender: TObject);
begin
  tHistorico.IndexFieldNames := 'Codigo';
  Edit1.Text := RxDBLookupCombo1.Text;
  CurrencyEdit1.Text := tHistoricoCodigo.AsString;
end;

procedure TfContasPagarPag.RxDBLookupCombo1Change(Sender: TObject);
begin
  Edit1.Text := RxDBLookupCombo1.Text;
  CurrencyEdit1.Text := tHistoricoCodigo.AsString;
end;

procedure TfContasPagarPag.Edit1Change(Sender: TObject);
begin
  try
    tHistorico.IndexFieldNames := 'Nome';
    tHistorico.FindNearest([Edit1.Text]);
    CurrencyEdit1.Text := tHistoricoCodigo.AsString;
  except
//    ShowMessage('Digite apenas números aqui!');
  end;
end;

procedure TfContasPagarPag.CurrencyEdit2Exit(Sender: TObject);
var
 vAux : Real;
begin
  vAux := StrToCurr(FormatCurr('0.00',DM1.tCPagarParcRestParcela.AsCurrency - CurrencyEdit4.Value - CurrencyEdit5.Value));
  //if CurrencyEdit2.Value > DM1.tCPagarParcRestParcela.AsCurrency then
  if StrToCurr(FormatCurr('0.00',CurrencyEdit2.Value)) > StrToCurr(FormatCurr('0.00',vAux)) then
    begin
      //CurrencyEdit3.Value := CurrencyEdit2.Value - DM1.tCPagarParcRestParcela.AsCurrency;
      CurrencyEdit3.Value := CurrencyEdit2.Value - vAux;
      CurrencyEdit2.Value := vAux;
    end;
end;

procedure TfContasPagarPag.CurrencyEdit4Exit(Sender: TObject);
begin
  CurrencyEdit2.Value := StrToCurr(FormatCurr('0.00',DM1.tCPagarParcRestParcela.AsFloat - CurrencyEdit4.Value - CurrencyEdit5.Value));
end;

procedure TfContasPagarPag.CurrencyEdit5Exit(Sender: TObject);
begin
  CurrencyEdit2.Value := StrToCurr(FormatCurr('0.00',DM1.tCPagarParcRestParcela.AsFloat - CurrencyEdit5.Value - CurrencyEdit4.Value));
end;

procedure TfContasPagarPag.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

procedure TfContasPagarPag.RxDBLookupCombo4Enter(Sender: TObject);
begin
  DM1.tTipoCobranca.IndexFieldNames := 'Nome';
end;

end.

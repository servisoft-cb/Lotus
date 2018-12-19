unit UContasReceberPag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls,
  ComCtrls, Mask, ToolEdit, RXDBCtrl, CurrEdit, Db, DbTables, RXLookup, DBFilter, Variants;

type
  TfContasReceberPag = class(TForm)
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
    DBEdit2: TDBEdit;
    Label9: TLabel;
    Label1: TLabel;
    DBText1: TDBText;
    CurrencyEdit1: TCurrencyEdit;
    Label12: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    SpeedButton8: TSpeedButton;
    DBCheckBox1: TDBCheckBox;
    Label10: TLabel;
    Bevel1: TBevel;
    Label11: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    Label13: TLabel;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Label14: TLabel;
    DBEdit5: TDBEdit;
    Label15: TLabel;
    DBText5: TDBText;
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
    Label16: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    Label17: TLabel;
    Bevel2: TBevel;
    DateEdit1: TDateEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBFilter1: TRxDBFilter;
    CurrencyEdit4: TCurrencyEdit;
    Label18: TLabel;
    DBEdit3: TDBEdit;
    CurrencyEdit5: TCurrencyEdit;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label19: TLabel;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure CurrencyEdit2Enter(Sender: TObject);
    procedure CurrencyEdit2Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit4Enter(Sender: TObject);
    procedure DBEdit5Enter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DateEdit1Exit(Sender: TObject);
    procedure CurrencyEdit4Exit(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
  private
    { Private declarations }
    vValorJuros, ValorDesc, vDespesa, vAbatimento: real;
    vDias: integer;
    Ano, Mes, Dia: Word;
    vHistorico: String;
    vNumMov, vNumMovJuros: Integer;
    procedure Pgto_Total;
    procedure Pgto_Parcial;
    procedure Grava_Historico;
    procedure Grava_ExtComissao;
  public
    { Public declarations }
  end;

var
  fContasReceberPag: TfContasReceberPag;

implementation

uses UDM1, UPlanoContas, UHistorico;

{$R *.DFM}

procedure TfContasReceberPag.Grava_ExtComissao;
var
  vAux: Real;
begin
  tExtComissaoIns.Refresh;
  tExtComissaoIns.Last;
  DM1.tExtComissao.Insert;
  DM1.tExtComissaoNroLancamento.AsInteger := tExtComissaoInsNroLancamento.AsInteger + 1;
  DM1.tExtComissaoCodVendedor.AsInteger   := DM1.tCReceberParcCodVendedor.AsInteger;
  DM1.tExtComissaoDtReferencia.AsDateTime := DM1.tCReceberParcDtPagParcCReceber.AsDateTime;
  DM1.tExtComissaoParcDoc.AsInteger       := DM1.tCReceberParcParcCReceber.AsInteger;
  DM1.tExtComissaoCodCliente.AsInteger    := DM1.tCReceberParcCodCli.AsInteger;
  DM1.tExtComissaoFuncao.AsString         := 'E';
  DM1.tExtComissaoNroDoc.AsInteger        := DM1.tCReceberParcNumNota.AsInteger;
  if DM1.tCReceberTipoDoc.AsString = 'AV' then
    vAux := CurrencyEdit4.Value
  else
    vAux := StrToFloat(FormatFloat('0.00',(CurrencyEdit4.Value * DM1.tCReceberPercBaseComissao.AsFloat) / 100));
  if DM1.tCReceberParcPagarParteNaNota.AsBoolean then
    //vAux := StrToFloat(FormatFloat('0.00',CurrencyEdit4.Value / 2));
    vAux := StrToFloat(FormatFloat('0.00',vAux / 2));
  //DM1.tExtComissaoVlrBase.AsCurrency      := CurrencyEdit4.Value;
  DM1.tExtComissaoVlrBase.AsCurrency      := StrToFloat(FormatFloat('0.00',vAux));
  DM1.tExtComissaoPercDescDupl.AsFloat    := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcDesconto.AsFloat));
  DM1.tExtComissaoPercComissao.AsFloat    := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcPercComissao.AsFloat));
  DM1.tExtComissaoVlrComissao.AsFloat     := StrToFloat(FormatFloat('0.00',(DM1.tExtComissaoVlrBase.AsFloat * DM1.tExtComissaoPercComissao.AsFloat / 100)));
  DM1.tExtComissaoTipo.AsString           := 'D';
  DM1.tExtComissaoSuspensa.AsBoolean      := False;
  DM1.tExtComissao.Post;
  DM1.tCReceberParcHistNroLancExtComissao.AsInteger := DM1.tExtComissaoNroLancamento.AsInteger;
end;

procedure TfContasReceberPag.Grava_Historico;
var
  vItemAux: Integer;
begin
  DM1.tCReceberParcHist.Refresh;
  DM1.tCReceberParcHist.Last;
  vItemAux := DM1.tCReceberParcHistItem.AsInteger;
  DM1.tCReceberParcHist.Insert;
  DM1.tCReceberParcHistNumCReceber.AsInteger   := DM1.tCReceberParcNumCReceber.AsInteger;
  DM1.tCReceberParcHistParcCReceber.AsInteger  := DM1.tCReceberParcParcCReceber.AsInteger;
  DM1.tCReceberParcHistItem.AsInteger          := vItemAux + 1;
  DM1.tCReceberParcHistDtHistorico.AsDateTime  := Date;
  DM1.tCReceberParcHistCodHistorico.AsCurrency := 0;
  if Edit1.Text <> '' then
    DM1.tCReceberParcHistHistorico.AsString := Edit1.Text
  else
    DM1.tCReceberParcHistHistorico.AsString := vHistorico;
  DM1.tCReceberParcHistDtUltPgto.AsDateTime      := DM1.tCReceberParcDtPagParcCReceber.AsDateTime;
  DM1.tCReceberParcHistVlrUltPgto.AsCurrency     := CurrencyEdit4.Value;
  DM1.tCReceberParcHistVlrUltJuros.AsFloat       := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcJurosParcCReceber.AsFloat));
  DM1.tCReceberParcHistVlrUltDescontos.AsFloat   := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcDesconto.AsFloat));
  DM1.tCReceberParcHistVlrUltDespesas.AsFloat    := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcDespesas.AsFloat));
  DM1.tCReceberParcHistVlrUltAbatimentos.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcAbatimentos.AsFloat));
  DM1.tCReceberParcHistJurosPagos.AsFloat        := StrToFloat(FormatFloat('0.00',CurrencyEdit1.Value));
  DM1.tCReceberParcHistPgto.AsBoolean            := True;
  DM1.tCReceberParcHistNumMov.AsInteger          := vNumMov;
  DM1.tCReceberParcHistNumMovJuros.AsInteger     := vNumMovJuros;
  DM1.tCReceberParcHistJurosCalc.AsFloat         := StrToFloat(FormatFloat('0.00',vValorJuros));
end;

procedure TfContasReceberPag.Pgto_Total;
var
  NumCReceber: integer;
  NumParcCReceber    : string[10];
  DataPagParcCReceber: TDateTime;
  ValorParcCReceber  : real;
procedure QuitaContaReceber;
var Achou: Boolean;
begin
  Achou := False;
  DM1.tCReceberParc.First;
  while not DM1.tCReceberParc.EOF do
  begin
    if not DM1.tCReceberParcQuitParcCReceber.AsBoolean then
      Achou := True;
    DM1.tCReceberParc.Next;
  end;
  if not Achou then
  begin
    DM1.tCReceber.Edit;
    DM1.tCReceberQuitado.AsBoolean := True;
    DM1.tCReceber.Post;
  end;
end;
begin
  vNumMov      := 0;
  vNumMovJuros := 0;
  if RxDBLookupCombo2.Text <> '' then
  begin
    NumCReceber         := 0;
    NumParcCReceber     := '';
    DataPagParcCReceber := 0;
    ValorParcCReceber   := 0;
    vHistorico          := 'PAGAMENTO TOTAL';
    DM1.tCReceberParcDtPagParcCReceber.AsDateTime := DateEdit1.Date;
    DM1.tCReceberParcQuitParcCReceber.AsBoolean := True;
    DM1.tMovimentos.MasterSource.Enabled        := False;
    DM1.tMovimentos.Insert;
    DM1.tMovimentosCodConta.AsInteger           := RxDBLookupCombo2.KeyValue;
    DM1.tMovimentosNumCReceber.AsInteger        := DM1.tCReceberNumCReceber.AsInteger;
    DM1.tMovimentosDtMovimento.AsDateTime       := DM1.tCReceberParcDtPagParcCReceber.AsDateTime;
    DM1.tMovimentosNumNota.AsInteger            := DM1.tCReceberParcNumNota.AsInteger;
    DM1.tMovimentosCodCli.AsInteger             := DM1.tCReceberParcCodCli.AsInteger;
    DM1.tMovimentosPlanoContas.AsInteger        := DM1.tCReceberParcPlanoContas.AsInteger;
    if StrToFloat(FormatFloat('0.00',DM1.tCReceberParcDesconto.AsFloat)) > 0 then
    begin
      DM1.tMovimentosVlrMovCredito.AsCurrency := CurrencyEdit4.Value - DM1.tCReceberParcDesconto.AsCurrency;
      if DM1.tCReceberTipoDoc.AsString = 'AV' then
        DM1.tMovimentosHistorico.AsString := 'Rec.Parc.nº '+ DM1.tCReceberParcParcCReceber.AsString +
                                             ' nf.nº ' + DM1.tCReceberHistorico.AsString +
                                             ' c/desc.de ' + DM1.tCReceberlkNomeCli.AsString
      else
        DM1.tMovimentosHistorico.AsString := 'Rec.Parc.nº '+ DM1.tCReceberParcParcCReceber.AsString +
                                             ' nf.nº ' + DM1.tCReceberNumNota.AsString +
                                             ' c/desc.de ' + DM1.tCReceberlkNomeCli.AsString;
    end
    else
    begin
      DM1.tMovimentosVlrMovCredito.AsCurrency := CurrencyEdit4.Value;
      if DM1.tCReceberTipoDoc.AsString = 'AV' then
        DM1.tMovimentosHistorico.AsString := 'Rec.Parc.nº '+ DM1.tCReceberParcParcCReceber.AsString +
                                             ' nf.nº ' + DM1.tCReceberHistorico.AsString +
                                             ' de ' + DM1.tCReceberlkNomeCli.AsString
      else
        DM1.tMovimentosHistorico.AsString := 'Rec.Parc.nº '+ DM1.tCReceberParcParcCReceber.AsString +
                                             ' nf.nº ' + DM1.tCReceberNumNota.AsString +
                                             ' de ' + DM1.tCReceberlkNomeCli.AsString;
    end;
    vNumMov := DM1.tMovimentosNumMovimento.AsInteger;

    if CurrencyEdit1.Value > 0 then
    begin
      NumCReceber         := DM1.tCReceberNumCReceber.AsInteger;
      DataPagParcCReceber := DM1.tCReceberParcDtPagParcCReceber.AsDateTime;
      ValorParcCReceber   := CurrencyEdit1.Value;
      NumParcCReceber     := DM1.tCReceberParcParcCReceber.AsString;
    end;
    if CurrencyEdit1.Value > 0 then
    begin
      DM1.tMovimentos.Insert;
      DM1.tMovimentosCodConta.AsInteger       := RxDBLookupCombo2.KeyValue;
      DM1.tMovimentosNumCReceber.AsInteger    := NumCReceber;
      DM1.tMovimentosDtMovimento.AsDateTime   := DataPagParcCReceber;
      DM1.tMovimentosVlrMovCredito.AsFloat    := StrToFloat(FormatFloat('0.00',ValorParcCReceber));
      DM1.tMovimentosNumNota.AsInteger        := DM1.tCReceberParcNumNota.AsInteger;
      DM1.tMovimentosCodCli.AsInteger         := DM1.tCReceberParcCodCli.AsInteger;
      DM1.tMovimentosPlanoContas.AsInteger    := DM1.tCReceberParcPlanoContas.AsInteger;
      if DM1.tCReceberTipoDoc.AsString = 'AV' then
        DM1.tMovimentosHistorico.AsString := 'Rec.Juros s/Parc.nº '+ NumParcCReceber +
                                             ' nf.nº ' + DM1.tCReceberHistorico.AsString +
                                             ' de ' + DM1.tCReceberlkNomeCli.AsString
      else
        DM1.tMovimentosHistorico.AsString := 'Rec.Juros s/Parc.nº '+ NumParcCReceber +
                                             ' nf.nº ' + DM1.tCReceberNumNota.AsString +
                                             ' de ' + DM1.tCReceberlkNomeCli.AsString;
      DM1.tMovimentos.Post;
      vNumMovJuros := DM1.tMovimentosNumMovimento.AsInteger;
    end;
    DM1.tCReceberParcCodConta.AsInteger           := RxDBLookupCombo2.KeyValue;
    DM1.tCReceberParcRestParcela.AsFloat          := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat -
                                                     DM1.tCReceberParcVlrParcCReceber.AsFloat));
    DM1.tCReceberParcDtPagParcCReceber.AsDateTime := DateEdit1.Date;
    DM1.tCReceberParcJurosParcCReceber.AsFloat    := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcJurosParcCReceber.AsFloat + vValorJuros));
    DM1.tCReceberParcJurosPagos.AsFloat           := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcJurosPagos.AsFloat + CurrencyEdit1.Value));
    DM1.tCReceberParcDesconto.AsFloat             := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcDesconto.AsFloat + ValorDesc));
    if StrToFloat(FormatFloat('0.00',DM1.tCReceberParcParcCReceber.AsInteger)) > 0 then
      if DM1.tCReceberParcDtPagParcCReceber.AsDateTime > DM1.tCReceberParcDtVencCReceber.AsDateTime then
      begin
        vDias := DM1.tCReceberParcDtPagParcCReceber.AsVariant - DM1.tCReceberParcDtVencCReceber.AsVariant;
        DecodeDate(vDias, Ano, Mes, Dia);
      end;
    if DM1.tCReceberParcDtVencCReceber.AsString = '' then
      DM1.tCReceberParcDtVencCReceber.AsDateTime := DM1.tCReceberParcDtPagParcCReceber.AsDateTime;
    DM1.tCReceberParcDiasAtraso.AsFloat :=  DM1.tCReceberParcDtPagParcCReceber.AsDateTime - DM1.tCReceberParcDtVencCReceber.AsDateTime;
    if DM1.tCReceberParcDiasAtraso.AsFloat < 0 then
      DM1.tCReceberParcDiasAtraso.AsFloat := 0;
    Grava_Historico;
    if (DM1.tCReceberParclkTipoComissao.AsString = 'D') and (DM1.tCReceberParcCodVendedor.AsInteger > 0) and
       (DM1.tCReceberParcPercComissao.AsFloat > 0) then
      Grava_ExtComissao;
    DM1.tCReceberParcHist.Post;
    DM1.tCReceberParcPgtoParcial.AsCurrency := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcPgtoParcial.AsCurrency + CurrencyEdit4.Value));
    DM1.tCReceberParc.Post;
    QuitaContaReceber;
    DM1.tMovimentos.MasterSource.Enabled := True;
    Close;
  end
  else
    ShowMessage('Você deve escolher uma conta!');
end;

procedure TfContasReceberPag.Pgto_Parcial;
var
  NumCReceber: integer;
  NumParcCReceber    : string[10];
  DataPagParcCReceber: TDateTime;
  ValorParcCReceber  : real;
procedure QuitaContaReceber;
var Achou: Boolean;
begin
  Achou := False;
  DM1.tCReceberParc.First;
  while not DM1.tCReceberParc.EOF do
    begin
      if not DM1.tCReceberParcQuitParcCReceber.AsBoolean then
        Achou := True;
      DM1.tCReceberParc.Next;
    end;
  if not Achou then
    begin
      DM1.tCReceber.Edit;
      DM1.tCReceberQuitado.AsBoolean := True;
      DM1.tCReceber.Post;
    end;
end;
begin
  vNumMov      := 0;
  vNumMovJuros := 0;
  if RxDBLookupCombo2.Text <> '' then
    begin
      NumCReceber         := 0;
      NumParcCReceber     := '';
      DataPagParcCReceber := 0;
      ValorParcCReceber   := 0;
      if CurrencyEdit4.Value = StrToCurr(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsCurrency)) then
        vHistorico := 'PAGAMENTO TOTAL'
      else
        vHistorico := 'PAGAMENTO PARCIAL';
      DM1.tCReceberParcDtPagParcCReceber.AsDateTime := DateEdit1.Date;
      DM1.tMovimentos.MasterSource.Enabled        := False;
      DM1.tMovimentos.Insert;
      DM1.tMovimentosCodConta.AsInteger           := RxDBLookupCombo2.KeyValue;
      DM1.tMovimentosNumCReceber.AsInteger        := DM1.tCReceberNumCReceber.AsInteger;
      DM1.tMovimentosDtMovimento.AsDateTime       := DM1.tCReceberParcDtPagParcCReceber.AsDateTime;
      DM1.tMovimentosNumNota.AsInteger            := DM1.tCReceberParcNumNota.AsInteger;
      DM1.tMovimentosCodCli.AsInteger             := DM1.tCReceberParcCodCli.AsInteger;
      DM1.tMovimentosPlanoContas.AsInteger        := DM1.tCReceberParcPlanoContas.AsInteger;
      if StrToFloat(FormatFloat('0.00',DM1.tCReceberParcDesconto.AsFloat)) > 0 then
      begin
        DM1.tMovimentosVlrMovCredito.AsCurrency := CurrencyEdit4.Value - DM1.tCReceberParcDesconto.AsCurrency;
        if DM1.tCReceberTipoDoc.AsString = 'AV' then
          DM1.tMovimentosHistorico.AsString := 'Rec.Parc.Parcial nº '+ DM1.tCReceberParcParcCReceber.AsString +
                                               ' nf.nº ' + DM1.tCReceberHistorico.AsString +
                                               ' c/desc.de ' + DM1.tCReceberlkNomeCli.AsString
        else
          DM1.tMovimentosHistorico.AsString := 'Rec.Parc.Parcial nº '+ DM1.tCReceberParcParcCReceber.AsString +
                                               ' nf.nº ' + DM1.tCReceberNumNota.AsString +
                                               ' c/desc.de ' + DM1.tCReceberlkNomeCli.AsString;
      end
      else
      begin
        DM1.tMovimentosVlrMovCredito.AsCurrency := CurrencyEdit4.Value;
        if DM1.tCReceberTipoDoc.AsString = 'AV' then
          DM1.tMovimentosHistorico.AsString := 'Rec.Parc.Parcial nº '+ DM1.tCReceberParcParcCReceber.AsString +
                                               ' nf.nº ' + DM1.tCReceberHistorico.AsString +
                                               ' de ' + DM1.tCReceberlkNomeCli.AsString
        else
          DM1.tMovimentosHistorico.AsString := 'Rec.Parc.Parcial nº '+ DM1.tCReceberParcParcCReceber.AsString +
                                               ' nf.nº ' + DM1.tCReceberNumNota.AsString +
                                               ' de ' + DM1.tCReceberlkNomeCli.AsString;
      end;
      DM1.tMovimentos.Post;
      vNumMov := DM1.tMovimentosNumMovimento.AsInteger;
      if CurrencyEdit1.Value > 0 then
      begin
        NumCReceber         := DM1.tCReceberNumCReceber.AsInteger;
        DataPagParcCReceber := DM1.tCReceberParcDtPagParcCReceber.AsDateTime;
        ValorParcCReceber   := CurrencyEdit1.Value;
        NumParcCReceber     := DM1.tCReceberParcParcCReceber.AsString;
      end;
      if CurrencyEdit1.Value > 0 then
      begin
        DM1.tMovimentos.Insert;
        DM1.tMovimentosCodConta.AsInteger       := RxDBLookupCombo2.KeyValue;
        DM1.tMovimentosNumCReceber.AsInteger    := NumCReceber;
        DM1.tMovimentosDtMovimento.AsDateTime   := DataPagParcCReceber;
        DM1.tMovimentosVlrMovCredito.AsFloat    := StrToFloat(FormatFloat('0.00',ValorParcCReceber));
        DM1.tMovimentosNumNota.AsInteger        := DM1.tCReceberParcNumNota.AsInteger;
        DM1.tMovimentosCodCli.AsInteger         := DM1.tCReceberParcCodCli.AsInteger;
        DM1.tMovimentosPlanoContas.AsInteger    := DM1.tCReceberParcPlanoContas.AsInteger;
        if DM1.tCReceberTipoDoc.AsString = 'AV' then
          DM1.tMovimentosHistorico.AsString := 'Rec.Juros s/Parc.nº '+ NumParcCReceber +
                                               ' nf.nº ' + DM1.tCReceberHistorico.AsString +
                                               ' de ' + DM1.tCReceberlkNomeCli.AsString
        else
          DM1.tMovimentosHistorico.AsString := 'Rec.Juros s/Parc.nº '+ NumParcCReceber +
                                               ' nf.nº ' + DM1.tCReceberNumNota.AsString +
                                               ' de ' + DM1.tCReceberlkNomeCli.AsString;
        DM1.tMovimentos.Post;
        vNumMovJuros := DM1.tMovimentosNumMovimento.AsInteger;
      end;
      DM1.tCReceberParcCodConta.AsInteger        := RxDBLookupCombo2.KeyValue;
      DM1.tCReceberParcRestParcela.AsCurrency    := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsCurrency -
                                                    CurrencyEdit4.Value));
      if StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat)) <= 0 then
      begin
        DM1.tCReceberParcRestParcela.AsFloat        := StrToFloat(FormatFloat('0.00',0));
        DM1.tCReceberParcQuitParcCReceber.AsBoolean := True;
      end;
      DM1.tCReceberParcJurosParcCReceber.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcJurosParcCReceber.AsFloat + vValorJuros));
      DM1.tCReceberParcJurosPagos.AsFloat        := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcJurosPagos.AsFloat + CurrencyEdit1.Value));
      DM1.tCReceberParcDesconto.AsFloat          := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcDesconto.AsFloat + ValorDesc));
      if DM1.tCReceberParcParcCReceber.AsInteger > 0 then
        if DM1.tCReceberParcDtPagParcCReceber.AsDateTime > DM1.tCReceberParcDtVencCReceber.AsDateTime then
        begin
          vDias := DM1.tCReceberParcDtPagParcCReceber.AsVariant - DM1.tCReceberParcDtVencCReceber.AsVariant;
          DecodeDate(vDias, Ano, Mes, Dia);
        end;
      if DM1.tCReceberParcDtVencCReceber.AsString = '' then
        DM1.tCReceberParcDtVencCReceber.AsDateTime := DM1.tCReceberParcDtPagParcCReceber.AsDateTime;
      DM1.tCReceberParcDtPagParcCReceber.AsDateTime := DateEdit1.Date;
      DM1.tCReceberParcDiasAtraso.AsFloat :=  DM1.tCReceberParcDtPagParcCReceber.AsDateTime - DM1.tCReceberParcDtVencCReceber.AsDateTime;
      if DM1.tCReceberParcDiasAtraso.AsFloat < 0 then
        DM1.tCReceberParcDiasAtraso.AsFloat := 0;
      Grava_Historico;
      if (DM1.tCReceberParclkTipoComissao.AsString = 'D') and (DM1.tCReceberParcCodVendedor.AsInteger > 0) and
         (DM1.tCReceberParcPercComissao.AsFloat > 0) then
        Grava_ExtComissao;
      DM1.tCReceberParcHist.Post;
      DM1.tCReceberParcPgtoParcial.AsCurrency := DM1.tCReceberParcPgtoParcial.AsCurrency + CurrencyEdit4.Value;
      DM1.tCReceberParc.Post;
      QuitaContaReceber;
      DM1.tMovimentos.MasterSource.Enabled := True;
      Close;
    end
  else
    ShowMessage('Você deve escolher uma conta!');
end;

procedure TfContasReceberPag.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfContasReceberPag.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Label19.Visible := False;
  if DM1.tCReceberParc.State in [dsInsert,dsEdit] then
    DM1.tCReceberParc.Cancel;
  //Action := Cafree;
end;

procedure TfContasReceberPag.FormShow(Sender: TObject);
begin
  vValorJuros := 0;
  CurrencyEdit3.Value               := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcJurosPagos.AsFloat));
  DM1.tCReceberParc.Edit;
  if DM1.tCReceberParcCodConta.AsInteger > 0 then
    RxDBLookupCombo2.KeyValue := DM1.tCReceberParcCodConta.AsInteger;
  ValorDesc                         := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcDesconto.AsFloat));
  DM1.tCReceberParcDesconto.AsFloat := 0;
  CurrencyEdit4.Value := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsCurrency));
  CurrencyEdit5.Value := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcJurosParcCReceber.AsFloat - DM1.tCReceberParcJurosPagos.AsFloat));
  if CurrencyEdit5.Value < 0 then
    CurrencyEdit5.Value := 0;
  DateEdit1.Date := Date;
  vDespesa    := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcDespesas.AsFloat));
  vAbatimento := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcAbatimentos.AsFloat));
  CurrencyEdit2.Value := 0;
  Edit1.Text := '';
  DateEdit1.SetFocus;
end;

procedure TfContasReceberPag.BitBtn1Click(Sender: TObject);
begin
  if CurrencyEdit4.Value > StrToFloat(FormatFloat('0.00',(DM1.tCReceberParcRestParcela.AsFloat))) then
    ShowMessage('Valor do pagamento não pode ser maior que restante a pagar!')
  else
  if CurrencyEdit4.value <= 0 then
    ShowMessage('Valor de pagamento não pode ser zero!')
  else
  if RxDBLookupCombo2.Text = '' then
    ShowMessage('Conta não pode estar em branco!')
  else
  begin
    vEncComissao := False;
    if (DM1.tCReceberParclkTipoComissao.AsString = 'D') and (DM1.tCReceberParcCodVendedor.AsInteger > 0) and
       (DM1.tCReceberParcPercComissao.AsFloat > 0) then
      DM1.Verifica_ComissaoEnc(DM1.tCReceberParcCodVendedor.AsInteger,DateEdit1.Date);
    if not vEncComissao then
    begin
      if (CurrencyEdit4.value = StrToFloat(FormatFloat('0.00',(DM1.tCReceberParcVlrParcCReceber.AsFloat)))) and
         (CurrencyEdit4.value = StrToFloat(FormatFloat('0.00',(DM1.tCReceberParcRestParcela.AsFloat)))) then
      begin
        Pgto_Total;
        //DM1.tCReceberParc.Locate('NumCReceber;ParcCReceber',VarArrayOf([DM1.tCReceberParcNumCReceber.AsInteger,DM1.tCReceberParcParcCReceber.AsInteger]),[loCaseInsensitive]);
      end
      else
      begin
        Pgto_Parcial;
        //DM1.tCReceberParc.Locate('NumCReceber;ParcCReceber',VarArrayOf([DM1.tCReceberParcNumCReceber.AsInteger,DM1.tCReceberParcParcCReceber.AsInteger]),[loCaseInsensitive]);
      end;
    end;
  end;
end;

procedure TfContasReceberPag.SpeedButton8Click(Sender: TObject);
begin
  if DM1.tUsuarioPlanoCtas.AsBoolean then
  begin
    fPlanoContas := TfPlanoContas.Create(Self);
    fPlanoContas.ShowModal;
    DM1.tPlanoContas.IndexFieldNames := 'Descricao';
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfContasReceberPag.CurrencyEdit2Enter(Sender: TObject);
begin
  DM1.tHistorico.IndexFieldNames := 'Codigo';
end;

procedure TfContasReceberPag.CurrencyEdit2Exit(Sender: TObject);
begin
  if CurrencyEdit2.Value > 0 then
  begin
    DM1.tHistorico.SetKey;
    DM1.tHistoricoCodigo.AsCurrency := CurrencyEdit2.Value;
    if DM1.tHistorico.GotoKey then
      Edit1.Text := DM1.tHistoricoNome.AsString
    else
    begin
      Edit1.Text := '';
      ShowMessage('Histórico não cadastrado!');
      CurrencyEdit2.SetFocus;
    end;
  end
  else
    Edit1.Text := '';
end;

procedure TfContasReceberPag.DBEdit5Exit(Sender: TObject);
var
 vAux: Real;
begin
  vAux := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcAbatimentos.AsFloat - vAbatimento));
  DM1.tCReceberParcRestParcela.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat - vAux));
  CurrencyEdit4.Value := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat));
end;

procedure TfContasReceberPag.DBEdit4Enter(Sender: TObject);
begin
 vDespesa := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcDespesas.AsFloat));
end;

procedure TfContasReceberPag.DBEdit5Enter(Sender: TObject);
begin
 vAbatimento := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcAbatimentos.AsFloat));
end;

procedure TfContasReceberPag.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioHistoricos.AsBoolean then
  begin
    RxDBFilter1.Active := False;
    fHistorico := TfHistorico.Create(Self);
    fHistorico.ShowModal;
    DM1.tHistorico.IndexFieldNames := 'Nome';
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfContasReceberPag.DateEdit1Exit(Sender: TObject);
var
  vJurosDia, vAux: Real;
  vQtdDia: Real;
  vDiaSem: Integer;
  vDataAux: TDateTime;
begin
  CurrencyEdit5.Value := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcJurosParcCReceber.AsFloat - DM1.tCReceberParcJurosPagos.AsFloat));
  if CurrencyEdit5.Value < 0 then
    CurrencyEdit5.Value := 0;
  CurrencyEdit1.Value := CurrencyEdit5.Value;
  vDiaSem := DayOfWeek(DM1.tCReceberParcDtVencCReceber.AsDateTime);
  if (vDiaSem = 1) or (vDiaSem = 7) then
  begin
    if vDiaSem = 7 then
      vDiaSem := 2;
  end
  else
    vDiaSem := 0;
  vDataAux := DM1.tCReceberParcDtVencCReceber.AsDateTime + vDiaSem;

  if (DateEdit1.Date > vDataAux) and
     (DateEdit1.Date > DM1.tCReceberParcDtPagParcCReceber.AsDateTime) then
  begin
    DecodeDate(DateEdit1.Date, Ano, Mes, Dia);
    DM1.tJuros.SetKey;
    DM1.tJurosAno.AsInteger := Ano;
    DM1.tJurosMes.AsInteger := Mes;
    Label19.Visible := False;
    if not DM1.tJuros.GotoKey then
      Label19.Visible := True
    else
    begin
      vJurosDia := DM1.tJurosJuro.AsFloat / 30;
      if DM1.tCReceberParcDtPagParcCReceber.AsDateTime > 0 then
        vQtdDia := DateEdit1.Date - DM1.tCReceberParcDtPagParcCReceber.AsDateTime
      else
        vQtdDia := DateEdit1.Date - DM1.tCReceberParcDtVencCReceber.AsDateTime;
      vAux := (vQtdDia * vJurosDia);
      vAux := StrToFloat(FormatFloat('0.00',((DM1.tCReceberParcRestParcela.AsFloat + CurrencyEdit5.Value) * vAux) / 100));
      vValorJuros:= StrToFloat(FormatFloat('0.00',vAux));
      CurrencyEdit5.Value := StrToFloat(FormatFloat('0.00',CurrencyEdit5.Value + vAux));
      CurrencyEdit1.Value := StrToFloat(FormatFloat('0.00',CurrencyEdit5.Value));
    end;
  end
  else
    vValorJuros := 0;
end;

procedure TfContasReceberPag.CurrencyEdit4Exit(Sender: TObject);
begin
  if CurrencyEdit4.Value > StrToFloat(FormatFloat('0.00',(DM1.tCReceberParcRestParcela.AsFloat))) then
  begin
    CurrencyEdit1.Value := StrToFloat(FormatFloat('0.00',CurrencyEdit4.Value - DM1.tCReceberParcRestParcela.AsCurrency));
    CurrencyEdit4.Value := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsCurrency));
  end;
end;

procedure TfContasReceberPag.RxDBLookupCombo3Enter(Sender: TObject);
begin
  DM1.tPlanoContas.IndexFieldNames := 'Descricao';
end;

procedure TfContasReceberPag.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tHistorico.IndexFieldNames := 'Nome';
end;

procedure TfContasReceberPag.RxDBLookupCombo1Exit(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
  begin
    Edit1.Text := RxDBLookupCombo1.Text;
    CurrencyEdit2.Text := DM1.tHistoricoCodigo.AsString;
  end;
end;

end.

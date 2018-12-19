unit URelSitAtelier;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, DBTables;

type
  TfRelSitAtelier = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRDBText1: TQRDBText;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape2: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape3: TQRShape;
    QuickRep2: TQuickRep;
    PageHeaderBand2: TQRBand;
    QRDBText11: TQRDBText;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape4: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel25: TQRLabel;
    QRSysData4: TQRSysData;
    DetailBand2: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel30: TQRLabel;
    QRDBText16: TQRDBText;
    QRBand1: TQRBand;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRShape10: TQRShape;
    QRLabel40: TQRLabel;
    QRLabel39: TQRLabel;
    QuickRep3: TQuickRep;
    PageHeaderBand3: TQRBand;
    DetailBand3: TQRBand;
    QRDBText21: TQRDBText;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel45: TQRLabel;
    QRSysData5: TQRSysData;
    QRLabel46: TQRLabel;
    QRSysData6: TQRSysData;
    QRShape7: TQRShape;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRShape8: TQRShape;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRBand2: TQRBand;
    QRLabel79: TQRLabel;
    QRShape9: TQRShape;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormShow(Sender: TObject);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure DetailBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeaderBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure DetailBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeaderBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelSitAtelier: TfRelSitAtelier;
  vQtdPendente : Integer;
  vQtdBaixado  : Integer;
  vVlrTotal : Real;

implementation

uses UPrevSitAtelier, UDM1;

{$R *.DFM}

procedure TfRelSitAtelier.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelSitAtelier.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if fPrevSitAtelier.RadioGroup1.ItemIndex = 0 then
    QRLabel2.Caption := 'Pendente'
  else
  if fPrevSitAtelier.RadioGroup1.ItemIndex = 1 then
    QRLabel2.Caption := 'Entregue'
  else
    QRLabel2.Caption := 'Ambos';
  QRLabel56.Caption := fPrevSitAtelier.DateEdit1.Text;
  QRLabel58.Caption := fPrevSitAtelier.DateEdit2.Text;
  QRLabel60.Caption := fPrevSitAtelier.DateEdit3.Text;
  QRLabel62.Caption := fPrevSitAtelier.DateEdit4.Text;
  QRLabel6.Caption := fPrevSitAtelier.RxDBLookupCombo1.Text;
end;

procedure TfRelSitAtelier.FormShow(Sender: TObject);
begin
  vQtdPendente := 0;
  vQtdBaixado  := 0;
  vVlrTotal    := 0;
end;

procedure TfRelSitAtelier.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if fPrevSitAtelier.qSituacaoDataSaida.AsDateTime > 0 then
    vQtdBaixado  := vQtdBaixado + fPrevSitAtelier.qSituacaoQtdPar.AsInteger
  else
    vQtdPendente := vQtdPendente + fPrevSitAtelier.qSituacaoQtdPar.AsInteger;
end;

procedure TfRelSitAtelier.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel17.Caption := FormatFloat('###,###,###,###,##0',vQtdPendente);
  QRLabel19.Caption := FormatFloat('###,###,###,###,##0',vQtdBaixado);
end;

procedure TfRelSitAtelier.SummaryBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  vQtdPendente := 0;
  vQtdBaixado  := 0;
end;

procedure TfRelSitAtelier.DetailBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  DM1.tAtelier.IndexFieldNames := 'Codigo';
  DM1.tAtelier.FindKey([fPrevSitAtelier.RxDBLookupCombo1.KeyValue]);
  if DM1.tAtelierPreco.Locate('CodProduto',fPrevSitAtelier.qReferenciaCodigo.AsInteger,[loCaseInsensitive]) then
    QRLabel39.Caption := FormatFloat('###,###,##0.00',DM1.tAtelierPrecoPreco.AsFloat)
  else
    QRLabel39.Caption := FormatFloat('###,###,##0.00',fPrevSitAtelier.qReferenciaVlrAtelier.AsFloat);
  fPrevSitAtelier.qSituacao.Filtered := False;
  fPrevSitAtelier.qSituacao.Filter   := 'Referencia = '''+fPrevSitAtelier.qReferenciaReferencia.AsString+'''';
  fPrevSitAtelier.qSituacao.Filtered := True;
  fPrevSitAtelier.qSituacao.First;
  if fPrevSitAtelier.qSituacao.RecordCount > 0 then
    PrintBand := True
  else
    PrintBand := False;
end;

procedure TfRelSitAtelier.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if fPrevSitAtelier.qSituacaoDataSaida.AsDateTime > 0 then
    vQtdBaixado  := vQtdBaixado + fPrevSitAtelier.qSituacaoQtdPar.AsInteger
  else
    vQtdPendente := vQtdPendente + fPrevSitAtelier.qSituacaoQtdPar.AsInteger;
end;

procedure TfRelSitAtelier.PageHeaderBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if fPrevSitAtelier.RadioGroup1.ItemIndex = 0 then
    QRLabel23.Caption := 'Pendente'
  else
  if fPrevSitAtelier.RadioGroup1.ItemIndex = 1 then
    QRLabel23.Caption := 'Entregue'
  else
    QRLabel23.Caption := 'Ambos';
  QRLabel65.Caption := fPrevSitAtelier.DateEdit1.Text;
  QRLabel69.Caption := fPrevSitAtelier.DateEdit2.Text;
  QRLabel66.Caption := fPrevSitAtelier.DateEdit3.Text;
  QRLabel70.Caption := fPrevSitAtelier.DateEdit4.Text;
  QRLabel21.Caption := fPrevSitAtelier.RxDBLookupCombo1.Text;
end;

procedure TfRelSitAtelier.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel36.Caption := FormatFloat('###,###,###,###,##0',vQtdPendente);
  QRLabel38.Caption := FormatFloat('###,###,###,###,##0',vQtdBaixado);
  fPrevSitAtelier.qSituacao.Filtered := False;
end;

procedure TfRelSitAtelier.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  vQtdPendente := 0;
  vQtdBaixado  := 0;
end;

procedure TfRelSitAtelier.DetailBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  vVlrPar : Real;
  vQtdPar : Integer;
begin
  DM1.tAtelier.IndexFieldNames := 'Codigo';
  DM1.tAtelier.FindKey([fPrevSitAtelier.RxDBLookupCombo1.KeyValue]);
  if DM1.tAtelierPreco.Locate('CodProduto',fPrevSitAtelier.qReferenciaCodigo.AsInteger,[loCaseInsensitive]) then
    vVlrPar := DM1.tAtelierPrecoPreco.AsFloat
  else
    vVlrPar := fPrevSitAtelier.qReferenciaVlrAtelier.AsFloat;
  vQtdPar   := 0;
  fPrevSitAtelier.qSituacao.Filtered := False;
  fPrevSitAtelier.qSituacao.Filter   := 'Referencia = '''+fPrevSitAtelier.qReferenciaReferencia.AsString+'''';
  fPrevSitAtelier.qSituacao.Filtered := True;
  fPrevSitAtelier.qSituacao.First;
  if fPrevSitAtelier.qSituacao.RecordCount > 0 then
    begin
      PrintBand := True;
      fPrevSitAtelier.qSituacao.First;
      while not fPrevSitAtelier.qSituacao.Eof do
        begin
          vQtdPar := vQtdPar + fPrevSitAtelier.qSituacaoQtdPar.AsInteger;
          fPrevSitAtelier.qSituacao.Next;
        end;
      QRLabel51.Caption := fPrevSitAtelier.qReferenciaReferencia.AsString;
      QRLabel52.Caption := FormatFloat('###,###,###',vQtdPar);
      QRLabel53.Caption := FormatFloat('###,###,##0.00',vVlrPar);
      vVlrPar           := vVlrPar * vQtdPar;
      QRLabel54.Caption := FormatFloat('###,###,##0.00',vVlrPar);
      vVlrTotal         := vVlrTotal + vVlrPar;
    end
  else
    PrintBand := False;
end;

procedure TfRelSitAtelier.PageHeaderBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if fPrevSitAtelier.RadioGroup1.ItemIndex = 0 then
    QRLabel44.Caption := 'Pendente'
  else
  if fPrevSitAtelier.RadioGroup1.ItemIndex = 1 then
    QRLabel44.Caption := 'Entregue'
  else
    QRLabel44.Caption := 'Ambos';
  QRLabel73.Caption := fPrevSitAtelier.DateEdit1.Text;
  QRLabel77.Caption := fPrevSitAtelier.DateEdit2.Text;
  QRLabel74.Caption := fPrevSitAtelier.DateEdit3.Text;
  QRLabel78.Caption := fPrevSitAtelier.DateEdit4.Text;
  QRLabel42.Caption := fPrevSitAtelier.RxDBLookupCombo1.Text;
end;

procedure TfRelSitAtelier.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  vValor : Real;  
begin
  QRLabel80.Caption := FormatFloat('###,###,##0.00',vVlrTotal);
  if fPrevSitAtelier.qPagtos.Locate('CodAtelier',fPrevSitAtelier.RxDBLookupCombo1.KeyValue,[loCaseInsensitive]) then
    begin
      QRLabel82.Caption := FormatFloat('###,###,##0.00',fPrevSitAtelier.qPagtosVlrPagto.AsFloat);
      vValor := vVlrTotal - fPrevSitAtelier.qPagtosVlrPagto.AsFloat;
    end
  else
    begin
      vValor            := vVlrTotal;
      QRLabel82.Caption := '';
    end;
  QRLabel84.Caption := FormatFloat('###,###,##0.00',vValor);
  vVlrTotal := 0;
end;

end.

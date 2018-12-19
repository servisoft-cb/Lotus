unit URelTransfICMS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, DB, DBTables;

type
  TfRelTransfICMS = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRShape2: TQRShape;
    QRLabel6: TQRLabel;
    QRShape5: TQRShape;
    QRLabel9: TQRLabel;
    QRShape6: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape7: TQRShape;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QuickRep2: TQuickRep;
    PageHeaderBand2: TQRBand;
    DetailBand2: TQRBand;
    SummaryBand2: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel15: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel16: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRDBText7: TQRDBText;
    QRShape11: TQRShape;
    QRLabel17: TQRLabel;
    QRShape12: TQRShape;
    QRLabel18: TQRLabel;
    QRShape14: TQRShape;
    QRLabel20: TQRLabel;
    QRShape15: TQRShape;
    QRLabel21: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    ChildBand1: TQRChildBand;
    QRShape16: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape17: TQRShape;
    QRShape1: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape3: TQRShape;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape4: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape18: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape19: TQRShape;
    QRShape13: TQRShape;
    QRLabel19: TQRLabel;
    QRShape20: TQRShape;
    QRLabel27: TQRLabel;
    QRDBText9: TQRDBText;
    QRShape21: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape22: TQRShape;
    QRLabel33: TQRLabel;
    QRDBText4: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeaderBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    vVlrFornecedor, vVlrTotal : Real;
  public
    { Public declarations }
  end;

var
  fRelTransfICMS: TfRelTransfICMS;

implementation

uses UDM1, UPrevTransfICMS;

{$R *.DFM}

procedure TfRelTransfICMS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelTransfICMS.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Case fPrevTransfICMS.RadioGroup1.ItemIndex of
    0 : QRLabel4.Caption := 'De  '+fPrevTransfICMS.DateEdit1.Text+'  até  '+fPrevTransfICMS.DateEdit2.Text+'  -  Todos';
    1 : QRLabel4.Caption := 'De  '+fPrevTransfICMS.DateEdit1.Text+'  até  '+fPrevTransfICMS.DateEdit2.Text+'  -  Pendentes';
    2 : QRLabel4.Caption := 'De  '+fPrevTransfICMS.DateEdit1.Text+'  até  '+fPrevTransfICMS.DateEdit2.Text+'  -  Quitados';
  end;
end;

procedure TfRelTransfICMS.PageHeaderBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Case fPrevTransfICMS.RadioGroup1.ItemIndex of
    0 : QRLabel13.Caption := 'De  '+fPrevTransfICMS.DateEdit1.Text+'  até  '+fPrevTransfICMS.DateEdit2.Text+'  -  Todos';
    1 : QRLabel13.Caption := 'De  '+fPrevTransfICMS.DateEdit1.Text+'  até  '+fPrevTransfICMS.DateEdit2.Text+'  -  Pendentes';
    2 : QRLabel13.Caption := 'De  '+fPrevTransfICMS.DateEdit1.Text+'  até  '+fPrevTransfICMS.DateEdit2.Text+'  -  Quitados';
  end;
end;

procedure TfRelTransfICMS.DetailBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  fPrevTransfICMS.qItensFornec.Close;
  fPrevTransfICMS.qItensFornec.SQL.Clear;
  fPrevTransfICMS.qItensFornec.SQL.Add('SELECT Dbcpagar.CodForn, Dbcpagarparc.DtVencCPagar, Dbcpagarparc.VlrParcCPagar, Dbcpagarparc.NumNotaEnt, ');
  fPrevTransfICMS.qItensFornec.SQL.Add('  Dbcpagarparc.ParcCPagar, Dbcpagarparc.NroDuplicata, dbCPagar.CodNatOper, dbCPagar.DtGerado, dbCPagar.VlrTotal, dbCPagar.DtEmissaoNota');
  fPrevTransfICMS.qItensFornec.SQL.Add('FROM "dbCPagar.DB" Dbcpagar');
  fPrevTransfICMS.qItensFornec.SQL.Add('   INNER JOIN "dbCPagarParc.DB" Dbcpagarparc');
  fPrevTransfICMS.qItensFornec.SQL.Add('   ON  (Dbcpagar.NumCPagar = Dbcpagarparc.NumCPagar)');
  //No dia 21/05/2012 foi alterado da data de entrada para a data de emissão conforme a Joice
  //fPrevTransfICMS.qItensFornec.SQL.Add('WHERE Dbcpagar.DtGerado BETWEEN :D1 AND :D2 AND Dbcpagarparc.CodConta = 10');
  fPrevTransfICMS.qItensFornec.SQL.Add('WHERE Dbcpagar.DtEmissaoNota BETWEEN :D1 AND :D2 AND Dbcpagarparc.CodConta = 10');
  fPrevTransfICMS.qItensFornec.SQL.Add('AND Dbcpagarparc.CodForn = :C1');
  Case fPrevTransfICMS.RadioGroup1.ItemIndex of
    1 : fPrevTransfICMS.qItensFornec.SQL.Add('AND ((Dbcpagarparc.QuitParcCPagar = False) OR (Dbcpagarparc.QuitParcCPagar IS NULL))');
    2 : fPrevTransfICMS.qItensFornec.SQL.Add('AND Dbcpagarparc.QuitParcCPagar = True');
  end;
  fPrevTransfICMS.qItensFornec.Params[0].AsDateTime := fPrevTransfICMS.DateEdit1.Date;
  fPrevTransfICMS.qItensFornec.Params[1].AsDateTime := fPrevTransfICMS.DateEdit2.Date;
  fPrevTransfICMS.qItensFornec.Params[2].AsInteger  := fPrevTransfICMS.qFornecedoresCodForn.AsInteger;
  fPrevTransfICMS.qItensFornec.SQL.Add('ORDER BY Dbcpagarparc.DtVencCPagar, Dbcpagarparc.NumNotaEnt, Dbcpagarparc.ParcCPagar');
  fPrevTransfICMS.qItensFornec.Open;
  fPrevTransfICMS.qItensFornec.First;
end;

procedure TfRelTransfICMS.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  vAux : Real;
begin
  QRLabel24.Caption := '';
  if fPrevTransfICMS.qParcelasVlrTotal.AsFloat > 0 then
    begin
      vAux := StrToFloat(FormatFloat('0.00',(fPrevTransfICMS.qParcelasVlrParcCPagar.AsFloat / fPrevTransfICMS.qParcelasVlrTotal.AsFloat) * 100));
      QRLabel24.Caption := FormatFloat('###,###,##0.00',vAux);
    end;
  if DM1.tNatOperacao.Locate('Codigo',fPrevTransfICMS.qParcelasCodNatOper.AsInteger,[loCaseInsensitive]) then
    QRLabel26.Caption := DM1.tNatOperacaoCodNatOper.AsString
  else
    QRLabel26.Caption := '';
end;

procedure TfRelTransfICMS.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  vAux : Real;
begin
  QRLabel29.Caption := '';
  if fPrevTransfICMS.qItensFornecVlrTotal.AsFloat > 0 then
    begin
      vAux := StrToFloat(FormatFloat('0.00',(fPrevTransfICMS.qItensFornecVlrParcCPagar.AsFloat / fPrevTransfICMS.qItensFornecVlrTotal.AsFloat) * 100));
      QRLabel29.Caption := FormatFloat('###,###,##0.00',vAux);
    end;
  if DM1.tNatOperacao.Locate('Codigo',fPrevTransfICMS.qItensFornecCodNatOper.AsInteger,[loCaseInsensitive]) then
    QRLabel30.Caption := DM1.tNatOperacaoCodNatOper.AsString
  else
    QRLabel30.Caption := '';
  vVlrFornecedor := vVlrFornecedor + fPrevTransfICMS.qItensFornecVlrParcCPagar.AsFloat;
  vVlrTotal      := vVlrTotal + fPrevTransfICMS.qItensFornecVlrParcCPagar.AsFloat;
end;

procedure TfRelTransfICMS.FormCreate(Sender: TObject);
begin
  vVlrFornecedor := 0;
  vVlrTotal      := 0;                  
end;

procedure TfRelTransfICMS.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel31.Caption := FormatFloat('###,###,###,##0.00',vVlrFornecedor);
  vVlrFornecedor    := 0;
end;

procedure TfRelTransfICMS.SummaryBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel32.Caption := FormatFloat('###,###,###,##0.00',vVlrTotal);
  vVlrTotal         := 0;
end;

end.


unit URelAcumFab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, RLReport;

type
  TfRelAcumFab = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    DetailBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape1: TQRShape;
    QRLabel11: TQRLabel;
    QRShape2: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRDBText9: TQRDBText;
    SummaryBand1: TQRBand;
    QRShape16: TQRShape;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel48: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel47: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLDBText1: TRLDBText;
    RLDraw2: TRLDraw;
    RLDraw3: TRLDraw;
    RLDraw4: TRLDraw;
    RLDraw5: TRLDraw;
    RLDraw6: TRLDraw;
    RLDraw7: TRLDraw;
    RLDraw8: TRLDraw;
    RLDraw9: TRLDraw;
    RLLabel11: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLDetailGrid1: TRLDetailGrid;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDraw1: TRLDraw;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelAcumFab: TfRelAcumFab;

implementation

uses UDM1, UPrevRelAcumFab;

{$R *.DFM}

procedure TfRelAcumFab.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  {if fPrevRelAcumFab.DateEdit1.Text = fPrevRelAcumFab.DateEdit2.Text then
    QRLabel1.Caption := 'Rel. Acumulado por Dia - ' + fPrevRelAcumFab.DateEdit1.Text
  else
    QRLabel1.Caption := 'Rel. Acumulado por Mês - ' + fPrevRelAcumFab.DateEdit1.Text + ' a ' + fPrevRelAcumFab.DateEdit2.Text;
  QRLabel6.Caption := fPrevRelAcumFab.RxDBLookupCombo1.Text;
  QRLabel7.Caption := fPrevRelAcumFab.RxDBLookupCombo2.Text;
  QRLabel8.Caption := fPrevRelAcumFab.RxDBLookupCombo3.Text;
  QRLabel9.Caption := fPrevRelAcumFab.RxDBLookupCombo4.Text;}
end;

procedure TfRelAcumFab.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelAcumFab.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if fPrevRelAcumFab.DateEdit1.Text = fPrevRelAcumFab.DateEdit2.Text then
    RLLabel1.Caption := 'Rel. Acumulado por Dia - ' + fPrevRelAcumFab.DateEdit1.Text
  else
    RLLabel1.Caption := 'Rel. Acumulado por Mês - ' + fPrevRelAcumFab.DateEdit1.Text + ' a ' + fPrevRelAcumFab.DateEdit2.Text;
  RLLabel16.Caption := fPrevRelAcumFab.RxDBLookupCombo1.Text;
  RLLabel17.Caption := fPrevRelAcumFab.RxDBLookupCombo2.Text;
  RLLabel18.Caption := fPrevRelAcumFab.RxDBLookupCombo3.Text;
  RLLabel19.Caption := fPrevRelAcumFab.RxDBLookupCombo4.Text;

end;

end.

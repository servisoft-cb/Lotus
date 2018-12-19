unit URelOS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TfRelOS = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRShape4: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    QRDBText7: TQRDBText;
    QRShape6: TQRShape;
    QRLabel7: TQRLabel;
    QRShape7: TQRShape;
    QRLabel8: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QST1: TQRShape;
    Tam1: TQRLabel;
    QSQ1: TQRShape;
    Qtd1: TQRLabel;
    QSQ2: TQRShape;
    Qtd2: TQRLabel;
    QST2: TQRShape;
    Tam2: TQRLabel;
    QST3: TQRShape;
    Tam3: TQRLabel;
    QSQ3: TQRShape;
    Qtd3: TQRLabel;
    QST4: TQRShape;
    Tam4: TQRLabel;
    QSQ4: TQRShape;
    Qtd4: TQRLabel;
    QSQ5: TQRShape;
    Qtd5: TQRLabel;
    QST5: TQRShape;
    Tam5: TQRLabel;
    QSQ6: TQRShape;
    Qtd6: TQRLabel;
    QST6: TQRShape;
    Tam6: TQRLabel;
    QSQ7: TQRShape;
    Qtd7: TQRLabel;
    QST7: TQRShape;
    Tam7: TQRLabel;
    QST8: TQRShape;
    Tam8: TQRLabel;
    QSQ8: TQRShape;
    Qtd8: TQRLabel;
    QSQ9: TQRShape;
    Qtd9: TQRLabel;
    QST9: TQRShape;
    Tam9: TQRLabel;
    QSQ10: TQRShape;
    Qtd10: TQRLabel;
    QST10: TQRShape;
    Tam10: TQRLabel;
    QSQ11: TQRShape;
    Qtd11: TQRLabel;
    QST11: TQRShape;
    Tam11: TQRLabel;
    QSQ12: TQRShape;
    Qtd12: TQRLabel;
    QST12: TQRShape;
    Tam12: TQRLabel;
    QSQ13: TQRShape;
    Qtd13: TQRLabel;
    QST13: TQRShape;
    Tam13: TQRLabel;
    QST: TQRShape;
    Tam: TQRLabel;
    QSQ: TQRShape;
    Qtd: TQRLabel;
    QRShape10: TQRShape;
    QST14: TQRShape;
    Tam14: TQRLabel;
    QSQ14: TQRShape;
    Qtd14: TQRLabel;
    QSQ15: TQRShape;
    Qtd15: TQRLabel;
    QST15: TQRShape;
    Tam15: TQRLabel;
    QST16: TQRShape;
    Tam16: TQRLabel;
    QSQ16: TQRShape;
    Qtd16: TQRLabel;
    QST17: TQRShape;
    Tam17: TQRLabel;
    QSQ17: TQRShape;
    Qtd17: TQRLabel;
    QSQ18: TQRShape;
    Qtd18: TQRLabel;
    QST18: TQRShape;
    Tam18: TQRLabel;
    QSQ19: TQRShape;
    Qtd19: TQRLabel;
    QST19: TQRShape;
    Tam19: TQRLabel;
    QSQ20: TQRShape;
    Qtd20: TQRLabel;
    QST20: TQRShape;
    Tam20: TQRLabel;
    QST21: TQRShape;
    Tam21: TQRLabel;
    QSQ21: TQRShape;
    Qtd21: TQRLabel;
    QSQ22: TQRShape;
    Qtd22: TQRLabel;
    QST22: TQRShape;
    Tam22: TQRLabel;
    QSQ23: TQRShape;
    Qtd23: TQRLabel;
    QST23: TQRShape;
    Tam23: TQRLabel;
    QSQ24: TQRShape;
    Qtd24: TQRLabel;
    QST24: TQRShape;
    Tam24: TQRLabel;
    QSQ25: TQRShape;
    Qtd25: TQRLabel;
    QST25: TQRShape;
    Tam25: TQRLabel;
    QSQ26: TQRShape;
    Qtd26: TQRLabel;
    QST26: TQRShape;
    Tam26: TQRLabel;
    QSTB: TQRShape;
    TamB: TQRLabel;
    QSQB: TQRShape;
    QtdB: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText12: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelOS: TfRelOS;

implementation

uses UDM1, UOS;

{$R *.DFM}

procedure TfRelOS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelOS.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i : Integer;
begin
  QSTB.Enabled := False;
  QSQB.Enabled := False;
  TamB.Enabled := False;
  QtdB.Enabled := False;

  for i := 1 to 26 do
    begin
      TQRLabel(FindComponent('Tam'+IntToStr(i))).Enabled := False;
      TQRLabel(FindComponent('Qtd'+IntToStr(i))).Enabled := False;
      TQRShape(FindComponent('QST'+IntToStr(i))).Enabled := False;
      TQRShape(FindComponent('QSQ'+IntToStr(i))).Enabled := False;
    end;
  if DM1.tOSGrade.IsEmpty then
    begin
      QSQ.Enabled := False;
      QST.Enabled := False;
      Tam.Enabled := False;
      Qtd.Enabled := False;
    end
  else
    begin
      QSQ.Enabled := True;
      QST.Enabled := True;
      Tam.Enabled := True;
      Qtd.Enabled := True;
    end;
  i := 0;
  DM1.tOSGrade.First;
  while not DM1.tOSGrade.Eof do
    begin
      inc(i);
      TQRLabel(FindComponent('Tam'+IntToStr(i))).Enabled := True;
      TQRLabel(FindComponent('Tam'+IntToStr(i))).Caption := DM1.tOSGradeTamanho.AsString;
      TQRLabel(FindComponent('Qtd'+IntToStr(i))).Enabled := True;
      TQRLabel(FindComponent('Qtd'+IntToStr(i))).Caption := DM1.tOSGradeQtde.AsString;
      TQRShape(FindComponent('QST'+IntToStr(i))).Enabled := True;
      TQRShape(FindComponent('QSQ'+IntToStr(i))).Enabled := True;
      DM1.tOSGrade.Next;
    end;
  if i > 13 then
    begin
      QSQB.Enabled := True;
      QSTB.Enabled := True;
      TamB.Enabled := True;
      QtdB.Enabled := True;
    end;
end;

end.

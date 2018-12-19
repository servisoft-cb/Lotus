unit URelComprovante;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, quickrpt, Qrctrls, DBFilter;

type
  TfRelComprovante = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    QRShape11: TQRShape;
    QRLabel14: TQRLabel;
    QRShape12: TQRShape;
    QRExpr1: TQRExpr;
    QRShape13: TQRShape;
    QRLabel15: TQRLabel;
    QRShape14: TQRShape;
    QRExpr2: TQRExpr;
    QRShape15: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape16: TQRShape;
    QRDBText4: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText5: TQRDBText;
    QRShape9: TQRShape;
    QRLabel13: TQRLabel;
    QRShape10: TQRShape;
    QRShape8: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRShape4: TQRShape;
    QRLabel5: TQRLabel;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel8: TQRLabel;
    QRShape17: TQRShape;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelComprovante: TfRelComprovante;
  QtdTotal : Real;

implementation

Uses UPrevRelComprovante, UDM1;

{$R *.DFM}

procedure TfRelComprovante.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelComprovante.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  Qtd : Real;
begin
  Qtd := 0;
  fPrevRelComprovante.tItensNotaFiscal.First;
  while not fPrevRelComprovante.tItensNotaFiscal.EOF do
    begin
      Qtd := Qtd + fPrevRelComprovante.tItensNotaFiscalQtd.AsFloat;
      fPrevRelComprovante.tItensNotaFiscal.Next;
    end;
  QtdTotal := QtdTotal + Qtd;
  QRLabel10.Caption := FloatToStr(Qtd);
  QRLabel17.Caption := FloatToStr(QtdTotal);
  QtdTotal := 0;
end;

end.

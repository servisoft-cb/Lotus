unit URelPrevisaoOC2;

interface
                        
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TfRelPrevisaoOC2 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRDBText7: TQRDBText;
    QRLabel13: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel14: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel15: TQRLabel;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure QRDBText13Print(sender: TObject; var Value: String);
    procedure QRDBText14Print(sender: TObject; var Value: String);
    procedure QRDBText15Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelPrevisaoOC2: TfRelPrevisaoOC2;

implementation

uses UPrevPrevisaoOC;

{$R *.DFM}

procedure TfRelPrevisaoOC2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelPrevisaoOC2.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if fPrevPrevisaoOC.mSemanaValor1.AsFloat = 0 then
    Value := '';
end;

procedure TfRelPrevisaoOC2.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  if fPrevPrevisaoOC.mSemanaValor2.AsFloat = 0 then
    Value := '';
end;

procedure TfRelPrevisaoOC2.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  if fPrevPrevisaoOC.mSemanaValor3.AsFloat = 0 then
    Value := '';
end;

procedure TfRelPrevisaoOC2.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  if fPrevPrevisaoOC.mSemanaValor4.AsFloat = 0 then
    Value := '';
end;

procedure TfRelPrevisaoOC2.QRDBText13Print(sender: TObject;
  var Value: String);
begin
  if fPrevPrevisaoOC.mSemanaValor5.AsFloat = 0 then
    Value := '';
end;

procedure TfRelPrevisaoOC2.QRDBText14Print(sender: TObject;
  var Value: String);
begin
  if fPrevPrevisaoOC.mSemanaValor6.AsFloat = 0 then
    Value := '';
end;

procedure TfRelPrevisaoOC2.QRDBText15Print(sender: TObject;
  var Value: String);
begin
  if fPrevPrevisaoOC.mSemanaValor7.AsFloat = 0 then
    Value := '';
end;

end.

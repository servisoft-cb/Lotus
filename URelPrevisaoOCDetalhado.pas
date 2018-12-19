unit URelPrevisaoOCDetalhado;

interface
                        
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TfRelPrevisaoOCDetalhado = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRDBText7: TQRDBText;
    QRLabel13: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel14: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel15: TQRLabel;
    DetailBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel9: TQRLabel;
    QRShape1: TQRShape;
    QRDBText10: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure QRDBText13Print(sender: TObject; var Value: String);
    procedure QRDBText14Print(sender: TObject; var Value: String);
    procedure QRDBText15Print(sender: TObject; var Value: String);
    procedure QRDBText16Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelPrevisaoOCDetalhado: TfRelPrevisaoOCDetalhado;

implementation

uses UPrevPrevisaoOC;

{$R *.DFM}

procedure TfRelPrevisaoOCDetalhado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelPrevisaoOCDetalhado.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if fPrevPrevisaoOC.mSemanaValor1.AsFloat = 0 then
    Value := '';
end;

procedure TfRelPrevisaoOCDetalhado.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  if fPrevPrevisaoOC.mSemanaValor2.AsFloat = 0 then
    Value := '';
end;

procedure TfRelPrevisaoOCDetalhado.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  if fPrevPrevisaoOC.mSemanaValor3.AsFloat = 0 then
    Value := '';
end;

procedure TfRelPrevisaoOCDetalhado.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  if fPrevPrevisaoOC.mSemanaValor4.AsFloat = 0 then
    Value := '';
end;

procedure TfRelPrevisaoOCDetalhado.QRDBText13Print(sender: TObject;
  var Value: String);
begin
  if fPrevPrevisaoOC.mSemanaValor5.AsFloat = 0 then
    Value := '';
end;

procedure TfRelPrevisaoOCDetalhado.QRDBText14Print(sender: TObject;
  var Value: String);
begin
  if fPrevPrevisaoOC.mSemanaValor6.AsFloat = 0 then
    Value := '';
end;

procedure TfRelPrevisaoOCDetalhado.QRDBText15Print(sender: TObject;
  var Value: String);
begin
  if fPrevPrevisaoOC.mSemanaValor7.AsFloat = 0 then
    Value := '';
end;

procedure TfRelPrevisaoOCDetalhado.QRDBText16Print(sender: TObject;
  var Value: String);
begin
  if (fPrevPrevisaoOC.mSemanaTotal.AsFloat = 0) or ( (fPrevPrevisaoOC.mSemanaTotal.AsFloat <> 0) and (not fPrevPrevisaoOC.CheckBox1.Checked) ) then
    Value := '';
end;

end.

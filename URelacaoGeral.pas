unit URelacaoGeral;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TfRelacaoGeral = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape1: TQRShape;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelacaoGeral: TfRelacaoGeral;

implementation

uses UDM1;

{$R *.DFM}

procedure TfRelacaoGeral.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfRelacaoGeral.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  Texto1 : String;
begin
  QRLabel4.Caption := '  Contato: ' + DM1.tRelacaoGeralContato1.AsString;
  if DM1.tRelacaoGeralContato2.AsString <> '' then
    QRLabel4.Caption := QRLabel4.Caption + ' / ' + DM1.tRelacaoGeralContato2.AsString;
  Texto1 := QrLabel4.Caption;
  if DM1.tRelacaoGeralContato3.AsString <> '' then
    begin
      QRLabel4.Caption := QRLabel4.Caption + ' / ' + DM1.tRelacaoGeralContato3.AsString;
      if QRLabel4.Width > 724 then
        begin
          QRLabel4.Caption   := Texto1;
          QRLabel9.Caption   := '           ' + DM1.tRelacaoGeralContato3.AsString;
          DetailBand1.Height := 62;
          QRShape1.Top       := 58;
        end
      else
        begin
          DetailBand1.Height := 41;
          QRShape1.Top       := 38;
          QRLabel9.Caption   := '';
        end;
    end
  else
    begin
      DetailBand1.Height := 41;
      QRShape1.Top       := 38;
      QRLabel9.Caption   := '';
    end;
end;

end.

unit URelEtiqCx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Barcode, Qrctrls, QuickRpt, ExtCtrls;

type
  TfRelEtiqCx = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRShape1: TQRShape;
    QRImage1: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRImage2: TQRImage;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    Barcode1: TBarcode;
    QRDBText3: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelEtiqCx: TfRelEtiqCx;

implementation

uses UDM1, UDM2, UEtiqCx;

{$R *.DFM}

procedure TfRelEtiqCx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelEtiqCx.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel1.Caption := fEtiqCx.mEtiquetaMaterial.AsString + ' '+ fEtiqCx.mEtiquetalkCor.AsString;
  QRLabel6.Caption := fEtiqCx.mEtiquetaLote.AsString + '/' + fEtiqCx.mEtiquetaPedido.AsString + '/'+ fEtiqCx.mEtiquetaItem.AsString;
  QRLabel7.Caption := fEtiqCx.mEtiquetaCodProduto.AsString + fEtiqCx.mEtiquetaCodCor.AsString + fEtiqCx.mEtiquetaTamanho.AsString;
  QRImage1.Picture := nil;
  QRImage2.Picture := nil;
  QRImage1.Picture.LoadFromFile(fEtiqCx.mEtiquetaEndEtiqueta.AsString);
  Barcode1.Text := QRLabel7.Caption;
  Barcode1.DrawBarcode(QRImage2.Canvas);
end;

end.

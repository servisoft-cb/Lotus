unit URelLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, JPEG, DB, DBTables;

type
  TfRelLote = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape1: TQRShape;
    QRImage1: TQRImage;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelLote: TfRelLote;

implementation

uses UDM1, UConsLote;

{$R *.DFM}

procedure Le_Imagem_JPEG(Campo:TBlobField;Foto:TQRImage);
var
  BS : TBlobStream;
  MinhaImagem : TJPEGImage;
begin
  if Campo.AsString <> '' then
    begin
      BS := TBlobStream.Create((Campo as TBlobField), BMRead);
      MinhaImagem := TJPEGImage.Create;
      MinhaImagem.LoadFromStream(BS);
      Foto.Picture.Assign(MinhaImagem);
      BS.Free;
      MinhaImagem.Free;
    end
  else
    Foto.Picture.LoadFromFile('C:\');
end;

procedure TfRelLote.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelLote.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  vExiste : Boolean;

begin
  QRImage1.Picture := nil;
  vExiste          := False;
  if fConsLote.RadioGroup2.ItemIndex = 0 then
    vExiste := (DM1.tProduto.Locate('Referencia',fConsLote.mLoteReferencia.AsString,[loCaseInsensitive]))
  else
    vExiste := (DM1.tProduto.Locate('NomeModelo',fConsLote.mLoteReferencia.AsString,[loCaseInsensitive]));
  if vExiste then
  begin
    if FileExists(DM1.tProdutoEndFoto.AsString) then
      QRImage1.Picture.LoadFromFile(DM1.tProdutoEndFoto.AsString)
    else
    if not DM1.tProdutoFotoJpeg.IsNull then
      Le_Imagem_JPEG(DM1.tProdutoFotoJpeg,QRImage1);
  end;
end;

procedure TfRelLote.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if fConsLote.CheckBox1.Checked then
    QRLabel6.Caption := IntToStr(fConsLote.vQtdParesLote)
  else
    QRLabel6.Caption := DM1.tLoteMIQtdPares.AsString;
end;

end.

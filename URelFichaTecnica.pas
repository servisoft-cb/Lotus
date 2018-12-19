unit URelFichaTecnica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, StdCtrls;

type
  TfRelFichaTecnica = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRShape1: TQRShape;
    QRImage1: TQRImage;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText24: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText25: TQRDBText;
    QRSubDetail2: TQRSubDetail;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText33: TQRDBText;
    QRShape3: TQRShape;
    QRLabel28: TQRLabel;
    QRShape4: TQRShape;
    QRLabel29: TQRLabel;
    QRShape6: TQRShape;
    QRLabel31: TQRLabel;
    QRShape7: TQRShape;
    QRLabel32: TQRLabel;
    QRShape10: TQRShape;
    QRLabel35: TQRLabel;
    QRShape2: TQRShape;
    QRLabel27: TQRLabel;
    QRShape11: TQRShape;
    QRLabel36: TQRLabel;
    QRDBText34: TQRDBText;
    QRShape12: TQRShape;
    QRLabel37: TQRLabel;
    QRDBText35: TQRDBText;
    QRShape5: TQRShape;
    QRLabel30: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText31: TQRDBText;
    QRShape8: TQRShape;
    QRLabel34: TQRLabel;
    Tam1: TQRLabel;
    Tam2: TQRLabel;
    Tam3: TQRLabel;
    Tam4: TQRLabel;
    Tam5: TQRLabel;
    Tam6: TQRLabel;
    Tam7: TQRLabel;
    Tam8: TQRLabel;
    Tam9: TQRLabel;
    Tam10: TQRLabel;
    Tam11: TQRLabel;
    Tam12: TQRLabel;
    Tam13: TQRLabel;
    Tam14: TQRLabel;
    Tam15: TQRLabel;
    Tam16: TQRLabel;
    Tam17: TQRLabel;
    Tam18: TQRLabel;
    Tam19: TQRLabel;
    Tam20: TQRLabel;
    Tam21: TQRLabel;
    Tam22: TQRLabel;
    Tam23: TQRLabel;
    Tam24: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelFichaTecnica: TfRelFichaTecnica;

implementation

uses UDM1, UProduto;

{$R *.DFM}

procedure TfRelFichaTecnica.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelFichaTecnica.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//  aqui colocar esquema de fotos
  //QRImage1.Picture := fProduto.Image1.Picture;
  if (FileExists(DM1.tProdutoEndFoto.AsString)) then
    QRImage1.Picture.LoadFromFile(DM1.tProdutoEndFoto.AsString)
  else
    QRImage1.Picture := nil;
end;

procedure TfRelFichaTecnica.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  var posicao : integer;
begin
  for posicao := 1 to 24 do
    begin
      TQRLabel(FindComponent('Tam'+IntToStr(Posicao))).Enabled := False;
    end;

  DM1.tProdutoTam.First;
  Posicao := 0;
  while not DM1.tProdutoTam.EOF do
    begin
      Inc(Posicao);
      if Posicao <= 24 then
      begin
        TQRLabel(FindComponent('Tam' + IntToStr(Posicao))).Enabled  := True;
        TQRLabel(FindComponent('Tam' + IntToStr(Posicao))).Caption  := DM1.tProdutoTamTam.AsString;
      end;
      DM1.tProdutoTam.Next;
    end;

end;

end.

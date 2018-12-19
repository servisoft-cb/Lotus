unit URelTalao2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, StdCtrls, Barcode, Db, DBTables, JPEG,
  Grids, DBGrids;

type
  TfRelTalao2 = class(TForm)
    QuickRep1: TQuickRep;
    Barcode1: TBarcode;
    QuickRep2: TQuickRep;
    DetailBand2: TQRBand;
    QRDBText48: TQRDBText;
    QRLabel62: TQRLabel;
    QRDBText49: TQRDBText;
    QRLabel63: TQRLabel;
    QRDBText50: TQRDBText;
    QRLabel64: TQRLabel;
    QRDBText51: TQRDBText;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRDBText53: TQRDBText;
    QRLabel67: TQRLabel;
    QRDBText54: TQRDBText;
    QRLabel68: TQRLabel;
    QRDBText55: TQRDBText;
    QRLabel69: TQRLabel;
    QRDBText56: TQRDBText;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRDBText57: TQRDBText;
    QRLabel72: TQRLabel;
    QRShape10: TQRShape;
    QRLabel73: TQRLabel;
    QRDBRichText1: TQRDBRichText;
    QRChildBand1: TQRChildBand;
    QRShape11: TQRShape;
    Tam1: TQRLabel;
    QRShape12: TQRShape;
    Tam2: TQRLabel;
    QRShape13: TQRShape;
    Tam3: TQRLabel;
    QRShape14: TQRShape;
    Tam4: TQRLabel;
    QRShape15: TQRShape;
    Tam5: TQRLabel;
    QRShape16: TQRShape;
    Tam6: TQRLabel;
    QRShape17: TQRShape;
    Tam7: TQRLabel;
    QRShape18: TQRShape;
    Tam8: TQRLabel;
    QRShape19: TQRShape;
    Tam9: TQRLabel;
    QRShape20: TQRShape;
    Tam10: TQRLabel;
    QRShape21: TQRShape;
    Tam11: TQRLabel;
    QRShape22: TQRShape;
    Tam12: TQRLabel;
    QRShape23: TQRShape;
    Tam13: TQRLabel;
    QRShape24: TQRShape;
    Tam14: TQRLabel;
    Par1: TQRLabel;
    QRShape25: TQRShape;
    Par2: TQRLabel;
    QRShape26: TQRShape;
    Par3: TQRLabel;
    QRShape27: TQRShape;
    Par4: TQRLabel;
    QRShape28: TQRShape;
    Par5: TQRLabel;
    QRShape29: TQRShape;
    Par6: TQRLabel;
    QRShape30: TQRShape;
    Par7: TQRLabel;
    QRShape31: TQRShape;
    Par8: TQRLabel;
    QRShape32: TQRShape;
    Par9: TQRLabel;
    QRShape33: TQRShape;
    Par10: TQRLabel;
    QRShape34: TQRShape;
    Par11: TQRLabel;
    QRShape35: TQRShape;
    Par12: TQRLabel;
    QRShape36: TQRShape;
    Par13: TQRLabel;
    QRShape37: TQRShape;
    Par14: TQRLabel;
    QRShape38: TQRShape;
    QRLabel74: TQRLabel;
    QRDBText58: TQRDBText;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRShape86: TQRShape;
    QRShape87: TQRShape;
    QRShape88: TQRShape;
    QRShape89: TQRShape;
    QRShape90: TQRShape;
    QRShape91: TQRShape;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRShape97: TQRShape;
    QRShape98: TQRShape;
    QRShape99: TQRShape;
    QRShape100: TQRShape;
    QRShape101: TQRShape;
    QRShape102: TQRShape;
    QRShape103: TQRShape;
    QRShape104: TQRShape;
    QRShape105: TQRShape;
    QRShape106: TQRShape;
    QRShape107: TQRShape;
    QRShape108: TQRShape;
    QRShape109: TQRShape;
    QRShape110: TQRShape;
    QRShape111: TQRShape;
    QRShape112: TQRShape;
    QRShape113: TQRShape;
    QRShape114: TQRShape;
    QRShape115: TQRShape;
    QRShape116: TQRShape;
    QRShape117: TQRShape;
    QRShape118: TQRShape;
    QRShape119: TQRShape;
    QRShape120: TQRShape;
    QRShape121: TQRShape;
    QRShape122: TQRShape;
    QRShape123: TQRShape;
    QRShape124: TQRShape;
    QRShape125: TQRShape;
    QRShape126: TQRShape;
    QRShape127: TQRShape;
    QRShape128: TQRShape;
    QRShape129: TQRShape;
    QRShape130: TQRShape;
    QRShape131: TQRShape;
    QRShape132: TQRShape;
    QRShape133: TQRShape;
    QRShape134: TQRShape;
    QRShape135: TQRShape;
    QRShape136: TQRShape;
    qTalaoGrade: TQuery;
    qTalaoGradetamanho: TStringField;
    qTalaoGradeQtdPar: TFloatField;
    QRDBText59: TQRDBText;
    QRDBText60: TQRDBText;
    QRImage8: TQRImage;
    QRLabel75: TQRLabel;
    QRDBText61: TQRDBText;
    QRLabel76: TQRLabel;
    QRImage9: TQRImage;
    QRLabel77: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel53: TQRLabel;
    QRLabel78: TQRLabel;
    qTalaoGradePosicao: TIntegerField;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRDBText72: TQRDBText;
    QRLabel91: TQRLabel;
    QRDBText81: TQRDBText;
    QuickRep3: TQuickRep;
    QRSubDetail2: TQRSubDetail;
    QRDBText82: TQRDBText;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRDBText83: TQRDBText;
    QRDBText84: TQRDBText;
    QRDBText85: TQRDBText;
    QRDBText86: TQRDBText;
    QRDBText87: TQRDBText;
    QRDBText88: TQRDBText;
    QRDBText89: TQRDBText;
    QRDBText90: TQRDBText;
    QRShape142: TQRShape;
    QRShape143: TQRShape;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRDBText91: TQRDBText;
    QRDBText92: TQRDBText;
    QRLabel152: TQRLabel;
    QRDBText134: TQRDBText;
    QRLabel153: TQRLabel;
    QRDBText136: TQRDBText;
    QRLabel161: TQRLabel;
    QRDBText144: TQRDBText;
    QRShape137: TQRShape;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRSubDetail3: TQRSubDetail;
    QRSubDetail1: TQRSubDetail;
    QRDBText5: TQRDBText;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel48: TQRLabel;
    QRShape8: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRLabel54: TQRLabel;
    QRShape9: TQRShape;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRLabel61: TQRLabel;
    QRImage2: TQRImage;
    QRImage3: TQRImage;
    QRImage4: TQRImage;
    QRImage5: TQRImage;
    QRImage6: TQRImage;
    QRImage7: TQRImage;
    QRImage1: TQRImage;
    QRLabel79: TQRLabel;
    QRDBText63: TQRDBText;
    QRDBText64: TQRDBText;
    QRDBText65: TQRDBText;
    QRDBText66: TQRDBText;
    QRDBText67: TQRDBText;
    QRDBText68: TQRDBText;
    QRDBText69: TQRDBText;
    QRDBText70: TQRDBText;
    QRLabel82: TQRLabel;
    QRDBText71: TQRDBText;
    QRLabel83: TQRLabel;
    QRDBText73: TQRDBText;
    QRLabel84: TQRLabel;
    QRDBText74: TQRDBText;
    QRLabel85: TQRLabel;
    QRDBText75: TQRDBText;
    QRLabel86: TQRLabel;
    QRDBText76: TQRDBText;
    QRLabel87: TQRLabel;
    QRDBText77: TQRDBText;
    QRLabel88: TQRLabel;
    QRDBText78: TQRDBText;
    QRLabel89: TQRLabel;
    QRDBText79: TQRDBText;
    QRLabel90: TQRLabel;
    QRDBText80: TQRDBText;
    QRShape138: TQRShape;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel110: TQRLabel;
    QRDBText52: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText93: TQRDBText;
    QRDBText94: TQRDBText;
    QRDBText95: TQRDBText;
    QRLabel111: TQRLabel;
    QRImage10: TQRImage;
    QRDBText96: TQRDBText;
    QRLabel112: TQRLabel;
    QRDBText97: TQRDBText;
    QRShape139: TQRShape;
    QRLabel113: TQRLabel;
    QRDBText98: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
     procedure Mostra_Setores;
  public
    { Public declarations }
  end;

var
  fRelTalao2: TfRelTalao2;
  vCodSetor: array [1..8] of integer;

implementation

uses UDM1;

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

procedure TfRelTalao2.Mostra_Setores;
begin
  if DM1.tLoteSetorItem.AsInteger = 1 then
    begin
      QRShape9.Enabled   := True;
      QRLabel55.Enabled  := True;
      QRLabel56.Enabled  := True;
      QRLabel57.Enabled  := True;
      QRLabel58.Enabled  := True;
      QRLabel59.Enabled  := True;
      QRLabel60.Enabled  := True;
      QRLabel61.Enabled  := True;
      QRLabel83.Enabled  := True;
      QRImage7.Enabled   := True;
      QRDBText43.Enabled := True;
      QRDBText44.Enabled := True;
      QRDBText45.Enabled := True;
      QRDBText46.Enabled := True;
      QRDBText47.Enabled := True;
      QRDBText70.Enabled := True;
      QRDBText73.Enabled := True;
    end
  else
  if DM1.tLoteSetorItem.AsInteger = 2 then
    begin
      QRShape8.Enabled  := True;
      QRLabel1.Enabled  := True;
      QRLabel43.Enabled := True;
      QRLabel44.Enabled := True;
      QRLabel45.Enabled := True;
      QRLabel46.Enabled := True;
      QRLabel47.Enabled := True;
      QRLabel54.Enabled := True;
      QRLabel89.Enabled := True;
      QRImage6.Enabled  := True;
      QRDBText38.Enabled := True;
      QRDBText39.Enabled := True;
      QRDBText40.Enabled := True;
      QRDBText41.Enabled := True;
      QRDBText42.Enabled := True;
      QRDBText68.Enabled := True;
      QRDBText79.Enabled := True;
    end
  else
  if DM1.tLoteSetorItem.AsInteger = 3 then
    begin
      QRShape7.Enabled  := True;
      QRLabel17.Enabled  := True;
      QRLabel38.Enabled := True;
      QRLabel39.Enabled := True;
      QRLabel40.Enabled := True;
      QRLabel41.Enabled := True;
      QRLabel42.Enabled := True;
      QRLabel52.Enabled := True;
      QRLabel88.Enabled := True;
      QRImage5.Enabled  := True;
      QRDBText32.Enabled := True;
      QRDBText33.Enabled := True;
      QRDBText34.Enabled := True;
      QRDBText35.Enabled := True;
      QRDBText36.Enabled := True;
      QRDBText67.Enabled := True;
      QRDBText78.Enabled := True;
    end
  else
  if DM1.tLoteSetorItem.AsInteger = 4 then
    begin
      QRShape6.Enabled  := True;
      QRLabel16.Enabled  := True;
      QRLabel33.Enabled := True;
      QRLabel34.Enabled := True;
      QRLabel35.Enabled := True;
      QRLabel36.Enabled := True;
      QRLabel37.Enabled := True;
      QRLabel51.Enabled := True;
      QRLabel87.Enabled := True;
      QRImage4.Enabled  := True;
      QRDBText27.Enabled := True;
      QRDBText28.Enabled := True;
      QRDBText29.Enabled := True;
      QRDBText30.Enabled := True;
      QRDBText31.Enabled := True;
      QRDBText66.Enabled := True;
      QRDBText77.Enabled := True;
    end
  else
  if DM1.tLoteSetorItem.AsInteger = 5 then
    begin
      QRShape5.Enabled   := True;
      QRLabel15.Enabled  := True;
      QRLabel28.Enabled  := True;
      QRLabel29.Enabled  := True;
      QRLabel30.Enabled  := True;
      QRLabel31.Enabled  := True;
      QRLabel32.Enabled  := True;
      QRLabel50.Enabled  := True;
      QRLabel86.Enabled  := True;
      QRImage3.Enabled   := True;
      QRDBText22.Enabled := True;
      QRDBText23.Enabled := True;
      QRDBText24.Enabled := True;
      QRDBText25.Enabled := True;
      QRDBText26.Enabled := True;
      QRDBText65.Enabled := True;
      QRDBText76.Enabled := True;
    end
  else
  if DM1.tLoteSetorItem.AsInteger = 6 then
    begin
      QRShape4.Enabled   := True;
      QRLabel14.Enabled  := True;
      QRLabel23.Enabled  := True;
      QRLabel24.Enabled  := True;
      QRLabel25.Enabled  := True;
      QRLabel26.Enabled  := True;
      QRLabel27.Enabled  := True;
      QRLabel49.Enabled  := True;
      QRLabel85.Enabled  := True;
      QRImage2.Enabled   := True;
      QRDBText17.Enabled := True;
      QRDBText18.Enabled := True;
      QRDBText19.Enabled := True;
      QRDBText20.Enabled := True;
      QRDBText21.Enabled := True;
      QRDBText64.Enabled := True;
      QRDBText75.Enabled := True;
    end
  else
  if DM1.tLoteSetorItem.AsInteger = 7 then
    begin
      QRShape3.Enabled   := True;
      QRLabel13.Enabled  := True;
      QRLabel18.Enabled  := True;
      QRLabel19.Enabled  := True;
      QRLabel20.Enabled  := True;
      QRLabel21.Enabled  := True;
      QRLabel22.Enabled  := True;
      QRLabel48.Enabled  := True;
      QRLabel84.Enabled  := True;
      QRImage1.Enabled   := True;
      QRDBText12.Enabled := True;
      QRDBText13.Enabled := True;
      QRDBText14.Enabled := True;
      QRDBText15.Enabled := True;
      QRDBText16.Enabled := True;
      QRDBText63.Enabled := True;
      QRDBText74.Enabled := True;
    end
  else
  if DM1.tLoteSetorItem.AsInteger = 8 then
    begin
      QRShape138.Enabled := True;
      QRLabel105.Enabled := True;
      QRLabel106.Enabled := True;
      QRLabel107.Enabled := True;
      QRLabel108.Enabled := True;
      QRLabel109.Enabled := True;
      QRLabel110.Enabled := True;
      QRLabel111.Enabled := True;
      QRLabel112.Enabled := True;
      QRImage10.Enabled  := True;
      QRDBText52.Enabled := True;
      QRDBText62.Enabled := True;
      QRDBText93.Enabled := True;
      QRDBText94.Enabled := True;
      QRDBText95.Enabled := True;
      QRDBText96.Enabled := True;
      QRDBText97.Enabled := True;
    end;
end;

procedure TfRelTalao2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfRelTalao2.QRChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  Posicao: Integer;
begin
  for posicao := 1 to 14 do
    begin
      TQRLabel(FindComponent('Tam'+IntToStr(Posicao))).Enabled := False;
      TQRLabel(FindComponent('Par'+IntToStr(Posicao))).Enabled := False;
    end;
  qTalaoGrade.First;
  Posicao := 0;
  while not qTalaoGrade.EOF do
    begin
      Inc(Posicao);
      TQRLabel(FindComponent('Tam' + IntToStr(Posicao))).Enabled  := True;
      TQRLabel(FindComponent('Tam' + IntToStr(Posicao))).Caption  := qTalaoGradeTamanho.AsString;
      TQRLabel(FindComponent('Par' + IntToStr(Posicao))).Enabled  := True;
      TQRLabel(FindComponent('Par' + IntToStr(Posicao))).Caption  := qTalaoGradeQtdPar.AsString;
      qTalaoGrade.Next;
    end;
end;

procedure TfRelTalao2.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  vCodBarra: array [1..8] of string;
  i : Integer;
begin
  Barcode1.Top      := 0;
  Barcode1.Left     := 10;
  QRImage1.Picture  := nil;
  QRImage2.Picture  := nil;
  QRImage3.Picture  := nil;
  QRImage4.Picture  := nil;
  QRImage5.Picture  := nil;
  QRImage6.Picture  := nil;
  QRImage7.Picture  := nil;
  QRImage10.Picture := nil;
  for i := 1 to 8 do
    begin
      if vCodSetor[i] > 0 then
        begin
          vCodBarra[i] := '2' + FormatFloat('00000',DM1.tTalaoLote.AsInteger) +
                          FormatFloat('0000',DM1.tTalaoGradeTalao.AsInteger) +
                          FormatFloat('00',vCodSetor[i]);
          Barcode1.Text := vCodBarra[i];
          case i of
            1 :  Barcode1.DrawBarcode(QRImage7.Canvas);
            2 :  Barcode1.DrawBarcode(QRImage6.Canvas);
            3 :  Barcode1.DrawBarcode(QRImage5.Canvas);
            4 :  Barcode1.DrawBarcode(QRImage4.Canvas);
            5 :  Barcode1.DrawBarcode(QRImage3.Canvas);
            6 :  Barcode1.DrawBarcode(QRImage2.Canvas);
            7 :  Barcode1.DrawBarcode(QRImage1.Canvas);
            8 :  Barcode1.DrawBarcode(QRImage10.Canvas);
          end;
        end;
    end;
  for i := 1 to 8 do
    begin
      if vCodSetor[i] > 0 then
        begin
          case i of
            1 : QRlabel61.Caption  := vCodBarra[1];
            2 : QRlabel54.Caption  := vCodBarra[2];
            3 : QRlabel52.Caption  := vCodBarra[3];
            4 : QRlabel51.Caption  := vCodBarra[4];
            5 : QRlabel50.Caption  := vCodBarra[5];
            6 : QRlabel49.Caption  := vCodBarra[6];
            7 : QRlabel48.Caption  := vCodBarra[7];
            8 : QRlabel111.Caption := vCodBarra[7];
          end;
        end;
    end;
  QRLabel79.Enabled := DM1.tLotePedidolkReposicao.AsBoolean;
end;

procedure TfRelTalao2.DetailBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  vCodBarra: string;
begin
  qTalaoGrade.Active := False;
  qTalaoGrade.Params[0].AsInteger := DM1.tTalaoLote.AsInteger;
  qTalaoGrade.Params[1].AsInteger := DM1.tTalaoItem.AsInteger;
  qTalaoGrade.Active := True;
  DM1.tTalaoGrade.First;
  if DM1.tTalaoGradelkLargura.AsString <> '' then
    begin
      QRLabel80.Visible := True;
      QRLabel81.Visible := True;
      QRLabel81.Caption := DM1.tTalaoGradelkLargura.AsString;
    end
  else
    begin
      QRLabel80.Visible := False;
      QRLabel81.Visible := False;
      QRLabel81.Caption := '';
    end;
  DM1.tLoteSetor.First;
  vCodBarra := '2' + FormatFloat('00000',DM1.tTalaoLote.AsInteger) + '0000' +
               FormatFloat('00',DM1.tLoteSetorCodSetor.AsInteger);
  Barcode1.Text := vCodBarra;
  Barcode1.DrawBarcode(QRImage9.Canvas);
  QRlabel77.Caption  := vCodBarra;
  QRImage8.Picture   := nil;
  QRLabel103.Caption := '';
  QRLabel104.Caption := '';
  DM1.tProduto.IndexFieldNames := 'Codigo';
  DM1.tProduto.SetKey;
  DM1.tProdutoCodigo.AsInteger := DM1.tTalaoCodProduto.AsInteger;
  if DM1.tProduto.GotoKey then
    begin
      if FileExists(DM1.tProdutoEndFoto.AsString) then
        QRImage8.Picture.LoadFromFile(DM1.tProdutoEndFoto.AsString)
      else
      if not DM1.tProdutoFotoJpeg.IsNull then
        Le_Imagem_JPEG(DM1.tProdutoFotoJpeg,QRImage8);
      DM1.tConstrucao.IndexFieldNames := 'Codigo';
      DM1.tConstrucao.SetKey;
      DM1.tConstrucaoCodigo.AsInteger := DM1.tProdutoCodConstrucao.AsInteger;
      if DM1.tConstrucao.GotoKey then
        QRLabel104.Caption := DM1.tConstrucaoNome.AsString;
      DM1.tMaterial.IndexFieldNames := 'Codigo';
      DM1.tMaterial.SetKey;
      DM1.tMaterialCodigo.AsInteger := DM1.tProdutoCodForma.AsInteger;
      if DM1.tMaterial.GotoKey then
        QRLabel103.Caption := DM1.tMaterialNome.AsString;
    end;
  QRLabel78.Enabled := DM1.tLotePedidolkReposicao.AsBoolean;
end;

procedure TfRelTalao2.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
 i : Integer;
begin
  for i := 1 to 8 do
    vCodSetor[i] := 0;
  DM1.tLoteSetor.First;
  while not DM1.tLoteSetor.Eof do
    begin
      if DM1.tLoteSetorItem.AsInteger < 9 then
        begin
          Mostra_Setores;
          case DM1.tLoteSetorItem.AsInteger of
            1 : QRLabel55.Caption  := DM1.tLoteSetorlkNomeSetor.AsString;
            2 : QRLabel1.Caption   := DM1.tLoteSetorlkNomeSetor.AsString;
            3 : QRLabel17.Caption  := DM1.tLoteSetorlkNomeSetor.AsString;
            4 : QRLabel16.Caption  := DM1.tLoteSetorlkNomeSetor.AsString;
            5 : QRLabel15.Caption  := DM1.tLoteSetorlkNomeSetor.AsString;
            6 : QRLabel14.Caption  := DM1.tLoteSetorlkNomeSetor.AsString;
            7 : QRLabel13.Caption  := DM1.tLoteSetorlkNomeSetor.AsString;
            8 : QRLabel105.Caption := DM1.tLoteSetorlkNomeSetor.AsString;
          end;
          vCodSetor[DM1.tLoteSetorItem.AsInteger] := DM1.tLoteSetorCodSetor.AsInteger;
        end;
      DM1.tLoteSetor.Next;
    end;
end;

procedure TfRelTalao2.QRSubDetail2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel152.Enabled := DM1.tLotePedidolkReposicao.AsBoolean;
end;

end.

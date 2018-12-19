unit URelTalaoExpSeq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Barcode, Db, DBTables, JPEG, DBClient;

type
  TfRelTalaoExpSeq = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRSubDetail2: TQRSubDetail;
    QRLabel79: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText11: TQRDBText;
    QRShape1: TQRShape;
    QRLabel11: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText69: TQRDBText;
    QRShape2: TQRShape;
    QRDBText13: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText71: TQRDBText;
    QRLabel82: TQRLabel;
    QRShape9: TQRShape;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRDBText43: TQRDBText;
    QRDBText70: TQRDBText;
    QRDBText44: TQRDBText;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRDBText45: TQRDBText;
    QRLabel59: TQRLabel;
    QRDBText46: TQRDBText;
    QRLabel60: TQRLabel;
    QRDBText47: TQRDBText;
    QRLabel61: TQRLabel;
    QRImage7: TQRImage;
    QRLabel1: TQRLabel;
    QRDBText68: TQRDBText;
    QRDBText38: TQRDBText;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRLabel54: TQRLabel;
    QRImage6: TQRImage;
    QRShape8: TQRShape;
    QRShape7: TQRShape;
    QRLabel17: TQRLabel;
    QRDBText67: TQRDBText;
    QRDBText32: TQRDBText;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel40: TQRLabel;
    QRDBText34: TQRDBText;
    QRLabel41: TQRLabel;
    QRDBText35: TQRDBText;
    QRLabel42: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel52: TQRLabel;
    QRImage5: TQRImage;
    QRImage4: TQRImage;
    QRLabel51: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel37: TQRLabel;
    QRLabel36: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel35: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel34: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText27: TQRDBText;
    QRDBText66: TQRDBText;
    QRShape6: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel28: TQRLabel;
    QRDBText22: TQRDBText;
    QRDBText65: TQRDBText;
    QRDBText23: TQRDBText;
    QRShape5: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel32: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel50: TQRLabel;
    QRImage3: TQRImage;
    QRImage2: TQRImage;
    QRLabel49: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText64: TQRDBText;
    QRShape4: TQRShape;
    QRLabel14: TQRLabel;
    QRShape3: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText63: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText48: TQRDBText;
    QRLabel48: TQRLabel;
    QRImage1: TQRImage;
    Barcode1: TBarcode;
    QuickRep2: TQuickRep;
    DetailBand2: TQRBand;
    QRDBText49: TQRDBText;
    QRSubDetail3: TQRSubDetail;
    QRLabel62: TQRLabel;
    QRDBText51: TQRDBText;
    QRLabel75: TQRLabel;
    QRDBText62: TQRDBText;
    QRLabel63: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel66: TQRLabel;
    QRDBText54: TQRDBText;
    QRLabel68: TQRLabel;
    QRDBText56: TQRDBText;
    QRLabel70: TQRLabel;
    QRDBText60: TQRDBText;
    QRLabel71: TQRLabel;
    QRDBText58: TQRDBText;
    QRLabel72: TQRLabel;
    QRDBText61: TQRDBText;
    QRLabel69: TQRLabel;
    QRDBText57: TQRDBText;
    QRLabel73: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRDBText74: TQRDBText;
    QRImage9: TQRImage;
    QRLabel77: TQRLabel;
    QRDBText73: TQRDBText;
    QRLabel53: TQRLabel;
    QRDBText59: TQRDBText;
    QRLabel74: TQRLabel;
    QRLabel67: TQRLabel;
    QRDBText53: TQRDBText;
    QRDBText72: TQRDBText;
    QRDBText75: TQRDBText;
    QRLabel78: TQRLabel;
    QRImage8: TQRImage;
    QRShape10: TQRShape;
    ChildBand1: TQRChildBand;
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
    Tam12: TQRLabel;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    Tam13: TQRLabel;
    QRShape24: TQRShape;
    Tam14: TQRLabel;
    QRShape38: TQRShape;
    Par14: TQRLabel;
    Par13: TQRLabel;
    QRShape37: TQRShape;
    QRShape36: TQRShape;
    Par12: TQRLabel;
    QRShape35: TQRShape;
    Par11: TQRLabel;
    QRShape34: TQRShape;
    Par10: TQRLabel;
    QRShape33: TQRShape;
    Par9: TQRLabel;
    QRShape32: TQRShape;
    Par8: TQRLabel;
    QRShape31: TQRShape;
    Par7: TQRLabel;
    QRShape30: TQRShape;
    Par6: TQRLabel;
    Par5: TQRLabel;
    QRShape29: TQRShape;
    QRShape28: TQRShape;
    Par4: TQRLabel;
    QRShape27: TQRShape;
    Par3: TQRLabel;
    QRShape26: TQRShape;
    Par2: TQRLabel;
    QRShape25: TQRShape;
    Par1: TQRLabel;
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
    QRShape80: TQRShape;
    QRShape79: TQRShape;
    QRShape78: TQRShape;
    QRShape77: TQRShape;
    QRShape76: TQRShape;
    QRShape75: TQRShape;
    QRShape74: TQRShape;
    QRShape73: TQRShape;
    QRShape72: TQRShape;
    QRShape71: TQRShape;
    QRShape70: TQRShape;
    QRShape69: TQRShape;
    QRShape68: TQRShape;
    QRShape66: TQRShape;
    QRShape53: TQRShape;
    QRShape67: TQRShape;
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
    QRShape94: TQRShape;
    QRShape93: TQRShape;
    QRShape92: TQRShape;
    QRShape91: TQRShape;
    QRShape90: TQRShape;
    QRShape89: TQRShape;
    QRShape88: TQRShape;
    QRShape87: TQRShape;
    QRShape86: TQRShape;
    QRShape85: TQRShape;
    QRShape84: TQRShape;
    QRShape83: TQRShape;
    QRShape82: TQRShape;
    QRShape81: TQRShape;
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
    QRShape122: TQRShape;
    QRShape121: TQRShape;
    QRShape120: TQRShape;
    QRShape119: TQRShape;
    QRShape118: TQRShape;
    QRShape117: TQRShape;
    QRShape116: TQRShape;
    QRShape115: TQRShape;
    QRShape114: TQRShape;
    QRShape113: TQRShape;
    QRShape112: TQRShape;
    QRShape111: TQRShape;
    QRShape110: TQRShape;
    QRShape109: TQRShape;
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
    qTalaoGradePosicao: TIntegerField;
    QRDBText76: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText80: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel64: TQRLabel;
    QRDBText52: TQRDBText;
    QRLabel91: TQRLabel;
    QRDBText81: TQRDBText;
    QRLabel65: TQRLabel;
    QRDBText55: TQRDBText;
    QuickRep3: TQuickRep;
    QRBand2: TQRBand;
    QRDBText77: TQRDBText;
    QRSubDetail5: TQRSubDetail;
    QRLReposicao: TQRLabel;
    QRLabel84: TQRLabel;
    QRDBText79: TQRDBText;
    QRLabel85: TQRLabel;
    QRDBText82: TQRDBText;
    QRLabel86: TQRLabel;
    QRDBText83: TQRDBText;
    QRShape141: TQRShape;
    QRLabel87: TQRLabel;
    QRDBText84: TQRDBText;
    QRDBText85: TQRDBText;
    QRShape142: TQRShape;
    QRDBText86: TQRDBText;
    QRLabel88: TQRLabel;
    QRDBText87: TQRDBText;
    QRLabel89: TQRLabel;
    QRLabel141: TQRLabel;
    QRLabel142: TQRLabel;
    QRLabel143: TQRLabel;
    QRDBText130: TQRDBText;
    QRDBText131: TQRDBText;
    QRLabel144: TQRLabel;
    QRLabel145: TQRLabel;
    QRLabel146: TQRLabel;
    QRDBText132: TQRDBText;
    QRDBText133: TQRDBText;
    QRDBText134: TQRDBText;
    QRDBText135: TQRDBText;
    QRLabel147: TQRLabel;
    QRDBText136: TQRDBText;
    QRShape137: TQRShape;
    QRShape138: TQRShape;
    QRLabel83: TQRLabel;
    QRDBText88: TQRDBText;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    Mar1: TQRLabel;
    Mar2: TQRLabel;
    Mar3: TQRLabel;
    Mar4: TQRLabel;
    Mar5: TQRLabel;
    Mar6: TQRLabel;
    Mar7: TQRLabel;
    Mar8: TQRLabel;
    Mar9: TQRLabel;
    Mar10: TQRLabel;
    Mar11: TQRLabel;
    Mar12: TQRLabel;
    Mar13: TQRLabel;
    Mar14: TQRLabel;
    qTalaoGradeMarcarTam: TStringField;
    QRLabel188: TQRLabel;
    QRImage12: TQRImage;
    QRLabel186: TQRLabel;
    QRLabel187: TQRLabel;
    QRLabel95: TQRLabel;
    QRShape396: TQRShape;
    QRShape139: TQRShape;
    QRShape140: TQRShape;
    QRShape143: TQRShape;
    QRShape144: TQRShape;
    QRShape145: TQRShape;
    QRShape146: TQRShape;
    QRShape147: TQRShape;
    QRShape148: TQRShape;
    QRShape149: TQRShape;
    QRShape150: TQRShape;
    QRShape151: TQRShape;
    QRShape152: TQRShape;
    QRShape153: TQRShape;
    QRShape154: TQRShape;
    QRShape155: TQRShape;
    QRShape156: TQRShape;
    QRShape157: TQRShape;
    QRShape158: TQRShape;
    QRShape159: TQRShape;
    QRShape160: TQRShape;
    QRShape161: TQRShape;
    QRShape162: TQRShape;
    QRShape163: TQRShape;
    Tam15: TQRLabel;
    QRShape164: TQRShape;
    Tam16: TQRLabel;
    QRShape165: TQRShape;
    Tam17: TQRLabel;
    QRShape166: TQRShape;
    Par17: TQRLabel;
    Par16: TQRLabel;
    QRShape167: TQRShape;
    Par15: TQRLabel;
    Mar15: TQRLabel;
    Mar16: TQRLabel;
    Mar17: TQRLabel;
    QRShape168: TQRShape;
    QRShape169: TQRShape;
    QRShape170: TQRShape;
    QRShape171: TQRShape;
    QRShape172: TQRShape;
    QRShape173: TQRShape;
    QRShape174: TQRShape;
    QRShape175: TQRShape;
    Tam18: TQRLabel;
    QRShape176: TQRShape;
    Par18: TQRLabel;
    Mar18: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
     procedure Mostra_Setores;
  public
    { Public declarations }
  end;

var
  fRelTalaoExpSeq: TfRelTalaoExpSeq;
  vCodSetor: array [1..7] of integer;

implementation

uses UDM1, UDM2, UConsLoteExp;

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

procedure TfRelTalaoExpSeq.Mostra_Setores;
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
      QRImage7.Enabled   := True;
      QRDBText43.Enabled := True;
      QRDBText44.Enabled := True;
      QRDBText45.Enabled := True;
      QRDBText46.Enabled := True;
      QRDBText47.Enabled := True;
      QRDBText70.Enabled := True;
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
      QRImage6.Enabled  := True;
      QRDBText38.Enabled := True;
      QRDBText39.Enabled := True;
      QRDBText40.Enabled := True;
      QRDBText41.Enabled := True;
      QRDBText42.Enabled := True;
      QRDBText68.Enabled := True;
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
      QRImage5.Enabled  := True;
      QRDBText32.Enabled := True;
      QRDBText33.Enabled := True;
      QRDBText34.Enabled := True;
      QRDBText35.Enabled := True;
      QRDBText36.Enabled := True;
      QRDBText67.Enabled := True;
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
      QRImage4.Enabled  := True;
      QRDBText27.Enabled := True;
      QRDBText28.Enabled := True;
      QRDBText29.Enabled := True;
      QRDBText30.Enabled := True;
      QRDBText31.Enabled := True;
      QRDBText66.Enabled := True;
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
      QRImage3.Enabled   := True;
      QRDBText22.Enabled := True;
      QRDBText23.Enabled := True;
      QRDBText24.Enabled := True;
      QRDBText25.Enabled := True;
      QRDBText26.Enabled := True;
      QRDBText65.Enabled := True;
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
      QRImage2.Enabled   := True;
      QRDBText17.Enabled := True;
      QRDBText18.Enabled := True;
      QRDBText19.Enabled := True;
      QRDBText20.Enabled := True;
      QRDBText21.Enabled := True;
      QRDBText64.Enabled := True;
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
      QRImage1.Enabled   := True;
      QRDBText12.Enabled := True;
      QRDBText13.Enabled := True;
      QRDBText14.Enabled := True;
      QRDBText15.Enabled := True;
      QRDBText16.Enabled := True;
      QRDBText63.Enabled := True;
    end;
end;

procedure TfRelTalaoExpSeq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelTalaoExpSeq.QRSubDetail2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  vCodBarra: array [1..7] of string;
  i : Integer;
begin
  Barcode1.Top     := 0;
  Barcode1.Left    := 10;
  QRImage1.Picture := nil;
  QRImage2.Picture := nil;
  QRImage3.Picture := nil;
  QRImage4.Picture := nil;
  QRImage5.Picture := nil;
  QRImage6.Picture := nil;
  QRImage7.Picture := nil;
  for i := 1 to 7 do
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
          end;
        end;
    end;
  for i := 1 to 7 do
    begin
      if vCodSetor[i] > 0 then
        begin
          case i of
            1 : QRlabel61.Caption := vCodBarra[1];
            2 : QRlabel54.Caption := vCodBarra[2];
            3 : QRlabel52.Caption := vCodBarra[3];
            4 : QRlabel51.Caption := vCodBarra[4];
            5 : QRlabel50.Caption := vCodBarra[5];
            6 : QRlabel49.Caption := vCodBarra[6];
            7 : QRlabel48.Caption := vCodBarra[7];
          end;
        end;
    end;
  QRLabel79.Enabled := DM1.tLotePedidolkReposicao.AsBoolean;
end;

procedure TfRelTalaoExpSeq.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
 i : Integer;
begin
  for i := 1 to 7 do
    vCodSetor[i] := 0;
  DM1.tLoteSetor.First;
  while not DM1.tLoteSetor.Eof do
    begin
      if DM1.tLoteSetorItem.AsInteger < 8 then
        begin
          Mostra_Setores;
          case DM1.tLoteSetorItem.AsInteger of
            1 : QRLabel55.Caption := DM1.tLoteSetorlkNomeSetor.AsString;
            2 : QRLabel1.Caption  := DM1.tLoteSetorlkNomeSetor.AsString;
            3 : QRLabel17.Caption := DM1.tLoteSetorlkNomeSetor.AsString;
            4 : QRLabel16.Caption := DM1.tLoteSetorlkNomeSetor.AsString;
            5 : QRLabel15.Caption := DM1.tLoteSetorlkNomeSetor.AsString;
            6 : QRLabel14.Caption := DM1.tLoteSetorlkNomeSetor.AsString;
            7 : QRLabel13.Caption := DM1.tLoteSetorlkNomeSetor.AsString;
          end;
          vCodSetor[DM1.tLoteSetorItem.AsInteger] := DM1.tLoteSetorCodSetor.AsInteger;
        end;
      DM1.tLoteSetor.Next;
    end;
end;

procedure TfRelTalaoExpSeq.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  Posicao: Integer;
begin
  for posicao := 1 to 18 do
    begin
      TQRLabel(FindComponent('Tam'+IntToStr(Posicao))).Enabled := False;
      TQRLabel(FindComponent('Mar'+IntToStr(Posicao))).Enabled := False;
      TQRLabel(FindComponent('Par'+IntToStr(Posicao))).Enabled := False;
    end;
  qTalaoGrade.First;
  Posicao := 0;
  while not qTalaoGrade.EOF do
    begin
      Inc(Posicao);
      if Posicao > 18 then
        ShowMessage('Existe mais de 18 tamanhos!')
      else
      begin
        TQRLabel(FindComponent('Tam' + IntToStr(Posicao))).Enabled  := True;
        TQRLabel(FindComponent('Tam' + IntToStr(Posicao))).Caption  := qTalaoGradeTamanho.AsString;
        TQRLabel(FindComponent('Mar' + IntToStr(Posicao))).Enabled  := True;
        TQRLabel(FindComponent('Mar' + IntToStr(Posicao))).Caption  := qTalaoGradeMarcarTam.AsString;
        TQRLabel(FindComponent('Par' + IntToStr(Posicao))).Enabled  := True;
        TQRLabel(FindComponent('Par' + IntToStr(Posicao))).Caption  := qTalaoGradeQtdPar.AsString;
      end;
      qTalaoGrade.Next;
    end;
end;

procedure TfRelTalaoExpSeq.QRSubDetail3BeforePrint(Sender: TQRCustomBand;
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
  //DM1.tLoteSetor.First;
  //vCodBarra := '2' + FormatFloat('00000',DM1.tTalaoLote.AsInteger) + '0000' +
  //             FormatFloat('00',DM1.tLoteSetorCodSetor.AsInteger);
  vCodBarra          := '';
  QRLabel77.Caption  := '';
  QRLabel186.Caption := '';
  if DM1.tParametrosCodSetor1FolhaLote.AsInteger > 0 then
    begin
      vCodBarra := FormatFloat('00000',DM1.tTalaoLote.AsInteger) + '0000' +
                   FormatFloat('00',DM1.tParametrosCodSetor1FolhaLote.AsInteger);
      Barcode1.Text := '1' + vCodBarra;
      Barcode1.DrawBarcode(QRImage9.Canvas);
      QRlabel77.Caption := '1' + vCodBarra;

      Barcode1.Text := '3' + vCodBarra;
      Barcode1.DrawBarcode(QRImage12.Canvas);
      QRlabel186.Caption := '3' + vCodBarra;
    end;

  DM1.tProduto.IndexFieldNames := 'Codigo';
  DM1.tProduto.FindKey([DM1.tTalaoCodProduto.AsInteger]);
  QRImage8.Picture := nil;
  if FileExists(DM1.tProdutoEndFoto.AsString) then
    QRImage8.Picture.LoadFromFile(DM1.tProdutoEndFoto.AsString)
  else
  if not DM1.tProdutoFotoJpeg.IsNull then
    Le_Imagem_JPEG(DM1.tProdutoFotoJpeg,QRImage8);
  QRLabel78.Enabled := DM1.tLotePedidolkReposicao.AsBoolean;
end;

procedure TfRelTalaoExpSeq.QRSubDetail5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLReposicao.Enabled := DM1.tLotePedidolkReposicao.AsBoolean;
  QRLabel95.Caption    := fConsLoteExp.Edit4.Text;
  QRShape396.Enabled   := (fConsLoteExp.Edit4.Text <> '');
end;

end.

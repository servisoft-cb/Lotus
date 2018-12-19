unit URelFichaConstrucao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelFichaConstrucao = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLLabel1: TRLLabel;
    RLDBText1: TRLDBText;
    RLLabel2: TRLLabel;
    RLDBText2: TRLDBText;
    RLLabel3: TRLLabel;
    RLDBText3: TRLDBText;
    RLDraw1: TRLDraw;
    RLLabel4: TRLLabel;
    RLDBText4: TRLDBText;
    RLDraw2: TRLDraw;
    RLDraw3: TRLDraw;
    RLBand3: TRLBand;
    RLLabel5: TRLLabel;
    RLMemo1: TRLMemo;
    RLSubDetail2: TRLSubDetail;
    RLBand5: TRLBand;
    RLDBText5: TRLDBText;
    RLSubDetail3: TRLSubDetail;
    RLBand6: TRLBand;
    RLDBText6: TRLDBText;
    RLDraw5: TRLDraw;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLBand4: TRLBand;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLDraw4: TRLDraw;
    RLDraw6: TRLDraw;
    RLBand8: TRLBand;
    RLDraw7: TRLDraw;
    TRef1: TRLLabel;
    TMat1: TRLLabel;
    RLDraw8: TRLDraw;
    TRef2: TRLLabel;
    TMat2: TRLLabel;
    RLDraw9: TRLDraw;
    TRef3: TRLLabel;
    TMat3: TRLLabel;
    RLDraw10: TRLDraw;
    TRef4: TRLLabel;
    TMat4: TRLLabel;
    RLDraw11: TRLDraw;
    TRef5: TRLLabel;
    TMat5: TRLLabel;
    RLDraw12: TRLDraw;
    TRef6: TRLLabel;
    TMat6: TRLLabel;
    RLDraw13: TRLDraw;
    TRef7: TRLLabel;
    TMat7: TRLLabel;
    RLDraw14: TRLDraw;
    TRef8: TRLLabel;
    TMat8: TRLLabel;
    RLDraw15: TRLDraw;
    TRef9: TRLLabel;
    TMat9: TRLLabel;
    RLDraw16: TRLDraw;
    TRef10: TRLLabel;
    TMat10: TRLLabel;
    RLDraw17: TRLDraw;
    TRef11: TRLLabel;
    TMat11: TRLLabel;
    RLDraw18: TRLDraw;
    TRef12: TRLLabel;
    TMat12: TRLLabel;
    RLDraw19: TRLDraw;
    TRef13: TRLLabel;
    TMat13: TRLLabel;
    RLDraw20: TRLDraw;
    TRef14: TRLLabel;
    TMat14: TRLLabel;
    RLDraw21: TRLDraw;
    TRef15: TRLLabel;
    TMat15: TRLLabel;
    RLDraw22: TRLDraw;
    RLImage1: TRLImage;
    RLBand9: TRLBand;
    RLLabel12: TRLLabel;
    RLDBMemo1: TRLDBMemo;
    RLDraw23: TRLDraw;
    RLLabel11: TRLLabel;
    RLDBText12: TRLDBText;
    RLLabel14: TRLLabel;
    RLDraw25: TRLDraw;
    RLLabel15: TRLLabel;
    RLBand10: TRLBand;
    RLDraw24: TRLDraw;
    RLLabel13: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLDBText15: TRLDBText;
    RLDBText16: TRLDBText;
    RLDBText17: TRLDBText;
    RLDBText18: TRLDBText;
    RLDBText19: TRLDBText;
    RLDBText20: TRLDBText;
    RLDBText21: TRLDBText;
    RLLabel24: TRLLabel;
    RLDBText22: TRLDBText;
    RLDraw26: TRLDraw;
    RLLabel25: TRLLabel;
    RLDBText23: TRLDBText;
    RLDraw27: TRLDraw;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand8BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand9BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand10BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelFichaConstrucao: TfRelFichaConstrucao;

implementation

uses UDMFichaConstrucao;

{$R *.dfm}

procedure TfRelFichaConstrucao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelFichaConstrucao.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLMemo1.Lines.Clear;
  RLMemo1.Lines.Add(DMFichaConstrucao.cdsFichaConstrucaoOBS.Value);
end;

procedure TfRelFichaConstrucao.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  //RLDraw6.Visible := (DMFichaConstrucao.cdsFichaConstrucao_Mat.IsEmpty);
end;

procedure TfRelFichaConstrucao.RLBand8BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  i : Integer;  
begin
  PrintIt := not(DMFichaConstrucao.cdsFichaConstrucao_MatTam.IsEmpty);
  if not PrintIt then
    exit;

  for i := 1 to 15 do
  begin
    TRLLabel(FindComponent('TRef'+IntToStr(i))).Caption := '';
    TRLLabel(FindComponent('TMat'+IntToStr(i))).Caption := '';
  end;

  i := 0;
  DMFichaConstrucao.cdsFichaConstrucao_MatTam.First;
  while not DMFichaConstrucao.cdsFichaConstrucao_MatTam.Eof do
  begin
    i := i + 1;
    TRLLabel(FindComponent('TRef'+IntToStr(i))).Caption := DMFichaConstrucao.cdsFichaConstrucao_MatTamTAMREF.AsString;
    TRLLabel(FindComponent('TMat'+IntToStr(i))).Caption := DMFichaConstrucao.cdsFichaConstrucao_MatTamTAMMAT.AsString;
    DMFichaConstrucao.cdsFichaConstrucao_MatTam.Next;
  end;
end;

procedure TfRelFichaConstrucao.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLImage1.Picture := nil;
  if (trim(DMFichaConstrucao.cdsFichaConstrucaoENDFOTO.AsString) <> '') and (FileExists(DMFichaConstrucao.cdsFichaConstrucaoENDFOTO.AsString)) then
    RLImage1.Picture.LoadFromFile(DMFichaConstrucao.cdsFichaConstrucaoENDFOTO.AsString);
  if DMFichaConstrucao.cdsFichaConstrucaoTIPO_MONTAGEM.AsString = '1' then
    RLLabel15.Caption := 'Na Palmilha de Montagem'
  else
    RLLabel15.Caption := 'Na Plataforma';
end;

procedure TfRelFichaConstrucao.RLBand9BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt := (trim(DMFichaConstrucao.cdsFichaConstrucao_MatOBS.AsString) <> '');
end;

procedure TfRelFichaConstrucao.RLBand10BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
 PrintIt := (DMFichaConstrucao.cdsFichaConstrucao_PosINFORMAROPCAOMAT.AsString = 'S');
end;

end.

unit URelComprovante2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelComprovante2 = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLDBText1: TRLDBText;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    RLLabel2: TRLLabel;
    RLDraw3: TRLDraw;
    RLLabel3: TRLLabel;
    RLDraw4: TRLDraw;
    RLLabel4: TRLLabel;
    RLDraw5: TRLDraw;
    RLLabel5: TRLLabel;
    RLDraw6: TRLDraw;
    RLLabel6: TRLLabel;
    RLDraw7: TRLDraw;
    RLLabel7: TRLLabel;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLLabel8: TRLLabel;
    RLDraw8: TRLDraw;
    RLDraw9: TRLDraw;
    RLLabel9: TRLLabel;
    RLDBText6: TRLDBText;
    RLDraw10: TRLDraw;
    RLDraw11: TRLDraw;
    RLLabel10: TRLLabel;
    RLDBText7: TRLDBText;
    RLDraw12: TRLDraw;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLDraw13: TRLDraw;
    RLLabel13: TRLLabel;
    RLDBText8: TRLDBText;
    RLDraw14: TRLDraw;
    RLDraw15: TRLDraw;
    RLLabel14: TRLLabel;
    RLDBText9: TRLDBText;
    RLDraw16: TRLDraw;
    RLLabel15: TRLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelComprovante2: TfRelComprovante2;

implementation

uses UPrevRelComprovante, UDM1;

{$R *.dfm}

procedure TfRelComprovante2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelComprovante2.RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
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
  RLLabel8.Caption  := FloatToStr(Qtd);
  RLLabel12.Caption := FloatToStr(Qtd);
end;

end.

unit URelHistMat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelHistMat = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel21: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel22: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLDraw1: TRLDraw;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDraw2: TRLDraw;
    RLDraw3: TRLDraw;
    RLLabel12: TRLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelHistMat: TfRelHistMat;

implementation

uses UConsHistMat;

{$R *.dfm}

procedure TfRelHistMat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelHistMat.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  vTexto1 : String;
begin
  vTexto1 := '';
  if (fConsHistMat.DateEdit1.Date > 10) and (fConsHistMat.DateEdit2.Date > 10) then
    vTexto1 := '(De: ' + fConsHistMat.DateEdit1.Text + ' até ' + fConsHistMat.DateEdit2.Text + ')'
  else
  if (fConsHistMat.DateEdit1.Date > 10) then
    vTexto1 := '(Apartir de: ' + fConsHistMat.DateEdit1.Text + ')'
  else
  if (fConsHistMat.DateEdit2.Date > 10) then
    vTexto1 := '(Até: ' + fConsHistMat.DateEdit2.Text + ')';
  if fConsHistMat.RadioGroup1.ItemIndex = 0 then
  begin
    RLLabel1.Caption  := 'Relatório de Histórico - Produtos ' + vTexto1;
    RLLabel12.Caption := 'Produto: ' + fConsHistMat.RxDBLookupCombo1.Text;
  end
  else
  begin
    RLLabel1.Caption := 'Relatório de Histórico - Materiais ' + vTexto1;
    RLLabel12.Caption := 'Material: ' + fConsHistMat.RxDBLookupCombo1.Text;
  end;
end;

end.

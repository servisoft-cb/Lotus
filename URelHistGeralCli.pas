unit URelHistGeralCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelHistGeralCli = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLDraw1: TRLDraw;
    RLLabel6: TRLLabel;
    RLDraw2: TRLDraw;
    RLLabel7: TRLLabel;
    RLDraw3: TRLDraw;
    RLLabel8: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDraw4: TRLDraw;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLDraw5: TRLDraw;
    RLLabel12: TRLLabel;
    RLDBText4: TRLDBText;
    RLDraw6: TRLDraw;
    RLLabel13: TRLLabel;
    RLDraw7: TRLDraw;
    RLLabel14: TRLLabel;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelHistGeralCli: TfRelHistGeralCli;

implementation

uses UHistGeral, ToolEdit;

{$R *.dfm}

procedure TfRelHistGeralCli.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelHistGeralCli.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel1.Caption := 'Relatório de Faturamento por Cliente';
  if fHistGeral.DateEdit1.Date > 0 then
    RLLabel1.Caption := RLLabel1.Caption + ' - Inicio ' + fHistGeral.DateEdit1.Text;
  if fHistGeral.DateEdit2.Date > 0 then
    RLLabel1.Caption := RLLabel1.Caption + ' - Final ' + fHistGeral.DateEdit2.Text;
  RLLabel5.Caption := '';
  //if fHistGeral.RxDBLookupCombo2.Text <> '' then
  //  RLLabel5.Caption := 'Filial: ' + fHistGeral.RxDBLookupCombo2.Text;
  if fHistGeral.RxDBLookupCombo1.Text <> '' then
    RLLabel5.Caption := RLLabel5.Caption + ' - Cliente: ' + fHistGeral.RxDBLookupCombo1.Text;
  if fHistGeral.RxDBLookupCombo4.Text <> '' then
    RLLabel5.Caption := RLLabel5.Caption + ' - Vendedor: ' + fHistGeral.RxDBLookupCombo4.Text;
  if fHistGeral.RxDBLookupCombo3.Text <> '' then
    RLLabel5.Caption := RLLabel5.Caption + ' - Refer.: ' + fHistGeral.RxDBLookupCombo3.Text + ' ' + fHistGeral.Label4.Caption;
end;

end.

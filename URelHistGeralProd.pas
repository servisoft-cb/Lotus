unit URelHistGeralProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelHistGeralProd = class(TForm)
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
    RLLabel11: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLDraw5: TRLDraw;
    RLLabel12: TRLLabel;
    RLDBText4: TRLDBText;
    RLDraw6: TRLDraw;
    RLLabel13: TRLLabel;
    RLDBText5: TRLDBText;
    RLDraw7: TRLDraw;
    RLLabel14: TRLLabel;
    RLDraw8: TRLDraw;
    RLLabel15: TRLLabel;
    RLDraw9: TRLDraw;
    RLLabel16: TRLLabel;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLLabel17: TRLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelHistGeralProd: TfRelHistGeralProd;

implementation

uses UHistGeral, ToolEdit;

{$R *.dfm}

procedure TfRelHistGeralProd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelHistGeralProd.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel1.Caption := 'Relatório de Faturamento por Produto';
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

procedure TfRelHistGeralProd.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  vAux : Real;
begin
  RLLabel10.Caption := FormatFloat('###,###,###,###,##0.00',fHistGeral.CurrencyEdit1.Value);
  vAux := StrToFloat(FormatFloat('0.00',(RLDBResult1.Value / fHistGeral.CurrencyEdit1.Value) * 100));
  RLLabel17.Caption := '% ' + FormatFloat('0.00',vAux);
end;

end.

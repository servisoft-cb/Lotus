unit URelCReceber2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelCReceber2 = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel48: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel47: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLSubDetail1: TRLSubDetail;
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
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    RLBand3: TRLBand;
    RLLabel11: TRLLabel;
    RLLabel14: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLDBResult3: TRLDBResult;
    RLDBResult4: TRLDBResult;
    RLLabel17: TRLLabel;
    RLDBResult5: TRLDBResult;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelCReceber2: TfRelCReceber2;

implementation

uses UContasReceber2, ToolEdit;

{$R *.dfm}

procedure TfRelCReceber2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelCReceber2.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel3.Caption := '';
  case fContasReceber2.RadioGroup1.ItemIndex of
    0 : RLLabel3.Caption := RLLabel3.Caption + ' (Pendente) ';
    1 : RLLabel3.Caption := RLLabel3.Caption + ' (Pagas) ';
    2 : RLLabel3.Caption := RLLabel3.Caption + ' (Todas) ';
  end;                                         
  case fContasReceber2.RadioGroup4.ItemIndex of
    0 : RLLabel3.Caption := RLLabel3.Caption + ' (Mercado Interno) ';
    1 : RLLabel3.Caption := RLLabel3.Caption + ' (Mercado Outros) ';
  end;
  if fContasReceber2.DateEdit2.Date > 0 then
    RLLabel3.Caption := RLLabel3.Caption + ' (Dt.Inicial = ' + fContasReceber2.DateEdit2.Text + ') ';
  if fContasReceber2.DateEdit3.Date > 0 then
    RLLabel3.Caption := RLLabel3.Caption + ' (Dt.Final = ' + fContasReceber2.DateEdit3.Text + ') ';
end;

end.

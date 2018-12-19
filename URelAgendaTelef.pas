unit URelAgendaTelef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelAgendaTelef = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel48: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel47: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLSubDetail1: TRLSubDetail;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLDraw1: TRLDraw;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBMemo1: TRLDBMemo;
    RLDraw2: TRLDraw;
    RLBand4: TRLBand;
    RLLabel7: TRLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelAgendaTelef: TfRelAgendaTelef;

implementation

uses UAgendaTelef;

{$R *.dfm}

procedure TfRelAgendaTelef.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelAgendaTelef.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  case fAgendaTelef.mAgendaControle.AsInteger of
    1 : RLLabel2.Caption := 'C L I E N T E';
    2 : RLLabel2.Caption := 'F O R N E C E D O R';
    3 : RLLabel2.Caption := 'T R A N S P O R T A D O R A';
    4 : RLLabel2.Caption := 'V E N D E D O R E S';
    5 : RLLabel2.Caption := 'O U T R O S   C O N T A T O S';
  end;
end;

end.

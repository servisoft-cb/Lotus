unit uEmailNFeR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, RLReport;

type
  TfEmailNFeR = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLDetailGrid1: TRLDetailGrid;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEmailNFeR: TfEmailNFeR;

implementation

uses uEmailNFeC;

{$R *.dfm}

procedure TfEmailNFeR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.

unit URelTalaoAuxiliar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelTalaoAuxiliar = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLDBText1: TRLDBText;
    RLSubDetail2: TRLSubDetail;
    RLDetailGrid1: TRLDetailGrid;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLDBText4: TRLDBText;
    RLLabel3: TRLLabel;
    RLDBText5: TRLDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelTalaoAuxiliar: TfRelTalaoAuxiliar;

implementation

uses UPrevCalcMaterialLote;

{$R *.dfm}

procedure TfRelTalaoAuxiliar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

end.

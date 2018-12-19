unit UConsCalcMaterialPed;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, RXDBCtrl, Buttons;

type
  TfConsCalcMaterialPed = class(TForm)
    GroupBox1: TGroupBox;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsCalcMaterialPed: TfConsCalcMaterialPed;

implementation

uses UPrevCalcMaterialLote2;

{$R *.DFM}

procedure TfConsCalcMaterialPed.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfConsCalcMaterialPed.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.

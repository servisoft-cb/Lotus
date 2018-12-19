unit UOrdemCompraLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, SMDBGrid;

type
  TfOrdemCompraLote = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    SMDBGrid1: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fOrdemCompraLote: TfOrdemCompraLote;

implementation

uses UOrdemCompra;

{$R *.dfm}

procedure TfOrdemCompraLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfOrdemCompraLote.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.

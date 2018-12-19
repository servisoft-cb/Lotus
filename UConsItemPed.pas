unit UConsItemPed;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, Db, DBTables, RxLookup,
  RXCtrls, ToolEdit, CurrEdit, Grids, DBGrids, RXDBCtrl;

type
  TfConsItemPed = class(TForm)
    Panel1: TPanel;
    RxLabel1: TRxLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    RxDBGrid1: TRxDBGrid;
    GroupBox2: TGroupBox;
    RxDBGrid2: TRxDBGrid;
    BitBtn5: TBitBtn;
    tLote: TTable;
    dsLote: TDataSource;
    tLoteLote: TIntegerField;
    tLoteQtdTaloes: TIntegerField;
    tLoteQtdPares: TFloatField;
    tLoteObs: TMemoField;
    tLoteImpCalcMaterial: TBooleanField;
    tLoteNroPedido: TIntegerField;
    tLoteImpresso: TBooleanField;
    tLoteOCGerado: TBooleanField;
    tLoteItemPed: TIntegerField;
    tLoteNumMapaCompras: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsItemPed: TfConsItemPed;

implementation

uses UDM1, UDM2;

{$R *.DFM}

procedure TfConsItemPed.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM1.tPedidoItem.Close;
  DM1.tPedido.Close;
  Action := Cafree;
end;

procedure TfConsItemPed.BitBtn5Click(Sender: TObject);
begin
  close;
end;

procedure TfConsItemPed.FormShow(Sender: TObject);
begin
  DM1.tPedidoItem.Open;
  DM1.tPedido.Open;
end;

end.

unit UConsPedidoNota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Db, DBTables, StdCtrls, DBCtrls, Buttons;

type
  TfConsPedidoNota = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    tPedidoNota: TTable;
    dsPedidoNota: TDataSource;
    tPedidoNotaPedido: TIntegerField;
    tPedidoNotaItem: TIntegerField;
    tPedidoNotaNumNota: TIntegerField;
    tPedidoNotaItemNota: TIntegerField;
    tPedidoNotaDtNota: TDateField;
    tPedidoNotaQtdPares: TIntegerField;
    Panel2: TPanel;
    StaticText1: TStaticText;
    DBText1: TDBText;
    BitBtn6: TBitBtn;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    tPedidoNotalkQtdPares: TIntegerField;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsPedidoNota: TfConsPedidoNota;

implementation

uses UDM1, UAgendaTelef;

{$R *.DFM}

procedure TfConsPedidoNota.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsPedidoNota.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;



procedure TfConsPedidoNota.FormShow(Sender: TObject);
var
  vQuant : Integer;
begin
  vQuant := 0;
  tPedidoNota.First;
  while not tPedidoNota.EOF do
    begin
      vQuant := vQuant + tPedidoNotaQtdPares.AsInteger;
      tPedidoNota.Next;
    end;
  if vQuant > 0 then
    StaticText3.Caption := FormatFloat('0.00',vQuant);
end;

procedure TfConsPedidoNota.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.

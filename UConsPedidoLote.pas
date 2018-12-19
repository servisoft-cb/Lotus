unit UConsPedidoLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Db, DBTables, StdCtrls, DBCtrls, Buttons, Mask;

type
  TfConsPedidoLote = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    StaticText1: TStaticText;
    DBText1: TDBText;
    BitBtn6: TBitBtn;
    tLote: TTable;
    dsLote: TDataSource;
    tLoteLote: TIntegerField;
    tLoteQtdTaloes: TIntegerField;
    tLoteQtdPares: TFloatField;
    tLoteObs: TMemoField;
    tLoteImpCalcMaterial: TBooleanField;
    tLoteNroPedido: TIntegerField;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    tLoteImpresso: TBooleanField;
    tLoteOCGerado: TBooleanField;
    tLoteItemPed: TIntegerField;
    tPedidoItem: TTable;
    tPedidoItemPedido: TIntegerField;
    tPedidoItemItem: TIntegerField;
    tPedidoItemInvoice: TStringField;
    tLotelkInvoice: TStringField;
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
  fConsPedidoLote: TfConsPedidoLote;

implementation

uses UDM1, UAgendaTelef;

{$R *.DFM}

procedure TfConsPedidoLote.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsPedidoLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tLote.Filtered := False;
  Action := Cafree;
end;

procedure TfConsPedidoLote.FormShow(Sender: TObject);
begin
  tLote.Filtered := False;
  tLote.Filter   := 'NroPedido = '''+DM1.tPedidoPedido.AsString+'''';
  tLote.Filtered := True;
end;

procedure TfConsPedidoLote.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.

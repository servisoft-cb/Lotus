unit UConsLoteOpcao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, SMDBGrid, Mask, ToolEdit,
  CurrEdit, Buttons, DB;

type
  TfConsLoteOpcao = class(TForm)
    SMDBGrid1: TSMDBGrid;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsLoteOpcao: TfConsLoteOpcao;

implementation

uses UConsLote, UDM1;

{$R *.dfm}

procedure TfConsLoteOpcao.BitBtn2Click(Sender: TObject);
begin
  if fConsLote.mPedidoAux.IsEmpty then
   exit;

  fConsLote.mPedidoAux.Delete;
end;

procedure TfConsLoteOpcao.BitBtn1Click(Sender: TObject);
begin
  if CurrencyEdit1.AsInteger <= 0 then
  begin
    ShowMessage('Pedido não foi informado!');
    exit;
  end;

  if not DM1.tLotePedidoMI.Locate('Lote;Pedido',VarArrayOf([DM1.tLoteMILote.AsInteger,CurrencyEdit1.AsInteger]),[locaseinsensitive]) then
  begin
    ShowMessage('Pedido não encontrado neste Lote!');
    exit;
  end;

  fConsLote.mPedidoAux.Insert;
  fConsLote.mPedidoAuxNumPedido.AsInteger := CurrencyEdit1.AsInteger;
  fConsLote.mPedidoAux.Post;

  CurrencyEdit1.Clear;
  CurrencyEdit1.SetFocus;
end;

procedure TfConsLoteOpcao.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsLoteOpcao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

end.

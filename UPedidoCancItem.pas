unit UPedidoCancItem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, ToolEdit, CurrEdit, Buttons, Db,
  DBTables, MemTable, Grids, DBVGrids, DBGrids, RXDBCtrl;

type
  TfPedidoCancItem = class(TForm)
    VDBGrid1: TVDBGrid;
    Panel5: TPanel;
    BitBtn5: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    StaticText1: TStaticText;
    CurrencyEdit1: TCurrencyEdit;
    StaticText2: TStaticText;
    CurrencyEdit2: TCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure CurrencyEdit1Change(Sender: TObject);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure VDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPedidoCancItem: TfPedidoCancItem;

implementation

uses UDM1, UAgendaTelef;

{$R *.DFM}

procedure TfPedidoCancItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfPedidoCancItem.FormShow(Sender: TObject);
begin
  CurrencyEdit1.SetFocus;
  CurrencyEdit2.AsInteger := DM1.tPedidoPedido.AsInteger;
end;

procedure TfPedidoCancItem.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfPedidoCancItem.RxDBGrid1DblClick(Sender: TObject);
begin
  if DM1.tPedidoItemCancelado.AsBoolean then
    begin
      ShowMessage('Este Item já esta cancelado!');
      CurrencyEdit1.AsInteger := 0;
    end
  else
    CurrencyEdit1.AsInteger := DM1.tPedidoItemPedido.AsInteger;
end;

procedure TfPedidoCancItem.BitBtn1Click(Sender: TObject);
begin
 if CurrencyEdit1.AsInteger < 1 then
   begin
     ShowMessage('É obrigatório informar o número do item!');
     CurrencyEdit1.SetFocus;
   end
 else
   begin
     if MessageDlg('Deseja realmente cancelar o item do pedido total?',mtconfirmation,[mbok,mbno],0)=mrok then
       begin
         DM1.tPedidoItem.Edit;
         DM1.tPedidoItemCancelado.AsBoolean := True;
         DM1.tPedidoItem.Post;
       end;
   end;
end;

procedure TfPedidoCancItem.CurrencyEdit1Exit(Sender: TObject);
begin
  DM1.tGrade.IndexFieldNames := 'Codigo';
  DM1.tGrade.FindKey([DM1.tPedidoItemCodGrade.AsInteger]);
  if DM1.tPedidoItemCancelado.AsBoolean then
    begin
      ShowMessage('Este Item já esta cancelado!');
      CurrencyEdit1.AsInteger := 0;
      CurrencyEdit1.SetFocus;
    end
  else
    CurrencyEdit1.AsInteger := DM1.tPedidoItemPedido.AsInteger;
end;

procedure TfPedidoCancItem.CurrencyEdit1Change(Sender: TObject);
begin
  DM1.tGrade.IndexFieldNames := 'Codigo';
  DM1.tGrade.FindKey([DM1.tPedidoItemCodGrade.AsInteger]);
end;

procedure TfPedidoCancItem.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = vk_Delete) then
    Key := vk_Return;
end;

procedure TfPedidoCancItem.VDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = vk_Delete) then
    Key := vk_Return;
end;

procedure TfPedidoCancItem.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if DM1.tPedidoItemCancelado.AsBoolean then
    begin
      Background  := clRed;
      AFont.Color := clWhite;
    end;
end;

procedure TfPedidoCancItem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.

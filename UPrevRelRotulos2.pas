unit UPrevRelRotulos2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, SMDBGrid, DB, DBTables, StdCtrls, Buttons,
  ExtCtrls, DBClient, RzTabs;

type
  TfPrevRelRotulos2 = class(TForm)
    Panel3: TPanel;
    BitBtn6: TBitBtn;
    BitBtn1: TBitBtn;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    GroupBox1: TGroupBox;
    SMDBGrid2: TSMDBGrid;
    GroupBox2: TGroupBox;
    SMDBGrid1: TSMDBGrid;
    SMDBGrid3: TSMDBGrid;
    SMDBGrid4: TSMDBGrid;
    mPedidoAux: TClientDataSet;
    mPedidoAuxPedido: TIntegerField;
    dsmPedidoAux: TDataSource;
    TabSheet3: TRzTabSheet;
    SMDBGrid5: TSMDBGrid;
    SMDBGrid6: TSMDBGrid;
    mPedidoAuxItemPedido: TIntegerField;
    tTalaoMI: TTable;
    tTalaoMILote: TIntegerField;
    tTalaoMIItem: TIntegerField;
    tTalaoMIItemPedido: TIntegerField;
    tTalaoMINumPedido: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
    procedure Monta_mPedido(Pedido, Item : Integer);
  public
    { Public declarations }
  end;

var
  fPrevRelRotulos2: TfPrevRelRotulos2;

implementation

uses
  UDM1, URelRotulos3;

{$R *.dfm}

procedure TfPrevRelRotulos2.Monta_mPedido(Pedido, Item : Integer);
begin
  if Item = 0 then
    begin
      DM1.tPedidoItem.First;
      while not DM1.tPedidoItem.Eof do
        begin
          mPedidoAux.Insert;
          mPedidoAuxPedido.AsInteger     := DM1.tPedidoPedido.AsInteger;
          mPedidoAuxItemPedido.AsInteger := DM1.tPedidoItemItem.AsInteger;
          mPedidoAux.Post;

          DM1.tPedidoItem.Next;
        end;
    end
  else
    begin
      if not mPedidoAux.Locate('Pedido;ItemPedido',VarArrayOf([Pedido,Item]),[locaseinsensitive]) then
        begin
          mPedidoAux.Insert;
          mPedidoAuxPedido.AsInteger     := Pedido;
          mPedidoAuxItemPedido.AsInteger := Item;
          mPedidoAux.Post;
        end;
    end;
end;

procedure TfPrevRelRotulos2.FormShow(Sender: TObject);
begin
  DM1.tPedido.Open;
  DM1.tPedido.IndexFieldNames := 'Pedido';
  DM1.tPedidoItem.Open;
  DM1.tPedidoGrade.Open;
  DM1.tSetor.Open;
  DM1.tUF.Open;
  DM1.tCidade.Open;
  DM1.tProduto.Open;
  DM1.tProdutoCor.Open;
  DM1.tCliente.Open;
  DM1.tGrade.Open;
  DM1.tGradeItem.Open;
  DM1.tCor.Open;
  DM1.tLote.Open;
  DM1.tLotePedido.Open;
  DM1.tLoteMI.Open;
  DM1.tLotePedidoMI.Open;
end;

procedure TfPrevRelRotulos2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tPedido.Close;
  DM1.tPedidoItem.Close;
  DM1.tPedidoGrade.Close;
  DM1.tSetor.Close;
  DM1.tUF.Close;
  DM1.tCidade.Close;
  DM1.tProduto.Close;
  DM1.tProdutoCor.Close;
  DM1.tCliente.Close;
  DM1.tGrade.Close;
  DM1.tGradeItem.Close;
  DM1.tCor.Close;
  DM1.tLote.Close;
  DM1.tLotePedido.Close;
  DM1.tLoteMI.Close;
  DM1.tLotePedidoMI.Close;
  Action := Cafree;
end;

procedure TfPrevRelRotulos2.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevRelRotulos2.BitBtn6Click(Sender: TObject);
var
  iPos: Integer;
  iID: Integer;
begin
  mPedidoAux.EmptyDataSet;

  if (RzPageControl1.ActivePage = TabSheet1) and (DM1.tPedido.RecordCount > 1) then
    Raise Exception.Create('Existe mais de um pedido selecionado!');

  if (RzPageControl1.ActivePage = TabSheet2) and (DM1.tLoteMI.RecordCount > 1) then
    Raise Exception.Create('Existe mais de um lote selecionado!');

  if (RzPageControl1.ActivePage = TabSheet3) and (DM1.tLote.RecordCount > 1) then
    Raise Exception.Create('Existe mais de um lote selecionado!');

  if RzPageControl1.ActivePage = TabSheet1 then
    Monta_mPedido(DM1.tPedidoPedido.AsInteger,0)
  else
  if RzPageControl1.ActivePage = TabSheet2 then
    begin
      DM1.tLotePedidoMI.First;
      while not DM1.tLotePedidoMI.Eof do
        begin
          if DM1.tPedido.Locate('Pedido',DM1.tLotePedidoMIPedido.AsInteger,[loCaseInsensitive]) then
            Monta_mPedido(DM1.tLotePedidoMIPedido.AsInteger,0);
          DM1.tLotePedidoMI.Next;
        end;
    end
  else
  if RzPageControl1.ActivePage = TabSheet3 then
    begin
      DM1.tLotePedido.First;
      while not DM1.tLotePedido.Eof do
        begin
          Monta_mPedido(DM1.tLotePedidoPedido.AsInteger,DM1.tLotePedidoItemPedido.AsInteger);
          DM1.tLotePedido.Next;
        end;
    end;

  fRelRotulos3 := TfRelRotulos3.Create(Self);
  try
    fRelRotulos3.QuickRep1.Preview;
  finally
    FreeandNil(fRelRotulos3);
  end;
end;

end.

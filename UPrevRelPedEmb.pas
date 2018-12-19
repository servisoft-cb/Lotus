unit UPrevRelPedEmb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, ToolEdit, StdCtrls, ExtCtrls, Buttons, RXCtrls, Menus, Db, DBTables;

type
  TfPrevRelPedEmb = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    Label3: TLabel;
    DateEdit2: TDateEdit;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    RxSpeedButton1: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    Imprimir1: TMenuItem;
    Visualizar1: TMenuItem;
    qPedidoNota: TQuery;
    qsPedidoNota: TDataSource;
    qPedidoNotaPedido: TIntegerField;
    qPedidoNotaDtNota: TDateField;
    qPedidoNotaReferencia: TStringField;
    qPedidoNotaNome: TStringField;
    qPedidoNotaNome_1: TStringField;
    qPedidoNotaQtdPares: TFloatField;
    RadioGroup1: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
  private
    { Private declarations }
    procedure Gera_Dados;
  public
    { Public declarations }
  end;

var
  fPrevRelPedEmb: TfPrevRelPedEmb;

implementation

uses URelPedEmb;

{$R *.DFM}

procedure TfPrevRelPedEmb.Gera_Dados;
begin
  qPedidoNota.Close;
  qPedidoNota.SQL.Clear;
  qPedidoNota.SQL.Add('SELECT DISTINCT Dbpedidonota.Pedido, Dbpedidonota.DtNota, SUM(Dbpedidonota.QtdPares) QtdPares, Dbproduto.Referencia, Dbcor.Nome, Dbcliente.Nome, dbPedido.Mercado');
  qPedidoNota.SQL.Add('FROM "dbPedidoNota.DB" Dbpedidonota');
  qPedidoNota.SQL.Add('   INNER JOIN "dbPedidoItem.DB" Dbpedidoitem');
  qPedidoNota.SQL.Add('   ON  (Dbpedidonota.Pedido = Dbpedidoitem.Pedido)');
  qPedidoNota.SQL.Add('   AND  (Dbpedidonota.Item = Dbpedidoitem.Item)');
  qPedidoNota.SQL.Add('   INNER JOIN "dbPedido.DB" Dbpedido');
  qPedidoNota.SQL.Add('   ON  (Dbpedidonota.Pedido = Dbpedido.Pedido)');
  qPedidoNota.SQL.Add('   INNER JOIN "dbProduto.DB" Dbproduto');
  qPedidoNota.SQL.Add('   ON  (Dbpedidoitem.CodProduto = Dbproduto.Codigo)');
  qPedidoNota.SQL.Add('   INNER JOIN "Dbcor.DB" Dbcor');
  qPedidoNota.SQL.Add('   ON  (Dbpedidoitem.CodCor = Dbcor.Codigo)');
  qPedidoNota.SQL.Add('   INNER JOIN "dbCliente.DB" Dbcliente');
  qPedidoNota.SQL.Add('   ON  (Dbpedido.CodCliente = Dbcliente.Codigo)');
  qPedidoNota.SQL.Add('WHERE (DbpedidoNota.DtNota BETWEEN :D1 AND :D2)');
  case RadioGroup1.ItemIndex of
    0 : qPedidoNota.SQL.Add(' AND (DbPedido.Mercado = ''I'')');
    1 : qPedidoNota.SQL.Add(' AND (DbPEdido.Mercado = ''E'')');
  end;
  if Edit1.Text <> '' then
    begin
      qPedidoNota.SQL.Add('   AND (Dbpedidonota.Pedido = :P1)');
      qPedidoNota.Params[0].AsDate    := DateEdit1.Date;
      qPedidoNota.Params[1].AsDate    := DateEdit2.Date;
      qPedidoNota.Params[2].AsInteger := StrToInt(Edit1.Text);
    end
  else
    begin
      qPedidoNota.Params[0].AsDate    := DateEdit1.Date;
      qPedidoNota.Params[1].AsDate    := DateEdit2.Date;
    end;
  qPedidoNota.SQL.Add('GROUP BY Dbpedidonota.Pedido, Dbpedidonota.DtNota, Dbproduto.Referencia, Dbcor.Nome, Dbcliente.Nome, Dbpedido.Mercado');
  qPedidoNota.SQL.Add('ORDER BY Dbpedidonota.DtNota, Dbpedidonota.Pedido, Dbproduto.Referencia, Dbcor.Nome');
  qPedidoNota.Open;
  qPedidoNota.First;
end;

procedure TfPrevRelPedEmb.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfPrevRelPedEmb.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevRelPedEmb.BitBtn2Click(Sender: TObject);
begin
  Edit1.Clear;
  DateEdit1.Clear;
  DateEdit2.Clear;
end;

procedure TfPrevRelPedEmb.Imprimir1Click(Sender: TObject);
begin
  if (DateEdit1.Date > 0) and (DateEdit2.Date > 0) then
    begin
      Screen.Cursor := crHourGlass;
      Gera_Dados;
      Screen.Cursor := crDefault;
      fRelPedEmb    := TfRelPedEmb.Create(Self);
      fRelPedEmb.QuickRep1.Print;
      fRelPedEmb.QuickRep1.Free;
    end
  else
    begin
      ShowMessage('Você deve informar datas "inicial" e "final" p/ gerar o relatório!');
      DateEdit1.SetFocus;
    end;
end;

procedure TfPrevRelPedEmb.Visualizar1Click(Sender: TObject);
begin
  if (DateEdit1.Date > 0) and (DateEdit2.Date > 0) then
    begin
      Screen.Cursor := crHourGlass;
      Gera_Dados;
      Screen.Cursor := crDefault;
      fRelPedEmb    := TfRelPedEmb.Create(Self);
      fRelPedEmb.QuickRep1.Preview;
      fRelPedEmb.QuickRep1.Free;
    end
  else
    begin
      ShowMessage('Você deve informar datas "inicial" e "final" p/ gerar o relatório!');
      DateEdit1.SetFocus;
    end;
end;

end.

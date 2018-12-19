unit UProgramacaoOrdem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, Db, DBTables,
  MemTable, RXCtrls, Mask, ToolEdit, RxLookup, CurrEdit, ComCtrls, Variants;

type
  TfProgramacaoOrdem = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn5: TBitBtn;
    GroupBox1: TGroupBox;
    RxLabel3: TRxLabel;
    DateEdit1: TDateEdit;
    RxLabel1: TRxLabel;
    Edit1: TEdit;
    RxLabel4: TRxLabel;
    DateEdit2: TDateEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    RxLabel5: TRxLabel;
    CurrencyEdit1: TCurrencyEdit;
    Edit2: TEdit;
    BitBtn7: TBitBtn;
    qPedidoPend: TQuery;
    qPedidoPendPedido: TIntegerField;
    qPedidoPendNomeCliente: TStringField;
    qPedidoPendDtEmissao: TDateField;
    qPedidoPendDtIniEmbarque: TDateField;
    qPedidoPendDtFinEmbarque: TDateField;
    qPedidoPendPedidoCliente: TIntegerField;
    qPedidoPendPedCliDif: TStringField;
    qPedidoPendCarimbo: TStringField;
    qPedidoPendNomeCompania: TStringField;
    dsqPedidoPend: TDataSource;
    qLotePend: TQuery;
    dsqLotePend: TDataSource;
    qLotePendPedidoCliente: TIntegerField;
    qLotePendPedCliDif: TStringField;
    qLotePendReferencia: TStringField;
    qLotePendLote: TIntegerField;
    qLotePendQtdPares: TFloatField;
    qLotePendItem: TIntegerField;
    qLotePendDtIniEmbarque: TDateField;
    qLotePendDtFinEmbarque: TDateField;
    qLotePendCarimbo: TStringField;
    qLotePendCodCompania: TIntegerField;
    qLotePendNomeCor: TStringField;
    qLotePendNomeCliente: TStringField;
    qLotePendlkNomeCompania: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    RxLabel6: TRxLabel;
    CurrencyEdit2: TCurrencyEdit;
    RxLabel7: TRxLabel;
    CurrencyEdit3: TCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    { Private declarations }
    procedure Monta_SQL;
    procedure Monta_SQL_Exp;
  public
    { Public declarations }
  end;

var
  fProgramacaoOrdem: TfProgramacaoOrdem;

implementation

uses UDM1, UDM2, UPrevRelProgramacao;

{$R *.DFM}

procedure TfProgramacaoOrdem.Monta_SQL;
begin                                 
  qPedidoPend.SQL.Clear;              
  qPedidoPend.SQL.Add('SELECT Dbpedido.Pedido, Dbcliente.Nome NomeCliente, Dbpedido.DtEmissao, Dbpedido.DtIniEmbarque, Dbpedido.DtFinEmbarque, Dbpedido.PedidoCliente, Dbpedido.PedCliDif, Dbpedido.Carimbo, Dbcliente_1.Nome NomeCompania');
  qPedidoPend.SQL.Add('FROM "dbPedido.DB" Dbpedido');
  qPedidoPend.SQL.Add('   INNER JOIN "DBCLIENTE.DB" Dbcliente');
  qPedidoPend.SQL.Add('   ON  (Dbpedido.CodCliente = Dbcliente.Codigo)');
  qPedidoPend.SQL.Add('   FULL OUTER JOIN "DBCLIENTE.DB" Dbcliente_1');
  qPedidoPend.SQL.Add('   ON  (Dbpedido.CodCompania = Dbcliente_1.Codigo)');
  qPedidoPend.SQL.Add('WHERE (Dbpedido.Cancelado <> TRUE)');
  qPedidoPend.SQL.Add('   AND  (Dbpedido.Suspenso <> TRUE)');
  qPedidoPend.SQL.Add('   AND  (Dbpedido.QtdParesFat < 1)');
  qPedidoPend.SQL.Add('   AND  ((Dbpedido.LoteExp IS NULL)  or (Dbpedido.LoteExp = False))');
  qPedidoPend.SQL.Add('   AND  ((Dbpedido.NumProgramacao IS NULL)  or (Dbpedido.NumProgramacao = 0))');
end;

procedure TfProgramacaoOrdem.Monta_SQL_Exp;
begin
  qLotePend.SQL.Clear;
  qLotePend.SQL.Add('SELECT Dbpedido.PedidoCliente, Dbpedido.PedCliDif, Dbproduto.Referencia, Dblote.Lote, Dbcor.Nome NomeCor, Dblote.QtdPares, Dbpedidoitem.Item, ');
  qLotePend.SQL.Add('Dbpedido.DtIniEmbarque, Dbcliente.Nome NomeCliente, Dbpedido.DtFinEmbarque, Dbpedido.Carimbo, Dbpedido.CodCompania');
  qLotePend.SQL.Add('FROM "dbPedido.DB" Dbpedido');
  qLotePend.SQL.Add('   INNER JOIN "dbPedidoItem.DB" Dbpedidoitem');
  qLotePend.SQL.Add('   ON  (Dbpedido.Pedido = Dbpedidoitem.Pedido)');
  qLotePend.SQL.Add('   INNER JOIN "DBCLIENTE.DB" Dbcliente');
  qLotePend.SQL.Add('   ON  (Dbpedido.CodCliente = Dbcliente.Codigo)');
  qLotePend.SQL.Add('   INNER JOIN "dbLote.DB" Dblote');
  qLotePend.SQL.Add('   ON  (Dbpedidoitem.Pedido = Dblote.NroPedido)');
  qLotePend.SQL.Add('   AND  (Dbpedidoitem.Item = Dblote.ItemPed)');
  qLotePend.SQL.Add('   INNER JOIN "dbProduto.DB" Dbproduto');
  qLotePend.SQL.Add('   ON  (Dbpedidoitem.CodProduto = Dbproduto.Codigo)');
  qLotePend.SQL.Add('   INNER JOIN Dbcor Dbcor');
  qLotePend.SQL.Add('   ON  (Dbpedidoitem.CodCor = Dbcor.Codigo)');
  qLotePend.SQL.Add('WHERE  (Dbpedido.Cancelado <> TRUE)');
  qLotePend.SQL.Add('   AND  (Dbpedido.Suspenso <> TRUE)');
  qLotePend.SQL.Add('   AND  (Dbpedido.LoteExp = True)');
  qLotePend.SQL.Add('   AND  ((DbpedidoItem.QtdParesFat IS NULL) OR (DbpedidoItem.QtdParesFat = 0))');
  qLotePend.SQL.Add('   AND  (DbpedidoItem.Cancelado <> True)');
  qLotePend.SQL.Add('   AND  ((DbLote.NumProgramacao IS NULL)  or (DbLote.NumProgramacao = 0))');
end;

procedure TfProgramacaoOrdem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfProgramacaoOrdem.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfProgramacaoOrdem.Edit1Exit(Sender: TObject);
begin
  if Edit1.Text = 'ZIMBAUÊ' then
    Edit1.Text := 'ZIMBAUE';
end;

procedure TfProgramacaoOrdem.BitBtn3Click(Sender: TObject);
begin
  //*** Mercado Interno
  qPedidoPend.Active := False;
  Monta_SQL;
  if (DateEdit1.Text <> '  /  /    ') and (DateEdit2.Text <> '  /  /    ')then
    begin
      qPedidoPend.SQL.Add('   AND  (Dbpedido.DtFinEmbarque BETWEEN :DtIni AND :DtFin)');
      qPedidoPend.Params[0].AsDate := DateEdit1.Date;
      qPedidoPend.Params[1].AsDate := DateEdit2.Date;
    end;
  qPedidoPend.SQL.Add('ORDER BY Dbpedido.DtFinEmbarque, Dbpedido.PedidoCliente, Dbpedido.PedCliDif');
  qPedidoPend.Active := True;

  //*** Exportação
  qLotePend.Active := False;
  Monta_SQL_Exp;
  if (DateEdit1.Text <> '  /  /    ') and (DateEdit2.Text <> '  /  /    ')then
    begin
      qLotePend.SQL.Add('   AND  (Dbpedido.DtFinEmbarque BETWEEN :DtIni AND :DtFin)');
      qLotePend.Params[0].AsDate := DateEdit1.Date;
      qLotePend.Params[1].AsDate := DateEdit2.Date;
    end;
  qLotePend.SQL.Add('ORDER BY Dbpedido.DtFinEmbarque, Dbpedido.PedidoCliente, Dbpedido.PedCliDif');
  qLotePend.Active := True;
end;

procedure TfProgramacaoOrdem.BitBtn4Click(Sender: TObject);
begin
  //*** Mercado Interno
  qPedidoPend.Active := False;
  Monta_SQL;
  qPedidoPend.SQL.Add('   AND  (Dbpedido.Carimbo = :Descricao)');
  qPedidoPend.Params[0].AsString := Edit1.Text;
  qPedidoPend.SQL.Add('ORDER BY Dbpedido.DtFinEmbarque, Dbpedido.PedidoCliente, Dbpedido.PedCliDif');
  qPedidoPend.Active := True;

  //*** Exportação
  qLotePend.Active := False;
  Monta_SQL_Exp;      
  qLotePend.SQL.Add('   AND  (Dbpedido.Carimbo = :Descricao)');
  qLotePend.Params[0].AsString := Edit1.Text;
  qLotePend.SQL.Add('ORDER BY Dbpedido.DtFinEmbarque, Dbpedido.PedidoCliente, Dbpedido.PedCliDif');
  qLotePend.Active := True;
end;

procedure TfProgramacaoOrdem.BitBtn7Click(Sender: TObject);
begin
  //aqui 01/04/2010
  {if qPedidoPend.Locate('PedidoCliente;PedCliDif',VarArrayOf([CurrencyEdit1.AsInteger,Edit2.Text]),[locaseinsensitive]) then
    begin
     if DM1.tProgramacaoItens.Locate('Pedido',qPedidoPendPedido.AsInteger,[loCaseInsensitive]) then
       begin
         ShowMessage('Pedido já informado');
         CurrencyEdit1.Clear;
         Edit2.Clear;
         CurrencyEdit1.SetFocus;
       end
     else
       begin
         fPrevRelProgramacao.CurrencyEdit1.AsInteger := CurrencyEdit1.AsInteger;
         fPrevRelProgramacao.Edit1.Text              := Edit2.Text;
         fPrevRelProgramacao.CurrencyEdit2.AsInteger := 0;
         fPrevRelProgramacao.CurrencyEdit3.AsInteger := 0;
         fPrevRelProgramacao.BitBtn9.Click;
         qPedidoPend.Active := False;
         qPedidoPend.Active := True;
         CurrencyEdit1.Clear;
         Edit2.Clear;
         CurrencyEdit1.SetFocus;
       end;
    end
  else     
  if qLotePend.Locate('PedidoCliente;PedCliDif',VarArrayOf([CurrencyEdit1.AsInteger,Edit2.Text]),[locaseinsensitive]) then
    begin
      fPrevRelProgramacao.CurrencyEdit1.AsInteger := CurrencyEdit1.AsInteger;
      fPrevRelProgramacao.Edit1.Text              := Edit2.Text;
      fPrevRelProgramacao.CurrencyEdit2.AsInteger := CurrencyEdit2.AsInteger;
      fPrevRelProgramacao.CurrencyEdit3.AsInteger := CurrencyEdit3.AsInteger;
      fPrevRelProgramacao.BitBtn9.Click;
      qLotePend.Active := False;
      qLotePend.Active := True;
      CurrencyEdit1.Clear;
      Edit2.Clear;
      CurrencyEdit2.Clear;
      CurrencyEdit3.Clear;
      CurrencyEdit1.SetFocus;
    end
  else
    begin
      ShowMessage('Pedido não encontrado');
      CurrencyEdit1.SetFocus;
    end;}
end;

end.

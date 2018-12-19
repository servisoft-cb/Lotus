unit UPrevProjecao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons, RXCtrls, Db, DBTables,
  MemTable, ComCtrls;

type
  TfPrevProjecao = class(TForm)
    Panel1: TPanel;
    BitBtn3: TBitBtn;
    qResumido: TQuery;
    qsProjecao: TDataSource;
    qDetalhado: TQuery;
    qsResumido: TDataSource;
    CheckBox1: TCheckBox;
    qResumidoQtdPares: TFloatField;
    qResumidoNome: TStringField;
    qResumidoQtdPrevista: TIntegerField;
    qResumidoCodConstrucao: TIntegerField;
    qDetalhadoQtdPares: TFloatField;
    qDetalhadoCodConstrucao: TIntegerField;
    qDetalhadoDtEmissao: TDateField;
    qDetalhadoNome: TStringField;
    qDetalhadoPedidoCliente: TIntegerField;
    mProjecao: TMemoryTable;
    mProjecaoNomeConstrucao: TStringField;
    mProjecaoQtdPrevista: TIntegerField;
    mProjecaoQtdPedido: TIntegerField;
    mProjecaoQtdDiferenca: TIntegerField;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    Label2: TLabel;
    DateEdit2: TDateEdit;
    Bevel1: TBevel;
    Label3: TLabel;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    qDetalhadoReferencia: TStringField;
    mProjecaoCodConstrucao: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Monta_SqlResumido;
    procedure Monta_SqlDetalhado;
//    procedure Gera_Memo;
  public
    { Public declarations }
  end;

var
  fPrevProjecao: TfPrevProjecao;

implementation

uses UDM1, URelProjecao;

{$R *.DFM}

{procedure TfPrevProjecao.Gera_Memo;
begin
  ProgressBar1.Position := 0;
  ProgressBar1.Max      := DM1.tConstrucao.RecordCount;

  mProjecao.EmptyTable;
  DM1.tConstrucao.IndexFieldNames := 'Nome';
  DM1.tConstrucao.First;
  while not DM1.tConstrucao.Eof do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;

      mProjecao.Insert;
      mProjecaoNomeConstrucao.AsString := DM1.tConstrucaoNome.AsString;
      mProjecaoCodConstrucao.AsInteger := DM1.tConstrucaoCodigo.AsInteger;
      mProjecaoQtdPrevista.AsInteger   := DM1.tConstrucaoQtdPrevista.AsInteger;
      mProjecaoQtdDiferenca.AsInteger  := 0;
      mProjecaoQtdPedido.AsInteger     := 0;

      //Filtra o SQL para procurar a construção
      qResumido.Filtered := False;
      qResumido.Filter := 'CodConstrucao = '''+DM1.tConstrucaoCodigo.AsString+'''';
      qResumido.Filtered := True;
      qResumido.First;
      ProgressBar2.Position := 0;
      ProgressBar2.Max      := qResumido.RecordCount;
      while not qResumido.Eof do
        begin
          ProgressBar2.Position        := ProgressBar2.Position + 1;
          mProjecaoQtdPedido.AsInteger := mProjecaoQtdPedido.AsInteger + qResumidoQtdPares.AsInteger;
          qResumido.Next;
        end;
      mProjecaoQtdDiferenca.AsInteger := mProjecaoQtdPrevista.AsInteger - mProjecaoQtdPedido.AsInteger;
      mProjecao.Post;
      DM1.tConstrucao.Next;
    end;
  mProjecao.First;
end;}

procedure TfPrevProjecao.Monta_SqlResumido;
begin
  qResumido.Close;
  qResumido.SQL.Clear;
  qResumido.SQL.Add('SELECT SUM( Dbpedidoitem.QtdPares ) QtdPares, Dbconstrucao.Nome, Dbconstrucao.QtdPrevista, Dbconstrucao.Codigo CodConstrucao');
  qResumido.SQL.Add('FROM "dbPedido.DB" Dbpedido');
  qResumido.SQL.Add('   INNER JOIN "dbPedidoItem.DB" Dbpedidoitem');
  qResumido.SQL.Add('   ON  (Dbpedidoitem.Pedido = Dbpedido.Pedido)');
  qResumido.SQL.Add('   INNER JOIN "dbProduto.DB" Dbproduto');
  qResumido.SQL.Add('   ON  (Dbproduto.Codigo = Dbpedidoitem.CodProduto)');
  qResumido.SQL.Add('   INNER JOIN "dbConstrucao.db" Dbconstrucao');
  qResumido.SQL.Add('   ON  (Dbconstrucao.Codigo = Dbproduto.CodConstrucao)');
  qResumido.SQL.Add('WHERE   ((Dbpedido.Cancelado = FALSE) or (Dbpedido.Cancelado is Null))');
  qResumido.SQL.Add('   AND  ((Dbpedidoitem.Cancelado = FALSE) or (Dbpedidoitem.Cancelado is Null))');
  if (DateEdit1.Text <> '  /  /    ') and (DateEdit2.Text <> '  /  /    ') then
    begin
      qResumido.SQL.Add('   AND  (Dbpedido.DtEmissao BETWEEN :D1 AND :D2)');
      qResumido.ParamByName('D1').AsDate := DateEdit1.Date;
      qResumido.ParamByName('D2').AsDate := DateEdit2.Date;
    end
  else
    qResumido.SQL.Add('   AND  (Dbpedido.DtEmissao > ''01/09/2005'')');
  qResumido.SQL.Add('GROUP BY Dbconstrucao.Nome, Dbconstrucao.QtdPrevista, Dbconstrucao.Codigo');
  qResumido.SQL.Add('ORDER BY Dbconstrucao.Nome');
  qResumido.Open;
end;

procedure TfPrevProjecao.Monta_SqlDetalhado;
begin
  qDetalhado.Close;
  qDetalhado.SQL.Clear;
  qDetalhado.SQL.Add('SELECT Sum(Dbpedidoitem.QtdPares) QtdPares, Dbproduto.CodConstrucao, Dbpedido.DtEmissao, Dbcliente.Nome, Dbpedido.PedidoCliente, dbproduto.Referencia');
  qDetalhado.SQL.Add('FROM "dbPedidoItem.DB" Dbpedidoitem');
  qDetalhado.SQL.Add('   INNER JOIN "dbProduto.DB" Dbproduto');
  qDetalhado.SQL.Add('   ON  (Dbpedidoitem.CodProduto = Dbproduto.Codigo)');
  qDetalhado.SQL.Add('   INNER JOIN "dbPedido.DB" Dbpedido');
  qDetalhado.SQL.Add('   ON  (Dbpedidoitem.Pedido = Dbpedido.Pedido)');
  qDetalhado.SQL.Add('   INNER JOIN "dbCliente.DB" Dbcliente');
  qDetalhado.SQL.Add('   ON  (Dbpedido.CodCliente = Dbcliente.Codigo)');
  qDetalhado.SQL.Add('WHERE   ((Dbpedido.Cancelado = FALSE) or (Dbpedido.Cancelado is Null))');
  qDetalhado.SQL.Add('   AND  ((Dbpedidoitem.Cancelado = FALSE) or (Dbpedidoitem.Cancelado is Null))');
  if (DateEdit1.Text <> '  /  /    ') and (DateEdit2.Text <> '  /  /    ') then
    begin
      qDetalhado.SQL.Add('   AND  (Dbpedido.DtEmissao BETWEEN :D1 AND :D2)');
      qDetalhado.ParamByName('D1').AsDate := DateEdit1.Date;
      qDetalhado.ParamByName('D2').AsDate := DateEdit2.Date;
    end
  else
    qDetalhado.SQL.Add('   AND  (Dbpedido.DtEmissao > ''01/09/2005'')');
  qDetalhado.SQL.Add('GROUP BY Dbproduto.CodConstrucao, Dbpedido.DtEmissao, Dbcliente.Nome, Dbpedido.PedidoCliente, dbproduto.Referencia');
  qDetalhado.SQL.Add('ORDER BY Dbpedido.DtEmissao, dbproduto.Referencia');
  qDetalhado.Open;
end;

procedure TfPrevProjecao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM1.tConstrucao.Close;
  DM1.tProduto.Close;
  qResumido.Close;
  qDetalhado.Close;
  Action := Cafree;
end;

procedure TfPrevProjecao.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevProjecao.BitBtn1Click(Sender: TObject);
begin

  Monta_SqlResumido;
//  Gera_Memo;
  if CheckBox1.Checked then
    Monta_SqlDetalhado;

  fRelProjecao := TfRelProjecao.Create(self);
  fRelProjecao.QuickRep1.Preview;
  fRelProjecao.QuickRep1.Free;
  qResumido.Close;
  qDetalhado.Close;

  ProgressBar1.Position := 0;
  ProgressBar2.Position := 0;
end;

procedure TfPrevProjecao.FormShow(Sender: TObject);
begin
  DM1.tConstrucao.Open;
  DM1.tProduto.Open;
end;

end.

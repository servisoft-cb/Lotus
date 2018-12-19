unit USel_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, SMDBGrid, ExtCtrls, StdCtrls,
  Buttons;

type
  TfSel_Produto = class(TForm)
    SMDBGrid1: TSMDBGrid;
    qProduto: TQuery;
    dsqProduto: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    qProdutoCodigo: TIntegerField;
    qProdutoReferencia: TStringField;
    qProdutoNome: TStringField;
    qProdutoNomeModelo: TStringField;
    qProdutoDescMaterial: TStringField;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    ctProduto : String;
    procedure prc_Consultar_Prod;
  public
    { Public declarations }
  end;

var
  fSel_Produto: TfSel_Produto;

implementation

uses uUtilPadrao;


{$R *.dfm}

procedure TfSel_Produto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfSel_Produto.FormShow(Sender: TObject);
begin
  ctProduto := qProduto.SQL.Text;
end;

procedure TfSel_Produto.BitBtn1Click(Sender: TObject);
begin
  prc_Consultar_Prod;
end;

procedure TfSel_Produto.prc_Consultar_Prod;
begin
  qProduto.Close;
  qProduto.SQL.Text := ctProduto + ' WHERE 0 = 0 ';
  if trim(Edit1.Text) <> '' then
    qProduto.SQL.Text := qProduto.SQL.Text + ' AND NOME LIKE ' + QuotedStr('%'+Edit1.Text+'%');
  if trim(Edit2.Text) <> '' then
    qProduto.SQL.Text := qProduto.SQL.Text + ' AND REFERENCIA LIKE ' + QuotedStr('%'+Edit2.Text+'%');
  qProduto.Open;
end;

procedure TfSel_Produto.SMDBGrid1DblClick(Sender: TObject);
begin
  if qProduto.IsEmpty then
    exit;
  vCodProduto_Pos := qProdutoCodigo.AsInteger;
  Close;
end;

procedure TfSel_Produto.SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    vCodProduto_Pos    := qProdutoCodigo.AsInteger;
    vReferencia_Pos    := qProdutoReferencia.AsString;
    vDesc_Material_Pos := qProdutoDescMaterial.AsString;
    Close;
  end;
end;

procedure TfSel_Produto.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    BitBtn1Click(Sender);
    if not qProduto.IsEmpty then
      SMDBGrid1.SetFocus;
  end;
end;

procedure TfSel_Produto.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    BitBtn1Click(Sender);
    if not qProduto.IsEmpty then
      SMDBGrid1.SetFocus;
  end;
end;

end.

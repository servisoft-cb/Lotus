unit uProdutosVendidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGrids, SMDBGrid, RxLookup, Mask, ToolEdit, RxDBComb;

type
  TfProdutosVendidos = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    SMDBGrid1: TSMDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    ComboBox1: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    vSQL: String;
  public
    { Public declarations }
  end;

var
  fProdutosVendidos: TfProdutosVendidos;

implementation

uses uProdutosVendidosR, UDM2;

{$R *.dfm}

procedure TfProdutosVendidos.FormShow(Sender: TObject);
begin
  dm2.qMaterial.Open;
  vSQL := dm2.qProdutosVendidos.SQL.Text;
  ComboBox1.ItemIndex := 0;
end;

procedure TfProdutosVendidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm2.qMaterial.Close;
  Action := caFree;
end;

procedure TfProdutosVendidos.BitBtn2Click(Sender: TObject);
begin
  SMDBGrid1.DisableScroll;
  fProdutosVendidosR := TfProdutosVendidosR.Create(Self);
  fProdutosVendidosR.RLReport1.Preview;
  fProdutosVendidosR.RLReport1.Free;
  SMDBGrid1.EnableScroll;
end;

procedure TfProdutosVendidos.BitBtn1Click(Sender: TObject);
begin
  dm2.qProdutosVendidos.Close;
  dm2.qProdutosVendidos.SQL.Text := vSQL;
  if DateEdit1.Date > 1 then
    dm2.qProdutosVendidos.SQL.Add(' AND DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.Date)));
  if DateEdit2.Date > 1 then
    dm2.qProdutosVendidos.SQL.Add(' AND DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.Date)));
  if RxDBLookupCombo1.KeyValue > 0 then
      dm2.qProdutosVendidos.SQL.Add(' AND REFERENCIA = ' + QuotedStr(RxDBLookupCombo1.Value));
  case ComboBox1.ItemIndex of
    0: dm2.qProdutosVendidos.SQL.Add(' ORDER BY NF.DTEMISSAO, NFI.DESCRICAO');
    1: dm2.qProdutosVendidos.SQL.Add(' ORDER BY NFI.DESCRICAO, NF.DTEMISSAO');
  end;
  dm2.qProdutosVendidos.Open;
end;

end.

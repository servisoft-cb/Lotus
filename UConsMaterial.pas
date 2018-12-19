unit UConsMaterial;
                 
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, SMDBGrid, ExtCtrls, StdCtrls,
  Buttons, Mask, ToolEdit, CurrEdit;

type
  TfConsMaterial = class(TForm)
    SMDBGrid1: TSMDBGrid;
    qMaterial: TQuery;
    dsqMaterial: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    Shape1: TShape;
    Label4: TLabel;
    qMaterialCodigo: TIntegerField;
    qMaterialNome: TStringField;
    qMaterialCodClasFiscal: TStringField;
    qMaterialUnidade: TStringField;
    qMaterialOrigemProd: TStringField;
    CurrencyEdit1: TCurrencyEdit;
    qMaterialInativo: TBooleanField;
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
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    ctProduto : String;
    procedure prc_Consultar_Prod;
  public
    { Public declarations }
  end;

var
  fConsMaterial: TfConsMaterial;

implementation

uses uUtilPadrao;


{$R *.dfm}

procedure TfConsMaterial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfConsMaterial.FormShow(Sender: TObject);
begin
  ctProduto := qMaterial.SQL.Text;
end;

procedure TfConsMaterial.BitBtn1Click(Sender: TObject);
begin
  prc_Consultar_Prod;
end;

procedure TfConsMaterial.prc_Consultar_Prod;
begin
  qMaterial.Close;
  qMaterial.SQL.Text := ctProduto + ' WHERE 0 = 0 ';
  if trim(Edit1.Text) <> '' then
    qMaterial.SQL.Text := qMaterial.SQL.Text + ' AND NOME LIKE ' + QuotedStr('%'+Edit1.Text+'%');
  if CurrencyEdit1.AsInteger > 0 then
    qMaterial.SQL.Text := qMaterial.SQL.Text + ' AND CODIGO = ' + IntToStr(CurrencyEdit1.AsInteger);
  if not CheckBox1.Checked then
    qMaterial.SQL.Text := qMaterial.SQL.Text + ' AND Inativo = False ';
  qMaterial.Open;
end;

procedure TfConsMaterial.SMDBGrid1DblClick(Sender: TObject);
begin
  if qMaterial.IsEmpty then
    exit;
  vCodMaterial_Pos := qMaterialCodigo.AsInteger;
  Close;
end;

procedure TfConsMaterial.SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    vCodMaterial_Pos := qMaterialCodigo.AsInteger;
    Close;
  end;
end;

procedure TfConsMaterial.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    BitBtn1Click(Sender);
    if not qMaterial.IsEmpty then
      SMDBGrid1.SetFocus;
  end;
end;

procedure TfConsMaterial.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    BitBtn1Click(Sender);
    if not qMaterial.IsEmpty then
      SMDBGrid1.SetFocus;
  end;
end;

procedure TfConsMaterial.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if qMaterialInativo.AsBoolean then
    AFont.Color := clRed;
end;

procedure TfConsMaterial.CurrencyEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    BitBtn1Click(Sender);
    if not qMaterial.IsEmpty then
      SMDBGrid1.SetFocus;
  end;
end;

end.

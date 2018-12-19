unit USel_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, SMDBGrid, ExtCtrls, StdCtrls,
  Buttons, FMTBcd, DBClient, Provider, SqlExpr;

type
  TfSel_Cliente = class(TForm)
    SMDBGrid1: TSMDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    sdsCliente: TSQLDataSet;
    dspCliente: TDataSetProvider;
    cdsCliente: TClientDataSet;
    dsCliente: TDataSource;
    sdsClienteCODIGO: TIntegerField;
    sdsClienteNOME: TStringField;
    sdsClienteFANTASIA: TStringField;
    sdsClienteCGCCPF: TStringField;
    sdsClienteENDERECO: TStringField;
    sdsClienteCIDADE: TStringField;
    cdsClienteCODIGO: TIntegerField;
    cdsClienteNOME: TStringField;
    cdsClienteFANTASIA: TStringField;
    cdsClienteCGCCPF: TStringField;
    cdsClienteENDERECO: TStringField;
    cdsClienteCIDADE: TStringField;
    sdsClienteDDDFONE1: TIntegerField;
    sdsClienteTELEFONE: TStringField;
    cdsClienteDDDFONE1: TIntegerField;
    cdsClienteTELEFONE: TStringField;
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
    procedure SMDBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    ctCliente : String;
    procedure prc_Consultar;
  public
    { Public declarations }
  end;

var
  fSel_Cliente: TfSel_Cliente;

implementation

uses uUtilPadrao, DmdDatabase;


{$R *.dfm}

procedure TfSel_Cliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfSel_Cliente.FormShow(Sender: TObject);
begin
  ctCliente := sdsCliente.CommandText;
end;

procedure TfSel_Cliente.BitBtn1Click(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfSel_Cliente.prc_Consultar;
begin
  cdsCliente.Close;
  sdsCliente.CommandText := ctCliente + ' WHERE 0 = 0 ';
  if trim(Edit1.Text) <> '' then
    sdsCliente.CommandText := sdsCliente.CommandText + ' AND NOME LIKE ' + QuotedStr('%'+Edit1.Text+'%');
  cdsCliente.Open;
  cdsCliente.IndexFieldNames := 'NOME';
end;

procedure TfSel_Cliente.SMDBGrid1DblClick(Sender: TObject);
begin
  if cdsCliente.IsEmpty then
    exit;
  vCodCliente_Pos := cdsClienteCodigo.AsInteger;
  Close;
end;

procedure TfSel_Cliente.SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    vCodCliente_Pos := cdsClienteCODIGO.AsInteger;
    Close;
  end;
end;

procedure TfSel_Cliente.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    BitBtn1Click(Sender);
    if not cdsCliente.IsEmpty then
      SMDBGrid1.SetFocus;
  end;
end;

procedure TfSel_Cliente.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    BitBtn1Click(Sender);
    if not cdsCliente.IsEmpty then
      SMDBGrid1.SetFocus;
  end;
end;

procedure TfSel_Cliente.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  cdsCliente.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

end.

unit uEmailNFeC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, Grids, DBGrids, SMDBGrid, ExtCtrls, Buttons,
  DB, DBTables, StdCtrls;

type
  TfEmailNFeC = class(TForm)
    Panel1: TPanel;
    SMDBGrid1: TSMDBGrid;
    Query1: TQuery;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Query1UF: TStringField;
    Query1NOME: TStringField;
    Query1EMAILNFE: TStringField;
    CheckBox1: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    vSql: String;
  public
    { Public declarations }
  end;

var
  fEmailNFeC: TfEmailNFeC;

implementation

uses UDM1, uEmailNFeR;

{$R *.dfm}

procedure TfEmailNFeC.BitBtn1Click(Sender: TObject);
begin
  Query1.Close;
  Query1.SQL.Text := vSql;
  if CheckBox1.Checked then
    Query1.SQL.Add('ORDER BY UF')
  else
    Query1.SQL.Add('ORDER BY NOME');
  Query1.Open;
  fEmailNFeR := TfEmailNfeR.Create(Self);
  fEmailNfeR.RLReport1.Preview;
end;

procedure TfEmailNFeC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfEmailNFeC.FormCreate(Sender: TObject);
begin
  vSql := Query1.Sql.Text;
end;

end.

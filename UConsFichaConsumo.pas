unit UConsFichaConsumo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RxLookup, StdCtrls, ExtCtrls, Buttons, Db, DBTables, Grids, DBGrids,
  RXDBCtrl, SMDBGrid, Mask, ToolEdit;

type
  TfConsFichaConsumo = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    StaticText1: TStaticText;
    Label9: TLabel;
    ComboBox2: TComboBox;
    SMDBGrid2: TSMDBGrid;
    Label6: TLabel;
    Edit4: TEdit;
    Label8: TLabel;
    qFichaConsumo: TQuery;
    dsqFichaConsumo: TDataSource;
    qFichaConsumoNumMov: TIntegerField;
    qFichaConsumoReferencia: TStringField;
    qFichaConsumoModelo: TStringField;
    qFichaConsumoConstrucao: TStringField;
    qFichaConsumoCia: TStringField;
    qFichaConsumoDtMov: TDateField;
    Label7: TLabel;
    DateEdit1: TDateEdit;
    Edit6: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure SMDBGrid2DblClick(Sender: TObject);
    procedure SMDBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2Exit(Sender: TObject);
  private
    { Private declarations }
    procedure Monta_SQL;
  public
    { Public declarations }
  end;

var
  fConsFichaConsumo: TfConsFichaConsumo;

implementation

uses UDM1, UFichaConsumoMat;

{$R *.DFM}

procedure TfConsFichaConsumo.Monta_SQL;
begin
  qFichaConsumo.Close;
  qFichaConsumo.SQL.Clear;
  qFichaConsumo.SQL.Add('SELECT dbFichaConsumo.NumMov, dbFichaConsumo.Referencia, dbFichaConsumo.Modelo, ');
  qFichaConsumo.SQL.Add(' dbFichaConsumo.Construcao, dbFichaConsumo.Cia, dbFichaConsumo.DtMov');
  qFichaConsumo.SQL.Add('FROM "dbFichaConsumo.db" Dbfichaconsumo');
  qFichaConsumo.SQL.Add('WHERE (0=0)');
  if Edit6.Text <> '' then
    qFichaConsumo.SQL.Add(' AND (dbFichaConsumo.NumMov = ' + Edit6.Text + ')');
  if Edit1.Text <> '' then
    qFichaConsumo.SQL.Add(' AND (dbFichaConsumo.Referencia LIKE  + ''%' + Edit1.Text + '%'')');
  if Edit2.Text <> '' then
    qFichaConsumo.SQL.Add(' AND (dbFichaConsumo.Modelo LIKE  + ''%' + Edit2.Text + '%'')');
  if Edit3.Text <> '' then
    qFichaConsumo.SQL.Add(' AND (dbFichaConsumo.Construcao LIKE  + ''%' + Edit3.Text + '%'')');
  if Edit4.Text <> '' then
    qFichaConsumo.SQL.Add(' AND (dbFichaConsumo.Cia LIKE  + ''%' + Edit4.Text + '%'')');
  if DateEdit1.Date > 0 then
     qFichaConsumo.SQL.Add(' AND (dbFichaConsumo.DtMov = ''' + (FormatDateTime('MM/DD/YYYY',DateEdit1.Date)) + ''')');

  Case ComboBox2.ItemIndex of
    0 : qFichaConsumo.SQL.Add('ORDER BY dbFichaConsumo.NumMov');
    1 : qFichaConsumo.SQL.Add('ORDER BY dbFichaConsumo.Referencia, dbFichaConsumo.Modelo');
    2 : qFichaConsumo.SQL.Add('ORDER BY dbFichaConsumo.Modelo');
    3 : qFichaConsumo.SQL.Add('ORDER BY dbFichaConsumo.Construcao');
    4 : qFichaConsumo.SQL.Add('ORDER BY dbFichaConsumo.Cia');
    5 : qFichaConsumo.SQL.Add('ORDER BY dbFichaConsumo.DtMov');
  end;
  qFichaConsumo.Open;
end;

procedure TfConsFichaConsumo.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsFichaConsumo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qFichaConsumo.Close;
  Action := Cafree;
end;

procedure TfConsFichaConsumo.BitBtn1Click(Sender: TObject);
begin
  Monta_SQL;
end;

procedure TfConsFichaConsumo.SMDBGrid2DblClick(Sender: TObject);
begin
  if qFichaConsumoNumMov.AsInteger > 0 then
    DM1.tFichaConsumo.Locate('NumMov',qFichaConsumoNumMov.AsInteger,[loCaseInsensitive]);
  Close;
end;

procedure TfConsFichaConsumo.SMDBGrid2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    begin
      if qFichaConsumoNumMov.AsInteger > 0 then
      DM1.tFichaConsumo.Locate('NumMov',qFichaConsumoNumMov.AsInteger,[loCaseInsensitive]);
      Key := #0;
    Close;
    end;
end;

procedure TfConsFichaConsumo.ComboBox2Exit(Sender: TObject);
begin
  BitBtn1.SetFocus;
end;

end.


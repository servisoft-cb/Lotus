unit UConsOS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, RxLookup, Mask, ToolEdit, Buttons, Grids, DBGrids,
  RXDBCtrl, Db, DBTables;

type
  TfConsOS = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    DateEdit1: TDateEdit;
    BitBtn1: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    qOS: TQuery;
    qOSNumOS: TIntegerField;
    qOSDtEmissao: TDateField;
    qOSNumOC: TIntegerField;
    qOSNomeForn: TStringField;
    qsOS: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure DateEdit1Enter(Sender: TObject);
    procedure DateEdit1Change(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsOS: TfConsOS;

implementation

uses UDM1, UOS, UAgendaTelef;

{$R *.DFM}

procedure TfConsOS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM1.tOS.IndexFieldNames := 'NumOS';
  DM1.tOS.FindKey([qOSNumOS.AsInteger]);
  Action                  := Cafree;
end;

procedure TfConsOS.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsOS.Edit1Enter(Sender: TObject);
begin
  Edit2.Clear;
  RxDBLookupCombo1.ClearValue;
  DateEdit1.Clear;
  qOS.Active := False;
  qOS.SQL.Clear;
  qOS.SQL.Add('SELECT Dbos.NumOS, Dbos.DtEmissao, Dbos.NumOC, Dbfornecedores.NomeForn');
  qOS.SQL.Add('FROM "dbOS.db" Dbos');
  qOS.SQL.Add('   INNER JOIN "dbFornecedores.DB" Dbfornecedores');
  qOS.SQL.Add('   ON  (Dbos.CodFornecedor = Dbfornecedores.CodForn)');
  qOS.SQL.Add('ORDER BY Dbos.NumOS');
  qOS.Active := True;
end;

procedure TfConsOS.Edit1Change(Sender: TObject);
begin
  if Edit1.Text <> '' then
    qOS.Locate('NumOS',Edit1.Text,[loCaseInsensitive]);
end;

procedure TfConsOS.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tFornecedores.IndexFieldNames := 'NomeForn';
  Edit1.Clear;
  Edit2.Clear;
  DateEdit1.Clear;
  qOS.Active                        := False;
  qOS.SQL.Clear;
  qOS.SQL.Add('SELECT Dbos.NumOS, Dbos.DtEmissao, Dbos.NumOC, Dbfornecedores.NomeForn');
  qOS.SQL.Add('FROM "dbOS.db" Dbos');
  qOS.SQL.Add('   INNER JOIN "dbFornecedores.DB" Dbfornecedores');
  qOS.SQL.Add('   ON  (Dbos.CodFornecedor = Dbfornecedores.CodForn)');
  qOS.SQL.Add('ORDER BY Dbfornecedores.NomeForn, Dbos.NumOS');
  qOS.Active                        := True;
end;

procedure TfConsOS.RxDBLookupCombo1Change(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
    qOS.Locate('NomeForn',RxDBLookupCombo1.Text,[loCaseInsensitive]);
end;

procedure TfConsOS.Edit2Enter(Sender: TObject);
begin
  Edit1.Clear;
  RxDBLookupCombo1.ClearValue;
  DateEdit1.Clear;
  qOS.Active := False;
  qOS.SQL.Clear;
  qOS.SQL.Add('SELECT Dbos.NumOS, Dbos.DtEmissao, Dbos.NumOC, Dbfornecedores.NomeForn');
  qOS.SQL.Add('FROM "dbOS.db" Dbos');
  qOS.SQL.Add('   INNER JOIN "dbFornecedores.DB" Dbfornecedores');
  qOS.SQL.Add('   ON  (Dbos.CodFornecedor = Dbfornecedores.CodForn)');
  qOS.SQL.Add('ORDER BY Dbos.NumOC, Dbos.NumOS');
  qOS.Active := True;
end;

procedure TfConsOS.Edit2Change(Sender: TObject);
begin
  if Edit2.Text <> '' then
    qOS.Locate('NumOC',Edit2.Text,[loCaseInsensitive]);
end;

procedure TfConsOS.DateEdit1Enter(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  RxDBLookupCombo1.ClearValue;
  qOS.Active := False;
  qOS.SQL.Clear;
  qOS.SQL.Add('SELECT Dbos.NumOS, Dbos.DtEmissao, Dbos.NumOC, Dbfornecedores.NomeForn');
  qOS.SQL.Add('FROM "dbOS.db" Dbos');
  qOS.SQL.Add('   INNER JOIN "dbFornecedores.DB" Dbfornecedores');
  qOS.SQL.Add('   ON  (Dbos.CodFornecedor = Dbfornecedores.CodForn)');
  qOS.SQL.Add('ORDER BY Dbos.DtEmissao, Dbos.NumOS');
  qOS.Active := True;
end;

procedure TfConsOS.DateEdit1Change(Sender: TObject);
begin
  if DateEdit1.Date > 1 then
    qOS.Locate('DtEmissao',DateEdit1.Date,[loCaseInsensitive]);
end;

procedure TfConsOS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.

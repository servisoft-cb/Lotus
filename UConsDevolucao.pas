unit UConsDevolucao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, RxLookup, StdCtrls, Mask, ToolEdit, Buttons, Grids, DBGrids,
  RXDBCtrl, ALed, Db, DBTables;

type
  TfConsDevolucao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    Label3: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    Label4: TLabel;
    ALed1: TALed;
    Label5: TLabel;
    ALed2: TALed;
    qDevolucoes: TQuery;
    qDevolucoesNumMov: TIntegerField;
    qDevolucoesNome: TStringField;
    qDevolucoesDtContato: TDateField;
    qDevolucoesQtdPares: TFloatField;
    qDevolucoesResolvido: TBooleanField;
    qDevolucoesNumNota: TIntegerField;
    qsDevolucoes: TDataSource;
    qDevolucoesCodCliente: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBLookupCombo1CloseUp(Sender: TObject);
    procedure DateEdit1Enter(Sender: TObject);
    procedure DateEdit1Change(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsDevolucao: TfConsDevolucao;

implementation

uses UDM1, UDevolucao, UAgendaTelef;

{$R *.DFM}

procedure TfConsDevolucao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not(DM1.tDevolucao.IsEmpty) then
    DM1.tDevolucao.FindKey([qDevolucoesNumMov.AsInteger]);
  Action := Cafree;
end;

procedure TfConsDevolucao.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DateEdit1.Clear;
  Edit1.Clear;
  DM1.tCliente.IndexFieldNames := 'Nome';
  qDevolucoes.Close;
  qDevolucoes.SQL.Clear;
  qDevolucoes.SQL.Add('SELECT Dbdevolucao.NumMov, Dbcliente.Nome, Dbdevolucao.DtContato, Dbdevolucao.QtdPares, Dbdevolucao.Resolvido, Dbdevolucao.NumNota, Dbdevolucao.CodCliente');
  qDevolucoes.SQL.Add('FROM "dbDevolucao.db" Dbdevolucao');
  qDevolucoes.SQL.Add('   INNER JOIN "dbCliente.DB" Dbcliente');
  qDevolucoes.SQL.Add('   ON  (Dbdevolucao.CodCliente = Dbcliente.Codigo)');
  qDevolucoes.SQL.Add('ORDER BY Dbcliente.Nome, Dbdevolucao.NumMov');
  qDevolucoes.Open;
end;

procedure TfConsDevolucao.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Codigo';
end;

procedure TfConsDevolucao.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (qDevolucoesResolvido.AsBoolean) then
    begin
      AFont.Color := clWhite;
      Background  := clGreen;
    end;
end;

procedure TfConsDevolucao.FormCreate(Sender: TObject);
begin
  qDevolucoes.Close;
  qDevolucoes.Open;
end;

procedure TfConsDevolucao.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsDevolucao.RxDBLookupCombo1CloseUp(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
    qDevolucoes.Locate('CodCliente',RxDBLookupCombo1.KeyValue,[loCaseInsensitive]);
end;

procedure TfConsDevolucao.DateEdit1Enter(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
  Edit1.Clear;
  qDevolucoes.Close;
  qDevolucoes.SQL.Clear;
  qDevolucoes.SQL.Add('SELECT Dbdevolucao.NumMov, Dbcliente.Nome, Dbdevolucao.DtContato, Dbdevolucao.QtdPares, Dbdevolucao.Resolvido, Dbdevolucao.NumNota, Dbdevolucao.CodCliente');
  qDevolucoes.SQL.Add('FROM "dbDevolucao.db" Dbdevolucao');
  qDevolucoes.SQL.Add('   INNER JOIN "dbCliente.DB" Dbcliente');
  qDevolucoes.SQL.Add('   ON  (Dbdevolucao.CodCliente = Dbcliente.Codigo)');
  qDevolucoes.SQL.Add('ORDER BY Dbdevolucao.DtContato, Dbdevolucao.NumMov');
  qDevolucoes.Open;
end;

procedure TfConsDevolucao.DateEdit1Change(Sender: TObject);
begin
  if DateEdit1.Date > 1 then
    qDevolucoes.Locate('DtContato',DateEdit1.Date,[loCaseInsensitive]);
end;

procedure TfConsDevolucao.Edit1Enter(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
  DateEdit1.Clear;
  qDevolucoes.Close;
  qDevolucoes.SQL.Clear;
  qDevolucoes.SQL.Add('SELECT Dbdevolucao.NumMov, Dbcliente.Nome, Dbdevolucao.DtContato, Dbdevolucao.QtdPares, Dbdevolucao.Resolvido, Dbdevolucao.NumNota, Dbdevolucao.CodCliente');
  qDevolucoes.SQL.Add('FROM "dbDevolucao.db" Dbdevolucao');
  qDevolucoes.SQL.Add('   INNER JOIN "dbCliente.DB" Dbcliente');
  qDevolucoes.SQL.Add('   ON  (Dbdevolucao.CodCliente = Dbcliente.Codigo)');
  qDevolucoes.SQL.Add('ORDER BY Dbdevolucao.NumMov');
  qDevolucoes.Open;
end;

procedure TfConsDevolucao.Edit1Change(Sender: TObject);
begin
  if Edit1.Text <> '' then
    qDevolucoes.Locate('NumMov',Edit1.Text,[loCaseInsensitive]);
end;

procedure TfConsDevolucao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.

unit UConsLancCReceber;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons, Mask, ToolEdit, RxLookup,
  ALed, ExtCtrls, Db, DBTables;

type
  TfConsLancCReceber = class(TForm)
    Panel1: TPanel;
    ALed1: TALed;
    Label8: TLabel;
    ALed2: TALed;
    Label9: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Edit1: TEdit;
    Edit2: TEdit;
    DateEdit1: TDateEdit;
    BitBtn1: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    qCReceber: TQuery;
    qCReceberNumCReceber: TIntegerField;
    qCReceberNumNota: TIntegerField;
    qCReceberQuitado: TBooleanField;
    qCReceberCodCli: TIntegerField;
    qCReceberTipoDoc: TStringField;
    qCReceberDtGerado: TDateField;
    qsReceber: TDataSource;
    qCReceberlkNomeCli: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
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
  fConsLancCReceber: TfConsLancCReceber;

implementation

uses ULancaCReceber, UDM1, UAgendaTelef;

{$R *.DFM}

procedure TfConsLancCReceber.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsLancCReceber.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
  Edit1.Clear;
  Edit2.Clear;
  DateEdit1.Clear;
  qCReceber.Active             := False;
  qCReceber.SQL.Clear;
  qCReceber.SQL.ADD('SELECT NumCReceber, NumNota, Quitado, CodCli, TipoDoc, DtGerado');
  qCReceber.SQL.ADD('FROM "dbCReceber.DB" Dbcreceber');
  qCReceber.SQL.ADD('ORDER BY CodCli');
  qCReceber.Active             := True;
end;

procedure TfConsLancCReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tCReceber.IndexFieldNames := 'NumCReceber';
  DM1.tCReceber.FindKey([qCReceberNumCReceber.AsInteger]);
  Action := Cafree;
end;

procedure TfConsLancCReceber.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if qCReceberQuitado.AsBoolean then
    begin
      AFont.Color := clWhite;
      Background  := clTeal;
    end
  else
    begin
      AFont.Color := clBlack;
      Background  := clWhite;
    end;
end;

procedure TfConsLancCReceber.RxDBLookupCombo1Change(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
    qCReceber.Locate('CodCli',RxDBLookupCombo1.KeyValue,[loCaseInsensitive]);
end;

procedure TfConsLancCReceber.Edit1Enter(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
  Edit2.Clear;
  DateEdit1.Clear;
  qCReceber.Active := False;
  qCReceber.SQL.Clear;
  qCReceber.SQL.ADD('SELECT NumCReceber, NumNota, Quitado, CodCli, TipoDoc, DtGerado');
  qCReceber.SQL.ADD('FROM "dbCReceber.DB" Dbcreceber');
  qCReceber.SQL.ADD('ORDER BY NumCReceber');
  qCReceber.Active := True;
end;

procedure TfConsLancCReceber.Edit1Change(Sender: TObject);
begin
  if Edit1.Text <> '' then
    qCReceber.Locate('NumCReceber',StrToInt(Edit1.Text),[loCaseInsensitive]);
end;

procedure TfConsLancCReceber.Edit2Enter(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
  Edit1.Clear;
  DateEdit1.Clear;
  qCReceber.Active := False;
  qCReceber.SQL.Clear;
  qCReceber.SQL.ADD('SELECT NumCReceber, NumNota, Quitado, CodCli, TipoDoc, DtGerado');
  qCReceber.SQL.ADD('FROM "dbCReceber.DB" Dbcreceber');
  qCReceber.SQL.ADD('ORDER BY NumNota');
  qCReceber.Active := True;
end;

procedure TfConsLancCReceber.Edit2Change(Sender: TObject);
begin
  if Edit2.Text <> '' then
    qCReceber.Locate('NumNota',StrToInt(Edit2.Text),[loCaseInsensitive]);
end;

procedure TfConsLancCReceber.DateEdit1Enter(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
  Edit1.Clear;
  Edit2.Clear;
  qCReceber.Active := False;
  qCReceber.SQL.Clear;
  qCReceber.SQL.ADD('SELECT NumCReceber, NumNota, Quitado, CodCli, TipoDoc, DtGerado');
  qCReceber.SQL.ADD('FROM "dbCReceber.DB" Dbcreceber');
  qCReceber.SQL.ADD('ORDER BY DtGerado');
  qCReceber.Active := True;
end;

procedure TfConsLancCReceber.DateEdit1Change(Sender: TObject);
begin
  if DateEdit1.Text <> '  /  /    ' then
    qCReceber.Locate('DtGerado',DateEdit1.Date,[loCaseInsensitive]);
end;

procedure TfConsLancCReceber.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.

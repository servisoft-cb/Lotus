unit UConsDcto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, DBTables, Grids, DBGrids, RXDBCtrl, Mask, ToolEdit,
  StdCtrls, Buttons;

type
  TfConsDcto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    qDctoEst: TQuery;
    qsDctoEst: TDataSource;
    qDctoEstNumDcto: TIntegerField;
    qDctoEstData: TDateField;
    qDctoEstUsuario: TStringField;
    qDctoEstTipo: TStringField;
    qDctoEstTotal: TFloatField;
    RxDBGrid1: TRxDBGrid;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    Label3: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DateEdit1Enter(Sender: TObject);
    procedure DateEdit1Change(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsDcto: TfConsDcto;

implementation

uses UDctoEst, UDM1, UAgendaTelef;

{$R *.DFM}

procedure TfConsDcto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM1.tDctoEst.FindKey([qDctoEstNumDcto.AsInteger]);
  Action := Cafree;
end;

procedure TfConsDcto.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsDcto.Edit1Enter(Sender: TObject);
begin
  Edit2.Clear;
  DateEdit1.Clear;
  qDctoEst.Active := False;
  qDctoEst.SQL.Clear;
  qDctoEst.SQL.Add('SELECT NumDcto, Data, Usuario, Tipo, Total');
  qDctoEst.SQL.Add('FROM "dbDctoEst.DB" Dbdctoest');
  qDctoEst.SQL.Add('ORDER BY NumDcto');
  qDctoEst.Active := True;
end;

procedure TfConsDcto.Edit1Change(Sender: TObject);
begin
  if Edit1.Text <> '' then
    qDctoEst.Locate('NumDcto',StrToInt(Edit1.Text),[loCaseInsensitive]);
end;

procedure TfConsDcto.DateEdit1Enter(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  qDctoEst.Active := False;
  qDctoEst.SQL.Clear;
  qDctoEst.SQL.Add('SELECT NumDcto, Data, Usuario, Tipo, Total');
  qDctoEst.SQL.Add('FROM "dbDctoEst.DB" Dbdctoest');
  qDctoEst.SQL.Add('ORDER BY Data');
  qDctoEst.Active := True;
end;

procedure TfConsDcto.DateEdit1Change(Sender: TObject);
begin
  if DateEdit1.Text <> '  /  /    ' then
    qDctoEst.Locate('Data',DateEdit1.Date,[loCaseInsensitive]);
end;

procedure TfConsDcto.Edit2Enter(Sender: TObject);
begin
  Edit1.Clear;
  DateEdit1.Clear;
  qDctoEst.Active := False;
  qDctoEst.SQL.Clear;
  qDctoEst.SQL.Add('SELECT NumDcto, Data, Usuario, Tipo, Total');
  qDctoEst.SQL.Add('FROM "dbDctoEst.DB" Dbdctoest');
  qDctoEst.SQL.Add('ORDER BY Usuario');
  qDctoEst.Active := True;
end;

procedure TfConsDcto.Edit2Change(Sender: TObject);
begin
  if Edit2.Text <> '' then
    qDctoEst.Locate('Usuario',Edit2.Text,[loCaseInsensitive]);
end;

procedure TfConsDcto.RxDBGrid1DblClick(Sender: TObject);
begin
  Close;
end;

procedure TfConsDcto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.

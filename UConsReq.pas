unit UConsReq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, CurrEdit, StdCtrls, Mask, ToolEdit, RxLookup, Buttons,
  ExtCtrls;

type
  TfConsReq = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel3: TPanel;
    BitBtn4: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DateEdit1: TDateEdit;
    CurrencyEdit1: TCurrencyEdit;
    DBGrid1: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1CloseUp(Sender: TObject);
    procedure DateEdit1Enter(Sender: TObject);
    procedure DateEdit1Change(Sender: TObject);
    procedure CurrencyEdit1Enter(Sender: TObject);
    procedure CurrencyEdit1Change(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsReq: TfConsReq;

implementation

uses UDM1, URequisicao, UAgendaTelef;

{$R *.DFM}

procedure TfConsReq.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfConsReq.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsReq.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tSetor.IndexFieldNames := 'Nome';
  DateEdit1.Clear;
  CurrencyEdit1.Clear;
  DM1.tReq.IndexFieldNames   := 'CodSetor';
end;

procedure TfConsReq.RxDBLookupCombo1CloseUp(Sender: TObject);
begin
  DM1.tReq.FindKey([DM1.tSetorCodigo.AsInteger])
end;

procedure TfConsReq.DateEdit1Enter(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
  CurrencyEdit1.Clear;
  DM1.tReq.IndexFieldNames := 'DtMov';
end;

procedure TfConsReq.DateEdit1Change(Sender: TObject);
begin
  DM1.tReq.FindKey([DateEdit1.Date])
end;

procedure TfConsReq.CurrencyEdit1Enter(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
  DateEdit1.Clear;
  DM1.tReq.IndexFieldNames := 'NroReq';
end;

procedure TfConsReq.CurrencyEdit1Change(Sender: TObject);
begin
  DM1.tReq.FindKey([CurrencyEdit1.Value])
end;

procedure TfConsReq.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.

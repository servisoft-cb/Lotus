unit UConsNotaFiscal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, CurrEdit, Mask, ToolEdit, RXLookup, Grids,
  DBGrids;

type
  TfConsNotaFiscal = class(TForm)
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel3: TPanel;
    BitBtn4: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DateEdit1: TDateEdit;
    CurrencyEdit1: TCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure DateEdit1Enter(Sender: TObject);
    procedure CurrencyEdit1Enter(Sender: TObject);
    procedure RxDBLookupCombo1CloseUp(Sender: TObject);
    procedure CurrencyEdit1Change(Sender: TObject);
    procedure DateEdit1Change(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsNotaFiscal: TfConsNotaFiscal;

implementation

uses UDM1, UAgendaTelef;

{$R *.DFM}

procedure TfConsNotaFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfConsNotaFiscal.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsNotaFiscal.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames   := 'Nome';
  DateEdit1.Clear;
  CurrencyEdit1.Clear;
  DM1.tNotaFiscal.IndexFieldNames := 'CodCli';
end;

procedure TfConsNotaFiscal.DateEdit1Enter(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
  CurrencyEdit1.Clear;
  DM1.tNotaFiscal.IndexFieldNames := 'DtEmissao';
end;

procedure TfConsNotaFiscal.CurrencyEdit1Enter(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
  DateEdit1.Clear;
  DM1.tNotaFiscal.IndexFieldNames := 'NumNota';
end;

procedure TfConsNotaFiscal.RxDBLookupCombo1CloseUp(Sender: TObject);
begin
  DM1.tNotaFiscal.FindKey([DM1.tClienteCodigo.AsInteger])
end;

procedure TfConsNotaFiscal.CurrencyEdit1Change(Sender: TObject);
begin
  DM1.tNotaFiscal.FindKey([CurrencyEdit1.Value])
end;

procedure TfConsNotaFiscal.DateEdit1Change(Sender: TObject);
begin
  DM1.tNotaFiscal.FindKey([DateEdit1.Date])
end;

procedure TfConsNotaFiscal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.

unit UConsNotaEnt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, CurrEdit, Mask, ToolEdit, RXLookup, Grids,
  DBGrids;

type
  TfConsNotaEnt = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn4: TBitBtn;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    DateEdit1: TDateEdit;
    CurrencyEdit1: TCurrencyEdit;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
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
  fConsNotaEnt: TfConsNotaEnt;

implementation

uses UDM1, UAgendaTelef;

{$R *.DFM}

procedure TfConsNotaEnt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfConsNotaEnt.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsNotaEnt.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tFornecedores.IndexFieldNames := 'NomeForn';
  DateEdit1.Clear;
  CurrencyEdit1.Clear;
  DM1.tNEntrada.IndexFieldNames  := 'CodForn';
end;

procedure TfConsNotaEnt.DateEdit1Enter(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
  CurrencyEdit1.Clear;
  DM1.tNEntrada.IndexFieldNames := 'DtEntrada';
end;

procedure TfConsNotaEnt.CurrencyEdit1Enter(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
  DateEdit1.Clear;
  DM1.tNEntrada.IndexFieldNames := 'NumNEntr';
end;

procedure TfConsNotaEnt.RxDBLookupCombo1CloseUp(Sender: TObject);
begin
  DM1.tNEntrada.FindKey([DM1.tFornecedoresCodForn.AsInteger])
end;

procedure TfConsNotaEnt.CurrencyEdit1Change(Sender: TObject);
begin
  DM1.tNEntrada.FindKey([CurrencyEdit1.Value])
end;

procedure TfConsNotaEnt.DateEdit1Change(Sender: TObject);
begin
  DM1.tNEntrada.FindKey([DateEdit1.Date])
end;

procedure TfConsNotaEnt.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
//  if (Shift = [ssCtrl]) and (Key = 76) then
//    DataModule1.Login;
end;

end.

unit UConsOrdemCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, CurrEdit, StdCtrls, Mask, ToolEdit, RXLookup, Buttons,
  ExtCtrls, RXDBCtrl, ALed, db, dbTables, DBCtrls;

type
  TfConsOrdemCompra = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DateEdit1: TDateEdit;
    CurrencyEdit1: TCurrencyEdit;
    RxDBGrid1: TRxDBGrid;
    Bevel2: TBevel;
    ALed3: TALed;
    Label4: TLabel;
    Panel3: TPanel;
    BitBtn4: TBitBtn;
    Panel4: TPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure DateEdit1Enter(Sender: TObject);
    procedure RxDBLookupCombo1CloseUp(Sender: TObject);
    procedure DateEdit1Change(Sender: TObject);
    procedure CurrencyEdit1Enter(Sender: TObject);
    procedure CurrencyEdit1Change(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
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
  fConsOrdemCompra: TfConsOrdemCompra;

implementation

uses UDM1, UConsPedidoNota, UAgendaTelef;

{$R *.DFM}

procedure TfConsOrdemCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfConsOrdemCompra.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsOrdemCompra.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tFornecedores.IndexFieldNames := 'NomeForn';
  DateEdit1.Clear;
  CurrencyEdit1.Clear;
  Edit1.Clear;
  DM1.tOrdemCompra.IndexFieldNames  := 'CodFornecedor';
end;

procedure TfConsOrdemCompra.DateEdit1Enter(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
  CurrencyEdit1.Clear;
  Edit1.Clear;
  DM1.tOrdemCompra.IndexFieldNames := 'DtEmissao';
end;

procedure TfConsOrdemCompra.RxDBLookupCombo1CloseUp(Sender: TObject);
begin
  DM1.tOrdemCompra.FindKey([DM1.tFornecedoresCodForn.AsInteger])
end;

procedure TfConsOrdemCompra.DateEdit1Change(Sender: TObject);
begin
  DM1.tOrdemCompra.FindKey([DateEdit1.Date])
end;

procedure TfConsOrdemCompra.CurrencyEdit1Enter(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
  DateEdit1.Clear;
  DM1.tOrdemCompra.IndexFieldNames := 'Filial;Codigo';
end;

procedure TfConsOrdemCompra.CurrencyEdit1Change(Sender: TObject);
begin
  DM1.tOrdemCompra.FindKey([1,CurrencyEdit1.Value]);
end;

procedure TfConsOrdemCompra.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if DM1.tOrdemCompraEntregue.AsBoolean then
    BackGround := $006FDD00;
end;

procedure TfConsOrdemCompra.Edit1Enter(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
  DateEdit1.Clear;
  CurrencyEdit1.Clear;
  DM1.tOrdemCompra.IndexFieldNames := 'Referencia';
end;

procedure TfConsOrdemCompra.Edit1Change(Sender: TObject);
begin
  DM1.tOrdemCompra.FindKey([Edit1.Text]);
end;

procedure TfConsOrdemCompra.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.

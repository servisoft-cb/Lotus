unit UEscNotaDevol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, RXCtrls, StdCtrls, Mask, DBCtrls, RxLookup, Grids, DBGrids,
  RXDBCtrl, Buttons, ToolEdit, CurrEdit;

type
  TfEscNotaDevol = class(TForm)
    Panel1: TPanel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBGrid1: TRxDBGrid;
    GroupBox1: TGroupBox;
    RxDBGrid2: TRxDBGrid;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    CurrencyEdit1: TCurrencyEdit;
    BitBtn2: TBitBtn;
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure CurrencyEdit1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEscNotaDevol: TfEscNotaDevol;

implementation

uses UDM1, UAgendaTelef;

{$R *.DFM}

procedure TfEscNotaDevol.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tFornecedores.IndexFieldNames := 'NomeForn';
end;

procedure TfEscNotaDevol.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tFornecedores.IndexFieldNames := 'CodForn';
end;

procedure TfEscNotaDevol.BitBtn1Click(Sender: TObject);
begin
  if MessageDlg('Cancelar a devolulção?',mtConfirmation,[mbOK,mbNo],0) = mrOK then
    begin
      CurrencyEdit1.Clear;
      RxDBLookupCombo1.ClearValue;
      Close;
    end
  else
    RxDBLookupCombo1.SetFocus;
end;

procedure TfEscNotaDevol.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfEscNotaDevol.FormShow(Sender: TObject);
begin
  RxDBLookupCombo1.KeyValue := DM1.tNotaFiscalCodForn.AsInteger;
  CurrencyEdit1.AsInteger   := DM1.tNotaFiscalNumNotaDevFor.AsInteger;
end;

procedure TfEscNotaDevol.RxDBLookupCombo1Change(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
    begin
      try
        DM1.tNEntrada.IndexFieldNames := 'CodForn';
        DM1.tNEntrada.FindNearest([RxDBLookupCombo1.KeyValue]);
      except;
      end;
    end;
end;

procedure TfEscNotaDevol.RxDBGrid1DblClick(Sender: TObject);
begin
  RxDBLookupCombo1.KeyValue := DM1.tNEntradaCodForn.AsInteger;
  CurrencyEdit1.AsInteger   := DM1.tNEntradaNumNEntr.AsInteger;
end;

procedure TfEscNotaDevol.CurrencyEdit1Change(Sender: TObject);
begin
  try
    DM1.tNEntrada.IndexFieldNames := 'NumNEntr';
    DM1.tNEntrada.FindNearest([CurrencyEdit1.AsInteger]);
  except;
  end;
end;

procedure TfEscNotaDevol.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (RxDBLookupCombo1.Text = '') or (CurrencyEdit1.AsInteger < 1) then
    begin
      RxDBLookupCombo1.ClearValue;
      CurrencyEdit1.Clear;
      DM1.tNotaFiscalNumNotaDevFor.Clear;
      DM1.tNotaFiscalCodForn.Clear;
    end;
  if CurrencyEdit1.AsInteger > 0 then
    begin
      DM1.tNEntrada.IndexFieldNames := 'NumNEntr;CodForn';
      DM1.tNEntrada.SetKey;
      DM1.tNEntradaNumNEntr.AsInteger := CurrencyEdit1.AsInteger;
      DM1.tNEntradaCodForn.AsInteger  := RxDBLookupCombo1.KeyValue;
      if not DM1.tNEntrada.GotoKey then
        begin
          ShowMessage('Nota não cadastrada');
          DM1.tNotaFiscalNumNotaDevFor.Clear;
          DM1.tNotaFiscalCodForn.Clear;
          RxDBLookupCombo1.SetFocus;
          CanClose := False;
        end
      else
        begin
          DM1.tNotaFiscalCodForn.AsInteger       := DM1.tNEntradaCodForn.AsInteger;
          DM1.tNotaFiscalNumNotaDevFor.AsInteger := DM1.tNEntradaNumNEntr.AsInteger;
          CanClose := True;
        end;
    end
  else
    CanClose := True;
end;

procedure TfEscNotaDevol.BitBtn2Click(Sender: TObject);
begin
  if RxDBLookupCombo1.Text = '' then
    begin
      ShowMessage('Falta informar o Fornecedor');
      RxDBLookupCombo1.SetFocus;
    end
  else
  if CurrencyEdit1.AsInteger < 1 then
    begin
      ShowMessage('Falta informar o número da nota');
      CurrencyEdit1.SetFocus;
    end
  else
    begin
      if MessageDlg('Nota devolvida.: ' +  CurrencyEdit1.Text + '  Fornecedor.: ' + RxDBLookupCombo1.Text +  '   Confirmar?',mtConfirmation,[mbOK,mbNo],0) = mrOK then
        close
      else
        begin
          RxDBLookupCombo1.ClearValue;
          CurrencyEdit1.Clear;
          RxDBLookupCombo1.SetFocus;
        end;
    end;
end;

procedure TfEscNotaDevol.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.

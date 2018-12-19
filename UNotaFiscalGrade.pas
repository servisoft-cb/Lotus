unit UNotaFiscalGrade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RxLookup, StdCtrls, Mask, ToolEdit, CurrEdit, Grids, DBVGrids, Buttons,
  ExtCtrls, Db, DBTables;

type
  TfNotaFiscalGrade = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel5: TPanel;
    BitBtn5: TBitBtn;
    VDBGrid1: TVDBGrid;
    CurrencyEdit1: TCurrencyEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1DropDown(Sender: TObject);
    procedure RxDBLookupCombo1CloseUp(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure VDBGrid1Enter(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure MontaGrade;
  public
    { Public declarations }
  end;

var
  fNotaFiscalGrade: TfNotaFiscalGrade;

implementation

uses UDM1, UEmissaoNotaFiscal, UConsEstoqueMat, UAgendaTelef;

{$R *.DFM}

procedure TfNotaFiscalGrade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfNotaFiscalGrade.MontaGrade;
begin
  fEmissaoNotaFiscal.tNotaFiscalItensIns.Refresh;
  fEmissaoNotaFiscal.tNotaFiscalItensIns.Last;
  fEmissaoNotaFiscal.tAuxNotaFiscalGrade.First;
  while not fEmissaoNotaFiscal.tAuxNotaFiscalGrade.Eof do
    fEmissaoNotaFiscal.tAuxNotaFiscalGrade.delete;
  DM1.tGradeItem.First;
  while not DM1.tGradeItem.Eof do
    begin
      fEmissaoNotaFiscal.tAuxNotaFiscalGrade.Insert;
      fEmissaoNotaFiscal.tAuxNotaFiscalGradeNumSeq.AsInteger     := DM1.tNotaFiscalNumSeq.AsInteger;      
      fEmissaoNotaFiscal.tAuxNotaFiscalGradeCodGrade.AsInteger   := DM1.tGradeItemCodGrade.AsInteger;
      fEmissaoNotaFiscal.tAuxNotaFiscalGradePosicao.AsInteger    := DM1.tGradeItemPosicao.AsInteger;
      fEmissaoNotaFiscal.tAuxNotaFiscalGradeQtd.AsString         := '';
      fEmissaoNotaFiscal.tAuxNotaFiscalGrade.Post;
      DM1.tGradeItem.Next;
    end;
  fEmissaoNotaFiscal.tAuxNotaFiscalGrade.First;
end;

procedure TfNotaFiscalGrade.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tGrade.IndexFieldNames := 'Nome';
end;

procedure TfNotaFiscalGrade.RxDBLookupCombo1CloseUp(Sender: TObject);
begin
  DM1.tGrade.IndexFieldNames := 'Codigo';
end;

procedure TfNotaFiscalGrade.RxDBLookupCombo1Exit(Sender: TObject);
begin
  MontaGrade;
end;

procedure TfNotaFiscalGrade.VDBGrid1Enter(Sender: TObject);
begin
 if CurrencyEdit1.Value = 0 then
   begin
     ShowMessage('É obrigatório informar a quantidade total!');
     CurrencyEdit1.SetFocus;
   end
 else
 if vDBGrid1.SelectedIndex = 0 then
   vDBGrid1.SelectedIndex := 1;
end;

procedure TfNotaFiscalGrade.BitBtn5Click(Sender: TObject);
var
 vQtd : Real;
begin
  vQtd      := 0;
  fEmissaoNotaFiscal.tAuxNotaFiscalGrade.First;
  while not fEmissaoNotaFiscal.tAuxNotaFiscalGrade.Eof do
    begin
      vQtd := vQtd + fEmissaoNotaFiscal.tAuxNotaFiscalGradeQtd.asFloat;
      fEmissaoNotaFiscal.tAuxNotaFiscalGrade.Next;
    end;
  if vQtd <> CurrencyEdit1.Value then
    begin
      ShowMessage('Quantidade da grade diferente da quantidade total!');
      CurrencyEdit1.SetFocus;
    end
  else
    begin
      fEmissaoNotaFiscal.Edit3.Text := FloatToStr(vQtd);
      Close;
    end;
end;

procedure TfNotaFiscalGrade.FormShow(Sender: TObject);
begin
  DM1.tGrade.IndexFieldNames := 'Codigo';
  RxDBLookupCombo1.KeyValue := DM1.tMaterialCodGrade.AsInteger;
  DM1.tGrade.FindKey([DM1.tMaterialCodGrade.AsInteger]);
  MontaGrade;
  CurrencyEdit1.Value := 0;
end;

procedure TfNotaFiscalGrade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
  if Key = Vk_F3 then
    begin
      if DM1.tUsuarioConsEstoqueMat.AsBoolean then
        begin
          fConsEstoqueMat := TfConsEstoqueMat.Create(Self);
          fConsEstoqueMat.ShowModal;
        end
      else
        ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir esta consulta!');
    end;
end;

end.

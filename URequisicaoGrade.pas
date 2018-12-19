unit URequisicaoGrade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RxLookup, StdCtrls, Mask, ToolEdit, CurrEdit, Grids, DBVGrids, Buttons,
  ExtCtrls, Db, DBTables;

type
  TfRequisicaoGrade = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel5: TPanel;
    BitBtn5: TBitBtn;
    VDBGrid1: TVDBGrid;
    CurrencyEdit1: TCurrencyEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    Edit2: TEdit;
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
  fRequisicaoGrade: TfRequisicaoGrade;

implementation

uses UDM1, URequisicao, UConsEstoqueMat, UAgendaTelef;

{$R *.DFM}

procedure TfRequisicaoGrade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRequisicaoGrade.MontaGrade;
begin
  Edit1.Text := DM1.tGradeCodLetra.AsString;
  Edit2.Text := DM1.tGradeLargura.AsString;
  if vEdit = 'N' then
    begin
      fRequisicao.tReqItemIns.Refresh;
      fRequisicao.tReqItemIns.Last;
      fRequisicao.tAuxReqGrade.First;
      while not fRequisicao.tAuxReqGrade.Eof do
        fRequisicao.tAuxReqGrade.delete;
      DM1.tGradeItem.First;
      while not DM1.tGradeItem.Eof do
        begin
          fRequisicao.tAuxReqGrade.Insert;
          fRequisicao.tAuxReqGradeCodGrade.AsInteger   := DM1.tGradeItemCodGrade.AsInteger;
          fRequisicao.tAuxReqGradePosicao.AsInteger    := DM1.tGradeItemPosicao.AsInteger;
          fRequisicao.tAuxReqGradeQtd.AsString         := '';
          fRequisicao.tAuxReqGrade.Post;
          DM1.tGradeItem.Next;
        end;
    end;
  fRequisicao.tAuxReqGrade.First;
end;

procedure TfRequisicaoGrade.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tGrade.IndexFieldNames := 'Nome';
end;

procedure TfRequisicaoGrade.RxDBLookupCombo1CloseUp(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
    begin
      Edit1.Text := DM1.tGradeCodLetra.AsString;
      Edit2.Text := DM1.tGradeLargura.AsString;
    end;
  DM1.tGrade.IndexFieldNames := 'Codigo';
end;

procedure TfRequisicaoGrade.RxDBLookupCombo1Exit(Sender: TObject);
begin
  MontaGrade;
end;

procedure TfRequisicaoGrade.VDBGrid1Enter(Sender: TObject);
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

procedure TfRequisicaoGrade.BitBtn5Click(Sender: TObject);
var
 vQtd : Real;
begin
  vQtd      := 0;
  fRequisicao.tAuxReqGrade.First;
  while not fRequisicao.tAuxReqGrade.Eof do
    begin
      vQtd := vQtd + fRequisicao.tAuxReqGradeQtd.asFloat;
      fRequisicao.tAuxReqGrade.Next;
    end;
  if vQtd <> CurrencyEdit1.Value then
    begin
      ShowMessage('Quantidade da grade diferente da quantidade total!');
      CurrencyEdit1.SetFocus;
    end
  else
    begin
      fRequisicao.CurrencyEdit1.Value := vQtd;
      Close;
    end;
end;

procedure TfRequisicaoGrade.FormShow(Sender: TObject);
begin
  DM1.tGrade.IndexFieldNames := 'Codigo';
  RxDBLookupCombo1.KeyValue := DM1.tMaterialCodGrade.AsInteger;
  DM1.tGrade.FindKey([DM1.tMaterialCodGrade.AsInteger]);
  MontaGrade;
  if vEdit = 'S' then
    CurrencyEdit1.Value := fRequisicao.CurrencyEdit1.Value;
end;

procedure TfRequisicaoGrade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 65) then
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

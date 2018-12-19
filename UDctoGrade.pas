unit UDctoGrade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RxLookup, StdCtrls, Mask, ToolEdit, CurrEdit, Grids, DBVGrids, Buttons,
  ExtCtrls;

type
  TfDctoGrade = class(TForm)
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
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure RxDBLookupCombo1DropDown(Sender: TObject);
    procedure RxDBLookupCombo1CloseUp(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure VDBGrid1Enter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure MontaGrade;
  public
    { Public declarations }
  end;

var
  fDctoGrade: TfDctoGrade;

implementation

uses UDctoEst, UDM1, UDM2, UConsEstoqueMat, UAgendaTelef;

{$R *.DFM}

procedure TfDctoGrade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfDctoGrade.MontaGrade;
begin
  Edit1.Text := DM1.tGradeCodLetra.AsString;
  Edit2.Text := DM1.tGradeLargura.AsString;
  if vEdit = 'N' then
    begin
      fDctoESt.tAuxDctoGrade.First;
      while not fDctoESt.tAuxDctoGrade.Eof do
        fDctoESt.tAuxDctoGrade.delete;
      DM1.tGradeItem.First;
      while not DM1.tGradeItem.Eof do
        begin
          fDctoEst.tAuxDctoGrade.Insert;
          fDctoEst.tAuxDctoGradeCodGrade.AsInteger   := DM1.tGradeItemCodGrade.AsInteger;
          fDctoEst.tAuxDctoGradePosicao.AsInteger    := DM1.tGradeItemPosicao.AsInteger;
          fDctoEst.tAuxDctoGradeQtd.AsString         := '';
          fDctoEst.tAuxDctoGrade.Post;
          DM1.tGradeItem.Next;
        end;
    end;
  fDctoEst.tAuxDctoGrade.First;
end;

procedure TfDctoGrade.RxDBLookupCombo1Exit(Sender: TObject);
begin
  MontaGrade;
end;

procedure TfDctoGrade.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tGrade.IndexFieldNames := 'Nome';
end;

procedure TfDctoGrade.RxDBLookupCombo1CloseUp(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
    begin
      Edit1.Text := DM1.tGradeCodLetra.AsString;
      Edit2.Text := DM1.tGradeLargura.AsString;
    end;
  DM1.tGrade.IndexFieldNames := 'Codigo';
end;

procedure TfDctoGrade.BitBtn5Click(Sender: TObject);
var
 vQtd : Real;
begin
  vQtd := 0;
  fDctoEst.tAuxDctoGrade.First;
  while not fDctoEst.tAuxDctoGrade.Eof do
    begin
      vQtd := vQtd + fDctoEst.tAuxDctoGradeQtd.asFloat;
      fDctoEst.tAuxDctoGrade.Next;
    end;
  if vQtd <> CurrencyEdit1.Value then
    begin
      ShowMessage('Quantidade da grade diferente da quantidade total!');
      CurrencyEdit1.SetFocus;
    end
  else
    begin
      fDctoEst.CurrencyEdit1.Value := vQtd;
      Close;
    end;
end;

procedure TfDctoGrade.VDBGrid1Enter(Sender: TObject);
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

procedure TfDctoGrade.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfDctoGrade.FormShow(Sender: TObject);
begin
  DM1.tGrade.IndexFieldNames := 'Codigo';
  RxDBLookupCombo1.KeyValue := DM1.tMaterialCodGrade.AsInteger;
  DM1.tGrade.FindKey([DM1.tMaterialCodGrade.AsInteger]);
  MontaGrade;
  if vEdit = 'S' then
    CurrencyEdit1.Value := fDctoEst.CurrencyEdit1.Value;
end;

end.

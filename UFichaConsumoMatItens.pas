unit UFichaConsumoMatItens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, DBFilter, DB, DBTables, ExtCtrls, StdCtrls, Buttons, RxLookup,
  CurrEdit, Mask, ToolEdit, DBCtrls, RXCtrls;

type
  TfFichaConsumoMatItens = class(TForm)
    Panel1: TPanel;
    SpeedButton7: TSpeedButton;
    BitBtn6: TBitBtn;
    RxDBLookupCombo2: TRxDBLookupCombo;
    SpeedButton5: TSpeedButton;
    CurrencyEdit8: TCurrencyEdit;
    CurrencyEdit9: TCurrencyEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure SpeedButton5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Limpa_Edit;
  public
     vItem : Integer;
    { Public declarations }
  end;

var
  fFichaConsumoMatItens: TfFichaConsumoMatItens;

implementation

uses UTipoMaterial, UDM1, UFichaConsumoMat;

{$R *.dfm}

procedure TfFichaConsumoMatItens.Limpa_Edit;
begin
  CurrencyEdit9.Clear;
  RxDBLookupCombo2.ClearValue;
  Edit2.Clear;
  Edit3.Clear;
  CurrencyEdit8.Clear;
  CurrencyEdit9.SetFocus;
end;

procedure TfFichaConsumoMatItens.SpeedButton5Click(Sender: TObject);
begin
  if DM1.tUsuarioTipoMaterial.AsBoolean then
    begin
      fTipoMaterial := TfTipoMaterial.Create(Self);
      fTipoMaterial.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfFichaConsumoMatItens.BitBtn6Click(Sender: TObject);
begin
  if (Edit2.Text = '') or (Edit3.Text = '') or (RxDBLookupCombo2.Text = '') or (CurrencyEdit8.Value = 0) then
    begin
      ShowMessage(' Há campos requeridos em branco, você deve acertar para gravar:' + #13 +
                  '"Tipo Material", "Descrição Material", "Unidade" ou "Consumo"');
      CurrencyEdit9.SetFocus;
    end
  else
  begin
    if (fFichaConsumoMat.BitBtn14.Tag = 1) and (vItem > 0) then
      DM1.tFichaConsumoMat.Edit
    else
    begin
      DM1.tFichaConsumoMat.Refresh;
      Dm1.tFichaConsumoMat.Last;
      vItem := DM1.tFichaConsumoMatItem.AsInteger + 1;
      DM1.tFichaConsumoMat.Insert;
      DM1.tFichaConsumoMatNumMov.AsInteger := DM1.tFichaConsumoNumMov.AsInteger;
      DM1.tFichaConsumoMatItem.AsInteger   := vItem;
      DM1.tFichaConsumoMatOpcao.AsInteger  := CurrencyEdit9.AsInteger;
    end;

    DM1.tFichaconsumoMatCodTipoMaterial.AsInteger := RxDBLookupCombo2.KeyValue;
    DM1.tFichaconsumoMatNomeMaterial.AsString     := Edit2.Text;
    DM1.tFichaconsumoMatUnidade.AsString          := Edit3.Text;
    DM1.tFichaconsumoMatConsumo.AsFloat           := CurrencyEdit8.Value;
    DM1.tFichaConsumoMat.Post;

    if fFichaConsumoMat.BitBtn14.Tag = 1 then
      Close
    else
    begin
      Limpa_Edit;
      CurrencyEdit9.SetFocus;
    end;
  end;
end;

procedure TfFichaConsumoMatItens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  vItem  := 0;
  Action := Cafree;
  fFichaConsumoMat.BitBtn6.SetFocus;
end;

procedure TfFichaConsumoMatItens.SpeedButton7Click(Sender: TObject);
begin
  Close;
end;

procedure TfFichaConsumoMatItens.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_F10 then
    Close;
end;

end.

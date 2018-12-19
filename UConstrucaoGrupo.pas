unit UConstrucaoGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons, Mask, ToolEdit,
  CurrEdit, RxLookup, ExtCtrls, SMDBGrid, DB, DBTables;

type
  TfConstrucaoGrupo = class(TForm)
    RxDBGrid1: TRxDBGrid;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel6: TPanel;
    SpeedButton8: TSpeedButton;
    SpeedButton16: TSpeedButton;
    RadioGroup1: TRadioGroup;
    StaticText3: TStaticText;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo15: TRxDBLookupCombo;
    StaticText11: TStaticText;
    StaticText2: TStaticText;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Edit2: TEdit;
    StaticText12: TStaticText;
    StaticText4: TStaticText;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    CurrencyEdit3: TCurrencyEdit;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn15: TBitBtn;
    SMDBGrid1: TSMDBGrid;
    tConstrucaoMat: TTable;
    dsConstrucaoMat: TDataSource;
    tConstrucaoMatCodConstrucao: TIntegerField;
    tConstrucaoMatCodConstrucaoGrupo: TIntegerField;
    tConstrucaoMatItem: TIntegerField;
    tConstrucaoMatCodMaterial: TIntegerField;
    tConstrucaoMatCodGrade: TIntegerField;
    tConstrucaoMatCodCor: TIntegerField;
    tConstrucaoMatQtd: TFloatField;
    tConstrucaoMatVlrUnitario: TFloatField;
    tConstrucaoMatVlrTotal: TFloatField;
    tConstrucaoMatCodPosicao: TIntegerField;
    tConstrucaoMatImpTalao: TStringField;
    tConstrucaoMatUnidade: TStringField;
    tConstrucaoMatlkNomeMaterial: TStringField;
    tConstrucaoMatlkNomeCor: TStringField;
    tConstrucaoMatlkNomePosicao: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
    procedure RxDBLookupCombo15Enter(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure RxDBLookupCombo3Exit(Sender: TObject);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure CurrencyEdit2Exit(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
  private
    { Private declarations }
    vItemGrupo : Integer;
    vItemMat : Integer;
  public
    { Public declarations }
  end;

var
  fConstrucaoGrupo: TfConstrucaoGrupo;

implementation

uses UDM1, UDM2, UConstrucao, UMaterial, UPosicao;

{$R *.dfm}

procedure TfConstrucaoGrupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tConstrucaoMat.Filtered := False;
  tConstrucaoMat.Close;
  Action := Cafree;
end;

procedure TfConstrucaoGrupo.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfConstrucaoGrupo.FormShow(Sender: TObject);
begin
  tConstrucaoMat.Open;
  if DM1.tConstrucaoGrupo.RecordCount > 0 then
    SMDBGrid1.DataSource := dsConstrucaoMat
  else
    SMDBGrid1.DataSource := nil;
end;

procedure TfConstrucaoGrupo.BitBtn1Click(Sender: TObject);
begin
  if Edit1.Text <> '' then
    begin
      DM1.tConstrucaoGrupo.Refresh;
      if DM1.tConstrucaoGrupo.Locate('CodGrupoConstr',vItemGrupo,([LocaseInsensitive])) then
        DM1.tConstrucaoGrupo.Edit
      else
        begin
          DM1.tConstrucaoGrupo.Last;
          vItemGrupo := DM1.tConstrucaoGrupoCodGrupoConstr.AsInteger;
          DM1.tConstrucaoGrupo.Insert;
          DM1.tConstrucaoGrupoCodConstrucao.AsInteger  := DM1.tConstrucaoCodigo.AsInteger;
          DM1.tConstrucaoGrupoCodGrupoConstr.AsInteger := vItemGrupo + 1;
        end;
      DM1.tConstrucaoGrupoNome.AsString := Edit1.Text;
      DM1.tConstrucaoGrupo.Post;
      vItemGrupo := 0;
      SMDBGrid1.DataSource := dsConstrucaoMat;
    end
  else
    ShowMessage('Falta informar o nome do grupo!');
  Edit1.Clear;
  Edit1.SetFocus;
end;

procedure TfConstrucaoGrupo.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Deseja excluir o grupo?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
    begin
      DM1.tConstrucaoMat.Filtered := False;
      DM1.tConstrucaoMat.Filter   := 'CodConstrucaoGrupo = '''+DM1.tConstrucaoGrupoCodGrupoConstr.AsString+'''';
      DM1.tConstrucaoMat.Filtered := True;
      DM1.tConstrucaoMat.First;
      while not DM1.tConstrucaoMat.Eof do
        DM1.tConstrucaoMat.Delete;
      DM1.tConstrucaoGrupo.Delete;
      DM1.tConstrucaoMat.Refresh;
      tConstrucaoMat.Refresh;
      DM1.tConstrucaoMat.Filtered := False;
      if DM1.tConstrucaoGrupo.RecordCount > 0 then
        SMDBGrid1.DataSource := dsConstrucaoMat
      else
        SMDBGrid1.DataSource := nil;
    end;
end;

procedure TfConstrucaoGrupo.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tMaterial.IndexFieldNames := 'Nome';
end;

procedure TfConstrucaoGrupo.RxDBLookupCombo2Exit(Sender: TObject);
begin
  if (vItemMat < 1) and (RxDBLookupCombo2.Text <> '') then
    begin
      if DM1.tMaterial.Locate('Codigo',RxDBLookupCombo2.KeyValue,([LocaseInsensitive])) then
        begin
          Edit2.Text          := DM1.tMaterialUnidade.AsString;
          CurrencyEdit2.Value := DM1.tMaterialPrCusto.AsCurrency;
        end;
    end;
end;

procedure TfConstrucaoGrupo.RxDBLookupCombo15Enter(Sender: TObject);
begin
  DM1.tPosicao.IndexFieldNames := 'Nome';
end;

procedure TfConstrucaoGrupo.RxDBLookupCombo3Enter(Sender: TObject);
begin
  if RxDBLookupCombo2.Text = '' then
    ShowMessage('Falta informar o material!')
  else
    fConstrucao.Monta_SQLCor(RxDBLookupCombo2.KeyValue);
end;

procedure TfConstrucaoGrupo.RxDBLookupCombo3Exit(Sender: TObject);
begin
  if (RxDBLookupCombo2.Text <> '') and (RxDBLookupCombo3.Text <> '') then
    begin
      if (DM1.tMaterial.Locate('Codigo',RxDBLookupCombo2.KeyValue,([LocaseInsensitive]))) and (DM1.tMaterialPrecoCor.AsBoolean) then
        if DM1.tMaterialCor.Locate('CodCor',RxDBLookupCombo3.KeyValue,([LocaseInsensitive])) then
          CurrencyEdit2.Value := DM1.tMaterialCorPrCusto.AsFloat;
    end;
end;

procedure TfConstrucaoGrupo.CurrencyEdit1Exit(Sender: TObject);
begin
  CurrencyEdit3.Value := CurrencyEdit1.Value * CurrencyEdit2.Value;
end;

procedure TfConstrucaoGrupo.CurrencyEdit2Exit(Sender: TObject);
begin
  CurrencyEdit3.Value := CurrencyEdit1.Value * CurrencyEdit2.Value;
end;

procedure TfConstrucaoGrupo.BitBtn10Click(Sender: TObject);
var
  vItemAux : Integer;
begin
  if DM1.tConstrucaoGrupoCodGrupoConstr.AsInteger <= 0 then
    begin
      ShowMessage('Falta informar primeiro o grupo!');
      exit;
    end;

  if (RxDBLookupCombo2.Text = '') or (Edit2.Text = '') then
    begin
      ShowMessage('Falta informar o material ou a unidade!');
      exit;
    end;

  if not DM1.tMaterial.Locate('Codigo',RxDBLookupCombo2.KeyValue,[loCaseInsensitive]) then
    begin
      ShowMessage('Material não cadastrado!');
      exit;
    end;

  if (DM1.tMaterialLancaCor.AsBoolean) and (RxDBLookupCombo3.Text = '') then
    begin
      ShowMessage('Este material é obrigado a informar a cor');
      RxDBLookupCombo3.SetFocus;
      exit;
    end;

  DM1.tConstrucaoMat.Refresh;
  DM1.tConstrucaoMat.Last;
  vItemAux := DM1.tConstrucaoMatItem.AsInteger;
  if vItemMat > 0 then
    vItemAux := vItemMat
  else
    vItemAux := vItemAux + 1;
  if DM1.tConstrucaoMat.Locate('CodConstrucaoGrupo;Item',VarArrayOf([DM1.tConstrucaoGrupoCodGrupoConstr.AsInteger,vItemAux]),[locaseinsensitive]) then
    DM1.tConstrucaoMat.Edit
  else
    begin
      DM1.tConstrucaoMat.Insert;
      DM1.tConstrucaoMatCodConstrucao.AsInteger      := DM1.tConstrucaoCodigo.AsInteger;
      DM1.tConstrucaoMatCodConstrucaoGrupo.AsInteger := DM1.tConstrucaoGrupoCodGrupoConstr.AsInteger;
      DM1.tConstrucaoMatItem.AsInteger               := vItemAux;
    end;
  DM1.tConstrucaoMatCodMaterial.AsInteger        := RxDBLookupCombo2.KeyValue;
  DM1.tConstrucaoMatCodGrade.AsInteger           := DM1.tMaterialCodGrade.AsInteger;
  if RxDBLookupCombo3.Text <> '' then
    DM1.tConstrucaoMatCodCor.AsInteger := RxDBLookupCombo3.KeyValue;
  DM1.tConstrucaoMatQtd.AsFloat         := CurrencyEdit1.Value;
  DM1.tConstrucaoMatUnidade.AsString    := Edit2.Text;
  DM1.tConstrucaoMatVlrUnitario.AsFloat := CurrencyEdit2.Value;
  DM1.tConstrucaoMatVlrTotal.AsFloat    := CurrencyEdit3.Value;
  if RxDBLookupCombo15.Text <> '' then
    DM1.tConstrucaoMatCodPosicao.AsInteger := RxDBLookupCombo15.KeyValue;
  case RadioGroup1.ItemIndex of
    0 : DM1.tConstrucaoMatImpTalao.AsString := 'S';
    1 : DM1.tConstrucaoMatImpTalao.AsString := 'N';
  end;
  DM1.tConstrucaoMat.Post;
  DM1.tConstrucaoMat.Refresh;
  tConstrucaoMat.Refresh;
  tConstrucaoMat.Last;
  BitBtn11Click(Sender);
end;

procedure TfConstrucaoGrupo.BitBtn11Click(Sender: TObject);
begin
  RxDBLookupCombo2.ClearValue;
  RxDBLookupCombo15.ClearValue;
  RxDBLookupCombo3.ClearValue;
  CurrencyEdit1.Clear;
  CurrencyEdit2.Clear;
  CurrencyEdit3.Clear;
  Edit2.Clear;
  vItemMat := 0;
end;

procedure TfConstrucaoGrupo.BitBtn12Click(Sender: TObject);
begin
  if tConstrucaoMat.RecordCount > 0 then
    begin
      if DM1.tConstrucaoMat.Locate('CodConstrucaoGrupo;Item',VarArrayOf([DM1.tConstrucaoGrupoCodGrupoConstr.AsInteger,tConstrucaoMatItem.AsInteger]),[locaseinsensitive]) then
        if MessageDlg('Deseja excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
          DM1.tConstrucaoMat.Delete;
      tConstrucaoMat.Refresh;
      tConstrucaoMat.Last;
    end;
end;

procedure TfConstrucaoGrupo.BitBtn15Click(Sender: TObject);
begin
  if tConstrucaoMatItem.AsInteger > 0 then
    begin
      vItemMat := tConstrucaoMatItem.AsInteger;
      if tConstrucaoMatImpTalao.AsString = 'S' then
        RadioGroup1.ItemIndex := 0
      else
        RadioGroup1.ItemIndex := 1;
      RxDBLookupCombo2.KeyValue := tConstrucaoMatCodMaterial.AsInteger;
      RxDBLookupCombo15.ClearValue;
      RxDBLookupCombo3.ClearValue;
      if tConstrucaoMatCodPosicao.AsInteger > 0 then
        RxDBLookupCombo15.KeyValue := tConstrucaoMatCodPosicao.AsInteger;
      fConstrucao.Monta_SQLCor(tConstrucaoMatCodMaterial.AsInteger);
      if tConstrucaoMatCodCor.AsInteger > 0 then
        RxDBLookupCombo3.KeyValue := tConstrucaoMatCodCor.AsInteger;
      Edit2.Text := tConstrucaoMatUnidade.AsString;
      CurrencyEdit1.Value := tConstrucaoMatQtd.AsFloat;
      CurrencyEdit2.Value := tConstrucaoMatVlrUnitario.AsFloat;
      CurrencyEdit3.Value := tConstrucaoMatVlrTotal.AsFloat;
      RadioGroup1.SetFocus;
    end;
end;

procedure TfConstrucaoGrupo.SpeedButton8Click(Sender: TObject);
begin
  if DM1.tUsuarioMaterial.AsBoolean then
    begin
      fConstrucao.RxDBFilter1.Active := False;
      DM1.tMaterial.Refresh;
      fMaterial := TfMaterial.Create(Self);
      fMaterial.ShowModal;
      fConstrucao.RxDBFilter1.Active := True;
      DM1.tMaterial.Refresh;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');

end;

procedure TfConstrucaoGrupo.SpeedButton16Click(Sender: TObject);
begin
  if DM1.tUsuarioPosicao.AsBoolean then
    begin
      fPosicao := TfPosicao.Create(Self);
      fPosicao.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

end.

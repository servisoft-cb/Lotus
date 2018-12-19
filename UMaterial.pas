unit UMaterial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, DBCtrls, StdCtrls, Buttons, Mask,
  ToolEdit, CurrEdit, ComCtrls, Db, DBTables, RXLookup, Grids, DBGrids, DBVGrids, MemTable, DBFilter, RXDBCtrl, Variants,
  DBClient;

type
  TfMaterial = class(TForm)
    tMaterialIns: TTable;
    tMaterialInsCodigo: TIntegerField;
    tMaterialInsNome: TStringField;
    tMaterialInsGrupo: TIntegerField;
    tMaterialInsSubGrupo: TIntegerField;
    tMaterialInsICMS: TFloatField;
    tMaterialInsIPI: TFloatField;
    tMaterialInsPrCusto: TFloatField;
    tMaterialInsFornecedor: TIntegerField;
    tMaterialInsEstMinimo: TFloatField;
    tMaterialInsInativo: TBooleanField;
    SpeedButton4: TSpeedButton;
    tMaterialCorIns: TTable;
    tMaterialCorInsCodMaterial: TIntegerField;
    tMaterialCorInsItem: TIntegerField;
    tMaterialCorInsCodCor: TIntegerField;
    tMaterialInsCodGrade: TIntegerField;
    tMaterialInsLancaCor: TBooleanField;
    tMaterialInsPrecoCor: TBooleanField;
    tMaterialInsLancaGrade: TBooleanField;
    tMaterialInsPrecoGrade: TBooleanField;
    tMaterialCorInsPrCusto: TFloatField;
    tMemMaterialGradePreco: TMemoryTable;
    dsMemMaterialGradePreco: TDataSource;
    tMemMaterialGradePrecoPos1: TFloatField;
    tMemMaterialGradePrecoPos2: TFloatField;
    tMemMaterialGradePrecoPos3: TFloatField;
    tMemMaterialGradePrecoPos4: TFloatField;
    tMemMaterialGradePrecoPos5: TFloatField;
    tMemMaterialGradePrecoPos6: TFloatField;
    tMemMaterialGradePrecoPos7: TFloatField;
    tMemMaterialGradePrecoPos9: TFloatField;
    tMemMaterialGradePrecoPos10: TFloatField;
    tMemMaterialGradePrecoPos11: TFloatField;
    tMemMaterialGradePrecoPos12: TFloatField;
    tMemMaterialGradePrecoPos13: TFloatField;
    tMemMaterialGradePrecoPos14: TFloatField;
    tMemMaterialGradePrecoPos15: TFloatField;
    tMemMaterialGradePrecoPos16: TFloatField;
    tMemMaterialGradePrecoPos17: TFloatField;
    tMemMaterialGradePrecoPos18: TFloatField;
    tMemMaterialGradePrecoPos19: TFloatField;
    tMemMaterialGradePrecoPos20: TFloatField;
    tMemMaterialGradePrecoPos8: TFloatField;
    tAuxMaterialGrade: TTable;
    dsAuxMaterialGrade: TDataSource;
    tAuxMaterialGradeCodGrade: TIntegerField;
    tAuxMaterialGradePosicao: TIntegerField;
    tAuxMaterialGradeTamanho: TStringField;
    tMaterialInsTipoMat: TStringField;
    tAuxMaterialGradePeso: TFloatField;
    tMaterialInsUnidade: TStringField;
    tMaterialInsTipoSolado: TStringField;
    RxDBFilter1: TRxDBFilter;
    tAuxMaterialGradeTamMaterial: TStringField;
    tProdutoMat: TTable;
    tProdutoMatCodMaterial: TIntegerField;
    tProdutoMatCodProduto: TIntegerField;
    tProdutoMatCodCor: TIntegerField;
    Panel2: TPanel;
    Label1: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    Panel4: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    SpeedButton3: TSpeedButton;
    Label16: TLabel;
    Label6: TLabel;
    SpeedButton5: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    SpeedButton8: TSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    GroupBox2: TGroupBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    RxDBLookupCombo4: TRxDBLookupCombo;
    RxDBLookupCombo5: TRxDBLookupCombo;
    RxDBLookupCombo6: TRxDBLookupCombo;
    RxDBLookupCombo7: TRxDBLookupCombo;
    RxDBLookupCombo8: TRxDBLookupCombo;
    Panel5: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    BitBtn5: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    SpeedButton6: TSpeedButton;
    RxDBLookupCombo2: TRxDBLookupCombo;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    DBGrid1: TDBGrid;
    CurrencyEdit1: TCurrencyEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    BitBtn15: TBitBtn;
    TabSheet2: TTabSheet;
    SpeedButton7: TSpeedButton;
    RxDBLookupCombo1: TRxDBLookupCombo;
    StaticText3: TStaticText;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    DBGrid3: TDBGrid;
    TabSheet4: TTabSheet;
    StaticText4: TStaticText;
    Edit1: TEdit;
    StaticText5: TStaticText;
    Edit2: TEdit;
    StaticText6: TStaticText;
    CurrencyEdit2: TCurrencyEdit;
    RxDBGrid1: TRxDBGrid;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    Label13: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    DBCheckBox9: TDBCheckBox;
    Label14: TLabel;
    DBMemo1: TDBMemo;
    Label17: TLabel;
    RxDBLookupCombo9: TRxDBLookupCombo;
    DBCheckBox10: TDBCheckBox;
    Label44: TLabel;
    RxDBLookupCombo18: TRxDBLookupCombo;
    SpeedButton12: TSpeedButton;
    TabSheet3: TTabSheet;
    Label18: TLabel;
    DBText2: TDBText;
    Label19: TLabel;
    DBText3: TDBText;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    Panel1: TPanel;
    Label20: TLabel;
    BitBtn20: TBitBtn;
    Panel6: TPanel;
    Label21: TLabel;
    qVerificaOC: TQuery;
    qVerificaEstoque: TQuery;
    qVerificaOCCodMaterial: TIntegerField;
    qVerificaEstoqueCodMaterial: TIntegerField;
    Label45: TLabel;
    DBEdit21: TDBEdit;
    Label46: TLabel;
    DBEdit22: TDBEdit;
    Label47: TLabel;
    RxDBLookupCombo17: TRxDBLookupCombo;
    Label48: TLabel;
    Label22: TLabel;
    DBText4: TDBText;
    mPrecoAux: TClientDataSet;
    mPrecoAuxPreco: TFloatField;
    mPrecoAuxCodCor: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure DBCheckBox2Click(Sender: TObject);
    procedure GroupBox2Exit(Sender: TObject);
    procedure DBCheckBox5Click(Sender: TObject);
    procedure DBCheckBox4Click(Sender: TObject);
    procedure GroupBox1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure SpeedButton6Click(Sender: TObject);
    procedure tAuxMaterialGradeBeforeInsert(DataSet: TDataSet);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure DBRadioGroup1Exit(Sender: TObject);
    procedure RxDBLookupCombo2DropDown(Sender: TObject);
    procedure RxDBLookupCombo2CloseUp(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure RxDBLookupCombo3DropDown(Sender: TObject);
    procedure RxDBLookupCombo4DropDown(Sender: TObject);
    procedure RxDBLookupCombo4CloseUp(Sender: TObject);
    procedure RxDBLookupCombo5DropDown(Sender: TObject);
    procedure RxDBLookupCombo5CloseUp(Sender: TObject);
    procedure RxDBLookupCombo6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo6DropDown(Sender: TObject);
    procedure RxDBLookupCombo6CloseUp(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure RxDBLookupCombo7Enter(Sender: TObject);
    procedure CurrencyEdit3Enter(Sender: TObject);
    procedure CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton12Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure RxDBLookupCombo17KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    vPreco_Ant : Real;
    vPreco_Cor_Ant : Real;
    vAlt_Preco : Boolean;
    procedure Habilita;
    procedure opcoes;

    function Verificar_GradeReferencia : Boolean;
    function fnc_AlterarOK : Boolean;
  public
    { Public declarations }
  end;

var
  fMaterial: TfMaterial;
  i2 : Integer;

implementation

uses UGrupos, UDM1, USubGrupos, UFornecedores, UGrade, UCor, UMaterialGrade,
  UClasFiscal, UAgendaTelef, UDMTabImposto, UOrigemProd,
  UDMMaterialFornecedor, UMaterialFornecedor, USenhaExc, uIntegracao,
  uUtilPadrao, UConsMaterial, UDMTabEnqIPI, USel_EnqIPI;

{$R *.DFM}

procedure TfMaterial.Habilita;
begin
  Panel2.Enabled           := not(Panel2.Enabled);
  Panel4.Enabled           := not(Panel4.Enabled);
  BitBtn1.Enabled          := not(BitBtn1.Enabled);
  BitBtn2.Enabled          := not(BitBtn2.Enabled);
  BitBtn3.Enabled          := not(BitBtn3.Enabled);
  BitBtn4.Enabled          := not(BitBtn4.Enabled);
  BitBtn5.Enabled          := not(BitBtn5.Enabled);
  BitBtn6.Enabled          := not(BitBtn6.Enabled);
  BitBtn7.Enabled          := not(BitBtn7.Enabled);
  BitBtn8.Enabled          := not(BitBtn8.Enabled);
  BitBtn9.Enabled          := not(BitBtn9.Enabled);
  BitBtn10.Enabled         := not(BitBtn10.Enabled);
  BitBtn11.Enabled         := not(BitBtn11.Enabled);
  BitBtn12.Enabled         := not(BitBtn12.Enabled);
  BitBtn15.Enabled         := not(BitBtn15.Enabled);
  SpeedButton6.Enabled     := not(SpeedButton6.Enabled);
  SpeedButton7.Enabled     := not(SpeedButton7.Enabled);
  DBNavigator1.Enabled     := not(DBNavigator1.Enabled);
  RxDBLookupCombo1.Enabled := not(RxDBLookupCombo1.Enabled);
  RxDBLookupCombo2.Enabled := not(RxDBLookupCombo2.Enabled);
  CurrencyEdit1.Enabled    := not(CurrencyEdit1.Enabled);
  DBEdit21.ReadOnly        := not(DBEdit21.ReadOnly);
  DBEdit22.ReadOnly        := not(DBEdit22.ReadOnly);
end;

procedure TfMaterial.Opcoes;
begin
  TabSheet1.Enabled         := DbCheckBox2.Checked;
  TabSheet2.Enabled         := DbCheckBox5.Checked;
  RxDBLookupCombo7.Enabled  := DbCheckBox5.Checked;
  CurrencyEdit1.Enabled     := DbCheckBox4.Checked;
  DbCheckBox4.Enabled       := DbCheckBox2.Checked;
  CurrencyEdit1.Enabled     := DbCheckBox4.Checked;
  Label12.Visible           := not(DbCheckBox4.Checked);
  DbEdit7.Visible           := not(DbCheckBox4.Checked);
  Panel1.Visible            := not(DM1.tMaterialCorreto.AsBoolean);
  Panel6.Visible            := not(DM1.tMaterialCorreto.AsBoolean);
end;

procedure TfMaterial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
  begin
    DM1.tMaterial.Close;
    Dm1.tMaterialCor.Close;
    DM1.tMaterialGradeNum.Close;
    DM1.tMaterialUM.Close;
    DM1.tCor.Close;
    DM1.tFornecedores.Close;
    DM1.tGrade.Close;
    DM1.tGradeItem.Close;
    DM1.tSitTributaria.Close;
    DM1.tClasFiscal.Close;
    DM1.tGrupo.Close;
    DM1.tSubGrupo.Close;
  end;
  RxDBFilter1.Active := False;
  
  if DMTabImposto.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMTabImposto);
  if DMTabEnqIPI.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMTabEnqIPI);
  if DMMaterialFornecedor.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMMaterialFornecedor);

  Action := Cafree;
end;

procedure TfMaterial.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfMaterial.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioGrupos.AsBoolean then
    begin
      fGrupos := TfGrupos.Create(Self);
      fGrupos.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de grupos!');
end;

procedure TfMaterial.BitBtn1Click(Sender: TObject);
var
 posicao : integer;
begin
  if DM1.tUsuarioInsMaterial.AsBoolean then
  begin
    //mPrecoAux.EmptyDataSet;
    vPreco_Ant      := 0;
    vPreco_Cor_Ant  := 0;
    DBEdit1.ReadOnly          := False;
    BitBtn19.Enabled          := False;
    RxDBLookupCombo7.ReadOnly := False;
    DM1.tMaterial.IndexFieldNames := 'Codigo';
    tMaterialIns.IndexFieldNames  := 'Codigo';
    tMaterialIns.Refresh;
    tMaterialIns.Last;
    DM1.tMaterial.Refresh;
    DM1.tMaterial.Insert;
    DM1.tMaterialCodigo.AsInteger        := tMaterialInsCodigo.AsInteger + 1;
    DM1.tMaterialLancaCor.AsBoolean      := False;
    DM1.tMaterialPrecoCor.AsBoolean      := False;
    DM1.tMaterialLancaGrade.AsBoolean    := False;
    DM1.tMaterialPrecoGrade.AsBoolean    := False;
    DM1.tMaterialInativo.AsBoolean       := False;
    DM1.tMaterialCalcMaterial.AsBoolean  := True;
    DM1.tMaterialTipoMat.AsString        := 'O';
    DM1.tMaterialMaterialOutros.AsString := 'M';
    DM1.tMaterialPre.AsBoolean           := False;
    DM1.tMaterial.Post;
    DM1.tMaterial.Edit;
    DM1.tMaterialTipoSolado.AsString     := 'O';
    Habilita;
    Opcoes;
    PageControl1.ActivePage := TabSheet1;
    DBEdit1.SetFocus;
    for posicao := 1 to 20 do
    begin
      tMemMaterialGradePreco.FieldByName('Pos'+IntToStr(Posicao)).Visible      := False;
      tMemMaterialGradePreco.FieldByName('Pos'+IntToStr(Posicao)).DisplayLabel := '';
    end;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfMaterial.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltMaterial.AsBoolean then
  begin
    vPreco_Ant     := StrToFloat(FormatFloat('0.0000',DM1.tMaterialPrCusto.AsFloat));
    vPreco_Cor_Ant := 0;
    DM1.tMaterial.Edit;
    DBEdit1.ReadOnly          := not(fnc_AlterarOK);
    BitBtn19.Enabled          := DBEdit1.ReadOnly;
    RxDBLookupCombo7.ReadOnly := True;
    Habilita;
    BitBtn2.Tag := 1;
    PageControl1.ActivePage := TabSheet1;
    DBEdit1.SetFocus;
    opcoes;
    //mPrecoAux.EmptyDataSet;
    {DM1.tMaterialCor.First;
    while not DM1.tMaterialCor.Eof do
    begin
      mPrecoAux.Insert;
      mPrecoAuxCodCor.AsInteger := DM1.tMaterialCorCodCor.AsInteger;
      mPrecoAuxPreco.AsFloat    := StrToFloat(FormatFloat('0.0000',DM1.tMaterialCorPrCusto.AsFloat));
      mPrecoAux.Post;
      DM1.tMaterialCor.Next;
    end;}
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfMaterial.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    begin
      DM1.tMaterialCor.First;
      while not DM1.tMaterialCor.Eof do
        DM1.tMaterialCor.Delete;
      DM1.tMaterialGradeNum.First;
      while not DM1.tMaterialGradeNum.Eof do
        DM1.tMaterialGradeNum.Delete;
      DM1.tMaterialUM.First;
      while not DM1.tMaterialUM.Eof do
        DM1.tMaterialUM.Delete;
      DM1.tMaterial.Delete;
    end
  else
  if BitBtn2.Tag = 1 then
    DM1.tMaterial.Cancel;
  BitBtn2.Tag := 0;
  RxDBLookupCombo2.ClearValue;
  CurrencyEdit1.Clear;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfMaterial.BitBtn3Click(Sender: TObject);
var
  vCodigo : Integer;
begin
  if DM1.tUsuarioExcMaterial.AsBoolean then
  begin
    if tProdutoMat.Locate('CodMaterial',DM1.tMaterialCodigo.AsInteger,[loCaseInsensitive]) then
      ShowMessage('Este material não pode ser excluido, pois esta no produto ' + tProdutoMatCodProduto.AsString)
    else
    begin
      if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
      begin
        DM1.tMaterialCor.First;
        while not DM1.tMaterialCor.Eof do
          DM1.tMaterialCor.Delete;
        DM1.tMaterialGradeNum.First;
        while not DM1.tMaterialGradeNum.Eof do
          DM1.tMaterialGradeNum.Delete;
        DM1.tMaterialUM.First;
        while not DM1.tMaterialUM.Eof do
          DM1.tMaterialUM.Delete;
        vCodigo := DM1.tMaterialCodigo.AsInteger;
        DM1.tMaterial.Delete;
        Prc_Excluir_Material_FB(vCodigo);
      end;
    end;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfMaterial.BitBtn5Click(Sender: TObject);
var
  vAlt : Boolean;
begin
  if DM1.tMaterial.State in [dsEdit,dsInsert] then
  begin
    //NFe 2.00
    if DM1.tMaterialOrigemProd.AsString = '' then
    begin
      ShowMessage('Origem do material não foi informada!');
      exit;
    end;

    if (DbCheckBox5.Checked = True) and (DM1.tMaterialCodGrade.AsInteger < 1) then
      ShowMessage('Falta o código da grade!')
    else
    begin
      DM1.tMaterialDtAlteracao.AsDateTime := Date;
      DM1.tMaterialCorreto.AsBoolean := Verificar_GradeReferencia;
      Panel1.Visible := not(DM1.tMaterialCorreto.AsBoolean);
      Panel6.Visible := not(DM1.tMaterialCorreto.AsBoolean);
      if not DM1.tMaterialCorreto.AsBoolean then
        PageControl1.ActivePage := TabSheet2;
      if not(DM1.tMaterialCorreto.AsBoolean) and not(DM1.tParametrosConfirmarMatComErro.AsBoolean) then
        exit;
      if not DM1.tMaterialCorreto.AsBoolean then
        if MessageDlg('Deseja confirmar o material com erro na grade referência?', mtConfirmation,[mbOk,mbNo],0)=mrNo then
          exit;
      DM1.tMaterialNomeSemAcento.AsString := TirarAcento(DM1.tMaterialNome.AsString);
      vAlt := False;
      {DM1.tMaterialCor.First;
      while not DM1.tMaterialCor.Eof do
      begin
        if not mPrecoAux.Locate('CodCor',DM1.tMaterialCorCodCor.AsInteger,[loCaseInsensitive]) then
          vAlt := True
        else
        begin
          if StrToFloat(FormatFloat('0.0000',DM1.tMaterialCorPrCusto.AsFloat)) <> StrToFloat(FormatFloat('0.0000',mPrecoAuxPreco.AsFloat)) then
            vAlt := True;
        end;
        if vAlt then
          DM1.tMaterialCor.Last;
        DM1.tMaterialCor.Next;
      end;}
      DM1.tMaterialCor.First;
      while not DM1.tMaterialCor.Eof do
      begin
        if DM1.tMaterialCorDtAlteracao.AsDateTime = Date then
        begin
          vAlt := True;
          DM1.tMaterialCor.Last;
        end;
        DM1.tMaterialCor.Next;
      end;
      if (StrToFloat(FormatFloat('0.0000',vPreco_Ant)) <> StrToFloat(FormatFloat('0.0000',DM1.tMaterialPrCusto.AsFloat))) or (vAlt) then
        DM1.tMaterialDtAlteracao_Preco.AsDateTime := Date;
      DM1.tMaterial.Post;
      Prc_Gravar_Material_FB(DM1.tMaterialCodigo.AsInteger);
      DM1.tMaterial.Refresh;
      BitBtn2.Tag := 0;
      RxDBLookupCombo2.ClearValue;
      CurrencyEdit1.Clear;
      Habilita;
      BitBtn1.SetFocus;
    end;
  end;
end;

procedure TfMaterial.SpeedButton2Click(Sender: TObject);
begin
  if DM1.tUsuarioSubGrupo.AsBoolean then
  begin
    fSubGrupos := TfSubGrupos.Create(Self);
    fSubGrupos.ShowModal;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de sub-grupos!');
end;

procedure TfMaterial.SpeedButton3Click(Sender: TObject);
begin
  if DM1.tUsuarioFornecedores.AsBoolean then
    begin
      fFornecedores := TfFornecedores.Create(Self);
      fFornecedores.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de fornecedores!');
end;                                                      

procedure TfMaterial.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tMaterial.State in [dsEdit] then
  begin
    ShowMessage('Você deve Cancelar ou Confirmar o material antes de fechar esta janela!');
    CanClose := False;
  end
  else
    CanClose := True;
end;

procedure TfMaterial.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
  begin
    fAgendaTelef := TfAgendaTelef.Create(Self);
    fAgendaTelef.ShowModal;
  end
  else
  if (Key = Vk_F2) and (DM1.tMaterial.State in [dsBrowse]) then
  begin
    vCodMaterial_Pos := 0;
    fConsMaterial := TfConsMaterial.Create(Self);
    fConsMaterial.ShowModal;
    if vCodMaterial_Pos > 0 then
      DM1.tMaterial.Locate('Codigo',vCodMaterial_Pos,[loCaseInsensitive]);
  end;
end;

procedure TfMaterial.SpeedButton5Click(Sender: TObject);
begin
  if DM1.tUsuarioGrade.AsBoolean then
  begin
    fGrade := TfGrade.Create(Self);
    fGrade.ShowModal;
    DM1.tGrade.IndexFieldNames := 'Nome';
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de grades!');
end;

procedure TfMaterial.BitBtn7Click(Sender: TObject);
begin
  if not (RxDBLookupCombo2.Text <> '') then
    ShowMessage('Falta o nome da cor!')
  else
  if BitBtn15.Tag = 1 then
  begin
    if DM1.tMaterialCor.Locate('CodMaterial;CodCor',VarArrayOf([DM1.tMaterialCodigo.AsInteger,RxDBLookupCombo2.KeyValue]),[locaseinsensitive]) then
    begin
      if DM1.tMaterialCorCodCor.AsInteger <> RxDBLookupCombo2.KeyValue then
        ShowMessage('Quando for alterado uma cor, a mesma não pode ser trocada')
      else
      begin
        DM1.tMaterialCor.Edit;
        if StrToFloat(FormatFloat('0.0000',DM1.tMaterialCorPrCusto.AsFloat)) <> StrToFloat(FormatFloat('0.0000',CurrencyEdit1.Value)) then
          DM1.tMaterialCorDtAlteracao.AsDateTime := Date;
        DM1.tMaterialCorPrCusto.AsFloat := CurrencyEdit1.Value;
        DM1.tMaterialCor.Post;
        BitBtn15.Tag := 0;
      end;
    end;
  end
  else
  if DM1.tMaterialCor.Locate('CodMaterial;CodCor',VarArrayOf([DM1.tMaterialCodigo.AsInteger,RxDBLookupCombo2.KeyValue]),[locaseinsensitive]) then
    ShowMessage('Esta cor já esta no material')
  else
  begin
    tMaterialCorIns.Refresh;
    tMaterialCorIns.Last;
    DM1.tMaterialCor.Refresh;
    DM1.tMaterialCor.Insert;
    DM1.tMaterialCorCodMaterial.AsInteger := DM1.tMaterialCodigo.AsInteger;
    DM1.tMaterialCorItem.AsInteger        := tMaterialCorInsItem.AsInteger + 1;
    if RxDBLookupCombo2.Text <> '' then
      DM1.tMaterialCorCodCor.AsInteger  := RxDBLookupCombo2.KeyValue;
    DM1.tMaterialCorPrCusto.AsFloat := CurrencyEdit1.Value;
    DM1.tMaterialDtAlteracao.AsDateTime := Date;
    DM1.tMaterialCor.Post;
    BitBtn15.Tag := 0;
  end;
  BitBtn8Click(Sender);
end;

procedure TfMaterial.BitBtn8Click(Sender: TObject);
begin
  RxDBLookupCombo2.ReadOnly := False;
  RxDBLookupCombo2.ClearValue;
  CurrencyEdit1.Clear;
  RxDBLookupCombo2.SetFocus;
  BitBtn15.Tag := 0;
end;

procedure TfMaterial.BitBtn9Click(Sender: TObject);
begin
  if not DM1.tMaterialCor.IsEmpty then
  begin
    if tProdutoMat.Locate('CodMaterial;CodCor',VarArrayOf([DM1.tMaterialCodigo.AsInteger,DM1.tMaterialCorCodCor.AsInteger]),[locaseinsensitive]) then
      ShowMessage('Esta cor não pode ser excluída pois está no produto ' + tProdutoMatCodProduto.AsString)
    else
      if MessageDlg('Deseja realmente excluir esta cor?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        DM1.tMaterialCor.Delete;
  end
  else
    ShowMessage('Não há registro para ser excluído!');
end;

procedure TfMaterial.DBCheckBox2Click(Sender: TObject);
begin
  Opcoes;
end;

procedure TfMaterial.GroupBox2Exit(Sender: TObject);
begin
  Opcoes;
end;

procedure TfMaterial.DBCheckBox5Click(Sender: TObject);
begin
  Opcoes;
end;

procedure TfMaterial.DBCheckBox4Click(Sender: TObject);
begin
  if DbCheckBox4.Checked then
   Opcoes;
end;

procedure TfMaterial.GroupBox1Enter(Sender: TObject);
begin
  opcoes;
end;

procedure TfMaterial.FormShow(Sender: TObject);
begin
  //NFe 2.0
  if not Assigned(DMTabImposto) then
    DMTabImposto := TDMTabImposto.Create(Self);

  if not Assigned(DMTabEnqIPI) then
    DMTabEnqIPI := TDMTabEnqIPI.Create(Self);

  if not Assigned(DMMaterialFornecedor) then
    DMMaterialFornecedor := TDMMaterialFornecedor.Create(Self);

  DMTabEnqIPI.Abre_Tab_EnqIPI(0);

  DM1.tMaterial.Open;
  Dm1.tMaterialCor.Open;
  DM1.tMaterialGradeNum.Open;
  DM1.tMaterialUM.Open;
  DM1.tCor.Open;
  DM1.tFornecedores.Open;
  DM1.tGrade.Open;
  DM1.tGradeItem.Open;
  DM1.tGradeItemlk.Open;
  DM1.tSitTributaria.Open;
  DM1.tClasFiscal.Open;
  DM1.tGrupo.Open;
  DM1.tSubGrupo.Open;
  RxDBFilter1.Active := True;
  Opcoes;
  If DM1.tMaterialTipoMat.AsString = 'S' then
    DBRadioGroup2.Enabled := True
  else
    DBRadioGroup2.Enabled := False;
end;

procedure TfMaterial.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  Opcoes;
  If DM1.tMaterialTipoMat.AsString = 'S' then
    DBRadioGroup2.Enabled := True
  else
    DBRadioGroup2.Enabled := False;
end;

procedure TfMaterial.SpeedButton6Click(Sender: TObject);
begin
  if DM1.tUsuarioCor.AsBoolean then
    begin
      fCor := TfCor.Create(Self);
      fCor.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de cores!');
end;

procedure TfMaterial.tAuxMaterialGradeBeforeInsert(DataSet: TDataSet);
var
 icount : integer;
begin
  i2 := 0;
  icount := fMaterial.tAuxMaterialGrade.RecordCount;
  if icount >= DM1.tGradeItem.RecordCount then
  begin
    fMaterialGrade.BitBtn6.SetFocus;
    Abort;
  end;
end;

procedure TfMaterial.BitBtn10Click(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
  begin
    tAuxMaterialGrade.First;
    while not tAuxMaterialGrade.Eof do
    begin
      if tAuxMaterialGradeTamMaterial.AsString <> '' then
      begin
        DM1.tMaterialGradeNum.SetKey;
        DM1.tMaterialGradeNumCodMaterial.AsInteger := DM1.tMaterialCodigo.AsInteger;
        DM1.tMaterialGradeNumCodGrade.AsInteger    := tAuxMaterialGradeCodGrade.AsInteger;
        DM1.tMaterialGradeNumPosicao.AsInteger     := tAuxMaterialGradePosicao.AsInteger;
        if DM1.tMaterialGradeNum.GotoKey then
          DM1.tMaterialGradeNum.Edit
        else
        begin
          DM1.tMaterialGradeNum.Insert;
          DM1.tMaterialGradeNumCodMaterial.AsInteger := DM1.tMaterialCodigo.AsInteger;
          DM1.tMaterialGradeNumCodGrade.AsInteger    := tAuxMaterialGradeCodGrade.AsInteger;
          DM1.tMaterialGradeNumPosicao.AsInteger     := tAuxMaterialGradePosicao.AsInteger;
        end;
        DM1.tMaterialGradeNumTamanho.AsString      := tAuxMaterialGradeTamanho.AsString;
        DM1.tMaterialGradeNumTamMaterial.AsString  := tAuxMaterialGradeTamMaterial.AsString;
        DM1.tMaterialGradeNumPeso.AsFloat          := tAuxMaterialGradePeso.AsFloat;
        DM1.tMaterialGradeNumCodGradeMat.AsInteger := DM1.tMaterialCodGrade.AsInteger;
        if DM1.tGradeItemlk.Locate('CodGrade;Tamanho',VarArrayOf([DM1.tMaterialCodGrade.AsInteger,DM1.tMaterialGradeNumTamMaterial.AsString]),[locaseinsensitive]) then
          DM1.tMaterialGradeNumPosicaoMat.AsInteger := DM1.tGradeItemlkPosicao.AsInteger;
        DM1.tMaterialGradeNum.Post;
      end;
      tAuxMaterialGrade.Next;
    end;
  end;
  BitBtn11Click(Sender);
end;

procedure TfMaterial.BitBtn11Click(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
  RxDBLookupCombo1.SetFocus;
end;

procedure TfMaterial.SpeedButton7Click(Sender: TObject);
begin
  if DM1.tUsuarioGrade.AsBoolean then
    begin
      fGrade := TfGrade.Create(Self);
      fGrade.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de grades!');
end;

procedure TfMaterial.RxDBLookupCombo1Exit(Sender: TObject);
begin
  if RxDBLookupCombo1.Value <> '' then
    begin
      fMaterialGrade := TfMaterialGrade.Create(Self);
      fMaterialGrade.ShowModal;
    end;
end;

procedure TfMaterial.DBRadioGroup1Exit(Sender: TObject);
begin
  if DM1.tMaterialTipoMat.AsString = 'S' then
    DBRadioGroup2.Enabled := True
  else
    DBRadioGroup2.Enabled := False;
end;

procedure TfMaterial.RxDBLookupCombo2DropDown(Sender: TObject);
begin
  DM1.tCor.IndexFieldNames := 'Nome';
end;

procedure TfMaterial.RxDBLookupCombo2CloseUp(Sender: TObject);
begin
  DM1.tCor.IndexFieldNames := 'Codigo';
end;

procedure TfMaterial.BitBtn12Click(Sender: TObject);
begin
  if not DM1.tMaterialGradeNum.IsEmpty then
    begin
      if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        DM1.tMaterialGradeNum.Delete;
    end
  else
    ShowMessage('Há um item pendente, você deve confirmar ou cancelar antes de alterar outro item!');
end;

procedure TfMaterial.RxDBLookupCombo3DropDown(Sender: TObject);
begin
  DM1.tMaterial.Refresh;
  DM1.tMaterial.IndexFieldNames := 'Nome';
end;

procedure TfMaterial.RxDBLookupCombo4DropDown(Sender: TObject);
begin
  DM1.tGrupo.IndexFieldNames := 'Nome';
end;

procedure TfMaterial.RxDBLookupCombo4CloseUp(Sender: TObject);
begin
  DM1.tGrupo.IndexFieldNames := 'Codigo';
end;

procedure TfMaterial.RxDBLookupCombo5DropDown(Sender: TObject);
begin
  DM1.tSubGrupo.IndexFieldNames := 'Nome';
end;

procedure TfMaterial.RxDBLookupCombo5CloseUp(Sender: TObject);
begin
  DM1.tSubGrupo.IndexFieldNames := 'Codigo';
end;

procedure TfMaterial.RxDBLookupCombo6KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_F2 then
  begin
    if RxDBLookupCombo6.LookupDisplay = 'NomeForn' then
    begin
       RxDBLookupCombo6.CloseUp(True);
       RxDBLookupCombo6.LookupDisplay    := 'Fantasia';
       DM1.tFornecedores.IndexFieldNames := 'Fantasia';
       DM1.tFornecedores.Refresh;
       Label8.Caption := 'Fantasia';
    end
    else
    if RxDBLookupCombo6.LookupDisplay = 'Fantasia' then
    begin
      RxDBLookupCombo6.CloseUp(True);
      RxDBLookupCombo6.LookupDisplay    := 'NomeForn';
      DM1.tFornecedores.IndexFieldNames := 'NomeForn';
      DM1.tFornecedores.Refresh;
      Label8.Caption := 'Nome';
    end;
  end;
end;

procedure TfMaterial.RxDBLookupCombo6DropDown(Sender: TObject);
begin
  DM1.tFornecedores.IndexFieldNames := 'NomeForn';
end;

procedure TfMaterial.RxDBLookupCombo6CloseUp(Sender: TObject);
begin
  DM1.tFornecedores.IndexFieldNames := 'CodForn';
end;

procedure TfMaterial.BitBtn15Click(Sender: TObject);
begin
  vPreco_Cor_Ant := 0;
  if DM1.tMaterialPrecoCor.AsBoolean then
  begin
    if not DM1.tMaterialCor.IsEmpty then
    begin
      if RxDBLookupCombo2.Text = '' then
      begin
        vPreco_Cor_Ant := StrToFloat(FormatFloat('0.0000',DM1.tMaterialCorPrCusto.AsFloat));
        BitBtn15.Tag := 1;
        RxDBLookupCombo2.KeyValue := DM1.tMaterialCorCodCor.AsInteger;
        CurrencyEdit1.Value := DM1.tMaterialCorPrCusto.AsFloat;
        RxDBLookupCombo2.ReadOnly := True;
        CurrencyEdit1.SetFocus;
      end
      else
        ShowMessage('Há um item pendente, você deve confirmar ou cancelar antes de alterar outro item!');
    end
    else
      ShowMessage('Não registro p/ ser alterado!');
  end;
end;

procedure TfMaterial.BitBtn13Click(Sender: TObject);
begin
  if (Edit1.Text = '') or (Edit2.Text = '') or (CurrencyEdit2.AsInteger = 0) then
    ShowMessage('Falta informacoes')
  else
  begin
    DM1.tMaterialUM.SetKey;
    DM1.tMaterialUMCodMaterial.AsInteger := DM1.tMaterialCodigo.AsInteger;
    DM1.tMaterialUMUnidade.AsString      := Edit1.Text;
    if DM1.tMaterialUM.GotoKey then
      DM1.tMaterialUM.Edit
    else
    begin
      DM1.tMaterialUM.Insert;
      DM1.tMaterialUMCodMaterial.AsInteger := DM1.tMaterialCodigo.AsInteger;
      DM1.tMaterialUMUnidade.AsString      := Edit1.Text;
    end;
    DM1.tMaterialUMNome.AsString := Edit2.Text;
    DM1.tMaterialUMQtd.AsFloat   := CurrencyEdit2.Value;
    DM1.tMaterialUM.Post;
    BitBtn14.Click;
   end;
  Edit1.SetFocus;
end;

procedure TfMaterial.BitBtn14Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  CurrencyEdit2.Clear;
end;

procedure TfMaterial.BitBtn16Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir esta unidade?',mtConfirmation,[mbOK,mbNo],0) = mrOK then
    DM1.tMaterialUM.Delete;
end;

procedure TfMaterial.BitBtn17Click(Sender: TObject);
begin
  Edit1.Text          := DM1.tMaterialUMUnidade.AsString;
  Edit2.Text          := DM1.tMaterialUMNome.AsString;
  CurrencyEdit2.Value := DM1.tMaterialUMQtd.AsFloat;
  Edit1.SetFocus;
end;

procedure TfMaterial.Edit1Exit(Sender: TObject);
begin
  if Edit1.Text = DM1.tMaterialUnidade.AsString then
  begin
    ShowMessage('Unidade igual a unidade do material!');
    Edit1.Clear;
    Edit1.SetFocus;
  end;
end;

procedure TfMaterial.SpeedButton8Click(Sender: TObject);
begin
  if DM1.tUsuarioClasFiscal.AsBoolean then
    begin
      fClasFiscal := TfClasFiscal.Create(Self);
      fClasFiscal.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de classificação fiscal!');
end;

procedure TfMaterial.RxDBLookupCombo7Enter(Sender: TObject);
begin
  DM1.tGrade.IndexFieldNames := 'Nome';
end;

procedure TfMaterial.CurrencyEdit3Enter(Sender: TObject);
begin
  DM1.tMaterial.IndexFieldNames := 'Codigo';
end;

procedure TfMaterial.CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    RxDBLookupCombo3.ClearValue;
    DM1.tMaterial.IndexFieldNames := 'Codigo';
    if DM1.tMaterial.FindKey([CurrencyEdit3.AsInteger]) then
    begin
      Opcoes;
      If DM1.tMaterialTipoMat.AsString = 'S' then
        DBRadioGroup2.Enabled := True
      else
        DBRadioGroup2.Enabled := False;
    end;
  end;
end;

procedure TfMaterial.SpeedButton12Click(Sender: TObject);
begin
  if DM1.tUsuarioRegimeTrib.AsBoolean then
    begin
      fOrigemProd := TfOrigemProd.Create(Self);
      fOrigemProd.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir o formulário!');
end;

procedure TfMaterial.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tGrade.IndexFieldNames := 'Nome';
end;

procedure TfMaterial.BitBtn18Click(Sender: TObject);
begin
  if DM1.tMaterialCodigo.AsInteger > 0 then
  begin
    fMaterialFornecedor := TfMaterialFornecedor.Create(Self);
    fMaterialFornecedor.vCodProduto := DM1.tMaterialCodigo.AsInteger;
    fMaterialFornecedor.vTabela := DM1.tMaterial;
    fMaterialFornecedor.ShowModal;
  end;
end;

procedure TfMaterial.BitBtn19Click(Sender: TObject);
begin
  fSenhaExc := TfSenhaExc.Create(Self);
  fSenhaExc.Caption := 'Senha para alterar';
  fSenhaExc.ShowModal;
  if not dm1.tParametros.Active then
    dm1.tParametros.Open;
  if vSenhaExc = DM1.tParametrosSenhaMaterial.AsString then
  begin
    DBEdit1.ReadOnly := False;
    DBEdit1.SetFocus;
  end
  else
  begin
    DBEdit1.ReadOnly := True;
    ShowMessage('Senha incorreta!');
  end;
end;

procedure TfMaterial.BitBtn20Click(Sender: TObject);
begin
  fSenhaExc := TfSenhaExc.Create(Self);
  fSenhaExc.Caption := 'Senha para alterar';
  fSenhaExc.ShowModal;
  if vSenhaExc = DM1.tParametrosSenhaMaterial.AsString then
    RxDBLookupCombo7.ReadOnly := False
  else
    RxDBLookupCombo7.ReadOnly := True;
end;

function TfMaterial.Verificar_GradeReferencia: Boolean;
begin
  Result := True;
  if DM1.tMaterialCodGrade.AsInteger <= 0 then
    exit;
  DM1.tMaterialGradeNum.First;
  while not DM1.tMaterialGradeNum.Eof do
  begin
    if Trim(DM1.tMaterialGradeNumTamMaterial.AsString) <> '' then
    begin
      if DM1.tGrade.Locate('Codigo',DM1.tMaterialCodGrade.AsInteger,[loCaseInsensitive]) then
      begin
        if not DM1.tGradeItem.Locate('CodGrade;Posicao',VarArrayOf([DM1.tMaterialCodGrade.AsInteger,DM1.tMaterialGradeNumPosicaoMat.AsInteger]),[locaseinsensitive]) then
          Result := False
        else
        if not DM1.tGradeItemlk.Locate('CodGrade;Tamanho',VarArrayOf([DM1.tMaterialCodGrade.AsInteger,DM1.tMaterialGradeNumTamMaterial.AsString]),[locaseinsensitive]) then
          Result := False;
      end;
      if not Result then
        DM1.tMaterialGradeNum.Last;
    end;
    DM1.tMaterialGradeNum.Next;
  end;
end;

function TfMaterial.fnc_AlterarOK: Boolean;
begin
  Result := True;
  qVerificaOC.Close;
  qVerificaOC.ParamByName('CodMaterial').AsInteger := DM1.tMaterialCodigo.AsInteger;
  qVerificaOC.Open;
  if not(qVerificaOC.IsEmpty) and (qVerificaOCCodMaterial.AsInteger > 0) then
    Result := False;
  if not Result then
    exit;
  qVerificaEstoque.Close;
  qVerificaEstoque.ParamByName('CodMaterial').AsInteger := DM1.tMaterialCodigo.AsInteger;
  qVerificaEstoque.Open;
  if not(qVerificaEstoque.IsEmpty) and (qVerificaEstoqueCodMaterial.AsInteger > 0) then
    Result := False;
end;

procedure TfMaterial.RxDBLookupCombo17KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_F5 then
  begin
    vID_EnqIPI_Pos := 0;
    fSel_EnqIPI := TfSel_EnqIPI.Create(Self);
    fSel_EnqIPI.ShowModal;
    if vID_EnqIPI_Pos > 0 then
      RxDBLookupCombo17.KeyValue := vID_EnqIPI_Pos;
  end;
end;

end.

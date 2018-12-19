unit UConstrucao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, Db, DBTables, RxLookup,
  ToolEdit, CurrEdit, Grids, DBGrids, SMDBGrid, DBFilter, UDMConstrucao,
  FMTBcd, SqlExpr, Provider, DBClient;

type
  TfConstrucao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Panel5: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    BitBtn5: TBitBtn;
    tConstrucaoIns: TTable;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label4: TLabel;
    tConstrucaoInsCodigo: TIntegerField;
    tConstrucaoInsNome: TStringField;
    tConstrucaoInsQtdPrevista: TIntegerField;
    DBEdit2: TDBEdit;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    SMDBGrid1: TSMDBGrid;
    qCor: TQuery;
    dsqCor: TDataSource;
    qCorNome: TStringField;
    qCorCodigo: TIntegerField;
    RxDBFilter1: TRxDBFilter;
    Panel6: TPanel;
    RadioGroup1: TRadioGroup;
    StaticText3: TStaticText;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo15: TRxDBLookupCombo;
    StaticText11: TStaticText;
    StaticText2: TStaticText;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Edit1: TEdit;
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
    SpeedButton8: TSpeedButton;
    SpeedButton16: TSpeedButton;
    RxDBFilter2: TRxDBFilter;
    BitBtn9: TBitBtn;
    qVerifica: TQuery;
    qVerificaContador: TIntegerField;
    StaticText1: TStaticText;
    CurrencyEdit4: TCurrencyEdit;
    dsMaterialFB: TDataSource;
    cdsMaterialFB: TClientDataSet;
    cdsMaterialFBCODIGO: TIntegerField;
    cdsMaterialFBNOME: TStringField;
    cdsMaterialFBNOMESEMACENTO: TStringField;
    dspMaterialFB: TDataSetProvider;
    sdsMaterialFB: TSQLDataSet;
    sdsMaterialFBCODIGO: TIntegerField;
    sdsMaterialFBNOME: TStringField;
    sdsMaterialFBNOMESEMACENTO: TStringField;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBLookupCombo1DropDown(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure RxDBLookupCombo15Enter(Sender: TObject);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure CurrencyEdit2Exit(Sender: TObject);
    procedure RxDBLookupCombo3Exit(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure CurrencyEdit4Exit(Sender: TObject);
  private
    vItemMat : Integer;
    procedure Habilita;
    procedure prc_Excluir;
    { Private declarations }
  public
    procedure Monta_SQLCor(Codigo : Integer);
    { Public declarations }
  end;

var
  fConstrucao: TfConstrucao;

implementation

uses UDM1, URelConstrucao, UMaterial, UPosicao,
  UConstrucaoGrupo;

{$R *.DFM}

procedure TfConstrucao.Monta_SQLCor(Codigo : Integer);
begin
  qCor.Close;
  qCor.SQL.Clear;
  qCor.SQL.Add('SELECT Dbcor.Nome, Dbcor.Codigo');
  qCor.SQL.Add('FROM "dbMaterialCor.DB" Dbmaterialcor');
  qCor.SQL.Add('   INNER JOIN "Dbcor.DB" Dbcor');
  qCor.SQL.Add('   ON  (Dbmaterialcor.CodCor = Dbcor.Codigo)');
  qCor.SQL.Add('WHERE (dbMaterialCor.CodMaterial = :CodMaterial)');
  qCor.SQL.Add('ORDER BY dbCor.Nome');
  qCor.ParamByName('CodMaterial').AsInteger := Codigo;
  qCor.Open;
end;

procedure TfConstrucao.Habilita;
begin
  Panel2.Enabled       := not(Panel2.Enabled);
  Panel4.Enabled       := not(Panel4.Enabled);
  Panel6.Enabled       := not(Panel6.Enabled);
  BitBtn1.Enabled      := not(BitBtn1.Enabled);
  BitBtn2.Enabled      := not(BitBtn2.Enabled);
  BitBtn3.Enabled      := not(BitBtn3.Enabled);
  BitBtn4.Enabled      := not(BitBtn4.Enabled);
  BitBtn5.Enabled      := not(BitBtn5.Enabled);
  BitBtn6.Enabled      := not(BitBtn6.Enabled);
  BitBtn7.Enabled      := not(BitBtn7.Enabled);
  BitBtn9.Enabled      := not(BitBtn9.Enabled);
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
end;

procedure TfConstrucao.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfConstrucao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  RxDBFilter1.Active := False;
  if Screen.FormCount < 3 then
  begin
    DM1.tConstrucaoGrupo.Close;
    DM1.tConstrucaoMat.Close;
    Dm1.tConstrucao.Close;
    DM1.tMaterialCor.Close;
    DM1.tMaterial.Close;
    DM1.tCor.Close;
    DM1.tPosicao.Close;
  end;
  qCor.Close;
  Action := Cafree;
end;

procedure TfConstrucao.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsConstrucao.AsBoolean then
  begin
    tConstrucaoIns.IndexFieldNames  := 'Codigo';
    DM1.tConstrucao.IndexFieldNames := 'Codigo';
    tConstrucaoIns.Refresh;
    tConstrucaoIns.Last;
    DM1.tConstrucao.Refresh;
    DM1.tConstrucao.Insert;
    DM1.tConstrucaoCodigo.AsInteger :=  tConstrucaoInsCodigo.AsInteger + 1;
    DM1.tConstrucao.Post;
    DM1.tConstrucao.Edit;
    Habilita;
    DBEdit1.SetFocus;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfConstrucao.BitBtn5Click(Sender: TObject);
begin
  if trim(DM1.tConstrucaoNome.AsString) = '' then
  begin
    ShowMessage('Nome não foi informado!');
    exit;
  end;
  DM1.tConstrucao.Post;
  DM1.tConstrucao.Refresh;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfConstrucao.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    prc_Excluir
  else
  if BitBtn2.Tag = 1 then
    DM1.tConstrucao.Cancel;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfConstrucao.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltConstrucao.AsBoolean then
  begin
    DM1.tConstrucao.Edit;
    BitBtn2.Tag := 1;
    Habilita;
    DBEdit1.SetFocus;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfConstrucao.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcConstrucao.AsBoolean then
  begin
    if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
      prc_Excluir;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfConstrucao.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  DM1.tConstrucao.IndexFieldNames := 'Codigo';
  RxDBFilter2.Active := False;
  RxDBFilter2.Active := True;
end;

procedure TfConstrucao.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tConstrucao.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar o registro antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfConstrucao.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tConstrucao.Refresh;
  DM1.tConstrucao.IndexFieldNames := 'Nome';
end;

procedure TfConstrucao.BitBtn7Click(Sender: TObject);
var
  vCodigo : Integer;
begin
  vCodigo := Dm1.tConstrucaoCodigo.AsInteger;
  Dm1.tConstrucao.IndexFieldNames := 'Nome';
  Dm1.tConstrucao.First;
  fRelConstrucao := TfRelConstrucao.Create(self);
  fRelConstrucao.QuickRep1.Preview;
  fRelConstrucao.QuickRep1.Free;
  Dm1.tConstrucao.Locate('Codigo',vCodigo,([LocaseInsensitive]));
end;

procedure TfConstrucao.FormShow(Sender: TObject);
begin
  Dm1.tConstrucao.Open;
  DM1.tConstrucaoMat.Open;
  DM1.tConstrucaoGrupo.Open;
  DM1.tMaterial.Open;
  DM1.tMaterialCor.Open;

  cdsMaterialFB.Close;
  cdsMaterialFB.IndexFieldNames := 'NOMESEMACENTO';
  cdsMaterialFB.Open;

  DM1.tCor.Open;
  DM1.tPosicao.Open;
  RxDBFilter1.Active := True;
  RxDBFilter2.Active := True;
end;

procedure TfConstrucao.BitBtn10Click(Sender: TObject);
var
  vItemAux : Integer;
begin
  if (RxDBLookupCombo2.Text = '') or (Edit1.Text = '') then
  begin
    ShowMessage('Falta informar o material ou a unidade!');
    exit;
  end;
  if DM1.tMaterial.IndexFieldNames <> 'Codigo' then
    DM1.tMaterial.IndexFieldNames := 'Codigo';
  if not DM1.tMaterial.FindKey([RxDBLookupCombo2.KeyValue]) then
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
  if DM1.tConstrucaoMat.Locate('Item',vItemAux,[loCaseInsensitive]) then
    DM1.tConstrucaoMat.Edit
  else
    begin
      DM1.tConstrucaoMat.Insert;
      DM1.tConstrucaoMatCodConstrucao.AsInteger      := DM1.tConstrucaoCodigo.AsInteger;
      DM1.tConstrucaoMatCodConstrucaoGrupo.AsInteger := 0;
      DM1.tConstrucaoMatItem.AsInteger               := vItemAux;
    end;
  DM1.tConstrucaoMatCodMaterial.AsInteger        := RxDBLookupCombo2.KeyValue;
  DM1.tConstrucaoMatCodGrade.AsInteger           := DM1.tMaterialCodGrade.AsInteger;
  if RxDBLookupCombo3.Text <> '' then
    DM1.tConstrucaoMatCodCor.AsInteger := RxDBLookupCombo3.KeyValue;
  DM1.tConstrucaoMatQtd.AsFloat         := CurrencyEdit1.Value;
  DM1.tConstrucaoMatUnidade.AsString    := Edit1.Text;
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
  BitBtn11Click(Sender);
  RadioGroup1.SetFocus;
end;

procedure TfConstrucao.BitBtn11Click(Sender: TObject);
begin
  RxDBLookupCombo2.ClearValue;
  RxDBLookupCombo15.ClearValue;
  RxDBLookupCombo3.ClearValue;
  CurrencyEdit1.Clear;
  CurrencyEdit2.Clear;
  CurrencyEdit3.Clear;
  CurrencyEdit4.Clear;
  Edit1.Clear;
  vItemMat := 0;
end;

procedure TfConstrucao.BitBtn15Click(Sender: TObject);
begin
  if DM1.tConstrucaoMatItem.AsInteger > 0 then
    begin
      vItemMat := DM1.tConstrucaoMatItem.AsInteger;
      if DM1.tConstrucaoMatImpTalao.AsString = 'S' then
        RadioGroup1.ItemIndex := 0
      else
        RadioGroup1.ItemIndex := 1;
      CurrencyEdit4.AsInteger   := DM1.tConstrucaoMatCodMaterial.AsInteger;
      RxDBLookupCombo2.KeyValue := DM1.tConstrucaoMatCodMaterial.AsInteger;
      RxDBLookupCombo15.ClearValue;
      RxDBLookupCombo3.ClearValue;
      if DM1.tConstrucaoMatCodPosicao.AsInteger > 0 then
        RxDBLookupCombo15.KeyValue := DM1.tConstrucaoMatCodPosicao.AsInteger;
      Monta_SQLCor(DM1.tConstrucaoMatCodMaterial.AsInteger);
      if DM1.tConstrucaoMatCodCor.AsInteger > 0 then
        RxDBLookupCombo3.KeyValue := DM1.tConstrucaoMatCodCor.AsInteger;
      Edit1.Text := DM1.tConstrucaoMatUnidade.AsString;
      CurrencyEdit1.Value := DM1.tConstrucaoMatQtd.AsFloat;
      CurrencyEdit2.Value := DM1.tConstrucaoMatVlrUnitario.AsFloat;
      CurrencyEdit3.Value := DM1.tConstrucaoMatVlrTotal.AsFloat;
      RadioGroup1.SetFocus;
    end;
end;

procedure TfConstrucao.RxDBLookupCombo3Enter(Sender: TObject);
begin
  if RxDBLookupCombo2.Text = '' then
    ShowMessage('Falta informar o material!')
  else
    Monta_SQLCor(RxDBLookupCombo2.KeyValue);
end;

procedure TfConstrucao.BitBtn12Click(Sender: TObject);
begin
  if MessageDlg('Deseja excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
    DM1.tConstrucaoMat.Delete;
end;

procedure TfConstrucao.SpeedButton8Click(Sender: TObject);
begin
  if DM1.tUsuarioMaterial.AsBoolean then
  begin
    RxDBFilter1.Active := False;
    DM1.tMaterial.Refresh;
    fMaterial := TfMaterial.Create(Self);
    fMaterial.ShowModal;
    RxDBFilter1.Active := True;
    DM1.tMaterial.Refresh;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfConstrucao.SpeedButton16Click(Sender: TObject);
begin
  if DM1.tUsuarioPosicao.AsBoolean then
    begin
      fPosicao := TfPosicao.Create(Self);
      fPosicao.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfConstrucao.RxDBLookupCombo15Enter(Sender: TObject);
begin
  DM1.tPosicao.IndexFieldNames := 'Nome';
end;

procedure TfConstrucao.RxDBLookupCombo2Exit(Sender: TObject);
begin
  if (vItemMat < 1) and (RxDBLookupCombo2.Text <> '') then
  begin
    if DM1.tMaterial.IndexFieldNames <> 'Codigo' then
      DM1.tMaterial.IndexFieldNames := 'Codigo';
    if DM1.tMaterial.FindKey([RxDBLookupCombo2.KeyValue]) then
    begin
      Edit1.Text              := DM1.tMaterialUnidade.AsString;
      CurrencyEdit2.Value     := DM1.tMaterialPrCusto.AsCurrency;
      CurrencyEdit4.AsInteger := DM1.tMaterialCodigo.AsInteger; 
    end;
  end
  else
  if RxDBLookupCombo2.Text <> '' then
    CurrencyEdit4.AsInteger := RxDBLookupCombo2.KeyValue;
end;

procedure TfConstrucao.CurrencyEdit1Exit(Sender: TObject);
begin
  CurrencyEdit3.Value := CurrencyEdit1.Value * CurrencyEdit2.Value;
end;

procedure TfConstrucao.CurrencyEdit2Exit(Sender: TObject);
begin
  CurrencyEdit3.Value := CurrencyEdit1.Value * CurrencyEdit2.Value;
end;

procedure TfConstrucao.RxDBLookupCombo3Exit(Sender: TObject);
begin
  if (RxDBLookupCombo2.Text <> '') and (RxDBLookupCombo3.Text <> '') then
  begin
    if DM1.tMaterial.IndexFieldNames <> 'Codigo' then
      DM1.tMaterial.IndexFieldNames := 'Codigo';
    if (DM1.tMaterial.FindKey([RxDBLookupCombo2.KeyValue])) and (DM1.tMaterialPrecoCor.AsBoolean) then
      if DM1.tMaterialCor.Locate('CodCor',RxDBLookupCombo3.KeyValue,([LocaseInsensitive])) then
        CurrencyEdit2.Value := DM1.tMaterialCorPrCusto.AsFloat;
  end;
end;

procedure TfConstrucao.BitBtn8Click(Sender: TObject);
begin
  RxDBFilter2.Active := False;
  fConstrucaoGrupo := TfConstrucaoGrupo.Create(Self);
  fConstrucaoGrupo.ShowModal;
  RxDBFilter2.Active := True;
end;

procedure TfConstrucao.BitBtn9Click(Sender: TObject);
var
  fDMConstrucao: TDMConstrucao;
  vCodigo : Integer;
begin
  if DM1.tConstrucaoCodigo.AsInteger <= 0 then
    exit;
  if MessageDlg('Deseja realmente copiar a construção selecionada?', mtConfirmation,[mbOk,mbNo],0)=mrNo then
    exit;
  DM1.tConstrucao.IndexFieldNames := 'Codigo';
  vCodigo := DM1.tConstrucaoCodigo.AsInteger;
  fDMConstrucao := TDMConstrucao.Create(Self);
  try
    fDMConstrucao.qConstrucao.Close;
    fDMConstrucao.qConstrucao.ParamByName('Codigo').AsInteger := vCodigo;
    fDMConstrucao.qConstrucao.Open;
    fDMConstrucao.qConstrucao_Mat.Close;
    fDMConstrucao.qConstrucao_Mat.ParamByName('CodConstrucao').AsInteger := vCodigo;
    fDMConstrucao.qConstrucao_Mat.Open;
    DM1.tConstrucao.Last;
    vCodigo := DM1.tConstrucaoCodigo.AsInteger;
    vCodigo := vCodigo + 1;
    DM1.tConstrucao.Insert;
    DM1.tConstrucaoCodigo.AsInteger      := vCodigo;
    DM1.tConstrucaoNome.AsString         := '';
    DM1.tConstrucaoQtdPrevista.AsInteger := 0;
    DM1.tConstrucao.Post;

    fDMConstrucao.qConstrucao_Mat.First;
    while not fDMConstrucao.qConstrucao_Mat.Eof do
    begin
      DM1.tConstrucaoMat.Insert;
      DM1.tConstrucaoMatCodConstrucao.AsInteger      := DM1.tConstrucaoCodigo.AsInteger;
      DM1.tConstrucaoMatCodConstrucaoGrupo.AsInteger := 0;
      DM1.tConstrucaoMatItem.AsInteger               := fDMConstrucao.qConstrucao_MatItem.AsInteger;
      DM1.tConstrucaoMatCodMaterial.AsInteger        := fDMConstrucao.qConstrucao_MatCodMaterial.AsInteger;
      DM1.tConstrucaoMatCodGrade.AsInteger           := fDMConstrucao.qConstrucao_MatCodGrade.AsInteger;
      DM1.tConstrucaoMatCodCor.AsInteger             := fDMConstrucao.qConstrucao_MatCodCor.AsInteger;
      DM1.tConstrucaoMatQtd.AsFloat                  := StrToFloat(FormatFloat('0.000000',fDMConstrucao.qConstrucao_MatQtd.AsFloat));
      DM1.tConstrucaoMatVlrUnitario.AsFloat          := StrToFloat(FormatFloat('0.0000',fDMConstrucao.qConstrucao_MatVlrUnitario.AsFloat));
      DM1.tConstrucaoMatVlrTotal.AsFloat             := StrToFloat(FormatFloat('0.00',fDMConstrucao.qConstrucao_MatVlrTotal.AsFloat));
      DM1.tConstrucaoMatCodPosicao.AsInteger         := fDMConstrucao.qConstrucao_MatCodPosicao.AsInteger;
      DM1.tConstrucaoMatImpTalao.AsString            := fDMConstrucao.qConstrucao_MatImpTalao.AsString;
      DM1.tConstrucaoMatUnidade.AsString             := fDMConstrucao.qConstrucao_MatUnidade.AsString;
      DM1.tConstrucaoMat.Post;
      fDMConstrucao.qConstrucao_Mat.Next;
    end;
    DM1.tConstrucao.Edit;
    Habilita;
    DBEdit1.SetFocus;
    ShowMessage('*** Copia concluída!');
  finally
    FreeAndNil(fDMConstrucao);
  end;
end;

procedure TfConstrucao.prc_Excluir;
begin
  qVerifica.Close;
  qVerifica.ParamByName('CodConstrucao').AsInteger := DM1.tConstrucaoCodigo.AsInteger;
  qVerifica.Open;
  if not(qVerifica.IsEmpty) and (qVerificaContador.AsInteger > 0) then
  begin
    qVerifica.Close;
    ShowMessage('Construção não pode ser excluída, esta sendo usada nos produtos!');
    exit;
  end;
  RxDBFilter2.Active := False;
  DM1.tConstrucaoMat.First;
  while not DM1.tConstrucaoMat.Eof do
    DM1.tConstrucaoMat.Delete;
  DM1.tConstrucaoGrupo.First;
  while not DM1.tConstrucaoGrupo.Eof do
    DM1.tConstrucaoGrupo.Delete;
  DM1.tConstrucao.Delete;
  DM1.tConstrucao.Refresh;
  DM1.tConstrucaoMat.Refresh;
  DM1.tConstrucaoGrupo.Refresh;
end;

procedure TfConstrucao.CurrencyEdit4Exit(Sender: TObject);
begin
  if CurrencyEdit4.AsInteger > 0 then
  begin
    if DM1.tMaterial.IndexFieldNames <> 'Codigo' then
      DM1.tMaterial.IndexFieldNames := 'Codigo';
    if not DM1.tMaterial.FindKey([CurrencyEdit4.AsInteger]) then
    begin
      ShowMessage('Código não cadastrado!');
      CurrencyEdit4.SetFocus
    end
    else
    begin
      RxDBLookupCombo2.KeyValue := DM1.tMaterialCodigo.AsInteger;
      RxDBLookupCombo2.SetFocus;
    end
  end;
end;

end.

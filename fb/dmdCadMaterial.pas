unit dmdCadMaterial;

interface

uses
  SysUtils, Classes, DmdDatabase, FMTBcd, DB, SqlExpr, DBClient, Provider,
  arTypes;

type
  TdmCadMaterial = class(TDataModule)
    sdsMaterial: TSQLDataSet;
    dspMaterial: TDataSetProvider;
    cdsMaterial: TClientDataSet;
    dsMaterial: TDataSource;
    sdsMaterialCODIGO: TIntegerField;
    sdsMaterialNOME: TStringField;
    sdsMaterialGRUPO: TIntegerField;
    sdsMaterialSUBGRUPO: TIntegerField;
    sdsMaterialUNIDADE: TStringField;
    sdsMaterialICMS: TFloatField;
    sdsMaterialIPI: TFloatField;
    sdsMaterialPRCUSTO: TFloatField;
    sdsMaterialFORNECEDOR: TIntegerField;
    sdsMaterialCODGRADE: TIntegerField;
    sdsMaterialESTMINIMO: TFloatField;
    sdsMaterialINATIVO: TStringField;
    sdsMaterialLANCACOR: TStringField;
    sdsMaterialPRECOCOR: TStringField;
    sdsMaterialLANCAGRADE: TStringField;
    sdsMaterialPRECOGRADE: TStringField;
    sdsMaterialTIPOMAT: TStringField;
    sdsMaterialTIPOSOLADO: TStringField;
    sdsMaterialMATERIALOUTROS: TStringField;
    sdsMaterialDTALTERACAO: TDateField;
    sdsMaterialCALCMATERIAL: TStringField;
    sdsMaterialPRE: TStringField;
    sdsMaterialCODCLASFISCAL: TStringField;
    sdsMaterialIMPGRADETALAOAUXILIAR: TStringField;
    sdsMaterialIMPTALAOAUXILIAR: TStringField;
    sdsMaterialIMPCALCMATERIAL: TStringField;
    sdsMaterialTIPOREG: TStringField;
    sdsMaterialCOMPLEMENTO: TStringField;
    sdsMaterialCODSITTRIB: TIntegerField;
    sdsMaterialGERAOC: TStringField;
    sdsMaterialORIGEMPROD: TStringField;
    sdsMaterialUSUARIO: TStringField;
    sdsMaterialCORRETO: TStringField;
    cdsMaterialCODIGO: TIntegerField;
    cdsMaterialNOME: TStringField;
    cdsMaterialGRUPO: TIntegerField;
    cdsMaterialSUBGRUPO: TIntegerField;
    cdsMaterialUNIDADE: TStringField;
    cdsMaterialICMS: TFloatField;
    cdsMaterialIPI: TFloatField;
    cdsMaterialPRCUSTO: TFloatField;
    cdsMaterialFORNECEDOR: TIntegerField;
    cdsMaterialCODGRADE: TIntegerField;
    cdsMaterialESTMINIMO: TFloatField;
    cdsMaterialINATIVO: TStringField;
    cdsMaterialLANCACOR: TStringField;
    cdsMaterialPRECOCOR: TStringField;
    cdsMaterialLANCAGRADE: TStringField;
    cdsMaterialPRECOGRADE: TStringField;
    cdsMaterialTIPOMAT: TStringField;
    cdsMaterialTIPOSOLADO: TStringField;
    cdsMaterialMATERIALOUTROS: TStringField;
    cdsMaterialDTALTERACAO: TDateField;
    cdsMaterialCALCMATERIAL: TStringField;
    cdsMaterialPRE: TStringField;
    cdsMaterialCODCLASFISCAL: TStringField;
    cdsMaterialIMPGRADETALAOAUXILIAR: TStringField;
    cdsMaterialIMPTALAOAUXILIAR: TStringField;
    cdsMaterialIMPCALCMATERIAL: TStringField;
    cdsMaterialTIPOREG: TStringField;
    cdsMaterialCOMPLEMENTO: TStringField;
    cdsMaterialCODSITTRIB: TIntegerField;
    cdsMaterialGERAOC: TStringField;
    cdsMaterialORIGEMPROD: TStringField;
    cdsMaterialUSUARIO: TStringField;
    cdsMaterialCORRETO: TStringField;
    sdsMaterialNOMESEMACENTO: TStringField;
    cdsMaterialNOMESEMACENTO: TStringField;
    sdsMaterialNUM_FCI: TStringField;
    sdsMaterialPERC_USADO_FCI: TFloatField;
    cdsMaterialNUM_FCI: TStringField;
    cdsMaterialPERC_USADO_FCI: TFloatField;
    sdsMaterialID_ENQIPI: TIntegerField;
    cdsMaterialID_ENQIPI: TIntegerField;
    sdsMaterialDTALTERACAO_PRECO: TDateField;
    cdsMaterialDTALTERACAO_PRECO: TDateField;
    procedure DataModuleCreate(Sender: TObject);
  private
    sCommandText: string;
    FEstado: TarCadState;
    procedure AtualizaConsulta;
  public

    procedure AutoEditar(Ativar: Boolean);
    procedure IncluirRegistro;
    procedure GravarRegistro;
    procedure EditarRegistro;
    procedure ExcluirRegistro;
    procedure CancelarRegistro;
    function LocalizarRegistro(bLocalizar: Boolean; Codigo: Integer = 0): Boolean;
    procedure ExecutaConsulta(SQL: string);
    property Estado: TarCadState read FEstado write FEstado;

  end;

implementation

{$R *.dfm}

{ TdmCadFuncionario }

procedure TdmCadMaterial.AtualizaConsulta;
begin
  if cdsMaterial.Active then
  begin
    if not cdsMaterial.Eof then
      LocalizarRegistro(True)
    else
      LocalizarRegistro(False);
  end
  else
    LocalizarRegistro(False);
end;

procedure TdmCadMaterial.AutoEditar(Ativar: Boolean);
begin

end;

procedure TdmCadMaterial.CancelarRegistro;
var
  iCodigo: integer;
begin
  iCodigo := 0;
  if Estado = csEdit then
    iCodigo := cdsMaterialCODIGO.AsInteger;

  if cdsMaterial.Active then
    cdsMaterial.CancelUpdates;
  AutoEditar(False);

  if (Estado = csEdit) and (cdsMaterialCODIGO.AsInteger <> iCodigo) then
    cdsMaterial.Locate('CODIGO', iCodigo, []);

  AtualizaConsulta;
end;

procedure TdmCadMaterial.DataModuleCreate(Sender: TObject);
begin
  sCommandText := sdsMaterial.CommandText;
  AutoEditar(False);
end;

procedure TdmCadMaterial.EditarRegistro;
begin
  cdsMaterial.Edit;
  AutoEditar(True);

end;

procedure TdmCadMaterial.ExcluirRegistro;
var
  sBookmark: string;
begin
  sBookmark := cdsMaterial.Bookmark;
  try
    cdsMaterial.DisableControls;
    try
      cdsMaterial.Delete;
      if (cdsMaterial.ChangeCount > 0) and (cdsMaterial.ApplyUpdates(0) > 0) then
        Abort;
    except
      CancelarRegistro;
      cdsMaterial.Bookmark := sBookmark;
      raise;
    end;
  finally
    AtualizaConsulta;
    cdsMaterial.EnableControls;
  end;
end;

procedure TdmCadMaterial.ExecutaConsulta(SQL: string);
begin
  cdsMaterial.Close;
  sdsMaterial.CommandText := SQL;
  cdsMaterial.Open;
end;

procedure TdmCadMaterial.GravarRegistro;
begin
  if cdsMaterial.State in [dsEdit, dsInsert] then
    cdsMaterial.Post;

  if cdsMaterial.ApplyUpdates(0) > 0 then
    Abort;

  AutoEditar(False);
end;

procedure TdmCadMaterial.IncluirRegistro;
begin
  if not cdsMaterial.Active then
    LocalizarRegistro(False);
  cdsMaterial.Insert;
  AutoEditar(True);
end;

function TdmCadMaterial.LocalizarRegistro(bLocalizar: Boolean;
  Codigo: Integer): Boolean;
begin
  if not bLocalizar and not cdsMaterial.Active then
  begin
    ExecutaConsulta(sCommandText + ' WHERE CODIGO = ' + IntToStr(Codigo));
    Result := not cdsMaterial.IsEmpty;
  end
  else if (not cdsMaterial.IsEmpty) and (Codigo > 0) then
  begin
    cdsMaterial.First;
    Result := cdsMaterial.Locate('CODIGO', Codigo, []);
  end
  else
    Result := not cdsMaterial.IsEmpty;
end;

end.

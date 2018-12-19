unit dmdCadCliente;

interface

uses
  SysUtils, Classes, DmdDatabase, FMTBcd, DB, SqlExpr, DBClient, Provider,
  arTypes;

type
  TdmCadCliente = class(TDataModule)
    sdsCliente: TSQLDataSet;
    dspCliente: TDataSetProvider;
    cdsCliente: TClientDataSet;
    dsCliente: TDataSource;
    sdsClienteCODIGO: TIntegerField;
    sdsClienteNOME: TStringField;
    sdsClienteENDERECO: TStringField;
    sdsClienteBAIRRO: TStringField;
    sdsClienteCIDADE: TStringField;
    sdsClienteUF: TStringField;
    sdsClienteCEP: TStringField;
    sdsClienteTELEFONE: TStringField;
    sdsClienteTELEFONE2: TStringField;
    sdsClienteFAX: TStringField;
    sdsClientePESSOA: TStringField;
    sdsClienteCGCCPF: TStringField;
    sdsClienteINSCREST: TStringField;
    sdsClienteCONTATO: TStringField;
    sdsClienteOBS: TMemoField;
    sdsClienteAPROVCREDITO: TStringField;
    sdsClienteTIPOAPROV: TStringField;
    sdsClienteENDENTREGA: TStringField;
    sdsClienteBAIRROENTREGA: TStringField;
    sdsClienteCIDENTREGA: TStringField;
    sdsClienteCEPENTREGA: TStringField;
    sdsClienteUFENTREGA: TStringField;
    sdsClienteCGCCPFENTREGA: TStringField;
    sdsClienteINSCENTREGA: TStringField;
    sdsClienteENDPGTO: TStringField;
    sdsClienteBAIRROPGTO: TStringField;
    sdsClienteCIDPGTO: TStringField;
    sdsClienteCEPPGTO: TStringField;
    sdsClienteUFPGTO: TStringField;
    sdsClienteFANTASIA: TStringField;
    sdsClienteDTCADASTRO: TDateField;
    sdsClienteCODVENDEDOR: TIntegerField;
    sdsClienteOBSCTAS: TMemoField;
    sdsClienteLOJAS: TIntegerField;
    sdsClienteSELECIONADO: TStringField;
    sdsClienteCAIXAPOSTAL: TStringField;
    sdsClienteRG: TStringField;
    sdsClienteCODCIDADE: TIntegerField;
    sdsClienteCODCIDADEE: TIntegerField;
    sdsClienteEMAIL: TStringField;
    sdsClienteMERCADO: TStringField;
    sdsClienteNUMEND: TStringField;
    sdsClienteNUMENDENTREGA: TStringField;
    sdsClienteEMAILNFE: TStringField;
    sdsClienteCOMPLENDERECO: TStringField;
    sdsClienteDTVALIDADEIPI: TDateField;
    sdsClienteCODOBSIPI: TIntegerField;
    sdsClienteHOMEPAGE: TStringField;
    sdsClienteCOMPLENDERECOENTREGA: TStringField;
    sdsClienteCODSITTRIBSIMPLES: TIntegerField;
    sdsClienteUSAICMSSIMPLES: TStringField;
    sdsClienteDDDFONE1: TIntegerField;
    sdsClienteDDDFONE2: TIntegerField;
    sdsClienteDDDFAX: TIntegerField;
    sdsClienteIDPAIS: TIntegerField;
    sdsClienteEMAILNFE2: TStringField;
    cdsClienteCODIGO: TIntegerField;
    cdsClienteNOME: TStringField;
    cdsClienteENDERECO: TStringField;
    cdsClienteBAIRRO: TStringField;
    cdsClienteCIDADE: TStringField;
    cdsClienteUF: TStringField;
    cdsClienteCEP: TStringField;
    cdsClienteTELEFONE: TStringField;
    cdsClienteTELEFONE2: TStringField;
    cdsClienteFAX: TStringField;
    cdsClientePESSOA: TStringField;
    cdsClienteCGCCPF: TStringField;
    cdsClienteINSCREST: TStringField;
    cdsClienteCONTATO: TStringField;
    cdsClienteOBS: TMemoField;
    cdsClienteAPROVCREDITO: TStringField;
    cdsClienteTIPOAPROV: TStringField;
    cdsClienteENDENTREGA: TStringField;
    cdsClienteBAIRROENTREGA: TStringField;
    cdsClienteCIDENTREGA: TStringField;
    cdsClienteCEPENTREGA: TStringField;
    cdsClienteUFENTREGA: TStringField;
    cdsClienteCGCCPFENTREGA: TStringField;
    cdsClienteINSCENTREGA: TStringField;
    cdsClienteENDPGTO: TStringField;
    cdsClienteBAIRROPGTO: TStringField;
    cdsClienteCIDPGTO: TStringField;
    cdsClienteCEPPGTO: TStringField;
    cdsClienteUFPGTO: TStringField;
    cdsClienteFANTASIA: TStringField;
    cdsClienteDTCADASTRO: TDateField;
    cdsClienteCODVENDEDOR: TIntegerField;
    cdsClienteOBSCTAS: TMemoField;
    cdsClienteLOJAS: TIntegerField;
    cdsClienteSELECIONADO: TStringField;
    cdsClienteCAIXAPOSTAL: TStringField;
    cdsClienteRG: TStringField;
    cdsClienteCODCIDADE: TIntegerField;
    cdsClienteCODCIDADEE: TIntegerField;
    cdsClienteEMAIL: TStringField;
    cdsClienteMERCADO: TStringField;
    cdsClienteNUMEND: TStringField;
    cdsClienteNUMENDENTREGA: TStringField;
    cdsClienteEMAILNFE: TStringField;
    cdsClienteCOMPLENDERECO: TStringField;
    cdsClienteDTVALIDADEIPI: TDateField;
    cdsClienteCODOBSIPI: TIntegerField;
    cdsClienteHOMEPAGE: TStringField;
    cdsClienteCOMPLENDERECOENTREGA: TStringField;
    cdsClienteCODSITTRIBSIMPLES: TIntegerField;
    cdsClienteUSAICMSSIMPLES: TStringField;
    cdsClienteDDDFONE1: TIntegerField;
    cdsClienteDDDFONE2: TIntegerField;
    cdsClienteDDDFAX: TIntegerField;
    cdsClienteIDPAIS: TIntegerField;
    cdsClienteEMAILNFE2: TStringField;
    sdsClienteNOMESEMACENTO: TStringField;
    sdsClienteCODCIDADEP: TIntegerField;
    cdsClienteNOMESEMACENTO: TStringField;
    cdsClienteCODCIDADEP: TIntegerField;
    sdsClienteTIPO_CONSUMIDOR: TIntegerField;
    cdsClienteTIPO_CONSUMIDOR: TIntegerField;
    sdsClienteTIPO_CONTRIBUINTE: TIntegerField;
    cdsClienteTIPO_CONTRIBUINTE: TIntegerField;
    sdsClientePESSOAENTREGA: TStringField;
    cdsClientePESSOAENTREGA: TStringField;
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


{ TdmCadCliente }


procedure TdmCadCliente.AtualizaConsulta;
begin
  if cdsCliente.Active then
  begin
    if not cdsCliente.Eof then
      LocalizarRegistro(True)
    else
      LocalizarRegistro(False);
  end
  else
    LocalizarRegistro(False);
end;

procedure TdmCadCliente.AutoEditar(Ativar: Boolean);
begin

end;

procedure TdmCadCliente.CancelarRegistro;
var
  iCodigo: integer;
begin
  iCodigo := 0;
  if Estado = csEdit then
    iCodigo := cdsClienteCODIGO.AsInteger;

  if cdsCliente.Active then
    cdsCliente.CancelUpdates;
  AutoEditar(False);

  if (Estado = csEdit) and (cdsClienteCODIGO.AsInteger <> iCodigo) then
    cdsCliente.Locate('CODIGO', iCodigo, []);

  AtualizaConsulta;
end;

procedure TdmCadCliente.DataModuleCreate(Sender: TObject);
begin
  sCommandText := sdsCliente.CommandText;
  AutoEditar(False);
end;

procedure TdmCadCliente.EditarRegistro;
begin
  cdsCliente.Edit;
  AutoEditar(True);

end;

procedure TdmCadCliente.ExcluirRegistro;
var
  sBookmark: string;
begin
  sBookmark := cdsCliente.Bookmark;
  try
    cdsCliente.DisableControls;
    try
      cdsCliente.Delete;
      if (cdsCliente.ChangeCount > 0) and (cdsCliente.ApplyUpdates(0) > 0) then
        Abort;
    except
      CancelarRegistro;
      cdsCliente.Bookmark := sBookmark;
      raise;
    end;
  finally
    AtualizaConsulta;
    cdsCliente.EnableControls;
  end;
end;

procedure TdmCadCliente.ExecutaConsulta(SQL: string);
begin
  cdsCliente.Close;
  sdsCliente.CommandText := SQL;
  cdsCliente.Open;
end;

procedure TdmCadCliente.GravarRegistro;
begin
  if cdsCliente.State in [dsEdit, dsInsert] then
    cdsCliente.Post;

  if cdsCliente.ApplyUpdates(0) > 0 then
    Abort;

  AutoEditar(False);
end;

procedure TdmCadCliente.IncluirRegistro;
begin
  if not cdsCliente.Active then
    LocalizarRegistro(False);
  cdsCliente.Insert;
  AutoEditar(True);
end;

function TdmCadCliente.LocalizarRegistro(bLocalizar: Boolean;
  Codigo: Integer): Boolean;
begin
  if not bLocalizar and not cdsCliente.Active then
  begin
    ExecutaConsulta(sCommandText + ' WHERE CODIGO = ' + IntToStr(Codigo));
    Result := not cdsCliente.IsEmpty;
  end
  else if (not cdsCliente.IsEmpty) and (Codigo > 0) then
  begin
    cdsCliente.First;
    Result := cdsCliente.Locate('CODIGO', Codigo, []);
  end
  else
    Result := not cdsCliente.IsEmpty;
end;

end.


unit dmdCadCReceber;

interface

uses
  SysUtils, Classes, DmdDatabase, FMTBcd, DB, SqlExpr, DBClient, Provider,
  arTypes;

type
  TdmCadCReceber = class(TDataModule)
    sdsCReceber: TSQLDataSet;
    dspCReceber: TDataSetProvider;
    cdsCReceber: TClientDataSet;
    dsCReceber: TDataSource;
    sdsCReceberNUMCRECEBER: TIntegerField;
    sdsCReceberNUMSEQNOTA: TIntegerField;
    sdsCReceberQUITADO: TStringField;
    sdsCReceberCODCLI: TIntegerField;
    sdsCReceberTIPODOC: TStringField;
    sdsCReceberDTGERADO: TDateField;
    sdsCReceberHISTORICO: TStringField;
    sdsCReceberCANCELADO: TStringField;
    sdsCReceberDUPLICATAIMP: TStringField;
    sdsCReceberVLRTOTAL: TFloatField;
    sdsCReceberPERCBASECOMISSAO: TFloatField;
    sdsCReceberMERCADO: TStringField;
    sdsCReceberFILIAL: TIntegerField;
    sdsCReceberSERIE: TStringField;
    sdsCReceberNUMNOTA: TIntegerField;
    sdsCReceberBOLETOIMP: TStringField;
    sdsCReceberNUMSEQ: TIntegerField;
    cdsCReceberNUMCRECEBER: TIntegerField;
    cdsCReceberNUMSEQNOTA: TIntegerField;
    cdsCReceberQUITADO: TStringField;
    cdsCReceberCODCLI: TIntegerField;
    cdsCReceberTIPODOC: TStringField;
    cdsCReceberDTGERADO: TDateField;
    cdsCReceberHISTORICO: TStringField;
    cdsCReceberCANCELADO: TStringField;
    cdsCReceberDUPLICATAIMP: TStringField;
    cdsCReceberVLRTOTAL: TFloatField;
    cdsCReceberPERCBASECOMISSAO: TFloatField;
    cdsCReceberMERCADO: TStringField;
    cdsCReceberFILIAL: TIntegerField;
    cdsCReceberSERIE: TStringField;
    cdsCReceberNUMNOTA: TIntegerField;
    cdsCReceberBOLETOIMP: TStringField;
    cdsCReceberNUMSEQ: TIntegerField;
    dsCReceber_Mestre: TDataSource;
    sdsCReceberParc: TSQLDataSet;
    cdsCReceberParc: TClientDataSet;
    sdsCReceberParcNUMCRECEBER: TIntegerField;
    sdsCReceberParcPARCCRECEBER: TIntegerField;
    sdsCReceberParcVLRPARCCRECEBER: TFloatField;
    sdsCReceberParcDTVENCCRECEBER: TDateField;
    sdsCReceberParcQUITPARCCRECEBER: TStringField;
    sdsCReceberParcJUROSPARCCRECEBER: TFloatField;
    sdsCReceberParcDTPAGPARCCRECEBER: TDateField;
    sdsCReceberParcCODCLI: TIntegerField;
    sdsCReceberParcNUMSEQ: TIntegerField;
    sdsCReceberParcDESCONTO: TFloatField;
    sdsCReceberParcPGTOPARCIAL: TFloatField;
    sdsCReceberParcRESTPARCELA: TFloatField;
    sdsCReceberParcCONTADUPL: TIntegerField;
    sdsCReceberParcSELECIONADO: TStringField;
    sdsCReceberParcCODVENDEDOR: TIntegerField;
    sdsCReceberParcBAIXADA: TStringField;
    sdsCReceberParcPERCCOMISSAO: TFloatField;
    sdsCReceberParcVLRCOMISSAO: TFloatField;
    sdsCReceberParcPLANOCONTAS: TIntegerField;
    sdsCReceberParcAGENCIA: TStringField;
    sdsCReceberParcTITPORTADOR: TStringField;
    sdsCReceberParcCODTIPOCOBRANCA: TIntegerField;
    sdsCReceberParcDESPESAS: TFloatField;
    sdsCReceberParcABATIMENTOS: TFloatField;
    sdsCReceberParcCODCONTA: TIntegerField;
    sdsCReceberParcPGCARTORIO: TStringField;
    sdsCReceberParcDIASATRASO: TFloatField;
    sdsCReceberParcLETRACAMBIO: TStringField;
    sdsCReceberParcNROLANCEXTCOMISSAO: TIntegerField;
    sdsCReceberParcJUROSPAGOS: TFloatField;
    sdsCReceberParcCANCELADO: TStringField;
    sdsCReceberParcTITPROTESTADO: TStringField;
    sdsCReceberParcDTGERADO: TDateField;
    sdsCReceberParcTIPODOC: TStringField;
    sdsCReceberParcVLRDEVOLUCAO: TFloatField;
    sdsCReceberParcDUPLICATAIMP: TStringField;
    sdsCReceberParcPAGARPARTENANOTA: TStringField;
    sdsCReceberParcMERCADO: TStringField;
    sdsCReceberParcFILIAL: TIntegerField;
    sdsCReceberParcPERCCOMISSAO2: TFloatField;
    sdsCReceberParcCODVENDEDOR2: TIntegerField;
    sdsCReceberParcCODBANCOBOLETO: TIntegerField;
    sdsCReceberParcCOMISSAOITEM: TStringField;
    sdsCReceberParcTRANSFERENCIA: TStringField;
    sdsCReceberParcSERIE: TStringField;
    sdsCReceberParcNUMSEQNOTA: TIntegerField;
    sdsCReceberParcCODPLANOCONTASITENS: TIntegerField;
    sdsCReceberParcEXPORTACAO: TStringField;
    sdsCReceberParcNUMNOTA: TIntegerField;
    cdsCRecebersdsCReceberParc: TDataSetField;
    cdsCReceberParcNUMCRECEBER: TIntegerField;
    cdsCReceberParcPARCCRECEBER: TIntegerField;
    cdsCReceberParcVLRPARCCRECEBER: TFloatField;
    cdsCReceberParcDTVENCCRECEBER: TDateField;
    cdsCReceberParcQUITPARCCRECEBER: TStringField;
    cdsCReceberParcJUROSPARCCRECEBER: TFloatField;
    cdsCReceberParcDTPAGPARCCRECEBER: TDateField;
    cdsCReceberParcCODCLI: TIntegerField;
    cdsCReceberParcNUMSEQ: TIntegerField;
    cdsCReceberParcDESCONTO: TFloatField;
    cdsCReceberParcPGTOPARCIAL: TFloatField;
    cdsCReceberParcRESTPARCELA: TFloatField;
    cdsCReceberParcCONTADUPL: TIntegerField;
    cdsCReceberParcSELECIONADO: TStringField;
    cdsCReceberParcCODVENDEDOR: TIntegerField;
    cdsCReceberParcBAIXADA: TStringField;
    cdsCReceberParcPERCCOMISSAO: TFloatField;
    cdsCReceberParcVLRCOMISSAO: TFloatField;
    cdsCReceberParcPLANOCONTAS: TIntegerField;
    cdsCReceberParcAGENCIA: TStringField;
    cdsCReceberParcTITPORTADOR: TStringField;
    cdsCReceberParcCODTIPOCOBRANCA: TIntegerField;
    cdsCReceberParcDESPESAS: TFloatField;
    cdsCReceberParcABATIMENTOS: TFloatField;
    cdsCReceberParcCODCONTA: TIntegerField;
    cdsCReceberParcPGCARTORIO: TStringField;
    cdsCReceberParcDIASATRASO: TFloatField;
    cdsCReceberParcLETRACAMBIO: TStringField;
    cdsCReceberParcNROLANCEXTCOMISSAO: TIntegerField;
    cdsCReceberParcJUROSPAGOS: TFloatField;
    cdsCReceberParcCANCELADO: TStringField;
    cdsCReceberParcTITPROTESTADO: TStringField;
    cdsCReceberParcDTGERADO: TDateField;
    cdsCReceberParcTIPODOC: TStringField;
    cdsCReceberParcVLRDEVOLUCAO: TFloatField;
    cdsCReceberParcDUPLICATAIMP: TStringField;
    cdsCReceberParcPAGARPARTENANOTA: TStringField;
    cdsCReceberParcMERCADO: TStringField;
    cdsCReceberParcFILIAL: TIntegerField;
    cdsCReceberParcPERCCOMISSAO2: TFloatField;
    cdsCReceberParcCODVENDEDOR2: TIntegerField;
    cdsCReceberParcCODBANCOBOLETO: TIntegerField;
    cdsCReceberParcCOMISSAOITEM: TStringField;
    cdsCReceberParcTRANSFERENCIA: TStringField;
    cdsCReceberParcSERIE: TStringField;
    cdsCReceberParcNUMSEQNOTA: TIntegerField;
    cdsCReceberParcCODPLANOCONTASITENS: TIntegerField;
    cdsCReceberParcEXPORTACAO: TStringField;
    cdsCReceberParcNUMNOTA: TIntegerField;
    dsCReceberParc: TDataSource;
    dsCReceberParc_Mestre: TDataSource;
    sdsCReceberParcHist: TSQLDataSet;
    cdsCReceberParcHist: TClientDataSet;
    sdsCReceberParcHistNUMCRECEBER: TIntegerField;
    sdsCReceberParcHistPARCCRECEBER: TIntegerField;
    sdsCReceberParcHistITEM: TIntegerField;
    sdsCReceberParcHistCODHISTORICO: TIntegerField;
    sdsCReceberParcHistDTHISTORICO: TDateField;
    sdsCReceberParcHistHISTORICO: TStringField;
    sdsCReceberParcHistDTULTPGTO: TDateField;
    sdsCReceberParcHistVLRULTPGTO: TFloatField;
    sdsCReceberParcHistVLRULTJUROS: TFloatField;
    sdsCReceberParcHistVLRULTDESCONTOS: TFloatField;
    sdsCReceberParcHistVLRULTDESPESAS: TFloatField;
    sdsCReceberParcHistVLRULTABATIMENTOS: TFloatField;
    sdsCReceberParcHistPGTO: TStringField;
    sdsCReceberParcHistJUROSPAGOS: TFloatField;
    sdsCReceberParcHistNUMMOV: TIntegerField;
    sdsCReceberParcHistNUMMOVJUROS: TIntegerField;
    sdsCReceberParcHistJUROSCALC: TFloatField;
    sdsCReceberParcHistVLRDEVOLUCAO: TFloatField;
    sdsCReceberParcHistDEVOLUCAO: TStringField;
    sdsCReceberParcHistNROLANCEXTCOMISSAO: TIntegerField;
    sdsCReceberParcHistFILIAL: TIntegerField;
    cdsCReceberParcsdsCReceberParcHist: TDataSetField;
    cdsCReceberParcHistNUMCRECEBER: TIntegerField;
    cdsCReceberParcHistPARCCRECEBER: TIntegerField;
    cdsCReceberParcHistITEM: TIntegerField;
    cdsCReceberParcHistCODHISTORICO: TIntegerField;
    cdsCReceberParcHistDTHISTORICO: TDateField;
    cdsCReceberParcHistHISTORICO: TStringField;
    cdsCReceberParcHistDTULTPGTO: TDateField;
    cdsCReceberParcHistVLRULTPGTO: TFloatField;
    cdsCReceberParcHistVLRULTJUROS: TFloatField;
    cdsCReceberParcHistVLRULTDESCONTOS: TFloatField;
    cdsCReceberParcHistVLRULTDESPESAS: TFloatField;
    cdsCReceberParcHistVLRULTABATIMENTOS: TFloatField;
    cdsCReceberParcHistPGTO: TStringField;
    cdsCReceberParcHistJUROSPAGOS: TFloatField;
    cdsCReceberParcHistNUMMOV: TIntegerField;
    cdsCReceberParcHistNUMMOVJUROS: TIntegerField;
    cdsCReceberParcHistJUROSCALC: TFloatField;
    cdsCReceberParcHistVLRDEVOLUCAO: TFloatField;
    cdsCReceberParcHistDEVOLUCAO: TStringField;
    cdsCReceberParcHistNROLANCEXTCOMISSAO: TIntegerField;
    cdsCReceberParcHistFILIAL: TIntegerField;
    dsCReceberParcHist: TDataSource;
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

//var
//  dmCadCReceber: TdmCadCReceber;

procedure TdmCadCReceber.AtualizaConsulta;
begin
  if cdsCReceber.Active then
  begin
    if not cdsCReceber.Eof then
      LocalizarRegistro(True)
    else
      LocalizarRegistro(False);
  end
  else
    LocalizarRegistro(False);
end;

procedure TdmCadCReceber.AutoEditar(Ativar: Boolean);
begin

end;

procedure TdmCadCReceber.CancelarRegistro;
var
  iCodigo: integer;
begin
  iCodigo := 0;
  if Estado = csEdit then
    iCodigo := cdsCReceberNUMCRECEBER.AsInteger;

  if cdsCReceber.Active then
    cdsCReceber.CancelUpdates;
  AutoEditar(False);

  if (Estado = csEdit) and (cdsCReceberNUMCRECEBER.AsInteger <> iCodigo) then
    cdsCReceber.Locate('CODIGO', iCodigo, []);

  AtualizaConsulta;
end;

procedure TdmCadCReceber.DataModuleCreate(Sender: TObject);
begin
  sCommandText := sdsCReceber.CommandText;
  AutoEditar(False);
end;

procedure TdmCadCReceber.EditarRegistro;
begin
  cdsCReceber.Edit;
  AutoEditar(True);

end;

procedure TdmCadCReceber.ExcluirRegistro;
var
  sBookmark: string;
begin
  sBookmark := cdsCReceber.Bookmark;
  try
    cdsCReceber.DisableControls;
    try
      cdsCReceberParc.First;
      while not cdsCReceberParc.Eof do
      begin
        cdsCReceberParcHist.First;
        while not cdsCReceberParcHist.Eof do
          cdsCReceberParcHist.Delete;
        cdsCReceberParc.Delete;
      end;
      cdsCReceber.Delete;
      if (cdsCReceber.ChangeCount > 0) and (cdsCReceber.ApplyUpdates(0) > 0) then
        Abort;
    except
      CancelarRegistro;
      cdsCReceber.Bookmark := sBookmark;
      raise;
    end;
  finally
    AtualizaConsulta;
    cdsCReceber.EnableControls;
  end;
end;

procedure TdmCadCReceber.ExecutaConsulta(SQL: string);
begin
  cdsCReceber.Close;
  sdsCReceber.CommandText := SQL;
  cdsCReceber.Open;
end;

procedure TdmCadCReceber.GravarRegistro;
begin
  if cdsCReceber.State in [dsEdit, dsInsert] then
    cdsCReceber.Post;

  if cdsCReceber.ApplyUpdates(0) > 0 then
    Abort;

  AutoEditar(False);
end;

procedure TdmCadCReceber.IncluirRegistro;
begin
  if not cdsCReceber.Active then
    LocalizarRegistro(False);
  cdsCReceber.Insert;
  AutoEditar(True);
end;

function TdmCadCReceber.LocalizarRegistro(bLocalizar: Boolean;
  Codigo: Integer): Boolean;
begin
  if not bLocalizar and not cdsCReceber.Active then
  begin
    ExecutaConsulta(sCommandText + ' WHERE NUMCRECEBER = ' + IntToStr(Codigo));
    Result := not cdsCReceber.IsEmpty;
  end
  else if (not cdsCReceber.IsEmpty) and (Codigo > 0) then
  begin
    cdsCReceber.First;
    Result := cdsCReceber.Locate('CODIGO', Codigo, []);
  end
  else
    Result := not cdsCReceber.IsEmpty;
end;

end.


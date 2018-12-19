unit dmdCadTalaoAuxiliar;

interface

uses
  SysUtils, Classes, DmdDatabase, FMTBcd, DB, SqlExpr, DBClient, Provider,
  arTypes, Variants;

type
  TdmTalaoAuxiliar = class(TDataModule)
    sdsTalaoAuxiliar: TSQLDataSet;
    dspTalaoAuxiliar: TDataSetProvider;
    cdsTalaoAuxiliar: TClientDataSet;
    dsTalaoAuxiliar: TDataSource;
    dsTalaoAuxiliar_Mestre: TDataSource;
    sdsTalaoAuxiliarGrade: TSQLDataSet;
    cdsTalaoAuxiliarGrade: TClientDataSet;
    dsTalaoAuxiliarGrade: TDataSource;
    sdsTalaoAuxiliarLOTE: TIntegerField;
    sdsTalaoAuxiliarCODSETOR: TIntegerField;
    sdsTalaoAuxiliarITEMTALAO: TIntegerField;
    sdsTalaoAuxiliarTALAO: TIntegerField;
    sdsTalaoAuxiliarCODPRODUTO: TIntegerField;
    sdsTalaoAuxiliarCODCOR: TIntegerField;
    sdsTalaoAuxiliarQTDPARES: TIntegerField;
    sdsTalaoAuxiliarCODGRADE: TIntegerField;
    sdsTalaoAuxiliarPOSICAO: TIntegerField;
    sdsTalaoAuxiliarTAMANHO: TStringField;
    sdsTalaoAuxiliarCODCLIENTE: TIntegerField;
    sdsTalaoAuxiliarPEDIDO: TIntegerField;
    sdsTalaoAuxiliarITEMPEDIDO: TIntegerField;
    sdsTalaoAuxiliarCODATELIER: TIntegerField;
    sdsTalaoAuxiliarDTENTRADA: TDateField;
    sdsTalaoAuxiliarHRENTRADA: TTimeField;
    sdsTalaoAuxiliarDTSAIDA: TDateField;
    sdsTalaoAuxiliarHRSAIDA: TTimeField;
    sdsTalaoAuxiliarOPCAOLOTETALAO: TStringField;
    cdsTalaoAuxiliarLOTE: TIntegerField;
    cdsTalaoAuxiliarCODSETOR: TIntegerField;
    cdsTalaoAuxiliarITEMTALAO: TIntegerField;
    cdsTalaoAuxiliarTALAO: TIntegerField;
    cdsTalaoAuxiliarCODPRODUTO: TIntegerField;
    cdsTalaoAuxiliarCODCOR: TIntegerField;
    cdsTalaoAuxiliarQTDPARES: TIntegerField;
    cdsTalaoAuxiliarCODGRADE: TIntegerField;
    cdsTalaoAuxiliarPOSICAO: TIntegerField;
    cdsTalaoAuxiliarTAMANHO: TStringField;
    cdsTalaoAuxiliarCODCLIENTE: TIntegerField;
    cdsTalaoAuxiliarPEDIDO: TIntegerField;
    cdsTalaoAuxiliarITEMPEDIDO: TIntegerField;
    cdsTalaoAuxiliarCODATELIER: TIntegerField;
    cdsTalaoAuxiliarDTENTRADA: TDateField;
    cdsTalaoAuxiliarHRENTRADA: TTimeField;
    cdsTalaoAuxiliarDTSAIDA: TDateField;
    cdsTalaoAuxiliarHRSAIDA: TTimeField;
    cdsTalaoAuxiliarOPCAOLOTETALAO: TStringField;
    sdsTalaoAuxiliarGradeLOTE: TIntegerField;
    sdsTalaoAuxiliarGradeCODSETOR: TIntegerField;
    sdsTalaoAuxiliarGradeCODGRADE: TIntegerField;
    sdsTalaoAuxiliarGradePOSICAO: TIntegerField;
    sdsTalaoAuxiliarGradeQTD: TIntegerField;
    sdsTalaoAuxiliarGradeTAMANHO: TStringField;
    cdsTalaoAuxiliarsdsTalaoAuxiliarGrade: TDataSetField;
    cdsTalaoAuxiliarGradeLOTE: TIntegerField;
    cdsTalaoAuxiliarGradeCODSETOR: TIntegerField;
    cdsTalaoAuxiliarGradeCODGRADE: TIntegerField;
    cdsTalaoAuxiliarGradePOSICAO: TIntegerField;
    cdsTalaoAuxiliarGradeQTD: TIntegerField;
    cdsTalaoAuxiliarGradeTAMANHO: TStringField;
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
    function LocalizarRegistro(bLocalizar: Boolean; Codigo: Integer = 0; CodSetor: Integer = 0; ItemTalao: Integer = 0; Talao: Integer = 0): Boolean;
    procedure ExecutaConsulta(SQL: string);
    property Estado: TarCadState read FEstado write FEstado;

  end;

implementation

uses StdConvs;

{$R *.dfm}

//var
//  dmCadTalaoAuxiliar: TdmCadTalaoAuxiliar;

procedure TdmTalaoAuxiliar.AtualizaConsulta;
begin
  if cdsTalaoAuxiliar.Active then
  begin
    if not cdsTalaoAuxiliar.Eof then
      LocalizarRegistro(True)
    else
      LocalizarRegistro(False);
  end
  else
    LocalizarRegistro(False);
end;

procedure TdmTalaoAuxiliar.AutoEditar(Ativar: Boolean);
begin

end;

procedure TdmTalaoAuxiliar.CancelarRegistro;
var
  vLote, vCodSetor, vItemTalao, vTalao : Integer;
begin
  vLote      := 0;
  vCodSetor  := 0;
  vItemTalao := 0;
  vTalao     := 0;
  if Estado = csEdit then
  begin
    vLote      := cdsTalaoAuxiliarLOTE.AsInteger;
    vCodSetor  := cdsTalaoAuxiliarCODSETOR.AsInteger;
    vItemTalao := cdsTalaoAuxiliarITEMTALAO.AsInteger;
    vTalao     := cdsTalaoAuxiliarTALAO.AsInteger;
  end;

  if cdsTalaoAuxiliar.Active then
    cdsTalaoAuxiliar.CancelUpdates;
  AutoEditar(False);

  if (Estado = csEdit) and ((cdsTalaoAuxiliarLOTE.AsInteger <> vLote) or (cdsTalaoAuxiliarCODSETOR.AsInteger <> vCodSetor)
                        or (cdsTalaoAuxiliarITEMTALAO.AsInteger <> vItemTalao) or (cdsTalaoAuxiliarTALAO.AsInteger <> vTalao)) then
    cdsTalaoAuxiliar.Locate('LOTE;CODSETOR;ITEMTALAO;TALAO', VarArrayOf([vLote,vCodSetor,vItemTalao,vTalao]), []);
  AtualizaConsulta;
end;

procedure TdmTalaoAuxiliar.DataModuleCreate(Sender: TObject);
begin
  sCommandText := sdsTalaoAuxiliar.CommandText;
  AutoEditar(False);
end;

procedure TdmTalaoAuxiliar.EditarRegistro;
begin
  cdsTalaoAuxiliar.Edit;
  AutoEditar(True);

end;

procedure TdmTalaoAuxiliar.ExcluirRegistro;
var
  sBookmark: string;
begin
  sBookmark := cdsTalaoAuxiliar.Bookmark;
  try
    cdsTalaoAuxiliar.DisableControls;
    try
      cdsTalaoAuxiliarGrade.First;
      while not cdsTalaoAuxiliarGrade.Eof do
        cdsTalaoAuxiliarGrade.Delete;
      cdsTalaoAuxiliar.Delete;
      if (cdsTalaoAuxiliar.ChangeCount > 0) and (cdsTalaoAuxiliar.ApplyUpdates(0) > 0) then
        Abort;
    except
      CancelarRegistro;
      cdsTalaoAuxiliar.Bookmark := sBookmark;
      raise;
    end;
  finally
    AtualizaConsulta;
    cdsTalaoAuxiliar.EnableControls;
  end;
end;

procedure TdmTalaoAuxiliar.ExecutaConsulta(SQL: string);
begin
  cdsTalaoAuxiliar.Close;
  sdsTalaoAuxiliar.CommandText := SQL;
  cdsTalaoAuxiliar.Open;
  cdsTalaoAuxiliarGrade.Close;
  cdsTalaoAuxiliarGrade.Open;
end;

procedure TdmTalaoAuxiliar.GravarRegistro;
begin
  if cdsTalaoAuxiliar.State in [dsEdit, dsInsert] then
    cdsTalaoAuxiliar.Post;

  if cdsTalaoAuxiliar.ApplyUpdates(0) > 0 then
    Abort;

  AutoEditar(False);
end;

procedure TdmTalaoAuxiliar.IncluirRegistro;
begin
  if not cdsTalaoAuxiliar.Active then
    LocalizarRegistro(False);
  cdsTalaoAuxiliar.Insert;
  AutoEditar(True);
end;

function TdmTalaoAuxiliar.LocalizarRegistro(bLocalizar: Boolean; Codigo: Integer = 0; CodSetor: Integer = 0; ItemTalao: Integer = 0; Talao: Integer = 0): Boolean;
begin
  if not bLocalizar and not cdsTalaoAuxiliar.Active then
  begin
    ExecutaConsulta(sCommandText + ' WHERE LOTE = ' + IntToStr(Codigo) + '   AND CODSETOR = ' + IntToStr(CodSetor) + '   AND ITEMTALAO = ' + IntToStr(ItemTalao)
                                 + '   AND TALAO = ' + IntToStr(Talao));

    Result := not cdsTalaoAuxiliar.IsEmpty;
  end
  else if (not cdsTalaoAuxiliar.IsEmpty) and (Codigo > 0) then
  begin
    cdsTalaoAuxiliar.First;
    Result := cdsTalaoAuxiliar.Locate('CODIGO', Codigo, []);
  end
  else
    Result := not cdsTalaoAuxiliar.IsEmpty;
end;

end.


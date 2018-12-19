unit dmdCadLote;

interface

uses
  SysUtils, Classes, DmdDatabase, FMTBcd, DB, SqlExpr, DBClient, Provider,
  arTypes, Variants;

type
  TdmCadLote = class(TDataModule)
    sdsLote: TSQLDataSet;
    dspLote: TDataSetProvider;
    cdsLote: TClientDataSet;
    dsLote: TDataSource;
    sdsLoteLOTE: TIntegerField;
    sdsLoteQTDTALOES: TIntegerField;
    sdsLoteQTDPARES: TFloatField;
    sdsLoteOBS: TMemoField;
    sdsLoteIMPCALCMATERIAL: TStringField;
    sdsLoteNROPEDIDO: TIntegerField;
    sdsLoteIMPRESSO: TStringField;
    sdsLoteOCGERADO: TStringField;
    sdsLoteITEMPED: TIntegerField;
    sdsLoteNUMMAPACOMPRAS: TIntegerField;
    sdsLoteDTEMBARQUE: TDateField;
    sdsLoteTIPOTALAO: TStringField;
    sdsLoteCODFABRICA: TIntegerField;
    sdsLoteNUMPROGRAMACAO: TIntegerField;
    sdsLoteNUMOCINI: TIntegerField;
    sdsLoteNUMOCFIN: TIntegerField;
    cdsLoteLOTE: TIntegerField;
    cdsLoteQTDTALOES: TIntegerField;
    cdsLoteQTDPARES: TFloatField;
    cdsLoteOBS: TMemoField;
    cdsLoteIMPCALCMATERIAL: TStringField;
    cdsLoteNROPEDIDO: TIntegerField;
    cdsLoteIMPRESSO: TStringField;
    cdsLoteOCGERADO: TStringField;
    cdsLoteITEMPED: TIntegerField;
    cdsLoteNUMMAPACOMPRAS: TIntegerField;
    cdsLoteDTEMBARQUE: TDateField;
    cdsLoteTIPOTALAO: TStringField;
    cdsLoteCODFABRICA: TIntegerField;
    cdsLoteNUMPROGRAMACAO: TIntegerField;
    cdsLoteNUMOCINI: TIntegerField;
    cdsLoteNUMOCFIN: TIntegerField;
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
    function LocalizarRegistro(bLocalizar: Boolean; Lote : Integer = 0): Boolean;
    procedure ExecutaConsulta(SQL: string);
    property Estado: TarCadState read FEstado write FEstado;

  end;

implementation

{$R *.dfm}


{ TdmCadLote }


procedure TdmCadLote.AtualizaConsulta;
begin
  if cdsLote.Active then
  begin
    if not cdsLote.Eof then
      LocalizarRegistro(True)
    else
      LocalizarRegistro(False);
  end
  else
    LocalizarRegistro(False);
end;

procedure TdmCadLote.AutoEditar(Ativar: Boolean);
begin

end;

procedure TdmCadLote.CancelarRegistro;
var
  vLote : Integer;
begin
  vLote  := 0;

  if Estado = csEdit then
    vLote  := cdsLoteLOTE.AsInteger;

  if cdsLote.Active then
    cdsLote.CancelUpdates;
  AutoEditar(False);

  if (Estado = csEdit) and (cdsLoteLOTE.AsInteger <> vLote) then
    cdsLote.Locate('LOTE', vLote, []);

  AtualizaConsulta;
end;

procedure TdmCadLote.DataModuleCreate(Sender: TObject);
begin
  sCommandText := sdsLote.CommandText;
  AutoEditar(False);
end;

procedure TdmCadLote.EditarRegistro;
begin
  cdsLote.Edit;
  AutoEditar(True);
end;

procedure TdmCadLote.ExcluirRegistro;
var
  sBookmark: string;
begin
  sBookmark := cdsLote.Bookmark;
  try
    cdsLote.DisableControls;
    try
      cdsLote.Delete;
      if (cdsLote.ChangeCount > 0) and (cdsLote.ApplyUpdates(0) > 0) then
        Abort;
    except
      CancelarRegistro;
      cdsLote.Bookmark := sBookmark;
      raise;
    end;
  finally
    AtualizaConsulta;
    cdsLote.EnableControls;
  end;
end;

procedure TdmCadLote.ExecutaConsulta(SQL: string);
begin
  cdsLote.Close;
  sdsLote.CommandText := SQL;
  cdsLote.Open;
end;

procedure TdmCadLote.GravarRegistro;
begin
  if cdsLote.State in [dsEdit, dsInsert] then
    cdsLote.Post;

  if cdsLote.ApplyUpdates(0) > 0 then
    Abort;

  AutoEditar(False);
end;

procedure TdmCadLote.IncluirRegistro;
begin
  if not cdsLote.Active then
    LocalizarRegistro(False);
  cdsLote.Insert;
  AutoEditar(True);
end;

function TdmCadLote.LocalizarRegistro(bLocalizar: Boolean; Lote : Integer): Boolean;
begin
  if not bLocalizar and not cdsLote.Active then
  begin
    ExecutaConsulta(sCommandText + ' WHERE LOTE = ' + IntToStr(Lote));
    Result := not cdsLote.IsEmpty;
  end
  else if (not cdsLote.IsEmpty) and (Lote <> 0) then
  begin
    cdsLote.First;
    Result := cdsLote.Locate('LOTE', Lote, []);
  end
  else
    Result := not cdsLote.IsEmpty;
end;

end.


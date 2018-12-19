unit dmdCadTalao;

interface

uses
  SysUtils, Classes, DmdDatabase, FMTBcd, DB, SqlExpr, DBClient, Provider,
  arTypes, Variants;

type
  TdmCadTalao = class(TDataModule)
    sdsTalao: TSQLDataSet;
    dspTalao: TDataSetProvider;
    cdsTalao: TClientDataSet;
    dsTalao: TDataSource;
    sdsTalaoLOTE: TIntegerField;
    sdsTalaoITEM: TIntegerField;
    sdsTalaoCODPRODUTO: TIntegerField;
    sdsTalaoCODCABEDAL1: TIntegerField;
    sdsTalaoCODCABEDAL2: TIntegerField;
    sdsTalaoCODCOR: TIntegerField;
    sdsTalaoCODCORFORRO: TIntegerField;
    sdsTalaoCODCORPALMILHA: TIntegerField;
    sdsTalaoCODCORSOLADO: TIntegerField;
    sdsTalaoQTDPAR: TIntegerField;
    sdsTalaoCODFORRO: TIntegerField;
    sdsTalaoCODETIQUETA: TIntegerField;
    sdsTalaoCODSOLADO: TIntegerField;
    sdsTalaoCODTALONEIRA: TIntegerField;
    sdsTalaoCODCORTALONEIRA: TIntegerField;
    sdsTalaoCODPALMILHA: TIntegerField;
    sdsTalaoINVOICE: TStringField;
    sdsTalaoCODFORMA: TIntegerField;
    sdsTalaoCODFABRICA: TIntegerField;
    cdsTalaoLOTE: TIntegerField;
    cdsTalaoITEM: TIntegerField;
    cdsTalaoCODPRODUTO: TIntegerField;
    cdsTalaoCODCABEDAL1: TIntegerField;
    cdsTalaoCODCABEDAL2: TIntegerField;
    cdsTalaoCODCOR: TIntegerField;
    cdsTalaoCODCORFORRO: TIntegerField;
    cdsTalaoCODCORPALMILHA: TIntegerField;
    cdsTalaoCODCORSOLADO: TIntegerField;
    cdsTalaoQTDPAR: TIntegerField;
    cdsTalaoCODFORRO: TIntegerField;
    cdsTalaoCODETIQUETA: TIntegerField;
    cdsTalaoCODSOLADO: TIntegerField;
    cdsTalaoCODTALONEIRA: TIntegerField;
    cdsTalaoCODCORTALONEIRA: TIntegerField;
    cdsTalaoCODPALMILHA: TIntegerField;
    cdsTalaoINVOICE: TStringField;
    cdsTalaoCODFORMA: TIntegerField;
    cdsTalaoCODFABRICA: TIntegerField;
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
    function LocalizarRegistro(bLocalizar: Boolean; Lote : Integer = 0; Item : Integer = 0): Boolean;
    procedure ExecutaConsulta(SQL: string);
    property Estado: TarCadState read FEstado write FEstado;

  end;

implementation

{$R *.dfm}


{ TdmCadTalao }


procedure TdmCadTalao.AtualizaConsulta;
begin
  if cdsTalao.Active then
  begin
    if not cdsTalao.Eof then
      LocalizarRegistro(True)
    else
      LocalizarRegistro(False);
  end
  else
    LocalizarRegistro(False);
end;

procedure TdmCadTalao.AutoEditar(Ativar: Boolean);
begin

end;

procedure TdmCadTalao.CancelarRegistro;
var
  vLote, vItem : Integer;
begin
  vLote  := 0;
  vItem  := 0;

  if Estado = csEdit then
  begin
    vLote  := cdsTalaoLOTE.AsInteger;
    vItem  := cdsTalaoITEM.AsInteger;
  end;

  if cdsTalao.Active then
    cdsTalao.CancelUpdates;
  AutoEditar(False);

  if (Estado = csEdit) and ((cdsTalaoLOTE.AsInteger <> vLote) or (cdsTalaoITEM.AsInteger <> vItem)) then
    cdsTalao.Locate('LOTE;ITEM', VarArrayOf([vLote,vItem]), []);

  AtualizaConsulta;
end;

procedure TdmCadTalao.DataModuleCreate(Sender: TObject);
begin
  sCommandText := sdsTalao.CommandText;
  AutoEditar(False);
end;

procedure TdmCadTalao.EditarRegistro;
begin
  cdsTalao.Edit;
  AutoEditar(True);
end;

procedure TdmCadTalao.ExcluirRegistro;
var
  sBookmark: string;
begin
  sBookmark := cdsTalao.Bookmark;
  try
    cdsTalao.DisableControls;
    try
      cdsTalao.Delete;
      if (cdsTalao.ChangeCount > 0) and (cdsTalao.ApplyUpdates(0) > 0) then
        Abort;
    except
      CancelarRegistro;
      cdsTalao.Bookmark := sBookmark;
      raise;
    end;
  finally
    AtualizaConsulta;
    cdsTalao.EnableControls;
  end;
end;

procedure TdmCadTalao.ExecutaConsulta(SQL: string);
begin
  cdsTalao.Close;
  sdsTalao.CommandText := SQL;
  cdsTalao.Open;
end;

procedure TdmCadTalao.GravarRegistro;
begin
  if cdsTalao.State in [dsEdit, dsInsert] then
    cdsTalao.Post;

  if cdsTalao.ApplyUpdates(0) > 0 then
    Abort;

  AutoEditar(False);
end;

procedure TdmCadTalao.IncluirRegistro;
begin
  if not cdsTalao.Active then
    LocalizarRegistro(False);
  cdsTalao.Insert;
  AutoEditar(True);
end;

function TdmCadTalao.LocalizarRegistro(bLocalizar: Boolean; Lote, Item : Integer): Boolean;
begin
  if not bLocalizar and not cdsTalao.Active then
  begin
    ExecutaConsulta(sCommandText + ' WHERE LOTE = ' + IntToStr(Lote) + ' AND ITEM = ' + IntToStr(Item));
    Result := not cdsTalao.IsEmpty;
  end
  else if (not cdsTalao.IsEmpty) and (Lote <> 0) then
  begin
    cdsTalao.First;
    Result := cdsTalao.Locate('LOTE;ITEM', VarArrayOf([Lote,Item]), []);
  end
  else
    Result := not cdsTalao.IsEmpty;
end;

end.


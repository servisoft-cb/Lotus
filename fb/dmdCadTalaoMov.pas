unit dmdCadTalaoMov;

interface

uses
  SysUtils, Classes, DmdDatabase, FMTBcd, DB, SqlExpr, DBClient, Provider,
  arTypes, Variants;

type
  TdmCadTalaoMov = class(TDataModule)
    sdsTalaoMov: TSQLDataSet;
    dspTalaoMov: TDataSetProvider;
    cdsTalaoMov: TClientDataSet;
    dsTalaoMov: TDataSource;
    sdsTalaoMovLOTE: TIntegerField;
    sdsTalaoMovTALAO: TIntegerField;
    sdsTalaoMovSETOR: TIntegerField;
    sdsTalaoMovDATAENT: TDateField;
    sdsTalaoMovHORAENT: TTimeField;
    sdsTalaoMovDATASAIDA: TDateField;
    sdsTalaoMovHORASAIDA: TTimeField;
    sdsTalaoMovCODATELIER: TIntegerField;
    cdsTalaoMovLOTE: TIntegerField;
    cdsTalaoMovTALAO: TIntegerField;
    cdsTalaoMovSETOR: TIntegerField;
    cdsTalaoMovDATAENT: TDateField;
    cdsTalaoMovHORAENT: TTimeField;
    cdsTalaoMovDATASAIDA: TDateField;
    cdsTalaoMovHORASAIDA: TTimeField;
    cdsTalaoMovCODATELIER: TIntegerField;
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
    function LocalizarRegistro(bLocalizar: Boolean; Lote : Integer = 0; Talao : Integer = 0; Setor : Integer = 0): Boolean;
    procedure ExecutaConsulta(SQL: string);
    property Estado: TarCadState read FEstado write FEstado;

  end;

implementation

{$R *.dfm}


{ TdmCadTalaoMov }


procedure TdmCadTalaoMov.AtualizaConsulta;
begin
  if cdsTalaoMov.Active then
  begin
    if not cdsTalaoMov.Eof then
      LocalizarRegistro(True)
    else
      LocalizarRegistro(False);
  end
  else
    LocalizarRegistro(False);
end;

procedure TdmCadTalaoMov.AutoEditar(Ativar: Boolean);
begin

end;

procedure TdmCadTalaoMov.CancelarRegistro;
var
  vLote, vTalao, vSetor : Integer;
begin
  vLote  := 0;
  vTalao := 0;
  vSetor := 0;

  if Estado = csEdit then
  begin
    vLote  := cdsTalaoMovLOTE.AsInteger;
    vTalao := cdsTalaoMovTALAO.AsInteger;
    vSetor := cdsTalaoMovSETOR.AsInteger;

  end;

  if cdsTalaoMov.Active then
    cdsTalaoMov.CancelUpdates;
  AutoEditar(False);

  if (Estado = csEdit) and ((cdsTalaoMovLOTE.AsInteger <> vLote) or (cdsTalaoMovTALAO.AsInteger <> vTalao) or (cdsTalaoMovSETOR.AsInteger <> vSetor)) then
    cdsTalaoMov.Locate('LOTE;TALAO;SETOR', VarArrayOf([vLote,vTalao,vSetor]), []);

  AtualizaConsulta;
end;

procedure TdmCadTalaoMov.DataModuleCreate(Sender: TObject);
begin
  sCommandText := sdsTalaoMov.CommandText;
  AutoEditar(False);
end;

procedure TdmCadTalaoMov.EditarRegistro;
begin
  cdsTalaoMov.Edit;
  AutoEditar(True);
end;

procedure TdmCadTalaoMov.ExcluirRegistro;
var
  sBookmark: string;
begin
  sBookmark := cdsTalaoMov.Bookmark;
  try
    cdsTalaoMov.DisableControls;
    try
      cdsTalaoMov.Delete;
      if (cdsTalaoMov.ChangeCount > 0) and (cdsTalaoMov.ApplyUpdates(0) > 0) then
        Abort;
    except
      CancelarRegistro;
      cdsTalaoMov.Bookmark := sBookmark;
      raise;
    end;
  finally
    AtualizaConsulta;
    cdsTalaoMov.EnableControls;
  end;
end;

procedure TdmCadTalaoMov.ExecutaConsulta(SQL: string);
begin
  cdsTalaoMov.Close;
  sdsTalaoMov.CommandText := SQL;
  cdsTalaoMov.Open;
end;

procedure TdmCadTalaoMov.GravarRegistro;
begin
  if cdsTalaoMov.State in [dsEdit, dsInsert] then
    cdsTalaoMov.Post;

  if cdsTalaoMov.ApplyUpdates(0) > 0 then
    Abort;

  AutoEditar(False);
end;

procedure TdmCadTalaoMov.IncluirRegistro;
begin
  if not cdsTalaoMov.Active then
    LocalizarRegistro(False);
  cdsTalaoMov.Insert;
  AutoEditar(True);
end;

function TdmCadTalaoMov.LocalizarRegistro(bLocalizar: Boolean; Lote, Talao,
  Setor: Integer): Boolean;
begin
  if not bLocalizar and not cdsTalaoMov.Active then
  begin
    ExecutaConsulta(sCommandText + ' WHERE LOTE = ' + IntToStr(Lote) + ' AND TALAO = ' + IntToStr(Talao) + ' AND SETOR = ' + IntToStr(Setor));
    Result := not cdsTalaoMov.IsEmpty;
  end
  else if (not cdsTalaoMov.IsEmpty) and (Lote <> 0) then
  begin
    cdsTalaoMov.First;
    Result := cdsTalaoMov.Locate('LOTE;TALAO;SETOR', VarArrayOf([Lote,Talao,Setor]), []);
  end
  else
    Result := not cdsTalaoMov.IsEmpty;
end;

end.


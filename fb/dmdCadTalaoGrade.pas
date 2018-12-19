unit dmdCadTalaoGrade;

interface

uses
  SysUtils, Classes, DmdDatabase, FMTBcd, DB, SqlExpr, DBClient, Provider,
  arTypes, Variants;

type
  TdmCadTalaoGrade = class(TDataModule)
    sdsTalaoGrade: TSQLDataSet;
    dspTalaoGrade: TDataSetProvider;
    cdsTalaoGrade: TClientDataSet;
    dsTalaoGrade: TDataSource;
    sdsTalaoGradeLOTE: TIntegerField;
    sdsTalaoGradeITEM: TIntegerField;
    sdsTalaoGradeTALAO: TIntegerField;
    sdsTalaoGradeCODGRADE: TIntegerField;
    sdsTalaoGradePOSICAO: TIntegerField;
    sdsTalaoGradeQTDPAR: TIntegerField;
    cdsTalaoGradeLOTE: TIntegerField;
    cdsTalaoGradeITEM: TIntegerField;
    cdsTalaoGradeTALAO: TIntegerField;
    cdsTalaoGradeCODGRADE: TIntegerField;
    cdsTalaoGradePOSICAO: TIntegerField;
    cdsTalaoGradeQTDPAR: TIntegerField;
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
    function LocalizarRegistro(bLocalizar: Boolean; Lote : Integer = 0; Item : Integer = 0; Talao : Integer = 0): Boolean;
    procedure ExecutaConsulta(SQL: string);
    property Estado: TarCadState read FEstado write FEstado;

  end;

implementation

{$R *.dfm}


{ TdmCadTalaoGrade }


procedure TdmCadTalaoGrade.AtualizaConsulta;
begin
  if cdsTalaoGrade.Active then
  begin
    if not cdsTalaoGrade.Eof then
      LocalizarRegistro(True)
    else
      LocalizarRegistro(False);
  end
  else
    LocalizarRegistro(False);
end;

procedure TdmCadTalaoGrade.AutoEditar(Ativar: Boolean);
begin

end;

procedure TdmCadTalaoGrade.CancelarRegistro;
var
  vLote, vItem, vTalao : Integer;
begin
  vLote  := 0;
  vItem  := 0;
  vTalao := 0;

  if Estado = csEdit then
  begin
    vLote  := cdsTalaoGradeLOTE.AsInteger;
    vItem  := cdsTalaoGradeITEM.AsInteger;
    vTalao := cdsTalaoGradeTALAO.AsInteger;
  end;

  if cdsTalaoGrade.Active then
    cdsTalaoGrade.CancelUpdates;
  AutoEditar(False);

  if (Estado = csEdit) and ((cdsTalaoGradeLOTE.AsInteger <> vLote) or (cdsTalaoGradeITEM.AsInteger <> vItem) or (cdsTalaoGradeTALAO.AsInteger <> vTalao)) then
    cdsTalaoGrade.Locate('TALAO;ITEM;TALAO', VarArrayOf([vLote,vItem,vTalao]), []);

  AtualizaConsulta;
end;

procedure TdmCadTalaoGrade.DataModuleCreate(Sender: TObject);
begin
  sCommandText := sdsTalaoGrade.CommandText;
  AutoEditar(False);
end;

procedure TdmCadTalaoGrade.EditarRegistro;
begin
  cdsTalaoGrade.Edit;
  AutoEditar(True);
end;

procedure TdmCadTalaoGrade.ExcluirRegistro;
var
  sBookmark: string;
begin
  sBookmark := cdsTalaoGrade.Bookmark;
  try
    cdsTalaoGrade.DisableControls;
    try
      cdsTalaoGrade.Delete;
      if (cdsTalaoGrade.ChangeCount > 0) and (cdsTalaoGrade.ApplyUpdates(0) > 0) then
        Abort;
    except
      CancelarRegistro;
      cdsTalaoGrade.Bookmark := sBookmark;
      raise;
    end;
  finally
    AtualizaConsulta;
    cdsTalaoGrade.EnableControls;
  end;
end;

procedure TdmCadTalaoGrade.ExecutaConsulta(SQL: string);
begin
  cdsTalaoGrade.Close;
  sdsTalaoGrade.CommandText := SQL;
  cdsTalaoGrade.Open;
end;

procedure TdmCadTalaoGrade.GravarRegistro;
begin
  if cdsTalaoGrade.State in [dsEdit, dsInsert] then
    cdsTalaoGrade.Post;

  if cdsTalaoGrade.ApplyUpdates(0) > 0 then
    Abort;

  AutoEditar(False);
end;

procedure TdmCadTalaoGrade.IncluirRegistro;
begin
  if not cdsTalaoGrade.Active then
    LocalizarRegistro(False);
  cdsTalaoGrade.Insert;
  AutoEditar(True);
end;

{function TdmCadTalaoGrade.LocalizarRegistro(bLocalizar: Boolean; Lote : Integer = 0; Item : Integer = 0; Talao : Integer = 0): Boolean;
begin
  if not bLocalizar and not cdsTalaoGrade.Active then
  begin
    ExecutaConsulta(sCommandText + ' WHERE CODIGO = ' + IntToStr(Codigo));
    Result := not cdsTalaoGrade.IsEmpty;
  end
  else if (not cdsTalaoGrade.IsEmpty) and (Codigo > 0) then
  begin
    cdsTalaoGrade.First;
    Result := cdsTalaoGrade.Locate('CODIGO', Codigo, []);
  end
  else
    Result := not cdsTalaoGrade.IsEmpty;
end;}

function TdmCadTalaoGrade.LocalizarRegistro(bLocalizar: Boolean; Lote,
  Item, Talao: Integer): Boolean;
begin
  if not bLocalizar and not cdsTalaoGrade.Active then
  begin
    ExecutaConsulta(sCommandText + ' WHERE LOTE = ' + IntToStr(Lote) + ' AND ITEM = ' + IntToStr(Item) + ' AND TALAO = ' + IntToStr(Talao));
    Result := not cdsTalaoGrade.IsEmpty;
  end
  else if (not cdsTalaoGrade.IsEmpty) and (Lote <> 0) then
  begin
    cdsTalaoGrade.First;
    Result := cdsTalaoGrade.Locate('LOTE;ITEM;TALAO', VarArrayOf([Lote,Item,Talao]), []);
  end
  else
    Result := not cdsTalaoGrade.IsEmpty;
end;

end.


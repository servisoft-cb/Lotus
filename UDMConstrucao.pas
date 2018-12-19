unit UDMConstrucao;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TDMConstrucao = class(TDataModule)
    qConstrucao: TQuery;
    qConstrucaoCodigo: TIntegerField;
    qConstrucaoNome: TStringField;
    qConstrucaoQtdPrevista: TIntegerField;
    qConstrucao_Mat: TQuery;
    qConstrucao_MatCodConstrucao: TIntegerField;
    qConstrucao_MatCodConstrucaoGrupo: TIntegerField;
    qConstrucao_MatItem: TIntegerField;
    qConstrucao_MatCodMaterial: TIntegerField;
    qConstrucao_MatCodGrade: TIntegerField;
    qConstrucao_MatCodCor: TIntegerField;
    qConstrucao_MatQtd: TFloatField;
    qConstrucao_MatVlrUnitario: TFloatField;
    qConstrucao_MatVlrTotal: TFloatField;
    qConstrucao_MatCodPosicao: TIntegerField;
    qConstrucao_MatImpTalao: TStringField;
    qConstrucao_MatUnidade: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMConstrucao: TDMConstrucao;

implementation

{$R *.dfm}

end.

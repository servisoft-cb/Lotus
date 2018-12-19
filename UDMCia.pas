unit UDMCia;

interface

uses
  SysUtils, Classes, DB, DBTables, Variants, Dialogs, DBIProcs;

type
  TDMCia = class(TDataModule)
    tCia: TTable;
    tCiaCodigo: TIntegerField;
    tCiaNome: TStringField;
    tCiaObs: TMemoField;
    tCiaDtCadastro: TDateField;
    tCiaItens: TTable;
    tCiaItensCodigo: TIntegerField;
    tCiaItensItem: TIntegerField;
    tCiaItensCodProduto: TIntegerField;
    tCiaItensPreco: TFloatField;
    tCiaItensProcesso: TStringField;
    dsCia: TDataSource;
    dsCiaItens: TDataSource;
    tCiaItensCodConstrucao: TIntegerField;
    tConstrucao2: TTable;
    tConstrucao2Codigo: TIntegerField;
    tConstrucao2Nome: TStringField;
    tCiaItenslkReferencia: TStringField;
    tCiaItenslkNomeConstrucao: TStringField;
    procedure tCiaAfterPost(DataSet: TDataSet);
    procedure tCiaItensAfterPost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  DMCia: TDMCia;

implementation

uses UDM1;

{$R *.dfm}


procedure TDMCia.tCiaAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tCia.Handle);
end;

procedure TDMCia.tCiaItensAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tCiaItens.Handle);
end;

procedure TDMCia.DataModuleCreate(Sender: TObject);
begin
  tConstrucao2.Open;
  tCia.Open;
  tCiaItens.Open;
end;

end.

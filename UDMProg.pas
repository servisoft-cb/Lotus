unit UDMProg;

interface

uses
  SysUtils, Classes, DB, DBTables, DBIProcs, rsDataSetError;

type
  TDMProg = class(TDataModule)
    tProgramacao: TTable;
    dsProgramacao: TDataSource;
    tProgramacaoDatas: TTable;
    dsProgramacaoDatas: TDataSource;
    tProgramacaoItens: TTable;
    dsProgramacaoItens: TDataSource;
    tProgramacaoItensNumLancamento: TIntegerField;
    tProgramacaoItensOrdem: TIntegerField;
    tProgramacaoItensPedido: TIntegerField;
    tProgramacaoItensItemPedido: TIntegerField;
    tProgramacaoItensLote: TIntegerField;
    tProgramacaoItensCodCliente: TIntegerField;
    tProgramacaoItensCodProduto: TIntegerField;
    tProgramacaoItensCodCorProduto: TIntegerField;
    tProgramacaoItensQtdPares: TFloatField;
    tProgramacaoItensData: TTable;
    dsProgramacaoItensData: TDataSource;
    tProgramacaoItensDataNumLancamento: TIntegerField;
    tProgramacaoItensDataCodSetor: TIntegerField;
    tProgramacaoItensDataDtInicio: TDateField;
    tProgramacaoItensDataQtd: TIntegerField;
    tProgramacaoNumLancamento: TIntegerField;
    tProgramacaoQtdPedidos: TIntegerField;
    tProgramacaoDtInicial: TDateField;
    tProgramacaoCodFabrica: TIntegerField;
    tProgramacaoDatasNumLancamento: TIntegerField;
    tProgramacaoDatasCodSetor: TIntegerField;
    tProgramacaoDatasData: TDateField;
    tProgramacaoItensDataDtFinal: TDateField;
    tProgramacaoDatasCapacidade: TIntegerField;
    tProgramacaoDatasQtdProducao: TIntegerField;
    tProgramacaoItenslkPedidoCliente: TStringField;
    tProgramacaoItenslkNomeCliente: TStringField;
    tProgramacaoItenslkNomeCor: TStringField;
    tProgramacaoItensDtEmbarque: TDateField;
    tProgramacaoItensDataOrdemItem: TIntegerField;
    tProgramacaoItensDataItem: TIntegerField;
    tProgramacaoItenslkReferencia: TStringField;
    tProgramacaoItensDatalkNomeSetor: TStringField;
    tProgramacaoItensDataControleLinha: TIntegerField;
    procedure tProgramacaoAfterPost(DataSet: TDataSet);
    procedure tProgramacaoDatasAfterPost(DataSet: TDataSet);
    procedure tProgramacaoItensAfterPost(DataSet: TDataSet);
    procedure tProgramacaoItensDataAfterPost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FDataSetError: TrsDataSetError;

  public
    { Public declarations }
  end;

var
  DMProg: TDMProg;

implementation

uses UDM1;

{$R *.dfm}

procedure TDMProg.tProgramacaoAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tProgramacao.Handle);
end;

procedure TDMProg.tProgramacaoDatasAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tProgramacaoDatas.Handle);
end;

procedure TDMProg.tProgramacaoItensAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tProgramacaoItens.Handle);
end;

procedure TDMProg.tProgramacaoItensDataAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tProgramacaoItensData.Handle);
end;

procedure TDMProg.DataModuleCreate(Sender: TObject);
begin
  FDataSetError := TrsDataSetError.Create;
  FDataSetError.CreateError(Self);
end;

end.

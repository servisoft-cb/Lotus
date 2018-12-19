
unit UDM2;

interface                  

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBTables, DBIProcs;

type
  TDM2 = class(TDataModule)
    tProduto: TTable;
    tProdutoCodigo: TIntegerField;
    tProdutoCodGrupo: TIntegerField;
    tProdutoCodSubGrupo: TIntegerField;
    tProdutoNome: TStringField;
    tProdutoUnidade: TStringField;
    tProdutoCodClasFiscal: TStringField;
    tProdutoCodSitTrib: TIntegerField;
    tProdutoLancaGrade: TBooleanField;
    tProdutoCodGrade: TIntegerField;
    tProdutoQParTalao: TFloatField;
    tProdutoPesoLiquido: TFloatField;
    tProdutoPesoBruto: TFloatField;
    tProdutoInativo: TBooleanField;
    tProdutoConsumo: TStringField;
    tProdutoAliqIcms: TFloatField;
    tProdutoAliqIPI: TFloatField;
    tProdutoNomeExp: TStringField;
    tProdutoCodModelista: TIntegerField;
    tProdutoComissaoMod: TFloatField;
    tProdutoDescMaterial: TStringField;
    tProdutoVlrAtelier: TFloatField;
    tProdutoConstrucao: TStringField;
    tProdutoNomeModelo: TStringField;
    tProdutoFotoJpeg: TBlobField;
    tProdutoPalmInterna: TStringField;
    tProdutoObs: TMemoField;
    dsProduto: TDataSource;
    tProdutoCor: TTable;
    tProdutoCorCodProduto: TIntegerField;
    tProdutoCorCodCor: TIntegerField;
    tProdutoMat: TTable;
    dsProdutoCor: TDataSource;
    tProdutoMatCodProduto: TIntegerField;
    tProdutoMatCodCorProd: TIntegerField;
    tProdutoMatItem: TIntegerField;
    tProdutoMatCodMaterial: TIntegerField;
    tProdutoMatCodGrade: TIntegerField;
    tProdutoMatCodCor: TIntegerField;
    tProdutoMatQtd: TFloatField;
    tProdutoMatVlrUnitario: TFloatField;
    tProdutoMatVlrTotal: TFloatField;
    tProdutoMatCodPosicao: TIntegerField;
    tProdutoMatImpTalao: TStringField;
    dsProdutoMat: TDataSource;
    tProdutoMatTam: TTable;
    tProdutoMatTamCodProduto: TIntegerField;
    tProdutoMatTamCodCorProd: TIntegerField;
    tProdutoMatTamItemMat: TIntegerField;
    tProdutoMatTamItem: TIntegerField;
    tProdutoMatTamCodGrade: TIntegerField;
    tProdutoMatTamPosicao: TIntegerField;
    tProdutoMatTamQtd: TFloatField;
    tProdutoMatTamVlrUnitario: TFloatField;
    tProdutoMatTamVlrTotal: TFloatField;
    tProdutoSetor: TTable;
    tProdutoSetorCodProduto: TIntegerField;
    tProdutoSetorItem: TIntegerField;
    tProdutoSetorCodSetor: TIntegerField;
    tProdutoSetorCodAtelier: TIntegerField;
    tTalaoMI2: TTable;
    tTalaoMI2Lote: TIntegerField;
    tTalaoMI2Item: TIntegerField;
    tTalaoMI2CodProduto: TIntegerField;
    tTalaoMI2CodCabedal1: TIntegerField;
    tTalaoMI2CodCabedal2: TIntegerField;
    tTalaoMI2CodCor: TIntegerField;
    tTalaoMI2CodCorForro: TIntegerField;
    tTalaoMI2CodCorPalmilha: TIntegerField;
    tTalaoMI2CodCorSolado: TIntegerField;
    tTalaoMI2QtdPar: TIntegerField;
    tTalaoMI2CodForro: TIntegerField;
    tTalaoMI2CodEtiqueta: TIntegerField;
    tTalaoMI2CodSolado: TIntegerField;
    tTalaoMI2CodTaloneira: TIntegerField;
    tTalaoMI2CodCorTaloneira: TIntegerField;
    tTalaoMI2CodPalmilha: TIntegerField;
    tTalaoMI2CodForma: TIntegerField;
    tTalaoMIIns: TTable;
    tTalaoMIInsLote: TIntegerField;
    tTalaoMIInsItem: TIntegerField;
    tTalaoMIInsItemPedido: TIntegerField;
    tTalaoMIInsNumPedido: TIntegerField;
    tEstoqueMatMov2: TTable;
    tEstoqueMatMov2NumMov: TIntegerField;
    tTalaoMovMiIns: TTable;
    tTalaoMovMiInsLote: TIntegerField;
    tTalaoMovMiInsTalao: TIntegerField;
    tTalaoMovMiInsSetor: TIntegerField;
    tTalaoMovMiInsDataEnt: TDateField;
    tTalaoMovMiInsHoraEnt: TTimeField;
    tTalaoMovMiInsDataSaida: TDateField;
    tTalaoMovMiInsHoraSaida: TTimeField;
    tTalaoMovMiInsCodAtelier: TIntegerField;
    dsTalaoMiIns: TDataSource;
    tProdutoCodConstrucao: TIntegerField;
    tProdutoEndEtiq: TStringField;
    tProdutoMercado: TStringField;
    tProdutoCodForma: TIntegerField;
    tProdutoTempoCalculo: TFloatField;
    tProdutoTempoReal: TFloatField;
    qProximaNota: TQuery;
    qProximaNotaNumNota: TIntegerField;
    qGeral: TQuery;
    tProdutoCodConstrucaoGrupo: TIntegerField;
    tProdutoDtCadastro: TDateField;
    qTipoMaterial: TQuery;
    qTipoMaterialCodigo: TIntegerField;
    qTipoMaterialNome: TStringField;
    dsqTipoMaterial: TDataSource;
    tFilial2: TTable;
    tFilial2Codigo: TIntegerField;
    qPais: TQuery;
    dsqPais: TDataSource;
    qPaisID: TIntegerField;
    qPaisPais: TStringField;
    qPaisCodPais: TStringField;
    tProdutoReferencia2: TStringField;
    tProdutoReferencia22: TStringField;
    qMaterial: TQuery;
    dsqMaterial: TDataSource;
    qProdutosVendidos: TQuery;
    dsqProdutosVendidos: TDataSource;
    qProdutosVendidosDTEMISSAO: TDateField;
    qProdutosVendidosNUMNOTA: TIntegerField;
    qProdutosVendidosSERIE: TStringField;
    qProdutosVendidosQTD: TFloatField;
    qProdutosVendidosDESCRICAO: TStringField;
    qProdutosVendidosREFERENCIA: TStringField;
    qMaterialCODIGO: TIntegerField;
    qMaterialNOME: TStringField;
    qProdutosVendidosNOME: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM2: TDM2;

implementation

uses UDM1;

{$R *.DFM}

end.

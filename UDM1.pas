Unit UDM1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBTables, DBIProcs, RLFilters,
  RLDraftFilter, RLRichFilter, RLHTMLFilter, RLPDFFilter, RLXLSFilter, RLPreviewForm, rsDataSetError, DBFilter,
  MidasLib, LogTypes, LogProvider, SendMailOptions;

type
  TDM1 = class(TDataModule)
    Database1: TDatabase;
    tGrupo: TTable;
    dsGrupo: TDataSource;
    tGrupoCodigo: TIntegerField;
    tGrupoNome: TStringField;
    tGrupoSeparaCor: TBooleanField;
    tGrupoSeparaTam: TBooleanField;
    tUsuario: TTable;
    dsUsuario: TDataSource;
    tUsuarioAlt: TTable;
    dsUsuarioAlt: TDataSource;
    tUsuarioExc: TTable;
    dsUsuarioExc: TDataSource;
    tUsuarioIns: TTable;
    dsUsuarioIns: TDataSource;
    tSubGrupo: TTable;
    dsSubGrupo: TDataSource;
    tSubGrupoCodigo: TIntegerField;
    tSubGrupoNome: TStringField;
    tFornecedores: TTable;
    dsFornecedores: TDataSource;
    tFornecedoresCodForn: TIntegerField;
    tFornecedoresNomeForn: TStringField;
    tFornecedoresEndForn: TStringField;
    tFornecedoresBairroForn: TStringField;
    tFornecedoresCidadeForn: TStringField;
    tFornecedoresCEPForn: TStringField;
    tFornecedoresEstadoForn: TStringField;
    tFornecedoresTel1Forn: TStringField;
    tFornecedoresTel2Forn: TStringField;
    tFornecedoresFaxForn: TStringField;
    tFornecedoresCGC: TStringField;
    tFornecedoresInsc: TStringField;
    tFornecedoresContatoForn: TStringField;
    tFornecedoresDataCadastroForn: TDateField;
    tFornecedoresObsForn: TMemoField;
    tFornecedoresRamal: TStringField;
    tFornecedoresEmail: TStringField;
    tFornecedoresHomePage: TStringField;
    tMaterial: TTable;
    dsMaterial: TDataSource;
    tMaterialCodigo: TIntegerField;
    tMaterialNome: TStringField;
    tMaterialGrupo: TIntegerField;
    tMaterialSubGrupo: TIntegerField;
    tMaterialICMS: TFloatField;
    tMaterialIPI: TFloatField;
    tMaterialPrCusto: TFloatField;
    tMaterialFornecedor: TIntegerField;
    tMaterialEstMinimo: TFloatField;
    tMaterialInativo: TBooleanField;
    tGrade: TTable;
    dsGrade: TDataSource;
    tGradeCodigo: TIntegerField;
    tGradeNome: TStringField;
    tGradeItem: TTable;
    dsGradeItem: TDataSource;
    tGradeItemCodGrade: TIntegerField;
    tGradeItemPosicao: TIntegerField;
    tGradeItemTamanho: TStringField;
    tCor: TTable;
    dsCor: TDataSource;
    tCorCodigo: TIntegerField;
    tMaterialCor: TTable;
    dsMaterialCor: TDataSource;
    tMaterialCorCodMaterial: TIntegerField;
    tMaterialCorItem: TIntegerField;
    tMaterialCorCodCor: TIntegerField;
    tMaterialLancaCor: TBooleanField;
    tCondPgto: TTable;
    dsCondPgto: TDataSource;
    tCondPgtoCodigo: TIntegerField;
    tCondPgtoNome: TStringField;
    tCondPgtoItem: TTable;
    dsCondPgtoItem: TDataSource;
    tCondPgtoItemCodigo: TIntegerField;
    tCondPgtoItemItem: TIntegerField;
    tCondPgtoItemQtdDias: TSmallintField;
    tTransp: TTable;
    dsTransp: TDataSource;
    tTranspCodigo: TIntegerField;
    tTranspNome: TStringField;
    tTranspEndereco: TStringField;
    tTranspBairro: TStringField;
    tTranspCidade: TStringField;
    tTranspCep: TStringField;
    tTranspUF: TStringField;
    tTranspFone: TStringField;
    tTranspFax: TStringField;
    tTranspCNPJ: TStringField;
    tTranspInscricao: TStringField;
    tTranspContato: TStringField;
    tTranspObs: TMemoField;
    tOrdemCompra: TTable;
    dsOrdemCompra: TDataSource;
    tOrdemCompraCodFornecedor: TIntegerField;
    tOrdemCompraCodCondPgto: TIntegerField;
    tOrdemCompraCodTransp: TIntegerField;
    tOrdemCompraDtEmissao: TDateField;
    tOrdemCompraObs: TMemoField;
    tOrdemCompraVlrTotal: TFloatField;
    tOrdemCompraItem: TTable;
    dsOrdemCompraItem: TDataSource;
    tOrdemCompraCodigo: TIntegerField;
    tOrdemCompraItemCodigo: TIntegerField;
    tOrdemCompraItemItem: TIntegerField;
    tOrdemCompraItemCodMaterial: TIntegerField;
    tOrdemCompraItemQtd: TFloatField;
    tOrdemCompraItemVlrUnitario: TFloatField;
    tOrdemCompraItemAliqIPI: TFloatField;
    tOrdemCompraItemVlrIPI: TFloatField;
    tOrdemCompraItemDtEntrega: TDateField;
    tOrdemCompraItemVlrTotal: TFloatField;
    tMaterialPrecoCor: TBooleanField;
    tMaterialLancaGrade: TBooleanField;
    tMaterialPrecoGrade: TBooleanField;
    tMaterialCorPrCusto: TFloatField;
    tMaterialCodGrade: TIntegerField;
    tOrdemCompraItemCodCor: TIntegerField;
    tOrdemCompraItemGrade: TTable;
    dsOrdemCompraItemGrade: TDataSource;
    tOrdemCompraItemGradeCodigo: TIntegerField;
    tOrdemCompraItemGradeItem: TIntegerField;
    tOrdemCompraItemGradeCodGrade: TIntegerField;
    tOrdemCompraItemGradePosicao: TIntegerField;
    tOrdemCompraItemGradeQtd: TFloatField;
    tOrdemCompraItemGradeVlrUnitario: TFloatField;
    tOrdemCompraItemGradeVlrTotal: TFloatField;
    tOrdemCompraItemGradelkTamanho: TStringField;
    tOrdemCompraItemlkNomeMaterial: TStringField;
    tFornecedoresCodCondPgto: TIntegerField;
    tCondPgtoPrazoVista: TStringField;
    tEmpresa: TTable;
    dsEmpresa: TDataSource;
    tEmpresaEmpresa: TStringField;
    tEmpresaEndereco: TStringField;
    tEmpresaBairro: TStringField;
    tEmpresaCep: TStringField;
    tEmpresaCidade: TStringField;
    tEmpresaEstado: TStringField;
    tEmpresaTel: TStringField;
    tEmpresaTel2: TStringField;
    tEmpresaFax: TStringField;
    tEmpresaCgc: TStringField;
    tEmpresaInscr: TStringField;
    tEmpresaCodigo: TSmallintField;
    tEmpresaAutorizacao: TStringField;
    tEmpresaData: TDateField;
    tOrdemCompraItemlkLancaGrade: TBooleanField;
    tOrdemCompraItemlkPrecoGrade: TBooleanField;
    tClasFiscal: TTable;
    dsClasFiscal: TDataSource;
    tSitTributaria: TTable;
    dsSitTributaria: TDataSource;
    tSitTributariaCodigo: TIntegerField;
    tSitTributariaSitTributaria: TFloatField;
    tSitTributariaHistorico: TMemoField;
    tProduto: TTable;
    dsProduto: TDataSource;
    tProdutoCodigo: TIntegerField;
    tProdutoCodGrupo: TIntegerField;
    tProdutoCodSubGrupo: TIntegerField;
    tProdutoUnidade: TStringField;
    tProdutoCodSitTrib: TIntegerField;
    tProdutoQParTalao: TFloatField;
    tProdutoPesoLiquido: TFloatField;
    tProdutoPesoBruto: TFloatField;
    tProdutoCodClasFiscal: TStringField;
    tProdutoCodGrade: TIntegerField;
    tProdutoCor: TTable;
    dsProdutoCor: TDataSource;
    tProdutoCorCodProduto: TIntegerField;
    tProdutoCorCodCor: TIntegerField;
    tProdutoLancaGrade: TBooleanField;
    tProdutoInativo: TBooleanField;
    tProdutoMat: TTable;
    dsProdutoMat: TDataSource;
    tProdutoMatCodProduto: TIntegerField;
    tProdutoMatItem: TIntegerField;
    tProdutoMatCodMaterial: TIntegerField;
    tProdutoMatCodGrade: TIntegerField;
    tProdutoMatCodCor: TIntegerField;
    tProdutoMatQtd: TFloatField;
    tProdutoMatVlrUnitario: TFloatField;
    tProdutoMatVlrTotal: TFloatField;
    tMaterialGradeNum: TTable;
    dsMaterialGradeNum: TDataSource;
    tMaterialGradeNumCodMaterial: TIntegerField;
    tMaterialGradeNumCodGrade: TIntegerField;
    tMaterialGradeNumPosicao: TIntegerField;
    tMaterialGradeNumTamanho: TStringField;
    tMaterialGradeNumlkNomeGrade: TStringField;
    tProdutoMatTam: TTable;
    dsProdutoMatTam: TDataSource;
    tProdutoMatTamCodProduto: TIntegerField;
    tProdutoMatTamItemMat: TIntegerField;
    tProdutoMatTamItem: TIntegerField;
    tProdutoMatTamCodGrade: TIntegerField;
    tProdutoMatTamPosicao: TIntegerField;
    tProdutoMatTamQtd: TFloatField;
    tProdutoMatTamVlrUnitario: TFloatField;
    tProdutoMatTamVlrTotal: TFloatField;
    tProdutoMatlkNomeMaterial: TStringField;
    tMateriallkFornecedor: TStringField;
    tMaterial2: TTable;
    dsMaterial2: TDataSource;
    tMaterial2Codigo: TIntegerField;
    tMaterial2Nome: TStringField;
    tMaterial2Grupo: TIntegerField;
    tMaterial2SubGrupo: TIntegerField;
    tMaterial2ICMS: TFloatField;
    tMaterial2IPI: TFloatField;
    tMaterial2PrCusto: TFloatField;
    tMaterial2Fornecedor: TIntegerField;
    tMaterial2CodGrade: TIntegerField;
    tMaterial2EstMinimo: TFloatField;
    tMaterial2Inativo: TBooleanField;
    tMaterial2LancaCor: TBooleanField;
    tMaterial2PrecoCor: TBooleanField;
    tMaterial2LancaGrade: TBooleanField;
    tMaterial2PrecoGrade: TBooleanField;
    tVendedor: TTable;
    dsVendedor: TDataSource;
    dsVendedor2: TDataSource;
    tVendedor2Codigo: TIntegerField;
    tVendedor2Nome: TStringField;
    tVendedor2PercComissao: TFloatField;
    tVendedorCodigo: TIntegerField;
    tVendedorNome: TStringField;
    tVendedorPercComissao: TFloatField;
    tNatOperacao: TTable;
    dsNatOperacao: TDataSource;
    tNatOperacaoCodigo: TIntegerField;
    tNatOperacaoCodNatOper: TStringField;
    tNatOperacaoDescricao: TStringField;
    tNatOperacaoEntradaSaida: TBooleanField;
    tNatOperacao2: TTable;
    dsNatOperacao2: TDataSource;
    tNatOperacao2Codigo: TIntegerField;
    tNatOperacao2CodNatOper: TStringField;
    tNatOperacao2Descricao: TStringField;
    tNatOperacao2EntradaSaida: TBooleanField;
    tPedido: TTable;
    dsPedido: TDataSource;
    tPedidoDesconto: TTable;
    dsPedidoDesconto: TDataSource;
    tPedidoGrade: TTable;
    dsPedidoGrade: TDataSource;
    tPedidoItem: TTable;
    dsPedidoItem: TDataSource;
    tPedidoMaterial: TTable;
    dsPedidoMaterial: TDataSource;
    tPedidoPedido: TIntegerField;
    tPedidoDtEmissao: TDateField;
    tPedidoCodCliente: TIntegerField;
    tPedidoCodTransp: TIntegerField;
    tPedidoCodRedespacho: TIntegerField;
    tPedidoCodCondPgto: TIntegerField;
    tPedidoTipoFrete: TStringField;
    tPedidoCodVendedor: TIntegerField;
    tPedidoPercComissao: TFloatField;
    tPedidoDtIniEmbarque: TDateField;
    tPedidoDtFinEmbarque: TDateField;
    tPedidoCodNatOper: TIntegerField;
    tPedidoSituacao: TIntegerField;
    tPedidoNumLote: TIntegerField;
    tPedidoDescontoPedido: TIntegerField;
    tPedidoDescontoItem: TIntegerField;
    tPedidoDescontoPercDesconto: TFloatField;
    tPedidoDescontoVlrDesconto: TFloatField;
    tPedidoGradePedido: TIntegerField;
    tPedidoGradeItemPed: TIntegerField;
    tPedidoGradeCodGrade: TIntegerField;
    tPedidoGradePosicao: TIntegerField;
    tPedidoGradeQtd: TFloatField;
    tPedidoItemPedido: TIntegerField;
    tPedidoItemItem: TIntegerField;
    tPedidoItemCodProduto: TIntegerField;
    tPedidoItemCodCor: TIntegerField;
    tPedidoItemCodGrade: TIntegerField;
    tPedidoItemQtdPares: TFloatField;
    tPedidoItemPreco: TFloatField;
    tPedidoMaterialPedido: TIntegerField;
    tPedidoMaterialItemPed: TIntegerField;
    tPedidoMaterialOrdem: TIntegerField;
    tPedidoMaterialCodCor: TIntegerField;
    tPedidoMaterialCodMaterial: TIntegerField;
    tPedidoMaterialConsumoPr: TFloatField;
    tPedidoParc: TTable;
    dsPedidoParc: TDataSource;
    tCliente: TTable;
    dsCliente: TDataSource;
    tPedidoQtdPares: TFloatField;
    tPedidoVlrTotal: TFloatField;
    tPedidoItemVlrTotal: TFloatField;
    tClienteCodigo: TIntegerField;
    tClienteNome: TStringField;
    tClienteEndereco: TStringField;
    tClienteBairro: TStringField;
    tClienteCidade: TStringField;
    tClienteUf: TStringField;
    tClienteTelefone: TStringField;
    tClienteTelefone2: TStringField;
    tClienteFax: TStringField;
    tClientePessoa: TStringField;
    tClienteCgcCpf: TStringField;
    tClienteInscrEst: TStringField;
    tClienteContato: TStringField;
    tPedidoGradeVlrUnitario: TFloatField;
    tPedidoGradeVlrTotal: TFloatField;
    tPedidoParcPedido: TIntegerField;
    tPedidoParcItem: TIntegerField;
    tPedidoParcDtVencto: TDateField;
    tPedidoParcValor: TFloatField;
    tPedidoMateriallkNomeMaterial: TStringField;
    tPedidoVlrMercadoria: TFloatField;
    tPedidoVlrDesconto: TFloatField;
    tMaterialTipoMat: TStringField;
    tPedidoMateriallkTipoMat: TStringField;
    tLote: TTable;
    dsLote: TDataSource;
    tLoteLote: TIntegerField;
    tLoteQtdTaloes: TIntegerField;
    tLoteQtdPares: TFloatField;
    tLoteObs: TMemoField;
    tLotePedido: TTable;
    dsLotePedido: TDataSource;
    tLotePedidoLote: TIntegerField;
    tLotePedidoPedido: TIntegerField;
    tTalao: TTable;
    dsTalao: TDataSource;
    tTalaoLote: TIntegerField;
    tTalaoCodProduto: TIntegerField;
    tTalaoCodCabedal1: TIntegerField;
    tTalaoCodCabedal2: TIntegerField;
    tTalaoCodCor: TIntegerField;
    tTalaoCodCorForro: TIntegerField;
    tTalaoCodCorPalmilha: TIntegerField;
    tTalaoCodCorSolado: TIntegerField;
    tTalaoQtdPar: TIntegerField;
    tTalaoGrade: TTable;
    dsTalaoGrade: TDataSource;
    tTalaoGradeLote: TIntegerField;
    tTalaoGradeTalao: TIntegerField;
    tTalaoGradeCodGrade: TIntegerField;
    tTalaoGradePosicao: TIntegerField;
    tTalaoGradeQtdPar: TIntegerField;
    tPedidolkNomeVendedor: TStringField;
    tPedidolkNomeCliente: TStringField;
    tTalaolkNomeCorForro: TStringField;
    tTalaolkNomeCorPalmilha: TStringField;
    tTalaolkNomeCorSolado: TStringField;
    tTalaolkNomeCabedal1: TStringField;
    tTalaolkNomeCabedal2: TStringField;
    tClienteObs: TMemoField;
    tClienteAprovCredito: TStringField;
    tClienteTipoAprov: TStringField;
    tPedidoItemCodCabedal1: TIntegerField;
    tPedidoItemCodCabedal2: TIntegerField;
    tPedidoItemCodCorForro: TIntegerField;
    tPedidoItemCodCorSolado: TIntegerField;
    tPedidoItemCodCorPalmilha: TIntegerField;
    tSetor: TTable;
    dsSetor: TDataSource;
    tSetorCodigo: TIntegerField;
    tSetorNome: TStringField;
    tLotePedidolkNomeCliente: TStringField;
    tPedidoMateriallkUnidade: TStringField;
    tPedidoMateriallkCodGrade: TIntegerField;
    tSetorImpTalao: TBooleanField;
    tCorNome: TStringField;
    tMaterialCorlkNomeCor: TStringField;
    tOrdemCompraItemlkNomeCor: TStringField;
    tProdutoCorlkNomeCor: TStringField;
    tProdutoMatlkNomeCor: TStringField;
    tPedidoItemlkCor: TStringField;
    tPedidoMateriallkNomeCor: TStringField;
    tTalaolkNomeCor: TStringField;
    tPedidolkEndereco: TStringField;
    tPedidolkBairro: TStringField;
    tPedidolkTransp: TStringField;
    tPedidolkTelefone: TStringField;
    tPedidolkFax: TStringField;
    tPedidolkUf: TStringField;
    tPedidolkCgcCpf: TStringField;
    tPedidolkInscrEst: TStringField;
    tPedidolkCondPgto: TStringField;
    tPedidoItemlkNomeCorSolado: TStringField;
    tPedidoMateriallkLancaGrade: TBooleanField;
    tPedidoGerarLote: TStringField;
    tPedidoCancelado: TBooleanField;
    tPedidoSuspenso: TBooleanField;
    tPedidoImpresso: TBooleanField;
    tPedido2: TTable;
    dsPedido2: TDataSource;
    tPedido2Pedido: TIntegerField;
    tPedido2DtEmissao: TDateField;
    tPedido2CodCliente: TIntegerField;
    tPedido2CodTransp: TIntegerField;
    tPedido2CodRedespacho: TIntegerField;
    tPedido2CodCondPgto: TIntegerField;
    tPedido2TipoFrete: TStringField;
    tPedido2CodVendedor: TIntegerField;
    tPedido2PercComissao: TFloatField;
    tPedido2DtIniEmbarque: TDateField;
    tPedido2DtFinEmbarque: TDateField;
    tPedido2CodNatOper: TIntegerField;
    tPedido2Situacao: TIntegerField;
    tPedido2NumLote: TIntegerField;
    tPedido2QtdPares: TFloatField;
    tPedido2VlrTotal: TFloatField;
    tPedido2VlrMercadoria: TFloatField;
    tPedido2VlrDesconto: TFloatField;
    tPedido2GerarLote: TStringField;
    tPedido2Cancelado: TBooleanField;
    tPedido2Suspenso: TBooleanField;
    tPedido2Impresso: TBooleanField;
    tPedidoItemCancelado: TBooleanField;
    tTipoCobranca: TTable;
    tHistorico: TTable;
    dsTipoCobranca: TDataSource;
    dsHistorico: TDataSource;
    tTipoCobrancaCodigo: TIntegerField;
    tTipoCobrancaNome: TStringField;
    tHistoricoCodigo: TIntegerField;
    tPedidoPesoBruto: TFloatField;
    tPedidoPesoLiquido: TFloatField;
    tPedidoItemlkPesoBruto: TFloatField;
    tPedidoItemlkPesoLiquido: TFloatField;
    tProdutoConsumo: TStringField;
    tNotaFiscal: TTable;
    dsNotaFiscal: TDataSource;
    tNotaFiscalNumNota: TIntegerField;
    tNotaFiscalDtEmissao: TDateField;
    tNotaFiscalCodNatOper: TSmallintField;
    tNotaFiscalCodNatOper2: TSmallintField;
    tNotaFiscalCodNatOper3: TSmallintField;
    tNotaFiscalCodCli: TIntegerField;
    tNotaFiscalCondPgto: TStringField;
    tNotaFiscalCodVendedor: TIntegerField;
    tNotaFiscalCodVenda: TSmallintField;
    tNotaFiscalBaseIcms: TFloatField;
    tNotaFiscalVlrIcms: TFloatField;
    tNotaFiscalVlrIpi: TFloatField;
    tNotaFiscalVlrTotalNota: TFloatField;
    tNotaFiscalVlrTotalItens: TFloatField;
    tNotaFiscalPercDesc: TFloatField;
    tNotaFiscalVlrTotalDesc: TFloatField;
    tNotaFiscalVlrFrete: TFloatField;
    tNotaFiscalVlrSeguro: TFloatField;
    tNotaFiscalOutrasDesp: TFloatField;
    tNotaFiscalQtd: TIntegerField;
    tNotaFiscalEspecie: TStringField;
    tNotaFiscalMarca: TStringField;
    tNotaFiscalNumero: TStringField;
    tNotaFiscalPesoBruto: TFloatField;
    tNotaFiscalPesoLiquido: TFloatField;
    tNotaFiscalPlaca: TStringField;
    tNotaFiscalUFPlaca: TStringField;
    tNotaFiscalEmitDest: TStringField;
    tNotaFiscalCodTransp: TIntegerField;
    tNotaFiscalObs: TMemoField;
    tNotaFiscalSaidaEntrada: TStringField;
    tNotaFiscalDuplImp: TBooleanField;
    tNotaFiscalCancelada: TBooleanField;
    tNotaFiscalFilial: TIntegerField;
    tNotaFiscalDtSaidaEnt: TDateField;
    tNotaFiscalHoraSaida: TTimeField;
    tNotaFiscalTipoCobr: TStringField;
    tNotaFiscalBcoCobr: TIntegerField;
    tNotaFiscalImpressa: TBooleanField;
    tNotaFiscalLocalEntrega: TBooleanField;
    tNotaFiscalInss: TBooleanField;
    tNotaFiscalIrf: TBooleanField;
    tNotaFiscalVlrInss: TFloatField;
    tNotaFiscalVlrIrf: TFloatField;
    tNotaFiscalCustoPerc: TFloatField;
    tNotaFiscalCustoFinanc: TFloatField;
    tNotaFiscalEntrada: TFloatField;
    tNotaFiscalPercComissao: TFloatField;
    tNotaFiscalDtEntr: TDateField;
    tNotaFiscalIcmsIpi: TBooleanField;
    tNotaFiscalPlanoContas: TIntegerField;
    tCReceberParc: TTable;
    dsCReceberParc: TDataSource;
    tCReceberParcNumCReceber: TIntegerField;
    tCReceberParcParcCReceber: TIntegerField;
    tCReceberParcVlrParcCReceber: TFloatField;
    tCReceberParcDtVencCReceber: TDateField;
    tCReceberParcQuitParcCReceber: TBooleanField;
    tCReceberParcJurosParcCReceber: TFloatField;
    tCReceberParcDtPagParcCReceber: TDateField;
    tCReceberParcCodCli: TIntegerField;
    tCReceberParcNumNota: TIntegerField;
    tCReceberParcDesconto: TFloatField;
    tCReceberParcPgtoParcial: TFloatField;
    tCReceberParcRestParcela: TFloatField;
    tCReceberParcContaDupl: TSmallintField;
    tCReceberParcSelecionado: TBooleanField;
    tCReceberParcCodVendedor: TIntegerField;
    tCReceberParcBaixada: TBooleanField;
    tCReceberParcPercComissao: TFloatField;
    tCReceberParcVlrComissao: TFloatField;
    tCReceberParcPlanoContas: TIntegerField;
    tIndexador: TTable;
    dsIndexador: TDataSource;
    tIndexadorData: TDateField;
    tIndexadorTaxa: TFloatField;
    tUF: TTable;
    dsUF: TDataSource;
    tUFSigla: TStringField;
    tUFPercentual: TFloatField;
    tNotaFiscalItens: TTable;
    dsNotaFiscalItens: TDataSource;
    tNotaFiscalItensNumNota: TIntegerField;
    tNotaFiscalItensItem: TSmallintField;
    tNotaFiscalItensCodProduto: TIntegerField;
    tNotaFiscalItensQtd: TFloatField;
    tNotaFiscalItensIcms: TFloatField;
    tNotaFiscalItensIpi: TFloatField;
    tNotaFiscalItensSitTrib: TSmallintField;
    tNotaFiscalItensVlrUnit: TFloatField;
    tNotaFiscalItensVlrTotal: TFloatField;
    tNotaFiscalItensDesconto: TFloatField;
    tNotaFiscalItensVlrDesconto: TFloatField;
    tNotaFiscalItensBaseIcms: TFloatField;
    tNotaFiscalItensVlrIcms: TFloatField;
    tNotaFiscalItensVlrIpi: TFloatField;
    tNotaFiscalItensNatOper: TSmallintField;
    tNotaFiscalItensIcmsIpi: TBooleanField;
    tNotaFiscalParc: TTable;
    dsNotaFiscalParc: TDataSource;
    tNotaFiscalParcParcela: TSmallintField;
    tNotaFiscalParcDtVenc: TDateField;
    tNotaFiscalParcVlrVenc: TFloatField;
    tParametros: TTable;
    dsParametros: TDataSource;
    tContas: TTable;
    dsContas: TDataSource;
    tContasCodConta: TIntegerField;
    tContasNomeConta: TStringField;
    tContasSaldoConta: TFloatField;
    tContasTipoConta: TStringField;
    tMovimentos: TTable;
    dsMovimentos: TDataSource;
    tMovimentosCodConta: TIntegerField;
    tMovimentosNumMovimento: TAutoIncField;
    tMovimentosNumCReceber: TIntegerField;
    tMovimentosNumCPagar: TIntegerField;
    tMovimentosNumPedVenda: TIntegerField;
    tMovimentosDtMovimento: TDateField;
    tMovimentosVlrMovDebito: TFloatField;
    tMovimentosVlrMovCredito: TFloatField;
    tMovimentosHistorico: TStringField;
    tMovimentosNumChequePag: TIntegerField;
    tMovimentosPlanoContas: TIntegerField;
    tMovimentosNumNota: TIntegerField;
    tMovimentosCodCli: TIntegerField;
    tMovimentosCodForn: TIntegerField;
    tMovimentosNumNotaEnt: TIntegerField;
    tMovimentosSaldoCliente: TFloatField;
    tMovimentosSaldoFornecedor: TFloatField;
    tMovimentosSaldoPlanoContas: TFloatField;
    tMovimentosSaldoConta: TFloatField;
    tCReceber: TTable;
    dsCReceber: TDataSource;
    tCReceberNumCReceber: TIntegerField;
    tCReceberNumNota: TIntegerField;
    tCReceberQuitado: TBooleanField;
    tCReceberCodCli: TIntegerField;
    tCReceberTipoDoc: TStringField;
    tCReceberDtGerado: TDateField;
    tCReceberHistorico: TStringField;
    tPlanoContas: TTable;
    dsPlanoContas: TDataSource;
    tPlanoContasCodigo: TIntegerField;
    tPlanoContasDescricao: TStringField;
    tCPagar: TTable;
    dsCPagar: TDataSource;
    tCPagarParc: TTable;
    dsCPagarParc: TDataSource;
    tCPagarNumCPagar: TIntegerField;
    tCPagarNumNotaEnt: TIntegerField;
    tCPagarCodForn: TIntegerField;
    tCPagarQuitado: TBooleanField;
    tCPagarTipoDoc: TStringField;
    tCPagarDtGerado: TDateField;
    tCPagarHistorico: TStringField;
    tFluxoFuturo: TTable;
    dsFluxoFuturo: TDataSource;
    tFluxoFuturoData: TDateField;
    tFluxoFuturoPagar: TFloatField;
    tFluxoFuturoReceber: TFloatField;
    tFluxoFuturoSaldo: TFloatField;
    tFluxoFuturoCheques: TFloatField;
    tCondPgtoCusto: TFloatField;
    tCondPgtoEntrada: TBooleanField;
    tPedido2PesoBruto: TFloatField;
    tPedido2PesoLiquido: TFloatField;
    tPedido2Selecionado: TBooleanField;
    tPedidoSelecionado: TBooleanField;
    tPedido2Copiado: TBooleanField;
    tPedidoCopiado: TBooleanField;
    tNotaFiscallkUf: TStringField;
    tNotaFiscallkNomeCli: TStringField;
    tNotaFiscallkDescNatOper: TStringField;
    tNotaFiscallkCgcCli: TStringField;
    tNotaFiscallkEndCli: TStringField;
    tNotaFiscallkBairroCli: TStringField;
    tNotaFiscallkTelCli: TStringField;
    tNotaFiscallkInscCli: TStringField;
    tNotaFiscallkNomeTransp: TStringField;
    tNotaFiscallkCgcTransp: TStringField;
    tNotaFiscallkEndTransp: TStringField;
    tNotaFiscallkInscTransp: TStringField;
    tCPagarlkNomeForn: TStringField;
    tCReceberlkNomeCli: TStringField;
    tClienteEndEntrega: TStringField;
    tClienteBairroEntrega: TStringField;
    tClienteCidEntrega: TStringField;
    tClienteUfEntrega: TStringField;
    tClienteCgcCpfEntrega: TStringField;
    tClienteInscEntrega: TStringField;
    tNotaFiscallkEndEntrega: TStringField;
    tNotaFiscallkBairroEntrega: TStringField;
    tNotaFiscallkUfEntrega: TStringField;
    tNEntradaParc: TTable;
    dsNEntradaParc: TDataSource;
    tNEntradaParcCodForn: TIntegerField;
    tNEntradaParcNumNEntr: TIntegerField;
    tNEntradaParcParcela: TSmallintField;
    tNEntradaParcDtVenc: TDateField;
    tNEntradaParcVlrVenc: TFloatField;
    tNEntradaParcBanco: TStringField;
    tNEntradaParcCheque: TStringField;
    tNEntrada: TTable;
    dsNEntrada: TDataSource;
    tNEntradaNumNEntr: TIntegerField;
    tNEntradaCodForn: TIntegerField;
    tNEntradaSerie: TStringField;
    tNEntradaNumOC: TIntegerField;
    tNEntradaCondPgto: TStringField;
    tNEntradaDtEmissaoNEntr: TDateField;
    tNEntradaDtEntrada: TDateField;
    tNEntradaVlrTotalNEntr: TFloatField;
    tNEntradaBaseIcms: TFloatField;
    tNEntradaVlrIcms: TFloatField;
    tNEntradaVlrIpi: TFloatField;
    tNEntradaCodNatOper: TSmallintField;
    tNEntradaIcmsIpi: TBooleanField;
    tNEntradaPlanoContas: TIntegerField;
    tNEntradaItensMobra: TTable;
    dsNEntradaItensMobra: TDataSource;
    tNEntradaItensMobraCodForn: TIntegerField;
    tNEntradaItensMobraNumNEntr: TIntegerField;
    tNEntradaItensMobraItem: TSmallintField;
    tNEntradaItensMobraCodigo: TSmallintField;
    tNEntradaItensMobraDescricao: TStringField;
    tNEntradaItensMobraQtd: TFloatField;
    tNEntradaItensMobraAliquota: TFloatField;
    tNEntradaItensMobraVlrUnit: TFloatField;
    tNEntradaItensMobraVlrTotal: TFloatField;
    tNEntradaItensMobraVlrIssqn: TFloatField;
    tNEntradaItensMobraInss: TFloatField;
    tNEntradaItensMobraIrf: TFloatField;
    tNEntradaItens: TTable;
    dsNEntradaItens: TDataSource;
    tNEntradaItensCodForn: TIntegerField;
    tNEntradaItensNumNEntr: TIntegerField;
    tNEntradaItensItem: TSmallintField;
    tNEntradaItensQtd: TFloatField;
    tNEntradaItensVlrUnit: TFloatField;
    tNEntradaItensVlrTotalItens: TFloatField;
    tNEntradaItensIcms: TFloatField;
    tNEntradaItensIpi: TFloatField;
    tNEntradaItensDesc: TFloatField;
    tNEntradaItensVlrDesc: TFloatField;
    tNEntradaItensVlrIpi: TFloatField;
    tNEntradaItensVlrIcms: TFloatField;
    tNEntradaItensBaseIcms: TFloatField;
    tNEntradaItensSitTrib: TSmallintField;
    tNEntradaItensIcmsIpi: TBooleanField;
    tNEntradalkNomeForn: TStringField;
    tNEntradalkUf: TStringField;
    tProdutoAliqIcms: TFloatField;
    tProdutoAliqIPI: TFloatField;
    tNotaFiscalItensCodCor: TIntegerField;
    tNotaFiscalItenslkNomeCor: TStringField;
    tNotaFiscalPrazoPgto: TIntegerField;
    tPedidoItemQtdParesFat: TFloatField;
    tPedidoItemQtdParesRest: TFloatField;
    tPedidoItemCopiado: TBooleanField;
    tPedidoItemSelecionado: TBooleanField;
    tMateriallkNomeGrupo: TStringField;
    tNotaFiscalItensNumPedido: TIntegerField;
    tPedidoItemQtdParesCanc: TFloatField;
    tNotaFiscallkPessoa: TStringField;
    tCReceberParcHist: TTable;
    dsCReceberParcHist: TDataSource;
    tCReceberParcHistNumCReceber: TIntegerField;
    tCReceberParcHistParcCReceber: TIntegerField;
    tCReceberParcHistItem: TIntegerField;
    tCReceberParcHistCodHistorico: TIntegerField;
    tCReceberParcHistDtHistorico: TDateField;
    tFornecedoreslkCondPgto: TStringField;
    tMateriallkCondPgto: TStringField;
    tMaterialGradeNumPeso: TFloatField;
    tMaterialTipoSolado: TStringField;
    tMaterialUnidade: TStringField;
    tMaterial2Unidade: TStringField;
    tMaterial2TipoMat: TStringField;
    tMaterial2TipoSolado: TStringField;
    tPedidolkRedespacho: TStringField;
    tClienteEndPgto: TStringField;
    tClienteBairroPgto: TStringField;
    tClienteCidPgto: TStringField;
    tClienteUfPgto: TStringField;
    tClienteFantasia: TStringField;
    tClienteDtCadastro: TDateField;
    tNotaFiscallkEndPgto: TStringField;
    tNotaFiscallkBairroPgto: TStringField;
    tNotaFiscallkUfPgto: TStringField;
    tNotaFiscalSituacao: TIntegerField;
    tProdutoMatCodCorProd: TIntegerField;
    tProdutoMatTamCodCorProd: TIntegerField;
    tImpressora: TTable;
    tImpressoraCodigo: TIntegerField;
    tImpressoraNome: TStringField;
    tImpressoraEndereco: TStringField;
    dsImpressora: TDataSource;
    tNatOperacaoIpi: TBooleanField;
    tNatOperacaoIcms: TBooleanField;
    tNatOperacao2Ipi: TBooleanField;
    tNatOperacao2Icms: TBooleanField;
    tOrdemCompralkFornecedor: TStringField;
    tOrdemCompralkFone: TStringField;
    tOrdemCompralkEnd: TStringField;
    tOrdemCompralkCep: TStringField;
    tOrdemCompralkBairro: TStringField;
    tOrdemCompralkCidade: TStringField;
    tOrdemCompralkEstado: TStringField;
    tVendedorEndereco: TStringField;
    tVendedorBairro: TStringField;
    tVendedorCidade: TStringField;
    tVendedorEstado: TStringField;
    tVendedorCep: TStringField;
    tVendedorFone: TStringField;
    tVendedorFax: TStringField;
    tVendedorPessoa: TStringField;
    tVendedorCgcCpf: TStringField;
    tVendedorInscEst: TStringField;
    tPedidoPedidoCliente: TIntegerField;
    tPedidoObs: TMemoField;
    tNotaFiscalItenslkPesoBruto: TFloatField;
    tNotaFiscalItenslkPesoLiquido: TFloatField;
    tPedidolkPrazoVista: TStringField;
    tNotaFiscalItensItemPedido: TIntegerField;
    tNotaFiscalDescDupl: TFloatField;
    tTalaoCodForro: TIntegerField;
    tTalaoCodEtiqueta: TIntegerField;
    tTalaolkNomeForro: TStringField;
    tTalaolkNomeEtiqueta: TStringField;
    tPedidoItemCodForro: TIntegerField;
    tPedidoItemCodEtiqueta: TIntegerField;
    tPedidoItemVlrDesconto: TFloatField;
    tPedidoItemCodSolado: TIntegerField;
    tTalaoCodSolado: TIntegerField;
    tTalaolkNomeSolado: TStringField;
    tVendedor2Endereco: TStringField;
    tVendedor2Bairro: TStringField;
    tVendedor2Cidade: TStringField;
    tVendedor2Estado: TStringField;
    tVendedor2Cep: TStringField;
    tVendedor2Fone: TStringField;
    tVendedor2Fax: TStringField;
    tVendedor2Pessoa: TStringField;
    tVendedor2CgcCpf: TStringField;
    tVendedor2InscEst: TStringField;
    tNotaFiscallkNomeVendedor: TStringField;
    tClienteCodVendedor: TIntegerField;
    tClientelkComissao: TFloatField;
    tCReceberParcTitPortador: TStringField;
    tCReceberParcCodTipoCobranca: TIntegerField;
    tCReceberParcDespesas: TFloatField;
    tCReceberParcAbatimentos: TFloatField;
    tHistoricoNome: TStringField;
    tCReceberParcHistHistorico: TStringField;
    tCReceberlkTipoAprovacao: TStringField;
    tCReceberlkDuplImp: TBooleanField;
    tContasCodBanco: TStringField;
    tCReceberParcCodConta: TIntegerField;
    tNatOperacaoLei: TMemoField;
    tCReceberParclkCodBanco: TStringField;
    tCReceberParcPgCartorio: TBooleanField;
    tNotaFiscalItensUnidade: TStringField;
    tClienteObsCtas: TMemoField;
    tCReceberParcDiasAtraso: TFloatField;
    tJuros: TTable;
    dsJuros: TDataSource;
    tJurosAno: TIntegerField;
    tJurosMes: TIntegerField;
    tJurosJuro: TFloatField;
    tCReceberParcLetraCambio: TBooleanField;
    tLojas: TTable;
    dsLojas: TDataSource;
    tLojasCodigo: TIntegerField;
    tLojasNome: TStringField;
    tRegioes: TTable;
    dsRegioes: TDataSource;
    tRegioesCodigo: TIntegerField;
    tRegioesNome: TStringField;
    tClienteLojas: TIntegerField;
    tVendedorRegioes: TIntegerField;
    tNEntradaParcNroDuplicata: TIntegerField;
    tCPagarNroDuplicata: TIntegerField;
    tNEntradaItensCodMaterial: TIntegerField;
    tNEntradaItenslkNomeMaterial: TStringField;
    tNEntradaNroDuplicata: TIntegerField;
    tNEntradaItensGrade: TTable;
    dsNEntradaItensGrade: TDataSource;
    tNEntradaItensGradeCodForn: TIntegerField;
    tNEntradaItensGradeNumNEntr: TIntegerField;
    tNEntradaItensGradeItem: TIntegerField;
    tNEntradaItensGradeCodGrade: TIntegerField;
    tNEntradaItensGradePosicao: TIntegerField;
    tNEntradaItensGradeQtd: TFloatField;
    tNEntradaItensGradeVlrUnitario: TFloatField;
    tNEntradaItensGradeVlrTotal: TFloatField;
    tNEntradaItensCodCor: TIntegerField;
    tNEntradaItenslkCor: TStringField;
    tNotaFiscallkLoja: TIntegerField;
    tVendedorTipoComissao: TStringField;
    tVendedorPercImpRenda: TFloatField;
    tParametrosIcmsIpi: TBooleanField;
    tParametrosNroCobranca: TIntegerField;
    tParametrosNroLetraCambio: TIntegerField;
    tParametrosVlrLimImpRenda: TFloatField;
    tNotaFiscallkTipoAprovCli: TStringField;
    tCReceberParcAgencia: TStringField;
    tNotaFiscalNumNotaOrigem: TIntegerField;
    tNotaFiscalNumNotaDevol: TIntegerField;
    tLoteImpCalcMaterial: TBooleanField;
    tPedidoItemSitTrib: TSmallintField;
    tNatOperacaoUsada: TStringField;
    tExtComissao: TTable;
    dsExtComissao: TDataSource;
    tExtComissaoNroLancamento: TIntegerField;
    tExtComissaoCodVendedor: TIntegerField;
    tExtComissaoDtReferencia: TDateField;
    tExtComissaoNroDoc: TIntegerField;
    tExtComissaoParcDoc: TIntegerField;
    tExtComissaoCodCliente: TIntegerField;
    tExtComissaoFuncao: TStringField;
    tExtComissaoVlrBase: TFloatField;
    tExtComissaoPercDescDupl: TFloatField;
    tExtComissaoPercComissao: TFloatField;
    tExtComissaoVlrComissao: TFloatField;
    tExtComissaoTipo: TStringField;
    tExtComissaoSuspensa: TBooleanField;
    tNotaFiscalNroLancExtComissao: TIntegerField;
    tNotaFiscallkTipoComissao: TStringField;
    tProdutoNomeExp: TStringField;
    tPedido2PedidoCliente: TIntegerField;
    tPedido2Obs: TMemoField;
    tVendedorSelecionado: TBooleanField;
    tVendedor2Regioes: TIntegerField;
    tVendedor2TipoComissao: TStringField;
    tVendedor2PercImpRenda: TFloatField;
    tVendedor2Selecionado: TBooleanField;
    tVendedor2: TTable;
    tClienteSelecionado: TBooleanField;
    tPedidoQtdParesFat: TFloatField;
    tPedidoQtdParesRest: TFloatField;
    tPedido2QtdParesCanc: TFloatField;
    tPedido2QtdParesFat: TFloatField;
    tPedido2QtdParesRest: TFloatField;
    tPedidoNota: TTable;
    dsPedidoNota: TDataSource;
    tPedidoNotaPedido: TIntegerField;
    tPedidoNotaItem: TIntegerField;
    tPedidoNotaItemNota: TIntegerField;
    tPedidoNotaDtNota: TDateField;
    tPedidoNotaQtdPares: TIntegerField;
    tPedidoNotaNumNota: TIntegerField;
    tPedidoNumNota: TFloatField;
    tPedidoDtNota: TDateField;
    tImpressoraVisualizar: TBooleanField;
    tImpressoraPrograma: TStringField;
    tCReceberlkDtEmissaoNota: TDateField;
    tNotaFiscalNumPedido: TIntegerField;
    tNotaFiscalTipoNota: TStringField;
    tVendedorContato: TStringField;
    tCReceberParcHistDtUltPgto: TDateField;
    tCReceberParcHistVlrUltPgto: TFloatField;
    tCReceberParcHistVlrUltJuros: TFloatField;
    tCReceberParcHistVlrUltDescontos: TFloatField;
    tCReceberParcHistVlrUltDespesas: TFloatField;
    tCReceberParcHistVlrUltAbatimentos: TFloatField;
    tCReceberParcHistPgto: TBooleanField;
    tCReceberParclkTipoCobranca: TStringField;
    tPedidoItemQtdFatMan: TFloatField;
    tPedidoItemQtdFatAut: TFloatField;
    tPedidoQtdFatAut: TFloatField;
    tPedidoQtdFatMan: TFloatField;
    tPedido2NumNota: TFloatField;
    tPedido2DtNota: TDateField;
    tPedido2QtdFatAut: TFloatField;
    tPedido2QtdFatMan: TFloatField;
    tCReceberParcNroLancExtComissao: TIntegerField;
    tCReceberParclkTipoComissao: TStringField;
    tNotaFiscalDescricaoDesc: TStringField;
    tPedidoNotaNroLancExtComissao: TIntegerField;
    tNotaFiscalItenslkPedidoCliente: TIntegerField;
    tNotaFiscalSuspensa: TBooleanField;
    tNotaFiscalExtComDif: TIntegerField;
    tPedidoPedCliDif: TStringField;
    tPedido2PedCliDif: TStringField;
    tCReceberParcJurosPagos: TFloatField;
    tNotaFiscallkCodNatOper: TIntegerField;
    tProdutoCodModelista: TIntegerField;
    tModelista: TTable;
    tModelistaCodigo: TIntegerField;
    tModelistaDescricao: TStringField;
    dsModelista: TDataSource;
    tProdutoComissaoMod: TFloatField;
    tModelistaComissao: TFloatField;
    tNotaFiscalItensComissaoMod: TFloatField;
    tExtComissaoMod: TTable;
    dsExtComissaoMod: TDataSource;
    tExtComissaoModlkModelista: TStringField;
    tNotaFiscalItensCodComissao: TIntegerField;
    tNotaFiscalItenslkCodModelista: TIntegerField;
    tPedidoItemlkCodModelista: TIntegerField;
    tPedidoNotaNroLancExtComissaoMod: TIntegerField;
    tPedidoItemlkUnidade: TStringField;
    tCReceberParclkVendedor: TStringField;
    tFornecedoresFantasia: TStringField;
    tProdutoDescMaterial: TStringField;
    tNEntradaOutrasDesp: TFloatField;
    tNEntradaTotalParcelas: TIntegerField;
    tNEntradaItensUnidade: TStringField;
    tCReceberParcHistJurosPagos: TFloatField;
    tPedidoImpRotulo: TBooleanField;
    tNEntradaCodNatOper2: TIntegerField;
    tNEntradaItensMobraCodNatOper: TIntegerField;
    tCPagarParcHist: TTable;
    tCPagarParcHistNumCPagar: TIntegerField;
    tCPagarParcHistParcCPagar: TIntegerField;
    tCPagarParcHistItem: TIntegerField;
    tCPagarParcHistCodHistorico: TIntegerField;
    tCPagarParcHistDtHistorico: TDateField;
    tCPagarParcHistHistorico: TStringField;
    tCPagarParcHistDtUltPgto: TDateField;
    tCPagarParcHistVlrUltPgto: TFloatField;
    tCPagarParcHistVlrUltJuros: TFloatField;
    tCPagarParcHistVlrUltDescontos: TFloatField;
    tCPagarParcHistVlrUltDespesas: TFloatField;
    tCPagarParcHistVlrUltAbatimentos: TFloatField;
    tCPagarParcHistPgto: TBooleanField;
    tCPagarParcHistJurosPagos: TFloatField;
    dsCPagarParcHist: TDataSource;
    tNEntradaObsPagamento: TMemoField;
    tCPagarParcNumCPagar: TIntegerField;
    tCPagarParcParcCPagar: TIntegerField;
    tCPagarParcDtVencCPagar: TDateField;
    tCPagarParcVlrParcCPagar: TFloatField;
    tCPagarParcQuitParcCPagar: TBooleanField;
    tCPagarParcDtPagParcCPagar: TDateField;
    tCPagarParcJurosParcCPagar: TFloatField;
    tCPagarParcCodForn: TIntegerField;
    tCPagarParcNumNotaEnt: TIntegerField;
    tCPagarParcDesconto: TFloatField;
    tCPagarParcPgtoParcial: TFloatField;
    tCPagarParcRestParcela: TFloatField;
    tCPagarParcBanco: TStringField;
    tCPagarParcPlanoContas: TIntegerField;
    tCPagarParcNroDuplicata: TIntegerField;
    tCPagarParcDespesas: TFloatField;
    tCPagarParcAbatimentos: TFloatField;
    tCPagarParcCodConta: TIntegerField;
    tCPagarParcDiasAtraso: TFloatField;
    tCPagarParcCodTipoCobranca: TIntegerField;
    tCPagarParcJurosPagos: TFloatField;
    tCPagarParclkCodBanco: TStringField;
    tCPagarParclkNomeBanco: TStringField;
    tCPagarParcclDiasAtraso: TIntegerField;
    tFornecedores2: TTable;
    tFornecedores2CodForn: TIntegerField;
    tFornecedores2NomeForn: TStringField;
    tFornecedores2Fantasia: TStringField;
    tCPagarParclkFornecedor: TStringField;
    tFornecedoresFornecedorOutros: TStringField;
    tMaterialMaterialOutros: TStringField;
    tHistoricoTipo: TStringField;
    tNEntradaParcCodBco: TIntegerField;
    tNEntradaParclkBco: TStringField;
    tCPagarParcHistNumMov: TIntegerField;
    tCPagarParcHistNumMovJuros: TIntegerField;
    tCReceberParcHistNumMov: TIntegerField;
    tCReceberParcHistNumMovJuros: TIntegerField;
    tPedidoItemCodTaloneira: TIntegerField;
    tPedidoItemCodCorTaloneira: TIntegerField;
    tTalaoCodTaloneira: TIntegerField;
    tTalaoCodCorTaloneira: TIntegerField;
    tTalaolkNomeTaloneira: TStringField;
    tTalaolkCorTaloneira: TStringField;
    tNotaFiscalDescTransf: TMemoField;
    tOrdemCompralkCondsPgto: TStringField;
    tCPagarParclkFantasia: TStringField;
    tOrdemCompraItemCodGrade: TIntegerField;
    tNEntradaItensCodGrade: TIntegerField;
    tOrdemCompraNota: TTable;
    dsOrdemCompraNota: TDataSource;
    tOrdemCompraNotaCodigo: TIntegerField;
    tOrdemCompraNotaItem: TIntegerField;
    tOrdemCompraNotaNumNota: TIntegerField;
    tOrdemCompraNotaCodFornecedor: TIntegerField;
    tOrdemCompraNotaItemNota: TIntegerField;
    tOrdemCompraNotaDtNota: TDateField;
    tOrdemCompraNotaQtdPares: TFloatField;
    tOrdemCompraNotaGrade: TTable;
    tOrdemCompraNotaGradeCodigo: TIntegerField;
    tOrdemCompraNotaGradeItem: TIntegerField;
    tOrdemCompraNotaGradeNumNota: TIntegerField;
    tOrdemCompraNotaGradeCodFornecedor: TIntegerField;
    tOrdemCompraNotaGradeItemNota: TIntegerField;
    tOrdemCompraNotaGradeCodGrade: TIntegerField;
    tOrdemCompraNotaGradePosicao: TIntegerField;
    tOrdemCompraNotaGradeQtdPares: TFloatField;
    dsOrdemCompraNotaGrade: TDataSource;
    tOrdemCompraItemQtdEntregue: TFloatField;
    tOrdemCompraItemQtdRestante: TFloatField;
    tOrdemCompraEntregue: TBooleanField;
    tOrdemCompraItemGradeQtdEntregue: TFloatField;
    tOrdemCompraItemGradeQtdRestante: TFloatField;
    tNEntradaItensNumOC: TIntegerField;
    tNEntradaItensItemOC: TIntegerField;
    tCReceberParclkFantasia: TStringField;
    tOrdemCompraItemUnidade: TStringField;
    tPedidoImpCalcLote: TBooleanField;
    tCReceberCancelado: TBooleanField;
    tCReceberParcCancelado: TBooleanField;
    tMaterialGradeNumTamMaterial: TStringField;
    tNotaFiscalExportacao: TBooleanField;
    tClienteCaixaPostal: TStringField;
    tVendedorCaixaPostal: TStringField;
    tClienteRg: TStringField;
    tClientelkLojas: TStringField;
    tPedidolkLojas: TStringField;
    tCReceberParcTitProtestado: TBooleanField;
    tPedidoObsRotulo: TMemoField;
    tTalaoItem: TIntegerField;
    tTalaoGradeItem: TIntegerField;
    tLotePedidolkPedidoCliente: TIntegerField;
    tLotePedidolkPedCliDif: TStringField;
    tPedidoItemlkReferencia: TStringField;
    tTalaolkReferencia: TStringField;
    tNotaFiscalItenslkReferencia: TStringField;
    tNotaFiscalItenslkReferencia2: TStringField;
    tPedidoQtdParesCanc: TFloatField;
    tNotaFiscalObsAux: TMemoField;
    tObsAux: TTable;
    tObsAuxCodigo: TIntegerField;
    tObsAuxDescricao: TMemoField;
    dsObsAux: TDataSource;
    tObsAux2: TTable;
    tObsAux2Codigo: TIntegerField;
    tObsAuxNome: TStringField;
    tUsuarioUsuario: TStringField;
    tUsuarioSenha: TStringField;
    tUsuarioAdministrador: TBooleanField;
    tUsuarioClientes: TBooleanField;
    tUsuarioFornecedores: TBooleanField;
    tUsuarioGrupos: TBooleanField;
    tUsuarioMaterial: TBooleanField;
    tUsuarioGrade: TBooleanField;
    tUsuarioCor: TBooleanField;
    tUsuarioCondPgto: TBooleanField;
    tUsuarioTransp: TBooleanField;
    tUsuarioOrdemCompra: TBooleanField;
    tUsuarioProduto: TBooleanField;
    tUsuarioSetor: TBooleanField;
    tUsuarioMaoDeObra: TBooleanField;
    tUsuarioVendedor: TBooleanField;
    tUsuarioClasFiscal: TBooleanField;
    tUsuarioParametro: TBooleanField;
    tUsuarioUf: TBooleanField;
    tUsuarioComissao: TBooleanField;
    tUsuarioPedido: TBooleanField;
    tUsuarioLote: TBooleanField;
    tUsuarioNotaEnt: TBooleanField;
    tUsuarioMovto: TBooleanField;
    tUsuarioNotaFiscal: TBooleanField;
    tUsuarioCPagar: TBooleanField;
    tUsuarioCReceber: TBooleanField;
    tUsuarioRelCli: TBooleanField;
    tUsuarioRelForn: TBooleanField;
    tUsuarioRelBoleto: TBooleanField;
    tUsuarioRelProdutos: TBooleanField;
    tUsuarioRelVendas: TBooleanField;
    tUsuarioSitTrib: TBooleanField;
    tUsuarioSubGrupo: TBooleanField;
    tUsuarioAcertoEst: TBooleanField;
    tUsuarioRelVendasNatOper: TBooleanField;
    tUsuarioLctoPagar: TBooleanField;
    tUsuarioNatOper: TBooleanField;
    tUsuarioHistoricos: TBooleanField;
    tUsuarioImpressoras: TBooleanField;
    tUsuarioObsAux: TBooleanField;
    tUsuarioLojas: TBooleanField;
    tUsuarioRegioesVendas: TBooleanField;
    tUsuarioRelVendedores: TBooleanField;
    tUsuarioRelEtiqCli: TBooleanField;
    tUsuarioRelEtiqVend: TBooleanField;
    tUsuarioRelEtiqForn: TBooleanField;
    tUsuarioRelEstMat: TBooleanField;
    tUsuarioBaixaPedidos: TBooleanField;
    tUsuarioConsultaLote: TBooleanField;
    tUsuarioRelCalcMatLote: TBooleanField;
    tUsuarioRelPlanejamento: TBooleanField;
    tUsuarioRelPedNFat: TBooleanField;
    tUsuarioRotulos: TBooleanField;
    tUsuarioRelVendasVendCli: TBooleanField;
    tUsuarioRelVendasVendRef: TBooleanField;
    tUsuarioConsFat: TBooleanField;
    tUsuarioGeraArq: TBooleanField;
    tUsuarioRelNEmitVend: TBooleanField;
    tUsuarioLancComisVend: TBooleanField;
    tUsuarioModelista: TBooleanField;
    tUsuarioComissaoMod: TBooleanField;
    tUsuarioLancComisMod: TBooleanField;
    tUsuarioRelExtrComisVend: TBooleanField;
    tUsuarioRelExtrComisMod: TBooleanField;
    tUsuarioRelExtrPedMod: TBooleanField;
    tUsuarioLancCReceber: TBooleanField;
    tUsuarioTiposCobr: TBooleanField;
    tUsuarioArqSCI: TBooleanField;
    tUsuarioRelCReceber: TBooleanField;
    tUsuarioRelCRecCli: TBooleanField;
    tUsuarioRelCPagar: TBooleanField;
    tUsuarioRelNEntrNatOper: TBooleanField;
    tUsuarioRelCPagForn: TBooleanField;
    tUsuarioRelPgtoJuros: TBooleanField;
    tUsuarioContas: TBooleanField;
    tUsuarioEntrMov: TBooleanField;
    tUsuarioJuros: TBooleanField;
    tUsuarioPlanoCtas: TBooleanField;
    tUsuarioRelCtas: TBooleanField;
    tUsuarioAltUsuario: TStringField;
    tUsuarioAltClientes: TBooleanField;
    tUsuarioAltFornecedores: TBooleanField;
    tUsuarioAltGrupos: TBooleanField;
    tUsuarioAltGrade: TBooleanField;
    tUsuarioAltMaterial: TBooleanField;
    tUsuarioAltCor: TBooleanField;
    tUsuarioAltCondPgto: TBooleanField;
    tUsuarioAltTransp: TBooleanField;
    tUsuarioAltOrdemCompra: TBooleanField;
    tUsuarioAltProduto: TBooleanField;
    tUsuarioAltSetor: TBooleanField;
    tUsuarioAltMaoDeObra: TBooleanField;
    tUsuarioAltVendedor: TBooleanField;
    tUsuarioAltClasFiscal: TBooleanField;
    tUsuarioAltUf: TBooleanField;
    tUsuarioAltPedido: TBooleanField;
    tUsuarioAltSitTrib: TBooleanField;
    tUsuarioAltSubGrupo: TBooleanField;
    tUsuarioAltNatOper: TBooleanField;
    tUsuarioAltHistoricos: TBooleanField;
    tUsuarioAltImpressoras: TBooleanField;
    tUsuarioAltObsAux: TBooleanField;
    tUsuarioAltLojas: TBooleanField;
    tUsuarioAltRegioesVendas: TBooleanField;
    tUsuarioAltTiposCobr: TBooleanField;
    tUsuarioAltContas: TBooleanField;
    tUsuarioAltJuros: TBooleanField;
    tUsuarioAltPlanoCtas: TBooleanField;
    tUsuarioExcUsuario: TStringField;
    tUsuarioExcClientes: TBooleanField;
    tUsuarioExcFornecedores: TBooleanField;
    tUsuarioExcGrupos: TBooleanField;
    tUsuarioExcGrade: TBooleanField;
    tUsuarioExcMaterial: TBooleanField;
    tUsuarioExcCor: TBooleanField;
    tUsuarioExcCondPgto: TBooleanField;
    tUsuarioExcTransp: TBooleanField;
    tUsuarioExcOrdemCompra: TBooleanField;
    tUsuarioExcProduto: TBooleanField;
    tUsuarioExcSetor: TBooleanField;
    tUsuarioExcMaoDeObra: TBooleanField;
    tUsuarioExcVendedor: TBooleanField;
    tUsuarioExcClasFiscal: TBooleanField;
    tUsuarioExcUf: TBooleanField;
    tUsuarioExcPedido: TBooleanField;
    tUsuarioExcSitTrib: TBooleanField;
    tUsuarioExcSubGrupo: TBooleanField;
    tUsuarioExcNatOper: TBooleanField;
    tUsuarioExcHistoricos: TBooleanField;
    tUsuarioExcImpressoras: TBooleanField;
    tUsuarioExcObsAux: TBooleanField;
    tUsuarioExcLojas: TBooleanField;
    tUsuarioExcRegioesVendas: TBooleanField;
    tUsuarioExcTiposCobr: TBooleanField;
    tUsuarioExcContas: TBooleanField;
    tUsuarioExcJuros: TBooleanField;
    tUsuarioExcPlanoCtas: TBooleanField;
    tUsuarioInsUsuario: TStringField;
    tUsuarioInsClientes: TBooleanField;
    tUsuarioInsFornecedores: TBooleanField;
    tUsuarioInsGrupos: TBooleanField;
    tUsuarioInsGrade: TBooleanField;
    tUsuarioInsMaterial: TBooleanField;
    tUsuarioInsCor: TBooleanField;
    tUsuarioInsCondPgto: TBooleanField;
    tUsuarioInsTransp: TBooleanField;
    tUsuarioInsOrdemCompra: TBooleanField;
    tUsuarioInsProduto: TBooleanField;
    tUsuarioInsSetor: TBooleanField;
    tUsuarioInsMaoDeObra: TBooleanField;
    tUsuarioInsVendedor: TBooleanField;
    tUsuarioInsClasFiscal: TBooleanField;
    tUsuarioInsUf: TBooleanField;
    tUsuarioInsPedido: TBooleanField;
    tUsuarioInsSitTrib: TBooleanField;
    tUsuarioInsSubGrupo: TBooleanField;
    tUsuarioInsNatOper: TBooleanField;
    tUsuarioInsHistoricos: TBooleanField;
    tUsuarioInsImpressoras: TBooleanField;
    tUsuarioInsObsAux: TBooleanField;
    tUsuarioInsLojas: TBooleanField;
    tUsuarioInsRegioesVendas: TBooleanField;
    tUsuarioInsTiposCobr: TBooleanField;
    tUsuarioInsContas: TBooleanField;
    tUsuarioInsJuros: TBooleanField;
    tUsuarioInsPlanoCtas: TBooleanField;
    tUsuarioIndexador: TBooleanField;
    tUsuarioAltIndexador: TBooleanField;
    tUsuarioExcIndexador: TBooleanField;
    tUsuarioInsIndexador: TBooleanField;
    tUsuarioCPagarAltera: TBooleanField;
    tUsuarioCPagarPag: TBooleanField;
    tUsuarioEstPgtoPagar: TBooleanField;
    tUsuarioCReceberAltera: TBooleanField;
    tUsuarioCReceberPag: TBooleanField;
    tUsuarioEstPgtoRec: TBooleanField;
    tUsuarioAltModelista: TBooleanField;
    tUsuarioExcModelista: TBooleanField;
    tUsuarioInsModelista: TBooleanField;
    tCPagarParcDtRecto: TDateField;
    tCReceberParcDtGerado: TDateField;
    tClienteCep: TStringField;
    tClienteCepEntrega: TStringField;
    tClienteCepPgto: TStringField;
    tPedidolkCep: TStringField;
    tNotaFiscallkCepCli: TStringField;
    tNotaFiscallkCepEntrega: TStringField;
    tNotaFiscallkCepPgto: TStringField;
    tAtelier: TTable;
    tAtelierCodigo: TIntegerField;
    tAtelierAtelier: TStringField;
    dsAtelier: TDataSource;
    tAtelier2: TTable;
    tAtelier2Codigo: TIntegerField;
    tUsuarioInsAtelier: TBooleanField;
    tUsuarioExcAtelier: TBooleanField;
    tUsuarioAltAtelier: TBooleanField;
    tUsuarioAtelier: TBooleanField;
    tProdutoVlrAtelier: TFloatField;
    tUsuarioContrAtelier: TBooleanField;
    tSetorAtelier: TBooleanField;
    tTalaoMov: TTable;
    tTalaoMovLote: TIntegerField;
    tTalaoMovTalao: TIntegerField;
    tTalaoMovSetor: TIntegerField;
    tTalaoMovDataEnt: TDateField;
    tTalaoMovHoraEnt: TTimeField;
    tTalaoMovDataSaida: TDateField;
    tTalaoMovHoraSaida: TTimeField;
    tTalaoMovCodAtelier: TIntegerField;
    dsTalaoMov: TDataSource;
    tTalaoMovlkAtelier: TStringField;
    tTalaoMovlkSetor: TStringField;
    tTalaoMovlkTipoAtelier: TBooleanField;
    tUsuarioMovAtelier: TBooleanField;
    tUsuarioMovTalao: TBooleanField;
    tUsuarioAltMovAtelier: TBooleanField;
    tUsuarioExcMovAtelier: TBooleanField;
    tUsuarioInsMovAtelier: TBooleanField;
    tLoteNroPedido: TIntegerField;
    tPedidoLoteExp: TBooleanField;
    tUsuarioLoteExp: TBooleanField;
    tUsuarioConsLote: TBooleanField;
    tUsuarioInsRequisicao: TBooleanField;
    tUsuarioExcRequisicao: TBooleanField;
    tUsuarioAltRequisicao: TBooleanField;
    tUsuarioRequisicao: TBooleanField;
    tAtividade: TTable;
    tAtividadeCodigo: TIntegerField;
    tAtividadeNome: TStringField;
    dsAtividade: TDataSource;
    tAtividade2: TTable;
    tAtividade2Codigo: TIntegerField;
    tAtividade2Nome: TStringField;
    tUsuarioInsAtividade: TBooleanField;
    tUsuarioExcAtividade: TBooleanField;
    tUsuarioAltAtividade: TBooleanField;
    tUsuarioAtividade: TBooleanField;
    tReq: TTable;
    tReqNroReq: TIntegerField;
    tReqDtMov: TDateField;
    tReqCodSetor: TIntegerField;
    dsReq: TDataSource;
    tReq2: TTable;
    tReq2NroReq: TIntegerField;
    tReqItem: TTable;
    tReqItemNroReq: TIntegerField;
    tReqItemItem: TIntegerField;
    tReqItemCodMaterial: TIntegerField;
    tReqItemCodCor: TIntegerField;
    tReqItemCodGrade: TIntegerField;
    tReqItemUnidade: TStringField;
    tReqItemQtd: TFloatField;
    dsReqItem: TDataSource;
    tReqItem2: TTable;
    tReqItem2NroReq: TIntegerField;
    tReqItem2Item: TIntegerField;
    tReqItem2CodMaterial: TIntegerField;
    tReqItem2CodCor: TIntegerField;
    tReqItem2CodGrade: TIntegerField;
    tReqItem2Unidade: TStringField;
    tReqItem2Qtd: TFloatField;
    tReqItemGrade: TTable;
    tReqItemGradeNroReq: TIntegerField;
    tReqItemGradeItem: TIntegerField;
    tReqItemGradeCodGrade: TIntegerField;
    tReqItemGradePosicao: TIntegerField;
    tReqItemGradeQtd: TFloatField;
    dsReqItemGrade: TDataSource;
    tReqItemGrade2: TTable;
    tReqItemGrade2NroReq: TIntegerField;
    tReqItemGrade2Item: TIntegerField;
    tReqItemGrade2CodGrade: TIntegerField;
    tReqItemGrade2Posicao: TIntegerField;
    tReqItemGrade2Qtd: TFloatField;
    tReqNomeReq: TStringField;
    tReqNomeEntr: TStringField;
    tReqTipo: TStringField;
    tReqItemlkCor: TStringField;
    tReqItemlkMaterial: TStringField;
    tFornecAtiv: TTable;
    tFornecAtivCodForn: TIntegerField;
    tFornecAtivItem: TIntegerField;
    tFornecAtivCodAtiv: TIntegerField;
    dsFornecAtiv: TDataSource;
    tFornecAtiv2: TTable;
    tFornecAtiv2CodForn: TIntegerField;
    tFornecAtiv2Item: TIntegerField;
    tFornecAtiv2CodAtiv: TIntegerField;
    tFornecAtivlkAtividade: TStringField;
    tAtelierPreco: TTable;
    tAtelierPrecoCodAtelier: TIntegerField;
    tAtelierPrecoItem: TIntegerField;
    tAtelierPrecoCodProduto: TIntegerField;
    tAtelierPrecoPreco: TFloatField;
    dsAtelierPreco: TDataSource;
    tAtelierPrecolkRefProduto: TStringField;
    tAtelierPreco2: TTable;
    tAtelierPreco2CodAtelier: TIntegerField;
    tAtelierPreco2Item: TIntegerField;
    tAtelierPreco2CodProduto: TIntegerField;
    tAtelierPreco2Preco: TFloatField;
    tPedidoDolar: TBooleanField;
    tUsuarioConsFornecAtiv: TBooleanField;
    tLotePedidolkEmbarque: TDateField;
    tLotePedidolkEmbFinal: TDateField;
    tGradeItemlk: TTable;
    tGradeItemlkCodGrade: TIntegerField;
    tGradeItemlkPosicao: TIntegerField;
    tGradeItemlkTamanho: TStringField;
    tTalaoGradelkTamanho: TStringField;
    tPedidoInvoice: TStringField;
    tPedidoGradelkTamanho: TStringField;
    tTalaoCodPalmilha: TIntegerField;
    tPedidoItemCodPalmilha: TIntegerField;
    tTalaolkNomePalmilha: TStringField;
    tPedidoItemlkQParTalao: TFloatField;
    tProdutoConstrucao: TStringField;
    tPedidoPOCliente: TStringField;
    tProdutoFotoJpeg: TBlobField;
    tPedidoCarimbo: TStringField;
    tLotePedidolkCarimbo: TStringField;
    tUsuarioConsMovTalao: TBooleanField;
    tUsuarioExcTalao: TBooleanField;
    tLotePedidolkPOCliente: TStringField;
    tProdutoPalmInterna: TStringField;
    tTalaolkPalmInterna: TStringField;
    tProdutoMatclQtdPr: TFloatField;
    tProdutolkGrupo: TStringField;
    tProdutolkSubGrupo: TStringField;
    tProdutolkSitTributaria: TStringField;
    tProdutolkNomeGrade: TStringField;
    tProdutolkModelista: TStringField;
    tLoteImpresso: TBooleanField;
    tReqlkSetor: TStringField;
    tUsuarioCustoSetor: TBooleanField;
    tNEntradaItensQtdPacote: TFloatField;
    tMaterialDtAlteracao: TDateField;
    tUsuarioRelMatMinimo: TBooleanField;
    tOrdemCompra2: TTable;
    tOrdemCompra2Codigo: TIntegerField;
    tOrdemCompra2CodFornecedor: TIntegerField;
    tOrdemCompra2CodCondPgto: TIntegerField;
    tOrdemCompra2CodTransp: TIntegerField;
    tOrdemCompra2DtEmissao: TDateField;
    tOrdemCompra2Obs: TMemoField;
    tOrdemCompra2VlrTotal: TFloatField;
    tOrdemCompra2Entregue: TBooleanField;
    tOrdemCompraItem2: TTable;
    tOrdemCompraItem2Codigo: TIntegerField;
    tOrdemCompraItem2Item: TIntegerField;
    tOrdemCompraItem2CodMaterial: TIntegerField;
    tOrdemCompraItem2CodCor: TIntegerField;
    tLoteOCGerado: TBooleanField;
    tPedidoItemInvoice: TStringField;
    tReqNumLote: TIntegerField;
    tTalaoInvoice: TStringField;
    tLotePedidoItemPedido: TIntegerField;
    tUsuarioConsEstoqueMat: TBooleanField;
    tLoteItemPed: TIntegerField;
    tPedidoItemLoteGer: TBooleanField;
    tUsuarioGeraLocacao: TBooleanField;
    tLoteSetor: TTable;
    dsLoteSetor: TDataSource;
    tLoteSetorLote: TIntegerField;
    tLoteSetorItem: TIntegerField;
    tLoteSetorCodSetor: TIntegerField;
    tLoteSetorlkNomeSetor: TStringField;
    tLoteSetorCodAtelier: TIntegerField;
    tLoteSetorlkNomeAtelier: TStringField;
    tUsuarioConsLocacao: TBooleanField;
    tProdutoSetor: TTable;
    dsProdutoSetor: TDataSource;
    tProdutoSetorCodProduto: TIntegerField;
    tProdutoSetorItem: TIntegerField;
    tProdutoSetorCodSetor: TIntegerField;
    tProdutoSetorCodAtelier: TIntegerField;
    tProdutoSetorlkNomeSetor: TStringField;
    tProdutoSetorlkNomeAtelier: TStringField;
    tProdutoSetorlkAtelier: TBooleanField;
    tUsuarioExcluirTalao: TBooleanField;
    tUsuarioRelHistMaterial: TBooleanField;
    tOrdemCompralkNomeTransp: TStringField;
    tOrdemCompralkEndTransp: TStringField;
    tOrdemCompralkBairroTransp: TStringField;
    tOrdemCompralkCepTransp: TStringField;
    tOrdemCompralkUfTransp: TStringField;
    tOrdemCompralkFoneTransp: TStringField;
    tUsuarioConsMapaCompras: TBooleanField;
    tUsuarioExcLocacao: TBooleanField;
    tUsuarioExcMapaCompras: TBooleanField;
    tSetorMetaDia: TIntegerField;
    tProdutoSetorlkImpTalao: TBooleanField;
    tUsuarioRelMetasProd: TBooleanField;
    tCReceberParclkBanco: TStringField;
    tUsuarioRelSitAtelier: TBooleanField;
    tReqVlrTotal: TFloatField;
    tReqItemEstoque: TBooleanField;
    tReqItemVlrUnitario: TFloatField;
    tReqItemGradelkTamanho: TStringField;
    tLoteSetorlkAtelier: TBooleanField;
    tPedidoQtdParesRep: TFloatField;
    tPedido2QtdParesRep: TFloatField;
    tPedidoItemReposicao: TBooleanField;
    tPedidoVlrReposicao: TFloatField;
    tPedidoItem2: TTable;
    tPedidoItem2Pedido: TIntegerField;
    tPedidoItem2Item: TIntegerField;
    tPedidoItem2Reposicao: TBooleanField;
    tLotePedidolkReposicao: TBooleanField;
    tParametrosNroItensNota: TIntegerField;
    tEmpresaLinha1: TStringField;
    tEmpresaLinha2: TStringField;
    tMaoDeObra: TTable;
    dsMaoDeObra: TDataSource;
    tMaoDeObraCodigo: TSmallintField;
    tMaoDeObraDescricao: TStringField;
    tParametrosPercIssqn: TFloatField;
    tParametrosMaoDeObra: TBooleanField;
    tNotaFiscalPercIssqn: TFloatField;
    tNotaFiscalVlrMObra: TFloatField;
    tNotaFiscalVlrIssqn: TFloatField;
    tLoteMI: TTable;
    dsLoteMI: TDataSource;
    tLoteMILote: TIntegerField;
    tLoteMIQtdTaloes: TIntegerField;
    tLoteMIQtdPares: TFloatField;
    tLoteMIObs: TMemoField;
    tLoteMIImpCalcMaterial: TBooleanField;
    tLoteMIImpresso: TBooleanField;
    tLoteMIOCGerado: TBooleanField;
    tLotePedidoMI: TTable;
    dsLotePedidoMI: TDataSource;
    tLotePedidoMILote: TIntegerField;
    tLotePedidoMIPedido: TIntegerField;
    tLotePedidoMIItemPedido: TIntegerField;
    tLoteSetorMI: TTable;
    dsLoteSetorMI: TDataSource;
    tLoteSetorMILote: TIntegerField;
    tLoteSetorMIItem: TIntegerField;
    tLoteSetorMICodSetor: TIntegerField;
    tLoteSetorMICodAtelier: TIntegerField;
    tTalaoMI: TTable;
    dsTalaoMI: TDataSource;
    tTalaoMILote: TIntegerField;
    tTalaoMIItem: TIntegerField;
    tTalaoMICodProduto: TIntegerField;
    tTalaoMICodCabedal1: TIntegerField;
    tTalaoMICodCabedal2: TIntegerField;
    tTalaoMICodCor: TIntegerField;
    tTalaoMICodCorForro: TIntegerField;
    tTalaoMICodCorPalmilha: TIntegerField;
    tTalaoMICodCorSolado: TIntegerField;
    tTalaoMIQtdPar: TIntegerField;
    tTalaoMICodForro: TIntegerField;
    tTalaoMICodEtiqueta: TIntegerField;
    tTalaoMICodSolado: TIntegerField;
    tTalaoMICodTaloneira: TIntegerField;
    tTalaoMICodCorTaloneira: TIntegerField;
    tTalaoMICodPalmilha: TIntegerField;
    tTalaoGradeMI: TTable;
    dsTalaoGradeMI: TDataSource;
    tTalaoMovMI: TTable;
    dsTalaoMovMI: TDataSource;
    tTalaoMovMILote: TIntegerField;
    tTalaoMovMITalao: TIntegerField;
    tTalaoMovMISetor: TIntegerField;
    tTalaoMovMIDataEnt: TDateField;
    tTalaoMovMIHoraEnt: TTimeField;
    tTalaoMovMIDataSaida: TDateField;
    tTalaoMovMIHoraSaida: TTimeField;
    tTalaoMovMICodAtelier: TIntegerField;
    tTalaoGradeMILote: TIntegerField;
    tTalaoGradeMIItem: TIntegerField;
    tTalaoGradeMITalao: TIntegerField;
    tTalaoGradeMICodGrade: TIntegerField;
    tTalaoGradeMIPosicao: TIntegerField;
    tTalaoGradeMIQtdPar: TIntegerField;
    tLoteSetorMIlkNomeSetor: TStringField;
    tLoteSetorMIlkNomeAtelier: TStringField;
    tLoteSetorMIlkAtelier: TBooleanField;
    tLotePedidoMIlkNomeCliente: TStringField;
    tTalaoGradeMIlkTamanho: TStringField;
    tTalaoMIlkNomeCorForro: TStringField;
    tTalaoMIlkNomeCorPalmilha: TStringField;
    tTalaoMIlkNomeCorSolado: TStringField;
    tTalaoMIlkNomeCabedal1: TStringField;
    tTalaoMIlkNomeCabedal2: TStringField;
    tTalaoMIlkNomeCor: TStringField;
    tTalaoMIlkNomeForro: TStringField;
    tTalaoMIlkNomeEtiqueta: TStringField;
    tTalaoMIlkNomeSolado: TStringField;
    tTalaoMIlkNomeTaloneira: TStringField;
    tTalaoMIlkCorTaloneira: TStringField;
    tTalaoMIlkReferencia: TStringField;
    tTalaoMIlkNomePalmilha: TStringField;
    tTalaoMIlkPalmInterna: TStringField;
    tTalaoMovMIlkAtelier: TStringField;
    tTalaoMovMIlkSetor: TStringField;
    tTalaoMovMIlkTipoAtelier: TBooleanField;
    tLotePedidoMIlkPedidoCliente: TIntegerField;
    tLotePedidoMIlkPedCliDif: TStringField;
    tLotePedidoMIlkStock: TStringField;
    tLotePedidoMIlkPOCliente: TStringField;
    tLotePedidoMIlkCarimbo: TStringField;
    tLotePedidoMIlkEmbarque: TDateField;
    tLotePedidoMIlkEmbFinal: TDateField;
    tUsuarioConsMovTalaoMI: TBooleanField;
    tUsuarioPedidoEsp: TBooleanField;
    tUsuarioAltPedidoEsp: TBooleanField;
    tUsuarioExcPedidoEsp: TBooleanField;
    tUsuarioInsConstrucao: TBooleanField;
    tUsuarioInsPedidoEsp: TBooleanField;
    tCReceberParcTipoDoc: TStringField;
    tNotaFiscalGrade: TTable;
    dsNotaFiscalGrade: TDataSource;
    tNotaFiscalGradeItem: TIntegerField;
    tNotaFiscalGradeCodGrade: TIntegerField;
    tNotaFiscalGradePosicao: TIntegerField;
    tNotaFiscalGradeQtd: TFloatField;
    tNotaFiscalGradeVlrUnitario: TFloatField;
    tNotaFiscalGradeVlrTotal: TFloatField;
    tNotaFiscalItensCodGrade: TIntegerField;
    tNotaFiscalNumNotaDevFor: TIntegerField;
    tNotaFiscalCodForn: TIntegerField;
    tNEntradaDevolvida: TBooleanField;
    tNotaFiscallkNomeFornecedor: TStringField;
    tCPagarCodAtelier: TIntegerField;
    tCPagarParcCodAtelier: TIntegerField;
    tNEntradaCodAtelier: TIntegerField;
    tCReceberDuplicataImp: TBooleanField;
    tCReceberVlrTotal: TFloatField;
    tCReceberlkNomeCliente: TStringField;
    tCReceberParclkNomeCliente: TStringField;
    tCReceberParclkEndereco: TStringField;
    tCReceberParclkBairro: TStringField;
    tCReceberParclkCep: TStringField;
    tCReceberParclkEstado: TStringField;
    tCReceberParclkEndPgto: TStringField;
    tCReceberParclkUfPgto: TStringField;
    tCReceberParclkCepPgto: TStringField;
    tCReceberParclkCgcCpf: TStringField;
    tPedidoStock: TStringField;
    tLotePedidolkStock: TStringField;
    tNatOperacaoTipoFat: TStringField;
    tNotaFiscallkTipoFat: TStringField;
    tPosicao: TTable;
    tPosicaoCodigo: TIntegerField;
    tPosicaoNome: TStringField;
    dsPosicao: TDataSource;
    tProdutoObs: TMemoField;
    tProdutoMatCodPosicao: TIntegerField;
    tProdutoMatImpTalao: TStringField;
    tProdutoMatlkPosicao: TStringField;
    tUsuarioPosicao: TBooleanField;
    tUsuarioAltPosicao: TBooleanField;
    tUsuarioExcPosicao: TBooleanField;
    tUsuarioInsPosicao: TBooleanField;
    tPedidoMaterialCodPosicao: TIntegerField;
    tPedidoMaterialImpTalao: TStringField;
    tPedidoCaixinha: TStringField;
    tPedidoItemCodForma: TIntegerField;
    tProdutoMatlkTipoMat: TStringField;
    tTalaoMICodForma: TIntegerField;
    tTalaoMIlkNomeForma: TStringField;
    tPedidoMercado: TStringField;
    tReqMercado: TStringField;
    tLotePedidoMIlkCaixinha: TStringField;
    tMaterialGradeNumCodGradeMat: TIntegerField;
    tMaterialGradeNumPosicaoMat: TIntegerField;
    tTalaoMIlkConstrucao: TStringField;
    tNotaFiscallkUfTransp: TStringField;
    tCidade: TTable;
    tCidadeCodigo: TIntegerField;
    tCidadeNome: TStringField;
    tCidadeEstado: TStringField;
    tCidadePrefixo: TStringField;
    tCidadeCep: TStringField;
    tClienteCodCidade: TIntegerField;
    tFornecedoresCodCidade: TIntegerField;
    tTranspCodCidade: TIntegerField;
    tUsuarioCidade: TBooleanField;
    tUsuarioAltCidade: TBooleanField;
    tUsuarioExcCidade: TBooleanField;
    tUsuarioInsCidade: TBooleanField;
    dsCidade: TDataSource;
    tClienteCodCidadeE: TIntegerField;
    tClienteCodCidadeP: TIntegerField;
    tClientelkCidade: TStringField;
    tPedidolkCidade: TStringField;
    tClientelkCidadeE: TStringField;
    tNotaFiscallkCidade: TStringField;
    tNotaFiscallkCidEntrega: TStringField;
    tNotaFiscallkCidPgto: TStringField;
    tFornecedoreslkCidade: TStringField;
    tTransplkCidade: TStringField;
    tOrdemCompralkCidTransp: TStringField;
    tNotaFiscallkCidadeTransp: TStringField;
    tPedidoItemlkDescMaterial: TStringField;
    tTalaoMIlkDescMaterial: TStringField;
    tOperAtelier: TTable;
    tOperAtelierCodigo: TIntegerField;
    tOperAtelierNome: TStringField;
    dsOperAtelier: TDataSource;
    tUsuarioOperAtelier: TBooleanField;
    tUsuarioAltOperAtelier: TBooleanField;
    tUsuarioExcOperAtelier: TBooleanField;
    tUsuarioInsOperAtelier: TBooleanField;
    tPedidoItemlkConstrucao: TStringField;
    tUsuarioRelPlanej: TBooleanField;
    tLoteMINumMapaCompras: TIntegerField;
    tNotaFiscalItenslkDescMaterial: TStringField;
    tLoteNumMapaCompras: TIntegerField;
    tMaterialCalcMaterial: TBooleanField;
    tPedidoMateriallkCalcMaterial: TBooleanField;
    tNotaFiscalItenslkConstrucao: TStringField;
    tTalaoMIItemPedido: TIntegerField;
    tTalaoMINumPedido: TIntegerField;
    tLoteMIDtEmbarque: TDateField;
    tTalaoMIlkDtIniEmbarque: TDateField;
    tTalaoMIlkDtFinEmbarque: TDateField;
    tTalaoMIlkCarimbo: TStringField;
    tTalaoMIlkCaixinha: TStringField;
    tPedidoItemObsLote: TStringField;
    tTalaoMIlkObsItemPedido: TStringField;
    tPedidoItem2ObsLote: TStringField;
    tUsuarioEtiqCx: TBooleanField;
    tMaterialPre: TBooleanField;
    tUsuarioRelPre: TBooleanField;
    tPedidoMateriallkNomePosicao: TStringField;
    tGradeItemMarcarTam: TStringField;
    tGradeItemlkMarcarTam: TStringField;
    tPedidoMateriallkPre: TBooleanField;
    tPedidoGradelkMarcarTam: TStringField;
    tTalaoGradeMIlkMarcarTam: TStringField;
    tProdutoEndEtiq: TStringField;
    tPedidoItemlkEndEtiq: TStringField;
    tDctoEst: TTable;
    tDctoEstNumDcto: TIntegerField;
    tDctoEstData: TDateField;
    tDctoEstUsuario: TStringField;
    tDctoEstTipo: TStringField;
    dsDctoEst: TDataSource;
    tDctoEstItem: TTable;
    tDctoEstItemNumDcto: TIntegerField;
    tDctoEstItemItem: TIntegerField;
    tDctoEstItemCodMaterial: TIntegerField;
    tDctoEstItemCodCor: TIntegerField;
    tDctoEstItemCodGrade: TIntegerField;
    tDctoEstItemUnidade: TStringField;
    tDctoEstItemQtd: TFloatField;
    dsDctoEstItem: TDataSource;
    tDctoEstGrade: TTable;
    tDctoEstGradeNumDcto: TIntegerField;
    tDctoEstGradeItem: TIntegerField;
    tDctoEstGradeCodGrade: TIntegerField;
    tDctoEstGradePosicao: TIntegerField;
    tDctoEstGradeQtd: TFloatField;
    tUsuarioDctoEst: TBooleanField;
    tUsuarioAltDctoEst: TBooleanField;
    tUsuarioExcDctoEst: TBooleanField;
    tUsuarioInsDctoEst: TBooleanField;
    tDctoEstTotal: TFloatField;
    tDctoEstItemVlrUnit: TFloatField;
    tDctoEstItemVlrTotal: TFloatField;
    tDctoEstItemlkMaterial: TStringField;
    tDctoEstItemlkCor: TStringField;
    tCReceberParcHistJurosCalc: TFloatField;
    tParametrosTempoEtiq: TIntegerField;
    tUsuarioAgenda: TBooleanField;
    tNatOperacaoGeraDuplicata: TBooleanField;
    tNotaFiscallkGeraDuplicata: TBooleanField;
    tUsuarioCopiaDuplicata: TBooleanField;
    tGradeCodLetra: TStringField;
    tGradeLargura: TStringField;
    tGradeItemQtdPar: TIntegerField;
    tGradeItemlkQtdPar: TIntegerField;
    tPedidoItemlkCodLetra: TStringField;
    tPedidoItemlkLargura: TStringField;
    tGradeTipoDig: TStringField;
    tGradeQtdParTotal: TIntegerField;
    tLoteDtEmbarque: TDateField;
    tTalaoCodForma: TIntegerField;
    tTalaolkNomeForma: TStringField;
    tTalaoGradelkMarcarTam: TStringField;
    tTalaoGradeMIlkLargura: TStringField;
    tTalaoGradelkLargura: TStringField;
    tPedidoItemlkTipoDig: TStringField;
    tReqItemlkLargura: TStringField;
    tNEntradaItenslkLargura: TStringField;
    tNEntradaItensGradelkTamanho: TStringField;
    tNotaFiscalItenslkLargura: TStringField;
    tNotaFiscalGradelkTamanho: TStringField;
    tDctoEstItemlkLargura: TStringField;
    tDctoEstGradelkTamanho: TStringField;
    tMateriallkLargura: TStringField;
    tOrdemCompraItemlkLargura: TStringField;
    tLoteTipoTalao: TStringField;
    tParametrosPercC200: TFloatField;
    tMaterialUM: TTable;
    dsMaterialUM: TDataSource;
    tMaterialUMCodMaterial: TIntegerField;
    tMaterialUMUnidade: TStringField;
    tMaterialUMNome: TStringField;
    tMaterialUMQtd: TFloatField;
    tProdutoMatUnidade: TStringField;
    tEstoqueMatMov: TTable;
    dsEstoqueMatMov: TDataSource;
    tEstoqueMatMovGrade: TTable;
    dsEstoqueMatMovGrade: TDataSource;
    tEstoqueMatMovNumMov: TIntegerField;
    tEstoqueMatMovCodMaterial: TIntegerField;
    tEstoqueMatMovCodCor: TIntegerField;
    tEstoqueMatMovLargura: TStringField;
    tEstoqueMatMovDtMov: TDateField;
    tEstoqueMatMovES: TStringField;
    tEstoqueMatMovTipoMov: TStringField;
    tEstoqueMatMovNumNota: TIntegerField;
    tEstoqueMatMovCodCliForn: TIntegerField;
    tEstoqueMatMovVlrUnitario: TFloatField;
    tEstoqueMatMovQtd: TFloatField;
    tEstoqueMatMovPercIcms: TFloatField;
    tEstoqueMatMovPercIpi: TFloatField;
    tEstoqueMatMovVlrDesconto: TFloatField;
    tNEntradaItensNumMovEst: TIntegerField;
    tReqItemNumMovEst: TIntegerField;
    tDctoEstItemNumMovEst: TIntegerField;
    tEstoqueMatMovGradeNumMov: TIntegerField;
    tEstoqueMatMovGradeTamanho: TStringField;
    tEstoqueMatMovGradeQtd: TFloatField;
    tCReceberParcVlrDevolucao: TFloatField;
    tCReceberParcHistVlrDevolucao: TFloatField;
    tCReceberParcHistDevolucao: TBooleanField;
    tCPagarParcVlrDevolucao: TFloatField;
    tCPagarParcHistVlrDevolucao: TFloatField;
    tCPagarParcHistDevolucao: TBooleanField;
    tProdutoMeta: TTable;
    tProdutoMetaCodProd: TIntegerField;
    tProdutoMetaCodCor: TIntegerField;
    tProdutoMetaCodSetor: TIntegerField;
    tProdutoMetaQtdMetaDia: TIntegerField;
    dsProdutoMeta: TDataSource;
    tProdutoMetalkSetor: TStringField;
    tProdutoMetalkCor: TStringField;
    tCReceberParclkCidade: TStringField;
    tCReceberParclkCidPgto: TStringField;
    tClientelkCidadeP: TStringField;
    tCReceberParclkInscrEst: TStringField;
    tEstoqueMatMovlkNomeMaterial: TStringField;
    tEstoqueMatMovlkCor: TStringField;
    tEstoqueMatMovUnidade: TStringField;
    tNotaFiscalItensNumMovEst: TIntegerField;
    tPedAmostra: TTable;
    tPedAmostraPedido: TIntegerField;
    tPedAmostraCliente: TStringField;
    tPedAmostraCia: TStringField;
    tPedAmostraDtEntrega: TDateField;
    tPedAmostraData: TDateField;
    tPedAmostraVlrTotal: TFloatField;
    dsPedAmostra: TDataSource;
    tPedAmostraIt: TTable;
    tPedAmostraItPedido: TIntegerField;
    tPedAmostraItItem: TIntegerField;
    tPedAmostraItRef: TStringField;
    tPedAmostraItCor: TStringField;
    tPedAmostraItCodGrade: TIntegerField;
    tPedAmostraItQtdPares: TFloatField;
    tPedAmostraItVlrUnit: TFloatField;
    tPedAmostraItVlrTotal: TFloatField;
    dsPedAmostraIt: TDataSource;
    tPedAmostraMat: TTable;
    tPedAmostraMatPedido: TIntegerField;
    tPedAmostraMatItem: TIntegerField;
    tPedAmostraMatOrdem: TIntegerField;
    tPedAmostraMatCor: TStringField;
    tPedAmostraMatConsumoPr: TFloatField;
    tPedAmostraMatCodPosicao: TIntegerField;
    tPedAmostraMatImpTalao: TStringField;
    dsPedAmostraMat: TDataSource;
    tPedAmostraGrade: TTable;
    tPedAmostraGradePedido: TIntegerField;
    tPedAmostraGradeItem: TIntegerField;
    tPedAmostraGradeCodGrade: TIntegerField;
    tPedAmostraGradePosicao: TIntegerField;
    tPedAmostraGradeQtd: TFloatField;
    dsPedAmostraGrade: TDataSource;
    tPedAmostraObs: TMemoField;
    tUsuarioPedAmostra: TBooleanField;
    tUsuarioAltPedAmostra: TBooleanField;
    tUsuarioExcPedAmostra: TBooleanField;
    tUsuarioInsPedAmostra: TBooleanField;
    tPedAmostraMatlkPosicao: TStringField;
    tPedAmostraGradelkTamanho: TStringField;
    tPedAmostraItObs: TMemoField;
    tOutros: TTable;
    tOutrosCodigo: TIntegerField;
    tOutrosNome: TStringField;
    tOutrosContato: TStringField;
    tOutrosTelefone1: TStringField;
    tOutrosTelefone2: TStringField;
    tOutrosFax: TStringField;
    tOutrosEmail: TStringField;
    dsOutros: TDataSource;
    tClienteEmail: TStringField;
    tUsuarioRelMetasProdRef: TBooleanField;
    tUsuarioRelCalcMatPed: TBooleanField;
    tUsuarioRelBalancoEst: TBooleanField;
    tUsuarioRelNEntrada: TBooleanField;
    tUsuarioRelOC: TBooleanField;
    tUsuarioRelTalaoAmostra: TBooleanField;
    tPedAmostraBaixado: TBooleanField;
    tPedAmostraItDtBaixa: TDateField;
    tPedAmostraItBaixado: TBooleanField;
    tOrdemCompraItem2Qtd: TFloatField;
    tOrdemCompraItem2VlrUnitario: TFloatField;
    tOrdemCompraItem2AliqIPI: TFloatField;
    tOrdemCompraItem2VlrIPI: TFloatField;
    tOrdemCompraItem2DtEntrega: TDateField;
    tOrdemCompraItem2VlrTotal: TFloatField;
    tOrdemCompraItem2CodGrade: TIntegerField;
    tOrdemCompraItem2QtdEntregue: TFloatField;
    tOrdemCompraItem2QtdRestante: TFloatField;
    tOrdemCompraItem2Unidade: TStringField;
    tPedAmostraQtdPares: TFloatField;
    tPedAmostraMatMaterial: TStringField;
    tUsuarioConsHistMat: TBooleanField;
    tPosicaoTipo: TStringField;
    tPedidoMateriallkTipo: TStringField;
    tOutrosContato2: TStringField;
    tOutrosContato3: TStringField;
    tTalaoMIlkCliente: TStringField;
    tTalaoMIlkEndEtiq: TStringField;
    tMaterialCodClasFiscal: TStringField;
    tUsuarioExtratoCom: TBooleanField;
    tCReceberParcHistNroLancExtComissao: TIntegerField;
    tUsuarioRelCliRef: TBooleanField;
    tRelacaoGeral: TTable;
    tRelacaoGeralCodigo: TIntegerField;
    tRelacaoGeralNome: TStringField;
    tRelacaoGeralContato1: TStringField;
    tRelacaoGeralContato2: TStringField;
    tRelacaoGeralContato3: TStringField;
    tRelacaoGeralTel1: TStringField;
    tRelacaoGeralTel2: TStringField;
    tRelacaoGeralFax: TStringField;
    dsRelacaoGeral: TDataSource;
    tLotelkObsLote: TStringField;
    tCPagarParcNumNossaNota: TIntegerField;
    tUsuarioExtrVend: TBooleanField;
    tUsuarioRelExtrNFVend: TBooleanField;
    tUsuarioConsHistCli: TBooleanField;
    tTalaolkDescMaterial: TStringField;
    tFabrica: TTable;
    tFabricaCodigo: TIntegerField;
    tFabricaNome: TStringField;
    dsFabrica: TDataSource;
    tUsuarioFabrica: TBooleanField;
    tUsuarioAltFabrica: TBooleanField;
    tUsuarioExcFabrica: TBooleanField;
    tUsuarioInsFabrica: TBooleanField;
    tPedidoCodFabrica: TIntegerField;
    tOrdemCompraCodProd: TIntegerField;
    tOS: TTable;
    dsOS: TDataSource;
    tOSNumOS: TIntegerField;
    tOSDtEmissao: TDateField;
    tOSCodFornecedor: TIntegerField;
    tOSNumOC: TIntegerField;
    tOSItens: TTable;
    dsOSItens: TDataSource;
    tOSItensNumOS: TIntegerField;
    tOSItensItem: TIntegerField;
    tOSItensNumLote: TIntegerField;
    tOSItensCodMaterial: TIntegerField;
    tOSItensCodCor: TIntegerField;
    tOSItensQtde: TFloatField;
    tOSItensUnidade: TStringField;
    tOSGrade: TTable;
    dsOSGrade: TDataSource;
    tOSGradeNumOS: TIntegerField;
    tOSGradeItem: TIntegerField;
    tOSGradeQtde: TFloatField;
    tOSGradeTamanho: TStringField;
    tOSItensCodGrade: TIntegerField;
    tOSItensMercado: TStringField;
    tUsuarioOS: TBooleanField;
    tUsuarioAltOS: TBooleanField;
    tUsuarioExcOS: TBooleanField;
    tUsuarioInsOS: TBooleanField;
    tOSItenslkMaterial: TStringField;
    tOSItenslkCor: TStringField;
    tOSItensLargura: TStringField;
    tOSlkFornecedor: TStringField;
    tEstoqueMatMovCodProd: TIntegerField;
    tClienteMercado: TStringField;
    tOrdemCompralkReferencia: TStringField;
    tUsuarioRelPedEmb: TBooleanField;
    tProdutoMercado: TStringField;
    tUsuarioRelProdColecao: TBooleanField;
    tUsuarioRelICMS: TBooleanField;
    tDevolucao: TTable;
    tDevolucaoNumMov: TIntegerField;
    tDevolucaoCodCliente: TIntegerField;
    tDevolucaoDtContato: TDateField;
    tDevolucaoQtdPares: TFloatField;
    tDevolucaoDtRecebimento: TDateField;
    tDevolucaoDtPrevisao: TDateField;
    tDevolucaoNomeContato: TStringField;
    tDevolucaoResolvido: TBooleanField;
    tDevolucaoNumNota: TIntegerField;
    dsDevolucao: TDataSource;
    tDevolucaoProd: TTable;
    tDevolucaoProdNumMov: TIntegerField;
    tDevolucaoProdItem: TIntegerField;
    tDevolucaoProdCodProduto: TIntegerField;
    tDevolucaoProdCodCor: TIntegerField;
    tDevolucaoProdTamanho: TStringField;
    tDevolucaoProdQtdPares: TFloatField;
    tDevolucaoProdQtdParesInd: TFloatField;
    tDevolucaoProdQtdParesCons: TFloatField;
    tDevolucaoProdDtIndenizado: TDateField;
    tDevolucaoProdDtConserto: TDateField;
    tDevolucaoProdQtdParesSub: TFloatField;
    tDevolucaoProdDtSubstituicao: TDateField;
    dsDevolucaoProd: TDataSource;
    tDevolucaoProdlkReferencia: TStringField;
    tDevolucaoProdlkDescMaterial: TStringField;
    tDevolucaoProdlkCor: TStringField;
    tUsuarioDevolucao: TBooleanField;
    tUsuarioAltDevolucao: TBooleanField;
    tUsuarioExcDevolucao: TBooleanField;
    tUsuarioInsDevolucao: TBooleanField;
    tUsuarioDefeitos: TBooleanField;
    tUsuarioAltDefeitos: TBooleanField;
    tUsuarioExcDefeitos: TBooleanField;
    tUsuarioInsDefeitos: TBooleanField;
    tDefeitos: TTable;
    tDefeitosCodigo: TIntegerField;
    tDefeitosNome: TStringField;
    dsDefeitos: TDataSource;
    tDevolucaoVlrNota: TFloatField;
    tDevolucaoColeta: TBooleanField;
    tDevolucaoDtColeta: TDateField;
    tDevolucaoCodTransp: TIntegerField;
    tDevolucaoProdVlrTotal: TFloatField;
    tDevolucaoProdCodDefeito: TIntegerField;
    tDevolucaoProdBanco: TStringField;
    tDevolucaoProdPgto: TStringField;
    tDevolucaoProdlkDefeito: TStringField;
    tCReceberParcDuplicataImp: TBooleanField;
    tProdutoCodForma: TIntegerField;
    tProdutoTam: TTable;
    tProdutoTamCodProd: TIntegerField;
    tProdutoTamTam: TStringField;
    dsProdutoTam: TDataSource;
    tUsuarioRelTransfICMS: TBooleanField;
    tOSQtde: TFloatField;
    tProdutoTempoCalculo: TFloatField;
    tProdutoTempoReal: TFloatField;
    tUsuarioAltAgenda: TBooleanField;
    tUsuarioExcAgenda: TBooleanField;
    tUsuarioInsAgenda: TBooleanField;
    tEstoqueMatMovQtd2: TFloatField;
    tEstoqueMatMovGradeQtd2: TFloatField;
    tSitTributariaCodSit: TStringField;
    tNotaFiscalItenslkSitTributaria: TStringField;
    tNotaFiscalItenslkCodNatOper: TStringField;
    tNotaFiscalItenslkDescricaoNatOper: TStringField;
    tCPagarParcNomeBancoForn: TStringField;
    tCPagarParcAgenciaForn: TStringField;
    tCPagarParcNumContaForn: TStringField;
    tConstrucao: TTable;
    dsConstrucao: TDataSource;
    tConstrucaoCodigo: TIntegerField;
    tConstrucaoNome: TStringField;
    tConstrucaoQtdPrevista: TIntegerField;
    tProdutoCodConstrucao: TIntegerField;
    tUsuarioConstrucao: TBooleanField;
    tUsuarioAltConstrucao: TBooleanField;
    tUsuarioExcConstrucao: TBooleanField;
    tProdutolkConstrucao: TStringField;
    tUsuarioRelProjecao: TBooleanField;
    tOrdemCompraCouro: TBooleanField;
    RLPreviewSetup1: TRLPreviewSetup;
    RLXLSFilter1: TRLXLSFilter;
    RLPDFFilter1: TRLPDFFilter;
    RLHTMLFilter1: TRLHTMLFilter;
    RLRichFilter1: TRLRichFilter;
    RLDraftFilter1: TRLDraftFilter;
    tParametrosCarimbo: TStringField;
    tParametrosCaixinha: TStringField;
    tTalaoMIlkNomeModelo: TStringField;
    tOrdImpTalao: TTable;
    dsOrdImpTalao: TDataSource;
    tOrdImpTalaoOrdem: TIntegerField;
    tOrdImpTalaoCodSetor: TIntegerField;
    tOrdImpTalaoCodAtelier: TIntegerField;
    tOrdImpTalaolkNomeSetor: TStringField;
    tOrdImpTalaolkNomeAtelier: TStringField;
    tOrdImpTalaolkAtelier: TBooleanField;
    tVendedorEmail: TStringField;
    tVendedorPagarParteNaNota: TBooleanField;
    tNotaFiscallkPagarParteNaNota: TBooleanField;
    tCReceberParcPagarParteNaNota: TBooleanField;
    tParametrosCodModelista: TIntegerField;
    tNotaFiscalItensCodModelista: TIntegerField;
    tNotaFiscalItenslkNomeModelista: TStringField;
    tExtComissaoModNroLancamento: TIntegerField;
    tExtComissaoModCodModelista: TIntegerField;
    tExtComissaoModDtReferencia: TDateField;
    tExtComissaoModNumNota: TIntegerField;
    tExtComissaoModCodProduto: TIntegerField;
    tExtComissaoModFuncao: TStringField;
    tExtComissaoModVlrBase: TFloatField;
    tExtComissaoModPercComissao: TFloatField;
    tExtComissaoModVlrComissao: TFloatField;
    tExtComissaoModTipo: TStringField;
    tExtComissaoModCodCliente: TIntegerField;
    tExtComissaoModlkNomeCliente: TStringField;
    tNotaFiscallkFoneTransp: TStringField;
    tNotaFiscallkCondPgto: TStringField;
    tNotaFiscalItensCalculaComissaoVend: TBooleanField;
    tCReceberPercBaseComissao: TFloatField;
    tNotaFiscalPercBaseComissao: TFloatField;
    tUsuarioRelFaturamento: TBooleanField;
    tUsuarioRelEstoqueIntermediario: TBooleanField;
    tUsuarioRelRefAcumulada: TBooleanField;
    tVendedorEndCorrespondencia: TStringField;
    tVendedorBaiCorrespondencia: TStringField;
    tVendedorCidCorrespondencia: TStringField;
    tVendedorUFCorrespondencia: TStringField;
    tVendedorCepCorrespondencia: TStringField;
    tNatOperacaoCalcComissao: TBooleanField;
    tParametrosSenhaExc: TStringField;
    tEstoqueMatMovMercado: TStringField;
    tNotaFiscalItensMercado: TStringField;
    tNEntradaItensMercado: TStringField;
    tDctoEstItemMercado: TStringField;
    tUsuarioTrocaMercado: TBooleanField;
    tExcComissaoMod: TTable;
    tExcComissaoModContador: TIntegerField;
    tExcComissaoModNumMovExt: TIntegerField;
    tExcComissaoModCodigo: TIntegerField;
    tExcComissaoModPercComissao: TFloatField;
    tExcComissaoModNumNota: TIntegerField;
    tExcComissaoModTipoComissao: TStringField;
    tExcComissaoModVlrComissao: TFloatField;
    tExcComissaoModModVend: TStringField;
    tExcComissaoModFuncao: TStringField;
    tExcComissaoModDataExc: TDateField;
    tExcComissaoModHoraExc: TTimeField;
    tExtComissaoModParcela: TIntegerField;
    tExtComissaoModItemHistCReceber: TIntegerField;
    tCPagarVlrTotal: TFloatField;
    tNotaFiscalPedidoCliente: TStringField;
    tUsuarioMostrarDtEncerramento: TBooleanField;
    tVendedorDtEncerramentoCom: TDateField;
    tVendedorInativo: TBooleanField;
    tExtComissaolkNomeVendedor: TStringField;
    tCliente2: TTable;
    tCliente2Codigo: TIntegerField;
    tCliente2Nome: TStringField;
    tCliente2Endereco: TStringField;
    tCliente2Bairro: TStringField;
    tCliente2Cidade: TStringField;
    tCliente2Uf: TStringField;
    tCliente2Cep: TStringField;
    tCliente2Telefone: TStringField;
    tCliente2Telefone2: TStringField;
    tCliente2Fax: TStringField;
    tCliente2Pessoa: TStringField;
    tCliente2CgcCpf: TStringField;
    tCliente2InscrEst: TStringField;
    tCliente2Contato: TStringField;
    tCliente2Obs: TMemoField;
    tCliente2AprovCredito: TStringField;
    tCliente2TipoAprov: TStringField;
    tCliente2EndEntrega: TStringField;
    tCliente2BairroEntrega: TStringField;
    tCliente2CidEntrega: TStringField;
    tCliente2CepEntrega: TStringField;
    tCliente2UfEntrega: TStringField;
    tCliente2CgcCpfEntrega: TStringField;
    tCliente2InscEntrega: TStringField;
    tCliente2EndPgto: TStringField;
    tCliente2BairroPgto: TStringField;
    tCliente2CidPgto: TStringField;
    tCliente2CepPgto: TStringField;
    tCliente2UfPgto: TStringField;
    tCliente2Fantasia: TStringField;
    tCliente2DtCadastro: TDateField;
    tCliente2CodVendedor: TIntegerField;
    tCliente2ObsCtas: TMemoField;
    tCliente2Lojas: TIntegerField;
    tCliente2Selecionado: TBooleanField;
    tCliente2CaixaPostal: TStringField;
    tCliente2Rg: TStringField;
    tCliente2CodCidade: TIntegerField;
    tCliente2CodCidadeE: TIntegerField;
    tCliente2CodCidadeP: TIntegerField;
    tCliente2Email: TStringField;
    tCliente2Mercado: TStringField;
    tExtComissaolkCliente: TStringField;
    tCPagarCodNatOper: TIntegerField;
    tParametrosQtdLinhaAntCid: TIntegerField;
    tParametrosQtdLinhaAntBase: TIntegerField;
    tParametrosQtdLinhaFinal: TIntegerField;
    tNotaFiscalPedidoRepresentante: TStringField;
    tConstrucaoMat: TTable;
    tConstrucaoMatCodConstrucao: TIntegerField;
    tConstrucaoMatCodConstrucaoGrupo: TIntegerField;
    tConstrucaoMatItem: TIntegerField;
    tConstrucaoMatCodMaterial: TIntegerField;
    tConstrucaoMatCodGrade: TIntegerField;
    tConstrucaoMatCodCor: TIntegerField;
    tConstrucaoMatQtd: TFloatField;
    tConstrucaoMatVlrUnitario: TFloatField;
    tConstrucaoMatVlrTotal: TFloatField;
    tConstrucaoMatCodPosicao: TIntegerField;
    tConstrucaoMatImpTalao: TStringField;
    tConstrucaoMatUnidade: TStringField;
    dsConstrucaoMat: TDataSource;
    tConstrucaoMatlkNomeMaterial: TStringField;
    tCor2: TTable;
    tCor2Codigo: TIntegerField;
    tCor2Nome: TStringField;
    tConstrucaoMatlkNomeCor: TStringField;
    tConstrucaoMatlkNomePosicao: TStringField;
    tConstrucaoGrupo: TTable;
    tConstrucaoGrupoCodConstrucao: TIntegerField;
    tConstrucaoGrupoCodGrupoConstr: TIntegerField;
    tConstrucaoGrupoNome: TStringField;
    dsConstrucaoGrupo: TDataSource;
    tProdutoCodConstrucaoGrupo: TIntegerField;
    tFornecedores2EndForn: TStringField;
    tFornecedores2BairroForn: TStringField;
    tFornecedores2CidadeForn: TStringField;
    tFornecedores2CEPForn: TStringField;
    tFornecedores2EstadoForn: TStringField;
    tFornecedores2Tel1Forn: TStringField;
    tFornecedores2Tel2Forn: TStringField;
    tFornecedores2FaxForn: TStringField;
    tFornecedores2CGC: TStringField;
    tFornecedores2Insc: TStringField;
    tFornecedores2ContatoForn: TStringField;
    tFornecedores2DataCadastroForn: TDateField;
    tFornecedores2ObsForn: TMemoField;
    tFornecedores2Ramal: TStringField;
    tFornecedores2Email: TStringField;
    tFornecedores2HomePage: TStringField;
    tFornecedores2CodCondPgto: TIntegerField;
    tFornecedores2FornecedorOutros: TStringField;
    tFornecedores2CodCidade: TIntegerField;
    tMaterial2MaterialOutros: TStringField;
    tMaterial2DtAlteracao: TDateField;
    tMaterial2CalcMaterial: TBooleanField;
    tMaterial2Pre: TBooleanField;
    tMaterial2CodClasFiscal: TStringField;
    tGrade2: TTable;
    tGrade2Codigo: TIntegerField;
    tGrade2Nome: TStringField;
    tGrade2CodLetra: TStringField;
    tGrade2Largura: TStringField;
    tGrade2TipoDig: TStringField;
    tGrade2QtdParTotal: TIntegerField;
    tContas2: TTable;
    tContas2CodConta: TIntegerField;
    tContas2NomeConta: TStringField;
    tContas2SaldoConta: TFloatField;
    tContas2TipoConta: TStringField;
    tContas2CodBanco: TStringField;
    tCReceberMercado: TStringField;
    tCReceberParcMercado: TStringField;
    tNotaFiscalNumSeq: TIntegerField;
    tNotaFiscalGradeNumseq: TIntegerField;
    tNotaFiscalItensNumSeq: TIntegerField;
    tNotaFiscalParcNumSeq: TIntegerField;
    tPedidoNotaNumSeqNota: TIntegerField;
    tUsuarioConsOCPendente: TBooleanField;
    tAtelierPrecoProcesso: TStringField;
    tNotaFiscalItensGeraDuplicata: TBooleanField;
    tCliente2lkCidade: TStringField;
    tCliente2lkCidadeP: TStringField;
    tConfirmacao: TTable;
    dsConfirmacao: TDataSource;
    tConfirmacaoId: TIntegerField;
    tConfirmacaoModelo: TStringField;
    tConfirmacaoCor: TIntegerField;
    tConfirmacaoCliente: TIntegerField;
    tConfirmacaoConfirmado: TBooleanField;
    tConfirmacaoData: TDateField;
    tConfirmacaoHora: TTimeField;
    tUsuarioArmazenamentoRef: TBooleanField;
    tUsuarioConfirmacaoMod: TBooleanField;
    tUsuarioLocalNavalha: TBooleanField;
    tUsuarioInsArmazenamentoRef: TBooleanField;
    tUsuarioInsConfirmacaoMod: TBooleanField;
    tUsuarioInsLocalNavalha: TBooleanField;
    tUsuarioAltArmazenamentoRef: TBooleanField;
    tUsuarioAltConfirmacaoMod: TBooleanField;
    tUsuarioAltLocalNavalha: TBooleanField;
    tUsuarioExcArmazenamentoRef: TBooleanField;
    tUsuarioExcConfirmacaoMod: TBooleanField;
    tUsuarioExcLocalNavalha: TBooleanField;
    tProdutoDtCadastro: TDateField;
    tFichaConsumo: TTable;
    dsFichaConsumo: TDataSource;
    tTipoMaterial: TTable;
    dsTipoMaterial: TDataSource;
    tFichaConsumoMat: TTable;
    dsFichaConsumoMat: TDataSource;
    tFichaConsumoNumMov: TIntegerField;
    tFichaConsumoReferencia: TStringField;
    tFichaConsumoModelo: TStringField;
    tFichaConsumoConstrucao: TStringField;
    tFichaConsumoCia: TStringField;
    tFichaConsumoTempo: TFloatField;
    tFichaConsumoDtMov: TDateField;
    tTipoMaterialCodigo: TIntegerField;
    tTipoMaterialNome: TStringField;
    tFichaConsumoMatNumMov: TIntegerField;
    tFichaConsumoMatOpcao: TIntegerField;
    tFichaConsumoMatItem: TIntegerField;
    tFichaConsumoMatCodTipoMaterial: TIntegerField;
    tFichaConsumoMatConsumo: TFloatField;
    tUsuarioTipoMaterial: TBooleanField;
    tUsuarioInsTipoMaterial: TBooleanField;
    tUsuarioAltTipoMaterial: TBooleanField;
    tUsuarioExcTipoMaterial: TBooleanField;
    tFichaConsumoMatNomeMaterial: TStringField;
    tFichaConsumoMatUnidade: TStringField;
    tFichaConsumoMatlkNomeTipoMaterial: TStringField;
    tUsuarioFichaConsumo: TBooleanField;
    tUsuarioInsFichaConsumo: TBooleanField;
    tUsuarioAltFichaConsumo: TBooleanField;
    tUsuarioExcFichaConsumo: TBooleanField;
    tNotaFiscalItenslkNomeModelo: TStringField;
    tUsuarioConsPedido: TBooleanField;
    tUsuarioInsConsPedido: TBooleanField;
    tUsuarioAltConsPedido: TBooleanField;
    tUsuarioExcConsPedido: TBooleanField;
    tProdutolkGrupoConstrucao: TStringField;
    tTalaoCodFabrica: TIntegerField;
    tTalaoMICodFabrica: TIntegerField;
    tPedidolkNomeFabrica: TStringField;
    tTalaoMIlkNomeFabrica: TStringField;
    tTalaolkNomeFabrica: TStringField;
    tLoteCodFabrica: TIntegerField;
    tLoteMICodFabrica: TIntegerField;
    tLoteMIlkNomeFabrica: TStringField;
    tLotelkNomeFabrica: TStringField;
    tUsuarioTrocaFabrica: TBooleanField;
    tPedidoItemlkNomeModelo: TStringField;
    tProduto2: TTable;
    tProduto2Codigo: TIntegerField;
    tProduto2CodGrupo: TIntegerField;
    tProduto2CodSubGrupo: TIntegerField;
    tProduto2Nome: TStringField;
    tProduto2Unidade: TStringField;
    tProduto2CodClasFiscal: TStringField;
    tProduto2CodSitTrib: TIntegerField;
    tProduto2LancaGrade: TBooleanField;
    tProduto2CodGrade: TIntegerField;
    tProduto2QParTalao: TFloatField;
    tProduto2PesoLiquido: TFloatField;
    tProduto2PesoBruto: TFloatField;
    tProduto2Inativo: TBooleanField;
    tProduto2Consumo: TStringField;
    tProduto2AliqIcms: TFloatField;
    tProduto2AliqIPI: TFloatField;
    tProduto2NomeExp: TStringField;
    tProduto2CodModelista: TIntegerField;
    tProduto2ComissaoMod: TFloatField;
    tProduto2DescMaterial: TStringField;
    tProduto2VlrAtelier: TFloatField;
    tProduto2Construcao: TStringField;
    tProduto2NomeModelo: TStringField;
    tProduto2FotoJpeg: TBlobField;
    tProduto2PalmInterna: TStringField;
    tProduto2Obs: TMemoField;
    tProduto2EndEtiq: TStringField;
    tProduto2Mercado: TStringField;
    tProduto2CodForma: TIntegerField;
    tProduto2TempoCalculo: TFloatField;
    tProduto2TempoReal: TFloatField;
    tProduto2CodConstrucao: TIntegerField;
    tProduto2CodConstrucaoGrupo: TIntegerField;
    tProduto2DtCadastro: TDateField;
    tTipoCobranca2: TTable;
    tTipoCobranca2Codigo: TIntegerField;
    tTipoCobranca2Nome: TStringField;
    tCPagarParclkNomeTipoCobranca: TStringField;
    tNEntradaNFeChaveAcesso: TStringField;
    tNEntradaNFeProtocolo: TStringField;
    tNEntradaNumSeq: TIntegerField;
    tNEntradaItensNumSeq: TIntegerField;
    tNEntradaParcNumSeq: TIntegerField;
    tNEntradaItensMobraNumSeq: TIntegerField;
    tNEntradaItensGradeNumSeq: TIntegerField;
    tCPagarNumSeqNEntrada: TIntegerField;
    tCPagarSerie: TStringField;
    tCPagarParcNumSeqNEntrada: TIntegerField;
    tCPagarParcSerie: TStringField;
    tProdutoCadastroCompleto: TBooleanField;
    tTipoMaterialTipo: TStringField;
    tUsuarioTipoMaterialProd: TBooleanField;
    tUsuarioInsTipoMaterialProd: TBooleanField;
    tUsuarioAltTipoMaterialProd: TBooleanField;
    tUsuarioExcTipoMaterialProd: TBooleanField;
    tProdutoTipoMat: TTable;
    dsProdutoTipoMat: TDataSource;
    tProdutoTipoMatCodProduto: TIntegerField;
    tProdutoTipoMatCodTipoMaterial: TIntegerField;
    tTipoMaterial2: TTable;
    tTipoMaterial2Codigo: TIntegerField;
    tTipoMaterial2Nome: TStringField;
    tTipoMaterial2Tipo: TStringField;
    tProdutoTipoMatlkNomeTipoMaterial: TStringField;
    tMaterialImpTalaoAuxiliar: TBooleanField;
    tMaterialImpGradeTalaoAuxiliar: TBooleanField;
    tSetorImpTalaoAuxiliar: TBooleanField;
    tSetorOpcaoTalaoAuxiliar: TStringField;
    tTalaoAuxiliar: TTable;
    tTalaoAuxiliarLote: TIntegerField;
    tTalaoAuxiliarCodSetor: TIntegerField;
    tTalaoAuxiliarItemTalao: TIntegerField;
    tTalaoAuxiliarTalao: TIntegerField;
    tTalaoAuxiliarCodProduto: TIntegerField;
    tTalaoAuxiliarCodCor: TIntegerField;
    tTalaoAuxiliarQtdPares: TIntegerField;
    tTalaoAuxiliarCodGrade: TIntegerField;
    tTalaoAuxiliarPosicao: TIntegerField;
    tTalaoAuxiliarTamanho: TStringField;
    tTalaoAuxiliarCodCliente: TIntegerField;
    tTalaoAuxiliarPedido: TIntegerField;
    tTalaoAuxiliarItemPedido: TIntegerField;
    tTalaoAuxiliarCodAtelier: TIntegerField;
    tTalaoAuxiliarDtEntrada: TDateField;
    tTalaoAuxiliarHrEntrada: TTimeField;
    tTalaoAuxiliarDtSaida: TDateField;
    tTalaoAuxiliarHrSaida: TTimeField;
    tTalaoAuxiliarOpcaoLoteTalao: TStringField;
    dsTalaoAuxiliar: TDataSource;
    tTalaoAuxiliarGrade: TTable;
    dsTalaoAuxiliarGrade: TDataSource;
    tTalaoAuxiliarGradeLote: TIntegerField;
    tTalaoAuxiliarGradeCodSetor: TIntegerField;
    tTalaoAuxiliarGradeCodGrade: TIntegerField;
    tTalaoAuxiliarGradePosicao: TIntegerField;
    tTalaoAuxiliarGradeQtd: TIntegerField;
    tTalaoAuxiliarGradeTamanho: TStringField;
    tSetor2: TTable;
    tSetor2Codigo: TIntegerField;
    tSetor2Nome: TStringField;
    tSetor2ImpTalao: TBooleanField;
    tSetor2Atelier: TBooleanField;
    tSetor2MetaDia: TIntegerField;
    tSetor2ImpTalaoAuxiliar: TBooleanField;
    tSetor2OpcaoTalaoAuxiliar: TStringField;
    tAtelier2Atelier: TStringField;
    tPedidoItem2QtdParesFat: TFloatField;
    tPedidoItem2QtdParesRest: TFloatField;
    tUsuarioProgramacao: TBooleanField;
    tUsuarioInsProgramacao: TBooleanField;
    tUsuarioAltProgramacao: TBooleanField;
    tUsuarioExcProgramacao: TBooleanField;
    tLoteNumProgramacao: TIntegerField;
    tPedidoNumProgramacao: TIntegerField;
    tProdutoSetorCapacidadeDia: TIntegerField;
    tProdutoSetorAux: TTable;
    dsProdutoSetorAux: TDataSource;
    tProdutoSetorAuxCodProduto: TIntegerField;
    tProdutoSetorAuxItem: TIntegerField;
    tProdutoSetorAuxCodSetor: TIntegerField;
    tProdutoSetorAuxCapacidadeDia: TIntegerField;
    tProdutoSetorAuxlkNomeSetorAux: TStringField;
    tOrdImpTalaoCapacidadeDia: TIntegerField;
    tSetorQtdDias: TIntegerField;
    tSetorImpProgramacao: TBooleanField;
    tSetor2QtdDias: TIntegerField;
    tSetor2ImpProgramacao: TBooleanField;
    tProdutoSetorlkImpProgramacao: TBooleanField;
    tProdutoSetorAuxlkImpProgramacao: TBooleanField;
    tProdutoSetorlkQtdDias: TIntegerField;
    tProdutoSetorAuxlkQtdDias: TIntegerField;
    tSetorCodPosicaoMat: TIntegerField;
    tSetor2CodPosicaoMat: TIntegerField;
    tParametrosCodSetor1FolhaLote: TIntegerField;
    tProdutoSetorAuxlkImpTalao: TBooleanField;
    tSetorImpFotoTalaoAux: TBooleanField;
    tSetor2ImpFotoTalaoAux: TBooleanField;
    tUsuarioExcluirTalaoAux: TBooleanField;
    tPosicao2: TTable;
    tPosicao2Codigo: TIntegerField;
    tPosicao2Nome: TStringField;
    tPosicao2Tipo: TStringField;
    tMaterialImpCalcMaterial: TBooleanField;
    tCReceberNumSeq: TIntegerField;
    tCReceberParcNumSeq: TIntegerField;
    tFilial: TTable;
    dsFilial: TDataSource;
    tUsuarioFilial: TBooleanField;
    tUsuarioAltFilial: TBooleanField;
    tUsuarioExcFilial: TBooleanField;
    tUsuarioInsFilial: TBooleanField;
    RxDBFilter1: TRxDBFilter;
    tFilialCodigo: TIntegerField;
    tFilialEmpresa: TStringField;
    tFilialEndereco: TStringField;
    tFilialBairro: TStringField;
    tFilialCep: TStringField;
    tFilialCidade: TStringField;
    tFilialEstado: TStringField;
    tFilialTel: TStringField;
    tFilialTel2: TStringField;
    tFilialFax: TStringField;
    tFilialCNPJ: TStringField;
    tFilialInscr: TStringField;
    tFilialSimples: TBooleanField;
    tFilialEmail: TStringField;
    tFilialSimplesGaucho: TBooleanField;
    tFilialImpSimplesGaucho: TBooleanField;
    tFilialEndLogo: TStringField;
    tFilialNomeInterno: TStringField;
    tFilialCalculaIPI: TBooleanField;
    tFilialInativo: TBooleanField;
    tFilialCodCidade: TIntegerField;
    tFilialInscMunicipal: TStringField;
    tFilialCNAE: TStringField;
    tFilialNumEnd: TStringField;
    tFilialHomePage: TStringField;
    tFilialUsarICMSimples: TBooleanField;
    tParametrosVersaoEmissaoNfe: TStringField;
    tParametrosSerieNormal: TStringField;
    tParametrosSerieContingencia: TStringField;
    tParametrosLocalServidorNfe: TStringField;
    tParametrosControlaNfe: TBooleanField;
    tParametrosEmailResponsavelSistema: TStringField;
    tParametrosNFeProducao: TBooleanField;
    tClienteNumEnd: TStringField;
    tClienteNumEndEntrega: TStringField;
    tClienteEmailNfe: TStringField;
    tClienteComplEndereco: TStringField;
    tNotaFiscalNFeRecibo: TStringField;
    tNotaFiscalNFeProtocolo: TStringField;
    tNotaFiscalNFeChaveAcesso: TStringField;
    tNotaFiscalNFeProtocoloCancelada: TStringField;
    tNotaFiscalICMSVlrSubst: TFloatField;
    tNotaFiscalICMSBaseSubst: TFloatField;
    tNotaFiscalNFeCodBarraCont: TStringField;
    tNotaFiscalVlrTotalDupl: TFloatField;
    tNotaFiscalDtCad: TDateField;
    tNotaFiscalHrCad: TDateField;
    tNotaFiscalGradeFilial: TIntegerField;
    tNotaFiscalItensFilial: TIntegerField;
    tNotaFiscalParcFilial: TIntegerField;
    tNotaFiscalSerie: TStringField;
    dsCReceberParcRem: TDataSource;
    tCReceberParcRem: TTable;
    tCReceberParcRemFilial: TIntegerField;
    tCReceberParcRemNumCReceber: TIntegerField;
    tCReceberParcRemParcCReceber: TIntegerField;
    tCReceberParcRemItemHist: TIntegerField;
    tCReceberParcRemItemRem: TIntegerField;
    tCReceberParcRemCodConta: TIntegerField;
    tCReceberParcRemInstrucao: TStringField;
    tCReceberParcRemCampoAlterado: TStringField;
    tCReceberParcRemEspDoc: TStringField;
    tCReceberParcRemCodAceite: TStringField;
    tCReceberParcRemInstProtesto: TStringField;
    tCReceberParcRemDiasProtesto: TIntegerField;
    tCReceberParcRemTaxaMulta: TFloatField;
    tCReceberParcRemTipoJuros: TStringField;
    tCReceberParcRemVlrJuros: TFloatField;
    tCReceberParcRemTipoDesconto: TStringField;
    tCReceberParcRemVlrDesconto: TFloatField;
    tCReceberParcRemDtLimiteDesconto: TStringField;
    tCReceberParcRemVlrDescAntecipacao: TFloatField;
    tCReceberParcRemVlrAbatimento: TFloatField;
    tCReceberParcRemAvalista: TStringField;
    tCReceberParcRemCnpjAvalista: TStringField;
    tCReceberParcRemDtVecto: TStringField;
    tCReceberParcRemCodCedente: TStringField;
    tCReceberParcRemCepAvalista: TStringField;
    tCReceberParcRemEndAvalista: TStringField;
    tCReceberParcRemCidAvalista: TStringField;
    tCReceberParcRemUFAvalista: TStringField;
    tCReceberParcRemImpBoleto: TStringField;
    tCReceberParcRemInstrCobranca1: TStringField;
    tCReceberParcRemInstrCobranca2: TStringField;
    tCReceberParcRemNumCarteira: TStringField;
    tCReceberParcRemBairroAvalista: TStringField;
    tCReceberParcRemEmail: TStringField;
    tCReceberParcRemBoletoPorEmail: TBooleanField;
    tCReceberParcRemNumTitBanco: TStringField;
    tCReceberParcRemlkNomeConta: TStringField;
    tCReceberParcRemTipoDocumentoST: TStringField;
    tCReceberParcRemCodCompensacaoST: TStringField;
    tCReceberParcRemCodBaixaST: TStringField;
    tCReceberParcRemCodProtestoST: TStringField;
    tCReceberParcRemFormaCadastramentoST: TStringField;
    tCReceberParcRemNumRemessaST: TIntegerField;
    tCReceberParcRemCodTransmissaoST: TStringField;
    tCReceberParcRemDiasBaixa: TIntegerField;
    tCReceberParcRemVlrIOF: TFloatField;
    tCReceberParcRemCodMulta: TStringField;
    tCReceberParcRemDtMulta: TStringField;
    tCReceberParcRemVlrMulta: TFloatField;
    tCReceberParcRemTipoDesconto2: TStringField;
    tCReceberParcRemDtLimiteDesconto2: TStringField;
    tCReceberParcRemVlrDesconto2: TFloatField;
    tCReceberParcRemIncidenciaMulta: TStringField;
    tCReceberParcRemQtdDiasMulta: TIntegerField;
    tCReceberParcRemCodComando: TStringField;
    tCReceberParcFilial: TIntegerField;
    tCReceberFilial: TIntegerField;
    tCReceberParcPercComissao2: TFloatField;
    tCReceberParcCodVendedor2: TIntegerField;
    tNotaFiscalCodVendedor2: TIntegerField;
    tCReceberParcCodBancoBoleto: TIntegerField;
    tCReceberParcComissaoItem: TBooleanField;
    tCReceberParcTransferencia: TBooleanField;
    tCReceberParcSerie: TStringField;
    tCReceberSerie: TStringField;
    tCReceberParcNumSeqNota: TIntegerField;
    tCReceberNumSeqNota: TIntegerField;
    tCReceberParcCodPlanoContasItens: TIntegerField;
    tCReceberParcExportacao: TBooleanField;
    tCReceberBoletoImp: TBooleanField;
    tNotaFiscalVlrTransf: TFloatField;
    tParametrosCodBancoTransfIcms: TIntegerField;
    tParametrosCodTipoCobrancaTransfIcms: TIntegerField;
    dsNotaFiscalTBObs: TDataSource;
    tNotaFiscalTBObs: TTable;
    tNotaFiscalTBObsFilial: TIntegerField;
    tNotaFiscalTBObsNumSeq: TIntegerField;
    tNotaFiscalTBObsNumNota: TIntegerField;
    tNotaFiscalTBObsDadosAdicionais: TMemoField;
    tClienteDtValidadeIPI: TDateField;
    tClienteCodObsIPI: TIntegerField;
    tFilialDtInicialSimples: TDateField;
    tMaterialTipoReg: TStringField;
    tNotaFiscalItenslkPercSitTributaria: TFloatField;
    tNotaFiscalItensMaterial: TBooleanField;
    tMaterialComplemento: TStringField;
    tNotaFiscalItensObsComplementar: TStringField;
    tProdutoComplemento: TStringField;
    tProdutoProdMat: TStringField;
    tUFCodUf: TStringField;
    tUFCodSitTrib: TIntegerField;
    tUFIdPais: TIntegerField;
    tNotaFiscalRef: TTable;
    tNotaFiscalRefFilial: TIntegerField;
    tNotaFiscalRefNumSeq: TIntegerField;
    tNotaFiscalRefItem: TIntegerField;
    tNotaFiscalRefNumSeqRef: TIntegerField;
    tNotaFiscalRefNumNotaRef: TIntegerField;
    tNotaFiscalRefSerieRef: TStringField;
    tNotaFiscalRefCodUFEmitenteRef: TStringField;
    tNotaFiscalRefAnoEmissaoRef: TIntegerField;
    tNotaFiscalRefMesEmissaoRef: TIntegerField;
    tNotaFiscalRefCNPJEmitenteRef: TStringField;
    tNotaFiscalRefModeloRef: TStringField;
    tNotaFiscalRefNFeChaveAcessoRef: TStringField;
    tNotaFiscalRefCodFornecedor: TIntegerField;
    dsNotaFiscalRef: TDataSource;
    tNotaFiscalVlrPis: TFloatField;
    tNotaFiscalVlrCofins: TFloatField;
    tPais: TTable;
    tPaisID: TIntegerField;
    tPaisPais: TStringField;
    tPaisCodPais: TStringField;
    dsPais: TDataSource;
    tCidadeCodMunicipio: TStringField;
    tParametrosEndSalvarXMLNFe: TStringField;
    tParametrosUsarOutlook: TBooleanField;
    tParametrosImpRefNota: TBooleanField;
    tParametrosMostrarTelaOCnaNotaFiscal: TBooleanField;
    tNotaFiscalTipoNotaNFeRef: TStringField;
    tNotaFiscalMotivoCanc: TStringField;
    tCReceberParcHistFilial: TIntegerField;
    tEstoqueMatMovNumSeqNota: TIntegerField;
    tEstoqueMatMovSerie: TStringField;
    tNotaFiscallkNumEnd: TStringField;
    tNotaFiscallkComplEndereco: TStringField;
    tNotaFiscallkNumEndEntrega: TStringField;
    tPedidolkNumEnd: TStringField;
    tPedidolkComplEndereco: TStringField;
    tCReceberParclkNumEnd: TStringField;
    tCReceberParclkComplEndereco: TStringField;
    tPedidoStringField: TStringField;
    tCReceberParclkNumEndEntrega: TStringField;
    tMaterialCodSitTrib: TIntegerField;
    tNatOperacaoCodSitTrib: TIntegerField;
    tNotaFiscalVlrTaxaCiscomex: TFloatField;
    tNotaFiscalVlrOutros: TFloatField;
    tNotaFiscalVlrImpImportacao: TFloatField;
    tParametrosEndSalvarPDFNFe: TStringField;
    tTranspEmailNFe: TStringField;
    tTranspPessoa: TStringField;
    tTranspFantasia: TStringField;
    tTranspCliente: TBooleanField;
    tTranspUFPlaca: TStringField;
    tTranspPlaca: TStringField;
    tTranspEmail: TStringField;
    tTranspHomePage: TStringField;
    tTransp2: TTable;
    tTransp2Codigo: TIntegerField;
    tTransp2Nome: TStringField;
    tTransp2Endereco: TStringField;
    tTransp2Bairro: TStringField;
    tTransp2Cidade: TStringField;
    tTransp2Cep: TStringField;
    tTransp2UF: TStringField;
    tTransp2Fone: TStringField;
    tTransp2Fax: TStringField;
    tTransp2CNPJ: TStringField;
    tTransp2Inscricao: TStringField;
    tTransp2Contato: TStringField;
    tTransp2Obs: TMemoField;
    tTransp2CodCidade: TIntegerField;
    tTransp2Fantasia: TStringField;
    tTransp2Cliente: TBooleanField;
    tTransp2UFPlaca: TStringField;
    tTransp2Placa: TStringField;
    tTransp2Pessoa: TStringField;
    tTransp2EmailNFe: TStringField;
    tTransp2Email: TStringField;
    tTransp2HomePage: TStringField;
    tNotaFiscallkPessoaTransp: TStringField;
    tClienteHomePage: TStringField;
    tUsuarioRegimeTrib: TBooleanField;
    tUsuarioCSOSN: TBooleanField;
    tUsuarioTabPis: TBooleanField;
    tUsuarioTabCofins: TBooleanField;
    tUsuarioNFeInutilizar: TBooleanField;
    tUsuarioPercSimples: TBooleanField;
    tUsuarioInsLancComisVend: TBooleanField;
    tUsuarioInsRegimeTrib: TBooleanField;
    tUsuarioInsCSOSN: TBooleanField;
    tUsuarioInsTabPis: TBooleanField;
    tUsuarioInsTabCofins: TBooleanField;
    tUsuarioInsNFeInutilizar: TBooleanField;
    tUsuarioInsImposto: TBooleanField;
    tUsuarioInsPercSimples: TBooleanField;
    tUsuarioAltLancComisVend: TBooleanField;
    tUsuarioAltRegimeTrib: TBooleanField;
    tUsuarioAltCSOSN: TBooleanField;
    tUsuarioAltTabPis: TBooleanField;
    tUsuarioAltTabCofins: TBooleanField;
    tUsuarioAltNFeInutilizar: TBooleanField;
    tUsuarioAltImposto: TBooleanField;
    tUsuarioAltPercSimples: TBooleanField;
    tUsuarioExcLancComisVend: TBooleanField;
    tUsuarioExcRegimeTrib: TBooleanField;
    tUsuarioExcCSOSN: TBooleanField;
    tUsuarioExcTabPis: TBooleanField;
    tUsuarioExcTabCofins: TBooleanField;
    tUsuarioExcNFeInutilizar: TBooleanField;
    tUsuarioExcImposto: TBooleanField;
    tUsuarioExcPercSimples: TBooleanField;
    tClasFiscalClasFiscal: TStringField;
    tClasFiscalTipo: TStringField;
    tClasFiscalNome: TStringField;
    tParametrosUsuarioMapaCompras: TStringField;
    tParametrosGeraComissaoDevol: TBooleanField;
    tParametrosVersaoNFe: TStringField;
    tParametrosQtdHorasCancNFe: TIntegerField;
    tParametrosImp2ObsSimples: TBooleanField;
    tParametrosPisCofinsSomarOutrasDesp: TBooleanField;
    tParametrosEnviarNotasBenefNaNFe: TBooleanField;
    tParametrosAplicarDescontoNoIPI: TBooleanField;
    tParametrosAplicarDescontoNoICMS: TBooleanField;
    tParametrosSomarNoProdFrete: TBooleanField;
    tParametrosSomarNoProdOutrasDesp: TBooleanField;
    tParametrosSomarNoProdSeguro: TBooleanField;
    tParametrosTipoDoLogoNFe: TStringField;
    tParametrosAjusteLogoNFeAutomatico: TBooleanField;
    tFilialDtUltBalanco: TDateField;
    tFilialCodRegimeTrib: TIntegerField;
    tFilialCodPis: TStringField;
    tFilialCodCofins: TStringField;
    tFilialTipoPis: TStringField;
    tFilialTipoCofins: TStringField;
    tFilialPercCofins: TFloatField;
    tFilialPercPis: TFloatField;
    tFilialCodSitTrib: TIntegerField;
    tFilialCodCSTIPI: TStringField;
    tNotaFiscalItensSerie: TStringField;
    tNotaFiscalItensOrigemProd: TStringField;
    tNotaFiscalItensSomaVlrTotalProd: TBooleanField;
    tNotaFiscalItensVlrFrete: TFloatField;
    tNotaFiscalItensVlrOutrasDespesas: TFloatField;
    tNotaFiscalItensVlrSeguro: TFloatField;
    tNotaFiscalItensVlrIcmsFrete: TFloatField;
    tNotaFiscalItensVlrIcmsOutrasDespesas: TFloatField;
    tNotaFiscalItensVlrDescontoRateio: TFloatField;
    tNotaFiscalItensCodPis: TStringField;
    tNotaFiscalItensCodCofins: TStringField;
    tNotaFiscalItensTipoPis: TStringField;
    tNotaFiscalItensTipoCofins: TStringField;
    tNotaFiscalItensBaseIcmsSimples: TFloatField;
    tNotaFiscalItensVlrIcmsSimples: TFloatField;
    tNotaFiscalRefTipo: TStringField;
    tNotaFiscalRefDescTipo: TStringField;
    tNotaFiscalRefCupomNumECF: TIntegerField;
    tNotaFiscalRefCupomNumCOO: TIntegerField;
    tNotaFiscalRefCupomModelo: TStringField;
    tProdutoOrigemProd: TStringField;
    tMaterialOrigemProd: TStringField;
    tSitTributariaTipo: TStringField;
    tSitTributariaNome: TStringField;
    tClienteComplEnderecoEntrega: TStringField;
    tClienteCodSitTribSimples: TIntegerField;
    tClienteUsaIcmsSimples: TBooleanField;
    tClienteDDDFone1: TIntegerField;
    tClienteDDDFone2: TIntegerField;
    tClienteDDDFax: TIntegerField;
    tNatOperacaoIcmsSimples: TBooleanField;
    tNatOperacaoCodSitTribSimples: TIntegerField;
    tNatOperacaoCodCSTIPISimples: TStringField;
    tNatOperacaoCodPisSimples: TStringField;
    tNatOperacaoCodCofinsSimples: TStringField;
    tNatOperacaoTipoPisSimples: TStringField;
    tNatOperacaoTipoCofins: TStringField;
    tNatOperacaoPercPis: TFloatField;
    tNatOperacaoPercCofins: TFloatField;
    tNatOperacaoPercPisSimples: TFloatField;
    tNatOperacaoPercCofinsSimples: TFloatField;
    tNatOperacaoTipoEmpresa: TStringField;
    tNatOperacaoCopiarNotaTriangular: TBooleanField;
    tNatOperacaoDeduzirFat: TBooleanField;
    tNatOperacaoCodPis: TStringField;
    tNatOperacaoCodCofins: TStringField;
    tNatOperacaoTipoPis: TStringField;
    tNatOperacaoRelFat: TBooleanField;
    tNatOperacaoDescInterna: TStringField;
    tNatOperacaoControlarRetorno: TBooleanField;
    tNatOperacaoMaoObra: TBooleanField;
    tNotaFiscalCReceberOK: TBooleanField;
    tNotaFiscalVersaoNFe: TStringField;
    tNotaFiscalFinalidade: TStringField;
    tNotaFiscalDtContingencia: TDateField;
    tNotaFiscalHrContingencia: TTimeField;
    tNotaFiscalMotivoContingencia: TStringField;
    tNotaFiscalIdentVersaoEmissao: TStringField;
    tNotaFiscalCodRegimeTrib: TIntegerField;
    tNotaFiscalRNTC: TStringField;
    tNotaFiscalIdentifVagaoBalsa: TStringField;
    tNotaFiscalTipoIdentifVagaoBalsa: TStringField;
    tNotaFiscalUFEmbExp: TStringField;
    tNotaFiscalLocalEmbExp: TStringField;
    tNotaFiscalVlrDuplicataOutros: TFloatField;
    tNotaFiscalTipoDesconto: TStringField;
    tNotaFiscalGeraDupl_PisCofins: TBooleanField;
    tNotaFiscalGeraDupl_OutrosValores: TBooleanField;
    tNotaFiscalGeraDupl_Frete: TBooleanField;
    tNotaFiscalGeraDupl_Seguro: TBooleanField;
    tNotaFiscalAliqICMS_PisCofins: TFloatField;
    tNotaFiscalAliqICMS_OutrosValores: TFloatField;
    tNotaFiscalAliqICMS_Frete: TFloatField;
    tNotaFiscalPercDescontoOrig: TFloatField;
    tNotaFiscalPercIcmsSimples: TFloatField;
    tNotaFiscalVlrIcmsSimples: TFloatField;
    tNotaFiscalBaseIcmsSimples: TFloatField;
    tNotaFiscalBaseIcmsOutros: TFloatField;
    tNotaFiscalVlrIcmsOutros: TFloatField;
    tNotaFiscalTipoEnvioNF: TStringField;
    tFilialEmailNFe: TStringField;
    tFilialDtEstoque: TDateField;
    tCorPantone: TStringField;
    tNatOperacaoCodCSTIPI: TStringField;
    tNatOperacaoSomaMercNF: TBooleanField;
    tUFIcmsInterno: TFloatField;
    tCSTIPI: TTable;
    tCSTIPICodigo: TStringField;
    tCSTIPINome: TStringField;
    tCSTIPIGeraIPI: TBooleanField;
    dsCSTIPI: TDataSource;
    tNotaFiscalItensClasFiscal: TStringField;
    tCalcMaterial: TTable;
    tCalcMaterialNumOC: TIntegerField;
    tCalcMaterialItemOC: TIntegerField;
    tCalcMaterialMercado: TStringField;
    tCalcMaterialLote: TIntegerField;
    tCalcMaterialCodMaterial: TIntegerField;
    tCalcMaterialCodCor: TIntegerField;
    tCalcMaterialQtdConsumo: TFloatField;
    tCalcMaterialQtdPares: TFloatField;
    tGrupoGeraOC: TBooleanField;
    tMateriallkGeraOC: TBooleanField;
    tMaterialGeraOC: TBooleanField;
    tOrdemCompraDtEntrega: TDateField;
    tPedidoCodMaterial: TIntegerField;
    tPedidoNumOCIni: TIntegerField;
    tPedidoNumOCFin: TIntegerField;
    tPercSimples: TTable;
    tPercSimplesFilial: TIntegerField;
    tPercSimplesAno: TIntegerField;
    tPercSimplesMes: TIntegerField;
    tPercSimplesPercentual: TFloatField;
    dsPercSimples: TDataSource;
    tNotaFiscalItensGeraDupl: TBooleanField;
    tNotaFiscalItensAliqPis: TFloatField;
    tNotaFiscalItensAliqCofins: TFloatField;
    tNotaFiscalItensVlrPis: TFloatField;
    tNotaFiscalItensVlrCofins: TFloatField;
    tNotaFiscalItensCodCSTIPI: TStringField;
    tParametrosObsSimples: TStringField;
    tProdutoCodCSTIPI: TStringField;
    tNotaFiscalPisCofinsSomarOutrasDesp: TBooleanField;
    tNatOperacaoSubstTrib: TBooleanField;
    tNatOperacaoMVA: TBooleanField;
    tClasFiscalVmaInterno: TFloatField;
    tClasFiscalVmaInterestadual: TFloatField;
    tNotaFiscalItensIcmsBaseSubst: TFloatField;
    tNotaFiscalItensIcmsVlrSubst: TFloatField;
    tClienteIDPais: TIntegerField;
    tTranspIDPais: TIntegerField;
    tFornecedoresIDPais: TIntegerField;
    tNatOperacaoGeraEstoque: TBooleanField;
    tUsuarioCia: TBooleanField;
    tUsuarioInsCia: TBooleanField;
    tUsuarioAltCia: TBooleanField;
    tUsuarioExcCia: TBooleanField;
    tCPagarParcDtGerado: TDateField;
    tFornecedoresUsuario: TStringField;
    tFornecedoresDtCad: TDateField;
    tFornecedoresHrCad: TTimeField;
    tFornecedoresCliente: TBooleanField;
    tFornecedoresEndComplemento: TStringField;
    tFornecedoresDDDFone1: TIntegerField;
    tFornecedoresDDDFone2: TIntegerField;
    tFornecedoresDDDFax: TIntegerField;
    tFornecedoresNumEnd: TStringField;
    tFornecedoresPessoa: TStringField;
    tOrdemCompraFilial: TIntegerField;
    tOrdemCompra2Filial: TIntegerField;
    tOrdemCompraItemFilial: TIntegerField;
    tOrdemCompraItem2Filial: TIntegerField;
    tOrdemCompraItemGradeFilial: TIntegerField;
    tOrdemCompraNotaFilial: TIntegerField;
    tOrdemCompraNotaGradeFilial: TIntegerField;
    tNEntradaFilial: TIntegerField;
    tFornecedoresTipoMat: TStringField;
    tMaterialUsuario: TStringField;
    tNotaFiscalItensVlrBaseImportacao: TFloatField;
    tNotaFiscalItensVlrImportacao: TFloatField;
    tNotaFiscalItensVlrAduaneira: TFloatField;
    tNotaFiscalItensVlrIOF: TFloatField;
    tNotaFiscalVlrAduaneira: TFloatField;
    tUsuarioFichaConstrucao: TBooleanField;
    tUsuarioInsFichaConstrucao: TBooleanField;
    tUsuarioAltFichaConstrucao: TBooleanField;
    tUsuarioExcFichaConstrucao: TBooleanField;
    tUsuarioPosicaoFicha: TBooleanField;
    tUsuarioInsPosicaoFicha: TBooleanField;
    tUsuarioAltPosicaoFicha: TBooleanField;
    tUsuarioExcPosicaoFicha: TBooleanField;
    tParametrosUsaGrupoFilial: TBooleanField;
    tFilialDep: TTable;
    dsFilialDep: TDataSource;
    tFilialDepCodFilial: TIntegerField;
    tFilialDepCodFilialDep: TIntegerField;
    tNotaFiscalRefIE: TStringField;
    tNotaFiscalPercTransf: TFloatField;
    tNotaFiscalNFeDenegada: TBooleanField;
    tNotaFiscalNFeMotivoDenegada: TStringField;
    tUsuarioNFeEmail: TBooleanField;
    tUsuarioInsNFeEmail: TBooleanField;
    tUsuarioAltNFeEmail: TBooleanField;
    tUsuarioExcNFeEmail: TBooleanField;
    tClienteEmailNFe2: TStringField;
    tCPagarDtEmissaoNota: TDateField;
    tCPagarParcDtEmissaoNota: TDateField;
    tParametrosSenhaMaterial: TStringField;
    tMaterialCorreto: TBooleanField;
    tParametrosConfirmarMatComErro: TBooleanField;
    tProdutoReferencia: TStringField;
    tProdutoReferencia2: TStringField;
    tNotaFiscalItensReferencia: TStringField;
    tOrdemCompraReferencia: TStringField;
    tProduto2Referencia: TStringField;
    tProduto2Referencia2: TStringField;
    tCliente2NumEnd: TStringField;
    tCliente2ComplEndereco: TStringField;
    tFilialPerc_Trib_NTS_Ind: TFloatField;
    tFilialPerc_Trib_NTS_Ven: TFloatField;
    tFilialPerc_Trib_NTS_Ind_Exp: TFloatField;
    tFilialPerc_Trib_NTS_Ven_Exp: TFloatField;
    tNatOperacaoGerar_Tributo: TStringField;
    tNatOperacaoTipo_Ind_Ven: TStringField;
    tNotaFiscalVlr_Tributo: TFloatField;
    tNotaFiscalItensVlr_Tributo: TFloatField;
    tSetorImpRelProducao: TBooleanField;
    tSetorImpEstoqueInt: TBooleanField;
    tProdutoNomeModelo: TStringField;
    tCalcMaterialNumPedido: TIntegerField;
    tCalcMaterialQtdOC: TFloatField;
    tProdutoEndFoto: TStringField;
    tMaterialNomeSemAcento: TStringField;
    tClienteNomeSemAcento: TStringField;
    tParametrosIMP_TIPO_TRIBUTOS_ITENS: TStringField;
    tParametrosIMP_TIPO_TRIBUTOS: TStringField;
    tParametrosIMP_PERC_TRIB_DADOS_ADIC: TStringField;
    tParametrosIMP_PERC_TRIB_ITENS: TStringField;
    tParametrosLei_Transp_Calcular: TStringField;
    tNotaFiscalVLR_TRIBUTOS_ESTADUAL: TFloatField;
    tNotaFiscalVLR_TRIBUTOS_MUNICIPAL: TFloatField;
    tNotaFiscalFONTE_TRIBUTOS: TStringField;
    tNotaFiscalVERSAO_TRIBUTOS: TStringField;
    tNotaFiscalVLR_TRIBUTOS_FEDERAL: TFloatField;
    tNotaFiscalTipo_Consumidor: TIntegerField;
    tNotaFiscalItensPERC_TRIBUTO_FEDERAL: TFloatField;
    tNotaFiscalItensPERC_TRIBUTO_ESTADUAL: TFloatField;
    tNotaFiscalItensPERC_TRIBUTO_MUNICIPAL: TFloatField;
    tNotaFiscalItensVLR_TRIBUTOS_ESTADUAL: TFloatField;
    tNotaFiscalItensVLR_TRIBUTOS_MUNICIPAL: TFloatField;
    tNotaFiscalItensVERSAO_TRIBUTO: TStringField;
    tNotaFiscalItensFONTE_TRIBUTO: TStringField;
    tNotaFiscalItensVLR_TRIBUTOS_FEDERAL: TFloatField;
    tClienteTipo_Consumidor: TIntegerField;
    tParametrosTipo_Arredondamento: TStringField;
    tParametrosUSA_DANFE_FLEXDOCS: TStringField;
    tParametrosUSA_ICMSOPERACAO_CST51: TStringField;
    tParametrosUSA_DESONERACAO: TStringField;
    tClienteTIPO_CONTRIBUINTE: TIntegerField;
    tNotaFiscalTIPO_DESTINO_OPERACAO: TIntegerField;
    tNotaFiscalTIPO_ATENDIMENTO: TIntegerField;
    tNotaFiscalVLR_ICMSDESONERADO: TFloatField;
    tNotaFiscalLOCALDESPEXPORTACAO: TStringField;
    tNotaFiscalItensVLR_ICMSDESONERADO: TFloatField;
    tNotaFiscalItensCOD_DESONERACAO: TIntegerField;
    tNotaFiscalItensVLR_ICMSOPERACAO: TFloatField;
    tNotaFiscalItensITEM_CLIENTE: TIntegerField;
    tNotaFiscalRefCTECHAVEACESSO_REF: TStringField;
    tFilial_Download: TTable;
    tFilial_DownloadCodFilial: TIntegerField;
    tFilial_DownloadItem: TIntegerField;
    tFilial_DownloadPessoa: TStringField;
    tFilial_DownloadCNPJ_CPF: TStringField;
    dsFilial_Download: TDataSource;
    tParametrosLei_Transp_Imp_Item: TStringField;
    tParametrosLei_Transp_Texto_Item: TStringField;
    tParametrosTipo_Lei_Transp: TStringField;
    tClientePessoaEntrega: TStringField;
    tFornecedoresTIPO_CONSUMIDOR: TIntegerField;
    tFornecedoresTIPO_CONTRIBUINTE: TIntegerField;
    qVerificarNota: TQuery;
    qVerificarNotaFILIAL: TIntegerField;
    qVerificarNotaSERIE: TStringField;
    qVerificarNotaNUMNOTA: TIntegerField;
    qVerificarNotaNUMSEQ: TIntegerField;
    tBcoSantander: TTable;
    tBcoSantanderCodConta: TIntegerField;
    tBcoSantanderCodCedente: TStringField;
    tBcoSantanderCarteira: TStringField;
    tBcoSantanderAceite: TStringField;
    tBcoSantanderInstrucao: TStringField;
    tBcoSantanderDiasProtesto: TIntegerField;
    tBcoSantanderCaminho: TStringField;
    tBcoSantanderNome: TStringField;
    tBcoSantanderExtensao: TStringField;
    tBcoSantanderVlrDesconto: TFloatField;
    tBcoSantanderVlrJurosPorDia: TFloatField;
    tBcoSantanderEspecieDoc: TStringField;
    tBcoSantanderNumCarteira: TStringField;
    tBcoSantanderDtLimiteDesconto: TDateField;
    tBcoSantanderTipoJuro: TStringField;
    tBcoSantanderTipoDesconto: TStringField;
    tBcoSantanderTaxaMulta: TFloatField;
    tBcoSantanderCodTransmissao: TStringField;
    tBcoSantanderNumRemessa: TIntegerField;
    tBcoSantanderFormaCadastramento: TIntegerField;
    tBcoSantanderCodProtesto: TStringField;
    tBcoSantanderCodBaixa: TStringField;
    tBcoSantanderCodCompensacao: TStringField;
    tBcoSantanderTipoDocumento: TStringField;
    tBcoSantanderDiasBaixa: TIntegerField;
    tBcoSantanderVlrIOF: TFloatField;
    tBcoSantanderCodMulta: TStringField;
    tBcoSantanderDtMulta: TDateField;
    tBcoSantanderVlrMulta: TFloatField;
    tBcoSantanderTipoDesconto2: TStringField;
    tBcoSantanderDtLimiteDesconto2: TDateField;
    tBcoSantanderVlrDesconto2: TFloatField;
    tBcoSantanderMensagem1: TStringField;
    tBcoSantanderMensagem2: TStringField;
    dsBcoSantander: TDataSource;
    tProdutoNum_FCI: TStringField;
    tMaterialNum_FCI: TStringField;
    tProdutoPERC_USADO_FCI: TFloatField;
    tMaterialPERC_USADO_FCI: TFloatField;
    tCReceberParcTipoComissao: TStringField;
    tGradeItemTamDebrum: TStringField;
    tGradeItemTamBiqueira: TStringField;
    tGradeItemTamPalmInterna: TStringField;
    tGradeItemTamForro: TStringField;
    tGradeItemTamAvesso: TStringField;
    tGradeItemTamCapaPlataforma: TStringField;
    tGradeItemTamCapaSalto: TStringField;
    tGradeItemlkTamDebrum: TStringField;
    tGradeItemlkTamBiqueira: TStringField;
    tGradeItemlkTamPalmInterna: TStringField;
    tGradeItemlkTamForro: TStringField;
    tGradeItemlkTamAvesso: TStringField;
    tGradeItemlkTamCapaPlataforma: TStringField;
    tGradeItemlkTamCapaSalto: TStringField;
    tTalaoGradeMIlkTamDebrum: TStringField;
    tTalaoGradeMIlkTamBiqueira: TStringField;
    tTalaoGradeMIlkTamPalmInterna: TStringField;
    tTalaoGradeMIlkTamForro: TStringField;
    tTalaoGradeMIlkTamAvesso: TStringField;
    tTalaoGradeMIlkTamCapaPlataforma: TStringField;
    tTalaoGradeMIlkTamCapaSalto: TStringField;
    tGradeItemTamPre: TStringField;
    tGradeItemlkTamPre: TStringField;
    tTalaoGradeMIlkTamPre: TStringField;
    tNotaFiscalItensVLR_ICMSDIFERIDO: TFloatField;
    tNotaFiscalItensPERC_DIFERIMENTO: TFloatField;
    tSitTributariaPerc_Diferimento: TFloatField;
    tNatOperacaoCALCULAR_ICMS_DIFERIDO: TBooleanField;
    tNatOperacao2CALCULAR_ICMS_DIFERIDO: TBooleanField;
    tNotaFiscalItenslkCALCULAR_ICMS_DIFERIDO: TBooleanField;
    tGradeItemTamTaloneira: TStringField;
    tGradeItemTamEspuma: TStringField;
    tGradeItemlkTamTaloneira: TStringField;
    tGradeItemlkTamEspuma: TStringField;
    tTalaoGradeMIlkTamTaloneira: TStringField;
    tTalaoGradeMIlkTamEspuma: TStringField;
    tNotaFiscalHrEmissao: TTimeField;
    tNatOperacaoID_EnqIPI: TIntegerField;
    tFilialID_EnqIPI: TIntegerField;
    tFilialDtInventarioMat: TDateField;
    tFilialDtInventarioProd: TDateField;
    tFilialObsSimples: TStringField;
    tProdutoID_EnqIPI: TIntegerField;
    tNotaFiscalVLR_ICMS_FCP: TFloatField;
    tNotaFiscalVLR_ICMS_UF_DEST: TFloatField;
    tNotaFiscalVLR_ICMS_UF_REMET: TFloatField;
    tNotaFiscalItensID_ENQIPI: TIntegerField;
    tNotaFiscalItensPERC_ICMS_FCP: TFloatField;
    tNotaFiscalItensPERC_ICMS_UF_DEST: TFloatField;
    tNotaFiscalItensPERC_ICMS_PARTILHA: TFloatField;
    tNotaFiscalItensVLR_ICMS_FCP: TFloatField;
    tNotaFiscalItensVLR_ICMS_UF_DEST: TFloatField;
    tNotaFiscalItensVLR_ICMS_UF_REMET: TFloatField;
    tMaterialID_EnqIPI: TIntegerField;
    tUFPERC_CP: TFloatField;
    tMaterialDtAlteracao_Preco: TDateField;
    tMaterialCorDtAlteracao: TDateField;
    tNotaFiscalItensQTD_TRIB: TFloatField;
    tNotaFiscalItensVLR_UNITARIO_TRIB: TFloatField;
    tNotaFiscalItensUNIDADE_TRIB: TStringField;
    tNotaFiscalItensSoma_Automatico_Imp: TBooleanField;
    tNotaFiscalItensPerc_Importacao: TFloatField;
    tProdutoNome: TStringField;
    tNotaFiscalItensDescricao: TStringField;
    tTipoCobrancaCod_Imp_Fiscal: TStringField;
    tNotaFiscalCodTipoCobr: TIntegerField;
    tNotaFiscalParcCodTipoCobr: TIntegerField;
    tNotaFiscalParclkTipoCobranca: TStringField;
    tMaterialSelEstoque: TBooleanField;
    procedure tGrupoAfterPost(DataSet: TDataSet);
    procedure tSubGrupoAfterPost(DataSet: TDataSet);
    procedure tFornecedoresAfterPost(DataSet: TDataSet);
    procedure tMaterialAfterPost(DataSet: TDataSet);
    procedure tGradeAfterPost(DataSet: TDataSet);
    procedure tGradeItemAfterPost(DataSet: TDataSet);
    procedure tCorAfterPost(DataSet: TDataSet);
    procedure tGradeItemBeforePost(DataSet: TDataSet);
    procedure tMaterialCorAfterPost(DataSet: TDataSet);
    procedure tCondPgtoAfterPost(DataSet: TDataSet);
    procedure tCondPgtoItemAfterPost(DataSet: TDataSet);
    procedure tCondPgtoItemBeforePost(DataSet: TDataSet);
    procedure tTranspAfterPost(DataSet: TDataSet);
    procedure tOrdemCompraAfterPost(DataSet: TDataSet);
    procedure tOrdemCompraItemAfterPost(DataSet: TDataSet);
    procedure tOrdemCompraItemGradeAfterPost(DataSet: TDataSet);
    procedure tClasFiscalAfterPost(DataSet: TDataSet);
    procedure tSitTributariaAfterPost(DataSet: TDataSet);
    procedure tProdutoAfterPost(DataSet: TDataSet);
    procedure tProdutoCorAfterPost(DataSet: TDataSet);
    procedure tMaterialGradeNumAfterPost(DataSet: TDataSet);
    procedure tProdutoMatAfterPost(DataSet: TDataSet);
    procedure tProdutoMatTamAfterPost(DataSet: TDataSet);
    procedure tProdutoMatBeforeDelete(DataSet: TDataSet);
    procedure tPedidoAfterPost(DataSet: TDataSet);
    procedure tPedidoDescontoAfterPost(DataSet: TDataSet);
    procedure tPedidoGradeAfterPost(DataSet: TDataSet);
    procedure tPedidoItemAfterPost(DataSet: TDataSet);
    procedure tPedidoMaterialAfterPost(DataSet: TDataSet);
    procedure tPedidoParcAfterPost(DataSet: TDataSet);
    procedure tClienteAfterPost(DataSet: TDataSet);
    procedure tPedidoParcAfterInsert(DataSet: TDataSet);
    procedure tPedidoDescontoAfterInsert(DataSet: TDataSet);
    procedure tPedidoDescontoBeforePost(DataSet: TDataSet);
    procedure tUsuarioAfterPost(DataSet: TDataSet);
    procedure tUsuarioAltAfterPost(DataSet: TDataSet);
    procedure tUsuarioExcAfterPost(DataSet: TDataSet);
    procedure tUsuarioInsAfterPost(DataSet: TDataSet);
    procedure tEmpresaAfterPost(DataSet: TDataSet);
    procedure tNatOperacaoAfterPost(DataSet: TDataSet);
    procedure tVendedorAfterPost(DataSet: TDataSet);
    procedure tLoteAfterPost(DataSet: TDataSet);
    procedure tLotePedidoAfterPost(DataSet: TDataSet);
    procedure tTalaoAfterPost(DataSet: TDataSet);
    procedure tTalaoGradeAfterPost(DataSet: TDataSet);
    procedure tSetorAfterPost(DataSet: TDataSet);
    procedure tTipoCobrancaAfterPost(DataSet: TDataSet);
    procedure tHistoricoAfterPost(DataSet: TDataSet);
    procedure tNotaFiscalAfterPost(DataSet: TDataSet);
    procedure tCReceberParcAfterPost(DataSet: TDataSet);
    procedure tIndexadorAfterPost(DataSet: TDataSet);
    procedure tUFAfterPost(DataSet: TDataSet);
    procedure tNotaFiscalItensAfterPost(DataSet: TDataSet);
    procedure tNotaFiscalParcAfterPost(DataSet: TDataSet);
    procedure tParametrosAfterPost(DataSet: TDataSet);
    procedure tContasAfterPost(DataSet: TDataSet);
    procedure tMovimentosAfterPost(DataSet: TDataSet);
    procedure tCReceberAfterPost(DataSet: TDataSet);
    procedure tPlanoContasAfterPost(DataSet: TDataSet);
    procedure tCPagarAfterPost(DataSet: TDataSet);
    procedure tCPagarParcAfterPost(DataSet: TDataSet);
    procedure tFluxoFuturoAfterPost(DataSet: TDataSet);
    procedure tNEntradaParcAfterPost(DataSet: TDataSet);
    procedure tNEntradaAfterPost(DataSet: TDataSet);
    procedure tNEntradaItensMobraAfterPost(DataSet: TDataSet);
    procedure tNEntradaItensAfterPost(DataSet: TDataSet);
    procedure tNEntradaParcBeforePost(DataSet: TDataSet);
    procedure tCReceberParcHistAfterPost(DataSet: TDataSet);
    procedure tImpressoraAfterPost(DataSet: TDataSet);
    procedure tCReceberParcCalcFields(DataSet: TDataSet);
    procedure tJurosAfterPost(DataSet: TDataSet);
    procedure tLojasAfterPost(DataSet: TDataSet);
    procedure tRegioesAfterPost(DataSet: TDataSet);
    procedure tExtComissaoModAfterPost(DataSet: TDataSet);
    procedure tPedidoNotaAfterPost(DataSet: TDataSet);
    procedure tCPagarParcCalcFields(DataSet: TDataSet);
    procedure tOrdemCompraNotaAfterPost(DataSet: TDataSet);
    procedure tOrdemCompraNotaGradeAfterPost(DataSet: TDataSet);
    procedure tObsAuxAfterPost(DataSet: TDataSet);
    procedure tAtelierAfterPost(DataSet: TDataSet);
    procedure tTalaoMovAfterPost(DataSet: TDataSet);
    procedure tAtividadeAfterPost(DataSet: TDataSet);
    procedure tReqItemAfterPost(DataSet: TDataSet);
    procedure tReqItemGradeAfterPost(DataSet: TDataSet);
    procedure tFornecAtivAfterPost(DataSet: TDataSet);
    procedure tAtelierPrecoAfterPost(DataSet: TDataSet);
    procedure tReqAfterPost(DataSet: TDataSet);
    procedure tProdutoMatCalcFields(DataSet: TDataSet);
    procedure tModelistaAfterPost(DataSet: TDataSet);
    procedure tLoteSetorAfterPost(DataSet: TDataSet);
    procedure tProdutoSetorAfterPost(DataSet: TDataSet);
    procedure tMaoDeObraAfterPost(DataSet: TDataSet);
    procedure tLoteMIAfterPost(DataSet: TDataSet);
    procedure tLotePedidoMIAfterPost(DataSet: TDataSet);
    procedure tLoteSetorMIAfterPost(DataSet: TDataSet);
    procedure tTalaoMIAfterPost(DataSet: TDataSet);
    procedure tTalaoGradeMIAfterPost(DataSet: TDataSet);
    procedure tTalaoMovMIAfterPost(DataSet: TDataSet);
    procedure tNotaFiscalGradeAfterPost(DataSet: TDataSet);
    procedure tPosicaoAfterPost(DataSet: TDataSet);
    procedure tCidadeAfterPost(DataSet: TDataSet);
    procedure tOperAtelierAfterPost(DataSet: TDataSet);
    procedure tDctoEstAfterPost(DataSet: TDataSet);
    procedure tDctoEstItemAfterPost(DataSet: TDataSet);
    procedure tDctoEstGradeAfterPost(DataSet: TDataSet);
    procedure tEstoqueMatMovAfterPost(DataSet: TDataSet);
    procedure tEstoqueMatMovGradeAfterPost(DataSet: TDataSet);
    procedure tProdutoMetaAfterPost(DataSet: TDataSet);
    procedure tPedAmostraAfterPost(DataSet: TDataSet);
    procedure tPedAmostraItAfterPost(DataSet: TDataSet);
    procedure tPedAmostraMatAfterPost(DataSet: TDataSet);
    procedure tPedAmostraGradeAfterPost(DataSet: TDataSet);
    procedure tOutrosAfterPost(DataSet: TDataSet);
    procedure tExtComissaoAfterPost(DataSet: TDataSet);
    procedure tFabricaAfterPost(DataSet: TDataSet);
    procedure tOSGradeAfterPost(DataSet: TDataSet);
    procedure tOSAfterPost(DataSet: TDataSet);
    procedure tOSItensAfterPost(DataSet: TDataSet);
    procedure tCPagarParcHistAfterPost(DataSet: TDataSet);
    procedure tMaterialUMAfterPost(DataSet: TDataSet);
    procedure tNEntradaItensGradeAfterPost(DataSet: TDataSet);
    procedure tRelacaoGeralAfterPost(DataSet: TDataSet);
    procedure tDevolucaoAfterPost(DataSet: TDataSet);
    procedure tDevolucaoProdAfterPost(DataSet: TDataSet);
    procedure tDefeitosAfterPost(DataSet: TDataSet);
    procedure tProdutoTamAfterPost(DataSet: TDataSet);
    procedure tOrdemCompraItemNewRecord(DataSet: TDataSet);
    procedure tOrdemCompraItemGradeNewRecord(DataSet: TDataSet);
    procedure RLPreviewSetup1Send(Sender: TObject);
    procedure tOrdImpTalaoAfterPost(DataSet: TDataSet);
    procedure tVendedorNewRecord(DataSet: TDataSet);
    procedure tCReceberNewRecord(DataSet: TDataSet);
    procedure tCReceberParcHistNewRecord(DataSet: TDataSet);
    procedure tNatOperacaoNewRecord(DataSet: TDataSet);
    procedure tNEntradaNewRecord(DataSet: TDataSet);
    procedure tExcComissaoModAfterPost(DataSet: TDataSet);
    procedure tExtComissaoModNewRecord(DataSet: TDataSet);
    procedure tCPagarNewRecord(DataSet: TDataSet);
    procedure tNotaFiscalNewRecord(DataSet: TDataSet);
    procedure tConstrucaoMatAfterPost(DataSet: TDataSet);
    procedure tConstrucaoMatNewRecord(DataSet: TDataSet);
    procedure tConstrucaoGrupoAfterPost(DataSet: TDataSet);
    procedure tConstrucaoAfterPost(DataSet: TDataSet);
    procedure tCReceberParcBeforePost(DataSet: TDataSet);
    procedure tNotaFiscalItensNewRecord(DataSet: TDataSet);
    procedure tConfirmacaoAfterInsert(DataSet: TDataSet);
    procedure tProdutoNewRecord(DataSet: TDataSet);
    procedure tFichaConsumoAfterPost(DataSet: TDataSet);
    procedure tTipoMaterialAfterPost(DataSet: TDataSet);
    procedure tFichaConsumoMatAfterPost(DataSet: TDataSet);
    procedure tMaterialNewRecord(DataSet: TDataSet);
    procedure tCPagarParcNewRecord(DataSet: TDataSet);
    procedure tProdutoTipoMatAfterPost(DataSet: TDataSet);
    procedure tTalaoAuxiliarAfterPost(DataSet: TDataSet);
    procedure tTalaoAuxiliarGradeAfterPost(DataSet: TDataSet);
    procedure tProdutoSetorAuxAfterPost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure tCSTIPIAfterPost(DataSet: TDataSet);
    procedure tCalcMaterialAfterPost(DataSet: TDataSet);
    procedure tPercSimplesAfterPost(DataSet: TDataSet);
    procedure tNotaFiscalItensBeforePost(DataSet: TDataSet);
    procedure tClienteNewRecord(DataSet: TDataSet);
    procedure tTranspNewRecord(DataSet: TDataSet);
    procedure tFornecedoresNewRecord(DataSet: TDataSet);
    procedure tCPagarParcBeforePost(DataSet: TDataSet);
    procedure tOrdemCompraNewRecord(DataSet: TDataSet);
    procedure tEstoqueMatMovGradeNewRecord(DataSet: TDataSet);
    procedure tFilialDepAfterPost(DataSet: TDataSet);
    procedure tCalcMaterialNewRecord(DataSet: TDataSet);
    procedure tConfirmacaoAfterPost(DataSet: TDataSet);
    procedure tFilial_DownloadAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    FDataSetError: TrsDataSetError;

    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);

  public
    { Public declarations }
    procedure Mostra_Menu;
    Procedure Login;
    Procedure Grava_ExcComissaoMod;
    Procedure Grava_ExcComissaoVend;
    procedure Verifica_ComissaoEnc(CodVendedor: Integer; Data: TDateTime);
    procedure Grava_PedidoMaterial;
    procedure AjustaMaterial_PedidoItem;
    procedure GravaEnt_tCReceberParcHist(Tipo: String);
  end;

var
  DM1: TDM1;
  vSenhaExc: String;
  vEncComissao: Boolean;
  vNroDuplicata: String;
  vCodClasFiscalPos: String;

implementation

uses UGrade, UMaterial, UCondPgto, UOrdemCompra, UPedido, UPedidoDesconto, UNotaEntrada, UBaixaItOC, UMenuP, ULogin, UDM2,
  UConsPedidoBR;

{$R *.DFM}

procedure TDM1.AjustaMaterial_PedidoItem;
begin
  DM1.tPedidoItem.Edit;
  if DM1.tPedidoMateriallkTipo.AsString = 'S' then
    begin
      DM1.tPedidoItemCodCorSolado.AsInteger := DM1.tPedidoMaterialCodCor.AsInteger;
      DM1.tPedidoItemCodSolado.AsInteger    := DM1.tPedidoMaterialCodMaterial.AsInteger;
    end
  else
  if DM1.tPedidoMateriallkTipo.AsString = 'C' then
    begin
      if DM1.tPedidoItemCodCabedal1.AsInteger = 0 then
        DM1.tPedidoItemCodCabedal1.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger
      else
        DM1.tPedidoItemCodCabedal2.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
    end
  else
  if DM1.tPedidoMateriallkTipo.AsString = 'F' then
    begin
      DM1.tPedidoItemCodCorForro.AsInteger := DM1.tPedidoMaterialCodCor.AsInteger;
      DM1.tPedidoItemCodForro.AsInteger    := DM1.tPedidoMaterialCodMaterial.AsInteger;
    end
  else
  if DM1.tPedidoMateriallkTipo.AsString = 'T' then
    begin
      DM1.tPedidoItemCodCorTaloneira.AsInteger := DM1.tPedidoMaterialCodCor.AsInteger;
      DM1.tPedidoItemCodTaloneira.AsInteger    := DM1.tPedidoMaterialCodMaterial.AsInteger;
    end
  else
  if DM1.tPedidoMateriallkTipo.AsString = 'P' then
    begin
      DM1.tPedidoItemCodPalmilha.AsInteger    := DM1.tPedidoMaterialCodMaterial.AsInteger;
      DM1.tPedidoItemCodCorPalmilha.AsInteger := DM1.tPedidoMaterialCodCor.AsInteger;
    end
  else
  if DM1.tPedidoMateriallkTipo.AsString = 'E' then
    DM1.tPedidoItemCodEtiqueta.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger
  else
  if DM1.tPedidoMateriallkTipo.AsString = '1' then
    DM1.tPedidoItemCodForma.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
  DM1.tPedidoItem.Post;
end;

procedure TDM1.Grava_PedidoMaterial;
begin
  DM1.tPedidoMaterial.Insert;
  DM1.tPedidoMaterialPedido.AsInteger      := DM1.tPedidoPedido.AsInteger;
  DM1.tPedidoMaterialItemPed.AsInteger     := DM1.tPedidoItemItem.AsInteger;
  DM1.tPedidoMaterialOrdem.AsInteger       := DM1.tProdutoMatItem.AsInteger;
  DM1.tPedidoMaterialCodCor.AsInteger      := DM1.tProdutoMatCodCor.AsInteger;
  DM1.tPedidoMaterialCodMaterial.AsInteger := DM1.tProdutoMatCodMaterial.AsInteger;
  DM1.tPedidoMaterialConsumoPr.AsFloat     := DM1.tProdutoMatQtd.AsFloat;
  DM1.tPedidoMaterialCodPosicao.AsInteger  := DM1.tProdutoMatCodPosicao.AsInteger;
  DM1.tPedidoMaterialImpTalao.AsString     := DM1.tProdutoMatImpTalao.AsString;
  DM1.tPedidoMaterial.Post;
end;

procedure TDM1.Verifica_ComissaoEnc(CodVendedor: Integer; Data: TDateTime);
begin
  vEncComissao := False;
  if CodVendedor > 0 then
  begin
    if DM1.tVendedor.Locate('Codigo',CodVendedor,[loCaseInsensitive]) then
    begin
      if (DM1.tVendedorDtEncerramentoCom.AsDateTime >= Data) then
      begin
        vEncComissao := True;
        ShowMessage('Comissão já encerrada nesta data para este vendedor!');
      end;
    end
    else
      vEncComissao := True;
  end;
end;

procedure TDM1.Grava_ExcComissaoMod;
var
  i: Integer;
begin
  tExcComissaoMod.Open;
  tExcComissaoMod.Last;
  i := tExcComissaoModContador.AsInteger + 1;
  tExcComissaoMod.Insert;
  tExcComissaoModContador.AsInteger    := i + 1;
  tExcComissaoModNumMovExt.AsInteger   := tExtComissaoModNroLancamento.AsInteger;
  tExcComissaoModCodigo.AsInteger      := tExtComissaoModCodModelista.AsInteger;
  tExcComissaoModPercComissao.AsFloat  := tExtComissaoModPercComissao.AsFloat;
  tExcComissaoModNumNota.AsInteger     := tExtComissaoModNumNota.AsInteger;
  tExcComissaoModTipoComissao.AsString := tExtComissaoModTipo.AsString;
  tExcComissaoModFuncao.AsString       := tExtComissaoModFuncao.AsString;
  tExcComissaoModVlrComissao.AsFloat   := tExtComissaoModVlrComissao.AsFloat;
  tExcComissaoModModVend.AsString      := 'M';
  tExcComissaoModDataExc.AsDateTime    := Date;
  tExcComissaoModHoraExc.AsDateTime    := Now;
  tExcComissaoMod.Post;
  tExcComissaoMod.Close;
end;

procedure TDM1.Grava_ExcComissaoVend;
var
  i: Integer;
begin
  tExcComissaoMod.Open;
  tExcComissaoMod.Last;
  i := tExcComissaoModContador.AsInteger + 1;
  tExcComissaoMod.Insert;
  tExcComissaoModContador.AsInteger    := i + 1;
  tExcComissaoModNumMovExt.AsInteger   := tExtComissaoNroLancamento.AsInteger;
  tExcComissaoModCodigo.AsInteger      := tExtComissaoCodVendedor.AsInteger;
  tExcComissaoModPercComissao.AsFloat  := tExtComissaoPercComissao.AsFloat;
  tExcComissaoModNumNota.AsInteger     := tExtComissaoNroDoc.AsInteger;
  tExcComissaoModTipoComissao.AsString := tExtComissaoTipo.AsString;
  tExcComissaoModFuncao.AsString       := tExtComissaoFuncao.AsString;
  tExcComissaoModVlrComissao.AsFloat   := tExtComissaoVlrComissao.AsFloat;
  tExcComissaoModModVend.AsString      := 'V';
  tExcComissaoModDataExc.AsDateTime    := Date;
  tExcComissaoModHoraExc.AsDateTime    := Now;
  tExcComissaoMod.Post;
  tExcComissaoMod.Close;
end;

procedure TDM1.Login;
begin
  fLogin := TfLogin.Create(Self);
  fLogin.ShowModal;
end;

procedure TDM1.Mostra_Menu;
begin
// Manutenção
  fMenuP.N9Fbricas1.Visible               := tUsuarioFabrica.AsBoolean;
  fMenuP.N1AgendaTelefnica1.Visible       := tUsuarioAgenda.AsBoolean;
  fMenuP.N1Atelier2.Visible               := tUsuarioAtelier.AsBoolean;
  fMenuP.ClassificaoFiscal2.Visible       := tUsuarioClasFiscal.AsBoolean;
  fMenuP.Clientes3.Visible                := tUsuarioClientes.AsBoolean;
  fMenuP.Cor2.Visible                     := tUsuarioCor.AsBoolean;
  fMenuP.CondiesdePagamento1.Visible      := tUsuarioCondPgto.AsBoolean;
  fMenuP.EstadoseAlqotas2.Visible         := tUsuarioUf.AsBoolean;
  fMenuP.Grades1.Visible                  := tUsuarioGrade.AsBoolean;
  fMenuP.Grupo2.Visible                   := tUsuarioGrupos.AsBoolean;
  fMenuP.N2Histricos2.Visible             := tUsuarioHistoricos.AsBoolean;
  fMenuP.Impressoras2.Visible             := tUsuarioImpressoras.AsBoolean;
  fMenuP.NaturezadeOperao2.Visible        := tUsuarioNatOper.AsBoolean;
  fMenuP.ObsAuxiliar1.Visible             := tUsuarioObsAux.AsBoolean;
  fMenuP.DOperaesdeAtelier1.Visible       := tUsuarioOperAtelier.AsBoolean;
  fMenuP.Parametros1.Visible              := tUsuarioParametro.AsBoolean;
  fMenuP.RededeLojas1.Visible             := tUsuarioLojas.AsBoolean;
  fMenuP.RegiesdeVendas2.Visible          := tUsuarioRegioesVendas.AsBoolean;
  fMenuP.SubGrupos2.Visible               := tUsuarioSubGrupo.AsBoolean;
  fMenuP.SituaoTributria2.Visible         := tUsuarioSitTrib.AsBoolean;
  fMenuP.Transportadoras2.Visible         := tUsuarioTransp.AsBoolean;
  fMenuP.Clientes4.Visible                := tUsuarioRelCli.AsBoolean;
  fMenuP.Vendedores4.Visible              := tUsuarioRelVendedores.AsBoolean;
  fMenuP.EtiquetasClientes1.Visible       := tUsuarioRelEtiqCli.AsBoolean;
  fMenuP.EtiquetasVendedores1.Visible     := tUsuarioRelEtiqVend.AsBoolean;
  fMenuP.N5EtiquetasFornecedores1.Visible := tUsuarioRelEtiqForn.AsBoolean;//Botão
  fMenuP.EstadoseAlqotas2.Visible         := tUsuarioUf.AsBoolean;
  fMenuP.N2Cidades2.Visible               := tUsuarioCidade.AsBoolean;
  fMenuP.ModeObra1.Visible                := tUsuarioMaoDeObra.AsBoolean;
  fMenuP.ipodeMaterial1.Visible           := tUsuarioTipoMaterial.AsBoolean;
  fMenuP.Compania1.Visible                := tUsuarioCia.AsBoolean;
  fMenuP.Filial1.Visible                  := tUsuarioFilial.AsBoolean;
  fMenuP.Pasees1.Visible                  := tUsuarioUf.AsBoolean;
  if not(tUsuarioRelCli.AsBoolean)      and not(tUsuarioRelVendedores.AsBoolean) and
     not(tUsuarioRelEtiqCli.AsBoolean)  and not(tUsuarioRelEtiqForn.AsBoolean)   and
     not(tUsuarioRelEtiqVend.AsBoolean) then
    fMenuP.Relatrios6.Visible := False
  else
    fMenuP.Relatrios6.Visible := True;
  if not(tUsuarioClasFiscal.AsBoolean)    and not(tUsuarioClientes.AsBoolean)      and
     not(tUsuarioCor.AsBoolean)           and not(tUsuarioCondPgto.AsBoolean)      and
     not(tUsuarioUf.AsBoolean)            and not(tUsuarioGrade.AsBoolean)         and
     not(tUsuarioGrupos.AsBoolean)        and not(tUsuarioHistoricos.AsBoolean)    and
     not(tUsuarioImpressoras.AsBoolean)   and not(tUsuarioNatOper.AsBoolean)       and
     not(tUsuarioObsAux.AsBoolean)        and not(tUsuarioParametro.AsBoolean)     and
     not(tUsuarioLojas.AsBoolean)         and not(tUsuarioRegioesVendas.AsBoolean) and
     not(tUsuarioSubGrupo.AsBoolean)      and not(tUsuarioSitTrib.AsBoolean)       and
     not(tUsuarioTransp.AsBoolean)        and not(tUsuarioRelCli.AsBoolean)        and
     not(tUsuarioRelVendedores.AsBoolean) and not(tUsuarioRelEtiqCli.AsBoolean)    and
     not(tUsuarioRelEtiqVend.AsBoolean)   and not(tUsuarioRelEtiqForn.AsBoolean)   and
     not(tUsuarioAtelier.AsBoolean)       and not(tUsuarioMaoDeObra.AsBoolean)     and
     not(tUsuarioOperAtelier.AsBoolean)   and not(tUsuarioCidade.AsBoolean)        and
     not(tUsuarioAgenda.AsBoolean)        and not(tUsuarioFabrica.AsBoolean)       and
     not(tUsuarioTipoMaterial.AsBoolean)  and not(tUsuarioCia.AsBoolean)           and
     not(tUsuarioFilial.AsBoolean)        then
    fMenuP.RxSpeedButton1.Visible := False
  else
    fMenuP.RxSpeedButton1.Visible := True;
//Compras
  fMenuP.BOrdemdeServio2.Visible                 := tUsuarioOS.AsBoolean;
  fMenuP.N4ConsultaHistricodosMateriais1.Visible := tUsuarioConsHistMat.AsBoolean;
  fMenuP.N9OrdensdeCompra1.Visible               := tUsuarioRelOC.AsBoolean;
  fMenuP.N1Atividades2.Visible                   := tUsuarioAtividade.AsBoolean;
  fMenuP.N3ConsultadeEstoquedeMateriais2.Visible := tUsuarioConsEstoqueMat.AsBoolean;
  fMenuP.N3ConsultadeFornecpAtividade2.Visible   := tUsuarioConsFornecAtiv.AsBoolean;
  fMenuP.Fornecedores3.Visible                   := tUsuarioFornecedores.AsBoolean;
  fMenuP.Materiais3.Visible                      := tUsuarioMaterial.AsBoolean;
  fMenuP.N3NotadeCompra1.Visible                 := tUsuarioNotaEnt.AsBoolean;
  fMenuP.OrdemdeCompra2.Visible                  := tUsuarioOrdemCompra.AsBoolean;
  fMenuP.N6Requisio1.Visible                     := tUsuarioRequisicao.AsBoolean;
  fMenuP.Fornecedores4.Visible                   := tUsuarioRelForn.AsBoolean;
  fMenuP.Materiais4.Visible                      := tUsuarioRelProdutos.AsBoolean;
  fMenuP.N4MateriaisAbaixodoMnimo2.Visible       := tUsuarioRelMatMinimo.AsBoolean;
  fMenuP.N5HistricodoMaterial1.Visible           := tUsuarioRelHistMaterial.AsBoolean;
  fMenuP.N3CustoporSetor1.Visible                := tUsuarioCustoSetor.AsBoolean;
  fMenuP.DctodeEntradaeSadadoEstoque1.Visible    := tUsuarioDctoEst.AsBoolean;
  fMenuP.N7NotadeEntrada1.Visible                := tUsuarioRelNEntrada.AsBoolean;
  fMenuP.N8BalancodoEstoque1.Visible             := tUsuarioRelBalancoEst.AsBoolean;
  fMenuP.GerarEstoqueEFDSPED1.Visible            := tUsuarioRelBalancoEst.AsBoolean;
  fMenuP.N0PrevisoOC1.Visible                    := tUsuarioConsOCPendente.AsBoolean;
  fMenuP.ConsultaOrdemdeCompraPendetesEntregues1.Visible := tUsuarioConsOCPendente.AsBoolean;
  fMenuP.ArmazenamentodeReferncias2.Visible              := tUsuarioArmazenamentoRef.AsBoolean;
  fMenuP.Confirmao2.Visible                              := tUsuarioConfirmacaoMod.AsBoolean;
  fMenuP.LocalizaodeNavalhas2.Visible                    := tUsuarioLocalNavalha.AsBoolean;
  fMenuP.FichaConsumodeMateriais2.Visible                := tUsuarioFichaConsumo.AsBoolean;
  fMenuP.ConsultaEstoqueporPerodo1.Visible               := tUsuarioConsEstoqueMat.AsBoolean;
  if not(tUsuarioRelForn.AsBoolean)        and not(tUsuarioRelProdutos.AsBoolean)     and
     not(tUsuarioRelEstMat.AsBoolean)      and not(tUsuarioRelMatMinimo.AsBoolean)    and
     not(tUsuarioCustoSetor.AsBoolean)     and not(tUsuarioRelNEntrada.AsBoolean)     and
     not(tUsuarioRelBalancoEst.AsBoolean)  and not(tUsuarioRelHistMaterial.AsBoolean) and
     not(tUsuarioRelOC.AsBoolean)          and not(tUsuarioConsHistMat.AsBoolean)     and
     not(tUsuarioConsOCPendente.AsBoolean) then
    fMenuP.Relatrios7.Visible := False
  else
    fMenuP.Relatrios7.Visible := True;
  if not(tUsuarioFornecedores.AsBoolean)     and not(tUsuarioMaterial.AsBoolean)        and
     not(tUsuarioNotaEnt.AsBoolean)          and not(tUsuarioOrdemCompra.AsBoolean)     and
     not(tUsuarioAcertoEst.AsBoolean)        and not(tUsuarioRelForn.AsBoolean)         and
     not(tUsuarioRelProdutos.AsBoolean)      and not(tUsuarioRelEstMat.AsBoolean)       and
     not(tUsuarioRequisicao.AsBoolean)       and not(tUsuarioAtividade.AsBoolean)       and
     not(tUsuarioConsFornecAtiv.AsBoolean)   and not(tUsuarioRelMatMinimo.AsBoolean)    and
     not(tUsuarioConsEstoqueMat.AsBoolean)   and not(tUsuarioConsMapaCompras.AsBoolean) and
     not(tUsuarioConsLocacao.AsBoolean)      and not(tUsuarioGeraLocacao.AsBoolean)     and
     not(tUsuarioCustoSetor.AsBoolean)       and not(tUsuarioDctoEst.AsBoolean)         and
     not(tUsuarioRelBalancoEst.AsBoolean)    and not(tUsuarioRelNEntrada.AsBoolean)     and
     not(tUsuarioRelHistMaterial.AsBoolean)  and not(tUsuarioRelOC.AsBoolean)           and
     not(tUsuarioOS.AsBoolean)               and not(tUsuarioConsOCPendente.AsBoolean)  and
     not(tUsuarioArmazenamentoRef.AsBoolean) and not(tUsuarioConfirmacaoMod.AsBoolean)  and
     not(tUsuarioLocalNavalha.AsBoolean)     and not(tUsuarioFichaConsumo.AsBoolean)then
    fMenuP.RxSpeedButton2.Visible := False
  else
    fMenuP.RxSpeedButton2.Visible := True;
// PCP
  fMenuP.N6Defeitos2.Visible                   := tUsuarioDefeitos.AsBoolean;
  fMenuP.N6Devolues1.Visible                   := tUsuarioDevolucao.AsBoolean;
  fMenuP.AProdutosporColeoeMercado2.Visible    := tUsuarioRelProdColecao.AsBoolean;
  fMenuP.N7PedidosEmbarcadospPerodo2.Visible   := tUsuarioRelPedEmb.AsBoolean;
  fMenuP.N2ClientesporReferncia1.Visible       := tUsuarioRelCliRef.AsBoolean;
  fMenuP.ATalesdeAmostra1.Visible              := tUsuarioRelTalaoAmostra.AsBoolean;
  fMenuP.N1ClculodeMateriaisporPedido1.Visible := tUsuarioRelCalcMatPed.AsBoolean;
  fMenuP.N5MetasProduzidosReferncia1.Visible   := tUsuarioRelMetasProdRef.AsBoolean;
  fMenuP.PedidodeAmostra1.Visible              := tUsuarioPedAmostra.AsBoolean;
  fMenuP.BaixaPedidos1.Visible                 := tUsuarioBaixaPedidos.AsBoolean;
  fMenuP.N2ConsultaLoteExportao2.Visible       := tUsuarioConsLote.AsBoolean;
  fMenuP.ConsLote1.Visible                     := tUsuarioConsultaLote.AsBoolean;
  fMenuP.N4ConsultaMovimentodeTales2.Visible   := tUsuarioConsMovTalao.AsBoolean;
  fMenuP.N4GerarLoteExportao2.Visible          := tUsuarioLoteExp.AsBoolean;
  fMenuP.GerarLote2.Visible                    := tUsuarioLote.AsBoolean;
  fMenuP.N6MovimentodeTales2.Visible           := tUsuarioMovTalao.AsBoolean;
  fMenuP.Pedido2.Visible                       := tUsuarioPedido.AsBoolean;
  fMenuP.ProdutosFichaTcnica1.Visible          := tUsuarioProduto.AsBoolean;
  fMenuP.Posies1.Visible                       := tUsuarioPosicao.AsBoolean;
  fMenuP.Setor2.Visible                        := tUsuarioSetor.AsBoolean;
  fMenuP.ClculodeMateriaispLotes1.Visible      := tUsuarioRelCalcMatLote.AsBoolean;
  fMenuP.Pedidosnofaturados1.Visible           := tUsuarioRelPedNFat.AsBoolean;
  fMenuP.Rtulos2.Visible                       := tUsuarioRotulos.AsBoolean;
  fMenuP.VendasporVendedor1.Visible            := tUsuarioRelVendas.AsBoolean;
  fMenuP.VendaspoVendedorCliente1.Visible      := tUsuarioRelVendasVendCli.AsBoolean;
  fMenuP.VendasporVendedorReferncia1.Visible   := tUsuarioRelVendasVendRef.AsBoolean;//Botão
  fMenuP.ConsMovimentoTalesMercInterno1.Visible := tUsuarioConsMovTalaoMI.AsBoolean;
  fMenuP.N0MetasProduzidos1.Visible            := tUsuarioRelMetasProd.AsBoolean;
  fMenuP.ASituaodoAtelier1.Visible             := tUsuarioRelSitAtelier.AsBoolean;
  fMenuP.N5PlanejamentoProgramao1.Visible      := tUsuarioRelPlanej.AsBoolean;
  fMenuP.N3EtiquetasparaCaixas1.Visible        := tUsuarioEtiqCx.AsBoolean;
  fMenuP.N7Pr1.Visible                         := tUsuarioRelPre.AsBoolean;
  fMenuP.N6Construo1.Visible                   := tUsuarioConstrucao.AsBoolean;
  fMenuP.CProjeo1.Visible                      := tUsuarioRelProjecao.AsBoolean;
  fMenuP.N5EstoqueIntermedirio1.Visible        := tUsuarioRelEstoqueIntermediario.AsBoolean;
  fMenuP.EstoqueIntermedirioMercInterno1.Visible := tUsuarioRelEstoqueIntermediario.AsBoolean;
  fMenuP.N0RefAcumuladaporFbrica2.Visible        := tUsuarioRelRefAcumulada.AsBoolean;
  fMenup.ConsultaSituaodosPedidos2.Visible       := tUsuarioConsPedido.ASBoolean;
  fMenup.ipoMaterialProduto1.Visible             := tUsuarioTipoMaterialProd.AsBoolean;
  fMenup.Programao1.Visible                      := tUsuarioProgramacao.AsBoolean;
  fMenup.FichaTcnicadeConstruo1.Visible          := tUsuarioFichaConstrucao.AsBoolean;
  fMenup.PosioFichadeTcnicadeConstruo1.Visible   := tUsuarioPosicaoFicha.AsBoolean;
  fMenuP.BaixaTaloAuxiliar1.Visible              := tUsuarioMovTalao.AsBoolean;
  fMenuP.ConsultaBaixaTaloAuxiliar1.Visible      := tUsuarioConsLote.AsBoolean;
  fMenuP.AlteraodeFbricaTales1.Visible           := tUsuarioLoteExp.AsBoolean;
  fMenuP.ConsultaLoteProduzidoPendente1.Visible  := tUsuarioConsLote.AsBoolean;
  fMenuP.ConsultaMaterialNaFichaTcnica1.Visible  := tUsuarioProduto.AsBoolean;
  if not(tUsuarioRelCalcMatLote.AsBoolean)  and not(tUsuarioRelMetasProd.AsBoolean)     and
     not(tUsuarioRelPedNFat.AsBoolean)      and not(tUsuarioRelTalaoAmostra.AsBoolean)  and
     not(tUsuarioRotulos.AsBoolean)         and not(tUsuarioRelVendasVendRef.AsBoolean) and
     not(tUsuarioRelVendas.AsBoolean)       and not(tUsuarioRelVendasVendCli.AsBoolean) and
     not(tUsuarioRelSitAtelier.AsBoolean)   and not(tUsuarioRelPlanej.AsBoolean)        and
     not(tUsuarioEtiqCx.AsBoolean)          and not(tUsuarioRelPre.AsBoolean)           and
     not(tUsuarioRelMetasProdRef.AsBoolean) and not(tUsuarioRelCalcMatPed.AsBoolean)    and
     not(tUsuarioRelCliRef.AsBoolean)       and not(tUsuarioRelPedEmb.AsBoolean)        and
     not(tUsuarioRelProdColecao.AsBoolean)  and not(tUsuarioRelProjecao.AsBoolean)      and
     not(tUsuarioRelEstoqueIntermediario.AsBoolean)  and not(tUsuarioRelRefAcumulada.AsBoolean) then
    fMenuP.Relatrios8.Visible := False
  else
    fMenuP.Relatrios8.Visible := True;
  if not(tUsuarioBaixaPedidos.AsBoolean)     and not(tUsuarioConsultaLote.AsBoolean)     and
     not(tUsuarioLote.AsBoolean)             and not(tUsuarioPedidoEsp.AsBoolean)        and
     not(tUsuarioPedido.AsBoolean)           and not(tUsuarioProduto.AsBoolean)          and
     not(tUsuarioRelCalcMatLote.AsBoolean)   and not(tUsuarioPosicao.AsBoolean)          and
     not(tUsuarioRelPedNFat.AsBoolean)       and not(tUsuarioRotulos.AsBoolean)          and
     not(tUsuarioLoteExp.AsBoolean)          and not(tUsuarioRelVendas.AsBoolean)        and
     not(tUsuarioRelVendasVendCli.AsBoolean) and not(tUsuarioRelVendasVendRef.AsBoolean) and
     not(tUsuarioMovTalao.AsBoolean)         and not(tUsuarioRelMetasProd.AsBoolean)     and
     not(tUsuarioConsLote.AsBoolean)         and not(tUsuarioConsMovTalao.AsBoolean)     and
     not(tUsuarioConsMovTalaoMI.AsBoolean)   and not(tUsuarioSetor.AsBoolean)            and
     not(tUsuarioRelPlanej.AsBoolean)        and not(tUsuarioEtiqCx.AsBoolean)           and
     not(tUsuarioRelPre.AsBoolean)           and not(tUsuarioPedAmostra.AsBoolean)       and
     not(tUsuarioRelMetasProdRef.AsBoolean)  and not(tUsuarioRelCalcMatPed.AsBoolean)    and
     not(tUsuarioRelSitAtelier.AsBoolean)    and not(tUsuarioRelTalaoAmostra.AsBoolean)  and
     not(tUsuarioRelCliRef.AsBoolean)        and not(tUsuarioRelPedEmb.AsBoolean)        and
     not(tUsuarioRelProdColecao.AsBoolean)   and not(tUsuarioDevolucao.AsBoolean)        and
     not(tUsuarioDefeitos.AsBoolean)         and not(tUsuarioConstrucao.AsBoolean)       and
     not(tUsuarioRelEstoqueIntermediario.AsBoolean)  and not(tUsuarioRelRefAcumulada.AsBoolean)  and
     not(tUsuarioConsPedido.AsBoolean)               and not(tUsuarioTipoMaterialProd.AsBoolean) and
     not(tUsuarioProgramacao.AsBoolean)              and not(tUsuarioFichaConstrucao.AsBoolean)  and
     not(tUsuarioPosicaoFicha.AsBoolean)             then
    fMenuP.RxSpeedButton3.Visible := False
  else
    fMenuP.RxSpeedButton3.Visible := True;
    
// Faturamento
  //NFe 2.0
  fMenuP.CadastrodeTributos1.Visible := ((tUsuarioRegimeTrib.AsBoolean) or (tUsuarioPercSimples.AsBoolean) or (tUsuarioCSOSN.AsBoolean)
                                         or (tUsuarioTabCofins.AsBoolean) or (tUsuarioTabPis.AsBoolean));
  fMenuP.RegimeTributrio1.Visible    := tUsuarioRegimeTrib.AsBoolean;
  fMenuP.CSOSN.Visible               := tUsuarioCSOSN.AsBoolean;
  fMenuP.abelaCofins1.Visible        := tUsuarioTabCofins.AsBoolean;
  fMenuP.abelaPis1.Visible           := tUsuarioTabPis.AsBoolean;
  fMenuP.OrigemMercadoria1.Visible   := tUsuarioRegimeTrib.AsBoolean;
  fMenuP.InutilizarNumeraodeNota1.Visible := tUsuarioNFeInutilizar.AsBoolean;
  //*******
  fMenuP.N1ICMS1.Visible                           := tUsuarioRelICMS.AsBoolean;
  fMenuP.N2ConsultaHistricodosClientes1.Visible    := tUsuarioConsHistCli.AsBoolean;
  fMenuP.Consultafatdirio1.Visible                 := tUsuarioConsFat.AsBoolean;
  fMenuP.NotasFiscais2.Visible                     := tUsuarioNotaFiscal.AsBoolean;
  fMenuP.N7GerarArquivos1.Visible                  := tUsuarioGeraArq.AsBoolean;
  fMenuP.Notasemitidasporvendedor1.Visible         := tUsuarioRelNEmitVend.AsBoolean;
  fMenuP.Notasemitidaspornaturezadeoperao1.Visible := tUsuarioRelVendasNatOper.AsBoolean;//Botão
  fMenuP.Faturamento2.Visible                      := tUsuarioRelFaturamento.AsBoolean;
  fMenuP.ConsultaFaturamento1.Visible              := tUsuarioRelFaturamento.AsBoolean;
  fMenuP.NFeEmailsAdicionais1.Visible              := tUsuarioNFeEmail.AsBoolean;
  if not(tUsuarioRelNEmitVend.AsBoolean) and not(tUsuarioRelVendasNatOper.AsBoolean) and
     not(tUsuarioRelICMS.AsBoolean)      and not(tUsuarioRelFaturamento.AsBoolean) then
    fMenuP.Relatrios11.Visible := False
  else
    fMenuP.Relatrios11.Visible := True;
  if not(tUsuarioConsFat.AsBoolean)           and not(tUsuarioNotaFiscal.AsBoolean)     and
     not(tUsuarioGeraArq.AsBoolean)           and not(tUsuarioRelNEmitVend.AsBoolean)   and
     not(tUsuarioRelVendasNatOper.AsBoolean)  and not(tUsuarioConsHistCli.AsBoolean)    and
     not(tUsuarioRelICMS.AsBoolean)           and not(tUsuarioRelFaturamento.AsBoolean) and
     not(tUsuarioPercSimples.AsBoolean)       and not(tUsuarioRegimeTrib.AsBoolean)     and
     not(tUsuarioCSOSN.AsBoolean)             and not(tUsuarioTabCofins.AsBoolean)      and
     not(tUsuarioTabPis.AsBoolean)            and not(tUsuarioNFeInutilizar.AsBoolean)  and
     not(tUsuarioNFeEmail.AsBoolean)          then
    fMenuP.RxSpeedButton4.Visible := False
  else
    fMenuP.RxSpeedButton4.Visible := True;
    
// Comissão
  fMenuP.ExtratodeVendedoresNotas1.Visible      := tUsuarioExtratoCom.AsBoolean;
  fMenuP.LanamentodeComisses1.Visible           := tUsuarioLancComisVend.AsBoolean;
  fMenuP.N1Vendedor1.Visible                    := tUsuarioVendedor.AsBoolean;
  fMenuP.ExtratodeComisso1.Visible              := tUsuarioRelExtrComisVend.AsBoolean;
  fMenuP.Modelista1.Visible                     := tUsuarioModelista.AsBoolean;
  fMenuP.N7ComissoModelista1.Visible            := tUsuarioComissaoMod.AsBoolean;
  fMenuP.N8LanamentodeComissoModelista1.Visible := tUsuarioLancComisMod.AsBoolean;
  fMenuP.Relatriode1.Visible                    := tUsuarioRelExtrComisMod.AsBoolean;
  fMenuP.N23.Visible                            := tUsuarioRelExtrPedMod.AsBoolean;//Botão
  if not tUsuarioRelExtrComisVend.AsBoolean then
    fMenuP.Relatrios13.Visible := False
  else
    fMenuP.Relatrios13.Visible := True;
  if not(tUsuarioRelExtrComisMod.AsBoolean) and not(tUsuarioRelExtrPedMod.AsBoolean) then
    fMenuP.N91.Visible          := False
  else
    fMenuP.N91.Visible          := True;
  if not(tUsuarioComissao.AsBoolean)         and not(tUsuarioExtratoCom.AsBoolean)       and
     not(tUsuarioLancComisVend.AsBoolean)    and not(tUsuarioVendedor.AsBoolean)         and
     not(tUsuarioRelExtrComisVend.AsBoolean) and
     not(tUsuarioModelista.AsBoolean)        and not(tUsuarioComissaoMod.AsBoolean)      and
     not(tUsuarioLancComisMod.AsBoolean)     and not(tUsuarioRelExtrComisMod.AsBoolean)  and
     not(tUsuarioRelExtrPedMod.AsBoolean) then
    fMenuP.RxSpeedButton8.Visible := False
  else
    fMenuP.RxSpeedButton8.Visible := True;
// Contas a Receber
  fMenuP.LancaCtasaReceber1.Visible     := tUsuarioLancCReceber.AsBoolean;
  fMenuP.TipodeCobranas1.Visible        := tUsuarioTiposCobr.AsBoolean;
  fMenuP.Duplicatas2.Visible            := tUsuarioRelBoleto.AsBoolean;
  fMenuP.N5ContasaReeber1.Visible       := tUsuarioRelCReceber.AsBoolean;
  fMenuP.N6AReceberporCliente1.Visible  := tUsuarioRelCRecCli.AsBoolean;
  fMenuP.N1CpiasdeDuplicatas1.Visible   := tUsuarioCopiaDuplicata.AsBoolean;
  fMenuP.ContasaReceberNovo1.Visible    := tUsuarioCReceber.AsBoolean;
  if not(tUsuarioRelBoleto.AsBoolean)      and
     not(tUsuarioRelCReceber.AsBoolean)    and not(tUsuarioRelCRecCli.AsBoolean) and
     not(tUsuarioCopiaDuplicata.AsBoolean) then
    fMenuP.Relatrios9.Visible := False
  else
    fMenuP.Relatrios9.Visible := True;
  if not(tUsuarioCReceber.AsBoolean)    and not(tUsuarioLancCReceber.AsBoolean)   and
     not(tUsuarioTiposCobr.AsBoolean)      and
     not(tUsuarioRelBoleto.AsBoolean)   and
     not(tUsuarioRelCReceber.AsBoolean) and not(tUsuarioRelCRecCli.AsBoolean)     and
     not(tUsuarioArqSCI.AsBoolean)      and not(tUsuarioCopiaDuplicata.AsBoolean) then
    fMenuP.RxSpeedButton5.Visible  := False
  else
    fMenuP.RxSpeedButton5.Visible  := True;
// Contas a Pagar
  fMenuP.N5TransfernciadeICMS1.Visible       := tUsuarioRelTransfICMS.AsBoolean;
  fMenuP.ContasaPagar3.Visible               := tUsuarioCPagar.AsBoolean;
  fMenuP.ContasaPagarNovo1.Visible           := tUsuarioCPagar.AsBoolean;
  fMenuP.LanaCtasaPagar1.Visible             := tUsuarioLctoPagar.AsBoolean;
  fMenuP.N1ContasPagar1.Visible              := tUsuarioRelCPagar.AsBoolean;
  fMenuP.N2NotasporNaturezadeOperao1.Visible := tUsuarioRelNEntrNatOper.AsBoolean;
  fMenuP.N3APagarporFornecedores1.Visible    := tUsuarioRelCPagForn.AsBoolean;
  fMenuP.N4PagamentodeJuros2.Visible         := tUsuarioRelPgtoJuros.AsBoolean;//Botão
  if not(tUsuarioRelCPagar.AsBoolean)     and not(tUsuarioRelNEntrNatOper.AsBoolean) and
     not(tUsuarioRelCPagForn.AsBoolean)   and not(tUsuarioRelPgtoJuros.AsBoolean)    and
     not(tUsuarioRelTransfICMS.AsBoolean) then
    fMenuP.N4Relatrios1.Visible := False
  else
    fMenuP.N4Relatrios1.Visible := True;
  if not(tUsuarioCPagar.AsBoolean)          and not(tUsuarioLctoPagar.AsBoolean)     and
     not(tUsuarioRelCPagar.AsBoolean)     and
     not(tUsuarioRelNEntrNatOper.AsBoolean) and not(tUsuarioRelCPagForn.AsBoolean)   and
     not(tUsuarioRelPgtoJuros.AsBoolean)    and not(tUsuarioRelTransfICMS.AsBoolean) then
    fMenuP.RxSpeedButton6.Visible := False
  else
    fMenuP.RxSpeedButton6.Visible := True;
// Financeiro
  fMenuP.Contas3.Visible              := tUsuarioContas.AsBoolean;
  fMenuP.EntradadeMovimentos2.Visible := tUsuarioEntrMov.AsBoolean;
  fMenuP.N3Indexador2.Visible         := tUsuarioIndexador.AsBoolean;
  fMenuP.Juros1.Visible               := tUsuarioJuros.AsBoolean;
  fMenuP.Movimentos2.Visible          := tUsuarioMovto.AsBoolean;
  fMenuP.PlanodeContas2.Visible       := tUsuarioPlanoCtas.AsBoolean;
  fMenuP.Contas4.Visible              := tUsuarioRelCtas.AsBoolean;//Botão
  if not(tUsuarioRelCtas.AsBoolean) then
    fMenuP.Relatrios10.Visible := False
  else
    fMenuP.Relatrios10.Visible := True;
  if not(tUsuarioContas.AsBoolean)    and not(tUsuarioEntrMov.AsBoolean) and
     not(tUsuarioJuros.AsBoolean)     and not(tUsuarioMovto.AsBoolean)   and
     not(tUsuarioPlanoCtas.AsBoolean) and not(tUsuarioRelCtas.AsBoolean) and
     not(tUsuarioIndexador.AsBoolean) then
    fMenuP.RxSpeedButton7.Visible := False
  else
    fMenuP.RxSpeedButton7.Visible := True;
  fMenuP.Sair1.Visible := tUsuarioAdministrador.AsBoolean;
end;

procedure TDM1.tGrupoAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tGrupo.Handle);
end;

procedure TDM1.tSubGrupoAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tSubGrupo.Handle);
end;

procedure TDM1.tFornecedoresAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tFornecedores.Handle);
end;

procedure TDM1.tMaterialAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tMaterial.Handle);
end;

procedure TDM1.tGradeAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tGrade.Handle);
end;

procedure TDM1.tGradeItemAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tGradeItem.Handle);
end;

procedure TDM1.tCorAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tCor.Handle);
end;

procedure TDM1.tGradeItemBeforePost(DataSet: TDataSet);
begin
  if tGradeItem.State in [dsInsert] then
  begin
   fGrade.tGradeItemIns.Refresh;
   fGrade.tGradeItemIns.Last;
   tGradeItemPosicao.AsInteger := fGrade.tGradeItemInsPosicao.AsInteger + 1;
  end;
end;

procedure TDM1.tMaterialCorAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tMaterialCor.Handle);
end;

procedure TDM1.tCondPgtoAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tCondPgto.Handle);
end;

procedure TDM1.tCondPgtoItemAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tCondPgtoItem.Handle);
end;

procedure TDM1.tCondPgtoItemBeforePost(DataSet: TDataSet);
begin
  if tCondPgtoItem.State in [dsInsert] then
    begin
     fCondPgto.tCondPgtoItemIns.Refresh;
     fCondPgto.tCondPgtoItemIns.Last;
     tCondPgtoItemItem.AsInteger := fCondPgto.tCondPgtoItemInsItem.AsInteger + 1;
    end;
end;

procedure TDM1.tTranspAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tTransp.Handle);
end;

procedure TDM1.tOrdemCompraAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tOrdemCompra.Handle);
end;

procedure TDM1.tOrdemCompraItemAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tOrdemCompraItem.Handle);
end;

procedure TDM1.tOrdemCompraItemGradeAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tOrdemCompraItemGrade.Handle);
end;

procedure TDM1.tClasFiscalAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tClasFiscal.Handle);
end;

procedure TDM1.tSitTributariaAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tSitTributaria.Handle);
end;

procedure TDM1.tProdutoAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tProduto.Handle);
end;

procedure TDM1.tProdutoCorAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tProdutoCor.Handle);
end;

procedure TDM1.tMaterialGradeNumAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tMaterialGradeNum.Handle);
end;

procedure TDM1.tProdutoMatAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tProdutoMat.Handle);
end;

procedure TDM1.tProdutoMatTamAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tProdutoMatTam.Handle);
end;

procedure TDM1.tProdutoMatBeforeDelete(DataSet: TDataSet);
begin
  DM1.tProdutoMatTam.First;
  while not DM1.tProdutoMatTam.Eof do
    DM1.tProdutoMatTam.Delete;
end;

procedure TDM1.tPedidoAfterPost(DataSet: TDataSet);
begin
  DbiSaveChanges(tPedido.Handle);
end;

procedure TDM1.tPedidoDescontoAfterPost(DataSet: TDataSet);
begin
  DbiSaveChanges(tPedidoDesconto.Handle);
end;

procedure TDM1.tPedidoGradeAfterPost(DataSet: TDataSet);
begin
  DbiSaveChanges(tPedidoGrade.Handle);
end;

procedure TDM1.tPedidoItemAfterPost(DataSet: TDataSet);
begin
  DbiSaveChanges(tPedidoItem.Handle);
end;

procedure TDM1.tPedidoMaterialAfterPost(DataSet: TDataSet);
begin
  DbiSaveChanges(tPedidoMaterial.Handle);
end;

procedure TDM1.tPedidoParcAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tPedidoParc.Handle);
end;

procedure TDM1.tClienteAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tCliente.Handle);
end;

procedure TDM1.tPedidoParcAfterInsert(DataSet: TDataSet);
begin
  fPedido.tPedidoParcIns.Refresh;
  fPedido.tPedidoParcIns.Last;
  tPedidoParcItem.AsInteger := fPedido.tPedidoParcInsItem.AsInteger + 1;
end;

procedure TDM1.tPedidoDescontoAfterInsert(DataSet: TDataSet);
begin
  fPedido.tPedidoDescontoIns.Refresh;
  fPedido.tPedidoDescontoIns.Last;
  tPedidoDescontoItem.AsInteger := fPedido.tPedidoDescontoInsItem.AsInteger + 1;
end;

procedure TDM1.tPedidoDescontoBeforePost(DataSet: TDataSet);
begin
  if (tPedidoDescontoPercDesconto.AsFloat = 0) or (tPedidoDescontoPercDesconto.AsString = '') then
    fPedidoDesconto.BitBtn1.SetFocus;
end;

procedure TDM1.tUsuarioAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tUsuario.Handle);
end;

procedure TDM1.tUsuarioAltAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tUsuarioAlt.Handle)
end;

procedure TDM1.tUsuarioExcAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tUsuarioExc.Handle)
end;

procedure TDM1.tUsuarioInsAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tUsuarioIns.Handle)
end;

procedure TDM1.tEmpresaAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tEmpresa.Handle)
end;

procedure TDM1.tNatOperacaoAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tNatOperacao.Handle)
end;

procedure TDM1.tVendedorAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tVendedor.Handle)
end;

procedure TDM1.tLoteAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tLote.Handle);
end;

procedure TDM1.tLotePedidoAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tLotePedido.Handle);
end;

procedure TDM1.tTalaoAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tTalao.Handle);
end;

procedure TDM1.tTalaoGradeAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tTalaoGrade.Handle);
end;

procedure TDM1.tSetorAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tSetor.Handle);
end;

procedure TDM1.tTipoCobrancaAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tTipoCobranca.Handle);
end;

procedure TDM1.tHistoricoAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tHistorico.Handle);
end;

procedure TDM1.tNotaFiscalAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tNotaFiscal.Handle);
end;

procedure TDM1.tCReceberParcAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tCReceberParc.Handle);
end;

procedure TDM1.tIndexadorAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tIndexador.Handle);
end;

procedure TDM1.tUFAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tUF.Handle);
end;

procedure TDM1.tNotaFiscalItensAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tNotaFiscalItens.Handle);
end;

procedure TDM1.tNotaFiscalParcAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tNotaFiscalParc.Handle);
end;

procedure TDM1.tParametrosAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tParametros.Handle);
end;

procedure TDM1.tContasAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tContas.Handle);
end;

procedure TDM1.tMovimentosAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tMovimentos.Handle);
end;

procedure TDM1.tCReceberAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tCReceber.Handle);
end;

procedure TDM1.tPlanoContasAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tPlanoContas.Handle);
end;

procedure TDM1.tCPagarAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tCPagar.Handle);
end;

procedure TDM1.tCPagarParcAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tCPagarParc.Handle);
end;

procedure TDM1.tFluxoFuturoAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tFluxoFuturo.Handle);
end;

procedure TDM1.tNEntradaParcAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tNEntradaParc.Handle);
end;

procedure TDM1.tNEntradaAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tNEntrada.Handle);
end;

procedure TDM1.tNEntradaItensMobraAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tNEntradaItensMObra.Handle);
end;

procedure TDM1.tNEntradaItensAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tNEntradaItens.Handle);
end;

procedure TDM1.tNEntradaParcBeforePost(DataSet: TDataSet);
begin
  if tNEntradaParcNroDuplicata.AsInteger = 0 then
    tNEntradaParcNroDuplicata.AsInteger := tNEntradaParcNumNEntr.AsInteger;
  if tNEntradaParc.State = dsInsert then
    fNotaEntrada.Verifica_Parcelas;
  tNEntradaParcNumNEntr.AsInteger := tNEntradaNumNEntr.AsInteger;
  tNEntradaParcCodForn.AsInteger  := tNEntradaCodForn.AsInteger;
end;

procedure TDM1.tCReceberParcHistAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tCReceberParcHist.Handle);
end;

procedure TDM1.tImpressoraAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tImpressora.Handle);
end;

procedure TDM1.tCReceberParcCalcFields(DataSet: TDataSet);
begin
  {if not tCReceberParcQuitParcCReceber.AsBoolean then
    begin
      tCReceberParcclDiasAtraso.AsFloat := Date - tCReceberParcDtVencCReceber.AsDateTime;
      if tCReceberParcclDiasAtraso.AsFloat <= 0 then
        tCReceberParcclDiasAtraso.AsFloat := 0;
    end
  else
    begin
      tCReceberParcclDiasAtraso.AsFloat := tCReceberParcDtPagParcCReceber.AsDateTime - tCReceberParcDtVencCReceber.AsDateTime;
      if tCReceberParcclDiasAtraso.AsFloat <= 0 then
        tCReceberParcclDiasAtraso.AsFloat := 0;
    end;}
end;

procedure TDM1.tJurosAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tJuros.Handle);
end;

procedure TDM1.tLojasAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tLojas.Handle);
end;

procedure TDM1.tRegioesAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tRegioes.Handle);
end;

procedure TDM1.tExtComissaoModAfterPost(DataSet: TDataSet);
begin
  DbiSaveChanges(tExtComissaoMod.Handle);
end;

procedure TDM1.tPedidoNotaAfterPost(DataSet: TDataSet);
begin
  DbiSaveChanges(tPedidoNota.Handle);
end;

procedure TDM1.tCPagarParcCalcFields(DataSet: TDataSet);
begin
  if not tCPagarParcQuitParcCPagar.AsBoolean then
    begin
      tCPagarParcclDiasAtraso.AsFloat := Date - tCPagarParcDtVencCPagar.AsDateTime;
      if tCPagarParcclDiasAtraso.AsFloat <= 0 then
        tCPagarParcclDiasAtraso.AsFloat := 0;
    end
  else
    begin
      tCPagarParcclDiasAtraso.AsFloat := tCPagarParcDtPagParcCPagar.AsDateTime - tCPagarParcDtVencCPagar.AsDateTime;
      if tCPagarParcclDiasAtraso.AsFloat <= 0 then
        tCPagarParcclDiasAtraso.AsFloat := 0;
    end;
end;

procedure TDM1.tOrdemCompraNotaAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tOrdemCompraNota.Handle);
end;

procedure TDM1.tOrdemCompraNotaGradeAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tOrdemCompraNotaGrade.Handle);
end;

procedure TDM1.tObsAuxAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tObsAux.Handle);
end;

procedure TDM1.tAtelierAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tAtelier.Handle);
end;

procedure TDM1.tTalaoMovAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tTalaoMov.Handle);
end;

procedure TDM1.tAtividadeAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tAtividade.Handle);
end;

procedure TDM1.tReqItemAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tReqItem.Handle);
end;

procedure TDM1.tReqItemGradeAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tReqItemGrade.Handle);
end;

procedure TDM1.tFornecAtivAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tFornecAtiv.Handle);
end;

procedure TDM1.tAtelierPrecoAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tAtelierPreco.Handle);
end;

procedure TDM1.tReqAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tReq.Handle);
end;

procedure TDM1.tProdutoMatCalcFields(DataSet: TDataSet);
begin
  if tProdutoMatQtd.AsFloat > 0 then
    tProdutoMatclQtdPr.AsFloat := 1 / tProdutoMatQtd.AsFloat;
end;

procedure TDM1.tModelistaAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tModelista.Handle);
end;

procedure TDM1.tLoteSetorAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tLoteSetor.Handle);
end;

procedure TDM1.tProdutoSetorAfterPost(DataSet: TDataSet);
begin
  if not tProdutoSetorlkImpTalao.AsBoolean then
    begin
      ShowMessage('Este setor não pode ser gravado na ficha técnica');
      tProdutoSetor.Delete;
    end
  else
    DBISaveChanges(tProdutoSetor.Handle);
end;

procedure TDM1.tMaoDeObraAfterPost(DataSet: TDataSet);
begin
  DBIsaveChanges(tMaoDeObra.Handle);
end;

procedure TDM1.tLoteMIAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tLoteMI.Handle);
end;

procedure TDM1.tLotePedidoMIAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tLotePedidoMI.Handle);
end;

procedure TDM1.tLoteSetorMIAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tLoteSetorMI.Handle);
end;

procedure TDM1.tTalaoMIAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tTalaoMI.Handle);
end;

procedure TDM1.tTalaoGradeMIAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tTalaoGradeMI.Handle);
end;

procedure TDM1.tTalaoMovMIAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tTalaoMovMI.Handle);
end;

procedure TDM1.tNotaFiscalGradeAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tNotaFiscalGrade.Handle);
end;

procedure TDM1.tPosicaoAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tPosicao.Handle);
end;

procedure TDM1.tCidadeAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tCidade.Handle);
end;

procedure TDM1.tOperAtelierAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tOperAtelier.Handle);
end;

procedure TDM1.tDctoEstAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tDctoEst.Handle);
end;

procedure TDM1.tDctoEstItemAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tDctoEstItem.Handle);
end;

procedure TDM1.tDctoEstGradeAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tDctoEstGrade.Handle);
end;

procedure TDM1.tEstoqueMatMovAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tEstoqueMatMov.Handle);
end;

procedure TDM1.tEstoqueMatMovGradeAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tEstoqueMatMovGrade.Handle);
end;

procedure TDM1.tProdutoMetaAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tProdutoMeta.Handle);
end;

procedure TDM1.tPedAmostraAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tPedAmostra.Handle);
end;

procedure TDM1.tPedAmostraItAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tPedAmostraIt.Handle);
end;

procedure TDM1.tPedAmostraMatAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tPedAmostraMat.Handle);
end;

procedure TDM1.tPedAmostraGradeAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tPedAmostraGrade.Handle);
end;

procedure TDM1.tOutrosAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tOutros.Handle);
end;

procedure TDM1.tExtComissaoAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tExtComissao.Handle);
end;

procedure TDM1.tFabricaAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tFabrica.Handle);
end;

procedure TDM1.tOSGradeAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tOSGrade.Handle);
end;

procedure TDM1.tOSAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tOS.Handle);
end;

procedure TDM1.tOSItensAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tOSItens.Handle);
end;

procedure TDM1.tCPagarParcHistAfterPost(DataSet: TDataSet);
begin
  DbiSaveChanges(tCPagarParcHist.Handle);
end;

procedure TDM1.tMaterialUMAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tMaterialUm.Handle);
end;

procedure TDM1.tNEntradaItensGradeAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tNEntradaItensGrade.Handle);
end;

procedure TDM1.tRelacaoGeralAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tRelacaoGeral.Handle);
end;

procedure TDM1.tDevolucaoAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tDevolucao.Handle);
end;

procedure TDM1.tDevolucaoProdAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tDevolucaoProd.Handle);
end;

procedure TDM1.tDefeitosAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tDefeitos.Handle);
end;

procedure TDM1.tProdutoTamAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tProdutoTam.Handle);
end;

procedure TDM1.tOrdemCompraItemNewRecord(DataSet: TDataSet);
begin
  tOrdemCompraItemQtd.AsFloat         := 0;
  tOrdemCompraItemQtdEntregue.AsFloat := 0;
  tOrdemCompraItemQtdRestante.AsFloat := 0;
  tOrdemCompraItemVlrUnitario.AsFloat := 0;
  tOrdemCompraItemVlrTotal.AsFloat    := 0;
end;

procedure TDM1.tOrdemCompraItemGradeNewRecord(DataSet: TDataSet);
begin
  tOrdemCompraItemGradeQtd.AsFloat         := 0;
  tOrdemCompraItemGradeQtdEntregue.AsFloat := 0;
  tOrdemCompraItemGradeQtdRestante.AsFloat := 0;
end;

procedure TDM1.RLPreviewSetup1Send(Sender: TObject);
begin
  TFormSendMailOptions.CreateShowAndFree(TRLPreviewForm(Sender).Preview.Pages);
end;

procedure TDM1.tOrdImpTalaoAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tOrdImpTalao.Handle);
end;

procedure TDM1.tVendedorNewRecord(DataSet: TDataSet);
begin
  DM1.tVendedorPagarParteNaNota.AsBoolean := False;
  DM1.tVendedorTipoComissao.AsString      := 'D';
  DM1.tVendedorPagarParteNaNota.AsBoolean := True;
  DM1.tVendedorInativo.AsBoolean          := False;
end;

procedure TDM1.tCReceberNewRecord(DataSet: TDataSet);
begin
  DM1.tCReceberPercBaseComissao.AsCurrency := 100;
end;

procedure TDM1.tCReceberParcHistNewRecord(DataSet: TDataSet);
begin
  DM1.tCReceberParcHistNroLancExtComissao.AsInteger := 0;
end;

procedure TDM1.tNatOperacaoNewRecord(DataSet: TDataSet);
begin
  DM1.tNatOperacaoCalcComissao.AsBoolean  := True;
  DM1.tNatOperacaoGeraDuplicata.AsBoolean := False;
  DM1.tNatOperacaoIcms.AsBoolean          := False;
  DM1.tNatOperacaoIpi.AsBoolean           := False;
  DM1.tNatOperacaoGeraEstoque.AsBoolean   := False;
end;

procedure TDM1.tNEntradaNewRecord(DataSet: TDataSet);
begin
  tNEntradaCondPgto.AsString := 'P';
  tNEntradaFilial.AsInteger  := 0;
end;

procedure TDM1.tExcComissaoModAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tExcComissaoMod.Handle);
end;

procedure TDM1.tExtComissaoModNewRecord(DataSet: TDataSet);
begin
  tExtComissaoModParcela.AsInteger          := 0;
  tExtComissaoModItemHistCReceber.AsInteger := 0;
end;

procedure TDM1.tCPagarNewRecord(DataSet: TDataSet);
begin
  tCPagarVlrTotal.AsFloat         := 0;
  tCPagarNumSeqNEntrada.AsInteger := 0;
  tCPagarSerie.AsString           := '';
end;

procedure TDM1.tNotaFiscalNewRecord(DataSet: TDataSet);
begin
  tNotaFiscalPedidoCliente.AsString := '';
  tNotaFiscalTipoNota.AsInteger     := 1;

  DM1.tNotaFiscalVlrTransf.AsFloat          := 0;
  DM1.tNotaFiscalCancelada.AsBoolean        := False;
  DM1.tNotaFiscalObs.AsString               := '';
  DM1.tNotaFiscalBaseIcmsSimples.AsFloat    := 0;
  DM1.tNotaFiscalVlrIcmsSimples.AsFloat     := 0;
  DM1.tNotaFiscalFinalidade.AsString        := '1';
  DM1.tNotaFiscalVlrPis.AsFloat             := 0;
  DM1.tNotaFiscalVlrCofins.AsFloat          := 0;
  DM1.tNotaFiscalBaseIcmsOutros.AsFloat     := 0;
  DM1.tNotaFiscalVlrIcmsOutros.AsFloat      := 0;
  DM1.tNotaFiscalVlrDuplicataOutros.AsFloat := 0;
  DM1.tNotaFiscalTipoDesconto.AsString      := '';
  DM1.tNotaFiscalGeraDupl_Frete.AsBoolean         := False;
  DM1.tNotaFiscalGeraDupl_OutrosValores.AsBoolean := False;
  DM1.tNotaFiscalGeraDupl_PisCofins.AsBoolean     := False;
  DM1.tNotaFiscalGeraDupl_Seguro.AsBoolean        := False;
  DM1.tNotaFiscalNFeDenegada.AsBoolean            := False;

  //3.10   21/03/2015
  DM1.tNotaFiscalTIPO_ATENDIMENTO.AsInteger := 0; 
end;

procedure TDM1.tConstrucaoMatAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tConstrucaoMat.Handle);
end;

procedure TDM1.tConstrucaoMatNewRecord(DataSet: TDataSet);
begin
  DM1.tConstrucaoMatCodCor.AsInteger     := 0;
  DM1.tConstrucaoMatQtd.AsFloat          := 0;
  DM1.tConstrucaoMatCodPosicao.AsInteger := 0;
end;

procedure TDM1.tConstrucaoGrupoAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tConstrucaoGrupo.Handle);
end;

procedure TDM1.tConstrucaoAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tConstrucao.Handle);
end;

procedure TDM1.tCReceberParcBeforePost(DataSet: TDataSet);
begin
  if StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat)) <= 0 then
    DM1.tCReceberParcRestParcela.AsFloat := StrToFloat(FormatFloat('0.00',0));
end;

procedure TDM1.tNotaFiscalItensNewRecord(DataSet: TDataSet);
begin
  tNotaFiscalItensGeraDuplicata.AsBoolean  := True;
  tNotaFiscalItensVLR_ICMSDIFERIDO.AsFloat := 0;
end;

procedure TDM1.tConfirmacaoAfterInsert(DataSet: TDataSet);
begin
  dm2.qGeral.Sql.Text := 'SELECT MAX(ID) ULT FROM DBCONFIRMACAO';
  dm2.qGeral.Open;
  tConfirmacaoId.AsInteger    := dm2.qGeral.FieldByName('ULT').AsInteger + 1;
  tConfirmacaoData.AsDateTime := Date;
  tConfirmacaoHora.AsDateTime := Now;
  tConfirmacao.Post;
  tConfirmacao.Edit;
end;

procedure TDM1.tProdutoNewRecord(DataSet: TDataSet);
begin
  tProdutoDtCadastro.AsDateTime      := Date;
  tProdutoCadastroCompleto.AsBoolean := False;
  tProdutoInativo.AsBoolean          := False;
  tProdutoOrigemProd.AsString        := '0';
end;

procedure TDM1.tFichaConsumoAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tFichaConsumo.Handle);
end;

procedure TDM1.tTipoMaterialAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tTipoMaterial.Handle);
end;

procedure TDM1.tFichaConsumoMatAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tFichaConsumoMat.Handle);
end;

procedure TDM1.tMaterialNewRecord(DataSet: TDataSet);
begin
  tMaterialInativo.AsBoolean               := False;
  tMaterialImpTalaoAuxiliar.AsBoolean      := False;
  tMaterialImpGradeTalaoAuxiliar.AsBoolean := False;
  tMaterialUsuario.AsString                := tUsuarioUsuario.AsString;
  tMaterialCorreto.AsBoolean               := True;
  tMaterialDtAlteracao_Preco.Clear;
end;

procedure TDM1.tCPagarParcNewRecord(DataSet: TDataSet);
begin
  tCPagarParcNumSeqNEntrada.AsInteger := 0;
  tCPagarParcSerie.AsString           := '';
end;

procedure TDM1.tProdutoTipoMatAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tProdutoTipoMat.Handle);
end;

procedure TDM1.tTalaoAuxiliarAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tTalaoAuxiliar.Handle);
end;

procedure TDM1.tTalaoAuxiliarGradeAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tTalaoAuxiliarGrade.Handle);
end;

procedure TDM1.tProdutoSetorAuxAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tProdutoSetorAux.Handle);
end;

procedure TDM1.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  SR: TSearchRec;
  vIndices: string;
  aIndices: array of string;
begin
  FDataSetError := TrsDataSetError.Create;
  FDataSetError.CreateError(Self);

  LogProviderList.OnAdditionalValues := DoLogAdditionalValues;

  for i := 0 to (Self.ComponentCount - 1) do
  begin
    if (Self.Components[i] is TTable) then
    begin
      SetLength(aIndices, 0);
      vIndices := TTable(Components[i]).IndexFieldNames;
      while (vIndices <> EmptyStr) do
      begin
        SetLength(aIndices, Length(aIndices) + 1);
        x := Pos(';', vIndices);
        if (x = 0) then
        begin
          aIndices[Length(aIndices) - 1] := vIndices;
          vIndices := EmptyStr;
        end
        else
        begin
          aIndices[Length(aIndices) - 1] := Copy(vIndices, 1, x - 1);
          vIndices := Copy(vIndices, x + 1, MaxInt);
        end;
      end;
      LogProviderList.AddProvider(TTable(Self.Components[i]), TTable(Self.Components[i]).TableName, aIndices);
    end;
  end;
end;

procedure TDM1.GravaEnt_tCReceberParcHist(Tipo: String);
begin
//
end;

procedure TDM1.tCSTIPIAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tCSTIPI.Handle);
end;

procedure TDM1.tCalcMaterialAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tCalcMaterial.Handle);
end;

procedure TDM1.tPercSimplesAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tPercSimples.Handle);
end;

procedure TDM1.tNotaFiscalItensBeforePost(DataSet: TDataSet);
begin
  tNotaFiscalItensGeraDuplicata.AsBoolean := tNotaFiscalItensGeraDupl.AsBoolean;
end;

procedure TDM1.tClienteNewRecord(DataSet: TDataSet);
begin
  DM1.tClienteIDPais.AsInteger := 1;
  //3.10   21/03/2015
  DM1.tClienteTipo_Consumidor.AsInteger := 0;
end;

procedure TDM1.tTranspNewRecord(DataSet: TDataSet);
begin
  DM1.tTranspIDPais.AsInteger := 1;
end;

procedure TDM1.tFornecedoresNewRecord(DataSet: TDataSet);
begin
  DM1.tFornecedoresIDPais.AsInteger  := 1;
  DM1.tFornecedoresUsuario.AsString  := DM1.tUsuarioUsuario.AsString;
  DM1.tFornecedoresDtCad.AsDateTime  := Date;
  DM1.tFornecedoresHrCad.AsDateTime  := Now;
  DM1.tFornecedoresCliente.AsBoolean := False;
  //3.10  21/03/2015
  DM1.tFornecedoresTIPO_CONSUMIDOR.AsInteger := 0;
end;

procedure TDM1.tCPagarParcBeforePost(DataSet: TDataSet);
begin
  if DM1.tCPagarDtGerado.AsDateTime > 10 then
    DM1.tCPagarParcDtGerado.AsDateTime := DM1.tCPagarDtGerado.AsDateTime;
end;

procedure TDM1.tOrdemCompraNewRecord(DataSet: TDataSet);
begin
  tOrdemCompraFilial.AsInteger := 1;
end;

procedure TDM1.tEstoqueMatMovGradeNewRecord(DataSet: TDataSet);
begin
  tEstoqueMatMovGradeQtd.AsInteger  := 0;
  tEstoqueMatMovGradeQtd2.AsInteger := 0;
end;

procedure TDM1.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := tUsuarioUsuario.AsString;
end;

procedure TDM1.tFilialDepAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tFilialDep.Handle);
end;

procedure TDM1.tCalcMaterialNewRecord(DataSet: TDataSet);
begin
  tCalcMaterialQtdOC.AsFloat := StrToFloat(FormatFloat('0',0));
end;

procedure TDM1.tConfirmacaoAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tConfirmacao.Handle);
end;

procedure TDM1.tFilial_DownloadAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tFilial_Download.Handle);
end;

end.

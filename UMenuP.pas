unit UMenuP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus, StdCtrls, DBCtrls, ExtCtrls, DBTables,
  DBIProcs, Buttons, Grids, DBGrids, SpeedBar, RXCtrls, MemTable, Db, jpeg, rlConsts;

type
  TfMenuP = class(TForm)
    MainMenu1: TMainMenu;
    Sobre1: TMenuItem;
    Sair1: TMenuItem;
    Bevel1: TBevel;
    RxSpeedButton1: TRxSpeedButton;
    RxSpeedButton2: TRxSpeedButton;
    RxSpeedButton3: TRxSpeedButton;
    RxSpeedButton4: TRxSpeedButton;
    RxSpeedButton5: TRxSpeedButton;
    RxSpeedButton6: TRxSpeedButton;
    RxSpeedButton7: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    Grupo2: TMenuItem;
    SubGrupos2: TMenuItem;
    Clientes3: TMenuItem;
    Grades1: TMenuItem;
    Cor2: TMenuItem;
    CondiesdePagamento1: TMenuItem;
    Impressoras2: TMenuItem;
    Transportadoras2: TMenuItem;
    ClassificaoFiscal2: TMenuItem;
    SituaoTributria2: TMenuItem;
    NaturezadeOperao2: TMenuItem;
    EstadoseAlqotas2: TMenuItem;
    Relatrios6: TMenuItem;
    Clientes4: TMenuItem;
    Vendedores4: TMenuItem;
    PopupMenu2: TPopupMenu;
    Fornecedores3: TMenuItem;
    Materiais3: TMenuItem;
    OrdemdeCompra2: TMenuItem;
    Relatrios7: TMenuItem;
    Fornecedores4: TMenuItem;
    Materiais4: TMenuItem;
    PopupMenu3: TPopupMenu;
    Pedido2: TMenuItem;
    GerarLote2: TMenuItem;
    Setor2: TMenuItem;
    ProdutosFichaTcnica1: TMenuItem;
    Relatrios8: TMenuItem;
    ClculodeMateriaispLotes1: TMenuItem;
    Rtulos2: TMenuItem;
    PopupMenu4: TPopupMenu;
    NotasFiscais2: TMenuItem;
    PopupMenu5: TPopupMenu;
    LancaCtasaReceber1: TMenuItem;
    TipodeCobranas1: TMenuItem;
    Relatrios9: TMenuItem;
    Duplicatas2: TMenuItem;
    PopupMenu6: TPopupMenu;
    ContasaPagar3: TMenuItem;
    LanaCtasaPagar1: TMenuItem;
    PopupMenu7: TPopupMenu;
    RxSpeedButton9: TRxSpeedButton;
    Contas3: TMenuItem;
    PlanodeContas2: TMenuItem;
    Movimentos2: TMenuItem;
    EntradadeMovimentos2: TMenuItem;
    Relatrios10: TMenuItem;
    Contas4: TMenuItem;
    ConsLote1: TMenuItem;
    VendasporVendedor1: TMenuItem;
    VendasporVendedorReferncia1: TMenuItem;
    VendaspoVendedorCliente1: TMenuItem;
    Relatrios11: TMenuItem;
    Notasemitidasporvendedor1: TMenuItem;
    Juros1: TMenuItem;
    Notasemitidaspornaturezadeoperao1: TMenuItem;
    RededeLojas1: TMenuItem;
    RegiesdeVendas2: TMenuItem;
    tEmpresa: TTable;
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
    Parametros1: TMenuItem;
    Consultafatdirio1: TMenuItem;
    Pedidosnofaturados1: TMenuItem;
    BaixaPedidos1: TMenuItem;
    EtiquetasClientes1: TMenuItem;
    EtiquetasVendedores1: TMenuItem;
    N1: TMenuItem;
    N7GerarArquivos1: TMenuItem;
    RxSpeedButton8: TRxSpeedButton;
    PopupMenu8: TPopupMenu;
    N1Vendedor1: TMenuItem;
    LanamentodeComisses1: TMenuItem;
    Relatrios13: TMenuItem;
    ExtratodeComisso1: TMenuItem;
    ExtratodeVendedoresNotas1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    Modelista1: TMenuItem;
    N7ComissoModelista1: TMenuItem;
    N8LanamentodeComissoModelista1: TMenuItem;
    N19: TMenuItem;
    N91: TMenuItem;
    Relatriode1: TMenuItem;
    N21: TMenuItem;
    N4Relatrios1: TMenuItem;
    N1ContasPagar1: TMenuItem;
    N2Histricos2: TMenuItem;
    N2NotasporNaturezadeOperao1: TMenuItem;
    N5ContasaReeber1: TMenuItem;
    N23: TMenuItem;
    N6AReceberporCliente1: TMenuItem;
    N3APagarporFornecedores1: TMenuItem;
    N25: TMenuItem;
    N4PagamentodeJuros2: TMenuItem;
    N5EtiquetasFornecedores1: TMenuItem;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    ObsAuxiliar1: TMenuItem;
    ALogin1: TMenuItem;
    N3NotadeCompra1: TMenuItem;
    N1Atelier2: TMenuItem;
    N6MovimentodeTales2: TMenuItem;
    N2ConsultaLoteExportao2: TMenuItem;
    N4GerarLoteExportao2: TMenuItem;
    N6Requisio1: TMenuItem;
    N1Atividades2: TMenuItem;
    N3Indexador2: TMenuItem;
    N3ConsultadeFornecpAtividade2: TMenuItem;
    N4ConsultaMovimentodeTales2: TMenuItem;
    N4MateriaisAbaixodoMnimo2: TMenuItem;
    N3ConsultadeEstoquedeMateriais2: TMenuItem;
    N5HistricodoMaterial1: TMenuItem;
    N0MetasProduzidos1: TMenuItem;
    ASituaodoAtelier1: TMenuItem;
    N3CustoporSetor1: TMenuItem;
    ModeObra1: TMenuItem;
    ConsMovimentoTalesMercInterno1: TMenuItem;
    N7NotadeEntrada1: TMenuItem;
    Posies1: TMenuItem;
    N1ClculodeMateriaisporPedido1: TMenuItem;
    N2Cidades2: TMenuItem;
    DOperaesdeAtelier1: TMenuItem;
    N5PlanejamentoProgramao1: TMenuItem;
    N3EtiquetasparaCaixas1: TMenuItem;
    N7Pr1: TMenuItem;
    DctodeEntradaeSadadoEstoque1: TMenuItem;
    N1AgendaTelefnica1: TMenuItem;
    N1CpiasdeDuplicatas1: TMenuItem;
    N8BalancodoEstoque1: TMenuItem;
    PedidodeAmostra1: TMenuItem;
    N5MetasProduzidosReferncia1: TMenuItem;
    N9OrdensdeCompra1: TMenuItem;
    ATalesdeAmostra1: TMenuItem;
    N4ConsultaHistricodosMateriais1: TMenuItem;
    N2ClientesporReferncia1: TMenuItem;
    N2ConsultaHistricodosClientes1: TMenuItem;
    N9Fbricas1: TMenuItem;
    N0RefAcumuladaporFbrica2: TMenuItem;
    BOrdemdeServio2: TMenuItem;
    N7PedidosEmbarcadospPerodo2: TMenuItem;
    AProdutosporColeoeMercado2: TMenuItem;
    N1ICMS1: TMenuItem;
    N6Devolues1: TMenuItem;
    N6Defeitos2: TMenuItem;
    N5TransfernciadeICMS1: TMenuItem;
    N6Construo1: TMenuItem;
    CProjeo1: TMenuItem;
    N5EstoqueIntermedirio1: TMenuItem;
    N0PrevisoOC1: TMenuItem;
    PrevisodeComisso1: TMenuItem;
    EstoqueIntermedirioMercInterno1: TMenuItem;
    Faturamento2: TMenuItem;
    RtulosImpressoraTrmica1: TMenuItem;
    N26: TMenuItem;
    ConsultaOrdemdeCompraPendetesEntregues1: TMenuItem;
    ContasaReceberNovo1: TMenuItem;
    N28: TMenuItem;
    ConsultaFaturamento1: TMenuItem;
    MovimentoSetor1: TMenuItem;
    ArmazenamentodeReferncias2: TMenuItem;
    Confirmao2: TMenuItem;
    LocalizaodeNavalhas2: TMenuItem;
    N30: TMenuItem;
    FichaConsumodeMateriais2: TMenuItem;
    VendasporVendedorModelo2: TMenuItem;
    ConsultaSituaodosPedidos2: TMenuItem;
    AlteraodeFbricaTales1: TMenuItem;
    ConsultaEstoqueporPerodo1: TMenuItem;
    ContasaPagarNovo1: TMenuItem;
    ipodeMaterial1: TMenuItem;
    ipoMaterialProduto1: TMenuItem;
    N2: TMenuItem;
    Programao1: TMenuItem;
    BaixaTaloAuxiliar1: TMenuItem;
    ConsultaBaixaTaloAuxiliar1: TMenuItem;
    N9: TMenuItem;
    ConsultaMaterialNaFichaTcnica1: TMenuItem;
    RelProduo1: TMenuItem;
    ConsultaLoteProduzidoPendente1: TMenuItem;
    Filial1: TMenuItem;
    Pasees1: TMenuItem;
    Image1: TImage;
    CadastrodeItensdeAjusteComplementar1: TMenuItem;
    DuplicatasWindows1: TMenuItem;
    BitBtn1: TBitBtn;
    ClculodeMateriaisporLote1: TMenuItem;
    N10: TMenuItem;
    CadastrodeTributos1: TMenuItem;
    CSOSN: TMenuItem;
    OrigemMercadoria1: TMenuItem;
    PercentualSimples1: TMenuItem;
    RegimeTributrio1: TMenuItem;
    abelaCofins1: TMenuItem;
    abelaPis1: TMenuItem;
    N11: TMenuItem;
    InutilizarNumeraodeNota1: TMenuItem;
    BitBtn2: TBitBtn;
    Compania1: TMenuItem;
    EmailsNFe1: TMenuItem;
    N12: TMenuItem;
    FichaTcnicadeConstruo1: TMenuItem;
    PosioFichadeTcnicadeConstruo1: TMenuItem;
    NFeEmailsAdicionais1: TMenuItem;
    N13: TMenuItem;
    GerarEstoqueEFDSPED1: TMenuItem;
    BitBtn3: TBitBtn;
    ProdutosVendidos1: TMenuItem;
    ConsultaMaterialPorPerodo1: TMenuItem;
    Etiqueta1: TMenuItem;
    BitBtn4: TBitBtn;
    Prnovo1: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    EnquadramentoIP1: TMenuItem;
    BitBtn7: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Grupo1Click(Sender: TObject);
    procedure SubGrupos1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Cor1Click(Sender: TObject);
    procedure Impressoras1Click(Sender: TObject);
    procedure Transportadoras1Click(Sender: TObject);
    procedure ClassificaoFiscal1Click(Sender: TObject);
    procedure SituaoTributria1Click(Sender: TObject);
    procedure NaturezadeOperao1Click(Sender: TObject);
    procedure EstadoseAlqotas1Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
    procedure Vendedores2Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure Materiais1Click(Sender: TObject);
    procedure OrdemdeCompra1Click(Sender: TObject);
    procedure Fornecedores2Click(Sender: TObject);
    procedure Materiais2Click(Sender: TObject);
    procedure Pedido1Click(Sender: TObject);
    procedure GerarLote1Click(Sender: TObject);
    procedure Setor1Click(Sender: TObject);
    procedure ProdutoFichaTcnica1Click(Sender: TObject);
    procedure Rtulos1Click(Sender: TObject);
    procedure NotasFiscais1Click(Sender: TObject);
    procedure TipodeCobrana1Click(Sender: TObject);
    procedure Histricos1Click(Sender: TObject);
    procedure Duplicatas1Click(Sender: TObject);
    procedure NotasdeEntrada1Click(Sender: TObject);
    procedure ContasaPagar2Click(Sender: TObject);
    procedure fLanaContasaPagar1Click(Sender: TObject);
    procedure Contas1Click(Sender: TObject);
    procedure PlanodeContas1Click(Sender: TObject);
    procedure Movimentos1Click(Sender: TObject);
    procedure EntradadeMovimentos1Click(Sender: TObject);
    procedure Contas2Click(Sender: TObject);
    procedure Grades1Click(Sender: TObject);
    procedure CondiesdePagamento1Click(Sender: TObject);
    procedure ClculodeMateriaispLotes1Click(Sender: TObject);
    procedure LancaCtasaReceber1Click(Sender: TObject);
    procedure TipodeCobranas1Click(Sender: TObject);
    procedure Histricos2Click(Sender: TObject);
    procedure RxSpeedButton9Click(Sender: TObject);
    procedure ConsLote1Click(Sender: TObject);
    procedure VendasporVendedores1Click(Sender: TObject);
    procedure Notasemitidasporvendedor1Click(Sender: TObject);
    procedure VendasporVendedoresReferncia1Click(Sender: TObject);
    procedure VendasporVendedoresClientes1Click(Sender: TObject);
    procedure Juros1Click(Sender: TObject);
    procedure Notasemitidaspornaturezadeoperao1Click(Sender: TObject);
    procedure RededeLojas1Click(Sender: TObject);
    procedure RegiesdeVendas1Click(Sender: TObject);
    procedure tEmpresaAfterPost(DataSet: TDataSet);
    procedure Parametros1Click(Sender: TObject);
    procedure Pedidosnofaturados1Click(Sender: TObject);
    procedure BaixaPedidos1Click(Sender: TObject);
    procedure EtiquetasClientes1Click(Sender: TObject);
    procedure EtiquetasVendedores1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ConsultaFatDiario1Click(Sender: TObject);
    procedure N2ExtratodeComisses2Click(Sender: TObject);
    procedure N7GerarArquivos1Click(Sender: TObject);
    procedure N1Vendedor1Click(Sender: TObject);
    procedure LanamentodeComisso1Click(Sender: TObject);
    procedure ExtratodeComisso1Click(Sender: TObject);
    procedure ExtratodeVendedoresNotas1Click(Sender: TObject);
    procedure Modelista1Click(Sender: TObject);
    procedure N7ComissoModelista1Click(Sender: TObject);
    procedure N8LanamentoComissoModelista1Click(Sender: TObject);
    procedure Relatriode1Click(Sender: TObject);
    procedure N1ContasPagar1Click(Sender: TObject);
    procedure N2Histricos1Click(Sender: TObject);
    procedure N2NotasporNaturezadeOperao1Click(Sender: TObject);
    procedure N5ContasaReeber1Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure N6AReceberporCliente1Click(Sender: TObject);
    procedure N3APagarporFornecedores1Click(Sender: TObject);
    procedure N4PagamentodeJuros1Click(Sender: TObject);
    procedure N5EtiquetasFornecedores1Click(Sender: TObject);
    procedure ObsAuxiliar1Click(Sender: TObject);
    procedure N3NotadeCompra1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure ALogin1Click(Sender: TObject);
    procedure N1Atelier1Click(Sender: TObject);
    procedure N6MovimentodeTales1Click(Sender: TObject);
    procedure N4GerarLoteExportao1Click(Sender: TObject);
    procedure N2ConsultaLoteExportao1Click(Sender: TObject);
    procedure N1Atividades1Click(Sender: TObject);
    procedure N6Requisio2Click(Sender: TObject);
    procedure N3Indexador1Click(Sender: TObject);
    procedure N3ConsultadeFornecpAtividade1Click(Sender: TObject);
    procedure N4ConsultaMovimentodeTales1Click(Sender: TObject);
    procedure N4MateriaisAbaixodoMnimo1Click(Sender: TObject);
    procedure N3ConsultadeEstoquedeMateriais1Click(Sender: TObject);
    procedure N5HistricodoMaterial1Click(Sender: TObject);
    procedure N0MetasProduzidos1Click(Sender: TObject);
    procedure ASituaodoAtelier1Click(Sender: TObject);
    procedure N3CustoporSetor1Click(Sender: TObject);
    procedure ModeObra1Click(Sender: TObject);
    procedure ConsMovimentoTalesMercInterno1Click(Sender: TObject);
    procedure N7NotadeEntrada1Click(Sender: TObject);
    procedure Posies1Click(Sender: TObject);
    procedure N1ClculodeMateriaisporPedido1Click(Sender: TObject);
    procedure N2Cidades1Click(Sender: TObject);
    procedure DOperaesdeAtelier1Click(Sender: TObject);
    procedure N5PlanejamentoProgramao1Click(Sender: TObject);
    procedure N3EtiquetasparaCaixas1Click(Sender: TObject);
    procedure N7Pr1Click(Sender: TObject);
    procedure DctodeEntradaeSadadoEstoque1Click(Sender: TObject);
    procedure N1AgendaTelefnica1Click(Sender: TObject);
    procedure N1CpiasdeDuplicatas1Click(Sender: TObject);
    procedure N8BalancodoEstoque1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PedidodeAmostra1Click(Sender: TObject);
    procedure N5MetasProduzidosReferncia1Click(Sender: TObject);
    procedure N9OrdensdeCompra1Click(Sender: TObject);
    procedure ATalesdeAmostra1Click(Sender: TObject);
    procedure N4ConsultaHistricodosMateriais1Click(Sender: TObject);
    procedure N2ClientesporReferncia1Click(Sender: TObject);
    procedure N2ConsultaHistricodosClientes1Click(Sender: TObject);
    procedure N9Fbricas1Click(Sender: TObject);
    procedure N0RefAcumuladaporFbrica1Click(Sender: TObject);
    procedure BOrdemdeServio1Click(Sender: TObject);
    procedure N7PedidosEmbarcadospPerodo1Click(Sender: TObject);
    procedure AProdutosporColeoeMercado1Click(Sender: TObject);
    procedure N1ICMS1Click(Sender: TObject);
    procedure N6Devolues1Click(Sender: TObject);
    procedure N6Defeitos1Click(Sender: TObject);
    procedure N5TransfernciadeICMS1Click(Sender: TObject);
    procedure N6Construo1Click(Sender: TObject);
    procedure CProjeo1Click(Sender: TObject);
    procedure N5EstoqueIntermedirio1Click(Sender: TObject);
    procedure N0PrevisoOC1Click(Sender: TObject);
    procedure PrevisodeComisso1Click(Sender: TObject);
    procedure EstoqueIntermedirioMercInterno1Click(Sender: TObject);
    procedure N8LanamentodeComissoModelista1Click(Sender: TObject);
    procedure Faturamento2Click(Sender: TObject);
    procedure RtulosImpressoraTrmica1Click(Sender: TObject);
    procedure ConsultaOrdemdeCompraPendetesEntregues1Click(
      Sender: TObject);
    procedure ContasaReceberNovo1Click(Sender: TObject);
    procedure ConsultaFaturamento1Click(Sender: TObject);
    procedure MovimentoSetor1Click(Sender: TObject);
    procedure ArmazenamentodeReferncias1Click(Sender: TObject);
    procedure Confirmao1Click(Sender: TObject);
    procedure LocalizaodeNavalhas1Click(Sender: TObject);
    procedure FichaConsumodeMateriais1Click(Sender: TObject);
    procedure VendasporVendedorModelo1Click(Sender: TObject);
    procedure ConsultaSituaodosPedidos1Click(Sender: TObject);
    procedure AlteraodeFbricaTales1Click(Sender: TObject);
    procedure ConsultaEstoqueporPerodo1Click(Sender: TObject);
    procedure ContasaPagarNovo1Click(Sender: TObject);
    procedure ipodeMaterial1Click(Sender: TObject);
    procedure ipoMaterialProduto1Click(Sender: TObject);
    procedure Programao1Click(Sender: TObject);
    procedure BaixaTaloAuxiliar1Click(Sender: TObject);
    procedure ConsultaBaixaTaloAuxiliar1Click(Sender: TObject);
    procedure ConsultaMaterialNaFichaTcnica1Click(Sender: TObject);
    procedure RelProduo1Click(Sender: TObject);
    procedure ConsultaLoteProduzidoPendente1Click(Sender: TObject);
    procedure Filial1Click(Sender: TObject);
    procedure Pasees1Click(Sender: TObject);
    procedure CadastrodeItensdeAjusteComplementar1Click(Sender: TObject);
    procedure DuplicatasWindows1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ClculodeMateriaisporLote1Click(Sender: TObject);
    procedure CSOSNClick(
      Sender: TObject);
    procedure OrigemMercadoria1Click(Sender: TObject);
    procedure PercentualSimples1Click(Sender: TObject);
    procedure RegimeTributrio1Click(Sender: TObject);
    procedure abelaCofins1Click(Sender: TObject);
    procedure abelaPis1Click(Sender: TObject);
    procedure InutilizarNumeraodeNota1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Compania1Click(Sender: TObject);
    procedure EmailsNFe1Click(Sender: TObject);
    procedure FichaTcnicadeConstruo1Click(Sender: TObject);
    procedure PosioFichadeTcnicadeConstruo1Click(Sender: TObject);
    procedure NFeEmailsAdicionais1Click(Sender: TObject);
    procedure GerarEstoqueEFDSPED1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ProdutosVendidos1Click(Sender: TObject);
    procedure ConsultaMaterialPorPerodo1Click(Sender: TObject);
    procedure Etiqueta1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Prnovo1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure EnquadramentoIP1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMenuP: TfMenuP;
  Auto : String[15];

implementation

uses UGrupos, USubGrupos, UFornecedores, UMaterial, UGrade, UCor, UCondPgto, UTransp, UOrdemCompra, UEmpresa, UClasFiscal,
  USitTributaria, UProduto, UPrevMaterial, UVendedor, UNatOperacao, UPedido, UCliente, UPrevRelClientes, URelFornecedores,
  UPrevFornecedores, UPrevVendedores, USetor, UUf, UPrevCalcMaterialPed, UTipoCobranca, UHistorico, UEmissaoNotaFiscal,
  UPlanoContas, UMovimentos, UEntradaMovimentos, UPrevContas, UContasPagar, ULancaCPagar, ULancaCReceber, UNotaEntrada,
  USobre, ULojas, UPrevDuplicatas, UPrevRelRotulos, UImpressora, URelClientes, UPrevVendasVendedor, UPrevVendasVendRef,
  UPrevVendasVendCli, UPrevNotasVendedor, UJuros, UPrevNotasNatOpe,  URegioes, USenha2, UParametros, UDM1, UConsFatDiario,
  UPrevPedidosNaoFat, UBaixaPedido, UEtiqCliente, UEtiqVendedor, UAutorizacao, ULancComissao, UPrevExtComissao2, UGeraArquivo,
  UModelista, UPgtoComissaoMod, ULancComissaoMod, UPrevExtComissaoMod, UObsAux, UPrevRelCPagar, uFilial, UPrevNComprasNatOpe,
  UPrevRelCReceber, UPrevExtComissaoModPed, UPrevPagForn, UOS, UPrevPgtoJuros, UAcesso, UEtiqFornecedor, UUsuarios, UAtelier,
  UMovTalao, UConsLoteExp, UAtividade, URequisicao, UIndexador, UConsFornecAtiv, UConsMovTalao, UPrevCustoSetor, UPrevMatMinimo,
  UConsEstoqueMat, UPrevRelHistMaterial, UPrevMetasProd, UPrevSitAtelier, UMaoDeObra, UConsMovTalaoMI, UPrevNotaEntrada,
  UPosicao, UDctoEst, UPrevCalcMaterialLote, UCidade, UOperAtelier, UPrevPre, UPrevPlanejProg, UAgendaTelef, UCopiaDuplicata,
  UPrevBalancoEst, UPedAmostra, UPrevMetasProdRef, UPrevRelOC, UPrevTalaoAmostra, UConsHistMat, URelTesteEst, UConsComissao,
  UPrevCliRef, UConsHistCli, UFabrica, UPrevRelAcumFab, UPrevRelPedEmb, UConsOC, UPrevProdColecao, UPrevICMS, UDevolucao,
  UDefeitos, UPrevTransfICMS, UPrevProjecao, UConstrucao, UPrevEstIntermediario, UCia, UPrevPrevisaoOC, UPrevPrevComissao,
  UPrevEstIntermediarioMI, UPrevFaturamento, UPrevRelRotulos2, UContasReceber2, UHistGeral, UConsMovSetor, uConfirmacao,
  UTipoMaterial, UFichaConsumoMat, UTabPis, UPrevVendasVendModelo, UConsPedidoBR, UTalaoTrocaFabrica, UConsConsumoMat,
  UContasPagar2, UPrevRelProgramacao, UTabCofins, ULeitorTalaoAuxiliar, UConsTalaoAuxiliar, UConsMaterialFicha, URelProducao,
  uConsLoteProdPend, UPais, UOutrosServicosNota, UPrevRelDuplicatas, UVerificaContasRecPag, UPrevCalcMaterialLote2,
  USitTributariaSimples, UOrigemProd, UPercSimples, URegimeTrib, UNFeInutilizacao, UVerificaGradeMateriais, uEmailNFeC,
  UFichaConstrucaoC, UConsLote, UContas, ULote, UEtiqCx, ULoteExp, UPosicaoFichaC, UNFeEmailC, UGerarEFD, UGeraFB,
  uProdutosVendidos, UPrevRecCli, UConsMaterialPeriodo, UEtiqNota, UConvFotoProd, UPrevPre2, UArmazenamento_RefC,
  UNavalha_LocalC, UGeraFB_Exc, UGeraFBMI_Exc, FixBDE4GbBug, UTabEnqIPIC;

{$R *.DFM}

procedure TfMenuP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfMenuP.Grupo1Click(Sender: TObject);
begin
  fGrupos := TfGrupos.Create(Self);
  fGrupos.ShowModal;
end;

procedure TfMenuP.SubGrupos1Click(Sender: TObject);
begin
  fSubGrupos := TfSubGrupos.Create(Self);
  fSubGrupos.ShowModal;
end;

procedure TfMenuP.Clientes1Click(Sender: TObject);
begin
  fCliente := TfCliente.Create(self);
  fCliente.ShowModal;
end;

procedure TfMenuP.Cor1Click(Sender: TObject);
begin
  fCor := TfCor.Create(Self);
  fCor.ShowModal;
end;

procedure TfMenuP.Impressoras1Click(Sender: TObject);
begin
  fImpressora := TfImpressora.Create(Self);
  fImpressora.ShowModal;
end;

procedure TfMenuP.Transportadoras1Click(Sender: TObject);
begin
  fTransp := TfTransp.Create(Self);
  fTransp.ShowModal;
end;

procedure TfMenuP.ClassificaoFiscal1Click(Sender: TObject);
begin
  fClasFiscal := TfClasFiscal.Create(Self);
  fClasFiscal.ShowModal;
end;

procedure TfMenuP.SituaoTributria1Click(Sender: TObject);
begin
  fSitTributaria := TfSitTributaria.Create(Self);
  fSitTributaria.ShowModal;
end;

procedure TfMenuP.NaturezadeOperao1Click(Sender: TObject);
begin
  fNatOperacao := TfNatOperacao.Create(Self);
  fNatOperacao.ShowModal;
end;

procedure TfMenuP.EstadoseAlqotas1Click(Sender: TObject);
begin
  fUf := TfUf.Create(Self);
  fUf.ShowModal;
end;

procedure TfMenuP.Clientes2Click(Sender: TObject);
begin
  fPrevRelClientes := TfPrevRelClientes.Create(Self);
  fPrevRelClientes.ShowModal;
end;

procedure TfMenuP.Vendedores2Click(Sender: TObject);
begin
  fPrevVendedores := TfPrevVendedores.Create(Self);
  fPrevVendedores.ShowModal;
end;

procedure TfMenuP.Fornecedores1Click(Sender: TObject);
begin
  fFornecedores := TfFornecedores.Create(Self);
  fFornecedores.ShowModal;
end;

procedure TfMenuP.Materiais1Click(Sender: TObject);
begin
  fMaterial := TfMaterial.Create(Self);
  fMaterial.ShowModal;
end;

procedure TfMenuP.OrdemdeCompra1Click(Sender: TObject);
begin
  fOrdemCompra := TfOrdemCompra.Create(Self);
  fOrdemCompra.ShowModal;
end;

procedure TfMenuP.Fornecedores2Click(Sender: TObject);
begin
  fPrevFornecedores := TfPrevFornecedores.Create(Self);
  fPrevFornecedores.ShowModal;
end;

procedure TfMenuP.Materiais2Click(Sender: TObject);
begin
  fPrevMaterial := TfPrevMaterial.Create(Self);
  fPrevMaterial.ShowModal;
end;

procedure TfMenuP.Pedido1Click(Sender: TObject);
begin
  fPedido := TfPedido.Create(Self);
  fPedido.ShowModal;
end;

procedure TfMenuP.GerarLote1Click(Sender: TObject);
begin
  fLote := TfLote.Create(Self);
  fLote.ShowModal;
end;

procedure TfMenuP.Setor1Click(Sender: TObject);
begin
  fSetor := TfSetor.Create(Self);
  fSetor.ShowModal;
end;

procedure TfMenuP.ProdutoFichaTcnica1Click(Sender: TObject);
begin
  fProduto := TfProduto.Create(Self);
  fProduto.ShowModal;
end;

procedure TfMenuP.Rtulos1Click(Sender: TObject);
begin
  fPrevRelRotulos := TfPrevRelRotulos.Create(Self);
  fPrevRelRotulos.ShowModal;
end;

procedure TfMenuP.NotasFiscais1Click(Sender: TObject);
begin
  fEmissaoNotaFiscal := TfEmissaoNotaFiscal.Create(Self);
  fEmissaoNotaFiscal.ShowModal;
end;

procedure TfMenuP.TipodeCobrana1Click(Sender: TObject);
begin
  fTipoCobranca := TfTipoCobranca.Create(Self);
  fTipoCobranca.ShowModal;
end;

procedure TfMenuP.Histricos1Click(Sender: TObject);
begin
  fHistorico := TfHistorico.Create(Self);
  fHistorico.ShowModal;
end;

procedure TfMenuP.Duplicatas1Click(Sender: TObject);
begin
  fPrevDuplicatas := TfPrevDuplicatas.Create(Self);
  fPrevDuplicatas.ShowModal;
end;

procedure TfMenuP.NotasdeEntrada1Click(Sender: TObject);
begin
  fNotaEntrada := TfNotaEntrada.Create(Self);
  fNotaEntrada.ShowModal;
end;

procedure TfMenuP.ContasaPagar2Click(Sender: TObject);
begin
  fContasPagar := TfContasPagar.Create(Self);
  fContasPagar.ShowModal;
end;

procedure TfMenuP.fLanaContasaPagar1Click(Sender: TObject);
begin
  fLancaCPagar := TfLancaCPagar.Create(Self);
  fLancaCPagar.ShowModal;
end;

procedure TfMenuP.Contas1Click(Sender: TObject);
begin
  fContas := TfContas.Create(Self);
  fContas.ShowModal;
end;

procedure TfMenuP.PlanodeContas1Click(Sender: TObject);
begin
  fPlanoContas := TfPlanoContas.Create(Self);
  fPlanoContas.ShowModal;
end;

procedure TfMenuP.Movimentos1Click(Sender: TObject);
begin
  fMovimentos := TfMovimentos.Create(Self);
  fMovimentos.ShowModal;
end;

procedure TfMenuP.EntradadeMovimentos1Click(Sender: TObject);
begin
  fEntradaMovimentos := TfEntradaMovimentos.Create(Self);
  fEntradaMovimentos.ShowModal;
end;

procedure TfMenuP.Contas2Click(Sender: TObject);
begin
  fPrevContas := TfPrevContas.Create(Self);
  fPrevContas.ShowModal;
end;

procedure TfMenuP.Grades1Click(Sender: TObject);
begin
  fGrade := TfGrade.Create(Self);
  fGrade.ShowModal;
end;

procedure TfMenuP.CondiesdePagamento1Click(Sender: TObject);
begin
  fCondPgto := TfCondPgto.Create(Self);
  fCondPgto.ShowModal;
end;

procedure TfMenuP.ClculodeMateriaispLotes1Click(Sender: TObject);
begin
  fPrevCalcMaterialLote := TfPrevCalcMaterialLote.Create(Self);
  fPrevCalcMaterialLote.ShowModal;
end;

procedure TfMenuP.LancaCtasaReceber1Click(Sender: TObject);
begin
  fLancaCReceber := TfLancaCReceber.Create(Self);
  fLancaCReceber.ShowModal;
end;

procedure TfMenuP.TipodeCobranas1Click(Sender: TObject);
begin
  fTipoCobranca := TfTipoCobranca.Create(Self);
  fTipoCobranca.ShowModal;
end;

procedure TfMenuP.Histricos2Click(Sender: TObject);
begin
  fHistorico := TfHistorico.Create(Self);
  fHistorico.ShowModal;
end;

procedure TfMenuP.RxSpeedButton9Click(Sender: TObject);
begin
  Close;
end;

procedure TfMenuP.ConsLote1Click(Sender: TObject);
begin
  fConsLote := TfConsLote.Create(Self);
  fConsLote.ShowModal;
end;

procedure TfMenuP.VendasporVendedores1Click(Sender: TObject);
begin
  fPrevVendasVendedor := TfPrevVendasVendedor.Create(Self);
  fPrevVendasVendedor.ShowModal;
end;

procedure TfMenuP.Notasemitidasporvendedor1Click(Sender: TObject);
begin
  fPrevNotasVendedor := TfPrevNotasVendedor.Create(Self);
  fPrevNotasVendedor.ShowModal;
end;

procedure TfMenuP.VendasporVendedoresReferncia1Click(Sender: TObject);
begin
  fPrevVendasVendRef := TfPrevVendasVendRef.Create(Self);
  fPrevVendasVendRef.ShowModal;
end;

procedure TfMenuP.VendasporVendedoresClientes1Click(Sender: TObject);
begin
  fPrevVendasVendCli := TfPrevVendasVendCli.Create(Self);
  fPrevVendasVendCli.ShowModal;
end;

procedure TfMenuP.Juros1Click(Sender: TObject);
begin
  fJuros := TfJuros.Create(Self);
  fJuros.ShowModal;
end;

procedure TfMenuP.Notasemitidaspornaturezadeoperao1Click(Sender: TObject);
begin
  fPrevNotasNatOpe := TfPrevNotasNatOpe.Create(Self);
  fPrevNotasNatOpe.ShowModal;
end;

procedure TfMenuP.RededeLojas1Click(Sender: TObject);
begin
  fLojas := TfLojas.Create(Self);
  fLojas.ShowModal;
end;

procedure TfMenuP.RegiesdeVendas1Click(Sender: TObject);
begin
  fRegioes := TfRegioes.Create(Self);
  fRegioes.ShowModal;
end;

procedure TfMenuP.tEmpresaAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tEmpresa.Handle);
end;

procedure TfMenuP.Parametros1Click(Sender: TObject);
begin
  fParametros := TfParametros.Create(Self);
  fParametros.ShowModal;
end;

procedure TfMenuP.Pedidosnofaturados1Click(Sender: TObject);
begin
  fPrevPedidosNaoFat := TfPrevPedidosNaoFat.Create(Self);
  fPrevPedidosNaoFat.ShowModal;
end;

procedure TfMenuP.BaixaPedidos1Click(Sender: TObject);
begin
  fBaixaPedido := TfBaixaPedido.Create(Self);
  fBaixaPedido.ShowModal;
end;

procedure TfMenuP.EtiquetasClientes1Click(Sender: TObject);
begin
  fEtiqCliente := TfEtiqCliente.Create(self);
  fEtiqCliente.ShowModal;
end;

procedure TfMenuP.EtiquetasVendedores1Click(Sender: TObject);
begin
  fEtiqVendedor := TfEtiqVendedor.Create(Self);
  fEtiqVendedor.ShowModal;
end;

procedure TfMenuP.FormShow(Sender: TObject);
var
  vLinha2 : String;
begin
  vLinha2 := DM1.tEmpresaLinha2.AsString;
  RxLabel1.Caption := DM1.tEmpresaLinha1.AsString;
  RxLabel2.Caption := DM1.tEmpresaLinha2.AsString;
  fAcesso := TfAcesso.Create(Self);
  fAcesso.Caption := '  Senha de Acesso  -  ' + DateToStr(Date);
  if DM1.tEmpresaData.AsDateTime <= (Date - 10) then
    begin
      DM1.tEmpresa.Edit;
      DM1.tEmpresaData.AsDateTime := (Date - 10);
      DM1.tEmpresa.Post;
    end
  else
    begin
      ShowMessage('A data do sistema foi alterada!'+#13+#13+
                  'Entre com a senha de liberação '+#13+
                  ' e a data correta do sistema !');
      fAutorizacao := TfAutorizacao.Create(Self);
      fAutorizacao.ShowModal;
    end;
  fAcesso.ShowModal;
  BitBtn2.Visible := (DM1.tUsuarioUsuario.AsString = 'A');
end;

procedure TfMenuP.ConsultaFatDiario1Click(Sender: TObject);
begin
  fConsFatDiario := TfConsFatDiario.Create(Self);
  fConsFatDiario.ShowModal;
end;

procedure TfMenuP.N2ExtratodeComisses2Click(Sender: TObject);
begin
  fPrevExtComissao2 := TfPrevExtComissao2.Create(Self);
  fPrevExtComissao2.ShowModal;
end;

procedure TfMenuP.N7GerarArquivos1Click(Sender: TObject);
begin
  fGeraArquivo := TfGeraArquivo.Create(Self);
  fGeraArquivo.ShowModal;
end;

procedure TfMenuP.N1Vendedor1Click(Sender: TObject);
begin
  fVendedor := TfVendedor.Create(Self);
  fVendedor.ShowModal;
end;

procedure TfMenuP.LanamentodeComisso1Click(Sender: TObject);
begin
  fLancComissao := TfLancComissao.Create(Self);
  fLancComissao.ShowModal;
end;                                   

procedure TfMenuP.ExtratodeComisso1Click(Sender: TObject);
begin
  fPrevExtComissao2 := TfPrevExtComissao2.Create(Self);
  fPrevExtComissao2.ShowModal;
end;

procedure TfMenuP.ExtratodeVendedoresNotas1Click(Sender: TObject);
begin
  fConsComissao := TfConsComissao.Create(Self);
  fConsComissao.ShowModal;
end;

procedure TfMenuP.Modelista1Click(Sender: TObject);
begin
  fModelista := TfModelista.Create(Self);
  fModelista.ShowModal;
end;

procedure TfMenuP.N7ComissoModelista1Click(Sender: TObject);
begin
  fPgtoComissaoMod := TfPgtoComissaoMod.Create(Self);
  fPgtoComissaoMod.ShowModal;
end;

procedure TfMenuP.N8LanamentoComissoModelista1Click(Sender: TObject);
begin
  fLancComissaoMod := TfLancComissaoMod.Create(Self);
  fLancComissaoMod.ShowModal;
end;

procedure TfMenuP.Relatriode1Click(Sender: TObject);
begin
  fPrevExtComissaoMod := TfPrevExtComissaoMod.Create(Self);
  fPrevExtComissaoMod.ShowModal;
end;

procedure TfMenuP.N1ContasPagar1Click(Sender: TObject);
begin
  fPrevRelCPagar := TfPrevRelCPagar.Create(Self);
  fPrevRelCPagar.ShowModal;
end;

procedure TfMenuP.N2Histricos1Click(Sender: TObject);
begin
  fHistorico := TfHistorico.Create(Self);
  fHistorico.ShowModal;
end;

procedure TfMenuP.N2NotasporNaturezadeOperao1Click(Sender: TObject);
begin
  fPrevNComprasNatOpe := TfPrevNComprasNatOpe.Create(Self);
  fPrevNComprasNatOpe.ShowModal;
end;

procedure TfMenuP.N5ContasaReeber1Click(Sender: TObject);
begin
  fPrevRelCReceber := TfPrevRelCReceber.Create(Self);
  fPrevRelCReceber.ShowModal;
end;

procedure TfMenuP.N23Click(Sender: TObject);
begin
  fPrevExtComissaoModPed := TfPrevExtComissaoModPed.Create(Self);
  fPrevExtComissaoModPed.ShowModal;
end;

procedure TfMenuP.Sobre1Click(Sender: TObject);
begin
  fSobre := TfSobre.Create(Self);
  fSobre.ShowModal;
end;

procedure TfMenuP.N6AReceberporCliente1Click(Sender: TObject);
begin
  fPrevRecCli := TfPrevRecCli.Create(Self);
  fPrevRecCli.ShowModal;
end;

procedure TfMenuP.N3APagarporFornecedores1Click(Sender: TObject);
begin
  fPrevPagForn := TfPrevPagForn.Create(Self);
  fPrevPagForn.ShowModal;
end;

procedure TfMenuP.N4PagamentodeJuros1Click(Sender: TObject);
begin
  fPrevPgtoJuros := TfPrevPgtoJuros.Create(Self);
  fPrevPgtoJuros.ShowModal;
end;

procedure TfMenuP.N5EtiquetasFornecedores1Click(Sender: TObject);
begin
  fEtiqFornecedor := TfEtiqFornecedor.Create(Self);
  fEtiqFornecedor.ShowModal;
end;

procedure TfMenuP.ObsAuxiliar1Click(Sender: TObject);
begin
  fObsAux := TfObsAux.Create(Self);
  fObsAux.ShowModal;
end;

procedure TfMenuP.N3NotadeCompra1Click(Sender: TObject);
begin
  fNotaEntrada := TfNotaEntrada.Create(Self);
  fNotaEntrada.ShowModal;
end;

procedure TfMenuP.Sair1Click(Sender: TObject);
begin
  fUsuarios := TfUsuarios.Create(Self);
  fUsuarios.ShowModal;
end;

procedure TfMenuP.ALogin1Click(Sender: TObject);
begin
  DM1.Login;
end;

procedure TfMenuP.N1Atelier1Click(Sender: TObject);
begin
  fAtelier := TfAtelier.Create(Self);
  fAtelier.ShowModal;
end;

procedure TfMenuP.N6MovimentodeTales1Click(Sender: TObject);
begin
  fMovTalao := TfMovTalao.Create(Self);
  fMovTalao.ShowModal;
end;

procedure TfMenuP.N4GerarLoteExportao1Click(Sender: TObject);
begin
  fLoteExp := TfLoteExp.Create(Self);
  fLoteExp.ShowModal;
end;

procedure TfMenuP.N2ConsultaLoteExportao1Click(Sender: TObject);
begin
  fConsLoteExp := TfConsLoteExp.Create(Self);
  fConsLoteExp.ShowModal;
end;

procedure TfMenuP.N1Atividades1Click(Sender: TObject);
begin
  fAtividade := TfAtividade.Create(Self);
  fAtividade.ShowModal;
end;

procedure TfMenuP.N6Requisio2Click(Sender: TObject);
begin
  fRequisicao := TfRequisicao.Create(Self);
  fRequisicao.ShowModal;
end;

procedure TfMenuP.N3Indexador1Click(Sender: TObject);
begin
  fIndexador := TfIndexador.Create(Self);
  fIndexador.ShowModal;
end;

procedure TfMenuP.N3ConsultadeFornecpAtividade1Click(Sender: TObject);
begin
  fConsFornecAtiv := TfConsFornecAtiv.Create(Self);
  fConsFornecAtiv.ShowModal;
end;

procedure TfMenuP.N4ConsultaMovimentodeTales1Click(Sender: TObject);
begin
  fConsMovTalao := TfConsMovTalao.Create(Self);
  fConsMovTalao.ShowModal;
end;

procedure TfMenuP.N4MateriaisAbaixodoMnimo1Click(Sender: TObject);
begin
  fPrevMatMinimo := TfPrevMatMinimo.Create(Self);
  fPrevMatMinimo.ShowModal;
end;

procedure TfMenuP.N3ConsultadeEstoquedeMateriais1Click(Sender: TObject);
begin
  fConsEstoqueMat := TfConsEStoqueMat.Create(Self);
  fConsEstoqueMat.ShowModal;
end;

procedure TfMenuP.N5HistricodoMaterial1Click(Sender: TObject);
begin
  fPrevRelHistMaterial := TfPrevRelHistMaterial.Create(Self);
  fPrevRelHistMaterial.ShowModal;
end;

procedure TfMenuP.N0MetasProduzidos1Click(Sender: TObject);
begin
  fPrevMetasProd := TfPrevMetasProd.Create(Self);
  fPrevMetasProd.ShowModal;
end;

procedure TfMenuP.ASituaodoAtelier1Click(Sender: TObject);
begin
  fPrevSitAtelier := TfPrevSitAtelier.Create(Self);
  fPrevSitAtelier.ShowModal;
end;

procedure TfMenuP.N3CustoporSetor1Click(Sender: TObject);
begin
  fPrevCustoSetor := TfPrevCustoSetor.Create(Self);
  fPrevCustoSetor.ShowModal;
end;

procedure TfMenuP.ModeObra1Click(Sender: TObject);
begin
  fMaoDeObra := TfMaoDeObra.Create(Self);
  fMaoDeObra.ShowModal;
end;

procedure TfMenuP.ConsMovimentoTalesMercInterno1Click(Sender: TObject);
begin
  fConsMovTalaoMI := TfConsMovTalaoMI.Create(Self);
  fConsMovTalaoMI.ShowModal;
end;

procedure TfMenuP.N7NotadeEntrada1Click(Sender: TObject);
begin
  fPrevNotaEntrada := TfPrevNotaEntrada.Create(Self);
  fPrevNotaEntrada.ShowModal;
end;

procedure TfMenuP.Posies1Click(Sender: TObject);
begin
  fPosicao := TfPosicao.Create(Self);
  fPosicao.ShowModal;
end;

procedure TfMenuP.N1ClculodeMateriaisporPedido1Click(Sender: TObject);
begin
  fPrevCalcMaterialPed := TfPrevCalcMaterialPed.Create(Self);
  fPrevCalcMaterialPed.ShowModal;
end;

procedure TfMenuP.N2Cidades1Click(Sender: TObject);
begin
  fCidade := TfCidade.Create(Self);
  fCidade.ShowModal;
end;

procedure TfMenuP.DOperaesdeAtelier1Click(Sender: TObject);
begin
  fOperAtelier := tfOperAtelier.Create(Self);
  fOperAtelier.ShowModal;
end;

procedure TfMenuP.N5PlanejamentoProgramao1Click(Sender: TObject);
begin
  fPrevPlanejProg := TfPrevPlanejProg.Create(Self);
  fPrevPlanejProg.ShowModal;
end;

procedure TfMenuP.N3EtiquetasparaCaixas1Click(Sender: TObject);
begin
  fEtiqCx := TfEtiqCx.Create(Self);
  fEtiqCx.ShowModal;
end;

procedure TfMenuP.N7Pr1Click(Sender: TObject);
begin
  fPrevPre := TfPrevPre.Create(Self);
  fPrevPre.ShowModal;
end;

procedure TfMenuP.DctodeEntradaeSadadoEstoque1Click(Sender: TObject);
begin
  fDctoEst := TfDctoEst.Create(Self);
  fDctoEst.ShowModal;
end;

procedure TfMenuP.N1AgendaTelefnica1Click(Sender: TObject);
begin
  fAgendaTelef := TfAgendaTelef.Create(Self);
  fAgendaTelef.ShowModal;
end;

procedure TfMenuP.N1CpiasdeDuplicatas1Click(Sender: TObject);
begin
  fCopiaDuplicata := TfCopiaDuplicata.Create(Self);
  fCopiaDuplicata.ShowModal;
end;

procedure TfMenuP.N8BalancodoEstoque1Click(Sender: TObject);
begin
  fPrevBalancoEst := TfPrevBalancoEst.Create(Self);
  fPrevBalancoEst.ShowModal;
end;

procedure TfMenuP.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F9) and (DM1.tUsuarioRelBoleto.AsBoolean) then
    begin
      fPrevDuplicatas := TfPrevDuplicatas.Create(Self);
      fPrevDuplicatas.ShowModal;
    end;
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
  if (Shift = [ssCtrl]) and (Key = 67) then
  begin
    BitBtn1.Visible := not BitBtn1.Visible;
    BitBtn3.Visible := not BitBtn3.Visible;
    BitBtn4.Visible := not BitBtn4.Visible;
    BitBtn5.Visible := not BitBtn5.Visible;
    BitBtn6.Visible := not BitBtn6.Visible;
  end;
  if (Shift = [ssCtrl]) and (Key = 87) then
  begin
    BitBtn1.Visible := not BitBtn1.Visible;
    BitBtn3.Visible := not BitBtn3.Visible;
    BitBtn4.Visible := not BitBtn4.Visible;
    BitBtn5.Visible := not BitBtn5.Visible;
    BitBtn6.Visible := not BitBtn6.Visible;
  end;
end;

procedure TfMenuP.PedidodeAmostra1Click(Sender: TObject);
begin
  fPedAmostra := TfPedAmostra.Create(Self);
  fPedAmostra.ShowModal;
end;

procedure TfMenuP.N5MetasProduzidosReferncia1Click(Sender: TObject);
begin
  fPrevMetasProdRef := TfPrevMetasProdRef.Create(Self);
  fPrevMetasProdRef.ShowModal;
end;

procedure TfMenuP.N9OrdensdeCompra1Click(Sender: TObject);
begin
  fPrevRelOC := TfPrevRelOC.Create(Self);
  fPrevRelOC.ShowModal;
end;

procedure TfMenuP.ATalesdeAmostra1Click(Sender: TObject);
begin
  fPrevTalaoAmostra := TfPrevTalaoAmostra.Create(Self);
  fPrevTalaoAmostra.ShowModal;
end;

procedure TfMenuP.N4ConsultaHistricodosMateriais1Click(Sender: TObject);
begin
  fConsHistMat := TfConsHistMat.Create(Self);
  fConsHistMat.ShowModal;
end;

procedure TfMenuP.N2ClientesporReferncia1Click(Sender: TObject);
begin
  fPrevCliRef := TfPrevCliRef.Create(Self);
  fPrevCliRef.ShowModal;
end;

procedure TfMenuP.N2ConsultaHistricodosClientes1Click(Sender: TObject);
begin
  fConsHistCli := TfConsHistCli.Create(Self);
  fConsHistCli.ShowModal;
end;

procedure TfMenuP.N9Fbricas1Click(Sender: TObject);
begin
  fFabrica := TfFabrica.Create(Self);
  fFabrica.ShowModal;
end;

procedure TfMenuP.N0RefAcumuladaporFbrica1Click(Sender: TObject);
begin
  fPrevRelAcumFab := TfPrevRelAcumFab.Create(Self);
  fPrevRelAcumFab.ShowModal;
end;

procedure TfMenuP.BOrdemdeServio1Click(Sender: TObject);
begin
  fOS := TfOS.Create(Self);
  fOS.ShowModal;
end;

procedure TfMenuP.N7PedidosEmbarcadospPerodo1Click(Sender: TObject);
begin
  fPrevRelPedEmb := TfPrevRelPedEmb.Create(Self);
  fPrevRelPedEmb.ShowModal;
end;

procedure TfMenuP.AProdutosporColeoeMercado1Click(Sender: TObject);
begin
  fPrevProdColecao := TfPrevProdColecao.Create(Self);
  fPrevProdColecao.ShowModal;
end;

procedure TfMenuP.N1ICMS1Click(Sender: TObject);
begin
  fPrevICMS := TfPrevICMS.Create(Self);
  fPrevICMS.ShowModal;
end;

procedure TfMenuP.N6Devolues1Click(Sender: TObject);
begin
  fDevolucao := TfDevolucao.Create(Self);
  fDevolucao.ShowModal;
end;

procedure TfMenuP.N6Defeitos1Click(Sender: TObject);
begin
  fDefeitos := TfDefeitos.Create(Self);
  fDefeitos.ShowModal;
end;

procedure TfMenuP.N5TransfernciadeICMS1Click(Sender: TObject);
begin
  fPrevTransfICMS := TfPrevTransfICMS.Create(Self);
  fPrevTransfICMS.ShowModal;
end;

procedure TfMenuP.N6Construo1Click(Sender: TObject);
begin
  fConstrucao := TfConstrucao.Create(Self);
  fConstrucao.ShowModal;
end;

procedure TfMenuP.CProjeo1Click(Sender: TObject);
begin
  fPrevProjecao := TfPrevProjecao.Create(Self);
  fPrevProjecao.ShowModal;
end;

procedure TfMenuP.N5EstoqueIntermedirio1Click(Sender: TObject);
begin
  fPrevEstIntermediario := TfPrevEstIntermediario.Create(Self);
  fPrevEstIntermediario.ShowModal;
end;

procedure TfMenuP.N0PrevisoOC1Click(Sender: TObject);
begin
  fPrevPrevisaoOC := TfPrevPrevisaoOC.Create(self);
  fPrevPrevisaoOC.ShowModal;
end;

procedure TfMenuP.PrevisodeComisso1Click(Sender: TObject);
begin
  fPrevPrevComissao := TfPrevPrevComissao.Create(Self);
  fPrevPrevComissao.ShowModal;
end;

procedure TfMenuP.EstoqueIntermedirioMercInterno1Click(Sender: TObject);
begin
  fPrevEstIntermediarioMI := TfPrevEstIntermediarioMI.Create(Self);
  fPrevEstIntermediarioMI.ShowModal;
end;

procedure TfMenuP.N8LanamentodeComissoModelista1Click(Sender: TObject);
begin
  fLancComissaoMod := TfLancComissaoMod.Create(Self);
  fLancComissaoMod.ShowModal;
end;

procedure TfMenuP.Faturamento2Click(Sender: TObject);
begin
  fPrevFaturamento := TfPrevFaturamento.Create(Self);
  fPrevFaturamento.ShowModal;
end;

procedure TfMenuP.RtulosImpressoraTrmica1Click(Sender: TObject);
begin
  fPrevRelRotulos2 := TfPrevRelRotulos2.Create(Self);
  fPrevRelRotulos2.ShowModal;
end;

procedure TfMenuP.ConsultaOrdemdeCompraPendetesEntregues1Click(
  Sender: TObject);
begin
  fConsOC := TfConsOC.Create(Self);
  fConsOC.ShowModal;
end;

procedure TfMenuP.ContasaReceberNovo1Click(Sender: TObject);
begin
  fContasReceber2 := TfContasReceber2.Create(Self);
  fContasReceber2.ShowModal;
end;

procedure TfMenuP.ConsultaFaturamento1Click(Sender: TObject);
begin
  fHistGeral := TfHistGeral.Create(Self);
  fHistGeral.ShowModal;
end;

procedure TfMenuP.MovimentoSetor1Click(Sender: TObject);
begin
  fConsMovSetor := TfConsMovSetor.Create(Self);
  fConsMovSetor.ShowModal;
end;

procedure TfMenuP.ArmazenamentodeReferncias1Click(Sender: TObject);
begin
  fArmazenamento_RefC := TfArmazenamento_RefC.Create(Self);
  fArmazenamento_RefC.ShowModal;
  fArmazenamento_RefC.Free;
end;

procedure TfMenuP.Confirmao1Click(Sender: TObject);
begin
  fConfirmacao := TfConfirmacao.Create(Self);
  fConfirmacao.ShowModal;
  fConfirmacao.Free;
end;

procedure TfMenuP.LocalizaodeNavalhas1Click(Sender: TObject);
begin
  fNavalha_LocalC := TfNavalha_LocalC.Create(Self);
  fNavalha_LocalC.ShowModal;
  fNavalha_LocalC.Free;
end;

procedure TfMenuP.FichaConsumodeMateriais1Click(Sender: TObject);
begin
  fFichaConsumoMat := TfFichaConsumoMat.Create(Self);
  fFichaConsumoMat.ShowModal;
end;

procedure TfMenuP.VendasporVendedorModelo1Click(Sender: TObject);
begin
  fPrevVendasVendModelo := TfPrevVendasVendModelo.Create(Self);
  fPrevVendasVendModelo.ShowModal;
end;

procedure TfMenuP.ConsultaSituaodosPedidos1Click(Sender: TObject);
begin
  fConsPedidoBR := TfConsPedidoBR.Create(Self);
  fConsPedidoBR.ShowModal;
end;

procedure TfMenuP.AlteraodeFbricaTales1Click(Sender: TObject);
begin
  fTalaoTrocaFabrica := TfTalaoTrocaFabrica.Create(Self);
  fTalaoTrocaFabrica.ShowModal;
end;

procedure TfMenuP.ConsultaEstoqueporPerodo1Click(Sender: TObject);
begin
  fConsConsumoMat := TfConsConsumoMat.Create(Self);
  fConsConsumoMat.ShowModal;
end;

procedure TfMenuP.ContasaPagarNovo1Click(Sender: TObject);
begin
  fContasPagar2 := TfContasPagar2.Create(Self);
  fContasPagar2.ShowModal;
end;

procedure TfMenuP.ipodeMaterial1Click(Sender: TObject);
begin
  fTipoMaterial := TfTipoMaterial.Create(Self);
  fTipoMaterial.vTipoMat := 'F';
  fTipoMaterial.ShowModal;
end;

procedure TfMenuP.ipoMaterialProduto1Click(Sender: TObject);
begin
  fTipoMaterial := TfTipoMaterial.Create(Self);
  fTipoMaterial.vTipoMat := 'P';
  fTipoMaterial.ShowModal;
end;

procedure TfMenuP.Programao1Click(Sender: TObject);
begin
  fPrevRelProgramacao := TfPrevRelProgramacao.Create(Self);
  fPrevRelProgramacao.ShowModal;
end;

procedure TfMenuP.BaixaTaloAuxiliar1Click(Sender: TObject);
begin
  fLeitorTalaoAuxiliar := TfLeitorTalaoAuxiliar.Create(self);
  fLeitorTalaoAuxiliar.ShowModal;
end;

procedure TfMenuP.ConsultaBaixaTaloAuxiliar1Click(Sender: TObject);
begin
  fConsTalaoAuxiliar := TfConsTalaoAuxiliar.Create(Self);
  fConsTalaoAuxiliar.ShowModal;
end;

procedure TfMenuP.ConsultaMaterialNaFichaTcnica1Click(Sender: TObject);
begin
  fConsMaterialFicha := TfConsMaterialFicha.Create(Self);
  fConsMaterialFicha.ShowModal;
end;

procedure TfMenuP.RelProduo1Click(Sender: TObject);
begin
  fRelProducao := TfRelProducao.Create(Self);
  fRelProducao.ShowModal; 
end;

procedure TfMenuP.ConsultaLoteProduzidoPendente1Click(Sender: TObject);
begin
  fConsLoteProdPend := TfConsLoteProdPend.Create(Self);
  fConsLoteProdPend.ShowModal;
end;

procedure TfMenuP.Filial1Click(Sender: TObject);
begin
  fFilial := TfFilial.Create(Self);
  fFilial.ShowModal;
end;

procedure TfMenuP.Pasees1Click(Sender: TObject);
begin
  fPais := TfPais.Create(Self);
  fPais.ShowModal;
end;

procedure TfMenuP.CadastrodeItensdeAjusteComplementar1Click(
  Sender: TObject);
begin
  fOutrosServicosNota := TfoutrosServicosNota.Create(Self);
  fOutrosServicosNota.ShowModal;
end;

procedure TfMenuP.DuplicatasWindows1Click(Sender: TObject);
begin
  fPrevRelDuplicatas := TfPrevRelDuplicatas.Create(Self);
  fPrevRelDuplicatas.ShowModal;
end;

procedure TfMenuP.BitBtn1Click(Sender: TObject);
begin
  fVerificaContasRecPag := TfVerificaContasRecPag.Create(Self);
  fVerificaContasRecPag.ShowModal;
end;

procedure TfMenuP.ClculodeMateriaisporLote1Click(Sender: TObject);
begin
  fPrevCalcMaterialLote2 := TfPrevCalcMaterialLote2.Create(Self);
  fPrevCalcMaterialLote2.ShowModal;
end;

procedure TfMenuP.CSOSNClick(
  Sender: TObject);
begin
  fSitTributariaSimples := TfSitTributariaSimples.Create(Self);
  fSitTributariaSimples.ShowModal;
end;

procedure TfMenuP.OrigemMercadoria1Click(Sender: TObject);
begin
  fOrigemProd := TfOrigemProd.Create(Self);
  fOrigemProd.ShowModal;
end;

procedure TfMenuP.PercentualSimples1Click(Sender: TObject);
begin
  fPercSimples := TfPercSimples.Create(Self);
  fPercSimples.ShowModal;
end;

procedure TfMenuP.RegimeTributrio1Click(Sender: TObject);
begin
  fRegimeTrib := TfRegimeTrib.Create(Self);
  fRegimeTrib.ShowModal;
end;

procedure TfMenuP.abelaCofins1Click(Sender: TObject);
begin
  fTabCofins := TfTabCofins.Create(Self);
  fTabCofins.ShowModal;
end;

procedure TfMenuP.abelaPis1Click(Sender: TObject);
begin
  fTabPis := TfTabPis.Create(Self);
  fTabPis.ShowModal;
end;

procedure TfMenuP.InutilizarNumeraodeNota1Click(Sender: TObject);
begin
  fNFeInutilizacao := TfNFeInutilizacao.Create(Self);
  fNFeInutilizacao.ShowModal;
end;

procedure TfMenuP.BitBtn2Click(Sender: TObject);
begin
  fVerificaGradeMateriais := TfVerificaGradeMateriais.Create(Self);
  fVerificaGradeMateriais.ShowModal;
end;

procedure TfMenuP.Compania1Click(Sender: TObject);
begin
  fCia := TfCia.Create(Self);
  fCia.ShowModal;
end;

procedure TfMenuP.EmailsNFe1Click(Sender: TObject);
begin
  fEmailNFeC := TfEmailNFeC.Create(Self);
  fEmailNFeC.ShowModal;
end;

procedure TfMenuP.FichaTcnicadeConstruo1Click(Sender: TObject);
begin
  fFichaConstrucaoC := TfFichaConstrucaoC.Create(Self);
  fFichaConstrucaoC.ShowModal;
end;

procedure TfMenuP.PosioFichadeTcnicadeConstruo1Click(Sender: TObject);
begin
  fPosicaoFichaC := TfPosicaoFichaC.Create(Self);
  fPosicaoFichaC.ShowModal;
end;

procedure TfMenuP.NFeEmailsAdicionais1Click(Sender: TObject);
begin
  fNFeEmailC := TfNFeEmailC.Create(Self);
  fNFeEmailC.ShowModal;
end;

procedure TfMenuP.GerarEstoqueEFDSPED1Click(Sender: TObject);
begin
  fGerarEFD := TfGerarEFD.Create(Self);
  fGerarEFD.ShowModal;
end;

procedure TfMenuP.BitBtn3Click(Sender: TObject);
begin
  fGeraFB := TfGeraFB.Create(Self);
  fGeraFB.ShowModal;
end;

procedure TfMenuP.ProdutosVendidos1Click(Sender: TObject);
begin
  fProdutosVendidos := TfProdutosVendidos.Create(Self);
  fProdutosVendidos.ShowModal;
end;

procedure TfMenuP.ConsultaMaterialPorPerodo1Click(Sender: TObject);
begin
  fConsMaterialPeriodo := TfConsMaterialPeriodo.Create(Self);
  fConsMaterialPeriodo.ShowModal;
end;

procedure TfMenuP.Etiqueta1Click(Sender: TObject);
begin
  fEtiqNota := TfEtiqNota.Create(Self);
  fEtiqNota.ShowModal;
end;

procedure TfMenuP.BitBtn4Click(Sender: TObject);
begin
  fConvFotoProd := TfConvFotoProd.Create(Self);
  fConvFotoProd.ShowModal;
end;

procedure TfMenuP.Prnovo1Click(Sender: TObject);
begin
  fPrevPre2 := TfPrevPre2.Create(Self);
  fPrevPre2.ShowModal;
end;

procedure TfMenuP.BitBtn5Click(Sender: TObject);
begin
  fGeraFB_Exc := TfGeraFB_Exc.Create(Self);
  fGeraFB_Exc.ShowModal;
end;

procedure TfMenuP.BitBtn6Click(Sender: TObject);
begin
  fGeraFBMI_Exc := TfGeraFBMI_Exc.Create(Self);
  fGeraFBMI_Exc.ShowModal;
end;

procedure TfMenuP.EnquadramentoIP1Click(Sender: TObject);
begin
  fTabEnqIPIC := TfTabEnqIPIC.Create(Self);
  fTabEnqIPIC.ShowModal;
end;

initialization
 RLConsts.SetVersion(3,72,'B');

end.

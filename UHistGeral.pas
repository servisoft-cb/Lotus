unit UHistGeral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ToolEdit, Mask, CurrEdit, RxLookup, Buttons, Grids,
  DBGrids, SMDBGrid, RzTabs, DB, DBTables, RXCtrls, DBClient, ComCtrls;

type
  TfHistGeral = class(TForm)
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    DateEdit2: TDateEdit;
    RxDBLookupCombo4: TRxDBLookupCombo;
    DateEdit1: TDateEdit;
    RzPageControl2: TRzPageControl;
    TabSheet1: TRzTabSheet;
    SMDBGrid3: TSMDBGrid;
    BitBtn5: TBitBtn;
    qCliente: TQuery;
    BitBtn1: TBitBtn;
    qClienteCodCli: TIntegerField;
    qClienteNome: TStringField;
    qClienteFantasia: TStringField;
    qClienteVlrTotal: TFloatField;
    qFaturamento: TQuery;
    qFaturamentoVlrTotal: TFloatField;
    Label4: TLabel;
    qClienteQtd: TFloatField;
    TabSheet2: TRzTabSheet;
    qClienteProd: TQuery;
    SMDBGrid1: TSMDBGrid;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    qClienteProdCodCli: TIntegerField;
    qClienteProdFantasia: TStringField;
    qClienteProdNomeCliente: TStringField;
    qClienteProdCodProduto: TIntegerField;
    qClienteProdReferencia: TStringField;
    qClienteProdNomeProduto: TStringField;
    qClienteProdVlrTotal: TFloatField;
    qClienteProdQtd: TFloatField;
    Label8: TLabel;
    TabSheet3: TRzTabSheet;
    qClienteMes: TQuery;
    mClienteMes: TClientDataSet;
    mClienteMesNomeCliente: TStringField;
    mClienteMesFantasia: TStringField;
    mClienteMesCodCliente: TIntegerField;
    dsmClienteMes: TDataSource;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    mClienteMesVlrFaturamento1: TFloatField;
    mClienteMesVlrFaturamento2: TFloatField;
    mClienteMesVlrFaturamento3: TFloatField;
    mClienteMesVlrFaturamento4: TFloatField;
    mClienteMesVlrFaturamento5: TFloatField;
    mClienteMesVlrFaturamento6: TFloatField;
    mClienteMesVlrFaturamento7: TFloatField;
    mClienteMesVlrFaturamento8: TFloatField;
    mClienteMesVlrFaturamento9: TFloatField;
    mClienteMesVlrFaturamento10: TFloatField;
    mClienteMesVlrFaturamento11: TFloatField;
    mClienteMesVlrFaturamento12: TFloatField;
    mClienteMesQtd1: TFloatField;
    mClienteMesQtd2: TFloatField;
    mClienteMesQtd3: TFloatField;
    mClienteMesQtd4: TFloatField;
    mClienteMesQtd5: TFloatField;
    mClienteMesQtd6: TFloatField;
    mClienteMesQtd7: TFloatField;
    mClienteMesQtd8: TFloatField;
    mClienteMesQtd9: TFloatField;
    mClienteMesQtd10: TFloatField;
    mClienteMesQtd11: TFloatField;
    mClienteMesQtd12: TFloatField;
    mClienteMesVlrFaturamento13: TFloatField;
    mClienteMesQtd13: TFloatField;
    mClienteMesPerc1: TFloatField;
    mClienteMesPerc2: TFloatField;
    mClienteMesPerc3: TFloatField;
    mClienteMesPerc4: TFloatField;
    mClienteMesPerc5: TFloatField;
    mClienteMesPerc6: TFloatField;
    mClienteMesPerc7: TFloatField;
    mClienteMesPerc8: TFloatField;
    mClienteMesPerc9: TFloatField;
    mClienteMesPerc10: TFloatField;
    mClienteMesPerc11: TFloatField;
    mClienteMesPerc12: TFloatField;
    mClienteMesPerc13: TFloatField;
    mDatas: TClientDataSet;
    mDatasData: TStringField;
    mDatasIndice: TIntegerField;
    qClienteMesDtEmissao: TDateField;
    qClienteMesPercDesc: TFloatField;
    qClienteMesVlrTotal: TFloatField;
    qClienteMesCodCli: TIntegerField;
    qClienteMesQtd: TFloatField;
    SMDBGrid2: TSMDBGrid;
    ProgressBar1: TProgressBar;
    mClienteMesVlrTotal: TFloatField;
    qFaturamentoPercDesc: TFloatField;
    qClientePercDesc: TFloatField;
    mCliente: TClientDataSet;
    mClienteCodCliente: TIntegerField;
    mClienteNomeCliente: TStringField;
    mClienteFantasia: TStringField;
    mClienteVlrTotal: TFloatField;
    mClientePercFat: TFloatField;
    mClienteQtd: TFloatField;
    dsmCliente: TDataSource;
    mClienteProd: TClientDataSet;
    mClienteProdCodCliente: TIntegerField;
    mClienteProdFantasia: TStringField;
    mClienteProdNomeCliente: TStringField;
    mClienteProdCodProduto: TIntegerField;
    mClienteProdReferencia: TStringField;
    mClienteProdNomeProduto: TStringField;
    mClienteProdVlrTotal: TFloatField;
    mClienteProdQtd: TFloatField;
    mClienteProdPercFat: TFloatField;
    qClienteProdPercDesc: TFloatField;
    dsmClienteProd: TDataSource;
    ProgressBar2: TProgressBar;
    ProgressBar3: TProgressBar;
    TabSheet4: TRzTabSheet;
    qProduto: TQuery;
    mProduto: TClientDataSet;
    dsmProduto: TDataSource;
    mProdutoCodProduto: TIntegerField;
    mProdutoReferencia: TStringField;
    mProdutoNomeProduto: TStringField;
    mProdutoVlrTotal: TFloatField;
    mProdutoPercFat: TFloatField;
    mProdutoQtd: TFloatField;
    ProgressBar4: TProgressBar;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    qProdutoVlrTotal: TFloatField;
    qProdutoQtd: TFloatField;
    qProdutoPercDesc: TFloatField;
    qProdutoCodProduto: TIntegerField;
    qProdutoReferencia: TStringField;
    qProdutoNome: TStringField;
    SMDBGrid4: TSMDBGrid;
    TabSheet5: TRzTabSheet;
    qClienteProdCor: TQuery;
    qClienteProdCorCodCli: TIntegerField;
    qClienteProdCorFantasia: TStringField;
    qClienteProdCorNomeCliente: TStringField;
    qClienteProdCorCodProduto: TIntegerField;
    qClienteProdCorReferencia: TStringField;
    qClienteProdCorNomeProduto: TStringField;
    qClienteProdCorVlrTotal: TFloatField;
    qClienteProdCorQtd: TFloatField;
    qClienteProdCorPercDesc: TFloatField;
    qClienteProdCorCodCor: TIntegerField;
    ProgressBar5: TProgressBar;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    mClienteProdCor: TClientDataSet;
    mClienteProdCorCodCliente: TIntegerField;
    mClienteProdCorCodProduto: TIntegerField;
    mClienteProdCorCodCor: TIntegerField;
    mClienteProdCorNomeCliente: TStringField;
    mClienteProdCorFantasia: TStringField;
    mClienteProdCorReferencia: TStringField;
    mClienteProdCorNomeProduto: TStringField;
    mClienteProdCorNomeCor: TStringField;
    mClienteProdCorVlrTotal: TFloatField;
    mClienteProdCorQtd: TFloatField;
    mClienteProdCorPercFat: TFloatField;
    SMDBGrid5: TSMDBGrid;
    dsmClienteProdCor: TDataSource;
    TabSheet6: TRzTabSheet;
    ProgressBar6: TProgressBar;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    SMDBGrid6: TSMDBGrid;
    qVendedor: TQuery;
    qVendedorVlrTotal: TFloatField;
    qVendedorQtd: TFloatField;
    qVendedorPercDesc: TFloatField;
    qVendedorCodVendedor: TIntegerField;
    mVendedor: TClientDataSet;
    mVendedorCodVendedor: TIntegerField;
    mVendedorNomeVendedor: TStringField;
    mVendedorVlrTotal: TFloatField;
    mVendedorQtd: TFloatField;
    mVendedorPercFat: TFloatField;
    dsmVendedor: TDataSource;
    TabSheet7: TRzTabSheet;
    SMDBGrid7: TSMDBGrid;
    qNotas: TQuery;
    dsqNotas: TDataSource;
    qNotasCodCli: TIntegerField;
    qNotasFantasia: TStringField;
    qNotasNomeCliente: TStringField;
    qNotasPercDesc: TFloatField;
    qNotasCodProduto: TIntegerField;
    qNotasCodCor: TIntegerField;
    qNotasNumNota: TIntegerField;
    qNotasDtEmissao: TDateField;
    qNotasReferencia: TStringField;
    qNotasDescMaterial: TStringField;
    qNotasNomeProduto: TStringField;
    qNotasUnidade: TStringField;
    qNotasQtd: TFloatField;
    qNotasIcms: TFloatField;
    qNotasIpi: TFloatField;
    qNotasVlrUnit: TFloatField;
    qNotasVlrTotal: TFloatField;
    qNotasNatOper: TSmallintField;
    qNotaslkNomeCor: TStringField;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    qNotaslkCodNatOper: TStringField;
    qNotasCondPgto: TStringField;
    qPedidoCliMes: TQuery;
    qPedidoCliMesCodCliente: TIntegerField;
    qPedidoCliMesQtdPares: TFloatField;
    qPedidoCliMesQtdParesRest: TFloatField;
    mClienteMesQtdPedido1: TFloatField;
    mClienteMesQtdPedido2: TFloatField;
    mClienteMesQtdPedido3: TFloatField;
    mClienteMesQtdPedido4: TFloatField;
    mClienteMesQtdPedido5: TFloatField;
    mClienteMesQtdPedido6: TFloatField;
    mClienteMesQtdPedido7: TFloatField;
    mClienteMesQtdPedido8: TFloatField;
    mClienteMesQtdPedido9: TFloatField;
    mClienteMesQtdPedido10: TFloatField;
    mClienteMesQtdPedido11: TFloatField;
    mClienteMesQtdPedido12: TFloatField;
    mClienteMesQtdPedido13: TFloatField;
    mClienteMesQtdRestante1: TFloatField;
    mClienteMesQtdRestante2: TFloatField;
    mClienteMesQtdRestante3: TFloatField;
    mClienteMesQtdRestante4: TFloatField;
    mClienteMesQtdRestante5: TFloatField;
    mClienteMesQtdRestante6: TFloatField;
    mClienteMesQtdRestante7: TFloatField;
    mClienteMesQtdRestante8: TFloatField;
    mClienteMesQtdRestante9: TFloatField;
    mClienteMesQtdRestante10: TFloatField;
    mClienteMesQtdRestante11: TFloatField;
    mClienteMesQtdRestante12: TFloatField;
    mClienteMesQtdRestante13: TFloatField;
    CheckBox1: TCheckBox;
    qPedidoProd: TQuery;
    qPedidoProdQtdPares: TFloatField;
    qPedidoProdQtdParesRest: TFloatField;
    qPedidoProdCodProduto: TIntegerField;
    qPedidoProdQtdParesCanc: TFloatField;
    mProdutoQtdPedido: TFloatField;
    mProdutoQtdRestante: TFloatField;
    qPedidoProdReferencia: TStringField;
    qPedidoProdNome: TStringField;
    mProdutoQtdCancelada: TFloatField;
    TabSheet8: TRzTabSheet;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    ProgressBar7: TProgressBar;
    CheckBox2: TCheckBox;
    qProdutoMes: TQuery;
    qProdutoMesDtEmissao: TDateField;
    qProdutoMesPercDesc: TFloatField;
    qProdutoMesVlrTotal: TFloatField;
    qProdutoMesQtd: TFloatField;
    qProdutoMesCodProduto: TIntegerField;
    qProdutoMesDescricao: TStringField;
    qProdutoMesReferencia: TStringField;
    qPedidoProdMes: TQuery;
    SMDBGrid8: TSMDBGrid;
    dsmProdutoMes: TDataSource;
    qPedidoProdMesDtReprogramacao: TDateField;
    qPedidoProdMesQtdPares: TFloatField;
    qPedidoProdMesQtdParesRest: TFloatField;
    qPedidoProdMesCodProduto: TIntegerField;
    qPedidoProdMesQtdParesCanc: TFloatField;
    mProdutoMes: TClientDataSet;
    mProdutoMesCodProduto: TIntegerField;
    mProdutoMesReferencia: TStringField;
    mProdutoMesNomeProduto: TStringField;
    mProdutoMesQtdCancelada1: TFloatField;
    mProdutoMesQtdCancelada2: TFloatField;
    mProdutoMesQtdCancelada3: TFloatField;
    mProdutoMesQtdCancelada4: TFloatField;
    mProdutoMesQtdCancelada5: TFloatField;
    mProdutoMesQtdCancelada6: TFloatField;
    mProdutoMesQtdCancelada7: TFloatField;
    mProdutoMesQtdCancelada8: TFloatField;
    mProdutoMesQtdCancelada9: TFloatField;
    mProdutoMesQtdCancelada10: TFloatField;
    mProdutoMesQtdCancelada11: TFloatField;
    mProdutoMesQtdCancelada12: TFloatField;
    mProdutoMesQtdCancelada13: TFloatField;
    mProdutoMesQtd1: TFloatField;
    mProdutoMesQtd2: TFloatField;
    mProdutoMesQtd3: TFloatField;
    mProdutoMesQtd4: TFloatField;
    mProdutoMesQtd5: TFloatField;
    mProdutoMesQtd6: TFloatField;
    mProdutoMesQtd7: TFloatField;
    mProdutoMesQtd8: TFloatField;
    mProdutoMesQtd9: TFloatField;
    mProdutoMesQtd10: TFloatField;
    mProdutoMesQtd11: TFloatField;
    mProdutoMesQtd12: TFloatField;
    mProdutoMesQtd13: TFloatField;
    mProdutoMesQtdPedido1: TFloatField;
    mProdutoMesQtdPedido2: TFloatField;
    mProdutoMesQtdPedido3: TFloatField;
    mProdutoMesQtdPedido4: TFloatField;
    mProdutoMesQtdPedido5: TFloatField;
    mProdutoMesQtdPedido6: TFloatField;
    mProdutoMesQtdPedido7: TFloatField;
    mProdutoMesQtdPedido8: TFloatField;
    mProdutoMesQtdPedido9: TFloatField;
    mProdutoMesQtdPedido10: TFloatField;
    mProdutoMesQtdPedido11: TFloatField;
    mProdutoMesQtdPedido12: TFloatField;
    mProdutoMesQtdPedido13: TFloatField;
    mProdutoMesQtdRestante1: TFloatField;
    mProdutoMesQtdRestante2: TFloatField;
    mProdutoMesQtdRestante3: TFloatField;
    mProdutoMesQtdRestante4: TFloatField;
    mProdutoMesQtdRestante5: TFloatField;
    mProdutoMesQtdRestante6: TFloatField;
    mProdutoMesQtdRestante7: TFloatField;
    mProdutoMesQtdRestante8: TFloatField;
    mProdutoMesQtdRestante9: TFloatField;
    mProdutoMesQtdRestante10: TFloatField;
    mProdutoMesQtdRestante11: TFloatField;
    mProdutoMesQtdRestante12: TFloatField;
    mProdutoMesQtdRestante13: TFloatField;
    mProdutoMesVlrFaturamento2: TFloatField;
    mProdutoMesVlrFaturamento3: TFloatField;
    mProdutoMesVlrFaturamento4: TFloatField;
    mProdutoMesVlrFaturamento5: TFloatField;
    mProdutoMesVlrFaturamento6: TFloatField;
    mProdutoMesVlrFaturamento7: TFloatField;
    mProdutoMesVlrFaturamento8: TFloatField;
    mProdutoMesVlrFaturamento9: TFloatField;
    mProdutoMesVlrFaturamento10: TFloatField;
    mProdutoMesVlrFaturamento11: TFloatField;
    mProdutoMesVlrFaturamento12: TFloatField;
    mProdutoMesVlrFaturamento13: TFloatField;
    mProdutoMesVlrFaturamento1: TFloatField;
    mProdutoMesPerc1: TFloatField;
    mProdutoMesPerc2: TFloatField;
    mProdutoMesPerc3: TFloatField;
    mProdutoMesPerc4: TFloatField;
    mProdutoMesPerc5: TFloatField;
    mProdutoMesPerc6: TFloatField;
    mProdutoMesPerc7: TFloatField;
    mProdutoMesPerc8: TFloatField;
    mProdutoMesPerc9: TFloatField;
    mProdutoMesPerc10: TFloatField;
    mProdutoMesPerc11: TFloatField;
    mProdutoMesPerc12: TFloatField;
    mProdutoMesPerc13: TFloatField;
    mProdutoMesVlrTotal: TFloatField;
    mClienteMesQtdCancelada1: TFloatField;
    mClienteMesQtdCancelada2: TFloatField;
    mClienteMesQtdCancelada3: TFloatField;
    mClienteMesQtdCancelada4: TFloatField;
    mClienteMesQtdCancelada5: TFloatField;
    mClienteMesQtdCancelada6: TFloatField;
    mClienteMesQtdCancelada7: TFloatField;
    mClienteMesQtdCancelada8: TFloatField;
    mClienteMesQtdCancelada9: TFloatField;
    mClienteMesQtdCancelada10: TFloatField;
    mClienteMesQtdCancelada11: TFloatField;
    mClienteMesQtdCancelada12: TFloatField;
    mClienteMesQtdCancelada13: TFloatField;
    qPedidoCliMesQtdParesCanc: TFloatField;
    mFatMensal: TClientDataSet;
    mFatMensalVlrFaturamento: TFloatField;
    qFaturamentoDtEmissao: TDateField;
    mFatMensalData: TStringField;
    TabSheet9: TRzTabSheet;
    ProgressBar8: TProgressBar;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    SMDBGrid9: TSMDBGrid;
    mClienteProdMes: TClientDataSet;
    mClienteProdMesCodCliente: TIntegerField;
    mClienteProdMesFantasia: TStringField;
    mClienteProdMesNomeCliente: TStringField;
    mClienteProdMesAno: TIntegerField;
    mClienteProdMesMes: TIntegerField;
    mClienteProdMesQtdFaturada: TFloatField;
    mClienteProdMesQtdPedido: TFloatField;
    mClienteProdMesQtdRestante: TFloatField;
    mClienteProdMesQtdCancelada: TFloatField;
    mClienteProdMesVlrFaturamento: TFloatField;
    mClienteProdMesPerc: TFloatField;
    qClienteProdMes: TQuery;
    qClienteProdMesDtEmissao: TDateField;
    qClienteProdMesCodCli: TIntegerField;
    qClienteProdMesCodProduto: TIntegerField;
    qClienteProdMesQtd: TFloatField;
    qClienteProdMesVlrTotal: TFloatField;
    qClienteProdMesPercDesc: TFloatField;
    qClienteProdMesReferencia: TStringField;
    qClienteProdMesDescricao: TStringField;
    mClienteProdMesCodProduto: TIntegerField;
    mClienteProdMesReferencia: TStringField;
    mClienteProdMesNomeProduto: TStringField;
    dsmClienteProdMes: TDataSource;
    qPedidoCliProdMes: TQuery;
    qPedidoCliProdMesDtReprogramacao: TDateField;
    qPedidoCliProdMesQtdPares: TFloatField;
    qPedidoCliProdMesQtdParesRest: TFloatField;
    qPedidoCliProdMesCodProduto: TIntegerField;
    qPedidoCliProdMesQtdParesCanc: TFloatField;
    qPedidoCliProdMesCodCliente: TIntegerField;
    qPedidoCliProd: TQuery;
    qPedidoCliProdQtdPares: TFloatField;
    qPedidoCliProdQtdParesRest: TFloatField;
    qPedidoCliProdQtdParesCanc: TFloatField;
    qPedidoCliProdCodProduto: TIntegerField;
    qPedidoCliProdReferencia: TStringField;
    qPedidoCliProdNome: TStringField;
    qPedidoCliProdCodCliente: TIntegerField;
    mClienteProdQtdPedido: TFloatField;
    mClienteProdQtdRestante: TFloatField;
    mClienteProdQtdCancelada: TFloatField;
    ComboBox1: TComboBox;
    Label9: TLabel;
    mClienteCodGrupo: TIntegerField;
    mClienteCodAgrupado: TStringField;
    mClienteProdCodGrupo: TIntegerField;
    mClienteProdCodAgrupado: TStringField;
    qPedidoCliProdNomeCliente: TStringField;
    qPedidoCliProdFantasia: TStringField;
    mClienteProdMesCodGrupo: TIntegerField;
    mClienteProdMesCodAgrupado: TStringField;
    qClienteProdMesNomeCliente: TStringField;
    qClienteProdMesFantasia: TStringField;
    qPedidoCliProdMesNomeCliente: TStringField;
    qPedidoCliProdMesFantasia: TStringField;
    mClienteProdCorCodGrupo: TIntegerField;
    mClienteProdCorCodAgrupado: TStringField;
    mClienteMesCodGrupo: TIntegerField;
    mClienteMesCodAgrupado: TStringField;
    qClienteMesNomeCliente: TStringField;
    qClienteMesFantasia: TStringField;
    qPedidoCliMesNomeCliente: TStringField;
    qPedidoCliMesFantasia: TStringField;
    BitBtn21: TBitBtn;
    qPedidoProdMesCli: TQuery;
    qProdutoMesCli: TQuery;
    qProdutoMesCliCodCli: TIntegerField;
    qProdutoMesCliDtEmissao: TDateField;
    qProdutoMesCliPercDesc: TFloatField;
    qProdutoMesCliVlrTotal: TFloatField;
    qProdutoMesCliQtd: TFloatField;
    qProdutoMesCliCodProduto: TIntegerField;
    qProdutoMesCliDescricao: TStringField;
    qProdutoMesCliReferencia: TStringField;
    qPedidoProdMesCliCodCliente: TIntegerField;
    qPedidoProdMesCliQtdPares: TFloatField;
    qPedidoProdMesCliQtdParesRest: TFloatField;
    qPedidoProdMesCliCodProduto: TIntegerField;
    qPedidoProdMesCliQtdParesCanc: TFloatField;
    mProdutoMesCodCliente: TIntegerField;
    mProdutoMesCodAgrupado: TStringField;
    CheckBox4: TCheckBox;
    mClienteProdMesRes: TClientDataSet;
    mClienteProdMesResCodCliente: TIntegerField;
    mClienteProdMesResNomeCliente: TStringField;
    mClienteProdMesResFantasia: TStringField;
    mClienteProdMesResReferencia: TStringField;
    mClienteProdMesResModelo: TStringField;
    mClienteProdMesResNomeProduto: TStringField;
    mClienteProdMesResCodProduto: TIntegerField;
    mClienteProdMesResVlrFaturamento1: TFloatField;
    mClienteProdMesResVlrFaturamento2: TFloatField;
    mClienteProdMesResVlrFaturamento3: TFloatField;
    mClienteProdMesResVlrFaturamento4: TFloatField;
    mClienteProdMesResVlrFaturamento5: TFloatField;
    mClienteProdMesResVlrFaturamento6: TFloatField;
    mClienteProdMesResVlrFaturamento7: TFloatField;
    mClienteProdMesResVlrFaturamento8: TFloatField;
    mClienteProdMesResVlrFaturamento9: TFloatField;
    mClienteProdMesResVlrFaturamento10: TFloatField;
    mClienteProdMesResVlrFaturamento11: TFloatField;
    mClienteProdMesResVlrFaturamento12: TFloatField;
    mClienteProdMesResVlrFaturamento13: TFloatField;
    TabSheet10: TRzTabSheet;
    ProgressBar9: TProgressBar;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    SMDBGrid10: TSMDBGrid;
    dsmClienteProdMesRes: TDataSource;
    mClienteProdMesResCodGrupo: TIntegerField;
    mClienteProdMesResCodAgrupado: TStringField;
    mClienteProdMesResVlrTotal: TFloatField;
    RxLabel3: TRxLabel;
    CurrencyEdit1: TCurrencyEdit;
    mClienteVlrDevolucao: TFloatField;
    mClienteVlrFatBruto: TFloatField;
    mClienteProdVlrDevolucao: TFloatField;
    mClienteProdVlrFatBruto: TFloatField;
    qPedidoProdMesCliDtReprogramacao: TDateField;
    qPedidoCliMesDtReprogramacao: TDateField;
    RxLabel1: TRxLabel;
    CurrencyC200: TCurrencyEdit;
    RxLabel2: TRxLabel;
    CurrencyFat: TCurrencyEdit;
    CheckBox3: TCheckBox;
    mFatMensalVlrC200: TFloatField;
    mFatMensalVlrFatTotal: TFloatField;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure RxDBLookupCombo3Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure mClienteMesNewRecord(DataSet: TDataSet);
    procedure mDatasNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure mClienteNewRecord(DataSet: TDataSet);
    procedure mClienteProdNewRecord(DataSet: TDataSet);
    procedure mProdutoNewRecord(DataSet: TDataSet);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure mClienteProdCorNewRecord(DataSet: TDataSet);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure mProdutoMesNewRecord(DataSet: TDataSet);
    procedure mFatMensalNewRecord(DataSet: TDataSet);
    procedure BitBtn18Click(Sender: TObject);
    procedure qClienteProdMesNewRecord(DataSet: TDataSet);
    procedure BitBtn17Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure SMDBGrid10GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    vCodAgrupado : String;
    procedure Monta_SQLCli;
    procedure Monta_SQLFaturamento;
    procedure Monta_SQLCliProd;
    procedure Monta_SQLCliMes;
    procedure Monta_SQLProdMes;
    procedure Monta_SQLProdMesCli(Tipo : String);
    procedure Monta_Datas(Numero : Integer);
    procedure Monta_SQLProd;
    procedure Monta_SQLCliProdCor;
    procedure Monta_SQLVend;
    procedure Grava_mVendedor(Codigo : Integer);
    procedure Monta_SQLNotas;
    procedure Monta_SQLPedidoCliMes;
    procedure Monta_SQLPedidoCliProd;
    procedure Monta_SQLPedidoCliProdMes;
    procedure Monta_SQLPedidoProdMes;
    procedure Monta_SQLPedidoProdMesCli;
    procedure Monta_SQLPedidoProd;
    procedure Ajusta_Datas;
    procedure Monta_SQLCliProdMes;
    procedure Limpa_TabAuxiliar;
    procedure Grava_mClienteProdMesRes;
  public
    vContadorMes : Integer;
    vComProduto : Boolean;
    { Public declarations }
  end;

var
  fHistGeral: TfHistGeral;

implementation

uses UDM1, URelHistGeralCli, URelHistGeralCliProd, URelHistGeralCliMes,
  URelHistGeralProd, URelHistGeralCliProdCor, URelHistGeralVend,
  URelHistGeralProdMes, URelHistGeralCliProdMes,
  URelHistGeralCliProdMesRes;

{$R *.dfm}

procedure TfHistGeral.Grava_mClienteProdMesRes;
var
  vDataAux : String;
  ano, mes, dia : Word;
  vAux : Real;
  vNomeCliente, vFantasia : String;
begin
  SMDBGrid10.DataSource := nil;
  ProgressBar9.Max      := qProdutoMesCli.RecordCount;
  ProgressBar9.Position := 0;
  mClienteProdMesRes.EmptyDataSet;
  qProdutoMesCli.First;
  while not qProdutoMesCli.Eof do
    begin
      ProgressBar9.Position := ProgressBar9.Position + 1;
      //if (CheckBox3.Checked) and (qProdutoMesCliCodGrupo.AsInteger > 0) then
      //  vCodAgrupado := 'G' + qProdutoMesCliCodGrupo.AsString
      //else
        vCodAgrupado := 'C' + qProdutoMesCliCodCli.AsString;
      if mClienteProdMesRes.Locate('CodAgrupado;CodProduto',VarArrayOf([vCodAgrupado,qProdutoMesCliCodProduto.AsInteger]),[locaseinsensitive]) then
        mClienteProdMesRes.Edit
      else
        begin
          mClienteProdMesRes.Insert;
          mClienteProdMesResCodAgrupado.AsString := vCodAgrupado;
          mClienteProdMesResCodCliente.AsInteger := qProdutoMesCliCodCli.AsInteger;
          mClienteProdMesResCodProduto.AsInteger := qProdutoMesCliCodProduto.AsInteger;
          mClienteProdMesResNomeProduto.AsString := qProdutoMesCliDescricao.AsString;
          if DM1.tProduto.Locate('Codigo',qProdutoMesCliCodProduto.AsInteger,[loCaseInsensitive]) then
            mClienteProdMesResModelo.AsString    := DM1.tProdutoNomeModelo.AsString;
          if DM1.tCliente.Locate('Codigo',qProdutoMesCliCodCli.AsInteger,[loCaseInsensitive]) then
            begin
              mClienteProdMesResNomeCliente.AsString := DM1.tClienteNome.AsString;
              mClienteProdMesResFantasia.AsString    := DM1.tClienteFantasia.AsString;
            end;
          mClienteProdMesResReferencia.AsString  := qProdutoMesCliReferencia.AsString;
        end;
      vNomeCliente := mClienteProdMesResNomeCliente.AsString;
      vFantasia    := mClienteProdMesResFantasia.AsString;
      DecodeDate(qProdutoMesCliDtEmissao.AsDateTime,ano,mes,dia);
      vDataAux := FormatFloat('00',mes) + '/' + FormatFloat('0000',ano);
      mDatas.Locate('Data',vDataAux,[loCaseInsensitive]);
      vAux := 0;
      if qProdutoMesCliPercDesc.AsFloat > 0 then
        vAux := StrToFloat(FormatFloat('0.00',(qProdutoMesCliVlrTotal.AsFloat * qProdutoMesCliPercDesc.AsFloat) / 100));
      mClienteProdMesRes.FieldByName('VlrFaturamento'+mDatasIndice.AsString).AsFloat := mClienteProdMesRes.FieldByName('VlrFaturamento'+mDatasIndice.AsString).AsFloat + StrToFloat(FormatFloat('0.00',qProdutoMesCliVlrTotal.AsFloat - vAux));

      //Total
      mClienteProdMesRes.FieldByName('VlrFaturamento'+IntToStr(vContadorMes + 1)).AsFloat := mClienteProdMesRes.FieldByName('VlrFaturamento'+IntToStr(vContadorMes + 1)).AsFloat + StrToFloat(FormatFloat('0.00',qProdutoMesCliVlrTotal.AsFloat - vAux));
      mClienteProdMesResVlrTotal.AsFloat := mClienteProdMesResVlrTotal.AsFloat + StrToFloat(FormatFloat('0.00',qProdutoMesCliVlrTotal.AsFloat - vAux));
      mClienteProdMesRes.Post;

      {***************************}
      {*** Grava o total geral ***}
      {***************************}
      //Este bloco foi incluido dia 13/07/2007 para imprimir o total geral, aproveitando
      //a mesma tabela auxiliar, a única diferença é que vai imprimir total zero, devido ao
      //indice, ser por ondem decrescente pelo valor
      vCodAgrupado := 'ZZZZZ';
      if mClienteProdMesRes.Locate('Fantasia;Referencia',VarArrayOf([vFantasia,vCodAgrupado]),[locaseinsensitive]) then
        mClienteProdMesRes.Edit
      else
        begin
          mClienteProdMesRes.Insert;
          mClienteProdMesResCodAgrupado.AsString := vCodAgrupado;
          mClienteProdMesResCodProduto.AsInteger := 0;
          mClienteProdMesResNomeProduto.AsString := '';
          mClienteProdMesResReferencia.AsString  := vCodAgrupado;
          mClienteProdMesResNomeCliente.AsString := vNomeCliente;
          mClienteProdMesResFantasia.AsString    := vFantasia;
        end;
      mClienteProdMesRes.FieldByName('VlrFaturamento'+mDatasIndice.AsString).AsFloat := mClienteProdMesRes.FieldByName('VlrFaturamento'+mDatasIndice.AsString).AsFloat + StrToFloat(FormatFloat('0.00',qProdutoMesCliVlrTotal.AsFloat - vAux));
      //Total
      mClienteProdMesRes.FieldByName('VlrFaturamento'+IntToStr(vContadorMes + 1)).AsFloat := mClienteProdMesRes.FieldByName('VlrFaturamento'+IntToStr(vContadorMes + 1)).AsFloat + StrToFloat(FormatFloat('0.00',qProdutoMesCliVlrTotal.AsFloat - vAux));
      mClienteProdMesResVlrTotal.AsFloat := 0;
      mClienteProdMesRes.Post;
      {***Final da gravação do registro total***}
      {*****************************************}

      qProdutoMesCli.Next;
    end;
  SMDBGrid10.DataSource := dsmClienteProdMesRes;
end;

procedure TfHistGeral.Limpa_TabAuxiliar;
begin
  mCliente.EmptyDataSet;
  mClienteProd.EmptyDataSet;
  mClienteProdMes.EmptyDataSet;
  mClienteProdCor.EmptyDataSet;
  mClienteMes.EmptyDataSet;
  mProduto.EmptyDataSet;
  mProdutoMes.EmptyDataSet;
  mVendedor.EmptyDataSet;
end;

procedure TfHistGeral.Monta_SQLPedidoCliProd;
begin
  qPedidoCliProd.Close;
  qPedidoCliProd.SQL.Clear;
  qPedidoCliProd.SQL.Add('SELECT DbpedidoItem.CodProduto, DbPedido.CodCliente, SUM( Dbpedidoitem.QtdPares ) QtdPares, SUM( Dbpedidoitem.QtdParesRest ) QtdParesRest, SUM( Dbpedidoitem.QtdParesCanc ) QtdParesCanc, ');
  //qPedidoCliProd.SQL.Add(' dbProduto.Nome, dbProduto.Referencia, dbCliente.CodGrupo, dbCliente.Nome NomeCliente, dbCliente.Fantasia ');
  qPedidoCliProd.SQL.Add(' dbProduto.Nome, dbProduto.Referencia, dbCliente.Nome NomeCliente, dbCliente.Fantasia ');
  qPedidoCliProd.SQL.Add('FROM "dbPedido.DB" Dbpedido');
  qPedidoCliProd.SQL.Add('   INNER JOIN "dbPedidoItem.DB" Dbpedidoitem');
  qPedidoCliProd.SQL.Add('   ON  (Dbpedido.Pedido = Dbpedidoitem.Pedido)');
  qPedidoCliProd.SQL.Add('   FULL JOIN "dbProduto.DB" Dbproduto');
  qPedidoCliProd.SQL.Add('   ON  (Dbpedidoitem.CodProduto = Dbproduto.Codigo)');
  qPedidoCliProd.SQL.Add('   INNER JOIN "dbCliente.DB" Dbcliente');
  qPedidoCliProd.SQL.Add('   ON  (dbCliente.Codigo = Dbpedido.CodCliente)');
  qPedidoCliProd.SQL.Add('WHERE (0=0) ');
  //if RxDBLookupCombo2.Text <> '' then
  //  begin
  //    qPedidoCliProd.SQL.Add('  AND (dbPedido.Filial = :Filial)');
  //    qPedidoCliProd.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
  //  end;
  if RxDBLookupCombo1.Text <> '' then
    begin
      qPedidoCliProd.SQL.Add('  AND (dbPedido.CodCliente = :CodCli)');
      qPedidoCliProd.ParamByName('CodCli').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if RxDBLookupCombo4.Text <> '' then
    begin
      qPedidoCliProd.SQL.Add('  AND (dbPedido.CodVendedor = :CodVendedor)');
      qPedidoCliProd.ParamByName('CodVendedor').AsInteger  := RxDBLookupCombo4.KeyValue;
    end;
  if DateEdit1.Date > 0 then
    begin
      qPedidoCliProd.SQL.Add('  AND (dbPedido.DtIniEmbarque >= :DtReprogramacaoIni)');
      qPedidoCliProd.ParamByName('DtReprogramacaoIni').AsDate := DateEdit1.Date;
    end;
  if DateEdit2.Date > 0 then
    begin
      qPedidoCliProd.SQL.Add('  AND (dbPedido.DtIniEmbarque <= :DtReprogramacaoFin)');
      qPedidoCliProd.ParamByName('DtReprogramacaoFin').AsDate := DateEdit2.Date;
    end;
  if RxDBLookupCombo3.Text <> '' then
    begin
      qPedidoCliProd.SQL.Add('  AND (dbPedidoItem.CodProduto = :CodProduto)');
      qPedidoCliProd.ParamByName('CodProduto').AsInteger := RxDBLookupCombo3.KeyValue;
    end;
  //qPedidoCliProd.SQL.Add('GROUP BY Dbpedidoitem.CodProduto, Dbproduto.Referencia, Dbproduto.Nome, dbPedido.CodCliente, dbCliente.CodGrupo, dbCliente.Nome, dbCliente.Fantasia');
  qPedidoCliProd.SQL.Add('GROUP BY Dbpedidoitem.CodProduto, Dbproduto.Referencia, Dbproduto.Nome, dbPedido.CodCliente, dbCliente.Nome, dbCliente.Fantasia');
  qPedidoCliProd.Open;
end;             

procedure TfHistGeral.Monta_SQLPedidoCliProdMes;
begin
  qPedidoCliProdMes.Close;
  qPedidoCliProdMes.SQL.Clear;
  qPedidoCliProdMes.SQL.Add('SELECT DbpedidoItem.CodProduto, dbPedido.DtIniEmbarque DtReprogramacao, DbPedido.CodCliente, SUM( Dbpedidoitem.QtdPares ) QtdPares, SUM( Dbpedidoitem.QtdParesRest ) QtdParesRest, ');
  //qPedidoCliProdMes.SQL.Add(' SUM( Dbpedidoitem.QtdParesCanc ) QtdParesCanc, dbCliente.CodGrupo, dbCliente.Nome NomeCliente, dbCliente.Fantasia');
  qPedidoCliProdMes.SQL.Add(' SUM( Dbpedidoitem.QtdParesCanc ) QtdParesCanc, dbCliente.Nome NomeCliente, dbCliente.Fantasia');
  qPedidoCliProdMes.SQL.Add('FROM "dbPedido.DB" Dbpedido');
  qPedidoCliProdMes.SQL.Add('   INNER JOIN "dbPedidoItem.DB" Dbpedidoitem');
  qPedidoCliProdMes.SQL.Add('   ON  (Dbpedido.Pedido = Dbpedidoitem.Pedido)');
  qPedidoCliProdMes.SQL.Add('   INNER JOIN "dbCliente.DB" dbCliente');
  qPedidoCliProdMes.SQL.Add('   ON  (dbCliente.Codigo = dbPedido.CodCliente)');
  qPedidoCliProdMes.SQL.Add('WHERE (0=0) ');
  //if RxDBLookupCombo2.Text <> '' then
  //  begin
  //    qPedidoCliProdMes.SQL.Add('  AND (dbPedido.Filial = :Filial)');
  //    qPedidoCliProdMes.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
  //  end;
  if RxDBLookupCombo1.Text <> '' then
    begin
      qPedidoCliProdMes.SQL.Add('  AND (dbPedido.CodCliente = :CodCli)');
      qPedidoCliProdMes.ParamByName('CodCli').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if RxDBLookupCombo4.Text <> '' then
    begin
      qPedidoCliProdMes.SQL.Add('  AND (dbPedido.CodVendedor = :CodVendedor)');
      qPedidoCliProdMes.ParamByName('CodVendedor').AsInteger  := RxDBLookupCombo4.KeyValue;
    end;
  if DateEdit1.Date > 0 then
    begin
      qPedidoCliProdMes.SQL.Add('  AND (dbPedido.DtIniEmbarque >= :DtReprogramacaoIni)');
      qPedidoCliProdMes.ParamByName('DtReprogramacaoIni').AsDate := DateEdit1.Date;
    end;
  if DateEdit2.Date > 0 then
    begin
      qPedidoCliProdMes.SQL.Add('  AND (dbPedido.DtIniEmbarque <= :DtReprogramacaoFin)');
      qPedidoCliProdMes.ParamByName('DtReprogramacaoFin').AsDate := DateEdit2.Date;
    end;
  if RxDBLookupCombo3.Text <> '' then
    begin
      qPedidoCliProdMes.SQL.Add('  AND (dbPedidoItem.CodProduto = :CodProduto)');
      qPedidoCliProdMes.ParamByName('CodProduto').AsInteger := RxDBLookupCombo3.KeyValue;
    end;
  //qPedidoCliProdMes.SQL.Add('GROUP BY Dbpedidoitem.CodProduto, Dbpedidoitem.DtReprogramacao, DbPedido.CodCliente, dbCliente.CodGrupo, dbCliente.Nome, dbCliente.Fantasia');
  qPedidoCliProdMes.SQL.Add('GROUP BY Dbpedidoitem.CodProduto, dbPedido.DtIniEmbarque, DbPedido.CodCliente, dbCliente.Nome, dbCliente.Fantasia');
  qPedidoCliProdMes.Open;
end;

procedure TfHistGeral.Monta_SQLCliProdMes;
var
  ano, mes, dia : Word;
  vDataAux : String;
  vAux : Real;
begin
  qClienteProdMes.Close;
  qClienteProdMes.SQL.Clear;
  qClienteProdMes.SQL.Add('SELECT Dbnotafiscal.DtEmissao, Dbnotafiscal.CodCli, Dbnotafiscalitens.CodProduto, SUM( Dbnotafiscalitens.Qtd ) Qtd, ');
  qClienteProdMes.SQL.Add(' SUM( Dbnotafiscalitens.VlrTotal ) VlrTotal, Dbnotafiscal.PercDesc, Dbnotafiscalitens.Referencia, Dbnotafiscalitens.Descricao, ');
  //qClienteProdMes.SQL.Add(' dbCliente.CodGrupo, dbCliente.Nome NomeCliente, dbCliente.Fantasia');
  qClienteProdMes.SQL.Add(' dbCliente.Nome NomeCliente, dbCliente.Fantasia');
  qClienteProdMes.SQL.Add('FROM "dbNotaFiscal.DB" Dbnotafiscal');
  qClienteProdMes.SQL.Add('   INNER JOIN "dbNotaFiscalItens.DB" Dbnotafiscalitens');
  //qClienteProdMes.SQL.Add('   ON  (Dbnotafiscal.Filial = Dbnotafiscalitens.Filial)');
  qClienteProdMes.SQL.Add('   ON  (Dbnotafiscal.NumNota = Dbnotafiscalitens.NumNota)');
  qClienteProdMes.SQL.Add('   INNER JOIN "dbCliente.DB" DbCliente');
  qClienteProdMes.SQL.Add('   ON  (DbCliente.Codigo = dbNotaFiscal.CodCli)');
  qClienteProdMes.SQL.Add('WHERE  (Dbnotafiscalitens.GeraDuplicata = TRUE) ');
  qClienteProdMes.SQL.Add('  AND  ((Dbnotafiscal.Cancelada = False) or (Dbnotafiscal.Cancelada is Null)) ');
  qClienteProdMes.SQL.Add('  AND ((Dbnotafiscal.CondPgto = ''V'') or (Dbnotafiscal.CondPgto = ''P'')) ');
  if not CheckBox4.Checked then
    qClienteProdMes.SQL.Add('  AND (Dbnotafiscal.TipoNota = ''1'') ');
  {if RxDBLookupCombo2.Text <> '' then
    begin
      qClienteProdMes.SQL.Add('  AND (dbNotaFiscal.Filial = :Filial)');
      qClienteProdMes.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
    end;}
  if RxDBLookupCombo1.Text <> '' then
    begin
      qClienteProdMes.SQL.Add('  AND (dbNotaFiscal.CodCli = :CodCli)');
      qClienteProdMes.ParamByName('CodCli').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if RxDBLookupCombo4.Text <> '' then
    begin
      qClienteProdMes.SQL.Add('  AND (dbNotaFiscal.CodVendedor = :CodVendedor)');
      qClienteProdMes.ParamByName('CodVendedor').AsInteger  := RxDBLookupCombo4.KeyValue;
    end;
  if DateEdit1.Date > 0 then
    begin
      qClienteProdMes.SQL.Add('  AND (dbNotaFiscal.DtEmissao >= :DtEmissaoIni)');
      qClienteProdMes.ParamByName('DtEmissaoIni').AsDate := DateEdit1.Date;
    end;
  if DateEdit2.Date > 0 then
    begin
      qClienteProdMes.SQL.Add('  AND (dbNotaFiscal.DtEmissao <= :DtEmissaoFin)');
      qClienteProdMes.ParamByName('DtEmissaoFin').AsDate := DateEdit2.Date;
    end;
  if RxDBLookupCombo3.Text <> '' then
    begin
      qClienteProdMes.SQL.Add('  AND (dbNotaFiscalItens.CodProduto = :CodProduto)');
      qClienteProdMes.ParamByName('CodProduto').AsInteger := RxDBLookupCombo3.KeyValue;
    end;
  //qClienteProdMes.SQL.Add('GROUP BY Dbnotafiscal.DtEmissao, Dbnotafiscal.CodCli, Dbnotafiscalitens.CodProduto, Dbnotafiscal.PercDesc, Dbnotafiscalitens.Referencia, Dbnotafiscalitens.Descricao, dbCliente.CodGrupo, dbCliente.Nome, dbCliente.Fantasia');
  qClienteProdMes.SQL.Add('GROUP BY Dbnotafiscal.DtEmissao, Dbnotafiscal.CodCli, Dbnotafiscalitens.CodProduto, Dbnotafiscal.PercDesc, Dbnotafiscalitens.Referencia, Dbnotafiscalitens.Descricao, dbCliente.Nome, dbCliente.Fantasia');
  qClienteProdMes.Open;

  //Mota Auxiliar
  SMDBGrid9.DataSource  := nil;
  ProgressBar8.Max      := qClienteProdMes.RecordCount + qPedidoCliProdMes.RecordCount;
  ProgressBar8.Position := 0;
  mClienteProdMes.EmptyDataSet;
  qClienteProdMes.First;
  while not qClienteProdMes.Eof do
    begin
      ProgressBar8.Position := ProgressBar8.Position + 1;
      DecodeDate(qClienteProdMesDtEmissao.AsDateTime,ano,mes,dia);
      //if (CheckBox3.Checked) and (qClienteProdMesCodGrupo.AsInteger > 0) then
      //  vCodAgrupado := 'G' + qClienteProdMesCodGrupo.AsString
      //else
        vCodAgrupado := 'C' + qClienteProdMesCodCli.AsString;
      if mClienteProdMes.Locate('CodAgrupado;CodProduto;Ano;Mes;',VarArrayOf([vCodAgrupado,qClienteProdMesCodProduto.AsInteger,ano,mes]),[locaseinsensitive]) then
        mClienteProdMes.Edit
      else
        begin
          mClienteProdMes.Insert;
          mClienteProdMesCodAgrupado.AsString := vCodAgrupado;
          mClienteProdMesCodCliente.AsInteger := qClienteProdMesCodCli.AsInteger;
          mClienteProdMesCodProduto.AsInteger := qClienteProdMesCodProduto.AsInteger;
          mClienteProdMesAno.AsInteger        := ano;
          mClienteProdMesMes.AsInteger        := mes;
          mClienteProdMesReferencia.AsString  := qClienteProdMesReferencia.AsString;
          mClienteProdMesNomeProduto.AsString := qClienteProdMesDescricao.AsString;
          //mClienteProdMesCodGrupo.AsInteger   := qClienteProdMesCodGrupo.AsInteger;
          {if Copy(vCodAgrupado,1,1) = 'G' then
            begin
              mClienteProdMesNomeCliente.AsString := qClienteProdMeslkNomeGrupo.AsString;
              mClienteProdMesFantasia.AsString    := qClienteProdMeslkNomeGrupo.AsString;
            end
          else
            begin}
              mClienteProdMesNomeCliente.AsString := qClienteProdMesNomeCliente.AsString;
              mClienteProdMesFantasia.AsString    := qClienteProdMesFantasia.AsString;
            //end;
        end;
      vAux := 0;
      if qClienteProdMesPercDesc.AsFloat > 0 then
        vAux := StrToFloat(FormatFloat('0.00',(qClienteProdMesVlrTotal.AsFloat * qClienteProdMesPercDesc.AsFloat) / 100));
      mClienteProdMesVlrFaturamento.AsFloat := mClienteProdMesVlrFaturamento.AsFloat + StrToFloat(FormatFloat('0.00',qClienteProdMesVlrTotal.AsFloat - vAux));
      mClienteProdMesQtdFaturada.AsFloat := mClienteProdMesQtdFaturada.AsFloat + qClienteProdMesQtd.AsFloat;
      vDataAux := FormatFloat('00',mes) + '/' + FormatFloat('0000',ano);
      mFatMensal.Locate('Data',vDataAux,[loCaseInsensitive]);
      mClienteProdMesPerc.AsFloat := StrToFloat(FormatFloat('0.00000',(mClienteProdMesVlrFaturamento.AsFloat / mFatMensalVlrFaturamento.Value) * 100));
      mClienteProdMes.Post;
      qClienteProdMes.Next;
    end;

  //Monta a quantidade pendente e a quantidade do pedido
  qPedidoCliProdMes.First;
  while not qPedidoCliProdMes.Eof do
    begin
      ProgressBar8.Position := ProgressBar8.Position + 1;
      DecodeDate(qClienteProdMesDtEmissao.AsDateTime,ano,mes,dia);
      //if (CheckBox3.Checked) and (qPedidoCliProdMesCodGrupo.AsInteger > 0) then
      //  vCodAgrupado := 'G' + qPedidoCliProdMesCodGrupo.AsString
      //else
        vCodAgrupado := 'C' + qPedidoCliProdMesCodCliente.AsString;
      if mClienteProdMes.Locate('CodAgrupado;CodProduto;Ano;Mes;',VarArrayOf([vCodAgrupado,qPedidoCliProdMesCodProduto.AsInteger,ano,mes]),[locaseinsensitive]) then
        mClienteProdMes.Edit
      else
        begin
          mClienteProdMes.Insert;
          mClienteProdMesCodAgrupado.AsString := vCodAgrupado;
          mClienteProdMesCodCliente.AsInteger := qPedidoCliProdMesCodCliente.AsInteger;
          mClienteProdMesCodProduto.AsInteger := qPedidoCliProdMesCodProduto.AsInteger;
          mClienteProdMesAno.AsInteger        := ano;
          mClienteProdMesMes.AsInteger        := mes;
          //mClienteProdMesCodGrupo.AsInteger   := qPedidoCliProdMesCodGrupo.AsInteger;
          if DM1.tProduto.Locate('Codigo',qPedidoCliProdMesCodProduto.AsInteger,[loCaseInsensitive]) then
            begin
              mClienteProdMesReferencia.AsString  := DM1.tProdutoReferencia.AsString;
              mClienteProdMesNomeProduto.AsString := DM1.tProdutoNome.AsString;
            end;
          {if copy(vCodAgrupado,1,1) = 'G' then
            begin
              mClienteProdMesNomeCliente.AsString := qPedidoCliProdMeslkNomeGrupo.AsString;
              mClienteProdMesFantasia.AsString    := qPedidoCliProdMeslkNomeGrupo.AsString;
            end
          else
            begin}
              mClienteProdMesNomeCliente.AsString := qPedidoCliProdMesNomeCliente.AsString;
              mClienteProdMesFantasia.AsString    := qPedidoCliProdMesFantasia.AsString;
            //end;
        end;
      vDataAux := FormatFloat('00',mes) + '/' + FormatFloat('0000',ano);
      mClienteProdMesQtdPedido.AsFloat    := mClienteProdMesQtdPedido.AsFloat + qPedidoCliProdMesQtdPares.AsFloat;
      mClienteProdMesQtdRestante.AsFloat  := mClienteProdMesQtdRestante.AsFloat + qPedidoCliProdMesQtdParesRest.AsFloat;
      mClienteProdMesQtdCancelada.AsFloat := mClienteProdMesQtdCancelada.AsFloat + qPedidoCliProdMesQtdParesCanc.AsFloat;
      mClienteProdMes.Post;
      qPedidoCliProdMes.Next;
    end;
  case ComboBox1.ItemIndex of
    0 : mClienteProdMes.IndexFieldNames := 'NomeCliente;Referencia;Ano;Mes';
    1 : mClienteProdMes.IndexFieldNames := 'NomeCliente;Ano;Mes;Referencia';
    2 : mClienteProdMes.IndexFieldNames := 'Referencia;NomeCliente;Ano;Mes';
    3 : mClienteProdMes.IndexFieldNames := 'Referencia;Ano;Mes;NomeCliente';
    4 : mClienteProdMes.IndexFieldNames := 'Ano;Mes;Referencia;NomeCliente';
    5 : mClienteProdMes.IndexFieldNames := 'Ano;Mes;NomeCliente;Referencia';
  end;
  SMDBGrid9.DataSource := dsmClienteProdMes;
end;

procedure TfHistGeral.Monta_SQLPedidoProdMes;
begin
  qPedidoProdMes.Close;
  qPedidoProdMes.SQL.Clear;
  qPedidoProdMes.SQL.Add('SELECT DbpedidoItem.CodProduto, dbPedido.DtIniEmbarque DtReprogramacao, SUM( Dbpedidoitem.QtdPares ) QtdPares, SUM( Dbpedidoitem.QtdParesRest ) QtdParesRest, SUM( Dbpedidoitem.QtdParesCanc ) QtdParesCanc');
  qPedidoProdMes.SQL.Add('FROM "dbPedido.DB" Dbpedido');
  qPedidoProdMes.SQL.Add('   INNER JOIN "dbPedidoItem.DB" Dbpedidoitem');
  qPedidoProdMes.SQL.Add('   ON  (Dbpedido.Pedido = Dbpedidoitem.Pedido)');
  qPedidoProdMes.SQL.Add('WHERE (0=0) ');
  {if RxDBLookupCombo2.Text <> '' then
    begin
      qPedidoProdMes.SQL.Add('  AND (dbPedido.Filial = :Filial)');
      qPedidoProdMes.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
    end;}
  if RxDBLookupCombo1.Text <> '' then
    begin
      qPedidoProdMes.SQL.Add('  AND (dbPedido.CodCliente = :CodCli)');
      qPedidoProdMes.ParamByName('CodCli').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if RxDBLookupCombo4.Text <> '' then
    begin
      qPedidoProdMes.SQL.Add('  AND (dbPedido.CodVendedor = :CodVendedor)');
      qPedidoProdMes.ParamByName('CodVendedor').AsInteger  := RxDBLookupCombo4.KeyValue;
    end;
  if DateEdit1.Date > 0 then
    begin
      qPedidoProdMes.SQL.Add('  AND (dbPedido.DtIniEmbarque >= :DtReprogramacaoIni)');
      qPedidoProdMes.ParamByName('DtReprogramacaoIni').AsDate := DateEdit1.Date;
    end;
  if DateEdit2.Date > 0 then
    begin
      qPedidoProdMes.SQL.Add('  AND (dbPedido.DtIniEmbarque <= :DtReprogramacaoFin)');
      qPedidoProdMes.ParamByName('DtReprogramacaoFin').AsDate := DateEdit2.Date;
    end;
  if RxDBLookupCombo3.Text <> '' then
    begin
      qPedidoProdMes.SQL.Add('  AND (dbPedidoItem.CodProduto = :CodProduto)');
      qPedidoProdMes.ParamByName('CodProduto').AsInteger := RxDBLookupCombo3.KeyValue;
    end;
   qPedidoProdMes.SQL.Add('GROUP BY Dbpedidoitem.CodProduto, dbPedido.DtIniEmbarque');
  qPedidoProdMes.Open;
end;

procedure TfHistGeral.Monta_SQLPedidoProdMesCli;
begin
  qPedidoProdMesCli.Close;
  qPedidoProdMesCli.SQL.Clear;
  qPedidoProdMesCli.SQL.Add('SELECT dbPedido.CodCliente, DbpedidoItem.CodProduto, dbPedido.DtIniEmbarque DtReprogramacao, SUM( Dbpedidoitem.QtdPares ) QtdPares, ');
  //qPedidoProdMesCli.SQL.Add(' SUM( Dbpedidoitem.QtdParesRest ) QtdParesRest, SUM( Dbpedidoitem.QtdParesCanc ) QtdParesCanc, dbCliente.CodGrupo ');
  qPedidoProdMesCli.SQL.Add(' SUM( Dbpedidoitem.QtdParesRest ) QtdParesRest, SUM( Dbpedidoitem.QtdParesCanc ) QtdParesCanc ');
  qPedidoProdMesCli.SQL.Add('FROM "dbPedido.DB" Dbpedido');
  qPedidoProdMesCli.SQL.Add('   INNER JOIN "dbPedidoItem.DB" Dbpedidoitem');
  qPedidoProdMesCli.SQL.Add('   ON  (Dbpedido.Pedido = Dbpedidoitem.Pedido)');
  qPedidoProdMesCli.SQL.Add('   INNER JOIN "dbCliente.DB" DbCliente');
  qPedidoProdMesCli.SQL.Add('   ON  (DbCliente.Codigo = dbPedido.CodCliente)');
  qPedidoProdMesCli.SQL.Add('WHERE (0=0) ');
  {if RxDBLookupCombo2.Text <> '' then
    begin
      qPedidoProdMesCli.SQL.Add('  AND (dbPedido.Filial = :Filial)');
      qPedidoProdMesCli.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
    end;}
  if RxDBLookupCombo1.Text <> '' then
    begin
      qPedidoProdMesCli.SQL.Add('  AND (dbPedido.CodCliente = :CodCli)');
      qPedidoProdMesCli.ParamByName('CodCli').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if RxDBLookupCombo4.Text <> '' then
    begin
      qPedidoProdMesCli.SQL.Add('  AND (dbPedido.CodVendedor = :CodVendedor)');
      qPedidoProdMesCli.ParamByName('CodVendedor').AsInteger  := RxDBLookupCombo4.KeyValue;
    end;
  if DateEdit1.Date > 0 then
    begin
      qPedidoProdMesCli.SQL.Add('  AND (dbPedido.DtIniEmbarque >= :DtReprogramacaoIni)');
      qPedidoProdMesCli.ParamByName('DtReprogramacaoIni').AsDate := DateEdit1.Date;
    end;
  if DateEdit2.Date > 0 then
    begin
      qPedidoProdMesCli.SQL.Add('  AND (dbPedido.DtIniEmbarque <= :DtReprogramacaoFin)');
      qPedidoProdMesCli.ParamByName('DtReprogramacaoFin').AsDate := DateEdit2.Date;
    end;
  if RxDBLookupCombo3.Text <> '' then
    begin
      qPedidoProdMesCli.SQL.Add('  AND (dbPedidoItem.CodProduto = :CodProduto)');
      qPedidoProdMesCli.ParamByName('CodProduto').AsInteger := RxDBLookupCombo3.KeyValue;
    end;
  //qPedidoProdMesCli.SQL.Add('GROUP BY dbPedido.CodCliente, Dbpedidoitem.CodProduto, Dbpedidoitem.DtReprogramacao, dbCliente.CodGrupo');
  qPedidoProdMesCli.SQL.Add('GROUP BY dbPedido.CodCliente, Dbpedidoitem.CodProduto, dbPedido.DtIniEmbarque');
  qPedidoProdMesCli.Open;
end;

procedure TfHistGeral.Monta_SQLProdMes;
var
  vDataAux : String;
  ano, mes, dia : Word;
  vAux : Real;
begin
  qProdutoMes.Close;
  qProdutoMes.SQL.Clear;
  qProdutoMes.SQL.Add('SELECT dbNotaFiscal.DtEmissao, Dbnotafiscal.PercDesc, Dbnotafiscalitens.VlrTotal, dbNotaFiscalItens.CodProduto, dbNotaFiscalItens.Referencia, dbNotaFiscalItens.Descricao, dbNotaFiscalItens.Qtd');
  qProdutoMes.SQL.Add('FROM "dbnotafiscal.db" Dbnotafiscal');
  qProdutoMes.SQL.Add('   INNER JOIN "dbNotaFiscalItens.DB" Dbnotafiscalitens');
  //qProdutoMes.SQL.Add('   ON  (Dbnotafiscal.Filial = Dbnotafiscalitens.Filial)');
  qProdutoMes.SQL.Add('   ON  (Dbnotafiscal.NumNota = Dbnotafiscalitens.NumNota)');
  qProdutoMes.SQL.Add('WHERE (Dbnotafiscalitens.GeraDuplicata = TRUE) ');
  qProdutoMes.SQL.Add('  AND ((Dbnotafiscal.Cancelada = False) or (Dbnotafiscal.Cancelada is Null)) ');
  qProdutoMes.SQL.Add('  AND (Dbnotafiscal.dtemissao  >= :DtInicial) ');
  qProdutoMes.SQL.Add('  AND (Dbnotafiscal.dtemissao  <= :DtFinal) ');
  qProdutoMes.SQL.Add('  AND ((Dbnotafiscal.CondPgto = ''V'') or (Dbnotafiscal.CondPgto = ''P'')) ');
  if not CheckBox4.Checked then
    //qProdutoMes.SQL.Add('  AND (DbnotafiscalItens.Material = False) ');
    qProdutoMes.SQL.Add('  AND (Dbnotafiscal.TipoNota = ''1'') ');
  qProdutoMes.ParamByName('DtInicial').AsDate := DateEdit1.Date;
  qProdutoMes.ParamByName('DtFinal').AsDate   := DateEdit2.Date;

  {if RxDBLookupCombo2.Text <> '' then
    begin
      qProdutoMes.SQL.Add('  AND (dbNotaFiscal.Filial = :Filial)');
      qProdutoMes.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
    end;}
  if RxDBLookupCombo1.Text <> '' then
    begin
      qProdutoMes.SQL.Add('  AND (dbNotaFiscal.CodCli = :CodCli)');
      qProdutoMes.ParamByName('CodCli').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if RxDBLookupCombo4.Text <> '' then
    begin
      qProdutoMes.SQL.Add('  AND (dbNotaFiscal.CodVendedor = :CodVendedor)');
      qProdutoMes.ParamByName('CodVendedor').AsInteger  := RxDBLookupCombo4.KeyValue;
    end;
  if RxDBLookupCombo3.Text <> '' then
    begin
      qProdutoMes.SQL.Add('  AND (dbNotaFiscalItens.CodProduto = :CodProduto)');
      qProdutoMes.ParamByName('CodProduto').AsInteger := RxDBLookupCombo3.KeyValue;
    end;
  qProdutoMes.SQL.Add('ORDER BY dbNotaFiscal.DtEmissao');
  qProdutoMes.Open;

  //Mota Auxiliar
  SMDBGrid8.DataSource  := nil;
  ProgressBar7.Max      := qProdutoMes.RecordCount + qPedidoProdMes.RecordCount;
  ProgressBar7.Position := 0;
  mProdutoMes.EmptyDataSet;
  qProdutoMes.First;
  while not qProdutoMes.Eof do
    begin
      ProgressBar7.Position := ProgressBar7.Position + 1;
      if mProdutoMes.Locate('CodProduto',qProdutoMesCodProduto.AsInteger,[loCaseInsensitive]) then
        mProdutoMes.Edit
      else
        begin
          mProdutoMes.Insert;
          mProdutoMesCodProduto.AsInteger := qProdutoMesCodProduto.AsInteger;
          mProdutoMesNomeProduto.AsString := qProdutoMesDescricao.AsString;
          mProdutoMesReferencia.AsString  := qProdutoMesReferencia.AsString;
        end;
      DecodeDate(qProdutoMesDtEmissao.AsDateTime,ano,mes,dia);
      vDataAux := FormatFloat('00',mes) + '/' + FormatFloat('0000',ano);
      mDatas.Locate('Data',vDataAux,[loCaseInsensitive]);
      vAux := 0;
      if qProdutoMesPercDesc.AsFloat > 0 then
        vAux := StrToFloat(FormatFloat('0.00',(qProdutoMesVlrTotal.AsFloat * qProdutoMesPercDesc.AsFloat) / 100));
      mProdutoMes.FieldByName('VlrFaturamento'+mDatasIndice.AsString).AsFloat := mProdutoMes.FieldByName('VlrFaturamento'+mDatasIndice.AsString).AsFloat + StrToFloat(FormatFloat('0.00',qProdutoMesVlrTotal.AsFloat - vAux));
      mProdutoMes.FieldByName('Qtd'+mDatasIndice.AsString).AsFloat            := mProdutoMes.FieldByName('Qtd'+mDatasIndice.AsString).AsFloat + qProdutoMesQtd.AsFloat;
      mFatMensal.Locate('Data',vDataAux,[loCaseInsensitive]);
      mProdutoMes.FieldByName('Perc'+mDatasIndice.AsString).AsFloat           := StrToFloat(FormatFloat('0.00000',(mProdutoMes.FieldByName('VlrFaturamento'+mDatasIndice.AsString).AsFloat / mFatMensalVlrFaturamento.AsFloat) * 100));

      //Total
      mProdutoMes.FieldByName('VlrFaturamento'+IntToStr(vContadorMes + 1)).AsFloat := mProdutoMes.FieldByName('VlrFaturamento'+IntToStr(vContadorMes + 1)).AsFloat + StrToFloat(FormatFloat('0.00',qProdutoMesVlrTotal.AsFloat - vAux));
      mProdutoMes.FieldByName('Qtd'+IntToStr(vContadorMes + 1)).AsFloat            := mProdutoMes.FieldByName('Qtd'+IntToStr(vContadorMes + 1)).AsFloat + qProdutoMesQtd.AsFloat;
      mProdutoMes.FieldByName('Perc'+IntToStr(vContadorMes + 1)).AsFloat           := StrToFloat(FormatFloat('0.00000',(mProdutoMes.FieldByName('VlrFaturamento'+IntToStr(vContadorMes + 1)).AsFloat / CurrencyEdit1.Value) * 100));

      mProdutoMesVlrTotal.AsFloat := mProdutoMesVlrTotal.AsFloat + StrToFloat(FormatFloat('0.00',qProdutoMesVlrTotal.AsFloat - vAux));
      mProdutoMes.Post;
      qProdutoMes.Next;
    end;

  //Monta a quantidade pendente e a quantidade do pedido
  qPedidoProdMes.First;
  while not qPedidoProdMes.Eof do
    begin
      ProgressBar7.Position := ProgressBar7.Position + 1;
      if mProdutoMes.Locate('CodProduto',qPedidoProdMesCodProduto.AsInteger,[loCaseInsensitive]) then
        mProdutoMes.Edit
      else
        begin
          mProdutoMes.Insert;
          mProdutoMesCodProduto.AsInteger := qPedidoProdMesCodProduto.AsInteger;
          if DM1.tProduto.Locate('Codigo',qPedidoProdMesCodProduto.AsInteger,[loCaseInsensitive]) then
            begin
              mProdutoMesNomeProduto.AsString := DM1.tProdutoNome.AsString;
              mProdutoMesReferencia.AsString  := DM1.tProdutoReferencia.AsString;
            end;
        end;
      DecodeDate(qPedidoProdMesDtReprogramacao.AsDateTime,ano,mes,dia);
      vDataAux := FormatFloat('00',mes) + '/' + FormatFloat('0000',ano);
      mDatas.Locate('Data',vDataAux,[loCaseInsensitive]);
      mProdutoMes.FieldByName('QtdPedido'+mDatasIndice.AsString).AsFloat    := mProdutoMes.FieldByName('QtdPedido'+mDatasIndice.AsString).AsFloat + qPedidoProdMesQtdPares.AsFloat;
      mProdutoMes.FieldByName('QtdRestante'+mDatasIndice.AsString).AsFloat  := mProdutoMes.FieldByName('QtdRestante'+mDatasIndice.AsString).AsFloat + qPedidoProdMesQtdParesRest.AsFloat;
      mProdutoMes.FieldByName('QtdCancelada'+mDatasIndice.AsString).AsFloat := mProdutoMes.FieldByName('QtdCancelada'+mDatasIndice.AsString).AsFloat + qPedidoProdMesQtdParesCanc.AsFloat;

      //Total
      mProdutoMes.FieldByName('QtdPedido'+IntToStr(vContadorMes + 1)).AsFloat    := mProdutoMes.FieldByName('QtdPedido'+IntToStr(vContadorMes + 1)).AsFloat + qPedidoProdMesQtdPares.AsFloat;
      mProdutoMes.FieldByName('QtdRestante'+IntToStr(vContadorMes + 1)).AsFloat  := mProdutoMes.FieldByName('QtdRestante'+IntToStr(vContadorMes + 1)).AsFloat + qPedidoProdMesQtdParesRest.AsFloat;
      mProdutoMes.FieldByName('QtdCancelada'+IntToStr(vContadorMes + 1)).AsFloat := mProdutoMes.FieldByName('QtdCancelada'+IntToStr(vContadorMes + 1)).AsFloat + qPedidoProdMesQtdParesCanc.AsFloat;

      mProdutoMes.Post;

      qPedidoProdMes.Next;
    end;

  SMDBGrid8.DataSource := dsmProdutoMes;
end;

procedure TfHistGeral.Monta_SQLProdMesCli(Tipo : String);
var                                      
  vDataAux : String;
  ano, mes, dia : Word;
  vAux : Real;
begin
  qProdutoMesCli.Close;
  qProdutoMesCli.SQL.Clear;
  qProdutoMesCli.SQL.Add('SELECT dbNotaFiscal.CodCli, dbNotaFiscal.DtEmissao, Dbnotafiscal.PercDesc, Dbnotafiscalitens.VlrTotal, ');
  //qProdutoMesCli.SQL.Add(' dbNotaFiscalItens.CodProduto, dbNotaFiscalItens.Referencia, dbNotaFiscalItens.Descricao, dbNotaFiscalItens.Qtd, dbCliente.CodGrupo ');
  qProdutoMesCli.SQL.Add(' dbNotaFiscalItens.CodProduto, dbNotaFiscalItens.Referencia, dbNotaFiscalItens.Descricao, dbNotaFiscalItens.Qtd ');
  qProdutoMesCli.SQL.Add('FROM "dbnotafiscal.db" Dbnotafiscal');
  qProdutoMesCli.SQL.Add('   INNER JOIN "dbNotaFiscalItens.DB" Dbnotafiscalitens');
  //qProdutoMesCli.SQL.Add('   ON  (Dbnotafiscal.Filial = Dbnotafiscalitens.Filial)');
  qProdutoMesCli.SQL.Add('   ON  (Dbnotafiscal.NumNota = Dbnotafiscalitens.NumNota)');
  qProdutoMesCli.SQL.Add('   INNER JOIN "dbCliente.DB" dbCliente');
  qProdutoMesCli.SQL.Add('   ON  (Dbnotafiscal.CodCli = dbCliente.Codigo)');
  qProdutoMesCli.SQL.Add('WHERE (Dbnotafiscalitens.GeraDuplicata = TRUE) ');
  qProdutoMesCli.SQL.Add('  AND ((Dbnotafiscal.Cancelada = False) or (Dbnotafiscal.Cancelada is Null)) ');
  qProdutoMesCli.SQL.Add('  AND (Dbnotafiscal.dtemissao  >= :DtInicial) ');
  qProdutoMesCli.SQL.Add('  AND (Dbnotafiscal.dtemissao  <= :DtFinal) ');
  qProdutoMesCli.SQL.Add('  AND ((Dbnotafiscal.CondPgto = ''V'') or (Dbnotafiscal.CondPgto = ''P'')) ');
  if not CheckBox4.Checked then
    //qProdutoMesCli.SQL.Add('  AND (DbnotafiscalItens.Material = False) ');
    qProdutoMesCli.SQL.Add('  AND (Dbnotafiscal.TipoNota = ''1'') ');
  qProdutoMesCli.ParamByName('DtInicial').AsDate := DateEdit1.Date;
  qProdutoMesCli.ParamByName('DtFinal').AsDate   := DateEdit2.Date;
  {if RxDBLookupCombo2.Text <> '' then
    begin
      qProdutoMesCli.SQL.Add('  AND (dbNotaFiscal.Filial = :Filial)');
      qProdutoMesCli.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
    end;}
  if RxDBLookupCombo1.Text <> '' then
    begin
      qProdutoMesCli.SQL.Add('  AND (dbNotaFiscal.CodCli = :CodCli)');
      qProdutoMesCli.ParamByName('CodCli').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if RxDBLookupCombo4.Text <> '' then
    begin
      qProdutoMesCli.SQL.Add('  AND (dbNotaFiscal.CodVendedor = :CodVendedor)');
      qProdutoMesCli.ParamByName('CodVendedor').AsInteger  := RxDBLookupCombo4.KeyValue;
    end;
  if RxDBLookupCombo3.Text <> '' then
    begin
      qProdutoMesCli.SQL.Add('  AND (dbNotaFiscalItens.CodProduto = :CodProduto)');
      qProdutoMesCli.ParamByName('CodProduto').AsInteger := RxDBLookupCombo3.KeyValue;
    end;
  qProdutoMesCli.SQL.Add('ORDER BY dbNotaFiscal.DtEmissao');
  qProdutoMesCli.Open;

  //Mota Auxiliar
  if Tipo = 'R' then
    Grava_mClienteProdMesRes
  else
  if Tipo = 'C' then
    begin
      ProgressBar1.Max      := qProdutoMesCli.RecordCount + qPedidoProdMesCli.RecordCount;
      ProgressBar1.Position := 0;
      mProdutoMes.EmptyDataSet;
      qProdutoMesCli.First;
      while not qProdutoMesCli.Eof do
        begin
          ProgressBar1.Position := ProgressBar1.Position + 1;
          //if (CheckBox3.Checked) and (qProdutoMesCliCodGrupo.AsInteger > 0) then
          //  vCodAgrupado := 'G' + qProdutoMesCliCodGrupo.AsString
          //else
            vCodAgrupado := 'C' + qProdutoMesCliCodCli.AsString;
          if mProdutoMes.Locate('CodAgrupado;CodProduto',VarArrayOf([vCodAgrupado,qProdutoMesCliCodProduto.AsInteger]),[locaseinsensitive]) then
            mProdutoMes.Edit
          else
            begin
              mProdutoMes.Insert;
              mProdutoMesCodAgrupado.AsString := vCodAgrupado;
              mProdutoMesCodCliente.AsInteger := qProdutoMesCliCodCli.AsInteger;
              mProdutoMesCodProduto.AsInteger := qProdutoMesCliCodProduto.AsInteger;
              mProdutoMesNomeProduto.AsString := qProdutoMesCliDescricao.AsString;
              mProdutoMesReferencia.AsString  := qProdutoMesCliReferencia.AsString;
            end;
          DecodeDate(qProdutoMesCliDtEmissao.AsDateTime,ano,mes,dia);
          vDataAux := FormatFloat('00',mes) + '/' + FormatFloat('0000',ano);
          mDatas.Locate('Data',vDataAux,[loCaseInsensitive]);
          vAux := 0;
          if qProdutoMesCliPercDesc.AsFloat > 0 then
            vAux := StrToFloat(FormatFloat('0.00',(qProdutoMesCliVlrTotal.AsFloat * qProdutoMesCliPercDesc.AsFloat) / 100));
          mProdutoMes.FieldByName('VlrFaturamento'+mDatasIndice.AsString).AsFloat := mProdutoMes.FieldByName('VlrFaturamento'+mDatasIndice.AsString).AsFloat + StrToFloat(FormatFloat('0.00',qProdutoMesCliVlrTotal.AsFloat - vAux));
          mProdutoMes.FieldByName('Qtd'+mDatasIndice.AsString).AsFloat            := mProdutoMes.FieldByName('Qtd'+mDatasIndice.AsString).AsFloat + qProdutoMesCliQtd.AsFloat;
          mFatMensal.Locate('Data',vDataAux,[loCaseInsensitive]);
          mProdutoMes.FieldByName('Perc'+mDatasIndice.AsString).AsFloat           := StrToFloat(FormatFloat('0.00000',(mProdutoMes.FieldByName('VlrFaturamento'+mDatasIndice.AsString).AsFloat / mFatMensalVlrFaturamento.AsFloat) * 100));

          //Total
          mProdutoMes.FieldByName('VlrFaturamento'+IntToStr(vContadorMes + 1)).AsFloat := mProdutoMes.FieldByName('VlrFaturamento'+IntToStr(vContadorMes + 1)).AsFloat + StrToFloat(FormatFloat('0.00',qProdutoMesCliVlrTotal.AsFloat - vAux));
          mProdutoMes.FieldByName('Qtd'+IntToStr(vContadorMes + 1)).AsFloat            := mProdutoMes.FieldByName('Qtd'+IntToStr(vContadorMes + 1)).AsFloat + qProdutoMesCliQtd.AsFloat;
          mProdutoMes.FieldByName('Perc'+IntToStr(vContadorMes + 1)).AsFloat           := StrToFloat(FormatFloat('0.00000',(mProdutoMes.FieldByName('VlrFaturamento'+IntToStr(vContadorMes + 1)).AsFloat / CurrencyEdit1.Value) * 100));
          mProdutoMesVlrTotal.AsFloat := mProdutoMesVlrTotal.AsFloat + StrToFloat(FormatFloat('0.00',mProdutoMesVlrTotal.AsFloat - vAux));
          mProdutoMes.Post;

          {***************************}
          {*** Grava o total geral ***}
          {***************************}
          //Este bloco foi incluido dia 13/07/2007 para imprimir o total geral, aproveitando
          //a mesma tabela auxiliar, a única diferença é que vai imprimir total zero, devido ao
          //indice, ser por ondem decrescente pelo valor
          vCodAgrupado := 'T99999';
          if mProdutoMes.Locate('CodAgrupado;CodProduto',VarArrayOf([vCodAgrupado,qProdutoMesCliCodProduto.AsInteger]),[locaseinsensitive]) then
            mProdutoMes.Edit
          else
            begin
              mProdutoMes.Insert;
              mProdutoMesCodAgrupado.AsString := vCodAgrupado;
              mProdutoMesCodProduto.AsInteger := qProdutoMesCliCodProduto.AsInteger;
              mProdutoMesNomeProduto.AsString := qProdutoMesCliDescricao.AsString;
              mProdutoMesReferencia.AsString  := qProdutoMesCliReferencia.AsString;
            end;
          mProdutoMes.FieldByName('VlrFaturamento'+mDatasIndice.AsString).AsFloat := mProdutoMes.FieldByName('VlrFaturamento'+mDatasIndice.AsString).AsFloat + StrToFloat(FormatFloat('0.00',qProdutoMesCliVlrTotal.AsFloat - vAux));
          mProdutoMes.FieldByName('Qtd'+mDatasIndice.AsString).AsFloat            := mProdutoMes.FieldByName('Qtd'+mDatasIndice.AsString).AsFloat + qProdutoMesCliQtd.AsFloat;
          mProdutoMes.FieldByName('Perc'+mDatasIndice.AsString).AsFloat           := StrToFloat(FormatFloat('0.00000',(mProdutoMes.FieldByName('VlrFaturamento'+mDatasIndice.AsString).AsFloat / mFatMensalVlrFaturamento.AsFloat) * 100));
          //Total
          mProdutoMes.FieldByName('VlrFaturamento'+IntToStr(vContadorMes + 1)).AsFloat := mProdutoMes.FieldByName('VlrFaturamento'+IntToStr(vContadorMes + 1)).AsFloat + StrToFloat(FormatFloat('0.00',qProdutoMesCliVlrTotal.AsFloat - vAux));
          mProdutoMes.FieldByName('Qtd'+IntToStr(vContadorMes + 1)).AsFloat            := mProdutoMes.FieldByName('Qtd'+IntToStr(vContadorMes + 1)).AsFloat + qProdutoMesCliQtd.AsFloat;
          mProdutoMes.FieldByName('Perc'+IntToStr(vContadorMes + 1)).AsFloat           := StrToFloat(FormatFloat('0.00000',(mProdutoMes.FieldByName('VlrFaturamento'+IntToStr(vContadorMes + 1)).AsFloat / CurrencyEdit1.Value) * 100));
          mProdutoMesVlrTotal.AsFloat := -0.00001;
          mProdutoMes.Post;
          {***Final da gravação do registro total***}
          {*****************************************}

          qProdutoMesCli.Next;
        end;

      //Monta a quantidade pendente e a quantidade do pedido
      qPedidoProdMesCli.First;
      while not qPedidoProdMesCli.Eof do
        begin
          ProgressBar1.Position := ProgressBar1.Position + 1;
          //if (CheckBox3.Checked) and (qPedidoProdMesCliCodGrupo.AsInteger > 0) then
          //  vCodAgrupado := 'G' + qPedidoProdMesCliCodGrupo.AsString
          //else
            vCodAgrupado := 'C' + qPedidoProdMesCliCodCliente.AsString;
          if mProdutoMes.Locate('CodAgrupado;CodProduto',VarArrayOf([vCodAgrupado,qPedidoProdMesCliCodProduto.AsInteger]),[locaseinsensitive]) then
            mProdutoMes.Edit
          else
            begin
              mProdutoMes.Insert;
              mProdutoMesCodAgrupado.AsString := vCodAgrupado;
              mProdutoMesCodCliente.AsInteger := qPedidoProdMesCliCodCliente.AsInteger;
              mProdutoMesCodProduto.AsInteger := qPedidoProdMesCliCodProduto.AsInteger;
              if DM1.tProduto.Locate('Codigo',qPedidoProdMesCliCodProduto.AsInteger,[loCaseInsensitive]) then
                begin
                  mProdutoMesNomeProduto.AsString := DM1.tProdutoNome.AsString;
                  mProdutoMesReferencia.AsString  := DM1.tProdutoReferencia.AsString;
                end;
            end;
          DecodeDate(qPedidoProdMesCliDtReprogramacao.AsDateTime,ano,mes,dia);
          vDataAux := FormatFloat('00',mes) + '/' + FormatFloat('0000',ano);
          mDatas.Locate('Data',vDataAux,[loCaseInsensitive]);
          mProdutoMes.FieldByName('QtdPedido'+mDatasIndice.AsString).AsFloat    := mProdutoMes.FieldByName('QtdPedido'+mDatasIndice.AsString).AsFloat + qPedidoProdMesCliQtdPares.AsFloat;
          mProdutoMes.FieldByName('QtdRestante'+mDatasIndice.AsString).AsFloat  := mProdutoMes.FieldByName('QtdRestante'+mDatasIndice.AsString).AsFloat + qPedidoProdMesCliQtdParesRest.AsFloat;
          mProdutoMes.FieldByName('QtdCancelada'+mDatasIndice.AsString).AsFloat := mProdutoMes.FieldByName('QtdCancelada'+mDatasIndice.AsString).AsFloat + qPedidoProdMesCliQtdParesCanc.AsFloat;

          //Total
          mProdutoMes.FieldByName('QtdPedido'+IntToStr(vContadorMes + 1)).AsFloat    := mProdutoMes.FieldByName('QtdPedido'+IntToStr(vContadorMes + 1)).AsFloat + qPedidoProdMesCliQtdPares.AsFloat;
          mProdutoMes.FieldByName('QtdRestante'+IntToStr(vContadorMes + 1)).AsFloat  := mProdutoMes.FieldByName('QtdRestante'+IntToStr(vContadorMes + 1)).AsFloat + qPedidoProdMesCliQtdParesRest.AsFloat;
          mProdutoMes.FieldByName('QtdCancelada'+IntToStr(vContadorMes + 1)).AsFloat := mProdutoMes.FieldByName('QtdCancelada'+IntToStr(vContadorMes + 1)).AsFloat + qPedidoProdMesCliQtdParesCanc.AsFloat;
          mProdutoMes.Post;

          {***************************}
          {*** Grava o total geral ***}
          {***************************}
          //Este bloco foi incluido dia 13/07/2007 para imprimir o total geral, aproveitando
          //a mesma tabela auxiliar, a única diferença é que vai imprimir total zero, devido ao
          //indice, ser por ondem decrescente pelo valor
          vCodAgrupado := 'T99999';
          if mProdutoMes.Locate('CodAgrupado;CodProduto',VarArrayOf([vCodAgrupado,qPedidoProdMesCliCodProduto.AsInteger]),[locaseinsensitive]) then
            mProdutoMes.Edit
          else
            begin
              mProdutoMes.Insert;
              mProdutoMesCodAgrupado.AsString := vCodAgrupado;
              mProdutoMesCodProduto.AsInteger := qPedidoProdMesCliCodProduto.AsInteger;
              if DM1.tProduto.Locate('Codigo',qPedidoProdMesCliCodProduto.AsInteger,[loCaseInsensitive]) then
                begin
                  mProdutoMesNomeProduto.AsString := DM1.tProdutoNome.AsString;
                  mProdutoMesReferencia.AsString  := DM1.tProdutoReferencia.AsString;
                end;
            end;
          mProdutoMes.FieldByName('QtdPedido'+mDatasIndice.AsString).AsFloat    := mProdutoMes.FieldByName('QtdPedido'+mDatasIndice.AsString).AsFloat + qPedidoProdMesCliQtdPares.AsFloat;
          mProdutoMes.FieldByName('QtdRestante'+mDatasIndice.AsString).AsFloat  := mProdutoMes.FieldByName('QtdRestante'+mDatasIndice.AsString).AsFloat + qPedidoProdMesCliQtdParesRest.AsFloat;
          mProdutoMes.FieldByName('QtdCancelada'+mDatasIndice.AsString).AsFloat := mProdutoMes.FieldByName('QtdCancelada'+mDatasIndice.AsString).AsFloat + qPedidoProdMesCliQtdParesCanc.AsFloat;
          //Total
          mProdutoMes.FieldByName('QtdPedido'+IntToStr(vContadorMes + 1)).AsFloat    := mProdutoMes.FieldByName('QtdPedido'+IntToStr(vContadorMes + 1)).AsFloat + qPedidoProdMesCliQtdPares.AsFloat;
          mProdutoMes.FieldByName('QtdRestante'+IntToStr(vContadorMes + 1)).AsFloat  := mProdutoMes.FieldByName('QtdRestante'+IntToStr(vContadorMes + 1)).AsFloat + qPedidoProdMesCliQtdParesRest.AsFloat;
          mProdutoMes.FieldByName('QtdCancelada'+IntToStr(vContadorMes + 1)).AsFloat := mProdutoMes.FieldByName('QtdCancelada'+IntToStr(vContadorMes + 1)).AsFloat + qPedidoProdMesCliQtdParesCanc.AsFloat;
          mProdutoMesVlrTotal.AsFloat := -0.00001;
          mProdutoMes.Post;
          {***Final da gravação do registro total***}
          {*****************************************}

          qPedidoProdMesCli.Next;
        end;
    end;
end;

procedure TfHistGeral.Ajusta_Datas;
var
  ano, mes, dia : Word;
  vAux : Integer;
begin
  vAux := 0;
  DecodeDate(DateEdit1.Date,ano,mes,dia);
  DateEdit1.Date := EncodeDate(ano,mes,01);
  DecodeDate(DateEdit2.Date,ano,mes,dia);
  dia := 30;
  if (mes = 01) or (mes = 03) or (mes = 05) or (mes = 07) or (mes = 08) or (mes = 10) or (mes = 12) then
    dia := 31
  else
  if mes = 02 then
    begin
      dia := 29;
      if vAux mod 4 > 0 then
        dia := 28;
    end;
  DateEdit2.Date := EncodeDate(ano,mes,dia);

end;

procedure TfHistGeral.Monta_SQLPedidoProd;
begin
  qPedidoProd.Close;
  qPedidoProd.SQL.Clear;
  qPedidoProd.SQL.Add('SELECT SUM( Dbpedidoitem.QtdPares ) QtdPares, SUM( Dbpedidoitem.QtdParesRest ) QtdParesRest, SUM( Dbpedidoitem.QtdParesCanc ) QtdParesCanc, Dbpedidoitem.CodProduto, Dbproduto.Referencia, Dbproduto.Nome');
  qPedidoProd.SQL.Add('FROM "dbPedido.DB" Dbpedido');
  qPedidoProd.SQL.Add('   INNER JOIN "dbPedidoItem.DB" Dbpedidoitem');
  qPedidoProd.SQL.Add('   ON  (Dbpedido.Pedido = Dbpedidoitem.Pedido)');
  qPedidoProd.SQL.Add('   FULL JOIN "dbProduto.DB" Dbproduto');
  qPedidoProd.SQL.Add('   ON  (Dbpedidoitem.CodProduto = Dbproduto.Codigo)');
  qPedidoProd.SQL.Add('WHERE (0=0) ');
  {if RxDBLookupCombo2.Text <> '' then
    begin
      qPedidoProd.SQL.Add('  AND (dbPedido.Filial = :Filial)');
      qPedidoProd.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
    end;}
  if RxDBLookupCombo1.Text <> '' then
    begin
      qPedidoProd.SQL.Add('  AND (dbPedido.CodCliente = :CodCli)');
      qPedidoProd.ParamByName('CodCli').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if RxDBLookupCombo4.Text <> '' then
    begin
      qPedidoProd.SQL.Add('  AND (dbPedido.CodVendedor = :CodVendedor)');
      qPedidoProd.ParamByName('CodVendedor').AsInteger  := RxDBLookupCombo4.KeyValue;
    end;
  if DateEdit1.Date > 0 then
    begin
      qPedidoProd.SQL.Add('  AND (dbPedido.DtIniEmbarque >= :DtReprogramacaoIni)');
      qPedidoProd.ParamByName('DtReprogramacaoIni').AsDate := DateEdit1.Date;
    end;
  if DateEdit2.Date > 0 then
    begin
      qPedidoProd.SQL.Add('  AND (dbPedido.DtIniEmbarque <= :DtReprogramacaoFin)');
      qPedidoProd.ParamByName('DtReprogramacaoFin').AsDate := DateEdit2.Date;
    end;
  if RxDBLookupCombo3.Text <> '' then
    begin
      qPedidoProd.SQL.Add('  AND (dbPedidoItem.CodProduto = :CodProduto)');
      qPedidoProd.ParamByName('CodProduto').AsInteger := RxDBLookupCombo3.KeyValue;
    end;
  qPedidoProd.SQL.Add('GROUP BY Dbpedidoitem.CodProduto, Dbproduto.Referencia, Dbproduto.Nome');
  qPedidoProd.Open;
end;

procedure TfHistGeral.Monta_SQLPedidoCliMes;
begin
  qPedidoCliMes.Close;
  qPedidoCliMes.SQL.Clear;
  qPedidoCliMes.SQL.Add('SELECT Dbpedido.CodCliente, dbPedido.DtIniEmbarque DtReprogramacao, SUM( Dbpedidoitem.QtdPares ) QtdPares, SUM( Dbpedidoitem.QtdParesRest ) QtdParesRest, ');
  //qPedidoCliMes.SQL.Add(' SUM( Dbpedidoitem.QtdParesCanc ) QtdParesCanc, dbCliente.CodGrupo, dbCliente.Nome NomeCliente, dbCliente.Fantasia');
  qPedidoCliMes.SQL.Add(' SUM( Dbpedidoitem.QtdParesCanc ) QtdParesCanc, dbCliente.Nome NomeCliente, dbCliente.Fantasia');
  qPedidoCliMes.SQL.Add('FROM "dbPedido.DB" Dbpedido');
  qPedidoCliMes.SQL.Add('   INNER JOIN "dbPedidoItem.DB" Dbpedidoitem');
  qPedidoCliMes.SQL.Add('   ON  (Dbpedido.Pedido = Dbpedidoitem.Pedido)');
  qPedidoCliMes.SQL.Add('   INNER JOIN "dbCliente.DB" dbCliente');
  qPedidoCliMes.SQL.Add('   ON  (dbCliente.Codigo = Dbpedido.CodCliente)');
  qPedidoCliMes.SQL.Add('WHERE (0=0) ');
  {if RxDBLookupCombo2.Text <> '' then
    begin
      qPedidoCliMes.SQL.Add('  AND (dbPedido.Filial = :Filial)');
      qPedidoCliMes.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
    end;}
  if RxDBLookupCombo1.Text <> '' then
    begin
      qPedidoCliMes.SQL.Add('  AND (dbPedido.CodCliente = :CodCli)');
      qPedidoCliMes.ParamByName('CodCli').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if RxDBLookupCombo4.Text <> '' then
    begin
      qPedidoCliMes.SQL.Add('  AND (dbPedido.CodVendedor = :CodVendedor)');
      qPedidoCliMes.ParamByName('CodVendedor').AsInteger  := RxDBLookupCombo4.KeyValue;
    end;
  if DateEdit1.Date > 0 then
    begin
      qPedidoCliMes.SQL.Add('  AND (dbPedido.DtIniEmbarque >= :DtReprogramacaoIni)');
      qPedidoCliMes.ParamByName('DtReprogramacaoIni').AsDate := DateEdit1.Date;
    end;
  if DateEdit2.Date > 0 then
    begin
      qPedidoCliMes.SQL.Add('  AND (dbPedido.DtIniEmbarque <= :DtReprogramacaoFin)');
      qPedidoCliMes.ParamByName('DtReprogramacaoFin').AsDate := DateEdit2.Date;
    end;
  if RxDBLookupCombo3.Text <> '' then
    begin
      qPedidoCliMes.SQL.Add('  AND (dbPedidoItem.CodProduto = :CodProduto)');
      qPedidoCliMes.ParamByName('CodProduto').AsInteger := RxDBLookupCombo3.KeyValue;
    end;
  //qPedidoCliMes.SQL.Add('GROUP BY Dbpedido.CodCliente, Dbpedidoitem.DtReprogramacao, dbCliente.CodGrupo, dbCliente.Nome, dbCliente.Fantasia');
  qPedidoCliMes.SQL.Add('GROUP BY Dbpedido.CodCliente, dbPedido.DtIniEmbarque, dbCliente.Nome, dbCliente.Fantasia');
  qPedidoCliMes.Open;
end;

procedure TfHistGeral.Monta_SQLNotas;
begin
  qNotas.Close;
  qNotas.SQL.Clear;
  qNotas.SQL.Add('SELECT Dbnotafiscal.CodCli, Dbcliente.Fantasia, Dbcliente.Nome NomeCliente, Dbnotafiscal.PercDesc, ');
  qNotas.SQL.Add(' Dbnotafiscalitens.CodProduto, Dbnotafiscalitens.CodCor, Dbnotafiscal.NumNota, Dbnotafiscal.DtEmissao, ');
  qNotas.SQL.Add(' Dbproduto.Referencia, Dbproduto.DescMaterial, Dbproduto.Nome NomeProduto, Dbnotafiscalitens.Unidade, ');
  qNotas.SQL.Add(' Dbnotafiscalitens.Qtd, Dbnotafiscalitens.Icms, Dbnotafiscalitens.Ipi, Dbnotafiscalitens.VlrUnit, Dbnotafiscalitens.VlrTotal, Dbnotafiscalitens.NatOper, dbNotaFiscal.CondPgto ');
  qNotas.SQL.Add('FROM "dbNotaFiscal.DB" Dbnotafiscal');
  qNotas.SQL.Add('   FULL JOIN "dbNotaFiscalItens.DB" Dbnotafiscalitens');
  //qNotas.SQL.Add('   ON  (Dbnotafiscal.Filial = Dbnotafiscalitens.Filial)');
  qNotas.SQL.Add('   ON  (Dbnotafiscal.NumNota = Dbnotafiscalitens.NumNota)');
  qNotas.SQL.Add('   INNER JOIN "dbCliente.DB" Dbcliente');
  qNotas.SQL.Add('   ON  (Dbnotafiscal.CodCli = Dbcliente.Codigo)');
  qNotas.SQL.Add('   FULL JOIN "dbProduto.DB" Dbproduto');
  qNotas.SQL.Add('   ON  (Dbnotafiscalitens.CodProduto = Dbproduto.Codigo)');
  qNotas.SQL.Add('WHERE 0=0');
  {if RxDBLookupCombo2.Text <> '' then
    begin
      qNotas.SQL.Add('  AND (dbNotaFiscal.Filial = :Filial)');
      qNotas.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
    end;}
  if RxDBLookupCombo1.Text <> '' then
    begin
      qNotas.SQL.Add('  AND (dbNotaFiscal.CodCli = :CodCli)');
      qNotas.ParamByName('CodCli').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if RxDBLookupCombo4.Text <> '' then
    begin
      qNotas.SQL.Add('  AND (dbNotaFiscal.CodVendedor = :CodVendedor)');
      qNotas.ParamByName('CodVendedor').AsInteger  := RxDBLookupCombo4.KeyValue;
    end;
  if DateEdit1.Date > 0 then
    begin
      qNotas.SQL.Add('  AND (dbNotaFiscal.DtEmissao >= :DtEmissaoIni)');
      qNotas.ParamByName('DtEmissaoIni').AsDate := DateEdit1.Date;
    end;
  if DateEdit2.Date > 0 then
    begin
      qNotas.SQL.Add('  AND (dbNotaFiscal.DtEmissao <= :DtEmissaoFin)');
      qNotas.ParamByName('DtEmissaoFin').AsDate := DateEdit2.Date;
    end;
  if RxDBLookupCombo3.Text <> '' then
    begin
      qNotas.SQL.Add('  AND (dbNotaFiscalItens.CodProduto = :CodProduto)');
      qNotas.ParamByName('CodProduto').AsInteger := RxDBLookupCombo3.KeyValue;
    end;
  qNotas.Open;
end;

procedure TfHistGeral.Grava_mVendedor(Codigo : Integer);
var
  vAux : Real;
begin
  if RxDBLookupCombo4.Text <> '' then
    if Codigo <> RxDBLookupCombo4.KeyValue then
      Exit;

  if mVendedor.Locate('CodVendedor',Codigo,[loCaseInsensitive]) then
    mVendedor.Edit
  else
    begin
      mVendedor.Insert;
      mVendedorCodVendedor.AsInteger := Codigo;
      if DM1.tVendedor.Locate('Codigo',Codigo,[loCaseInsensitive]) then
        mVendedorNomeVendedor.AsString := DM1.tVendedorNome.AsString;
    end;
  vAux := 0;
  if qVendedorPercDesc.AsFloat > 0 then
    vAux := StrToFloat(FormatFloat('0.00',(qVendedorVlrTotal.AsFloat * qVendedorPercDesc.AsFloat) / 100));
  mVendedorVlrTotal.AsFloat := mVendedorVlrTotal.AsFloat + StrToFloat(FormatFloat('0.00',qVendedorVlrTotal.AsFloat - vAux));
  mVendedorQtd.AsFloat      := mVendedorQtd.AsFloat + qVendedorQtd.AsFloat;
  mVendedorPercFat.AsFloat  := StrToFloat(FormatFloat('0.00000',(mVendedorVlrTotal.AsFloat / CurrencyEdit1.Value) * 100));
  mVendedor.Post;
end;

procedure TfHistGeral.Monta_SQLVend;
begin
  qVendedor.Close;
  qVendedor.SQL.Clear;
  qVendedor.SQL.Add('SELECT SUM( Dbnotafiscalitens.VlrTotal ) VlrTotal, SUM( Dbnotafiscalitens.Qtd ) Qtd, Dbnotafiscal.PercDesc, Dbnotafiscal.CodVendedor');
  qVendedor.SQL.Add('FROM "dbNotaFiscal.DB" Dbnotafiscal');
  qVendedor.SQL.Add('   INNER JOIN "dbNotaFiscalItens.DB" Dbnotafiscalitens');
  //qVendedor.SQL.Add('   ON  (Dbnotafiscal.Filial = Dbnotafiscalitens.Filial)');
  qVendedor.SQL.Add('   ON  (Dbnotafiscal.NumNota = Dbnotafiscalitens.NumNota)');
  qVendedor.SQL.Add('WHERE (Dbnotafiscalitens.GeraDuplicata = TRUE) ');
  qVendedor.SQL.Add('  AND ((Dbnotafiscal.Cancelada = False) or (Dbnotafiscal.Cancelada is Null)) ');
  qVendedor.SQL.Add('  AND (Dbnotafiscal.CodVendedor > 0) ');
  qVendedor.SQL.Add('  AND ((Dbnotafiscal.CondPgto = ''V'') or (Dbnotafiscal.CondPgto = ''P'')) ');
  if not CheckBox4.Checked then
    //qVendedor.SQL.Add('  AND (DbnotafiscalItens.Material = False) ');
    qVendedor.SQL.Add('  AND (Dbnotafiscal.TipoNota = ''1'') ');
  {if RxDBLookupCombo2.Text <> '' then
    begin
      qVendedor.SQL.Add('  AND (dbNotaFiscal.Filial = :Filial)');
      qVendedor.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
    end;}
  if RxDBLookupCombo1.Text <> '' then
    begin
      qVendedor.SQL.Add('  AND (dbNotaFiscal.CodCli = :CodCli)');
      qVendedor.ParamByName('CodCli').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if RxDBLookupCombo4.Text <> '' then
    begin
      qVendedor.SQL.Add('  AND (dbNotaFiscal.CodVendedor = :CodVendedor)');
      qVendedor.ParamByName('CodVendedor').AsInteger  := RxDBLookupCombo4.KeyValue;
    end;
  if DateEdit1.Date > 0 then
    begin
      qVendedor.SQL.Add('  AND (dbNotaFiscal.DtEmissao >= :DtEmissaoIni)');
      qVendedor.ParamByName('DtEmissaoIni').AsDate := DateEdit1.Date;
    end;
  if DateEdit2.Date > 0 then
    begin
      qVendedor.SQL.Add('  AND (dbNotaFiscal.DtEmissao <= :DtEmissaoFin)');
      qVendedor.ParamByName('DtEmissaoFin').AsDate := DateEdit2.Date;
    end;
  if RxDBLookupCombo3.Text <> '' then
    begin
      qVendedor.SQL.Add('  AND (dbNotaFiscalItens.CodProduto = :CodProduto)');
      qVendedor.ParamByName('CodProduto').AsInteger := RxDBLookupCombo3.KeyValue;
    end;
  qVendedor.SQL.Add('GROUP BY Dbnotafiscal.PercDesc, Dbnotafiscal.CodVendedor');
  qVendedor.SQL.Add('ORDER BY VlrTotal DESC');
  qVendedor.Open;

  //Monta auxiliar
  mVendedor.EmptyDataSet;
  SMDBGrid6.DataSource  := Nil;
  ProgressBar6.Max      := qVendedor.RecordCount;
  ProgressBar6.Position := 0;
  qVendedor.First;
  while not qVendedor.Eof do
    begin
      ProgressBar6.Position := ProgressBar6.Position + 1;
      if qVendedorCodVendedor.AsInteger > 0 then
        Grava_mVendedor(qVendedorCodVendedor.AsInteger);
      qVendedor.Next;
    end;
  SMDBGrid6.DataSource  := dsmVendedor;
end;

procedure TfHistGeral.Monta_SQLCliProdCor;
var
  vAux : Real;
begin
  qClienteProdCor.Close;
  qClienteProdCor.SQL.Clear;
  qClienteProdCor.SQL.Add('SELECT Dbnotafiscal.CodCli, Dbcliente.Fantasia, Dbcliente.Nome NomeCliente, Dbnotafiscalitens.CodProduto, Dbproduto.Referencia, Dbproduto.Nome NomeProduto, SUM( Dbnotafiscalitens.VlrTotal ) VlrTotal, ');
  //qClienteProdCor.SQL.Add('  SUM( Dbnotafiscalitens.Qtd ) Qtd, Dbnotafiscal.PercDesc, Dbnotafiscalitens.CodCor, dbCliente.CodGrupo');
  qClienteProdCor.SQL.Add('  SUM( Dbnotafiscalitens.Qtd ) Qtd, Dbnotafiscal.PercDesc, Dbnotafiscalitens.CodCor ');
  qClienteProdCor.SQL.Add('FROM "dbNotaFiscal.DB" Dbnotafiscal');
  qClienteProdCor.SQL.Add('   INNER JOIN "dbNotaFiscalItens.DB" Dbnotafiscalitens');
  //qClienteProdCor.SQL.Add('   ON  (Dbnotafiscal.Filial = Dbnotafiscalitens.Filial)');
  qClienteProdCor.SQL.Add('   ON  (Dbnotafiscal.NumNota = Dbnotafiscalitens.NumNota)');
  qClienteProdCor.SQL.Add('   INNER JOIN "dbCliente.DB" Dbcliente');
  qClienteProdCor.SQL.Add('   ON  (Dbnotafiscal.CodCli = Dbcliente.Codigo)');
  qClienteProdCor.SQL.Add('   FULL JOIN "dbProduto.DB" Dbproduto');
  qClienteProdCor.SQL.Add('   ON  (Dbnotafiscalitens.CodProduto = Dbproduto.Codigo)');
  qClienteProdCor.SQL.Add('WHERE (Dbnotafiscalitens.GeraDuplicata = TRUE) ');
  qClienteProdCor.SQL.Add('  AND ((Dbnotafiscal.Cancelada = False) or (Dbnotafiscal.Cancelada is Null)) ');
  qClienteProdCor.SQL.Add('  AND ((Dbnotafiscal.CondPgto = ''V'') or (Dbnotafiscal.CondPgto = ''P'')) ');
  if not CheckBox4.Checked then
    //qClienteProdCor.SQL.Add('  AND (DbnotafiscalItens.Material = False) ');
    qClienteProdCor.SQL.Add('  AND (Dbnotafiscal.TipoNota = ''1'') ');
  {if RxDBLookupCombo2.Text <> '' then
    begin
      qClienteProdCor.SQL.Add('  AND (dbNotaFiscal.Filial = :Filial)');
      qClienteProdCor.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
    end;}
  if RxDBLookupCombo1.Text <> '' then
    begin
      qClienteProdCor.SQL.Add('  AND (dbNotaFiscal.CodCli = :CodCli)');
      qClienteProdCor.ParamByName('CodCli').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if RxDBLookupCombo4.Text <> '' then
    begin
      qClienteProdCor.SQL.Add('  AND (dbNotaFiscal.CodVendedor = :CodVendedor)');
      qClienteProdCor.ParamByName('CodVendedor').AsInteger  := RxDBLookupCombo4.KeyValue;
    end;
  if DateEdit1.Date > 0 then
    begin
      qClienteProdCor.SQL.Add('  AND (dbNotaFiscal.DtEmissao >= :DtEmissaoIni)');
      qClienteProdCor.ParamByName('DtEmissaoIni').AsDate := DateEdit1.Date;
    end;
  if DateEdit2.Date > 0 then
    begin
      qClienteProdCor.SQL.Add('  AND (dbNotaFiscal.DtEmissao <= :DtEmissaoFin)');
      qClienteProdCor.ParamByName('DtEmissaoFin').AsDate := DateEdit2.Date;
    end;
  if RxDBLookupCombo3.Text <> '' then
    begin
      qClienteProdCor.SQL.Add('  AND (dbNotaFiscalItens.CodProduto = :CodProduto)');
      qClienteProdCor.ParamByName('CodProduto').AsInteger := RxDBLookupCombo3.KeyValue;
    end;
  //qClienteProdCor.SQL.Add('GROUP BY Dbnotafiscal.CodCli, Dbcliente.Fantasia, Dbcliente.Nome, Dbnotafiscalitens.CodProduto, Dbproduto.Referencia, Dbproduto.Nome, Dbnotafiscal.PercDesc, Dbnotafiscalitens.CodCor, dbCliente.CodGrupo');
  qClienteProdCor.SQL.Add('GROUP BY Dbnotafiscal.CodCli, Dbcliente.Fantasia, Dbcliente.Nome, Dbnotafiscalitens.CodProduto, Dbproduto.Referencia, Dbproduto.Nome, Dbnotafiscal.PercDesc, Dbnotafiscalitens.CodCor');
  qClienteProdCor.SQL.Add('ORDER BY VlrTotal');
  qClienteProdCor.Open;

  //Monta auxiliar
  mClienteProdCor.EmptyDataSet;
  SMDBGrid5.DataSource  := Nil;
  ProgressBar5.Max      := qClienteProdCor.RecordCount;
  ProgressBar5.Position := 0;
  qClienteProdCor.First;
  while not qClienteProdCor.Eof do
    begin
      ProgressBar5.Position := ProgressBar5.Position + 1;
      //if (CheckBox3.Checked) and (qClienteProdCorCodGrupo.AsInteger > 0) then
      //  vCodAgrupado := 'G' + qClienteProdCorCodGrupo.AsString
      //else
        vCodAgrupado := 'C' + qClienteProdCorCodCli.AsString;
      if mClienteProdCor.Locate('CodAgrupado;CodProduto;CodCor',VarArrayOf([vCodAgrupado,qClienteProdCorCodProduto.AsInteger,qClienteProdCorCodCor.AsInteger]),[locaseinsensitive]) then
        mClienteProdCor.Edit
      else
        begin
          mClienteProdCor.Insert;
          mClienteProdCorCodAgrupado.AsString := vCodAgrupado;
          mClienteProdCorCodCliente.AsInteger := qClienteProdCorCodCli.AsInteger;
          mClienteProdCorCodProduto.AsInteger := qClienteProdCorCodProduto.AsInteger;
          mClienteProdCorCodCor.AsInteger     := qClienteProdCorCodCor.AsInteger;
          mClienteProdCorNomeCliente.AsString := qClienteProdCorNomeCliente.AsString;
          mClienteProdCorFantasia.AsString    := qClienteProdCorFantasia.AsString;
          mClienteProdCorNomeProduto.AsString := qClienteProdCorNomeProduto.AsString;
          mClienteProdCorReferencia.AsString  := qClienteProdCorReferencia.AsString;
          //mClienteProdCorCodGrupo.AsInteger   := qClienteProdCodGrupo.AsInteger;
          {if copy(vCodAgrupado,1,1) = 'G' then
            begin
              mClienteProdCorNomeCliente.AsString := qClienteProdCorlkNomeGrupo.AsString;
              mClienteProdCorFantasia.AsString    := qClienteProdCorlkNomeGrupo.AsString;
            end;}
          if DM1.tCor.Locate('Codigo',qClienteProdCorCodCor.AsInteger,[loCaseInsensitive]) then
            mClienteProdCorNomeCor.AsString := DM1.tCorNome.AsString;
        end;
      vAux := 0;
      if qClienteProdCorPercDesc.AsFloat > 0 then
        vAux := StrToFloat(FormatFloat('0.00',(qClienteProdCorVlrTotal.AsFloat * qClienteProdCorPercDesc.AsFloat) / 100));
      mClienteProdCorVlrTotal.AsFloat := mClienteProdCorVlrTotal.AsFloat + StrToFloat(FormatFloat('0.00',qClienteProdCorVlrTotal.AsFloat - vAux));
      mClienteProdCorQtd.AsFloat      := mClienteProdCorQtd.AsFloat + qClienteProdCorQtd.AsFloat;
      mClienteProdCorPercFat.AsFloat  := StrToFloat(FormatFloat('0.00000',(mClienteProdCorVlrTotal.AsFloat / CurrencyEdit1.Value) * 100));
      mClienteProdCor.Post;
      qClienteProdCor.Next;
    end;
  SMDBGrid5.DataSource  := dsmClienteProdCor;
end;

procedure TfHistGeral.Monta_SQLProd;
var
  vAux : Real;
begin
  qProduto.Close;
  qProduto.SQL.Clear;
  qProduto.SQL.Add('SELECT SUM( Dbnotafiscalitens.VlrTotal ) VlrTotal, SUM( Dbnotafiscalitens.Qtd ) Qtd, Dbnotafiscal.PercDesc, Dbnotafiscalitens.CodProduto, Dbproduto.Referencia, Dbproduto.Nome');
  qProduto.SQL.Add('FROM "dbNotaFiscal.DB" Dbnotafiscal');
  qProduto.SQL.Add('   INNER JOIN "dbNotaFiscalItens.DB" Dbnotafiscalitens');
  //qProduto.SQL.Add('   ON  (Dbnotafiscal.Filial = Dbnotafiscalitens.Filial)');
  qProduto.SQL.Add('   ON  (Dbnotafiscal.NumNota = Dbnotafiscalitens.NumNota)');
  qProduto.SQL.Add('   FULL JOIN "dbProduto.DB" Dbproduto');
  qProduto.SQL.Add('   ON  (Dbnotafiscalitens.CodProduto = Dbproduto.Codigo)');
  qProduto.SQL.Add('WHERE (Dbnotafiscalitens.GeraDuplicata = TRUE) ');
  qProduto.SQL.Add('  AND ((Dbnotafiscal.Cancelada = False) or (Dbnotafiscal.Cancelada is Null)) ');
  qProduto.SQL.Add('  AND ((Dbnotafiscal.CondPgto = ''V'') or (Dbnotafiscal.CondPgto = ''P'')) ');
  if not CheckBox4.Checked then
    //qProduto.SQL.Add('  AND (DbnotafiscalItens.Material = False) ');
    qProduto.SQL.Add('  AND (Dbnotafiscal.TipoNota = ''1'') ');
  {if RxDBLookupCombo2.Text <> '' then
    begin
      qProduto.SQL.Add('  AND (dbNotaFiscal.Filial = :Filial)');
      qProduto.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
    end;}
  if RxDBLookupCombo1.Text <> '' then
    begin
      qProduto.SQL.Add('  AND (dbNotaFiscal.CodCli = :CodCli)');
      qProduto.ParamByName('CodCli').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if RxDBLookupCombo4.Text <> '' then
    begin
      qProduto.SQL.Add('  AND (dbNotaFiscal.CodVendedor = :CodVendedor)');
      qProduto.ParamByName('CodVendedor').AsInteger  := RxDBLookupCombo4.KeyValue;
    end;
  if DateEdit1.Date > 0 then
    begin
      qProduto.SQL.Add('  AND (dbNotaFiscal.DtEmissao >= :DtEmissaoIni)');
      qProduto.ParamByName('DtEmissaoIni').AsDate := DateEdit1.Date;
    end;
  if DateEdit2.Date > 0 then
    begin
      qProduto.SQL.Add('  AND (dbNotaFiscal.DtEmissao <= :DtEmissaoFin)');
      qProduto.ParamByName('DtEmissaoFin').AsDate := DateEdit2.Date;
    end;
  if RxDBLookupCombo3.Text <> '' then
    begin
      qProduto.SQL.Add('  AND (dbNotaFiscalItens.CodProduto = :CodProduto)');
      qProduto.ParamByName('CodProduto').AsInteger := RxDBLookupCombo3.KeyValue;
    end;
  qProduto.SQL.Add('GROUP BY Dbnotafiscal.PercDesc, Dbnotafiscalitens.CodProduto, Dbproduto.Referencia, Dbproduto.Nome');
  qProduto.SQL.Add('ORDER BY VlrTotal DESC');
  qProduto.Open;

  //Monta auxiliar
  mProduto.EmptyDataSet;
  SMDBGrid4.DataSource  := Nil;
  ProgressBar4.Max      := qProduto.RecordCount + qPedidoProd.RecordCount;
  ProgressBar4.Position := 0;
  qProduto.First;
  while not qProduto.Eof do
    begin
      ProgressBar4.Position := ProgressBar4.Position + 1;
      if mProduto.Locate('CodProduto',qProdutoCodProduto.AsInteger,[loCaseInsensitive]) then
        mProduto.Edit
      else
        begin
          mProduto.Insert;
          mProdutoCodProduto.AsInteger := qProdutoCodProduto.AsInteger;
          mProdutoReferencia.AsString  := qProdutoReferencia.AsString;
          mProdutoNomeProduto.AsString := qProdutoNome.AsString;
        end;
      vAux := 0;
      if qProdutoPercDesc.AsFloat > 0 then
        vAux := StrToFloat(FormatFloat('0.00',(qProdutoVlrTotal.AsFloat * qProdutoPercDesc.AsFloat) / 100));
      mProdutoVlrTotal.AsFloat := mProdutoVlrTotal.AsFloat + StrToFloat(FormatFloat('0.00',qProdutoVlrTotal.AsFloat - vAux));
      mProdutoQtd.AsFloat      := mProdutoQtd.AsFloat + qProdutoQtd.AsFloat;
      mProdutoPercFat.AsFloat  := StrToFloat(FormatFloat('0.00000',(mProdutoVlrTotal.AsFloat / CurrencyEdit1.Value) * 100));
      mProduto.Post;
      qProduto.Next;
    end;

  //Monta o auxiliar com as quantidades dos pedidos
  qPedidoProd.First;
  while not qPedidoProd.Eof do
    begin
      ProgressBar4.Position := ProgressBar4.Position + 1;
      if mProduto.Locate('CodProduto',qPedidoProdCodProduto.AsInteger,[loCaseInsensitive]) then
        mProduto.Edit
      else
        begin
          mProduto.Insert;
          mProdutoCodProduto.AsInteger := qPedidoProdCodProduto.AsInteger;
          mProdutoReferencia.AsString  := qPedidoProdReferencia.AsString;
          mProdutoNomeProduto.AsString := qPedidoProdNome.AsString;
        end;
      mProdutoQtdPedido.AsFloat    := mProdutoQtdPedido.AsFloat + qPedidoProdQtdPares.AsFloat;
      mProdutoQtdRestante.AsFloat  := mProdutoQtdRestante.AsFloat + qPedidoProdQtdParesRest.AsFloat;
      mProdutoQtdCancelada.AsFloat := mProdutoQtdCancelada.AsFloat + qPedidoProdQtdParesCanc.AsFloat;
      mProduto.Post;
      qPedidoProd.Next;
    end;
  SMDBGrid4.DataSource  := dsmProduto;
end;

procedure TfHistGeral.Monta_Datas(Numero : Integer);
var
  ano, mes, dia : Word;
  vData1 : TDateTime;
  i : Integer;
  Indice : integer;
begin
  vContadorMes := 0;
  mDatas.EmptyDataSet;
  vContadorMes := 0;
  vData1 := DateEdit1.Date;
  while vData1 <= DateEdit2.Date do
    begin
      DecodeDate(vData1,ano,mes,dia);
      inc(vContadorMes);
      mDatas.Insert;
      mDatasData.AsString    := FormatFloat('00',Mes) + '/' + FormatFloat('0000',Ano);
      mDatasIndice.AsInteger := vContadorMes;
      mDatas.Post;
      mes := mes + 1;
      if mes > 12 then
        begin
          mes := 01;
          ano := ano + 1;
        end;
      vData1 := EncodeDate(ano,mes,dia);
    end;
  if vContadorMes < 13 then
    begin
      indice := 2;
      case numero of
        2  : indice := 0;
        10 : indice := 3;
      end;
      mDatas.First;
      while not mDatas.Eof do
        begin
          TSMDBGrid(FindComponent('SMDBGrid'+IntToStr(Numero))).Columns.Items[mDatasIndice.AsInteger + Indice].Visible := True;
          TSMDBGrid(FindComponent('SMDBGrid'+IntToStr(Numero))).Columns.Items[mDatasIndice.AsInteger + Indice].Title.Caption := mDatasData.AsString;
          mDatas.Next;
        end;
      TSMDBGrid(FindComponent('SMDBGrid'+IntToStr(Numero))).Columns.Items[vContadorMes + 1 + Indice].Title.Caption := 'Total';
      i := vContadorMes + 2 + indice;
      while i < (TSMDBGrid(FindComponent('SMDBGrid'+IntToStr(Numero))).ColCount - 1) do
        begin
          TSMDBGrid(FindComponent('SMDBGrid'+IntToStr(Numero))).Columns.Items[i].Visible := False;
          inc(i);
        end;
    end;
end;

procedure TfHistGeral.Monta_SQLCliMes;
var
  vDataAux : String;
  ano, mes, dia : Word;
  vAux : Real;
begin
  qClienteMes.Close;
  qClienteMes.SQL.Clear;
  qClienteMes.SQL.Add('SELECT dbNotaFiscal.DtEmissao, Dbnotafiscal.PercDesc, Dbnotafiscalitens.VlrTotal, dbNotaFiscal.CodCli, dbNotaFiscalItens.Qtd, ');
  //qClienteMes.SQL.Add(' dbCliente.CodGrupo, dbCliente.Nome NomeCliente, dbCliente.Fantasia');
  qClienteMes.SQL.Add(' dbCliente.Nome NomeCliente, dbCliente.Fantasia');
  qClienteMes.SQL.Add('FROM "dbnotafiscal.db" Dbnotafiscal');
  qClienteMes.SQL.Add(' INNER JOIN "dbNotaFiscalItens.DB" Dbnotafiscalitens');
  //qClienteMes.SQL.Add('   ON  (Dbnotafiscal.Filial = Dbnotafiscalitens.Filial)');
  qClienteMes.SQL.Add('   ON (Dbnotafiscal.NumNota = Dbnotafiscalitens.NumNota)');
  qClienteMes.SQL.Add(' INNER JOIN "dbCliente.DB" dbCliente');
  qClienteMes.SQL.Add('   ON  (dbCliente.Codigo = Dbnotafiscal.CodCli)');
  qClienteMes.SQL.Add('WHERE (Dbnotafiscalitens.GeraDuplicata = TRUE) ');
  qClienteMes.SQL.Add('  AND ((Dbnotafiscal.Cancelada = False) or (Dbnotafiscal.Cancelada is Null)) ');
  qClienteMes.SQL.Add('  AND (Dbnotafiscal.dtemissao  >= :DtInicial) ');
  qClienteMes.SQL.Add('  AND (Dbnotafiscal.dtemissao  <= :DtFinal) ');
  qClienteMes.SQL.Add('  AND ((Dbnotafiscal.CondPgto = ''V'') or (Dbnotafiscal.CondPgto = ''P'')) ');
  if not CheckBox4.Checked then
    //qClienteMes.SQL.Add('  AND (DbnotafiscalItens.Material = False) ');
    qClienteMes.SQL.Add('  AND (Dbnotafiscal.TipoNota = ''1'') ');
  qClienteMes.ParamByName('DtInicial').AsDate := DateEdit1.Date;
  qClienteMes.ParamByName('DtFinal').AsDate   := DateEdit2.Date;
  {if RxDBLookupCombo2.Text <> '' then
    begin
      qClienteMes.SQL.Add('  AND (dbNotaFiscal.Filial = :Filial)');
      qClienteMes.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
    end;}
  if RxDBLookupCombo1.Text <> '' then
    begin
      qClienteMes.SQL.Add('  AND (dbNotaFiscal.CodCli = :CodCli)');
      qClienteMes.ParamByName('CodCli').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if RxDBLookupCombo4.Text <> '' then
    begin
      qClienteMes.SQL.Add('  AND (dbNotaFiscal.CodVendedor = :CodVendedor)');
      qClienteMes.ParamByName('CodVendedor').AsInteger  := RxDBLookupCombo4.KeyValue;
    end;
  if RxDBLookupCombo3.Text <> '' then
    begin
      qClienteMes.SQL.Add('  AND (dbNotaFiscalItens.CodProduto = :CodProduto)');
      qClienteMes.ParamByName('CodProduto').AsInteger := RxDBLookupCombo3.KeyValue;
    end;
  qClienteMes.SQL.Add('ORDER BY dbNotaFiscal.DtEmissao');
  qClienteMes.Open;

  //Mota Auxiliar
  SMDBGrid2.DataSource := nil;
  ProgressBar1.Max      := qClienteMes.RecordCount + qPedidoCliMes.RecordCount;
  ProgressBar1.Position := 0;
  mClienteMes.EmptyDataSet;
  qClienteMes.First;
  while not qClienteMes.Eof do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;
      //if (CheckBox3.Checked) and (qClienteMesCodGrupo.AsInteger > 0) then
      //  vCodAgrupado := 'G' + qClienteMesCodGrupo.AsString
      //else
        vCodAgrupado := 'C' + qClienteMesCodCli.AsString;
      if mClienteMes.Locate('CodAgrupado',vCodAgrupado,[loCaseInsensitive]) then
        mClienteMes.Edit
      else
        begin
          mClienteMes.Insert;
          mClienteMesCodAgrupado.AsString := vCodAgrupado;
          mClienteMesCodCliente.AsInteger := qClienteMesCodCli.AsInteger;
          //mClienteMesCodGrupo.AsInteger   := qClienteMesCodGrupo.AsInteger;
          mClienteMesNomeCliente.AsString := qClienteMesNomeCliente.AsString;
          mClienteMesFantasia.AsString    := qClienteFantasia.AsString;
          {if copy(vCodAgrupado,1,1) = 'G' then
            begin
              mClienteMesNomeCliente.AsString := qClienteMeslkNomeGrupo.AsString;
              mClienteMesFantasia.AsString    := qClienteMeslkNomeGrupo.AsString;
            end;}
        end;
      DecodeDate(qClienteMesDtEmissao.AsDateTime,ano,mes,dia);
      vDataAux := FormatFloat('00',mes) + '/' + FormatFloat('0000',ano);
      mDatas.Locate('Data',vDataAux,[loCaseInsensitive]);
      vAux := 0;
      if qClienteMesPercDesc.AsFloat > 0 then
        vAux := StrToFloat(FormatFloat('0.00',(qClienteMesVlrTotal.AsFloat * qClienteMesPercDesc.AsFloat) / 100));
      mClienteMes.FieldByName('VlrFaturamento'+mDatasIndice.AsString).AsFloat := mClienteMes.FieldByName('VlrFaturamento'+mDatasIndice.AsString).AsFloat + StrToFloat(FormatFloat('0.00',qClienteMesVlrTotal.AsFloat - vAux));
      mClienteMes.FieldByName('Qtd'+mDatasIndice.AsString).AsFloat := mClienteMes.FieldByName('Qtd'+mDatasIndice.AsString).AsFloat + qClienteMesQtd.AsFloat;
      mFatMensal.Locate('Data',vDataAux,[loCaseInsensitive]);
      mClienteMes.FieldByName('Perc'+mDatasIndice.AsString).AsFloat := StrToFloat(FormatFloat('0.00000',(mClienteMes.FieldByName('VlrFaturamento'+mDatasIndice.AsString).AsFloat / mFatMensalVlrFaturamento.Value) * 100));
      //Total
      mClienteMes.FieldByName('VlrFaturamento'+IntToStr(vContadorMes + 1)).AsFloat := mClienteMes.FieldByName('VlrFaturamento'+IntToStr(vContadorMes + 1)).AsFloat + StrToFloat(FormatFloat('0.00',qClienteMesVlrTotal.AsFloat - vAux));
      mClienteMes.FieldByName('Qtd'+IntToStr(vContadorMes + 1)).AsFloat            := mClienteMes.FieldByName('Qtd'+IntToStr(vContadorMes + 1)).AsFloat + qClienteMesQtd.AsFloat;
      mClienteMes.FieldByName('Perc'+IntToStr(vContadorMes + 1)).AsFloat           := StrToFloat(FormatFloat('0.00000',(mClienteMes.FieldByName('VlrFaturamento'+IntToStr(vContadorMes + 1)).AsFloat / CurrencyEdit1.Value) * 100));

      mClienteMesVlrTotal.AsFloat := mClienteMesVlrTotal.AsFloat + StrToFloat(FormatFloat('0.00',qClienteMesVlrTotal.AsFloat - vAux));
      mClienteMes.Post;

      {***************************}
      {*** Grava o total geral ***}
      {***************************}
      //Este bloco foi incluido dia 13/07/2007 para imprimir o total geral, aproveitando
      //a mesma tabela auxiliar, a única diferença é que vai imprimir total zero, devido ao
      //indice, ser por ondem decrescente pelo valor
      vCodAgrupado := 'T99999';
      if mClienteMes.Locate('CodAgrupado',vCodAgrupado,[loCaseInsensitive]) then
        mClienteMes.Edit
      else
        begin
          mClienteMes.Insert;
          mClienteMesCodAgrupado.AsString := vCodAgrupado;
          mClienteMesNomeCliente.AsString := ' *** TOTAL GERAL *** ';
          mClienteMesFantasia.AsString    := ' *** TOTAL GERAL *** ';
        end;
      mClienteMes.FieldByName('VlrFaturamento'+mDatasIndice.AsString).AsFloat := mClienteMes.FieldByName('VlrFaturamento'+mDatasIndice.AsString).AsFloat + StrToFloat(FormatFloat('0.00',qClienteMesVlrTotal.AsFloat - vAux));
      mClienteMes.FieldByName('Qtd'+mDatasIndice.AsString).AsFloat := mClienteMes.FieldByName('Qtd'+mDatasIndice.AsString).AsFloat + qClienteMesQtd.AsFloat;
      mClienteMes.FieldByName('Perc'+mDatasIndice.AsString).AsFloat := StrToFloat(FormatFloat('0.00000',(mClienteMes.FieldByName('VlrFaturamento'+mDatasIndice.AsString).AsFloat / mFatMensalVlrFaturamento.Value) * 100));
      //Total
      mClienteMes.FieldByName('VlrFaturamento'+IntToStr(vContadorMes + 1)).AsFloat := mClienteMes.FieldByName('VlrFaturamento'+IntToStr(vContadorMes + 1)).AsFloat + StrToFloat(FormatFloat('0.00',qClienteMesVlrTotal.AsFloat - vAux));
      mClienteMes.FieldByName('Qtd'+IntToStr(vContadorMes + 1)).AsFloat            := mClienteMes.FieldByName('Qtd'+IntToStr(vContadorMes + 1)).AsFloat + qClienteMesQtd.AsFloat;
      mClienteMes.FieldByName('Perc'+IntToStr(vContadorMes + 1)).AsFloat           := StrToFloat(FormatFloat('0.00000',(mClienteMes.FieldByName('VlrFaturamento'+IntToStr(vContadorMes + 1)).AsFloat / CurrencyEdit1.Value) * 100));
      mClienteMesVlrTotal.AsFloat := -0.00001;
      mClienteMes.Post;
      //Final da gravação do registro total

      qClienteMes.Next;
    end;

  //Monta a quantidade pendente e a quantidade do pedido
  qPedidoCliMes.First;
  while not qPedidoCliMes.Eof do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;
      //if (CheckBox3.Checked) and (qPedidoCliMesCodGrupo.AsInteger > 0) then
      //  vCodAgrupado := 'G' + qPedidoCliMesCodGrupo.AsString
      //else
        vCodAgrupado := 'C' + qPedidoCliMesCodCliente.AsString;
      if mClienteMes.Locate('CodAgrupado',vCodAgrupado,[loCaseInsensitive]) then
        mClienteMes.Edit
      else
        begin
          mClienteMes.Insert;
          mClienteMesCodAgrupado.AsString := vCodAgrupado;
          //mClienteMesCodGrupo.AsInteger   := qPedidoCliMesCodGrupo.AsInteger;
          mClienteMesCodCliente.AsInteger := qPedidoCliMesCodCliente.AsInteger;
          mClienteMesNomeCliente.AsString := qPedidoCliMesNomeCliente.AsString;
          mClienteMesFantasia.AsString    := qPedidoCliMesFantasia.AsString;
          {if copy(vCodAgrupado,1,1) = 'G' then
            begin
              mClienteMesNomeCliente.AsString := qPedidoCliMeslkNomeGrupo.AsString;
              mClienteMesFantasia.AsString    := qPedidoCliMeslkNomeGrupo.AsString;
            end;}
        end;
      DecodeDate(qPedidoCliMesDtReprogramacao.AsDateTime,ano,mes,dia);
      vDataAux := FormatFloat('00',mes) + '/' + FormatFloat('0000',ano);
      mDatas.Locate('Data',vDataAux,[loCaseInsensitive]);
      mClienteMes.FieldByName('QtdPedido'+mDatasIndice.AsString).AsFloat    := mClienteMes.FieldByName('QtdPedido'+mDatasIndice.AsString).AsFloat + qPedidoCliMesQtdPares.AsFloat;
      mClienteMes.FieldByName('QtdRestante'+mDatasIndice.AsString).AsFloat := mClienteMes.FieldByName('QtdRestante'+mDatasIndice.AsString).AsFloat + qPedidoCliMesQtdParesRest.AsFloat;
      mClienteMes.FieldByName('QtdCancelada'+mDatasIndice.AsString).AsFloat := mClienteMes.FieldByName('QtdCancelada'+mDatasIndice.AsString).AsFloat + qPedidoCliMesQtdParesCanc.AsFloat;

      //Total
      mClienteMes.FieldByName('QtdPedido'+IntToStr(vContadorMes + 1)).AsFloat   := mClienteMes.FieldByName('QtdPedido'+IntToStr(vContadorMes + 1)).AsFloat + qPedidoCliMesQtdPares.AsFloat;
      mClienteMes.FieldByName('QtdRestante'+IntToStr(vContadorMes + 1)).AsFloat := mClienteMes.FieldByName('QtdRestante'+IntToStr(vContadorMes + 1)).AsFloat + qPedidoCliMesQtdParesRest.AsFloat;

      mClienteMes.Post;

      {***************************}
      {*** Grava o total geral ***}
      {***************************}
      //Este bloco foi incluido dia 13/07/2007 para imprimir o total geral, aproveitando
      //a mesma tabela auxiliar, a única diferença é que vai imprimir total zero, devido ao
      //indice, ser por ondem decrescente pelo valor
      vCodAgrupado := 'T99999';
      if mClienteMes.Locate('CodAgrupado',vCodAgrupado,[loCaseInsensitive]) then
        mClienteMes.Edit
      else
        begin
          mClienteMes.Insert;
          mClienteMesCodAgrupado.AsString := vCodAgrupado;
          mClienteMesNomeCliente.AsString := ' *** TOTAL GERAL *** ';
          mClienteMesFantasia.AsString    := ' *** TOTAL GERAL *** ';
        end;
      mClienteMes.FieldByName('QtdPedido'+mDatasIndice.AsString).AsFloat    := mClienteMes.FieldByName('QtdPedido'+mDatasIndice.AsString).AsFloat + qPedidoCliMesQtdPares.AsFloat;
      mClienteMes.FieldByName('QtdRestante'+mDatasIndice.AsString).AsFloat  := mClienteMes.FieldByName('QtdRestante'+mDatasIndice.AsString).AsFloat + qPedidoCliMesQtdParesRest.AsFloat;
      mClienteMes.FieldByName('QtdCancelada'+mDatasIndice.AsString).AsFloat := mClienteMes.FieldByName('QtdCancelada'+mDatasIndice.AsString).AsFloat + qPedidoCliMesQtdParesCanc.AsFloat;
      //Total
      mClienteMes.FieldByName('QtdPedido'+IntToStr(vContadorMes + 1)).AsFloat   := mClienteMes.FieldByName('QtdPedido'+IntToStr(vContadorMes + 1)).AsFloat + qPedidoCliMesQtdPares.AsFloat;
      mClienteMes.FieldByName('QtdRestante'+IntToStr(vContadorMes + 1)).AsFloat := mClienteMes.FieldByName('QtdRestante'+IntToStr(vContadorMes + 1)).AsFloat + qPedidoCliMesQtdParesRest.AsFloat;
      mClienteMesVlrTotal.AsFloat := -0.00001;
      mClienteMes.Post;
      //Final da gravação do registro total

      qPedidoCliMes.Next;
    end;

  SMDBGrid2.DataSource := dsmClienteMes;
end;

procedure TfHistGeral.Monta_SQLCliProd;
var
  vAux : Real;
begin
  qClienteProd.Close;
  qClienteProd.SQL.Clear;
  qClienteProd.SQL.Add('SELECT Dbnotafiscal.CodCli, Dbcliente.Fantasia, Dbcliente.Nome NomeCliente, Dbnotafiscalitens.CodProduto, Dbproduto.Referencia, Dbproduto.Nome NomeProduto, SUM( Dbnotafiscalitens.VlrTotal ) VlrTotal, ');
  //qClienteProd.SQL.Add(' SUM( Dbnotafiscalitens.Qtd ) Qtd, dbNotaFiscal.PercDesc, dbCliente.CodGrupo');
  qClienteProd.SQL.Add(' SUM( Dbnotafiscalitens.Qtd ) Qtd, dbNotaFiscal.PercDesc');
  qClienteProd.SQL.Add('FROM "dbNotaFiscal.DB" Dbnotafiscal');
  qClienteProd.SQL.Add('   INNER JOIN "dbNotaFiscalItens.DB" Dbnotafiscalitens');
  //qClienteProd.SQL.Add('   ON  (Dbnotafiscal.Filial = Dbnotafiscalitens.Filial)');
  qClienteProd.SQL.Add('   ON  (Dbnotafiscal.NumNota = Dbnotafiscalitens.NumNota)');
  qClienteProd.SQL.Add('   INNER JOIN "dbCliente.DB" Dbcliente');
  qClienteProd.SQL.Add('   ON  (Dbnotafiscal.CodCli = Dbcliente.Codigo)');
  qClienteProd.SQL.Add('   FULL JOIN "dbProduto.DB" Dbproduto');
  qClienteProd.SQL.Add('   ON  (Dbnotafiscalitens.CodProduto = Dbproduto.Codigo)');
  qClienteProd.SQL.Add('WHERE  (Dbnotafiscalitens.GeraDuplicata = TRUE) ');
  qClienteProd.SQL.Add('  AND  ((Dbnotafiscal.Cancelada = False) or (Dbnotafiscal.Cancelada is Null)) ');
  qClienteProd.SQL.Add('  AND ((Dbnotafiscal.CondPgto = ''V'') or (Dbnotafiscal.CondPgto = ''P'')) ');
  if not CheckBox4.Checked then
    //qClienteProd.SQL.Add('  AND (DbnotafiscalItens.Material = False)');
    qClienteProd.SQL.Add('  AND (Dbnotafiscal.TipoNota = ''1'')');
  {if RxDBLookupCombo2.Text <> '' then
    begin
      qClienteProd.SQL.Add('  AND (dbNotaFiscal.Filial = :Filial)');
      qClienteProd.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
    end;}
  if RxDBLookupCombo1.Text <> '' then
    begin
      qClienteProd.SQL.Add('  AND (dbNotaFiscal.CodCli = :CodCli)');
      qClienteProd.ParamByName('CodCli').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if RxDBLookupCombo4.Text <> '' then
    begin
      qClienteProd.SQL.Add('  AND (dbNotaFiscal.CodVendedor = :CodVendedor)');
      qClienteProd.ParamByName('CodVendedor').AsInteger  := RxDBLookupCombo4.KeyValue;
    end;
  if DateEdit1.Date > 0 then
    begin
      qClienteProd.SQL.Add('  AND (dbNotaFiscal.DtEmissao >= :DtEmissaoIni)');
      qClienteProd.ParamByName('DtEmissaoIni').AsDate := DateEdit1.Date;
    end;
  if DateEdit2.Date > 0 then
    begin
      qClienteProd.SQL.Add('  AND (dbNotaFiscal.DtEmissao <= :DtEmissaoFin)');
      qClienteProd.ParamByName('DtEmissaoFin').AsDate := DateEdit2.Date;
    end;
  if RxDBLookupCombo3.Text <> '' then
    begin
      qClienteProd.SQL.Add('  AND (dbNotaFiscalItens.CodProduto = :CodProduto)');
      qClienteProd.ParamByName('CodProduto').AsInteger := RxDBLookupCombo3.KeyValue;
    end;
  //qClienteProd.SQL.Add('GROUP BY Dbnotafiscal.CodCli, Dbcliente.Fantasia, Dbcliente.Nome, Dbnotafiscalitens.CodProduto, Dbproduto.Referencia, Dbproduto.Nome, dbNotaFiscal.PercDesc, dbCliente.CodGrupo');
  qClienteProd.SQL.Add('GROUP BY Dbnotafiscal.CodCli, Dbcliente.Fantasia, Dbcliente.Nome, Dbnotafiscalitens.CodProduto, Dbproduto.Referencia, Dbproduto.Nome, dbNotaFiscal.PercDesc');
  qClienteProd.SQL.Add('ORDER BY VlrTotal Desc');
  qClienteProd.Open;

  //Monta o auxiliar
  SMDBGrid1.DataSource := nil;
  mClienteProd.EmptyDataSet;
  ProgressBar2.Max      := qClienteProd.RecordCount + qPedidoCliProd.RecordCount;
  ProgressBar2.Position := 0;
  qClienteProd.First;
  while not qClienteProd.Eof do
    begin
      ProgressBar2.Position := ProgressBar2.Position + 1;
      //if (CheckBox3.Checked) and (qClienteProdcodgrupo.AsInteger > 0) then
      //  vCodAgrupado := 'G' + qClienteProdcodgrupo.AsString
      //else
        vCodAgrupado := 'C' + qClienteProdCodCli.AsString;
      if mClienteProd.Locate('CodAgrupado;CodProduto',VarArrayOf([vCodAgrupado,qClienteProdCodProduto.AsInteger]),[locaseinsensitive]) then
        mClienteProd.Edit
      else
        begin
          mClienteProd.Insert;
          mClienteProdCodAgrupado.AsString := vCodAgrupado;
          mClienteProdCodCliente.AsInteger := qClienteProdCodCli.AsInteger;
          mClienteProdCodProduto.AsInteger := qClienteProdCodProduto.AsInteger;
          mClienteProdNomeCliente.AsString := qClienteProdNomeCliente.AsString;
          mClienteProdFantasia.AsString    := qClienteProdFantasia.AsString;
          mClienteProdNomeProduto.AsString := qClienteProdNomeProduto.AsString;
          mClienteProdReferencia.AsString  := qClienteProdReferencia.AsString;
          //mClienteProdCodGrupo.AsInteger   := qClienteProdCodGrupo.AsInteger;
          {if copy(vCodAgrupado,1,1) = 'G' then
            begin
              mClienteProdNomeCliente.AsString := qClienteProdlkNomeGrupo.AsString;
              mClienteProdFantasia.AsString    := qClienteProdlkNomeGrupo.AsString;
            end;}
        end;
      vAux := 0;
      if qClienteProdPercDesc.AsFloat > 0 then
        vAux := StrToFloat(FormatFloat('0.00',qClienteProdVlrTotal.AsFloat * qClienteProdPercDesc.AsFloat / 100));
      mClienteProdVlrTotal.AsFloat    := mClienteProdVlrTotal.AsFloat + StrToFloat(FormatFloat('0.00',qClienteProdVlrTotal.AsFloat - vAux));
      mClienteProdVlrFatBruto.AsFloat := mClienteProdVlrTotal.AsFloat;
      mClienteProdPercFat.AsFloat     := StrToFloat(FormatFloat('0.00000',(mClienteProdVlrTotal.AsFloat / CurrencyEdit1.Value) * 100));
      mClienteProdQtd.AsFloat         := mClienteProdQtd.AsFloat + qClienteProdQtd.AsFloat;
      mClienteProd.Post;
      qClienteProd.Next;
    end;

  //Monta a quantidade pendente e a quantidade do pedido
  qPedidoCliProd.First;
  while not qPedidoCliProd.Eof do
    begin
      ProgressBar2.Position := ProgressBar2.Position + 1;
      //if (CheckBox3.Checked) and (qPedidoCliProdCodGrupo.AsInteger > 0) then
      //  vCodAgrupado := 'G' + qPedidoCliProdCodGrupo.AsString
      //else
        vCodAgrupado := 'C' + qPedidoCliProdCodCliente.AsString;
      if mClienteProd.Locate('CodAgrupado;CodProduto',VarArrayOf([vCodAgrupado,qPedidoCliProdCodProduto.AsInteger]),[locaseinsensitive]) then
        mClienteProd.Edit
      else
        begin
          mClienteProd.Insert;
          mClienteProdCodAgrupado.AsString := vCodAgrupado;
          mClienteProdCodCliente.AsInteger := qPedidoCliProdCodCliente.AsInteger;
          mClienteProdCodProduto.AsInteger := qPedidoCliProdCodProduto.AsInteger;
          mClienteProdReferencia.AsString  := qPedidoCliProdReferencia.AsString;
          mClienteProdNomeProduto.AsString := qPedidoCliProdNome.AsString;
          //mClienteProdCodGrupo.AsInteger   := qPedidoCliProdCodGrupo.AsInteger;
          {if copy(vCodAgrupado,1,1) = 'G' then
            begin
              mClienteProdNomeCliente.AsString := qPedidoCliProdlkNomeGrupo.AsString;
              mClienteProdFantasia.AsString    := qPedidoCliProdlkNomeGrupo.AsString;
            end
          else
            begin}
              mClienteProdNomeCliente.AsString := qPedidoCliProdNomeCliente.AsString;
              mClienteProdFantasia.AsString    := qPedidoCliProdFantasia.AsString;
            //end;
        end;
      mClienteProdQtdPedido.AsFloat    := mClienteProdQtdPedido.AsFloat + qPedidoCliProdQtdPares.AsFloat;
      mClienteProdQtdRestante.AsFloat  := mClienteProdQtdRestante.AsFloat + qPedidoCliProdQtdParesRest.AsFloat;
      mClienteProdQtdCancelada.AsFloat := mClienteProdQtdCancelada.AsFloat + qPedidoCliProdQtdParesCanc.AsFloat;
      mClienteProd.Post;
      qPedidoCliProd.Next;
    end;
  SMDBGrid1.DataSource := dsmClienteProd;
end;

procedure TfHistGeral.Monta_SQLFaturamento;
var
  vAux, vVlrFat, vVlrFatC200, vVlrFatTotal : Real;
  ano, mes, dia : Word;
  vDataAux : String;
begin
  mFatMensal.EmptyDataSet;

  qFaturamento.Close;
  qFaturamento.SQL.Clear;
  qFaturamento.SQL.Add('SELECT SUM( Dbnotafiscalitens.VlrTotal ) VlrTotal, dbNotaFiscal.PercDesc, dbNotaFiscal.DtEmissao, dbNotaFiscal.Situacao');
  qFaturamento.SQL.Add('FROM "dbNotaFiscal.DB" Dbnotafiscal');
  qFaturamento.SQL.Add('   INNER JOIN "dbNotaFiscalItens.DB" Dbnotafiscalitens');
  //qFaturamento.SQL.Add('   ON  (Dbnotafiscal.Filial = Dbnotafiscalitens.Filial)');
  qFaturamento.SQL.Add('   ON  (Dbnotafiscal.NumNota = Dbnotafiscalitens.NumNota)');
  qFaturamento.SQL.Add('WHERE  (Dbnotafiscalitens.GeraDuplicata = TRUE) ');
  qFaturamento.SQL.Add('  AND  ((Dbnotafiscal.Cancelada = False) or (Dbnotafiscal.Cancelada is Null)) ');
  qFaturamento.SQL.Add('  AND  ((Dbnotafiscal.CondPgto = ''V'') or (Dbnotafiscal.CondPgto = ''P'')) ');
  if not CheckBox4.Checked then
    //qFaturamento.SQL.Add('  AND  (DbNotafiscalItens.Material = False)');
    qFaturamento.SQL.Add('  AND  (DbNotafiscal.TipoNota = ''1'')');
  {if RxDBLookupCombo2.Text <> '' then
    begin
      qFaturamento.SQL.Add('  AND (dbNotaFiscal.Filial = :Filial)');
      qFaturamento.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
    end;}
  if DateEdit1.Date > 0 then
    begin
      qFaturamento.SQL.Add('  AND (dbNotaFiscal.DtEmissao >= :DtEmissaoIni)');
      qFaturamento.ParamByName('DtEmissaoIni').AsDate := DateEdit1.Date;
    end;
  if DateEdit2.Date > 0 then
    begin
      qFaturamento.SQL.Add('  AND (dbNotaFiscal.DtEmissao <= :DtEmissaoFin)');
      qFaturamento.ParamByName('DtEmissaoFin').AsDate := DateEdit2.Date;
    end;
  qFaturamento.SQL.Add('GROUP BY dbNotaFiscal.PercDesc, dbNotaFiscal.DtEmissao, dbNotaFiscal.Situacao');
  qFaturamento.Open;
  DM1.tParametros.First;
  vVlrFat      := 0;
  vVlrFatC200  := 0;
  vVlrFatTotal := 0;
  qFaturamento.First;
  while not qFaturamento.Eof do
    begin
      vAux := 0;
      if qFaturamentoPercDesc.AsFloat > 0 then
        vAux := StrToFloat(FormatFloat('0.00',(qFaturamentoVlrTotal.AsFloat * qFaturamentoPercDesc.AsFloat) / 100));
      vVlrFat := vVlrFat + StrToFloat(FormatFloat('0.00',qFaturamentoVlrTotal.AsFloat - vAux));

      DecodeDate(qFaturamentoDtEmissao.AsDateTime,ano,mes,dia);
      vDataAux := FormatFloat('00',mes) + '/' + FormatFloat('0000',ano);
      if mFatMensal.Locate('Data',vDataAux,[loCaseInsensitive]) then
        mFatMensal.Edit
      else
        begin
          mFatMensal.Insert;
          mFatMensalData.AsString := vDataAux;
        end;
      mFatMensalVlrFaturamento.AsFloat := mFatMensalVlrFaturamento.AsFloat + StrToFloat(FormatFloat('0.00',qFaturamentoVlrTotal.AsFloat - vAux));
      mFatMensal.Post;
      qFaturamento.Next;
    end;
  CurrencyEdit1.Value := vVlrFat;

end;

procedure TfHistGeral.Monta_SQLCli;
var
  vAux : Real;
begin
  qCliente.Close;
  qCliente.SQL.Clear;
  //qCliente.SQL.Add('SELECT Dbnotafiscal.CodCli, Dbcliente.Nome, Dbcliente.Fantasia, SUM( Dbnotafiscalitens.VlrTotal ) VlrTotal, SUM( Dbnotafiscalitens.Qtd ) Qtd, dbNotaFiscal.PercDesc, dbCliente.CodGrupo');
  qCliente.SQL.Add('SELECT Dbnotafiscal.CodCli, Dbcliente.Nome, Dbcliente.Fantasia, SUM( Dbnotafiscalitens.VlrTotal ) VlrTotal, SUM( Dbnotafiscalitens.Qtd ) Qtd, dbNotaFiscal.PercDesc');
  qCliente.SQL.Add('FROM "dbNotaFiscal.DB" Dbnotafiscal');
  qCliente.SQL.Add('   INNER JOIN "dbNotaFiscalItens.DB" Dbnotafiscalitens');
  //qCliente.SQL.Add('   ON  (Dbnotafiscal.Filial = Dbnotafiscalitens.Filial)');
  qCliente.SQL.Add('   ON  (Dbnotafiscal.NumNota = Dbnotafiscalitens.NumNota)');
  qCliente.SQL.Add('   INNER JOIN "dbCliente.DB" Dbcliente');
  qCliente.SQL.Add('   ON  (Dbnotafiscal.CodCli = Dbcliente.Codigo)');
  qCliente.SQL.Add('WHERE  (Dbnotafiscalitens.GeraDuplicata = TRUE) ');
  qCliente.SQL.Add('  AND  ((Dbnotafiscal.Cancelada = False) or (Dbnotafiscal.Cancelada is Null)) ');
  qCliente.SQL.Add('  AND ((Dbnotafiscal.CondPgto = ''V'') or (Dbnotafiscal.CondPgto = ''P'')) ');
  if not CheckBox4.Checked then
    //qCliente.SQL.Add('  AND (DbnotafiscalItens.Material = False) ');
    qCliente.SQL.Add('  AND (Dbnotafiscal.TipoNota = ''1'') ');
  {if RxDBLookupCombo2.Text <> '' then
    begin
      qCliente.SQL.Add('  AND (dbNotaFiscal.Filial = :Filial)');
      qCliente.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
    end;}
  if RxDBLookupCombo1.Text <> '' then
    begin
      qCliente.SQL.Add('  AND (dbNotaFiscal.CodCli = :CodCli)');
      qCliente.ParamByName('CodCli').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if RxDBLookupCombo4.Text <> '' then
    begin
      qCliente.SQL.Add('  AND (dbNotaFiscal.CodVendedor = :CodVendedor)');
      qCliente.ParamByName('CodVendedor').AsInteger  := RxDBLookupCombo4.KeyValue;
    end;
  if DateEdit1.Date > 0 then
    begin
      qCliente.SQL.Add('  AND (dbNotaFiscal.DtEmissao >= :DtEmissaoIni)');
      qCliente.ParamByName('DtEmissaoIni').AsDate := DateEdit1.Date;
    end;
  if DateEdit2.Date > 0 then
    begin
      qCliente.SQL.Add('  AND (dbNotaFiscal.DtEmissao <= :DtEmissaoFin)');
      qCliente.ParamByName('DtEmissaoFin').AsDate := DateEdit2.Date;
    end;
  if RxDBLookupCombo3.Text <> '' then
    begin
      qCliente.SQL.Add('  AND (dbNotaFiscalItens.CodProduto = :CodProduto)');
      qCliente.ParamByName('CodProduto').AsInteger := RxDBLookupCombo3.KeyValue;
    end;
  //qCliente.SQL.Add('GROUP BY Dbnotafiscal.CodCli, Dbcliente.Nome, Dbcliente.Fantasia, dbNotaFiscal.PercDesc, dbCliente.CodGrupo');
  qCliente.SQL.Add('GROUP BY Dbnotafiscal.CodCli, Dbcliente.Nome, Dbcliente.Fantasia, dbNotaFiscal.PercDesc');
  qCliente.SQL.Add('ORDER BY VlrTotal DESC, dbCliente.Fantasia');
  qCliente.Open;

  //Monta o auxiliar lendo a sql do faturamento
  SMDBGrid3.DataSource := nil;
  mCliente.EmptyDataSet;
  ProgressBar3.Max      := qCliente.RecordCount;
  ProgressBar3.Position := 0;
  qCliente.First;
  while not qCliente.Eof do
    begin
      ProgressBar3.Position := ProgressBar3.Position + 1;
      //if (CheckBox3.Checked) and (qClienteCodGrupo.AsInteger > 0) then
      //  vCodAgrupado := 'G' + qClienteCodGrupo.AsString
      //else
        vCodAgrupado := 'C' + qClienteCodCli.AsString;
      if mCliente.Locate('CodAgrupado',vCodAgrupado,[loCaseInsensitive]) then
        mCliente.Edit
      else
        begin
          mCliente.Insert;
          mClienteCodCliente.AsInteger := qClienteCodCli.AsInteger;
          mClienteNomeCliente.AsString := qClienteNome.AsString;
          mClienteFantasia.AsString    := qClienteFantasia.AsString;
          {if copy(vCodAgrupado,1,1) = 'G' then
            begin
              mClienteFantasia.AsString    := qClientelkNomeGrupo.AsString;
              mClienteNomeCliente.AsString := qClientelkNomeGrupo.AsString;
            end;}
          mClienteCodAgrupado.AsString := vCodAgrupado;
        end;
      vAux := 0;
      if qClientePercDesc.AsFloat > 0 then
        vAux := StrToFloat(FormatFloat('0.00',qClienteVlrTotal.AsFloat * qClientePercDesc.AsFloat / 100));
      mClienteVlrTotal.AsFloat    := mClienteVlrTotal.AsFloat + StrToFloat(FormatFloat('0.00',qClienteVlrTotal.AsFloat - vAux));
      mClientePercFat.AsFloat     := StrToFloat(FormatFloat('0.00000',(mClienteVlrTotal.AsFloat / CurrencyEdit1.Value) * 100));
      mClienteQtd.AsFloat         := mClienteQtd.AsFloat + qClienteQtd.AsFloat;
      mClienteVlrFatBruto.AsFloat := mClienteVlrFatBruto.AsFloat + StrToFloat(FormatFloat('0.00',qClienteVlrTotal.AsFloat - vAux));
      mCliente.Post;
      qCliente.Next;
    end;

  SMDBGrid3.DataSource := dsmCliente;
end;

procedure TfHistGeral.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM1.tCliente.Close;
  DM1.tVendedor.Close;
  DM1.tProduto.Close;
  DM1.tCor.Close;
  DM1.tFornecedores.Close;
  qCliente.Close;
  qFaturamento.Close;
  qClienteProd.Close;
  qClienteMes.Close;
  qProduto.Close;
  qNotas.Close;
  qVendedor.Close;
  qPedidoCliMes.Close;
  qProdutoMes.Close;
  qPedidoProdMes.Close;
  qPedidoProd.Close;
  qPedidoCliProd.Close;
  qPedidoCliProdMes.Close;
  Action := Cafree;
end;

procedure TfHistGeral.BitBtn1Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  if not qFaturamento.Active then
    Monta_SQLFaturamento;
  Monta_SQLCli;
  Screen.Cursor   := crDefault;
end;

procedure TfHistGeral.BitBtn5Click(Sender: TObject);
begin
  mCliente.First;
  fRelHistGeralCli := TfRelHistGeralCli.Create(Self);
  fRelHistGeralCli.RLReport1.Preview;
  fRelHistGeralCli.RLReport1.Free;
end;

procedure TfHistGeral.RxDBLookupCombo3Exit(Sender: TObject);
begin
  Label4.Caption := '';
  if RxDBLookupCombo3.Text <> '' then
    if DM1.tProduto.Locate('Codigo',RxDBLookupCombo3.KeyValue,[loCaseInsensitive]) then
      Label4.Caption := DM1.tProdutoNome.AsString;
end;

procedure TfHistGeral.BitBtn2Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  if not qFaturamento.Active then
    Monta_SQLFaturamento;
  Monta_SQLPedidoCliProd;
  Monta_SQLCliProd;
  Screen.Cursor   := crDefault;
end;

procedure TfHistGeral.BitBtn3Click(Sender: TObject);
begin
  mClienteProd.First;
  fRelHistGeralCliProd := TfRelHistGeralCliProd.Create(Self);
  fRelHistGeralCliProd.RLReport1.Preview;
  fRelHistGeralCliProd.RLReport1.Free;
end;

procedure TfHistGeral.BitBtn4Click(Sender: TObject);
begin
  if (DateEdit1.Date > 0) and (DateEdit2.Date > 0) then
    begin
      Screen.Cursor := crHourGlass;
      Ajusta_Datas;
      Monta_Datas(2);
      if vContadorMes > 12 then
        ShowMessage('Não pode ter mais de 12 meses!')
      else
        begin
          if not qFaturamento.Active then
            Monta_SQLFaturamento;
          Monta_SQLPedidoCliMes;
          Monta_SQLCliMes;
        end;
      Screen.Cursor   := crDefault;
    end
  else
    ShowMessage('Esta consulta exige data inicial e final!');
end;

procedure TfHistGeral.mClienteMesNewRecord(DataSet: TDataSet);
var
  i : Integer;
begin
  for i := 1 to 13 do
    begin
      mClienteMes.FieldByName('VlrFaturamento'+IntToStr(i)).AsFloat := 0;
      mClienteMes.FieldByName('Qtd'+IntToStr(i)).AsFloat            := 0;
      mClienteMes.FieldByName('Perc'+IntToStr(i)).AsFloat           := 0;
      mClienteMes.FieldByName('QtdPedido'+IntToStr(i)).AsFloat      := 0;
      mClienteMes.FieldByName('QtdRestante'+IntToStr(i)).AsFloat    := 0;
      mClienteMes.FieldByName('QtdCancelada'+IntToStr(i)).AsFloat   := 0;
    end;
  mClienteMesVlrTotal.AsFloat := 0;
end;

procedure TfHistGeral.mDatasNewRecord(DataSet: TDataSet);
begin
  mDatasIndice.AsInteger := 0;
end;

procedure TfHistGeral.FormShow(Sender: TObject);
begin
  DM1.tCliente.Open;
  DM1.tVendedor.Open;
  DM1.tProduto.Open;
  DM1.tCor.Open;
  DM1.tFornecedores.Open;
  DM1.tParametros.Open;
end;

procedure TfHistGeral.BitBtn6Click(Sender: TObject);
begin
  SMDBGrid2.DisableScroll;
  vComProduto := False;
  mProdutoMes.EmptyDataSet;
  mClienteMes.First;
  fRelHistGeralCliMes := TfRelHistGeralCliMes.Create(Self);
  fRelHistGeralCliMes.RLReport1.Preview;
  fRelHistGeralCliMes.RLReport1.Free;
  SMDBGrid2.EnableScroll;
  fHistGeral.mClienteMes.Filtered := False;
end;

procedure TfHistGeral.mClienteNewRecord(DataSet: TDataSet);
begin
  mClienteVlrTotal.AsFloat      := 0;
  mClienteQtd.AsFloat           := 0;
  mClientePercFat.AsFloat       := 0;
  mClienteVlrDevolucao.AsFloat  := 0;
  mClienteVlrFatBruto.AsFloat   := 0;
end;

procedure TfHistGeral.mClienteProdNewRecord(DataSet: TDataSet);
begin
  mClienteProdVlrTotal.AsFloat     := 0;
  mClienteProdQtd.AsFloat          := 0;
  mClienteProdPercFat.AsFloat      := 0;
  mClienteProdQtdCancelada.AsFloat := 0;
  mClienteProdQtdPedido.AsFloat    := 0;
  mClienteProdQtdRestante.AsFloat  := 0;
  mClienteProdVlrDevolucao.AsFloat := 0;
  mClienteProdVlrFatBruto.AsFloat  := 0;
end;

procedure TfHistGeral.mProdutoNewRecord(DataSet: TDataSet);
begin
  mProdutoVlrTotal.AsFloat     := 0;
  mProdutoQtd.AsFloat          := 0;
  mProdutoPercFat.AsFloat      := 0;
  mProdutoQtdPedido.AsFloat    := 0;
  mProdutoQtdRestante.AsFloat  := 0;
  mProdutoQtdCancelada.AsFloat := 0;
end;

procedure TfHistGeral.BitBtn7Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  if not qFaturamento.Active then
    Monta_SQLFaturamento;
  Monta_SQLPedidoProd;
  Monta_SQLProd;
  Screen.Cursor   := crDefault;
end;

procedure TfHistGeral.BitBtn8Click(Sender: TObject);
begin
  mProduto.First;
  fRelHistGeralProd := TfRelHistGeralProd.Create(Self);
  fRelHistGeralProd.RLReport1.Preview;
  fRelHistGeralProd.RLReport1.Free;
end;

procedure TfHistGeral.mClienteProdCorNewRecord(DataSet: TDataSet);
begin
  mClienteProdCorVlrTotal.AsFloat := 0;
  mClienteProdCorQtd.AsFloat      := 0;
  mClienteProdCorPercFat.AsFloat  := 0;
end;

procedure TfHistGeral.BitBtn9Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  if not qFaturamento.Active then
    Monta_SQLFaturamento;
  Monta_SQLCliProdCor;
  Screen.Cursor   := crDefault;
end;

procedure TfHistGeral.BitBtn10Click(Sender: TObject);
begin
  mClienteProdCor.First;
  fRelHistGeralCliProdCor := TfRelHistGeralCliProdCor.Create(Self);
  fRelHistGeralCliProdCor.RLReport1.Preview;
  fRelHistGeralCliProdCor.RLReport1.Free;
end;

procedure TfHistGeral.BitBtn11Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  if not qFaturamento.Active then
    Monta_SQLFaturamento;
  Monta_SQLVend;
  Screen.Cursor   := crDefault;
end;

procedure TfHistGeral.BitBtn12Click(Sender: TObject);
begin
  mVendedor.First;
  fRelHistGeralVend := TfRelHistGeralVend.Create(Self);
  fRelHistGeralVend.RLReport1.Preview;
  fRelHistGeralVend.RLReport1.Free;
end;

procedure TfHistGeral.BitBtn13Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Monta_SQLNotas;
  Screen.Cursor   := crDefault;
end;

procedure TfHistGeral.BitBtn15Click(Sender: TObject);
begin
  if (DateEdit1.Date > 0) and (DateEdit2.Date > 0) then
    begin
      Screen.Cursor := crHourGlass;
      Ajusta_Datas;
      Monta_Datas(8);
      if vContadorMes > 12 then
        ShowMessage('Não pode ter mais de 12 meses!')
      else
        begin
          if not qFaturamento.Active then
            Monta_SQLFaturamento;
          Monta_SQLPedidoProdMes;
          Monta_SQLProdMes;
        end;
      Screen.Cursor   := crDefault;
    end
  else
    ShowMessage('Esta consulta exige data inicial e final!');
end;

procedure TfHistGeral.BitBtn16Click(Sender: TObject);
begin
  SMDBGrid8.DisableScroll;
  mProdutoMes.First;
  fRelHistGeralProdMes := TfRelHistGeralProdMes.Create(Self);
  fRelHistGeralProdMes.RLReport1.Preview;
  fRelHistGeralProdMes.RLReport1.Free;
  SMDBGrid8.EnableScroll;
end;

procedure TfHistGeral.mProdutoMesNewRecord(DataSet: TDataSet);
var
  i : Integer;
begin
  for i := 1 to 13 do
    begin
      mProdutoMes.FieldByName('VlrFaturamento'+IntToStr(i)).AsFloat := 0;
      mProdutoMes.FieldByName('Qtd'+IntToStr(i)).AsFloat            := 0;
      mProdutoMes.FieldByName('Perc'+IntToStr(i)).AsFloat           := 0;
      mProdutoMes.FieldByName('QtdPedido'+IntToStr(i)).AsFloat      := 0;
      mProdutoMes.FieldByName('QtdRestante'+IntToStr(i)).AsFloat    := 0;
      mProdutoMes.FieldByName('QtdCancelada'+IntToStr(i)).AsFloat   := 0;
    end;
  mProdutoMesVlrTotal.AsFloat      := 0;
  mProdutoMesCodCliente.AsInteger  := 0;
  mProdutoMesCodAgrupado.AsInteger := 0;
end;

procedure TfHistGeral.mFatMensalNewRecord(DataSet: TDataSet);
begin
  mFatMensalVlrFaturamento.AsFloat := 0;
  mFatMensalVlrC200.AsFloat        := 0;
  mFatMensalVlrFatTotal.AsFloat    := 0;
end;

procedure TfHistGeral.BitBtn18Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  if not qFaturamento.Active then
    Monta_SQLFaturamento;
  Monta_SQLPedidoCliProdMes;
  Monta_SQLCliProdMes;
  Screen.Cursor   := crDefault;
end;

procedure TfHistGeral.qClienteProdMesNewRecord(DataSet: TDataSet);
begin
  mClienteProdMesQtdCancelada.AsFloat   := 0;
  mClienteProdMesQtdFaturada.AsFloat    := 0;
  mClienteProdMesQtdPedido.AsFloat      := 0;
  mClienteProdMesQtdRestante.AsFloat    := 0;
  mClienteProdMesVlrFaturamento.AsFloat := 0;
  mClienteProdMesPerc.AsFloat           := 0;
end;

procedure TfHistGeral.BitBtn17Click(Sender: TObject);
begin
  SMDBGrid9.DisableScroll;
  mClienteProdMes.First;
  fRelHistGeralCliProdMes := TfRelHistGeralCliProdMes.Create(Self);
  fRelHistGeralCliProdMes.vCodCliente := mClienteProdMesCodCliente.AsInteger;
  fRelHistGeralCliProdMes.vCodProduto := mClienteProdMesCodProduto.AsInteger;
  fRelHistGeralCliProdMes.vAno        := mClienteProdMesAno.AsInteger;
  fRelHistGeralCliProdMes.vMes        := mClienteProdMesMes.AsInteger;
  fRelHistGeralCliProdMes.vTotalFatCli  := 0;
  fRelHistGeralCliProdMes.vTotalFatData := 0;
  fRelHistGeralCliProdMes.vTotalGeral   := 0;
  fRelHistGeralCliProdMes.RLReport1.Preview;
  fRelHistGeralCliProdMes.RLReport1.Free;
  SMDBGrid9.EnableScroll;
end;

procedure TfHistGeral.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0 : mClienteProdMes.IndexFieldNames := 'NomeCliente;Referencia;Ano;Mes';
    1 : mClienteProdMes.IndexFieldNames := 'NomeCliente;Ano;Mes;Referencia';
    2 : mClienteProdMes.IndexFieldNames := 'Referencia;NomeCliente;Ano;Mes';
    3 : mClienteProdMes.IndexFieldNames := 'Referencia;Ano;Mes;NomeCliente';
    4 : mClienteProdMes.IndexFieldNames := 'Ano;Mes;Referencia;NomeCliente';
    5 : mClienteProdMes.IndexFieldNames := 'Ano;Mes;NomeCliente;Referencia';
  end;

end;

procedure TfHistGeral.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

procedure TfHistGeral.BitBtn21Click(Sender: TObject);
begin
  if mClienteMes.RecordCount > 0 then
    begin
      SMDBGrid2.DisableScroll;
      if not qFaturamento.Active then
        Monta_SQLFaturamento;
      vComProduto := True;
      Monta_SQLPedidoProdMesCli;
      Monta_SQLProdMesCli('C');
      mClienteMes.First;
      fRelHistGeralCliMes := TfRelHistGeralCliMes.Create(Self);
      fRelHistGeralCliMes.RLReport1.Preview;
      fRelHistGeralCliMes.RLReport1.Free;
      fHistGeral.mProdutoMes.Filtered := False;
      SMDBGrid2.EnableScroll;
    end
  else
    ShowMessage('Não foi gerada a consulta!');
end;

procedure TfHistGeral.CheckBox4Click(Sender: TObject);
begin
  qFaturamento.Close;
  CurrencyEdit1.Clear;
  Limpa_TabAuxiliar;
end;

procedure TfHistGeral.BitBtn19Click(Sender: TObject);
begin
  if (DateEdit1.Date > 0) and (DateEdit2.Date > 0) then
    begin
      Screen.Cursor := crHourGlass;
      Ajusta_Datas;
      Monta_Datas(10);
      if vContadorMes > 12 then
        ShowMessage('Não pode ter mais de 12 meses!')
      else
        begin
          if not qFaturamento.Active then
            Monta_SQLFaturamento;
          Monta_SQLProdMesCli('R');
        end;
      Screen.Cursor   := crDefault;
    end
  else
    ShowMessage('Esta consulta exige data inicial e final!');
end;

procedure TfHistGeral.BitBtn20Click(Sender: TObject);
begin
  SMDBGrid10.DisableScroll;
  mClienteProdMesRes.First;
  fRelHistGeralCliProdMesRes := TfRelHistGeralCliProdMesRes.Create(Self);
  fRelHistGeralCliProdMesRes.RLReport1.Preview;
  fRelHistGeralCliProdMesRes.RLReport1.Free;
  SMDBGrid10.EnableScroll;
end;

procedure TfHistGeral.SMDBGrid10GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if mClienteProdMesResCodAgrupado.AsString = 'ZZZZZ' then
    begin
      Background  := clAqua;
      AFont.Color := clBlack;
    end;
end;

procedure TfHistGeral.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 87) then
    begin
      CheckBox3.Visible    := not(CheckBox3.Visible);
      RxLabel1.Visible     := not(RxLabel1.Visible);
      RxLabel2.Visible     := not(RxLabel2.Visible);
      CurrencyC200.Visible := not(CurrencyC200.Visible);
      CurrencyFat.Visible  := not(CurrencyFat.Visible);
    end;
end;

end.

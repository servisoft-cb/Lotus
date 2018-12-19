unit UEmissaoNotaFiscal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, Buttons, DBCtrls, StdCtrls, Mask, Grids,
  DBGrids, ComCtrls, RXCtrls, RXLookup, DbTables, Db, RxCalc, ToolEdit, CurrEdit, MemTable, DBFilter, Math, RXDBCtrl, Variants,
  RzCmboBx, RzDBCmbo, RzEdit, RxDBComb, Menus, RzButton, SMDBGrid, dbXPress, SqlExpr, RzDBEdit;

type
  TfEmissaoNotaFiscal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBRadioGroup1: TDBRadioGroup;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    SpeedButton2: TSpeedButton;
    Bevel1: TBevel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    RxCalculator1: TRxCalculator;
    Label40: TLabel;
    DBEdit4: TDBEdit;
    Label41: TLabel;
    DBEdit5: TDBEdit;
    RxDBFilter2: TRxDBFilter;
    tNotaFiscalIns: TTable;
    dsNotaFiscalIns: TDataSource;
    tNotaFiscalInsNumNota: TIntegerField;
    tNotaFiscalItensIns: TTable;
    dsNotaFiscalItensIns: TDataSource;
    tNotaFiscalItensInsNumNota: TIntegerField;
    tNotaFiscalItensInsItem: TSmallintField;
    tNotaFiscalItensInsCodProduto: TIntegerField;
    tNotaFiscalItensInsQtd: TFloatField;
    tNotaFiscalItensInsIcms: TFloatField;
    tNotaFiscalItensInsIpi: TFloatField;
    tNotaFiscalItensInsSitTrib: TSmallintField;
    tNotaFiscalItensInsVlrUnit: TFloatField;
    tNotaFiscalItensInsVlrTotal: TFloatField;
    tNotaFiscalItensInsDesconto: TFloatField;
    tNotaFiscalItensInsVlrDesconto: TFloatField;
    tNotaFiscalItensInsBaseIcms: TFloatField;
    tNotaFiscalItensInsVlrIcms: TFloatField;
    tNotaFiscalItensInsVlrIpi: TFloatField;
    tNotaFiscalItensInsNatOper: TSmallintField;
    tNotaFiscalItensInsIcmsIpi: TBooleanField;
    tNotaFiscalParcIns: TTable;
    dsNotaFiscalParcIns: TDataSource;
    tNotaFiscalParcInsParcela: TSmallintField;
    tNotaFiscalParcInsDtVenc: TDateField;
    tNotaFiscalParcInsVlrVenc: TFloatField;
    tNotaFiscalItensInsCodCor: TIntegerField;
    tNotaFiscalItensInsNumPedido: TIntegerField;
    tNotaFiscalItensInsItemPedido: TIntegerField;
    tNotaFiscalItensInsClasFiscal: TStringField;
    tNotaFiscalItensInsDescricao: TStringField;
    tNotaFiscalItensInsUnidade: TStringField;
    Query1: TQuery;
    dsQuery1: TDataSource;
    tNotaFiscalDev: TTable;
    dsNotaFiscalDev: TDataSource;
    tNotaFiscalItensDev: TTable;
    DataSource1: TDataSource;
    tNotaFiscalItensDevNumNota: TIntegerField;
    tNotaFiscalItensDevItem: TSmallintField;
    tNotaFiscalItensDevCodProduto: TIntegerField;
    tNotaFiscalItensDevCodCor: TIntegerField;
    tNotaFiscalItensDevClasFiscal: TStringField;
    tNotaFiscalItensDevUnidade: TStringField;
    tNotaFiscalItensDevQtd: TFloatField;
    tNotaFiscalItensDevIcms: TFloatField;
    tNotaFiscalItensDevIpi: TFloatField;
    tNotaFiscalItensDevSitTrib: TSmallintField;
    tNotaFiscalItensDevVlrUnit: TFloatField;
    tNotaFiscalItensDevVlrTotal: TFloatField;
    tNotaFiscalItensDevDesconto: TFloatField;
    tNotaFiscalItensDevVlrDesconto: TFloatField;
    tNotaFiscalItensDevBaseIcms: TFloatField;
    tNotaFiscalItensDevVlrIcms: TFloatField;
    tNotaFiscalItensDevVlrIpi: TFloatField;
    tNotaFiscalItensDevNatOper: TSmallintField;
    tNotaFiscalItensDevIcmsIpi: TBooleanField;
    tNotaFiscalItensDevNumPedido: TIntegerField;
    tNotaFiscalItensDevItemPedido: TIntegerField;
    tNotaFiscalItensDevDescricao: TStringField;
    tNotaFiscalDevNumNota: TIntegerField;
    tNotaFiscalDevDtEmissao: TDateField;
    tNotaFiscalDevCodNatOper: TSmallintField;
    tNotaFiscalDevCodNatOper2: TSmallintField;
    tNotaFiscalDevCodNatOper3: TSmallintField;
    tNotaFiscalDevCodCli: TIntegerField;
    tNotaFiscalDevCondPgto: TStringField;
    tNotaFiscalDevCodVendedor: TIntegerField;
    tNotaFiscalDevCodVenda: TSmallintField;
    tNotaFiscalDevBaseIcms: TFloatField;
    tNotaFiscalDevVlrIcms: TFloatField;
    tNotaFiscalDevVlrIpi: TFloatField;
    tNotaFiscalDevVlrTotalNota: TFloatField;
    tNotaFiscalDevVlrTotalItens: TFloatField;
    tNotaFiscalDevPercDesc: TFloatField;
    tNotaFiscalDevVlrTotalDesc: TFloatField;
    tNotaFiscalDevVlrFrete: TFloatField;
    tNotaFiscalDevVlrSeguro: TFloatField;
    tNotaFiscalDevOutrasDesp: TFloatField;
    tNotaFiscalDevQtd: TIntegerField;
    tNotaFiscalDevEspecie: TStringField;
    tNotaFiscalDevMarca: TStringField;
    tNotaFiscalDevNumero: TStringField;
    tNotaFiscalDevPesoBruto: TFloatField;
    tNotaFiscalDevPesoLiquido: TFloatField;
    tNotaFiscalDevPlaca: TStringField;
    tNotaFiscalDevUFPlaca: TStringField;
    tNotaFiscalDevEmitDest: TStringField;
    tNotaFiscalDevCodTransp: TIntegerField;
    tNotaFiscalDevObs: TMemoField;
    tNotaFiscalDevSaidaEntrada: TStringField;
    tNotaFiscalDevDuplImp: TBooleanField;
    tNotaFiscalDevCancelada: TBooleanField;
    tNotaFiscalDevDtSaidaEnt: TDateField;
    tNotaFiscalDevHoraSaida: TTimeField;
    tNotaFiscalDevTipoCobr: TStringField;
    tNotaFiscalDevBcoCobr: TIntegerField;
    tNotaFiscalDevImpressa: TBooleanField;
    tNotaFiscalDevLocalEntrega: TBooleanField;
    tNotaFiscalDevInss: TBooleanField;
    tNotaFiscalDevIrf: TBooleanField;
    tNotaFiscalDevVlrInss: TFloatField;
    tNotaFiscalDevVlrIrf: TFloatField;
    tNotaFiscalDevCustoPerc: TFloatField;
    tNotaFiscalDevCustoFinanc: TFloatField;
    tNotaFiscalDevPrazoPgto: TIntegerField;
    tNotaFiscalDevEntrada: TFloatField;
    tNotaFiscalDevPercComissao: TFloatField;
    tNotaFiscalDevDtEntr: TDateField;
    tNotaFiscalDevIcmsIpi: TBooleanField;
    tNotaFiscalDevPlanoContas: TIntegerField;
    tNotaFiscalDevSituacao: TIntegerField;
    tNotaFiscalDevDescDupl: TFloatField;
    tNotaFiscalDevNumNotaOrigem: TIntegerField;
    tNotaFiscalDevNumNotaDevol: TIntegerField;
    Label26: TLabel;
    DBEdit11: TDBEdit;
    Bevel4: TBevel;
    tExtComissaoIns: TTable;
    tExtComissaoInsNroLancamento: TIntegerField;
    tExtComissaoInsCodVendedor: TIntegerField;
    tExtComissaoInsDtReferencia: TDateField;
    tExtComissaoInsNroDoc: TIntegerField;
    tExtComissaoInsParcDoc: TIntegerField;
    tExtComissaoInsCodCliente: TIntegerField;
    tExtComissaoInsFuncao: TStringField;
    tExtComissaoInsVlrBase: TFloatField;
    tExtComissaoInsPercDescDupl: TFloatField;
    tExtComissaoInsPercComissao: TFloatField;
    tExtComissaoInsVlrComissao: TFloatField;
    tExtComissaoInsTipo: TStringField;
    tExtComissaoInsSuspensa: TBooleanField;
    tNotaFiscalDevNroLancExtComissao: TIntegerField;
    BitBtn7: TBitBtn;
    tPedidoItem: TTable;
    dsPedidoItem: TDataSource;
    tPedidoItemPedido: TIntegerField;
    tPedidoItemItem: TIntegerField;
    tPedidoItemCodProduto: TIntegerField;
    tPedidoItemCodCor: TIntegerField;
    tPedidoItemCodGrade: TIntegerField;
    tPedidoItemQtdPares: TFloatField;
    tPedidoItemQtdParesFat: TFloatField;
    tPedidoItemQtdParesRest: TFloatField;
    tPedidoItemPreco: TFloatField;
    tPedidoItemVlrTotal: TFloatField;
    tPedidoItemCodCabedal1: TIntegerField;
    tPedidoItemCodCabedal2: TIntegerField;
    tPedidoItemCodCorForro: TIntegerField;
    tPedidoItemCodCorSolado: TIntegerField;
    tPedidoItemCodCorPalmilha: TIntegerField;
    tPedidoItemCancelado: TBooleanField;
    tPedidoItemCopiado: TBooleanField;
    tPedidoItemSelecionado: TBooleanField;
    tPedidoItemQtdParesCanc: TFloatField;
    tPedidoItemCodForro: TIntegerField;
    tPedidoItemCodEtiqueta: TIntegerField;
    tPedidoItemVlrDesconto: TFloatField;
    tPedidoItemCodSolado: TIntegerField;
    tPedidoItemSitTrib: TSmallintField;
    Label53: TLabel;
    tExtComissaoModIns: TTable;
    tExtComissaoModInsNroLancamento: TIntegerField;
    tExtComissaoModInsCodModelista: TIntegerField;
    tExtComissaoModInsDtReferencia: TDateField;
    tExtComissaoModInsCodProduto: TIntegerField;
    tExtComissaoModInsFuncao: TStringField;
    tExtComissaoModInsVlrBase: TFloatField;
    tExtComissaoModInsPercComissao: TFloatField;
    tExtComissaoModInsVlrComissao: TFloatField;
    tExtComissaoModInsTipo: TStringField;
    tNotaFiscalItensInsComissaoMod: TFloatField;
    tNotaFiscalItensInsCodComissao: TIntegerField;
    DBCheckBox1: TDBCheckBox;
    tNotaFiscalItensInsReferencia: TStringField;
    tNotaFiscalItensDevReferencia: TStringField;
    tNotaFiscalItensDevComissaoMod: TFloatField;
    tNotaFiscalItensDevCodComissao: TIntegerField;
    tPedidoItemQtdFatAut: TFloatField;
    tPedidoItemQtdFatMan: TFloatField;
    tPedidoItemCodTaloneira: TIntegerField;
    tPedidoItemCodCorTaloneira: TIntegerField;
    tNotaFiscalDevObsAux: TMemoField;
    RxDBLookupCombo7: TRxDBLookupCombo;
    RxDBLookupCombo8: TRxDBLookupCombo;
    tAuxNotaFiscalGrade: TTable;
    dsAuxNotaFiscalGrade: TDataSource;
    tAuxNotaFiscalGradeCodGrade: TIntegerField;
    tAuxNotaFiscalGradePosicao: TIntegerField;
    tAuxNotaFiscalGradeQtd: TFloatField;
    tAuxNotaFiscalGradelkTamanho: TStringField;
    Panel6: TPanel;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    DBEdit35: TDBEdit;
    tAuxNotaFiscalGradelkLargura: TStringField;
    mModelista: TMemoryTable;
    mModelistaCodModelista: TIntegerField;
    mModelistaPercComissao: TFloatField;
    mModelistaVlrComissao: TFloatField;
    mModelistaVlrBase: TFloatField;
    tNotaFiscalItensDevNumSeq: TIntegerField;
    tNotaFiscalInsNumSeq: TIntegerField;
    tNotaFiscalItensInsNumSeq: TIntegerField;
    tNotaFiscalParcInsNumSeq: TIntegerField;
    tNotaFiscalDevNumSeq: TIntegerField;
    tAuxNotaFiscalGradeNumSeq: TIntegerField;
    Panel12: TPanel;
    RxLabel1: TRxLabel;
    DBEdit38: TDBEdit;
    RxLabel2: TRxLabel;
    DBEdit39: TDBEdit;
    Label69: TLabel;
    DBEdit42: TDBEdit;
    PageControl1: TPageControl;
    TabSheet5: TTabSheet;
    Panel10: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    TabSheet2: TTabSheet;
    Panel7: TPanel;
    Label29: TLabel;
    SpeedButton8: TSpeedButton;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label35: TLabel;
    Label33: TLabel;
    Label36: TLabel;
    Label34: TLabel;
    Label37: TLabel;
    DBEdit24: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBEdit28: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit30: TDBEdit;
    RxDBLookupCombo10: TRxDBLookupCombo;
    TabSheet3: TTabSheet;
    Panel8: TPanel;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    DBEdit10: TDBEdit;
    DBEdit37: TDBEdit;
    TabSheet4: TTabSheet;
    Panel9: TPanel;
    SpeedButton11: TSpeedButton;
    Label43: TLabel;
    SpeedButton16: TSpeedButton;
    Label38: TLabel;
    Label46: TLabel;
    Label68: TLabel;
    DBGrid2: TDBGrid;
    RxDBLookupCombo2: TRxDBLookupCombo;
    DBEdit7: TDBEdit;
    BitBtn8: TBitBtn;
    DBDateEdit1: TDBDateEdit;
    DBEdit36: TDBEdit;
    TabSheet1: TTabSheet;
    Label28: TLabel;
    Label42: TLabel;
    Label49: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    TabSheet7: TTabSheet;
    Produtos: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    Panel4: TPanel;
    Label39: TLabel;
    SpeedButton14: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton6: TSpeedButton;
    DBEdit40: TDBEdit;
    DBRadioGroup5: TDBRadioGroup;
    Label50: TLabel;
    SpeedButton19: TSpeedButton;
    RxDBLookupCombo3: TRxDBLookupCombo;
    DBRadioGroup6: TDBRadioGroup;
    Label5: TLabel;
    SpeedButton3: TSpeedButton;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    RxDBLookupCombo9: TRxDBLookupCombo;
    DBRadioGroup2: TDBRadioGroup;
    RxDBComboBox1: TRxDBComboBox;
    Label27: TLabel;
    RxDBComboBox2: TRxDBComboBox;
    Label60: TLabel;
    TabSheet8: TTabSheet;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label66: TLabel;
    DBEdit41: TDBEdit;
    DBEdit43: TDBEdit;
    DBEdit44: TDBEdit;
    DBEdit45: TDBEdit;
    DBEdit46: TDBEdit;
    Label71: TLabel;
    Label72: TLabel;
    DBEdit47: TDBEdit;
    Label73: TLabel;
    Label74: TLabel;
    DBEdit48: TDBEdit;
    DBEdit49: TDBEdit;
    pmProcessos: TPopupMenu;
    NFeDanfe1: TMenuItem;
    Cancelar1: TMenuItem;
    RxSpeedButton1: TRxSpeedButton;
    RxLabel8: TRxLabel;
    DBEdit50: TDBEdit;
    Panel11: TPanel;
    DBMemo3: TDBMemo;
    Panel3: TPanel;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    tNotaFiscalInsFilial: TIntegerField;
    tNotaFiscalInsSerie: TStringField;
    tNotaFiscalDevSerie: TStringField;
    tNotaFiscalDevFilial: TIntegerField;
    tNotaFiscalItensInsFilial: TIntegerField;
    tNotaFiscalItensDevFilial: TIntegerField;
    tExtComissaoModInsNumNota: TIntegerField;
    tExtComissaoModInsCodCliente: TIntegerField;
    tExtComissaoModInsParcela: TIntegerField;
    tExtComissaoModInsItemHistCReceber: TIntegerField;
    tNotaFiscalParcInsFilial: TIntegerField;
    Label78: TLabel;
    DBEdit51: TDBEdit;
    RxDBFilter1: TRxDBFilter;
    BitBtn5: TBitBtn;
    Panel5: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    SpeedButton7: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Label55: TLabel;
    SpeedButton23: TSpeedButton;
    Label67: TLabel;
    Label7: TLabel;
    Label70: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    BitBtn6: TBitBtn;
    RxDBLookupCombo4: TRxDBLookupCombo;
    CurrencyEdit1: TCurrencyEdit;
    RxDBLookupCombo13: TRxDBLookupCombo;
    RxDBLookupCombo15: TRxDBLookupCombo;
    RxDBLookupCombo14: TRxDBLookupCombo;
    RxDBLookupCombo1: TRxDBLookupCombo;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    qMatRef: TQuery;
    qsMatRef: TDataSource;
    Panel14: TPanel;
    Label8: TLabel;
    Label25: TLabel;
    Edit1: TEdit;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    Label79: TLabel;
    RzDBLookupComboBox2: TRzDBLookupComboBox;
    Query1Codigo: TIntegerField;
    Query1Nome: TStringField;
    BitBtn11: TBitBtn;
    BitBtn13: TBitBtn;
    qVerificaCReceber: TQuery;
    qVerificaCReceberVlrParcCReceber: TFloatField;
    DBMemo2: TDBMemo;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    RxSpeedButton2: TRxSpeedButton;
    pmImprimir: TPopupMenu;
    Rtulos1: TMenuItem;
    qTotalItem: TQuery;
    qTotalItemVlrTotal: TFloatField;
    qTotalItemQtdItens: TIntegerField;
    qTotalItemGeraDupl: TBooleanField;
    Label44: TLabel;
    RxDBLookupCombo6: TRxDBLookupCombo;
    RzButton5: TRzButton;
    RxDBComboBox6: TRxDBComboBox;
    Label57: TLabel;
    Label45: TLabel;
    DBEdit31: TDBEdit;
    Label58: TLabel;
    RxDBComboBox7: TRxDBComboBox;
    Label56: TLabel;
    DBEdit3: TDBEdit;
    Label59: TLabel;
    RzButton2: TRzButton;
    RzButton3: TRzButton;
    DBMemo1: TDBMemo;
    StaticText3: TStaticText;
    BitBtn3: TBitBtn;
    DBMemo4: TDBMemo;
    BitBtn20: TBitBtn;
    RzButton1: TRzButton;
    RzButton4: TRzButton;
    Panel13: TPanel;
    Label54: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    DBEdit23: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label65: TLabel;
    RxDBComboBox4: TRxDBComboBox;
    Label75: TLabel;
    DBText3: TDBText;
    Label80: TLabel;
    DBText4: TDBText;
    BitBtn9: TBitBtn;
    lbContingencia: TLabel;
    TabSheet6: TTabSheet;
    Panel15: TPanel;
    Label81: TLabel;
    Label82: TLabel;
    RxDBLookupCombo5: TRxDBLookupCombo;
    DBEdit6: TDBEdit;
    TabSheet9: TTabSheet;
    Label83: TLabel;
    BitBtn10: TBitBtn;
    BitBtn12: TBitBtn;
    SMDBGrid1: TSMDBGrid;
    RxDBComboBox5: TRxDBComboBox;
    tNotaFiscalInsDtEmissao: TDateField;
    Label84: TLabel;
    DBEdit32: TDBEdit;
    CartadeCorreo1: TMenuItem;
    Label85: TLabel;
    DBEdit33: TDBEdit;
    Label86: TLabel;
    BitBtn14: TBitBtn;
    ckTelaConfirmacao: TCheckBox;
    Label87: TLabel;
    TabSheet10: TTabSheet;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    qAux: TQuery;
    Label88: TLabel;
    DBEdit34: TDBEdit;
    Label96: TLabel;
    DBEdit52: TDBEdit;
    Label97: TLabel;
    Label98: TLabel;
    DBEdit53: TDBEdit;
    DBEdit54: TDBEdit;
    Label99: TLabel;
    RxDBComboBox9: TRxDBComboBox;
    Label100: TLabel;
    DBEdit55: TDBEdit;
    Label101: TLabel;
    DBEdit56: TDBEdit;
    Label102: TLabel;
    rxdbEnq_IPI: TRxDBLookupCombo;
    Label103: TLabel;
    RzDBDateTimeEdit1: TRzDBDateTimeEdit;
    Label104: TLabel;
    DBDateEdit2: TDBDateEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    DBEdit1: TDBEdit;
    DBEdit57: TDBEdit;
    DBEdit58: TDBEdit;
    btnExpDrawBack: TRzButton;
    Label107: TLabel;
    RxDBLookupCombo11: TRxDBLookupCombo;
    SpeedButton10: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Edit7Exit(Sender: TObject);
    procedure Edit9Exit(Sender: TObject);
    procedure Edit10Exit(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure RadioButton1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn8Click(Sender: TObject);
    procedure RxDBLookupCombo2DropDown(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure DBRadioGroup1Change(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton19Click(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure DBRadioGroup1Click(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure PageControl1Enter(Sender: TObject);
    procedure TabSheet1Enter(Sender: TObject);
    procedure RxDBLookupCombo7Exit(Sender: TObject);
    procedure RxDBLookupCombo7DropDown(Sender: TObject);
    procedure RxDBLookupCombo8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo8Exit(Sender: TObject);
    procedure RxDBLookupCombo8Enter(Sender: TObject);
    procedure RxDBLookupCombo9Enter(Sender: TObject);
    procedure tAuxNotaFiscalGradeBeforeInsert(DataSet: TDataSet);
    procedure DBEdit35Exit(Sender: TObject);
    procedure Edit12Exit(Sender: TObject);
    procedure RxDBLookupCombo10Exit(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure RxDBLookupCombo14Enter(Sender: TObject);
    procedure mModelistaNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure RxDBLookupCombo15Exit(Sender: TObject);
    procedure RxDBLookupCombo8Change(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure RzDBComboBox1Change(Sender: TObject);
    procedure RzDBComboBox1Enter(Sender: TObject);
    procedure RzDBComboBox1Exit(Sender: TObject);
    procedure RzEdit1Exit(Sender: TObject);
    procedure RzDBLookupComboBox1Enter(Sender: TObject);
    procedure RzDBLookupComboBox1Exit(Sender: TObject);
    procedure RxDBComboBox2Exit(Sender: TObject);
    procedure RxDBComboBox2Change(Sender: TObject);
    procedure NFeDanfe1Click(Sender: TObject);
    procedure Cancelar1Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure RzDBLookupComboBox1CloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo9Change(Sender: TObject);
    procedure Panel1Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Panel14Exit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure RzDBLookupComboBox2Exit(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure Rtulos1Click(Sender: TObject);
    procedure RzButton5Click(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
    procedure RzButton3Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure RzButton4Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure CartadeCorreo1Click(Sender: TObject);
    procedure RzDBLookupComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RzDBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Panel14Enter(Sender: TObject);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn14Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure RxDBLookupCombo10Enter(Sender: TObject);
    procedure RxDBLookupCombo15Enter(Sender: TObject);
    procedure rxdbEnq_IPIKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBDateEdit2Exit(Sender: TObject);
    procedure btnExpDrawBackClick(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
  private
    { Private declarations }
    vDataAnt: TDate;
    vMSGErro: String;

    vMercadoItem: String;
    vCodNatOper: String;
    vCancelarInc: Boolean;
    vItemNota: Integer;
    vExisteNEntrada: Boolean;
    vBaseOutrasDesp, vICMSOutrasDesp,
    vValorSeguroTemp, vValorFreteTemp, vValorFreteICMS,
    vValorParcelas: Currency;
    vValorParcelaTot: String;
    vSiglaUF: String[2];
    vTipoReg, vOrigemProdAux: String;
    vNomeItem, vRefItem, vClasFiscalItem: String;
    vCodItem: Integer;

    function  Calcula_Comissao_Parcela(ValorParcela, TotalNota, ValorComissao: Currency): Currency;
    procedure Limpa_Edit;
    procedure Grava_Pgto(Tipo: String);
    procedure Grava_CReceber(Parcela, CodVendedor: Integer ; VlrParcela: Real);
    procedure Verifica_UF;
    procedure Habilita_Desabilita;
    procedure Exclui_Pgto(Tipo: String);
    procedure Verifica_Nota_Cancelada;
    procedure Compara_Valor_Parcelas;
    procedure Limpa_Parcelas;
    procedure Desfaz_ExtComissao;
    procedure Grava_ExtComissao(TipoVendedor: Integer);
    procedure Le_mModelista;
    procedure Grava_ExtComissao_Modelista(Tipo: Integer);
    procedure Desfaz_ExtComissao_Modelista;
    procedure Lanc_Diferenca;
    procedure Grava_NumNota;
    procedure Grava_NumSeq;
    procedure Excluir_ItemNota(Tipo: String);
    procedure Cancelamento(Cancelar: Boolean); //True = Cancelada    False = Denegada
    procedure Monta_Cor(Tipo: String); //P=Produto   M=Material
    procedure prc_Excluir_Nota;
    procedure prc_Gravar_Numero_Nota;

    function Verifica_Dados: Boolean;
    function Verifica_DadosMaterial: Boolean;
    function Verifica_DadosProduto: Boolean;
    function fnc_Erro: String;

    function Cancelar: Boolean;
    procedure Move_Tributos;
    procedure prc_Chamar_Sel_Produto;

    function fnc_Verifica_Pagamento: String;
    function fnc_Excluir: Boolean;

    procedure prc_Excluir_Sequencia_Nota;
    procedure prc_Mover_Lei_Transparencia;
    procedure prc_Busca_IBPT;

  public
    vBaseComisao: Real;
    vObsComplementar: String;
    //3.10
    vCodCliente_Ant: Integer;

    vPercICMSSimples: Real;
    vCodCorGeral: Integer;
    vCodCombinacao: Integer;
    vPercPis, vPercCofins, vVlrPis, vVlrCofins, vVlrTributo, vPercTributo: Real;
    vCodPis, vCodCofins, vOrigemMerc: String;
    vTipoPis, vTipoCofins: String;
    vSomaVlrTotalProd: Boolean;
    vPercImportacao : Real;
    vSoma_Automatico_Imp : Boolean;

    vBaseImportacao, vVlrAduaneira, vVlrImportacao, vVlrIOF: Real;
    //*********

    { Public declarations }
    procedure Verifica_Parcelas;
    procedure Move_item;
    procedure Move_item_Mat;
  end;

var
  fEmissaoNotaFiscal: TfEmissaoNotaFiscal;
  vNumPedido, vItemPedido: Integer;
  vAliqICMS, vValorIPI, vBaseICMS, vValorICMS: Real;


implementation

uses UDM1, UVendedor, UCliente, UTransp, UUf, UContas, UIndexador, UPlanoContas, UProduto, UBuscaPedido, UConsNotaFiscal, UNatOperacao, UCondPgto, UEscImpressora,
  UMaterial, USitTributaria, UObsAux, UDM2, UMaoDeObra, UNotaFiscalGrade, UEscNotaDevol, UAgendaTelef, URelCopiaNF2, UPrevRelComprovante,
  UNotaFiscalItensOutros, uNFe, uNFeDados, UNotaFiscalCancelada, UNotaFiscalConfirma, UDMNotaFiscal, UNotaFiscalItensObsComplementar, UNotaFiscalOutrasDespesas,
  UNotaFiscalImp, uCalculos, UDMTabImposto, UNotaFiscalContingencia,
  USitTributariaSimples, UNotaFiscalReboque, UNotaFiscalLacre,
  UInfDescontoNota, UNotaFiscalRef, UNotaFiscalAliq, UNotaFiscalOBS,
  UNotaFiscalCCe, uUtilPadrao, USel_Produto, uNotaFiscalAjustarIcms,
  DmdDatabase, USel_Cliente, UDMTabEnqIPI, USel_EnqIPI, UDMNotaFiscalFB,
  UCadNotaFiscal_Itens_DrawBack, UTipoCobranca;

{$R *.DFM}

{
Campo tipo
-> D - Lancamento por Duplicata
-> N - Lancamento por Nota
-> P - Lancamento por Pedido
-> M - Lancamento Manual
-> F - Lancamento por Diferenca de Valores na baixa do pedido
}

function TfEmissaoNotaFiscal.Calcula_Comissao_Parcela(ValorParcela, TotalNota, ValorComissao: Currency): Currency;
begin
  Result := ValorComissao * (ValorParcela * 100 / TotalNota) / 100;
end;

procedure TfEmissaoNotaFiscal.Excluir_ItemNota(Tipo: String);
var
  sds: TSQLDataSet;
begin
  //*** Diminuir Valores Totais
  if (Tipo = 'E') and (DM1.tNotaFiscal.State in [dsEdit,dsInsert]) then
  begin
    DM1.tNotaFiscalPesoBruto.AsFloat     := DM1.tNotaFiscalPesoBruto.AsFloat - DM1.tNotaFiscalItenslkPesoBruto.AsFloat * DM1.tNotaFiscalItensQtd.AsFloat;
    DM1.tNotaFiscalPesoLiquido.AsFloat   := DM1.tNotaFiscalPesoLiquido.AsFloat - DM1.tNotaFiscalItenslkPesoLiquido.AsFloat * DM1.tNotaFiscalItensQtd.AsFloat;
    DM1.tNotaFiscalBaseICMS.AsFloat      := DM1.tNotaFiscalBaseICMS.AsFloat - DM1.tNotaFiscalItensBaseICMS.AsFloat;
    DM1.tNotaFiscalVlrICMS.AsFloat       := DM1.tNotaFiscalVlrICMS.AsFloat - DM1.tNotaFiscalItensVlrICMS.AsFloat;
    DM1.tNotaFiscalVlrCofins.AsFloat     := DM1.tNotaFiscalVlrCofins.AsFloat - DM1.tNotaFiscalItensVlrCofins.AsFloat;
    DM1.tNotaFiscalVlrPis.AsFloat        := DM1.tNotaFiscalVlrPis.AsFloat - DM1.tNotaFiscalItensVlrPis.AsFloat;

    DM1.tNatOperacao.Locate('Codigo',DM1.tNotaFiscalItensNatOper.AsInteger,[loCaseInsensitive]);

    if (copy(DM1.tNatOperacaoCodNatOper.AsString,1,1) = '3' ) and (DM1.tNotaFiscalItensSoma_Automatico_Imp.AsBoolean) then
      DM1.tNotaFiscalVlrTotalNota.AsFloat  := DM1.tNotaFiscalVlrTotalNota.AsFloat - DM1.tNotaFiscalItensBaseIcms.AsFloat
    else
      DM1.tNotaFiscalVlrTotalNota.AsFloat  := DM1.tNotaFiscalVlrTotalNota.AsFloat -DM1.tNotaFiscalItensVlrTotal.AsFloat - DM1.tNotaFiscalItensVlrIPI.AsFloat;
    DM1.tNotaFiscalVlrTotalNota.AsFloat := DM1.tNotaFiscalVlrTotalNota.AsFloat - DM1.tNotaFiscalItensVlrFrete.AsFloat
                                         - DM1.tNotaFiscalItensVlrOutrasDespesas.AsFloat - DM1.tNotaFiscalItensVlrSeguro.AsFloat;
    DM1.tNotaFiscalVlrTotalItens.AsFloat := DM1.tNotaFiscalVlrTotalItens.AsFloat - DM1.tNotaFiscalItensVlrTotal.AsFloat;
    if DM1.tNotaFiscalItensIPI.AsFloat > 0 then
      DM1.tNotaFiscalVlrIPI.AsFloat := DM1.tNotaFiscalVlrIPI.AsFloat - DM1.tNotaFiscalItensQtd.AsFloat * DM1.tNotaFiscalItensVlrUnit.AsFloat * DM1.tNotaFiscalItensIPI.AsFloat / 100;
    if DM1.tNotaFiscalItensGeraDuplicata.AsBoolean then
      DM1.tNotaFiscalVlrTotalDupl.AsFloat := StrToFloat(FormatFloat('0.00', DM1.tNotaFiscalVlrTotalDupl.AsFloat - (DM1.tNotaFiscalItensVlrTotal.AsFloat + DM1.tNotaFiscalItensVlrIpi.AsFloat)));
    if DM1.tNotaFiscalBaseIcmsSimples.AsFloat > 0 then
    begin
      DM1.tNotaFiscalBaseIcmsSimples.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalBaseIcmsSimples.AsFloat - DM1.tNotaFiscalItensBaseIcmsSimples.AsFloat));
      DM1.tNotaFiscalVlrIcmsSimples.AsFloat  := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrIcmsSimples.AsFloat - DM1.tNotaFiscalItensVlrIcmsSimples.AsFloat));
    end;
    DM1.tNotaFiscalVlrImpImportacao.AsFloat := DM1.tNotaFiscalVlrImpImportacao.AsFloat - DM1.tNotaFiscalItensVlrImportacao.AsFloat;
    DM1.tNotaFiscalVlrAduaneira.AsFloat     := DM1.tNotaFiscalVlrAduaneira.AsFloat - DM1.tNotaFiscalItensVlrAduaneira.AsFloat;
  end;

  //*** Volta Pedido
  if (DM1.tNotaFiscalItensNumPedido.AsInteger > 0) and (Tipo <> 'A') then
  begin
    DM1.tPedido.IndexFieldNames := 'Pedido';
    DM1.tPedido.SetKey;
    DM1.tPedidoPedido.AsInteger := DM1.tNotaFiscalItensNumPedido.AsInteger;
    if DM1.tPedido.GotoKey then
    begin
      DM1.tPedido.Edit;
      DM1.tPedidoQtdParesFat.AsInteger  := DM1.tPedidoQtdParesFat.AsInteger - DM1.tNotaFiscalItensQtd.AsInteger;
      DM1.tPedidoQtdParesRest.AsInteger := DM1.tPedidoQtdParesRest.AsInteger + DM1.tNotaFiscalItensQtd.AsInteger;
      DM1.tPedidoQtdFatAut.AsInteger    := DM1.tPedidoQtdFatAut.AsInteger - DM1.tNotaFiscalItensQtd.AsInteger;
      DM1.tPedidoCopiado.AsBoolean      := False;
      DM1.tPedido.Post;
      DM1.tPedidoItem.SetKey;
      DM1.tPedidoItemPedido.AsInteger := DM1.tNotaFiscalItensNumPedido.AsInteger;
      DM1.tPedidoItemItem.AsInteger   := DM1.tNotaFiscalItensItemPedido.AsInteger;
      if DM1.tPedidoItem.GotoKey then
      begin
        DM1.tPedidoItem.Edit;
        DM1.tPedidoItemQtdParesFat.AsInteger  := DM1.tPedidoItemQtdParesFat.AsInteger - DM1.tNotaFiscalItensQtd.AsInteger;
        DM1.tPedidoItemQtdParesRest.AsInteger := DM1.tPedidoItemQtdParesRest.AsInteger + DM1.tNotaFiscalItensQtd.AsInteger;
        DM1.tPedidoItemQtdFatAut.AsInteger    := DM1.tPedidoItemQtdFatAut.AsInteger - DM1.tNotaFiscalItensQtd.AsInteger;
        DM1.tPedidoItemCopiado.AsBoolean      := False;
        DM1.tPedidoItem.Post;
        DM1.tPedidoNota.First;
        while not DM1.tPedidoNota.Eof do
        begin
          if (DM1.tPedidoNotaNumSeqNota.AsInteger = DM1.tNotaFiscalItensNumSeq.AsInteger) and
             (DM1.tPedidoNotaItemNota.AsInteger = DM1.tNotaFiscalItensItem.AsInteger) then
            DM1.tPedidoNota.Delete
          else
            DM1.tPedidoNota.Next;
        end;
      end;
    end;
  end;

  if Tipo = 'E' then
  begin
    DM1.tNotaFiscalGrade.First;
    while not DM1.tNotaFiscalGrade.Eof do
      DM1.tNotaFiscalGrade.Delete;
  end;
  if (Tipo = 'E') and (DM1.tNotaFiscalTipoDesconto.AsString = 'N') then
  begin
    DMNotaFiscal.tNotaFiscalTBDesconto.First;
    while not DMNotaFiscal.tNotaFiscalTBDesconto.Eof do
      DMNotaFiscal.tNotaFiscalTBDesconto.Delete;
    DM1.tNotaFiscalVlrTotalDesc.AsFloat := 0;
    DM1.tNotaFiscalPercDesc.AsFloat     := 0;
  end;

  if Tipo = 'E' then
  begin
    sds  := TSQLDataSet.Create(nil);
    sds.Close;
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'DELETE FROM NOTAFISCAL_ITENS_DRAWBACK '
                       + ' WHERE ID = ' + IntToStr(Dm1.tNotaFiscalNumSeq.AsInteger)
                       + '   AND ITEM = ' + IntToStr(Dm1.tNotaFiscalItensItem.AsInteger);
    sds.ExecSQL();
    FreeAndNil(sds);
  end;
end;

procedure TfEmissaoNotaFiscal.Limpa_Edit;
begin
  Edit1.Clear; Edit2.Clear; Edit3.Clear; Edit4.Clear; Edit5.Clear;
  Edit7.Clear; Edit8.Clear; Edit9.Clear; Edit10.Clear; CurrencyEdit1.Clear;
  RzDBLookupComboBox1.ClearKeyValue; RxDBLookupCombo13.ClearValue;
  RzDBLookupComboBox2.ClearKeyValue;
  RxDBLookupCombo1.ClearValue;
  Edit1.SetFocus;
  vNumPedido   := 0;
  vItemPedido  := 0;
  vItemNota    := 0;
  vMercadoItem := '';
  Query1.Close;
  ComboBox2.ItemIndex := 1;
  SpeedButton23.Tag := 0;
  vObsComplementar := '';

  vPercPis          := 0;
  vPercCofins       := 0;
  vVlrPis           := 0;
  vVlrCofins        := 0;
  vCodPis           := '';
  vCodCofins        := '';
  vTipoPis          := '';
  vTipoCofins       := '';
  vOrigemMerc       := '';
  vSomaVlrTotalProd := True;
  vVlrTributo       := 0;
  vPercTributo      := 0;
  vPercImportacao   := 0;
  vSoma_Automatico_Imp := False;

  vBaseImportacao   := 0;
  vVlrAduaneira     := 0;
  vVlrImportacao    := 0;
  vVlrIOF           := 0;
  //*************
end;

procedure TfEmissaoNotaFiscal.Verifica_UF;
begin
  DM1.tUF.SetKey;
  DM1.tUFSigla.AsString := DM1.tNotaFiscallkUF.AsString;
  if DM1.tUF.GotoKey then
    vAliqICMS := DM1.tUFPercentual.AsFloat;
  vSiglaUF := DM1.tNotaFiscallkUF.AsString;
end;

procedure TfEmissaoNotaFiscal.Lanc_Diferenca;
var
 vValorBase: Currency;
begin
  vValorBase := 0;
  DM1.tNotaFiscalItens.First;
  while not DM1.tNotaFiscalItens.EOF do
    begin
      if (DM1.tNotaFiscalItensNumPedido.AsInteger > 0) and (DM1.tNotaFiscalItensItemPedido.AsInteger > 0) then
        begin
          tPedidoItem.SetKey;
          tPedidoItemPedido.AsInteger := DM1.tNotaFiscalItensNumPedido.AsInteger;
          tPedidoItemItem.AsInteger   := DM1.tNotaFiscalItensItemPedido.AsInteger;
          if tPedidoItem.GotoKey then
            begin
              if (tPedidoItemPreco.AsCurrency - tPedidoItemVlrDesconto.AsCurrency) > DM1.tNotaFiscalItensVlrUnit.AsCurrency then
                vValorBase := vValorBase + (DM1.tNotaFiscalItensQtd.AsCurrency * ((tPedidoItemPreco.AsFloat - tPedidoItemVlrDesconto.AsCurrency) - DM1.tNotaFiscalItensVlrUnit.AsCurrency));
            end;
        end;
      DM1.tNotaFiscalItens.Next;
    end;
  if vValorBase > 0 then
    begin
      tExtComissaoIns.Refresh;
      tExtComissaoIns.Last;
      DM1.tExtComissao.Insert;
      DM1.tExtComissaoNroLancamento.AsInteger := tExtComissaoInsNroLancamento.AsInteger + 1;
      DM1.tExtComissaoCodVendedor.AsInteger   := DM1.tNotaFiscalCodVendedor.AsInteger;
      DM1.tExtComissaoDtReferencia.AsDateTime := DM1.tNotaFiscalDtEmissao.AsDateTime;
      DM1.tExtComissaoParcDoc.AsInteger       := 0;
      DM1.tExtComissaoCodCliente.AsInteger    := DM1.tNotaFiscalCodCli.AsInteger;
      if DM1.tNotaFiscalSaidaEntrada.AsString = 'S' then
        begin
          DM1.tExtComissaoFuncao.AsString  := 'E';
          DM1.tExtComissaoNroDoc.AsInteger := DM1.tNotaFiscalNumNota.AsInteger;
        end
      else
        begin
          DM1.tExtComissaoFuncao.AsString := 'D';
          DM1.tExtComissaoNroDoc.AsInteger := DM1.tNotaFiscalNumNotaOrigem.AsInteger;
        end;
      DM1.tExtComissaoVlrBase.AsFloat      := vValorBase;
      DM1.tExtComissaoPercDescDupl.AsFloat := DM1.tNotaFiscalDescDupl.AsFloat;
      DM1.tExtComissaoPercComissao.AsFloat := DM1.tNotaFiscalPercComissao.AsFloat;
      DM1.tExtComissaoVlrComissao.AsFloat  := StrToFloat(FormatFloat('0.00',(DM1.tExtComissaoVlrBase.AsFloat * DM1.tExtComissaoPercComissao.AsFloat / 100)));
      DM1.tExtComissaoTipo.AsString        := 'F';
      DM1.tExtComissaoSuspensa.AsBoolean   := False;
      DM1.tExtComissao.Post;
      DM1.tNotaFiscalExtComDif.AsInteger := DM1.tExtComissaoNroLancamento.AsInteger;
    end;
end;

procedure TfEmissaoNotaFiscal.Habilita_Desabilita;
begin
  DBNavigator1.Enabled   := not(DBNavigator1.Enabled);
  Panel10.Enabled        := not(Panel10.Enabled);
  Panel1.Enabled         := not(Panel1.Enabled);
  Panel5.Enabled         := not(Panel5.Enabled);
  Panel6.Enabled         := not(Panel6.Enabled);
  Panel7.Enabled         := not(Panel7.Enabled);
  Panel8.Enabled         := not(Panel8.Enabled);
  Panel9.Enabled         := not(Panel9.Enabled);
  Panel15.Enabled        := not(Panel15.Enabled);
  BitBtn1.Enabled        := not(BitBtn1.Enabled);
  BitBtn2.Enabled        := not(BitBtn2.Enabled);
  BitBtn4.Enabled        := not(BitBtn4.Enabled);
  BitBtn7.Enabled        := not(BitBtn7.Enabled);
  BitBtn10.Enabled       := not(BitBtn10.Enabled);
  BitBtn11.Enabled       := not(BitBtn11.Enabled);
  BitBtn12.Enabled       := not(BitBtn12.Enabled);
  BitBtn14.Enabled       := not(BitBtn14.Enabled);
  RxSpeedButton1.Enabled := not(RxSpeedButton1.Enabled);
  RxSpeedButton2.Enabled := not(RxSpeedButton2.Enabled);
  RxDBComboBox4.Enabled  := not(RxDBComboBox4.Enabled);
  RxDBComboBox5.Enabled  := not(RxDBComboBox5.Enabled);
end;

procedure TfEmissaoNotaFiscal.Grava_CReceber(Parcela, CodVendedor: Integer ; VlrParcela: Real);
var
  vValorComissao: Real;
begin
  DM1.tCReceberParc.Insert;
  DM1.tCReceberParcFilial.AsInteger          := DM1.tNotaFiscalFilial.AsInteger;
  DM1.tCReceberParcDtGerado.AsDateTime       := DM1.tNotaFiscalDtEmissao.AsDateTime;
  DM1.tCReceberParcNumCReceber.AsInteger     := DM1.tCReceberNumCReceber.AsInteger;
  DM1.tCReceberParcParcCReceber.AsInteger    := Parcela;
  DM1.tCReceberParcVlrParcCReceber.AsFloat   := VlrParcela;
  if Parcela < 10 then
    DM1.tCReceberVlrTotal.AsFloat := DM1.tCReceberVlrTotal.AsFloat + VlrParcela;
  DM1.tCReceberParcRestParcela.AsFloat       := VlrParcela;
  DM1.tCReceberParcDtVencCReceber.AsDateTime := DM1.tNotaFiscalParcDtVenc.AsDateTime;
  DM1.tCReceberParcCodCli.AsInteger          := DM1.tNotaFiscalCodCli.AsInteger;
  DM1.tCReceberParcNumNota.AsInteger         := DM1.tNotaFiscalNumNota.AsInteger;
  DM1.tCReceberParcCodVendedor.AsInteger     := CodVendedor;
  if DM1.tCReceberParcCodVendedor.AsInteger > 0 then
  begin
    DM1.tCReceberParcPercComissao.AsCurrency := DM1.tNotaFiscalPercComissao.AsCurrency;
    DM1.tCReceberParcVlrComissao.AsCurrency  := Calcula_Comissao_Parcela(VlrParcela,
                                                DM1.tNotaFiscalVlrTotalNota.AsCurrency,
                                                vValorComissao);
  end;
  DM1.tCReceberParcPlanoContas.AsInteger      := DM1.tNotaFiscalPlanoContas.AsInteger;
  DM1.tCReceberParcCancelado.AsBoolean        := False;
  DM1.tCReceberParcTitProtestado.AsBoolean    := False;
  DM1.tCReceberParcTipoDoc.AsString           := 'NF';
  DM1.tCReceberParcPagarParteNaNota.AsBoolean := DM1.tNotaFiscallkPagarParteNaNota.AsBoolean;
  DM1.tCReceberParcSerie.AsString             := DM1.tNotaFiscalSerie.AsString;
  DM1.tCReceberParcNumSeqNota.AsInteger       := DM1.tNotaFiscalNumSeq.AsInteger;
  if (vCodNatOper = '6101') or (vCodNatOper = '5101') then
    DM1.tCReceberParcMercado.AsString := 'I'
  else
    DM1.tCReceberParcMercado.AsString := 'O';
  DM1.tCReceberParc.Post;
end;

procedure TfEmissaoNotaFiscal.Grava_Pgto(Tipo: String);
var
  vValorComissao: Currency;
  vNumAux: Integer;
begin
  //Verificar se tem alguma título dessa nota
  if Tipo = 'E' then
    Exclui_Pgto('E');

  vValorComissao := 0;
  if (DM1.tNotaFiscalCondPgto.AsString = 'V') or
     (DM1.tNotaFiscalCondPgto.AsString = 'P') then
    begin
      DM1.tCReceber.IndexFieldNames   := 'NumCReceber';
      DM1.tCReceber.Refresh;
      DM1.tCReceber.Last;
      vNumAux := DM1.tCReceberNumCReceber.AsInteger;

      DM1.tCReceber.Insert;
      DM1.tCReceberNumCReceber.AsInteger    := vNumAux + 1;
      DM1.tCReceberNumNota.AsInteger        := DM1.tNotaFiscalNumNota.AsInteger;
      DM1.tCReceberCodCli.AsInteger         := DM1.tNotaFiscalCodCli.AsInteger;;
      DM1.tCReceberTipoDoc.AsString         := 'NF';
      DM1.tCReceberDtGerado.AsDateTime      := DM1.tNotaFiscalDtEmissao.AsDateTime;
      DM1.tCReceberQuitado.AsBoolean        := False;
      DM1.tCReceberCancelado.AsBoolean      := False;
      DM1.tCReceberPercBaseComissao.AsFloat := DM1.tNotaFiscalPercBaseComissao.AsFloat;
      DM1.tCReceberSerie.AsString           := DM1.tNotaFiscalSerie.AsString;
      DM1.tCReceberNumSeqNota.AsInteger     := DM1.tNotaFiscalNumSeq.AsInteger;
      DM1.tCReceberFilial.AsInteger         := DM1.tNotaFiscalFilial.AsInteger;
      if (Copy(vCodNatOper,1,1) = '6') or (Copy(vCodNatOper,1,1) = '5') then
        DM1.tCReceberMercado.AsString := 'I'
      else
        DM1.tCReceberMercado.AsString := 'O';
      DM1.tCReceber.Post;
      DM1.tCReceber.Edit;
    end;

  if DM1.tNotaFiscalCondPgto.AsString = 'P' then
    begin
      if DM1.tNotaFiscalEntrada.AsCurrency > 0 then
        Grava_CReceber(0,DM1.tNotaFiscalCodVendedor.AsInteger,DM1.tNotaFiscalEntrada.AsFloat);
      DM1.tNotaFiscalParc.First;
      while not DM1.tNotaFiscalParc.Eof do
        begin
          Grava_CReceber(DM1.tNotaFiscalParcParcela.AsInteger,DM1.tNotaFiscalCodVendedor.AsInteger,DM1.tNotaFiscalParcVlrVenc.AsFloat);
          if (DM1.tNotaFiscalSituacao.AsInteger = 2) then
            Grava_CReceber(DM1.tNotaFiscalParcParcela.AsInteger+10,DM1.tNotaFiscalCodVendedor.AsInteger,DM1.tNotaFiscalParcVlrVenc.AsFloat);
          DM1.tNotaFiscalParc.Next;
        end;
      DM1.tCReceber.Post;
    end
  else
  if DM1.tNotaFiscalCondPgto.AsString = 'V' then
    begin
      Grava_CReceber(1,DM1.tNotaFiscalCodVendedor.AsInteger,DM1.tNotaFiscalVlrTotalNota.AsFloat);
      if DM1.tNotaFiscalSituacao.AsInteger = 2 then
        Grava_CReceber(11,DM1.tNotaFiscalCodVendedor.AsInteger,DM1.tNotaFiscalVlrTotalNota.AsFloat);
      DM1.tCReceber.Post;
    end;
end;

procedure TfEmissaoNotaFiscal.Desfaz_ExtComissao;
begin
  if DM1.tNotaFiscalNroLancExtComissao.AsInteger > 0 then
  begin
    DM1.tExtComissao.IndexFieldNames := 'NroLancamento';
    DM1.tExtComissao.SetKey;
    DM1.tExtComissaoNroLancamento.AsInteger := DM1.tNotaFiscalNroLancExtComissao.AsInteger;
    if DM1.tExtComissao.GotoKey then
      DM1.tExtComissao.Delete;
  end;
  if DM1.tNotaFiscalExtComDif.AsInteger > 0 then
  begin
    DM1.tExtComissao.IndexFieldNames := 'NroLancamento';
    DM1.tExtComissao.SetKey;
    DM1.tExtComissaoNroLancamento.AsInteger := DM1.tNotaFiscalExtComDif.AsInteger;
    if DM1.tExtComissao.GotoKey then
      DM1.tExtComissao.Delete;
  end;
end;

procedure TfEmissaoNotaFiscal.Grava_ExtComissao(TipoVendedor: Integer);
var
  vAux: Real;
begin
  DM1.tExtComissao.Filtered := False;
  if TipoVendedor = 1 then
  begin
    DM1.tExtComissao.Filter   := 'NroDoc = '''+DM1.tNotaFiscalNumNota.AsString+''' and ParcDoc = ''0''';
    DM1.tExtComissao.Filtered := True;
    DM1.tExtComissao.First;
    while not DM1.tExtComissao.Eof do
    begin
      if DM1.tExtComissaoTipo.AsString <> 'M' then
        DM1.tExtComissao.Delete
      else
        DM1.tExtComissao.Next;
    end;
    DM1.tExtComissao.Filtered := False;
  end;
  tExtComissaoIns.Refresh;
  tExtComissaoIns.Last;
  DM1.tExtComissao.Insert;
  DM1.tExtComissaoNroLancamento.AsInteger := tExtComissaoInsNroLancamento.AsInteger + 1;
  DM1.tExtComissaoCodVendedor.AsInteger   := DM1.tNotaFiscalCodVendedor.AsInteger;
  DM1.tExtComissaoDtReferencia.AsDateTime := DM1.tNotaFiscalDtEmissao.AsDateTime;
  DM1.tExtComissaoParcDoc.AsInteger       := 0;
  DM1.tExtComissaoCodCliente.AsInteger    := DM1.tNotaFiscalCodCli.AsInteger;
  if DM1.tNotaFiscalSaidaEntrada.AsString = 'S' then
    begin
      DM1.tExtComissaoFuncao.AsString  := 'E';
      DM1.tExtComissaoNroDoc.AsInteger := DM1.tNotaFiscalNumNota.AsInteger;
    end
  else
    begin
      DM1.tExtComissaoFuncao.AsString := 'D';
      DM1.tExtComissaoNroDoc.AsInteger := DM1.tNotaFiscalNumNotaOrigem.AsInteger;
    end;
  if DM1.tNotaFiscalPercBaseComissao.AsFloat = 100 then
    vAux := DM1.tNotaFiscalVlrTotalNota.AsFloat
  else
    vAux := (DM1.tNotaFiscalVlrTotalNota.AsFloat * StrToFloat(FormatFloat('0.00000',(DM1.tNotaFiscalPercBaseComissao.AsFloat)))) / 100;
  if DM1.tNotaFiscallkTipoComissao.AsString = 'D' then
    //vAux  := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalVlrTotalNota.AsFloat / 2)));
    vAux  := StrToFloat(FormatFloat('0.00',(vAux / 2)));
  //DM1.tExtComissaoVlrBase.AsFloat      := DM1.tNotaFiscalVlrTotalNota.AsFloat;
  DM1.tExtComissaoVlrBase.AsFloat      := StrToFloat(FormatFloat('0.00',vAux));
  DM1.tExtComissaoPercDescDupl.AsFloat := DM1.tNotaFiscalDescDupl.AsFloat;
  DM1.tExtComissaoPercComissao.AsFloat := DM1.tNotaFiscalPercComissao.AsFloat;
  DM1.tExtComissaoVlrComissao.AsFloat  := StrToFloat(FormatFloat('0.00',(DM1.tExtComissaoVlrBase.AsFloat * DM1.tExtComissaoPercComissao.AsFloat / 100)));
  DM1.tExtComissaoTipo.AsString        := DM1.tNotaFiscallkTipoComissao.AsString;
  if DM1.tExtComissaoTipo.AsString = '' then
    DM1.tExtComissaoTipo.AsString      := 'N';
  DM1.tExtComissaoSuspensa.AsBoolean   := False;
  if TipoVendedor = 1 then
    DM1.tNotaFiscalNroLancExtComissao.AsInteger := DM1.tExtComissaoNroLancamento.AsInteger
  else
    begin
      DM1.tExtComissaoTipo.AsString      := 'F';
      DM1.tNotaFiscalExtComDif.AsInteger := DM1.tExtComissaoNroLancamento.AsInteger;
    end;
  DM1.tExtComissao.Post;
end;

procedure TfEmissaoNotaFiscal.Le_mModelista;
begin
  mModelista.First;
  while not mModelista.Eof do
    begin
      Grava_ExtComissao_Modelista(1);
      if DM1.tNotaFiscalSituacao.AsInteger = 2 then
        Grava_ExtComissao_Modelista(2);
      mModelista.Next;
    end;
  mModelista.EmptyTable;
end;

procedure TfEmissaoNotaFiscal.Grava_ExtComissao_Modelista(Tipo: Integer);
var
  vNumLancamento: Integer;
begin
  DM1.tExtComissaoMod.Refresh;
  DM1.tExtComissaoMod.Last;
  vNumLancamento := DM1.tExtComissaoModNroLancamento.AsInteger + 1;

  DM1.tExtComissaoMod.Insert;
  DM1.tExtComissaoModNroLancamento.AsInteger := vNumLancamento;
  DM1.tExtComissaoModCodModelista.AsInteger  := mModelistaCodModelista.AsInteger;
  DM1.tExtComissaoModDtReferencia.AsDateTime := DM1.tNotaFiscalDtEmissao.AsDateTime;
  DM1.tExtComissaoModNumNota.AsInteger       := DM1.tNotaFiscalNumNota.AsInteger;
  DM1.tExtComissaoModCodProduto.AsInteger    := 0;
  if DM1.tNotaFiscalSaidaEntrada.AsString = 'S' then
    DM1.tExtComissaoModFuncao.AsString  := 'E'
  else
    DM1.tExtComissaoModFuncao.AsString  := 'D';
  if DM1.tNotaFiscalPercDesc.AsFloat > 0 then
    begin
      DM1.tExtComissaoModVlrBase.AsCurrency     := mModelistaVlrBase.AsCurrency - ((mModelistaVlrBase.AsCurrency * DM1.tNotaFiscalPercDesc.AsFloat) / 100);
      DM1.tExtComissaoModVlrComissao.AsCurrency := mModelistaVlrComissao.AsCurrency - ((mModelistaVlrComissao.AsCurrency * DM1.tNotaFiscalPercDesc.AsFloat) / 100);
    end
  else
    begin
      DM1.tExtComissaoModVlrBase.AsCurrency     := mModelistaVlrBase.AsCurrency;
      DM1.tExtComissaoModVlrComissao.AsCurrency := mModelistaVlrComissao.AsCurrency;
    end;
  DM1.tExtComissaoModPercComissao.AsCurrency := mModelistaPercComissao.AsCurrency;
  if Tipo = 1 then
    DM1.tExtComissaoModTipo.AsString := 'N'
  else
    DM1.tExtComissaoModTipo.AsString := 'F';
  DM1.tExtComissaoModCodCliente.AsInteger    := DM1.tNotaFiscalCodCli.AsInteger;
  DM1.tExtComissaoMod.Post;
end;

procedure TfEmissaoNotaFiscal.Desfaz_ExtComissao_Modelista;
begin
  if (DM1.tNotaFiscalNumNota.AsInteger <= 0) or (DM1.tNotaFiscalNumNota.isNull) then
    exit;
  DM1.tExtComissaoMod.Filtered := False;
  DM1.tExtComissaoMod.Filter   := 'NumNota = '''+DM1.tNotaFiscalNumNota.AsString+'''';
  DM1.tExtComissaoMod.Filtered := True;
  DM1.tExtComissaoMod.First;
  while not DM1.tExtComissaoMod.Eof do
    DM1.tExtComissaoMod.Delete;
  DM1.tExtComissaoMod.Filtered := False;
  DM1.tExtComissaoMod.Refresh;
end;

procedure TfEmissaoNotaFiscal.Verifica_Parcelas;
var
  vValorTotalStr: String;
begin
  if (DM1.tNotaFiscalParcDtVenc.AsString = '') or
     (DM1.tNotaFiscalParcVlrVenc.AsString = '') then
    begin
      DM1.tNotaFiscalParc.Cancel;
      vValorTotalStr := FormatFloat('0.00',DM1.tNotaFiscalVlrTotalDupl.AsFloat);
      Compara_Valor_Parcelas;
      if vValorParcelaTot <> vValorTotalStr then
        ShowMessage('Valor das parcelas não confere com total da nota fiscal!');
      Abort;
    end
  else
    begin
      if DM1.tNotaFiscalParc.State = dsInsert then
        begin
          tNotaFiscalParcIns.Refresh;
          tNotaFiscalParcIns.Last;
          DM1.tNotaFiscalParcParcela.AsInteger := tNotaFiscalParcInsParcela.AsInteger + 1;
        end;
    end;
end;

procedure TfEmissaoNotaFiscal.Exclui_Pgto(Tipo: String);
var
  vNumRec: Integer;
begin
  if DM1.tNotaFiscalNumSeq.AsInteger <= 0 then
    exit;
  vNumRec := 0;
  if DM1.tCReceber.Locate('NumSeqNota;Filial',VarArrayOf([DM1.tNotaFiscalNumSeq.AsInteger,DM1.tNotaFiscalFilial.AsInteger]),[locaseinsensitive]) then
    vNumRec := DM1.tCReceberNumCReceber.AsInteger;

  if Tipo = 'E' then
  begin
    if vNumRec > 0 then
    begin
      qAux.Active := False;
      qAux.SQL.Clear;
      qAux.SQL.Add('DELETE FROM DBCRECEBER.DB ');
      qAux.SQL.Add(' WHERE NUMSEQNOTA = ' + DM1.tNotaFiscalNumSeq.AsString + ' AND FILIAL = ' + Dm1.tNotaFiscalFilial.AsString);
      qAux.ExecSQL;
    end;

    if vNumRec > 0 then
    begin
      qAux.Active := False;
      qAux.SQL.Clear;
      qAux.SQL.Add('DELETE FROM DBCRECEBERPARC.DB ');
      qAux.SQL.Add(' WHERE NumCReceber = ' + IntToStr(vNumRec));
      qAux.ExecSQL;
    end;

    if vNumRec > 0 then
    begin
      qAux.Active := False;
      qAux.SQL.Clear;
      qAux.SQL.Add('DELETE FROM DBCRECEBERPARCHIST.DB ');
      qAux.SQL.Add(' WHERE NumCReceber = ' + IntToStr(vNumRec));
      qAux.ExecSQL;
    end;
    exit;

  end;


//  cancela o contas a receber e as parcelas dele
  DM1.tCReceber.Filtered := False;
  DM1.tCReceber.Filter   := 'NumSeqNota = '''+DM1.tNotaFiscalNumSeq.AsString+''' and Filial = '''+Dm1.tNotaFiscalFilial.AsString+'''';
  DM1.tCReceber.Filtered := True;
  DM1.tCReceber.First;
  while not DM1.tCReceber.Eof do
  begin
    if DM1.tCReceberTipoDoc.AsString <> 'AV' then
    begin
      DM1.tCReceberParc.First;
      while not DM1.tCReceberParc.Eof do
      begin
        if Tipo = 'E' then
          DM1.tCReceberParc.Delete
        else
        begin
          DM1.tCReceberParc.Edit;
          DM1.tCReceberParcCancelado.AsBoolean := True;
          DM1.tCReceberParc.Post;
          DM1.tCReceberParc.Next;
        end
      end;
      if Tipo = 'E' then
        DM1.tCReceber.Delete
      else
      begin
        DM1.tCReceber.Edit;
        DM1.tCReceberCancelado.AsBoolean := True;
        DM1.tCReceber.Post;

        DM1.tCReceber.Next;
      end;
    end
    else
      DM1.tCReceber.Next;
  end;
  DM1.tCReceber.Filtered := False;
end;

procedure TfEmissaoNotaFiscal.Verifica_Nota_Cancelada;
begin
  if not(DM1.tNotaFiscalCancelada.AsBoolean) and not(DM1.tNotaFiscalNFeDenegada.AsBoolean) then
    Panel4.SendToBack
  else
  begin
    if DM1.tNotaFiscalNFeDenegada.AsBoolean then
      Label39.Caption := 'NOTA DENEGADA'
    else
    if (Trim(DM1.tNotaFiscalNFeProtocoloCancelada.AsString) = '') and (DM1.tNotaFiscalSerie.AsString <> 'UN') then
      Label39.Caption := '... Aguardando cancelamento'
    else
      Label39.Caption := 'NOTA CANCELADA';
    Panel4.BringToFront;
  end;
  lbContingencia.Visible := (((Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '2') or (Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '5')) and
                            (Trim(DM1.tNotaFiscalNFeProtocolo.AsString) = '') and
                            (Trim(DM1.tNotaFiscalNFeChaveAcesso.AsString) <> ''));
end;

procedure TfEmissaoNotaFiscal.Compara_Valor_Parcelas;
begin
  vValorParcelas := 0;
  if DM1.tNotaFiscalParc.State in [dsEdit,dsInsert] then
    DM1.tNotaFiscalParc.Post;
  tNotaFiscalParcIns.First;
  while not tNotaFiscalParcIns.Eof do
    begin
      if tNotaFiscalParcInsParcela.AsInteger < 10 then
        vValorParcelas := vValorParcelas + tNotaFiscalParcInsVlrVenc.AsFloat;
      tNotaFiscalParcIns.Next;
    end;
  vValorParcelas   := vValorParcelas + DM1.tNotaFiscalEntrada.AsCurrency;
  vValorParcelaTot := FormatFloat('0.00',vValorParcelas);
end;

procedure TfEmissaoNotaFiscal.Limpa_Parcelas;
begin
  RxDBLookupCombo2.ClearValue;
  DM1.tNotaFiscalVlrTotalNota.AsCurrency := DM1.tNotaFiscalVlrTotalNota.AsCurrency -
                                            DM1.tNotaFiscalCustoFinanc.AsCurrency;
  DM1.tNotaFiscalCustoPerc.Clear;
  DM1.tNotaFiscalCustoFinanc.Clear;
  DM1.tNotaFiscalParc.First;
  while not DM1.tNotaFiscalParc.EOF do
    DM1.tNotaFiscalParc.Delete;
end;

procedure TfEmissaoNotaFiscal.Move_Item;
begin
  if trim(RzDBLookupComboBox1.Text) = '' then
    exit;

  if (ComboBox3.ItemIndex = 0) or (ComboBox3.ItemIndex = 2) then
  begin
    if DM1.tProdutoCodigo.AsInteger > 0 then
      RzDBLookupComboBox1.KeyValue := DM1.tProdutoCodigo.AsInteger;
    CurrencyEdit1.Clear;
    RxDBLookupCombo14.ClearValue;
    if ComboBox3.ItemIndex = 0 then
    begin
      if DM1.tNotaFiscalTipoNota.AsString = '1' then
        CurrencyEdit1.Value := DM1.tProdutoComissaoMod.AsFloat;
      if CurrencyEdit1.Value > 0 then
      begin
        if DM1.tParametrosCodModelista.AsInteger > 0 then
          RxDBLookupCombo14.KeyValue := DM1.tParametrosCodModelista.AsInteger;
        if (RxDBLookupCombo14.Text = '') and (DM1.tProdutoCodModelista.AsInteger > 0) then
          RxDBLookupCombo14.KeyValue := DM1.tProdutoCodModelista.AsInteger;
      end;
    end;
    Edit2.Text := DM1.tProdutoUnidade.AsString;
    Edit3.Text := '1';
    Edit4.Clear;
    ComboBox2.ItemIndex := 1;
    if RxDBLookupCombo15.Text <> '' then
      begin
        DM1.tNatOperacao.IndexFieldNames := 'Codigo';
        DM1.tNatOperacao.SetKey;
        DM1.tNatOperacaoCodigo.AsInteger := RxDBLookupCombo15.KeyValue;
        if DM1.tNatOperacao.GotoKey then
          begin
            if (DM1.tNatOperacaoIcms.AsBoolean) then
              begin
                if StrToFloat(FormatFloat('0.00',DM1.tProdutoAliqIcms.AsFloat)) > 0 then
                  Edit4.Text := DM1.tProdutoAliqICMS.AsString
                else
                  Edit4.Text := FloatToStr(vAliqICMS);
              end;
            if DM1.tNatOperacaoCalcComissao.AsBoolean then
              ComboBox2.ItemIndex := 0;
          end;
      end;
    Edit5.Text := DM1.tProdutoAliqIPI.AsString;
    if not dm1.tNatOperacaoCodSitTrib.IsNull then
      RxDBLookupCombo13.KeyValue := dm1.tNatOperacaoCodSitTrib.AsInteger
    else
    if DM1.tProdutoCodSitTrib.AsInteger > 0 then
      RxDBLookupCombo13.KeyValue := DM1.tProdutoCodSitTrib.AsInteger
    else
      RxDBLookupCombo13.ClearValue;
    RxDBLookupCombo1.Value := DM1.tProdutoCodClasFiscal.AsString;
    Edit7.Text := '';
    Edit8.Text := Edit7.Text;
    //21/12/2015
    if DM1.tProdutoID_EnqIPI.AsInteger > 0 then
      rxdbEnq_IPI.KeyValue := DM1.tProdutoID_EnqIPI.AsInteger
    else
    if DM1.tNatOperacaoID_EnqIPI.AsInteger > 0 then
      rxdbEnq_IPI.KeyValue := DM1.tNatOperacaoID_EnqIPI.AsInteger
    else
    if DM1.tFilialID_EnqIPI.AsInteger > 0 then
      rxdbEnq_IPI.KeyValue := DM1.tFilialID_EnqIPI.AsInteger;
    //************
  end
  else
  begin
    if DM1.tMaterialCodigo.AsInteger > 0 then
      RzDBLookupComboBox1.KeyValue := DM1.tMaterialCodigo.AsInteger;
    CurrencyEdit1.Clear;
    Edit2.Text := DM1.tMaterialUnidade.AsString;
    Edit3.Text := '1';
    Edit4.Clear;
    ComboBox2.ItemIndex := 1;
    if RxDBLookupCombo15.Text <> '' then
      begin
        DM1.tNatOperacao.IndexFieldNames := 'Codigo';
        DM1.tNatOperacao.SetKey;
        DM1.tNatOperacaoCodigo.AsInteger := RxDBLookupCombo15.KeyValue;
        if DM1.tNatOperacao.GotoKey then
          begin
            if (DM1.tNatOperacaoIcms.AsBoolean) then
              begin
                if StrToFloat(FormatFloat('0.00',DM1.tMaterialICMS.AsFloat)) > 0 then
                  Edit4.Text := DM1.tMaterialICMS.AsString
                else
                  Edit4.Text := FloatToStr(vAliqICMS);
              end;
            if DM1.tNatOperacaoCalcComissao.AsBoolean then
              ComboBox2.ItemIndex := 0;
          end;
      end;
    Edit5.Text := DM1.tMaterialIPI.AsString;
    if not dm1.tNatOperacaoCodSitTrib.IsNull then
      RxDBLookupCombo13.KeyValue := dm1.tNatOperacaoCodSitTrib.AsInteger
    else
    if DM1.tMaterialCodSitTrib.AsInteger > 0 then
      RxDBLookupCombo13.KeyValue := DM1.tMaterialCodSitTrib.AsInteger
    else
      RxDBLookupCombo13.ClearValue;
    RxDBLookupCombo1.Value := DM1.tMaterialCodClasFiscal.AsString;
    Edit7.Text := '';
    Edit8.Text := Edit7.Text;
    //21/12/2015
    if DM1.tMaterialID_EnqIPI.AsInteger > 0 then
      rxdbEnq_IPI.KeyValue := DM1.tMaterialID_EnqIPI.AsInteger
    else
    if DM1.tNatOperacaoID_EnqIPI.AsInteger > 0 then
      rxdbEnq_IPI.KeyValue := DM1.tNatOperacaoID_EnqIPI.AsInteger
    else
    if DM1.tFilialID_EnqIPI.AsInteger > 0 then
      rxdbEnq_IPI.KeyValue := DM1.tFilialID_EnqIPI.AsInteger;
    //************
  end;
end;

procedure TfEmissaoNotaFiscal.Move_Item_Mat;
begin
  if DM1.tMaterialCodigo.AsInteger > 0 then
  RzDBLookupComboBox1.KeyValue := DM1.tMaterialCodigo.AsInteger;
  if DM1.tNotaFiscalTipoNota.AsString = '1' then
    CurrencyEdit1.Value := DM1.tProdutoComissaoMod.AsFloat;
  Edit2.Text := DM1.tMaterialUnidade.AsString;
  Edit3.Text := '1';
  if DM1.tNatOperacaoIcms.AsBoolean then
    begin
      if StrToFloat(FormatFloat('0.00',DM1.tMaterialICMS.AsFloat)) > 0 then
        Edit4.Text := DM1.tMaterialICMS.AsString
      else
        Edit4.Text := FloatToStr(vAliqICMS);
    end
  else
    Edit4.Clear;
  Edit5.Text := DM1.tMaterialIPI.AsString;
  RxDBLookupCombo13.ClearValue;
  RxDBLookupCombo1.Value := DM1.tMaterialCodClasFiscal.AsString;
  Edit7.Text := DM1.tMaterialPrCusto.AsString;
  Edit8.Text := Edit7.Text;
end;

procedure TfEmissaoNotaFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Query1.Close;
  DM1.tProduto.IndexFieldNames := 'Nome';
  DM1.tCliente.IndexFieldNames := 'Codigo';
  if Screen.FormCount < 3 then
  begin
    Dm1.tPlanoContas.Close;
    DM1.tExtComissao.Close;
    DM1.tExtComissaoMod.Close;
    DM1.tNotaFiscalGrade.Close;
    DM1.tNotaFiscalItens.Close;
    DM1.tNotaFiscalParc.Close;
    DM1.tNotaFiscalRef.Open;
    DM1.tNotaFiscal.Close;
    DM1.tObsAux.Close;
    DM1.tIndexador.Close;
    DM1.tNatOperacao.Close;
    DM1.tTipoCobranca.Close;
    DM1.tProdutoTam.Close;
    DM1.tProdutoCor.Close;
    DM1.tProduto.Close;
    DM1.tSitTributaria.Close;
    DM1.tClasFiscal.Close;
    DM1.tTransp.Close;
    DM1.tContas.Close;
    DM1.tCReceberParcHist.Close;
    DM1.tCReceberParc.Close;
    DM1.tCReceber.Close;
    DM1.tPedidoNota.Close;
    DM1.tPedidoParc.Close;
    DM1.tPedidoMaterial.Close;
    DM1.tPedidoGrade.Close;
    DM1.tPedidoItem.Close;
    DM1.tPedidoDesconto.Close;
    DM1.tPedido.Close;
    DM1.tNEntradaItensGrade.Close;
    DM1.tNEntradaItens.Close;
    DM1.tNEntradaParc.Close;
    DM1.tNEntrada.Close;
    DM1.tGradeItem.Close;
    DM1.tGrade.Close;
    DM1.tCor.Close;
    DM1.tCondPgtoItem.Close;
    DM1.tCondPgto.Close;
    DM1.tUF.Close;
    DM1.tCidade.Close;
    DM1.tFornecedores.Close;
    DM1.tCliente.Close;
    DM1.tModelista.Close;
    DM1.tVendedor.Close;
    DM1.tMaterialCor.Close;
    DM1.tMaterial.Close;
    DM1.tMovimentos.Close;
  end;
  if DMNOtaFiscal.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMNOtaFiscal);
  if DMTabImposto.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMTabImposto);
  if DMTabEnqIPI.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMTabEnqIPI);

  DM1.tNatOperacao.Filtered   := False;
  DM1.tSitTributaria.Filtered := False;

  Action := CaFree;
end;

procedure TfEmissaoNotaFiscal.SpeedButton1Click(Sender: TObject);
var
  vFiltro: String;
begin
  if DM1.tUsuarioNatOper.AsBoolean then
    begin
      vFiltro := DM1.tNatOperacao.Filter;
      DM1.tNatOperacao.Filtered := False;

      fNatOperacao := TfNatOperacao.Create(Self);
      fNatOperacao.ShowModal;

      DM1.tNatOperacao.Filtered := False;
      DM1.tNatOperacao.Filter   := vFiltro;
      DM1.tNatOperacao.Filtered := True;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado!');
end;

procedure TfEmissaoNotaFiscal.SpeedButton3Click(Sender: TObject);
begin
  if DM1.tUsuarioVendedor.AsBoolean then
    begin
      fVendedor := TfVendedor.Create(Self);
      fVendedor.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado!');
end;

procedure TfEmissaoNotaFiscal.SpeedButton2Click(Sender: TObject);
begin
  if DM1.tUsuarioClientes.AsBoolean then
    begin
      fCliente := TfCliente.Create(Self);
      fCliente.ShowModal;
      DM1.tCliente.Refresh;
      DM1.tCliente.IndexFieldNames := 'Nome';
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado!');
end;

procedure TfEmissaoNotaFiscal.SpeedButton8Click(Sender: TObject);
begin
  if DM1.tUsuarioTransp.AsBoolean then
    begin
      fTransp := TfTransp.Create(Self);
      fTransp.ShowModal;
      DM1.tTransp.Refresh;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado!');
end;

procedure TfEmissaoNotaFiscal.BitBtn6Click(Sender: TObject);
var
  vErroAux: String;
  ID: TTransactionDesc;
  sds: TSQLDataSet;
  vFlag: Boolean;
begin
  vOrigemProdAux  := '';
  vTipoReg        := '';
  vNomeItem       := '';
  vRefItem        := '';
  vCodItem        := 0;
  vClasFiscalItem := '';

  vErroAux := fnc_Erro;
  if (vErroAux = '') or (vErroAux = 'S')  then
    exit;

  sds := TSQLDataSet.Create(nil);
  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    vFlag := False;
    while not vflag do
    begin
      try
        sds.Close;
        sds.SQLConnection := dmDatabase.scoDados;
        sds.NoMetadata    := True;
        sds.GetMetadata   := False;
        sds.CommandText := ' UPDATE TABELALOC SET FLAG = 0 ' +
                           ' WHERE TABELA = ' + QuotedStr('NOTAFISCAL');
        sds.ExecSQL();
        vFlag := True;
      except
        vFlag := False;
      end
    end;

    Limpa_Parcelas;
    Edit7Exit(Sender);

    if DM1.tNotaFiscalTipoDesconto.AsString = 'N' then
    begin
      DM1.tNotaFiscalPercDesc.AsFloat     := 0;
      DM1.tNotaFiscalVlrTotalDesc.AsFloat := 0;
      DMNotaFiscal.tNotaFiscalTBDesconto.First;
      while not DMNotaFiscal.tNotaFiscalTBDesconto.Eof do
        DMNotaFiscal.tNotaFiscalTBDesconto.Delete;
    end;

    tNotaFiscalItensIns.Refresh;
    tNotaFiscalItensIns.IndexFieldNames := 'Filial;NumSeq;Item';
    tNotaFiscalItensIns.Refresh;
    tNotaFiscalItensIns.Last;
    DM1.tNotaFiscalItens.Insert;
    dm1.tNotaFiscalItensFilial.AsInteger := dm1.tNotaFiscalFilial.AsInteger;
    if vItemNota > 0 then
      DM1.tNotaFiscalItensItem.AsInteger := vItemNota
    else
      DM1.tNotaFiscalItensItem.AsInteger := tNotaFiscalItensInsItem.AsInteger + 1;

    DM1.tNotaFiscalItensCodProduto.AsInteger := vCodItem;
    DM1.tNotaFiscalItensReferencia.AsString  := vRefItem;
    DM1.tNotaFiscalItensDescricao.AsString   := vNomeItem;
    DM1.tNotaFiscalItensCodCor.AsInteger    := 0;
    if RxDBLookupCombo4.Text <> '' then
      DM1.tNotaFiscalItensCodCor.AsInteger  := RxDBLookupCombo4.KeyValue;
    DM1.tNotaFiscalItensComissaoMod.AsFloat := CurrencyEdit1.Value;
    DM1.tNotaFiscalItensNatOper.AsInteger   := RxDBLookupCombo15.KeyValue;
    DM1.tNotaFiscalItensIcmsIpi.AsBoolean   := DM1.tNotaFiscalIcmsIpi.AsBoolean;
    if RxDBLookupCombo14.Text <> '' then
      DM1.tNotaFiscalItensCodModelista.AsInteger := RxDBLookupCombo14.KeyValue;
    DM1.tNotaFiscalItensClasFiscal.Value := vClasFiscalItem;
    case ComboBox3.ItemIndex of
      0 : DM1.tNotaFiscalItensMaterial.AsBoolean := False;
      1 : DM1.tNotaFiscalItensMaterial.AsBoolean := True;
      2 : DM1.tNotaFiscalItensMaterial.AsBoolean := False;
    end;
    if RxDBComboBox2.ItemIndex = 1 then
    begin
      if vMercadoItem = '' then
        DM1.tNotaFiscalItensMercado.AsString := 'E'
      else
        DM1.tNotaFiscalItensMercado.AsString := vMercadoItem;
      fNotaFiscalItensOutros := TfNotaFiscalItensOutros.Create(Self);
      fNotaFiscalItensOutros.ShowModal;
    end;
    DM1.tNotaFiscalItensUnidade.AsString := Edit2.Text;
    DM1.tNotaFiscalItensQtd.AsString     := Edit3.Text;

    DM1.tNotaFiscalItensGeraDupl.AsBoolean := DM1.tNatOperacaoGeraDuplicata.AsBoolean;
    
    dm1.tNotaFiscalItensVLR_UNITARIO_TRIB.AsCurrency := dm1.tNotaFiscalItensVlrUnit.AsCurrency;
    dm1.tNotaFiscalItensUNIDADE_TRIB.AsString        := 'PARES';
    dm1.tNotaFiscalItensQTD_TRIB.AsCurrency          := dm1.tNotaFiscalItensQtd.AsCurrency;

    vBaseICMS  := 0;
    vValorICMS := 0;
    vValorIPI  := 0;
    DM1.tNotaFiscalItensIcms.AsFloat     := 0;
    if (Edit4.Text <> '') and (Edit4.Text <> '0') and not(Dm1.tFilialSimplesGaucho.AsBoolean) then
      if StrToFloat(Edit4.Text) > 0 then
        DM1.tNotaFiscalItensICMS.AsFloat := StrToFloat(Edit4.Text);

    DM1.tNotaFiscalItensBaseICMS.AsFloat := vBaseICMS;
    DM1.tNotaFiscalItensVlrICMS.AsFloat  := vValorICMS;
    DM1.tNotaFiscalBaseICMS.AsFloat      := StrToFloat(FormatFloat('0.00', DM1.tNotaFiscalBaseICMS.AsFloat + vBaseICMS));
    DM1.tNotaFiscalVlrICMS.AsFloat       := StrToFloat(FormatFloat('0.00', DM1.tNotaFiscalVlrICMS.AsFloat + vValorICMS));

    DM1.tNotaFiscalItensIPI.AsString         := Edit5.Text;
    DM1.tNotaFiscalItensVlrUnit.AsString     := Edit7.Text;
    DM1.tNotaFiscalItensVlrTotal.AsString    := Edit8.Text;
    DM1.tNotaFiscalItensDesconto.AsString    := Edit9.Text;
    DM1.tNotaFiscalItensVlrDesconto.AsString := Edit10.Text;
    if RxDBLookupCombo6.Text <> '' then
      DM1.tNotaFiscalItensCodCSTIPI.AsString := RxDBLookupCombo6.Value
    else
      DM1.tNotaFiscalItensCodCSTIPI.AsString := '';
    DM1.tNotaFiscalItensSitTrib.AsInteger := 0;
    if RxDBLookupCombo13.Text <> '' then
      DM1.tNotaFiscalItensSitTrib.AsInteger := RxDBLookupCombo13.KeyValue;
    DM1.tNotaFiscalItensCalculaComissaoVend.AsBoolean := (ComboBox2.ItemIndex = 0);

    DM1.tNotaFiscalItensVlrIPI.AsFloat       := vValorIPI;
    DM1.tNotaFiscalVlrIPI.AsFloat            := DM1.tNotaFiscalVlrIPI.AsFloat + vValorIPI;
    DM1.tNotaFiscalPesoBruto.AsFloat         := DM1.tNotaFiscalPesoBruto.AsFloat + DM1.tNotaFiscalItenslkPesoBruto.AsFloat *
                                                DM1.tNotaFiscalItensQtd.AsFloat;
    DM1.tNotaFiscalPesoLiquido.AsFloat       := DM1.tNotaFiscalPesoLiquido.AsFloat + DM1.tNotaFiscalItenslkPesoLiquido.AsFloat *
                                                DM1.tNotaFiscalItensQtd.AsFloat;
    DM1.tNotaFiscalItensNumPedido.AsInteger  := vNumPedido;
    DM1.tNotaFiscalItensItemPedido.AsInteger := vItemPedido;

    //Grava a tabela dbPedidoNota
    if DM1.tNotaFiscalItensNumPedido.AsInteger > 0 then
    begin
      DM1.tPedidoNota.SetKey;
      DM1.tPedidoNotaPedido.AsInteger     := DM1.tNotaFiscalItensNumPedido.AsInteger;
      DM1.tPedidoNotaItem.AsInteger       := DM1.tNotaFiscalItensItemPedido.AsInteger;
      DM1.tPedidoNotaNumSeqNota.AsInteger := DM1.tNotaFiscalNumSeq.AsInteger;
      DM1.tPedidoNotaItemNota.AsInteger   := DM1.tNotaFiscalItensItem.AsInteger;
      if DM1.tPedidoNota.GotoKey then
        DM1.tPedidoNota.Edit
      else
      begin
        DM1.tPedidoNota.Insert;
        DM1.tPedidoNotaPedido.AsInteger     := DM1.tNotaFiscalItensNumPedido.AsInteger;
        DM1.tPedidoNotaItem.AsInteger       := DM1.tNotaFiscalItensItemPedido.AsInteger;
        DM1.tPedidoNotaNumSeqNota.AsInteger := DM1.tNotaFiscalNumSeq.AsInteger;
        DM1.tPedidoNotaItemNota.AsInteger   := DM1.tNotaFiscalItensItem.AsInteger;
      end;
      DM1.tPedidoNotaQtdPares.AsInteger := DM1.tNotaFiscalItensQtd.AsInteger;
      DM1.tPedidoNotaDtNota.AsDateTime  := DM1.tNotaFiscalDtEmissao.AsDateTime;
      DM1.tPedidoNota.Post;
      //Verifica o Pedido e o Item
      DM1.tPedidoItem.Edit;
      DM1.tPedidoItemQtdParesRest.AsInteger := DM1.tPedidoItemQtdParesRest.AsInteger - DM1.tNotaFiscalItensQtd.AsInteger;
      DM1.tPedidoItemQtdParesFat.AsInteger  := DM1.tPedidoItemQtdParesFat.AsInteger + DM1.tNotaFiscalItensQtd.AsInteger;
      DM1.tPedidoItemQtdFatAut.AsInteger    := DM1.tPedidoItemQtdFatAut.AsInteger + DM1.tNotaFiscalItensQtd.AsInteger;
      if DM1.tPedidoItemQtdParesRest.AsInteger > 0 then
        DM1.tPedidoItemCopiado.AsBoolean := False
      else
        DM1.tPedidoItemCopiado.AsBoolean := True;
      DM1.tPedidoItem.Post;

      DM1.tPedido.Edit;
      DM1.tPedidoQtdParesRest.AsInteger := DM1.tPedidoQtdParesRest.AsInteger - DM1.tNotaFiscalItensQtd.AsInteger;
      DM1.tPedidoQtdParesFat.AsInteger  := DM1.tPedidoQtdParesFat.AsInteger + DM1.tNotaFiscalItensQtd.AsInteger;
      DM1.tPedidoQtdFatAut.AsInteger    := DM1.tPedidoQtdFatAut.AsInteger + DM1.tNotaFiscalItensQtd.AsInteger;
      if DM1.tPedidoQtdParesRest.AsInteger > 0 then
        DM1.tPedidoCopiado.AsBoolean  := False
      else
        DM1.tPedidoCopiado.AsBoolean  := True;
      DM1.tPedido.Post;
    end;
    if (RxDBComboBox2.ItemIndex = 1) and (DM1.tNotaFiscalSaidaEntrada.AsString = 'S') and (DM1.tMaterialLancaGrade.AsBoolean) then
    begin
      if not tAuxNotaFiscalGrade.IsEmpty then
        DM1.tNotaFiscalItensCodGrade.AsInteger  := tAuxNotaFiscalGradeCodGrade.AsInteger
      else
        DM1.tNotaFiscalItensCodGrade.AsInteger  := 0;
    end;
    DM1.tNotaFiscalItensObsComplementar.AsString := vObsComplementar;

    DM1.tNotaFiscalItensOrigemProd.AsString        := fEmissaoNotaFiscal.vOrigemMerc;
    DM1.tNotaFiscalItensSomaVlrTotalProd.AsBoolean := fEmissaoNotaFiscal.vSomaVlrTotalProd;
    DM1.tNotaFiscalItensAliqPis.AsFloat            := fEmissaoNotaFiscal.vPercPis;
    DM1.tNotaFiscalItensAliqCofins.AsFloat         := fEmissaoNotaFiscal.vPercCofins;
    DM1.tNotaFiscalItensVlrPis.AsFloat             := fEmissaoNotaFiscal.vVlrPis;
    DM1.tNotaFiscalItensVlrCofins.AsFloat          := fEmissaoNotaFiscal.vVlrCofins;
    DM1.tNotaFiscalItensCodPis.AsString            := fEmissaoNotaFiscal.vCodPis;
    DM1.tNotaFiscalItensCodCofins.AsString         := fEmissaoNotaFiscal.vCodCofins;
    DM1.tNotaFiscalItensTipoPis.AsString           := fEmissaoNotaFiscal.vTipoPis;
    DM1.tNotaFiscalItensTipoCofins.AsString        := fEmissaoNotaFiscal.vTipoCofins;
    //09/06/2016
    DM1.tNotaFiscalItensPerc_Importacao.AsFloat    := fEmissaoNotaFiscal.vPercImportacao;
    DM1.tNotaFiscalItensSoma_Automatico_Imp.AsBoolean := fEmissaoNotaFiscal.vSoma_Automatico_Imp;
    if DM1.tNotaFiscalItensSoma_Automatico_Imp.AsBoolean then
      DM1.tNotaFiscalItensVlrAduaneira.AsFloat := fEmissaoNotaFiscal.vVlrAduaneira;

    //Lei 12.741/12
    //ver aqui
    //DM1.tNotaFiscalItensPerc_Tributo.AsFloat       := fEmissaoNotaFiscal.vPercTributo;

    if DM1.tNotaFiscalItensItemPedido.AsInteger > 0 then
      DM1.tNotaFiscalItensITEM_CLIENTE.AsInteger := DM1.tNotaFiscalItensItemPedido.AsInteger
    else
      DM1.tNotaFiscalItensITEM_CLIENTE.AsInteger := DM1.tNotaFiscalItensItem.AsInteger;

    if StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrDesconto.AsFloat)) > 0 then
      DM1.tNotaFiscalTipoDesconto.AsString := 'I';

    Calculo_GeralItem(DM1.tNotaFiscalitensQtd.AsFloat,DM1.tNotaFiscalItensVlrUnit.AsFloat,DM1.tNotaFiscalItensVlrDesconto.AsFloat,DM1.tNotaFiscalItensDesconto.AsFloat,DM1.tNotaFiscalItensVlrTotal.AsFloat,DM1.tNotaFiscalItensGeraDupl.AsBoolean);

    //21/12/2015
    if rxdbEnq_IPI.Text = '' then
      DM1.tNotaFiscalItensID_ENQIPI.Clear
    else
      DM1.tNotaFiscalItensID_ENQIPI.AsInteger := rxdbEnq_IPI.KeyValue;
    //******

    DM1.tNotaFiscalItens.Post;
    DM1.tNotaFiscalItens.Refresh;

    // grava a grade nos itens
    if (RxDBComboBox2.ItemIndex = 1) and (DM1.tNotaFiscalSaidaEntrada.AsString = 'S') and (DM1.tMaterialLancaGrade.AsBoolean) then
    begin
      tAuxNotaFiscalGrade.First;
      while not tAuxNotaFiscalGrade.IsEmpty do
      begin
        DM1.tNotaFiscalGrade.Insert;
        DM1.tNotaFiscalGradeNumseq.AsInteger   := DM1.tNotaFiscalNumSeq.AsInteger;
        DM1.tNotaFiscalGradeItem.AsInteger     := DM1.tNotaFiscalItensItem.AsInteger;
        DM1.tNotaFiscalGradeCodGrade.AsInteger := tAuxNotaFiscalGradeCodGrade.AsInteger;
        DM1.tNotaFiscalGradePosicao.AsInteger  := tAuxNotaFiscalGradePosicao.AsInteger;
        DM1.tNotaFiscalGradeQtd.AsInteger      := tAuxNotaFiscalGradeQtd.AsInteger;
        DM1.tNotaFiscalGrade.Post;
        tAuxNotaFiscalGrade.Delete;
      end;
    end;
    DM1.tNotaFiscalGrade.Refresh;
    Limpa_Edit;
    Query1.Active := False;
    vNumPedido  := 0;
    vItemPedido := 0;
              
    if not DM1.tNotaFiscalItens.IsEmpty then
      RxDBComboBox1.Enabled := False;

    dmDatabase.scoDados.Commit(ID);

  except
    on e: Exception do
      begin
        dmDatabase.scoDados.Rollback(ID);
        raise Exception.Create('Erro ao gravar O ITEM, favor tentar novamente: ' + #13 + e.Message);
      end;
  end;
  FreeAndNil(sds);
end;

procedure TfEmissaoNotaFiscal.Edit7Exit(Sender: TObject);
begin
  if Edit7.Text = '' then
    Edit7.Text := '0';
  if Edit3.Text = '' then
    Edit3.Text := '0';
  Edit8.Text := FloatToStr(StrToFloat(Edit3.Text) * StrToFloat(Edit7.Text));
  Edit9Exit(Sender);
  Edit10Exit(Sender);
end;

procedure TfEmissaoNotaFiscal.Edit9Exit(Sender: TObject);
begin
  if Edit9.Text <> '' then
    begin
      if StrToFloat(Edit9.Text) > 0 then
        begin
          Edit8.Text := FloatToStr(StrToFloat(Edit3.Text) * StrToFloat(Edit7.Text));
          Edit8.Text := FloatToStr(StrToFloat(Edit8.Text) + StrToFloat(Edit8.Text) * StrToFloat(Edit5.Text) / 100);
          Edit10.Text := FloatToStr(StrToFloat(Edit8.Text) * StrToFloat(Edit9.Text) / 100);
          Edit8.Text  := FloatToStr(StrToFloat(Edit8.Text) - StrToFloat(Edit10.Text));
        end;
    end;
end;

procedure TfEmissaoNotaFiscal.Edit10Exit(Sender: TObject);
begin
  if Edit10.Text <> '' then
    begin
      if (Edit9.Text = '') and (StrToFloat(Edit10.Text) > 0) then
        begin
          Edit8.Text  := FloatToStr(StrToFloat(Edit3.Text) * StrToFloat(Edit7.Text));
          Edit8.Text  := FloatToStr(StrToFloat(Edit8.Text) + StrToFloat(Edit8.Text) * StrToFloat(Edit5.Text) / 100);
          Edit8.Text  := FloatToStr(StrToFloat(Edit8.Text) - StrToFloat(Edit10.Text));
        end;
    end;
end;

procedure TfEmissaoNotaFiscal.SpeedButton7Click(Sender: TObject);
begin
  Limpa_Edit;
  Query1.Active := False;
end;

procedure TfEmissaoNotaFiscal.SpeedButton6Click(Sender: TObject);
begin
  if DM1.tUsuarioUf.AsBoolean then
    begin
      fUf := TfUf.Create(Self);
      fUf.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado!');
end;

procedure TfEmissaoNotaFiscal.SpeedButton9Click(Sender: TObject);
var
  ID: TTransactionDesc;
  sds: TSQLDataSet;
  vFlag: Boolean;
begin
  if DM1.tNotaFiscalItens.IsEmpty then
    exit;
  if MessageDlg('Deseja realmente excluir este produto da nota?',mtConfirmation,[mbOK,mbNo],0) = mrNo then
    exit;

  sds := TSQLDataSet.Create(nil);
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;
  sds.SQLConnection := dmDatabase.scoDados;

  ID.TransactionID  := 2;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    vFlag := False;
    while not vflag do
    begin
      try
        sds.Close;
        sds.SQLConnection := dmDatabase.scoDados;
        sds.NoMetadata    := True;
        sds.GetMetadata   := False;
        sds.CommandText := ' UPDATE TABELALOC SET FLAG = 0 ' +
                           ' WHERE TABELA = ' + QuotedStr('NOTAFISCAL');
        sds.ExecSQL();
        vFlag := True;
      except
        vFlag := False;
      end
    end;

    Limpa_Parcelas;
    Excluir_ItemNota('E');
    DM1.tNotaFiscalItens.Delete;

    if DM1.tNotaFiscalItens.IsEmpty then
      DM1.tNotaFiscalTipoDesconto.AsString := '';
    RxDBComboBox1.Enabled := (DM1.tNotaFiscalItens.IsEmpty);
    DM1.tNotaFiscalVlrTotalDesc.Clear;
    DM1.tNotaFiscalPercDesc.Clear;

    dmDatabase.scoDados.Commit(ID);

  except
    on e: Exception do
      begin
        dmDatabase.scoDados.Rollback(ID);
        raise Exception.Create('Erro ao excluir o item da nota, favor tentar novamente: ' + #13 + e.Message);
      end;
  end;
  FreeAndNil(sds);
end;

procedure TfEmissaoNotaFiscal.BitBtn1Click(Sender: TObject);
begin
  vObsComplementar  := '';
  SpeedButton23.Tag := 0;
  BitBtn7.Tag       := 0;
  vPedido           := 0;
  vItemPedido       := 0;
  vItemNota         := 0;
  vMercadoItem      := '';
  Habilita_Desabilita;
  tNotaFiscalIns.IndexFieldNames  := 'Filial;NumSeq';
  DM1.tNotaFiscal.IndexFieldNames := 'Filial;NumSeq';
  DM1.tNotaFiscal.Refresh;
  tNotaFiscalIns.Refresh;
  tNotaFiscalIns.Last;

  // Rocha - NMU
  vCancelarInc := False;
  Grava_NumSeq;
  if vCancelarInc then
  begin
    DM1.tNotaFiscal.Cancel;
    Habilita_Desabilita;
    Verifica_Nota_Cancelada;
    exit;
  end;

  PageControl1.ActivePageIndex := 0;
  DBEdit2.Clear;
  Verifica_Nota_Cancelada;
  RxDBComboBox1.Enabled := True;
  DBEdit26.Text := 'CAIXAS';
  DBDateEdit2.SetFocus;
end;

procedure TfEmissaoNotaFiscal.BitBtn2Click(Sender: TObject);
var
  vFlag: Boolean;
  vAux: Real;
  ID: TTransactionDesc;
  sds: TSQLDataSet;
begin
  if not Verifica_Dados then
    exit;

  PageControl1.ActivePage := TabSheet10;
  Label89.Font.Color := clBlack;
  Label90.Font.Color := clBlack;
  Label91.Font.Color := clBlack;
  Label92.Font.Color := clBlack;
  Label93.Font.Color := clBlack;
  Label94.Font.Color := clBlack;
  Label95.Font.Color := clBlack;

  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  ID.TransactionID  := 2;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    Label89.Font.Color := clRed;
    Label89.Refresh;

    vFlag := False;
    while not vflag do
    begin
      try
        sds.Close;
        sds.SQLConnection := dmDatabase.scoDados;
        sds.NoMetadata    := True;
        sds.GetMetadata   := False;
        sds.CommandText := ' UPDATE TABELALOC SET FLAG = 0 ' +
                           ' WHERE TABELA = ' + QuotedStr('NOTAFISCAL');
        sds.ExecSQL();
        vFlag := True;
      except
        vFlag := False;
      end
    end;

    Label89.Font.Color := clNavy;
    Label89.Refresh;

    Label90.Font.Color := clRed;
    Label90.Refresh;
    TabSheet10.Refresh;

    vCodNatOper := '';
    if DM1.tNatOperacao.Locate('Codigo',DM1.tNotaFiscalCodNatOper.AsInteger,[loCaseInsensitive]) then
      vCodNatOper := DM1.tNatOperacaoCodNatOper.AsString;

    DM1.tNotaFiscalTipo_Consumidor.AsInteger := DM1.tClienteTipo_Consumidor.AsInteger;

    if (BitBtn7.Tag = 0) or (DM1.tNotaFiscalNumNota.AsInteger <= 0) then
    begin
      //aqui fazer a gravação da nota sem passar pelo fnotafiscalconfirma... sempre como normal
      if not ckTelaConfirmacao.Checked then
      begin
        prc_Gravar_Numero_Nota;
      end
      else
      begin
        fEmissaoNotaFiscal.Tag := 0;
        fNotaFiscalConfirma := TfNotaFiscalConfirma.Create(Self);
        fNotaFiscalConfirma.ShowModal;
        if fEmissaoNotaFiscal.Tag = 2 then
          Exit;
      end;
    end;

    Label90.Font.Color := clNavy;
    TabSheet10.Refresh;

    Label91.Font.Color := clRed;
    TabSheet10.Refresh;

    mModelista.EmptyTable;
    //RxDBGrid1.DisableScroll;
    vBaseComisao := 0;
    vFlag        := True;
    RxDBGrid1.DisableScroll;
    DM1.tNotaFiscalItens.First;
    while not DM1.tNotaFiscalItens.Eof do
    begin
      DM1.tNotaFiscalItens.Edit;
      DM1.tNotaFiscalItensNumNota.AsInteger := DM1.tNotaFiscalNumNota.AsInteger;
      DM1.tNotaFiscalItens.Post;
      if (DM1.tNotaFiscalItensNumPedido.AsInteger > 0) and (DM1.tPedido.Locate('Pedido',DM1.tNotaFiscalItensNumPedido.AsInteger,[loCaseInsensitive])) then
      begin
        if DM1.tPedidoItem.Locate('Item',DM1.tNotaFiscalItensItemPedido.AsInteger,[loCaseInsensitive]) then
        begin
          if DM1.tPedidoNota.Locate('NumSeqNota;ItemNota',VarArrayOf([DM1.tNotaFiscalNumSeq.AsInteger,DM1.tNotaFiscalItensItem.AsInteger]),[locaseinsensitive]) then
          begin
            DM1.tPedidoNota.Edit;
            DM1.tPedidoNotaNumNota.AsInteger := DM1.tNotaFiscalNumNota.AsInteger;
            DM1.tPedidoNota.Post;
          end;
        end;
      end;
      if DM1.tNotaFiscalItensCalculaComissaoVend.AsBoolean then
        vBaseComisao := vBaseComisao + DM1.tNotaFiscalItensVlrTotal.AsFloat
      else
        vFlag := False;
      if DM1.tNotaFiscalItensComissaoMod.AsFloat > 0 then
      begin
        if mModelista.Locate('CodModelista;PercComissao',VarArrayOf([DM1.tNotaFiscalItensCodModelista.AsInteger,DM1.tNotaFiscalItensComissaoMod.AsCurrency]),[locaseinsensitive]) then
          mModelista.Edit
        else
        begin
          mModelista.Insert;
          mModelistaCodModelista.AsInteger  := DM1.tNotaFiscalItensCodModelista.AsInteger;
          mModelistaPercComissao.AsCurrency := DM1.tNotaFiscalItensComissaoMod.AsCurrency
        end;
        mModelistaVlrBase.AsCurrency     := mModelistaVlrBase.AsCurrency + DM1.tNotaFiscalItensVlrTotal.AsCurrency;
        mModelistaVlrComissao.AsCurrency := StrToCurr(FormatCurr('0.00',(mModelistaVlrBase.AsCurrency * mModelistaPercComissao.AsCurrency) / 100));
        mModelista.Post;
      end;
      if (Copy(vCodNatOper,1,1) <> '6') and (Copy(vCodNatOper,1,1) <> '5') then
        if DM1.tNatOperacao.Locate('Codigo',DM1.tNotaFiscalItensNatOper.AsInteger,[loCaseInsensitive]) then
          vCodNatOper := DM1.tNatOperacaoCodNatOper.AsString;
      DM1.tNotaFiscalItens.Next;
    end;
    Label91.Font.Color := clNavy;
    TabSheet10.Refresh;

    RxDBGrid1.EnableScroll;

    if vBaseComisao > 0 then
    begin
      if DM1.tNotaFiscalCodVendedor.AsInteger > 0 then
      begin
        if vFlag then
        begin
          vBaseComisao := DM1.tNotaFiscalVlrTotalNota.AsFloat;
          DM1.tNotaFiscalPercBaseComissao.AsFloat := 100;
        end
        else
        begin
          vBaseComisao := vBaseComisao - DM1.tNotaFiscalVlrTotalDesc.AsFloat;
          vAux         := StrToFloat(FormatFloat('0.00000',(vBaseComisao / DM1.tNotaFiscalVlrTotalNota.AsFloat) * 100));
          DM1.tNotaFiscalPercBaseComissao.AsFloat := StrToFloat(FormatFloat('0.00000',vAux));
        end;
      end
      else
      begin
        MessageDlg('*** Existe comissão para calcular, selecione o vendedor!', mtError, [mbOk], 0);
      end;
    end
    else
    begin
      DM1.tNotaFiscalCodVendedor.AsInteger  := 0;
      DM1.tNotaFiscalPercComissao.AsFloat   := 0;
    end;

    DM1.tNotaFiscalVersaoNFe.AsString          := DM1.tParametrosVersaoNFe.AsString;
    DM1.tNotaFiscalIdentVersaoEmissao.AsString := DM1.tParametrosVersaoEmissaoNFe.AsString;
    DM1.tNotaFiscalCodRegimeTrib.AsInteger     := DM1.tFilialCodRegimeTrib.AsInteger;
    if (Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '2') or (Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '3')  or
       (Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '5') then
    begin
      fNotaFiscalContingencia := TfNotaFiscalContingencia.Create(Self);
      fNotaFiscalContingencia.ShowModal;
    end;
    //*************

    if (DM1.tNotaFiscalTipoNota.AsInteger = 1) and (DM1.tNotaFiscalCodVendedor.AsInteger > 0) and
       (DM1.tNotaFiscalPercComissao.AsFloat > 0) and (vBaseComisao > 0) and
       ((DM1.tNotaFiscallkTipoComissao.AsString = 'N') or ((DM1.tNotaFiscallkTipoComissao.AsString = 'D')
        and (DM1.tNotaFiscallkPagarParteNaNota.AsBoolean))) then
    begin
      Label92.Font.Color := clRed;
      TabSheet10.Refresh;
      Grava_ExtComissao(1);
      if DM1.tNotaFiscalSituacao.AsInteger = 2 then
        Grava_ExtComissao(2);
      if DM1.tNotaFiscallkTipoComissao.AsString = 'N' then
        Lanc_Diferenca;
      Label92.Font.Color := clNavy;
      TabSheet10.Refresh;

    end;
    if DM1.tNotaFiscal.State in [dsEdit,dsInsert] then
      DM1.tNotaFiscal.Post;
    if DM1.tNotaFiscalItens.State in [dsEdit,dsInsert] then
      DM1.tNotaFiscalItens.Post;
    //Grava a nota de devolucao
    if DM1.tNotaFiscalNumNotaOrigem.AsInteger > 0 then
    begin
      tNotaFiscalDev.IndexFieldNames := 'NumNota';
      tNotaFiscalDev.SetKey;
      tNotaFiscalDevNumNota.AsInteger := DM1.tNotaFiscalNumNotaOrigem.AsInteger;
      if tNotaFiscalDev.GotoKey then
      begin
        tNotaFiscalDev.Edit;
        tNotaFiscalDevNumNotaDevol.AsInteger := DM1.tNotaFiscalNumNota.AsInteger;
        tNotaFiscalDev.Post;
      end;
    end;
    Label93.Font.Color := clRed;
    TabSheet10.Refresh;
    Grava_Pgto('E');
    Desfaz_ExtComissao_Modelista;
    Le_mModelista;
    Label93.Font.Color := clNavy;
    TabSheet10.Refresh;
    DBEdit35.Enabled         := True;
    BitBtn7.Tag := 0;
    DBEdit19.Enabled := False;
    vItemNota := 0;
    vMercadoItem := '';
    Habilita_Desabilita;
    BitBtn4.Enabled := False;

    dmDatabase.scoDados.Commit(ID);

    Label94.Font.Color := clNavy;
    TabSheet10.Refresh;

  except
    on e: Exception do
      begin
        dmDatabase.scoDados.Rollback(ID);
        raise Exception.Create('Erro ao gravar a NOTA, favor tentar novamente: ' + #13 + e.Message);
      end;
  end;
  FreeAndNil(sds);

  Label95.Font.Color := clRed;
  TabSheet10.Refresh;

  qVerificaCReceber.Close;
  qVerificaCReceber.ParamByName('NumSeqNota').AsInteger := DM1.tNotaFiscalNumSeq.AsInteger;
  qVerificaCReceber.ParamByName('Filial').AsInteger     := DM1.tNotaFiscalFilial.AsInteger;
  qVerificaCReceber.Open;
  qVerificaCReceber.First;
  DM1.tNotaFiscal.Edit;
  if DM1.tNotaFiscalCondPgto.AsString = 'N' then
    vAux := StrToFloat(FormatFloat('0.00',0))
  else
    vAux := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalDupl.AsFloat));

  if (StrToFloat(FormatFloat('0.00',qVerificaCReceberVlrParcCReceber.AsFloat)) <> StrToFloat(FormatFloat('0.00',vAux))) then
  begin
    ShowMessage('Valor das parcelas diferente do total das duplicatas, favor alterar a nota e confirmar novamente!');
    DM1.tNotaFiscalCReceberOK.AsBoolean := False;
  end
  else
    DM1.tNotaFiscalCReceberOK.AsBoolean := True;
  DM1.tNotaFiscal.post;
  Label95.Font.Color := clNavy;
  TabSheet10.Refresh;

  if not DM1.tNotaFiscalCReceberOK.AsBoolean then
    BitBtn13Click(Sender);

  DM1.tNotaFiscal.Refresh;
  DM1.tNotaFiscalItens.Refresh;
  DM1.tNotaFiscalParc.Refresh;
  tNotaFiscalIns.Refresh;

  MessageDlg('*** Nota Gravada!', mtInformation, [mbOk], 0);

  PageControl1.ActivePage := Produtos;
end;

procedure TfEmissaoNotaFiscal.BitBtn4Click(Sender: TObject);
var
  vNumSeqAux: Integer;
  ID: TTransactionDesc;
  sds: TSQLDataSet;
  vFlag: Boolean;
begin
  if DM1.tNotaFiscal.State in [dsBrowse] then
  begin
    ShowMessage('Nota não pode ser excluida!');
    exit;
  end;
  if trim(DM1.tNotaFiscalNFeChaveAcesso.AsString) <> '' then
  begin
    ShowMessage('Nota não pode ser excluida, pois já possui chave de acesso!');
    DM1.tNotaFiscal.Cancel;
    Close;
    exit;
  end;

  DBEdit35.Enabled := True;
  BitBtn7.Tag      := 1;
  tNotaFiscalIns.Refresh;
  tNotaFiscalIns.Last;

  prc_Excluir_Nota;

  Habilita_Desabilita;
  vItemNota := 0;
  vMercadoItem := '';
  Verifica_Nota_Cancelada;
  Edit1.Clear; Edit2.Clear; Edit3.Clear; Edit4.Clear; Edit5.Clear;
  Edit7.Clear; Edit8.Clear; Edit9.Clear; Edit10.Clear;
  RxDBLookupCombo4.ClearValue;
  RxDBLookupCombo13.ClearValue;
  RxDBComboBox1.Enabled := True;
  
end;

procedure TfEmissaoNotaFiscal.SpeedButton11Click(Sender: TObject);
begin
  RxCalculator1.Execute;
end;

procedure TfEmissaoNotaFiscal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    CanClose := True;
end;

procedure TfEmissaoNotaFiscal.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  DM1.tNotaFiscal.Refresh;
  Verifica_Nota_Cancelada;
  if PageControl1.ActivePage = TabSheet1 then
  begin
    DM1.tCliente.IndexFieldNames := 'Codigo';
    DM1.tCliente.FindKey([DM1.tNotaFiscalCodCli.AsInteger]);
  end;
end;

procedure TfEmissaoNotaFiscal.RadioButton1Click(Sender: TObject);
begin
  RxDBLookupCombo7.ClearValue;
  RxDBLookupCombo7.DataField := 'CodNatOper';
  if MessageDlg('Deseja realmente excluir os produtos com natureza de operação?',mtConfirmation,
     [mbOK,mbNo],0) = mrOK then
    begin
      DM1.tNotaFiscalItens.Filtered := False;
      DM1.tNotaFiscalItens.Filter   := 'NatOper = '''+IntToStr(RxDBLookupCombo7.KeyValue)+'''';
      DM1.tNotaFiscalItens.Filtered := True;
      DM1.tNotaFiscalItens.First;
      while not DM1.tNotaFiscalItens.EOF do
        begin
          DM1.tNotaFiscalBaseICMS.AsFloat      := DM1.tNotaFiscalBaseICMS.AsFloat -
                                                  DM1.tNotaFiscalItensBaseICMS.AsFloat;
          DM1.tNotaFiscalVlrICMS.AsFloat       := DM1.tNotaFiscalVlrICMS.AsFloat -
                                                  DM1.tNotaFiscalItensVlrICMS.AsFloat;
          DM1.tNotaFiscalVlrTotalNota.AsFloat  := DM1.tNotaFiscalVlrTotalNota.AsFloat -
                                                  DM1.tNotaFiscalItensVlrTotal.AsFloat;
          DM1.tNotaFiscalVlrTotalItens.AsFloat := DM1.tNotaFiscalVlrTotalItens.AsFloat -
                                                  DM1.tNotaFiscalItensVlrTotal.AsFloat;
          if DM1.tNotaFiscalItensIPI.AsFloat > 0 then
             DM1.tNotaFiscalVlrIPI.AsFloat := DM1.tNotaFiscalVlrIPI.AsFloat -
                                              DM1.tNotaFiscalItensQtd.AsFloat *
                                              DM1.tNotaFiscalItensVlrUnit.AsFloat *
                                              DM1.tNotaFiscalItensIPI.AsFloat / 100;
          DM1.tNotaFiscalGrade.First;
          while not DM1.tNotaFiscalGrade.Eof do
            DM1.tNotaFiscalGrade.Delete;

          DM1.tNotaFiscalItens.Delete;
        end;
      DM1.tNotaFiscalItens.Filtered := False;
    end;
end;

procedure TfEmissaoNotaFiscal.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Edit3.SetFocus
  else
  if (Key = Vk_F5) and (DM1.tNotaFiscal.State in [dsEdit,dsInsert]) then
    prc_Chamar_Sel_Produto;
end;

procedure TfEmissaoNotaFiscal.BitBtn8Click(Sender: TObject);
var
  vValorDividir, vValorPrest, vValorVariavel: Currency;
  vValorVarTotal, vValorNotaTotal: string;
  vParcela: Integer;
begin
  if RxDBLookupCombo2.Text = '' then
    ShowMessage('Deve haver um prazo de pagamento escolhido!')
  else
    begin
      if DM1.tCondPgtoPrazoVista.AsString = 'V' then
        ShowMessage('Esta condição não pode gerar contas!')
      else
        begin
          DM1.tNotaFiscalParc.First;
          if not DM1.tNotaFiscalParc.IsEmpty then
            while not DM1.tNotaFiscalParc.Eof do
              DM1.tNotaFiscalParc.Delete;
          //vValorDividir := DM1.tNotaFiscalVlrTotalNota.AsCurrency -
          vValorDividir := DM1.tNotaFiscalVlrTotalDupl.AsCurrency -
                           DM1.tNotaFiscalEntrada.AsCurrency;
          vValorPrest   := vValorDividir / DM1.tCondPgtoItem.RecordCount;
          DM1.tCondPgtoItem.First;
          vParcela := 0;
          while not DM1.tCondPgtoItem.EOF do
            begin

              DM1.tNotaFiscalParc.Insert;
              Inc(vParcela);
              DM1.tNotaFiscalParcParcela.AsInteger := vParcela;

              DM1.tNotaFiscalParcNumSeq.AsInteger  := DM1.tNotaFiscalNumSeq.AsInteger;

              DM1.tNotaFiscalParcVlrVenc.AsString  := FormatFloat('0.00',vValorPrest);
              DM1.tNotaFiscalParcDtVenc.AsDateTime := DM1.tNotaFiscalDtEntr.AsDateTime + DM1.tCondPgtoItemQtdDias.AsInteger;
              //29/07/2018   NFe 4.00
              if DM1.tNotaFiscalCodTipoCobr.AsInteger > 0 then
                DM1.tNotaFiscalParcCodTipoCobr.AsInteger := DM1.tNotaFiscalCodTipoCobr.AsInteger;
                
              //******************
              DM1.tNotaFiscalParc.Post;
              DM1.tCondPgtoItem.Next;
            end;
          vValorVariavel := 0;
          DM1.tNotaFiscalParc.First;
          while not DM1.tNotaFiscalParc.Eof do
            begin
              if DM1.tNotaFiscalParcParcela.AsInteger < 10 then
                vValorVariavel := vValorVariavel + DM1.tNotaFiscalParcVlrVenc.AsCurrency;
              DM1.tNotaFiscalParc.Next;
            end;
          vValorVarTotal  := FormatFloat('0.00',vValorVariavel);
          vValorNotaTotal := FormatFloat('0.00',vValorDividir);
          vValorVariavel  := StrToFloat(vValorNotaTotal) - StrToFloat(vValorVarTotal);
          // Verifica parcelas C200
        if DM1.tNotaFiscalSituacao.AsString = '2' then
          DM1.tNotaFiscalParc.RecNo := DM1.tCondPgtoItem.RecordCount
        else
          DM1.tNotaFiscalParc.Last;
          DM1.tNotaFiscalParc.Edit;
          DM1.tNotaFiscalParcVlrVenc.AsCurrency := DM1.tNotaFiscalParcVlrVenc.AsCurrency +
                                                   vValorVariavel;
          //29/07/2018   NFe 4.00
          if DM1.tNotaFiscalCodTipoCobr.AsInteger > 0 then
            DM1.tNotaFiscalParcCodTipoCobr.AsInteger := DM1.tNotaFiscalCodTipoCobr.AsInteger;
          //******************
          
          DM1.tNotaFiscalParc.Post;

          {********** Grava parcelas C200 *************}
          {********************************************}
          if DM1.tNotaFiscalSituacao.AsString = '2' then
            begin
              vValorDividir := 0;
              DM1.tNotaFiscalItens.First;
              while not DM1.tNotaFiscalItens.Eof do
                begin
                  if (DM1.tNotaFiscalItensNumPedido.AsInteger > 0) and (DM1.tNotaFiscalItensItemPedido.AsInteger > 0) then
                    begin
                      tPedidoItem.SetKey;
                      tPedidoItemPedido.AsInteger := DM1.tNotaFiscalItensNumPedido.AsInteger;
                      tPedidoItemItem.AsInteger   := DM1.tNotaFiscalItensItemPedido.AsInteger;
                      if tPedidoItem.GotoKey then
                        begin
                          if (tPedidoItemPreco.AsCurrency - tPedidoItemVlrDesconto.AsCurrency) > DM1.tNotaFiscalItensVlrUnit.AsCurrency then
                            vValorDividir := vValorDividir + (((tPedidoItemPreco.AsCurrency - tPedidoItemVlrDesconto.AsCurrency) - DM1.tNotaFiscalItensVlrUnit.AsCurrency) *
                                             DM1.tNotaFiscalItensQtd.AsInteger);
                        end;
                    end;
                  DM1.tNotaFiscalItens.Next;
                end;
              if vValorDividir > 0 then
                begin
                  vValorPrest   := vValorDividir / DM1.tCondPgtoItem.RecordCount;
                  DM1.tCondPgtoItem.First;
                  vParcela := 10;
                  while not DM1.tCondPgtoItem.EOF do
                    begin
                      DM1.tNotaFiscalParc.Insert;
                      Inc(vParcela);
                      DM1.tNotaFiscalParcParcela.AsInteger := vParcela;
                      DM1.tNotaFiscalParcVlrVenc.AsString  := FormatFloat('0.00',vValorPrest);
                      DM1.tNotaFiscalParcDtVenc.AsDateTime := DM1.tNotaFiscalDtEntr.AsDateTime + DM1.tCondPgtoItemQtdDias.AsInteger;
                      //29/07/2018   NFe 4.00
                      if DM1.tNotaFiscalCodTipoCobr.AsInteger > 0 then
                        DM1.tNotaFiscalParcCodTipoCobr.AsInteger := DM1.tNotaFiscalCodTipoCobr.AsInteger;
                      //******************
                      DM1.tNotaFiscalParc.Post;
                      DM1.tCondPgtoItem.Next;
                    end;
                  vValorVariavel := 0;
                  DM1.tNotaFiscalParc.First;
                  while not DM1.tNotaFiscalParc.Eof do
                    begin
                      if DM1.tNotaFiscalParcParcela.AsInteger > 10 then
                        vValorVariavel := vValorVariavel + DM1.tNotaFiscalParcVlrVenc.AsCurrency;
                      DM1.tNotaFiscalParc.Next;
                    end;
                  vValorVarTotal  := FormatFloat('0.00',vValorVariavel);
                  vValorNotaTotal := FormatFloat('0.00',vValorDividir);
                  vValorVariavel  := StrToFloat(vValorNotaTotal) - StrToFloat(vValorVarTotal);
                  DM1.tNotaFiscalParc.Last;
                  DM1.tNotaFiscalParc.Edit;
                  DM1.tNotaFiscalParcVlrVenc.AsCurrency := DM1.tNotaFiscalParcVlrVenc.AsCurrency +
                                                           vValorVariavel;
                  //29/07/2018   NFe 4.00
                  if DM1.tNotaFiscalCodTipoCobr.AsInteger > 0 then
                    DM1.tNotaFiscalParcCodTipoCobr.AsInteger := DM1.tNotaFiscalCodTipoCobr.AsInteger;
                  //******************

                  DM1.tNotaFiscalParc.Post;
                end;
            end;
        {********Fim da gravação do C200*********}
        {****************************************}
        end;
    end;
end;

procedure TfEmissaoNotaFiscal.RxDBLookupCombo2DropDown(Sender: TObject);
begin
  DM1.tCondPgto.IndexFieldNames := 'Nome';
end;

procedure TfEmissaoNotaFiscal.SpeedButton16Click(Sender: TObject);
begin
  if DM1.tUsuarioCondPgto.AsBoolean then
    begin
      fCondPgto := TfCondPgto.Create(Self);
      fCondPgto.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado!');
end;

procedure TfEmissaoNotaFiscal.SpeedButton14Click(Sender: TObject);
begin
  if DM1.tUsuarioProduto.AsBoolean then
    begin
      fProduto := TfProduto.Create(Self);
      fProduto.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado!');
end;

procedure TfEmissaoNotaFiscal.SpeedButton17Click(Sender: TObject);
begin
  vNumPedido  := 0;
  vItemPedido := 0;
  fBuscaPedido := TfBuscaPedido.Create(Self);
  fBuscaPedido.ShowModal;
end;

procedure TfEmissaoNotaFiscal.DBRadioGroup1Change(Sender: TObject);
begin
  if DBRadioGroup1.ItemIndex = 1 then
  begin
    DBRadioGroup2.ItemIndex := 2;
    if not DM1.tNotaFiscalParc.IsEmpty then
    begin
      DM1.tNotaFiscalParc.First;
      while not DM1.tNotaFiscalParc.Eof do
        DM1.tNotaFiscalParc.Delete;
    end;
  end;
end;

procedure TfEmissaoNotaFiscal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Shift = [ssCtrl]) and (Key = 87)) then
  begin
    Label101.Visible := not(Label101.Visible);
    DBEdit56.Visible := not(DBEdit56.Visible);
    if (DM1.tNotaFiscal.State in [dsEdit,dsInsert]) then
      DBEdit19.Enabled := not(DBEdit19.Enabled)
    else
      BitBtn13.Visible := not(BitBtn13.Visible);
  end;
  if (Shift = ([ssAlt])) and (Key = 101) then
  begin
    fAgendaTelef := TfAgendaTelef.Create(Self);
    fAgendaTelef.ShowModal;
  end;
  if (Key = Vk_F2) and (DM1.tNotaFiscal.State in [dsBrowse]) then
  begin
    fConsNotaFiscal := TfConsNotaFiscal.Create(Self);
    fConsNotaFiscal.ShowModal;
    Verifica_Nota_Cancelada;
  end;
end;

procedure TfEmissaoNotaFiscal.SpeedButton19Click(Sender: TObject);
begin
  if DM1.tUsuarioPlanoCtas.AsBoolean then
    begin
      fPlanoContas := TfPlanoContas.Create(Self);
      fPlanoContas.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado!');
end;

procedure TfEmissaoNotaFiscal.RxDBLookupCombo3Enter(Sender: TObject);
begin
  DM1.tPlanoContas.IndexFieldNames := 'Descricao';
end;

procedure TfEmissaoNotaFiscal.Edit1Enter(Sender: TObject);
begin
  if RxDBComboBox2.ItemIndex = 1 then
    DM1.tMaterial.IndexFieldNames := 'Codigo'
  else
  //if RxDBComboBox2.ItemIndex = 0 then
    DM1.tProduto.IndexFieldNames := 'Referencia';
end;

procedure TfEmissaoNotaFiscal.SpeedButton4Click(Sender: TObject);
begin
  if DM1.tUsuarioMaterial.AsBoolean then
    begin
      fMaterial := TfMaterial.Create(Self);
      fMaterial.ShowModal;
      DM1.tMaterial.Refresh;
      DM1.tMaterial.IndexFieldNames := 'Nome';
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado!');
end;

procedure TfEmissaoNotaFiscal.RxDBLookupCombo1Exit(Sender: TObject);
begin
  if (Edit1.Text <> '') or (RzDBLookupComboBox1.Text <> '') then
    begin
      if RxDBComboBox2.ItemIndex = 0 then
        begin
          Edit1.Text := DM1.tProdutoReferencia.AsString;
          Edit1.OnExit(Sender);
        end
      else
      if RxDBComboBox2.ItemIndex = 1 then
        begin
          Edit1.Text := DM1.tMaterialCodigo.AsString;
          Edit1.OnExit(Sender);
        end;
    end;
end;

procedure TfEmissaoNotaFiscal.RxDBLookupCombo1Enter(Sender: TObject);
begin
  if RxDBComboBox2.ItemIndex = 0 then
    DM1.tProduto.IndexFieldNames := 'Nome'
  else
  if RxDBComboBox2.ItemIndex = 1 then
    DM1.tMaterial.IndexFieldNames := 'Nome';
end;

procedure TfEmissaoNotaFiscal.SpeedButton5Click(Sender: TObject);
begin
  if DM1.tUsuarioSitTrib.AsBoolean then
    begin
      if DM1.tFilialSimples.AsBoolean then
      begin
        fSitTributariaSimples := TfSitTributariaSimples.Create(Self);
        fSitTributariaSimples.ShowModal;
      end
      else
      begin
        fSitTributaria := TfSitTributaria.Create(Self);
        fSitTributaria.ShowModal;
      end;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado!');
end;

procedure TfEmissaoNotaFiscal.Edit2Exit(Sender: TObject);
begin
  if not DM1.tNatOperacaoIcms.AsBoolean then
    begin
      if Edit4.Text = '' then
        Edit4.Text := '0';
    end;
  if (RxDBComboBox2.ItemIndex = 1) and (DM1.tNotaFiscalSaidaEntrada.AsString = 'S') and (DM1.tMaterialLancaGrade.AsBoolean) then
    begin
      fNotaFiscalGrade := TfNotaFiscalGrade.Create(Self);
      fNotaFiscalGrade.ShowModal;
    end;
end;

procedure TfEmissaoNotaFiscal.DBRadioGroup1Click(Sender: TObject);
begin
  if DBRadioGroup1.ItemIndex = 0 then
    begin
      DBEdit11.Text  := '';
      DBEdit11.ReadOnly := True;
      DBEdit11.TabStop  := False;
    end
  else
  if DBRadioGroup1.ItemIndex = 1 then
    begin
      DBEdit11.ReadOnly := False;
      DBEdit11.TabStop  := True;
    end;
end;

procedure TfEmissaoNotaFiscal.DBEdit11Exit(Sender: TObject);
begin
  //*** Verifica se é devolução da empresa
  if DM1.tNotaFiscalCodNatOper.AsInteger < 1 then
    begin
      ShowMessage('É obrigatório informar a natureza de operação antes da nota de origem!');
      DBEdit11.Clear;
      RxDBLookupCombo7.SetFocus;
    end  
  else
    begin
      if DM1.tNotaFiscalNumNotaOrigem.AsInteger > 0 then
        begin
          tNotaFiscalDev.IndexFieldNames := 'NumNota';
          tNotaFiscalDev.SetKey;
          tNotaFiscalDevNumNota.AsInteger := DM1.tNotaFiscalNumNotaOrigem.AsInteger;
          if not tNotaFiscalDev.GotoKey then
            begin
              ShowMessage('Nota não cadastrada!');
              if DM1.tNotaFiscalNumNotaOrigem.AsInteger < 19273 then
                begin
                  if (MessageDlg('Deseja cadastra-la?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
                    RxDBLookupCombo8.SetFocus
                  else
                    begin
                      DBEdit11.SetFocus;
                      DBEdit11.Clear;
                    end;
                end
              else
                begin
                  DBEdit11.SetFocus;
                  DBEdit11.Clear;
                end;
            end
          else
          if tNotaFiscalDevSaidaEntrada.AsString = 'E' then
            begin
              ShowMessage('Nota não é de saida!');
              DM1.tNotaFiscalNumNotaOrigem.AsString := '';
              DBEdit11.SetFocus;
            end
          else
          if tNotaFiscalDevNumNotaDevol.AsInteger > 0 then
            begin
              ShowMessage('Esta nota já foi devolvida na nota de entrada nº ' + tNotaFiscalDevNumNotaDevol.AsString);
              DM1.tNotaFiscalNumNotaOrigem.AsString := '';
              DBEdit11.SetFocus;
            end
          else
            begin
              DM1.tNotaFiscalCodCli.AsInteger       := tNotaFiscalDevCodCli.AsInteger;
              RxDBLookupCombo8Change(Sender);
              DM1.tNotaFiscalCodVendedor.AsInteger  := tNotaFiscalDevCodVendedor.AsInteger;
              DM1.tNotaFiscalPercComissao.AsFloat   := tNotaFiscalDevPercComissao.AsFloat;
              DM1.tNotaFiscalCondPgto.AsString      := 'N';
              DM1.tNotaFiscalSituacao.AsInteger     := tNotaFiscalDevSituacao.AsInteger;
              DM1.tNotaFiscalCodTransp.AsInteger    := tNotaFiscalDevCodTransp.AsInteger;
              DM1.tNotaFiscalEmitDest.AsInteger     := tNotaFiscalDevEmitDest.AsInteger;
              DM1.tNotaFiscalPesoBruto.AsFloat      := tNotaFiscalDevPesoBruto.AsFloat;
              DM1.tNotaFiscalPesoLiquido.AsFloat    := tNotaFiscalDevPesoLiquido.AsFloat;
              //Copia os itens da nota de origem
              tNotaFiscalItensDev.First;
              while not tNotaFiscalItensDev.Eof do
                begin
                  Edit1.Text  := tNotaFiscalItensDevReferencia.AsString;
                  Edit1Exit(Sender);
                  if tNotaFiscalItensDevCodCor.AsInteger > 0 then
                    RxDBLookupCombo4.KeyValue := tNotaFiscalItensDevCodCor.AsInteger;
                  Edit2.Text := tNotaFiscalItensDevUnidade.AsString;
                  Edit3.Text := tNotaFiscalItensDevQtd.AsString;
                  Edit7.Text := tNotaFiscalItensDevVlrUnit.AsString;
                  Edit7Exit(Sender);
                  BitBtn6Click(Sender);
                  tNotaFiscalItensDev.Next;
                end;
            end;
        end;
    end;
end;

procedure TfEmissaoNotaFiscal.BitBtn7Click(Sender: TObject);
var
  vPag: String[1];
  vFlag: Boolean;
  ID: TTransactionDesc;
  sds: TSQLDataSet;
begin
  vObsComplementar := '';
  if (DM1.tNotaFiscalNFeProtocolo.AsString <> '') or (trim(DM1.tNotaFiscalNFeChaveAcesso.AsString) <> '') then
  begin
    MessageDlg('Não é permitido alterar esta nota!'+#13+#10+'Nota fiscal já enviada!', mtWarning, [mbOK], 0);
    exit;
  end;
  if DM1.tNotaFiscalCancelada.AsBoolean then
    exit;

  SpeedButton23.Tag := 0;
  BitBtn7.Tag       := 1;
  DBEdit35.Enabled  := False;
  if (DM1.tNotaFiscalCodCli.AsInteger > 0) and (fnc_Verifica_Pagamento = 'S') then
    exit;

  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  ID.TransactionID  := 2;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    vFlag := False;
    while not vflag do
    begin
      try
        sds.Close;
        sds.SQLConnection := dmDatabase.scoDados;
        sds.NoMetadata    := True;
        sds.GetMetadata   := False;
        sds.CommandText := ' UPDATE TABELALOC SET FLAG = 0 ' +
                           ' WHERE TABELA = ' + QuotedStr('NOTAFISCAL');
        sds.ExecSQL();
        vFlag := True;
      except
        vFlag := False;
      end
    end;

    vEncComissao := False;
    if (DM1.tNotaFiscalCodVendedor.AsInteger > 0) and (DM1.tNotaFiscalNroLancExtComissao.AsInteger > 0) then
      DM1.Verifica_ComissaoEnc(DM1.tNotaFiscalCodVendedor.AsInteger,DM1.tNotaFiscalDtEmissao.AsDateTime);
    if not vEncComissao then
    begin
      Desfaz_ExtComissao;
      Desfaz_ExtComissao_Modelista;
      DM1.tNotaFiscalItens.First;
      {while not DM1.tNotaFiscalItens.Eof do
      begin
        Excluir_ItemNota('A');
        DM1.tNotaFiscalItens.Next;
      end;}
      if DM1.tNotaFiscalCodCli.AsInteger > 0 then
        Exclui_Pgto('E');
      DM1.tNotaFiscal.Edit;
      Habilita_Desabilita;
      BitBtn4.Enabled := False;
      DBDateEdit2.SetFocus;
    end;

    dmDatabase.scoDados.Commit(ID);

  except
    on e: Exception do
      begin
        dmDatabase.scoDados.Rollback(ID);
        raise Exception.Create('Erro ao gravar a NOTA, favor tentar novamente: ' + #13 + e.Message);
      end;
  end;
  FreeAndNil(sds);
    
  DBRadioGroup1Click(Sender);
  RxDBComboBox2Exit(Sender);
end;

procedure TfEmissaoNotaFiscal.PageControl1Enter(Sender: TObject);
begin
  if PageControl1.ActivePage = TabSheet1 then
    begin
      if DM1.tNotaFiscalCodCli.AsInteger > 0 then
        begin
          DM1.tCliente.IndexFieldNames := 'Codigo';
          DM1.tCliente.FindKey([DM1.tNotaFiscalCodCli.AsInteger]);
        end;
    end;
end;

procedure TfEmissaoNotaFiscal.TabSheet1Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Codigo';
  DM1.tCliente.FindKey([DM1.tNotaFiscalCodCli.AsInteger]);
end;

procedure TfEmissaoNotaFiscal.RxDBLookupCombo7Exit(Sender: TObject);
begin
  if RxDBLookupCombo7.Text <> '' then
    RxDBLookupCombo15.KeyValue := RxDBLookupCombo7.KeyValue;
end;

procedure TfEmissaoNotaFiscal.RxDBLookupCombo7DropDown(Sender: TObject);
begin
  DM1.tNatOperacao.IndexFieldNames := 'CodNatOper';
end;

procedure TfEmissaoNotaFiscal.RxDBLookupCombo8KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_F3 then
  begin
    if RxDBLookupCombo8.LookupDisplay = 'Nome' then
    begin
       RxDBLookupCombo8.CloseUp(True);
       RxDBLookupCombo8.LookupDisplay := 'Fantasia';
       DM1.tCliente.IndexFieldNames   := 'Fantasia';
       DM1.tCliente.Refresh;
    end
    else
    if RxDBLookupCombo8.LookupDisplay = 'Fantasia' then
    begin
      RxDBLookupCombo8.CloseUp(True);
      RxDBLookupCombo8.LookupDisplay := 'Nome';
      DM1.tCliente.IndexFieldNames   := 'Nome';
      DM1.tCliente.Refresh;
    end;
    Label53.Caption := RxDBLookupCombo8.LookupDisplay;
  end
  else
  if key = vk_F5 then
  begin
    vCodCliente_Pos := 0;
    fSel_Cliente := TfSel_Cliente.Create(Self);
    fSel_Cliente.ShowModal;
    if vCodCliente_Pos > 0 then
      RxDBLookupCombo8.KeyValue := vCodCliente_Pos;
  end;
end;

procedure TfEmissaoNotaFiscal.RxDBLookupCombo8Exit(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames   := 'Codigo';
  if RxDBLookupCombo8.Text <> '' then
  begin
    DM1.tCliente.FindKey([RxDBLookupCombo8.KeyValue]);
    //3.10  16/03/2015
    if RxDBLookupCombo8.KeyValue <> vCodCliente_Ant then
      DM1.tNotaFiscalTipo_Consumidor.AsInteger := DM1.tClienteTipo_Consumidor.AsInteger;
    //***********

    //3.10  16/03/2015
    if DM1.tClienteUF.AsString = 'EX' then
      DM1.tNotaFiscalTIPO_DESTINO_OPERACAO.AsInteger := 3
    else
    if DM1.tClienteUF.AsString = DM1.tFilialEstado.AsString then
      DM1.tNotaFiscalTIPO_DESTINO_OPERACAO.AsInteger := 1
    else
      DM1.tNotaFiscalTIPO_DESTINO_OPERACAO.AsInteger := 2;
    //**********
  end;

  PageControl1.ActivePageIndex := 0;
  RxDBLookupCombo8.LookupDisplay := 'Nome';
  Label53.Caption := RxDBLookupCombo8.LookupDisplay;
  if RxDBComboBox2.ItemIndex = 0 then
  begin
    DM1.tNotaFiscalCodVendedor.AsInteger := DM1.tClienteCodVendedor.AsInteger;
    DM1.tNotaFiscalPercComissao.AsFloat  := DM1.tClientelkComissao.AsFloat;
  end
  else
  begin
    DM1.tNotaFiscalCodVendedor.AsInteger  := 0;
    DM1.tNotaFiscalPercComissao.AsFloat   := 0;
  end;
  Label87.Visible := False;
end;

procedure TfEmissaoNotaFiscal.RxDBLookupCombo8Enter(Sender: TObject);
begin
  Label87.Visible         := True;
  PageControl1.ActivePage := TabSheet1;
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

procedure TfEmissaoNotaFiscal.RxDBLookupCombo9Enter(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Nome';
end;

procedure TfEmissaoNotaFiscal.tAuxNotaFiscalGradeBeforeInsert(
  DataSet: TDataSet);
var
 icount: integer;
begin
  i2 := 0;
  icount := tAuxNotaFiscalGrade.RecordCount;
  if icount >= DM1.tGradeItem.RecordCount then
    begin
      fNotaFiscalGrade.BitBtn5.SetFocus;
      Abort;
    end;
end;

procedure TfEmissaoNotaFiscal.DBEdit35Exit(Sender: TObject);
begin
  if tNotaFiscalIns.Locate('NumNota',DM1.tNotaFiscalNumNota.AsInteger,[loCaseInsensitive]) then
    begin
      ShowMessage('Já existe uma NF com este número!');
      DM1.tNotaFiscal.Cancel;
      Habilita_Desabilita;
      BitBtn1.SetFocus;
    end
  else
    begin
      DM1.tNotaFiscal.Post;
      tNotaFiscalIns.Refresh;
      DM1.tNotaFiscal.Edit;
      DBDateEdit2.SetFocus;
    end;
end;

procedure TfEmissaoNotaFiscal.Edit12Exit(Sender: TObject);
begin
  if Edit1.Text = '' then
    begin
      Edit4.Text := FloatToStr(vAliqICMS);
      if (SpeedButton23.Tag = 0) then
        begin
          if RxDBLookupCombo15.Text <> '' then
            begin
              DM1.tNatOperacao.IndexFieldNames := 'Codigo';
              DM1.tNatOperacao.SetKey;
              DM1.tNatOperacaoCodigo.AsInteger := RxDBLookupCombo15.KeyValue;
              if DM1.tNatOperacao.GotoKey then
                if DM1.tNatOperacaoCalcComissao.AsBoolean then
                  ComboBox2.ItemIndex := 0
                else
                  ComboBox2.ItemIndex := 1;
            end;
        end;
    end;
end;

procedure TfEmissaoNotaFiscal.RxDBLookupCombo10Exit(Sender: TObject);
begin
  DM1.tTransp.IndexFieldNames := 'Nome';
end;

procedure TfEmissaoNotaFiscal.SpeedButton23Click(Sender: TObject);
var
  ID: TTransactionDesc;
  sds: TSQLDataSet;
  vFlag: Boolean;
begin
  if (DM1.tNotaFiscalItens.IsEmpty) or (DM1.tNotaFiscalTipoNota.AsString <> '1') then
    exit;
  if RzDBLookupComboBox1.Text <> '' then
  begin
    MessageDlg('Existe item pendente', mtInformation, [mbOk], 0);
    exit;
  end;

  sds := TSQLDataSet.Create(nil);
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;
  sds.SQLConnection := dmDatabase.scoDados;

  ID.TransactionID  := 2;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    vFlag := False;
    while not vflag do
    begin
      try
        sds.Close;
        sds.SQLConnection := dmDatabase.scoDados;
        sds.NoMetadata    := True;
        sds.GetMetadata   := False;
        sds.CommandText := ' UPDATE TABELALOC SET FLAG = 0 ' +
                           ' WHERE TABELA = ' + QuotedStr('NOTAFISCAL');
        sds.ExecSQL();
        vFlag := True;
      except
        vFlag := False;
      end
    end;

    SpeedButton23.Tag := 1;
    vItemNota := DM1.tNotaFiscalItensItem.AsInteger;
    Edit1.Text := DM1.tNotaFiscalItensReferencia.AsString;
    Edit1Enter(Sender);
    Edit1Exit(Sender);
    if DM1.tNotaFiscalItensCodProduto.AsInteger > 0 then
    begin
      RzDBLookupComboBox1.KeyValue := DM1.tNotaFiscalItensCodProduto.AsInteger;
      RzDBLookupComboBox1Exit(Sender);
    end;
    if DM1.tNotaFiscalItensCodCor.AsInteger > 0 then
      RxDBLookupCombo4.KeyValue := DM1.tNotaFiscalItensCodCor.AsInteger;
    CurrencyEdit1.Value := DM1.tNotaFiscalItensComissaoMod.AsFloat;

    case DM1.tNotaFiscalItensMaterial.AsBoolean of
      False: ComboBox3.ItemIndex := 0;
      True : ComboBox3.ItemIndex := 1;
    end;

    Edit2.Text  := DM1.tNotaFiscalItensUnidade.AsString;
    Edit3.Text  := DM1.tNotaFiscalItensQtd.AsString;
    Edit4.Text  := DM1.tNotaFiscalItensIcms.AsString;
    Edit5.Text  := DM1.tNotaFiscalItensIpi.AsString;
    RxDBLookupCombo13.ClearValue;
    if DM1.tNotaFiscalItensSitTrib.AsInteger > 0 then
      RxDBLookupCombo13.KeyValue := DM1.tNotaFiscalItensSitTrib.AsInteger;
    RxDBLookupCombo6.ClearValue;
    if DM1.tNotaFiscalItensCodCSTIPI.AsString <> '' then
      RxDBLookupCombo6.KeyValue := DM1.tNotaFiscalItensCodCSTIPI.AsString;

    RxDBLookupCombo1.ClearValue;
    if DM1.tNotaFiscalItensClasFiscal.AsString <> '' then
      RxDBLookupCombo1.Value := DM1.tNotaFiscalItensClasFiscal.AsString;
    vCodCofins        := DM1.tNotaFiscalItensCodCofins.AsString;
    vCodPis           := DM1.tNotaFiscalItensCodPis.AsString;
    vTipoPis          := DM1.tNotaFiscalItensTipoPis.AsString;
    vTipoCofins       := DM1.tNotaFiscalItensTipoCofins.AsString;
    vPercPis          := DM1.tNotaFiscalItensAliqPis.AsFloat;
    vPercCofins       := DM1.tNotaFiscalItensAliqCofins.AsFloat;
    vVlrPis           := DM1.tNotaFiscalItensVlrPis.AsFloat;
    vVlrCofins        := DM1.tNotaFiscalItensVlrCofins.AsFloat;
    vOrigemMerc       := DM1.tNotaFiscalItensOrigemProd.AsString;
    vSomaVlrTotalProd := DM1.tNotaFiscalItensSomaVlrTotalProd.AsBoolean;
    vSoma_Automatico_Imp := DM1.tNotaFiscalItensSoma_Automatico_Imp.AsBoolean;
    vPercImportacao := DM1.tNotaFiscalItensPerc_Importacao.AsFloat;
    vVlrAduaneira   := DM1.tNotaFiscalItensVlrAduaneira.AsFloat;

    Edit7.Text  := DM1.tNotaFiscalItensVlrUnit.AsString;
    Edit8.Text  := DM1.tNotaFiscalItensVlrTotal.AsString;
    Edit9.Text  := DM1.tNotaFiscalItensDesconto.AsString;
    Edit10.Text := DM1.tNotaFiscalItensVlrDesconto.AsString;
    RxDBLookupCombo15.KeyValue := DM1.tNotaFiscalItensNatOper.AsInteger;
    if DM1.tNotaFiscalItensCodModelista.AsInteger > 0 then
      RxDBLookupCombo14.KeyValue := DM1.tNotaFiscalItensCodModelista.AsInteger;
    if DM1.tNotaFiscalItensCalculaComissaoVend.AsBoolean then
      ComboBox2.ItemIndex := 0
    else
      ComboBox2.ItemIndex := 1;
    vItemPedido  := DM1.tNotaFiscalItensItemPedido.AsInteger;
    vNumPedido   := DM1.tNotaFiscalItensNumPedido.AsInteger;
    vMercadoItem := DM1.tNotaFiscalItensMercado.AsString;
    vObsComplementar := DM1.tNotaFiscalItensObsComplementar.AsString;
    //22/12/2015
    if DM1.tNotaFiscalItensID_ENQIPI.AsInteger > 0 then
      rxdbEnq_IPI.KeyValue := DM1.tNotaFiscalItensID_ENQIPI.AsInteger
    else
      rxdbEnq_IPI.ClearValue;
    //********
    Excluir_ItemNota('E');
    DM1.tNotaFiscalItens.Delete;

    dmDatabase.scoDados.Commit(ID);

  except
    on e: Exception do
      begin
        dmDatabase.scoDados.Rollback(ID);
        raise Exception.Create('Erro ao alterar o item da nota, favor tentar novamente: ' + #13 + e.Message);
      end;
  end;
  FreeAndNil(sds);

  Edit1.SetFocus;
end;

procedure TfEmissaoNotaFiscal.CurrencyEdit1Exit(Sender: TObject);
begin
  if (CurrencyEdit1.Value > 0) and (RxDBComboBox2.ItemIndex = 0) and (DM1.tParametrosCodModelista.AsInteger > 0) then
    RxDBLookupCombo14.KeyValue := DM1.tParametrosCodModelista.AsInteger
  else
    RxDBLookupCombo14.ClearValue;
end;

procedure TfEmissaoNotaFiscal.RxDBLookupCombo14Enter(Sender: TObject);
begin
  DM1.tModelista.IndexFieldNames := 'Descricao';
end;

procedure TfEmissaoNotaFiscal.mModelistaNewRecord(DataSet: TDataSet);
begin
  mModelistaPercComissao.AsFloat := 0;
  mModelistaVlrComissao.AsFloat  := 0;
  mModelistaVlrBase.AsFloat      := 0;
end;

procedure TfEmissaoNotaFiscal.FormCreate(Sender: TObject);
begin
  Dm1.tPlanoContas.Open;
  DM1.tExtComissao.Open;
  DM1.tExtComissaoMod.Open;
  DM1.tNotaFiscal.Open;
  DM1.tNotaFiscalGrade.Open;
  DM1.tNotaFiscalItens.Open;
  DM1.tNotaFiscalParc.Open;
  DM1.tNotaFiscalTBObs.Open;

  DM1.tObsAux.Open;
  DM1.tIndexador.Open;
  DM1.tNatOperacao.Open;
  DM1.tTipoCobranca.Open;
  Dm1.tPais.Open;
  DM1.tProduto.Open;
  DM1.tProdutoCor.Open;
  DM1.tProdutoTam.Open;
  DM1.tSitTributaria.Open;
  DM1.tClasFiscal.Open;
  DM1.tTransp.Open;
  DM1.tContas.Open;
  DM1.tCReceber.Open;
  DM1.tCReceberParc.Open;
  DM1.tCReceberParcHist.Open;
  DM1.tPedido.Open;
  DM1.tPedidoItem.Open;
  DM1.tPedidoGrade.Open;
  DM1.tPedidoNota.Open;
  DM1.tPedidoParc.Open;
  DM1.tPedidoMaterial.Open;
  DM1.tGrade.Open;
  DM1.tGradeItem.Open;
  DM1.tGradeItemlk.Open;
  DM1.tCor.Open;
  DM1.tCondPgto.Open;
  DM1.tCondPgtoItem.Open;
  DM1.tUF.Open;
  DM1.tCidade.Open;
  DM1.tFornecedores.Open;
  DM1.tPedidoDesconto.Open;
  DM1.tCliente.Open;
  DM1.tModelista.Open;
  DM1.tVendedor.Open;
  DM1.tMaterial.Open;
  DM1.tMaterialCor.Open;
  DM1.tMovimentos.Open;
  DM1.tNatOperacao2.Open;
  DM1.tImpressora.Open;
  DM1.tParametros.Open;
  DM1.tCSTIPI.Open;
  dm1.tIndexador.Open;

  tNotaFiscalIns.Open;
  tNotaFiscalItensIns.Open;
  tNotaFiscalParcIns.Open;
  DM1.tNEntrada.Open;
  DM1.tNEntradaItens.Open;
  DM1.tNEntradaItensGrade.Open;
  DM1.tNEntradaParc.Open;

  tPedidoItem.Open;
  tAuxNotaFiscalGrade.Open;
  tNotaFiscalDev.Open;
  tNotaFiscalParcIns.Open;
  tNotaFiscalItensDev.Open;
  tExtComissaoIns.Open;
  
  PageControl1.ActivePageIndex := 0;
end;

procedure TfEmissaoNotaFiscal.RxDBLookupCombo15Exit(Sender: TObject);
begin
  if RxDBLookupCombo15.Text <> '' then
    begin
      DM1.tNatOperacao.IndexFieldNames := 'Codigo';
      DM1.tNatOperacao.SetKey;
      DM1.tNatOperacaoCodigo.AsInteger := RxDBLookupCombo15.KeyValue;
      if DM1.tNatOperacao.GotoKey then
        if DM1.tNatOperacaoCalcComissao.AsBoolean then
          ComboBox2.ItemIndex := 0
        else
          ComboBox2.ItemIndex := 1;
    end;
end;

procedure TfEmissaoNotaFiscal.Grava_NumSeq;
var
  vNumAux: Integer;
  vflag: Boolean;
begin
  DM1.tNotaFiscal.Refresh;
  tNotaFiscalIns.Refresh;
  tNotaFiscalIns.Last;
  vflag    := False;
  vNumAux  := tNotaFiscalInsNumSeq.AsInteger;
  vDataAnt := tNotaFiscalInsDtEmissao.AsDateTime;

  tNotaFiscalIns.Refresh;

  DM1.tNotaFiscal.Insert;
  DM1.tNotaFiscalDtEmissao.AsDateTime    := Date;
  DM1.tNotaFiscalDtEntr.AsDateTime       := Date;
  DM1.tNotaFiscalIcmsIpi.AsBoolean       := DM1.tParametrosIcmsIpi.AsBoolean;
  DM1.tNotaFiscalSituacao.AsInteger      := 1;
  DM1.tNotaFiscalTipoNota.AsInteger      := 1;
  DM1.tNotaFiscalDescricaoDesc.AsString  := 'ABATIMENTO';
  DM1.tNotaFiscalCondPgto.AsString       := 'P';
  DM1.tNotaFiscalExportacao.AsBoolean    := False;
  dm1.tNotaFiscalFilial.AsInteger        := dm1.tFilialCodigo.AsInteger;

  DM1.tNatOperacao.Filtered := False;
  if DM1.tFilialCodRegimeTrib.AsInteger < 3 then
    DM1.tNatOperacao.Filter   := 'TipoEmpresa = '''+'A'+''' or TipoEmpresa = '''+'S'+''''
  else
    DM1.tNatOperacao.Filter   := 'TipoEmpresa = '''+'A'+''' or TipoEmpresa = '''+'G'+'''';
  DM1.tNatOperacao.Filtered := True;
  //***************

  DM1.tSitTributaria.Filtered := False;
  if DM1.tFilialSimples.AsBoolean then
    DM1.tSitTributaria.Filter   := 'Tipo = ' + QuotedStr('S')
  else
    DM1.tSitTributaria.Filter   := 'Tipo = ' + QuotedStr('N');
  DM1.tSitTributaria.Filtered := True;
  //*********

  while vflag = False do
    begin
      vNumAux := vNumAux + 1;
      try
        DM1.tNotaFiscalNumSeq.AsInteger := vNumAux;
        DM1.tNotaFiscal.Post;
        DM1.tNotaFiscal.Refresh;
        tNotaFiscalIns.Refresh;
        DM1.tNotaFiscal.Locate('Filial;NumSeq',VarArrayOf([DM1.tNotaFiscalFilial.AsInteger,vNumAux]),[locaseinsensitive]);
        DM1.tNotaFiscal.Edit;
        vflag := True;
      except
        on E: Exception do
        begin
          if MessageDlg('Não foi possível gravar, ' + E.Message + #13 +
                  'Continuar?', mtConfirmation, [mbOK,mbNO],0) = mrOK then
            vFlag := False
          else
            begin
              vFlag        := True;
              vCancelarInc := True;
            end;
        end;
      end;
    end;
end;

procedure TfEmissaoNotaFiscal.Grava_NumNota;
var
  vNumAux: Integer;
  vflag: Boolean;
  vNumSeq: Integer;
begin

  vNumSeq := DM1.tNotaFiscalNumSeq.AsInteger;
  tNotaFiscalIns.Close;
  tNotaFiscalIns.Open;
  tNotaFiscalIns.Refresh;
  tNotaFiscalIns.Last;

  vflag := False;
  while vflag = False do
    begin
      DM2.qProximaNota.Close;
      DM2.qProximaNota.Open;
      vNumAux := DM2.qProximaNotaNumNota.AsInteger;
      DM2.qProximaNota.Close;

      vNumAux := vNumAux + 1;
      if not tNotaFiscalIns.Locate('NumNota', vNumAux,[locaseinsensitive]) then
      begin
        DM1.tNotaFiscalNumNota.AsInteger := vNumAux;
        DM1.tNotaFiscal.Post;
        DM1.tNotaFiscal.Refresh;
        tNotaFiscalIns.Refresh;
        DM1.tNotaFiscal.Locate('NumSeq',vNumSeq,[locaseinsensitive]);
        if tNotaFiscalIns.Locate('NumNota',vNumAux,[locaseinsensitive]) then
        begin
          if tNotaFiscalInsNumSeq.AsInteger = DM1.tNotaFiscalNumSeq.AsInteger then
          begin
            DM1.tNotaFiscal.Edit;
            vflag := True;
          end;
        end;
        if vflag then
          begin
            DM1.tNotaFiscalItens.First;
            while not DM1.tNotaFiscalItens.Eof do
            begin
              DM1.tNotaFiscalItens.Edit;
              DM1.tNotaFiscalItensNumNota.AsInteger := DM1.tNotaFiscalNumNota.AsInteger;
              DM1.tNotaFiscalItens.Post;
              DM1.tNotaFiscalItens.Next;
            end;
          end;
      end;
    end;
end;

procedure TfEmissaoNotaFiscal.RxDBLookupCombo8Change(Sender: TObject);
begin
  Verifica_UF;
  if DM1.tClienteEndEntrega.AsString <> '' then
      DBRadioGroup5.Enabled := True
  else
    begin
      DBRadioGroup5.Enabled := False;
      DBRadioGroup5.Value   := 'False';
    end;
end;

procedure TfEmissaoNotaFiscal.RxDBLookupCombo1Change(Sender: TObject);
begin
  if (Edit1.Text <> '') or (RzDBLookupComboBox1.Text <> '') then
  begin
    if RxDBComboBox2.ItemIndex = 0 then
      Edit1.Text := DM1.tProdutoReferencia.AsString
    else
    if RxDBComboBox2.ItemIndex = 1 then
      Edit1.Text := DM1.tMaterialCodigo.AsString;;
  end;
end;

procedure TfEmissaoNotaFiscal.RzDBComboBox1Change(Sender: TObject);
begin
  if (Edit1.Text <> '') or (RzDBLookupComboBox1.Text <> '') then
  begin
    if RxDBComboBox2.ItemIndex = 0 then
      Edit1.Text := DM1.tProdutoReferencia.AsString
    else
    if RxDBComboBox2.ItemIndex = 1 then
      Edit1.Text := DM1.tMaterialCodigo.AsString;
  end;
end;

procedure TfEmissaoNotaFiscal.RzDBComboBox1Enter(Sender: TObject);
begin
  if RxDBComboBox2.ItemIndex = 0 then
    DM1.tProduto.IndexFieldNames := 'Nome'
  else
  if RxDBComboBox2.ItemIndex = 1 then
    DM1.tMaterial.IndexFieldNames := 'Nome'
  else
  if RxDBComboBox2.ItemIndex = 2 then
    DM1.tOperAtelier.IndexFieldNames := 'Nome';
end;

procedure TfEmissaoNotaFiscal.RzDBComboBox1Exit(Sender: TObject);
begin
  if (Edit1.Text <> '') or (RzDBLookupComboBox1.Text <> '') then
    begin
      if RxDBComboBox2.ItemIndex = 0 then
        begin
          Edit1.Text := DM1.tProdutoReferencia.AsString;
          Edit1.OnExit(Sender);
        end
      else
      if RxDBComboBox2.ItemIndex = 1 then
        begin
          Edit1.Text := DM1.tMaterialCodigo.AsString;
          Edit1.OnExit(Sender);
        end
      else
      if RxDBComboBox2.ItemIndex = 3 then
        begin
          Edit1.Text := DM1.tOperAtelierCodigo.AsString;
          Edit1.OnExit(Sender);
        end;
    end;
end;

procedure TfEmissaoNotaFiscal.RzEdit1Exit(Sender: TObject);
begin
  if Edit1.Text = '' then
    begin
      Edit4.Text := FloatToStr(vAliqICMS);
      if (SpeedButton23.Tag = 0) then
        begin
          if RxDBLookupCombo15.Text <> '' then
          begin
            DM1.tNatOperacao.IndexFieldNames := 'Codigo';
            DM1.tNatOperacao.SetKey;
            DM1.tNatOperacaoCodigo.AsInteger := RxDBLookupCombo15.KeyValue;
            if DM1.tNatOperacao.GotoKey then
              if DM1.tNatOperacaoCalcComissao.AsBoolean then
                ComboBox2.ItemIndex := 0
              else
                ComboBox2.ItemIndex := 1
          end;
        end;
    end;                                         
end;

procedure TfEmissaoNotaFiscal.RzDBLookupComboBox1Enter(Sender: TObject);
begin
  if RxDBComboBox2.ItemIndex = 0 then
    DM1.tProduto.IndexFieldNames := 'Nome'
  else
  if RxDBComboBox2.ItemIndex = 1 then
    DM1.tMaterial.IndexFieldNames := 'Nome';
end;

procedure TfEmissaoNotaFiscal.RzDBLookupComboBox1Exit(Sender: TObject);
begin
  if (Edit1.Text <> '') or (RzDBLookupComboBox1.Text <> '') then
    case ComboBox3.ItemIndex of
      0: Edit1.Text := DM1.tProdutoReferencia.AsString;
      1: Edit1.Text := DM1.tMaterialCodigo.AsString;
      2: Edit1.Text := DM1.tProdutoReferencia.AsString;
    end;
end;

procedure TfEmissaoNotaFiscal.RxDBComboBox2Exit(Sender: TObject);
begin
  if RxDBComboBox2.ItemIndex = 0 then
  begin
    RzDBLookupComboBox1.ListSource := DM1.dsProduto;
    RzDBLookupComboBox1.ListField  := 'Nome';
    RzDBLookupComboBox1.KeyField   := 'Codigo';

    DM1.tProduto.IndexFieldNames   := 'Nome';
    SpeedButton17.Enabled          := True;
  end
  else
  if RxDBComboBox2.ItemIndex = 1 then
  begin
    RzDBLookupComboBox1.ListSource := DM1.dsMaterial;
    RzDBLookupComboBox1.ListField  := 'Nome';
    RzDBLookupComboBox1.KeyField   := 'Codigo';

    DM1.tMaterial.IndexFieldNames  := 'Nome';
    SpeedButton17.Enabled          := False;
    if DM1.tNotaFiscalSaidaEntrada.AsString = 'S' then
      if BitBtn7.Tag = 0 then
        if MessageDlg('Esta nota é devolução de material?',mtConfirmation,[mbOK,mbNo],0) = mrOK then
        begin
          fEscNotaDevol := TfEscNotaDevol.Create(Self);
          fEscNotaDevol.ShowModal;
        end;
  end;
end;

procedure TfEmissaoNotaFiscal.RxDBComboBox2Change(Sender: TObject);
begin
  if RxDBComboBox2.ItemIndex = 0 then
    SpeedButton17.Enabled  := True
  else
    SpeedButton17.Enabled  := False;
  Edit1.Clear; Edit2.Clear; Edit3.Clear; Edit4.Clear; Edit5.Clear; Edit7.Clear; Edit8.Clear; Edit9.Clear; Edit10.Clear;
  RzDBLookupComboBox1.ClearKeyValue; RxDBLookupCombo13.ClearValue;
  vNumPedido  := 0;
  vItemPedido := 0;
  Query1.Close;
end;

procedure TfEmissaoNotaFiscal.NFeDanfe1Click(Sender: TObject);
var
  vNumSeqAux: Integer;
  vFlag: Boolean;
  ID: TTransactionDesc;
  sds: TSQLDataSet;
begin
  if not DM1.tNotaFiscalCReceberOK.AsBoolean then
  begin
    ShowMessage('Contas a receber com problemas, ' +#13+
                'Altera a nota e confirma novamente');
    exit;
  end;

  if not DM1.tParametrosControlaNFe.AsBoolean then
  begin
    ShowMessage('Não autorizado a emitir NFe!');
    exit;
  end;

  if Length(Trim(DM1.tNotaFiscalPlaca.AsString)) > 7 then
  begin
    ShowMessage('Placa só pode conter letras e números!');
    exit;
  end;

  //21/09/2010
  try
    vNumSeqAux := DM1.tNotaFiscalNumSeq.AsInteger;
    DM1.tNotaFiscal.Filtered := False;
    DM1.tNotaFiscal.Filter   := 'NumSeq = '''+IntToStr(vNumSeqAux)+'''';
    DM1.tNotaFiscal.Filtered := True;

    DMNotaFiscal.vNumSeqNFe := DM1.tNotaFiscalNumSeq.AsInteger;

    fNFe := TfNFe.Create(fNFe);

    if Tag = 99 then
      fNFe.Tag := 2;
    fNFe.vPessoaTransp := DM1.tNotaFiscallkPessoaTransp.AsString;

    sds := TSQLDataSet.Create(nil);
    sds.SQLConnection := dmDatabase.scoDados;
    ID.TransactionID  := 2;
    ID.IsolationLevel := xilREADCOMMITTED;
    dmDatabase.scoDados.StartTransaction(ID);
    try
      vFlag := False;
      while not vflag do
      begin
        try
          sds.Close;
          sds.SQLConnection := dmDatabase.scoDados;
          sds.NoMetadata    := True;
          sds.GetMetadata   := False;
          sds.CommandText := ' UPDATE TABELALOC SET FLAG = 0 ' +
                           ' WHERE TABELA = ' + QuotedStr('NOTAFISCAL');
          sds.ExecSQL();
          vFlag := True;
        except
          vFlag := False;
        end
      end;

      Gera_NFe;

      dmDatabase.scoDados.Commit(ID);

    except
      on e: Exception do
        begin
          dmDatabase.scoDados.Rollback(ID);
          raise Exception.Create('Erro ao gravar a NOTA, favor tentar novamente: ' + #13 + e.Message);
        end;
    end;
    FreeAndNil(sds);

    fNFe.ShowModal;
  finally
    if DM1.tNotaFiscalNFeDenegada.AsBoolean then
      Cancelamento(False);

    FreeAndNil(fNFe);
    DM1.tNotaFiscal.Filtered := False;
    dm1.tNotaFiscal.IndexFieldNames := 'Filial;NumSeq';
    DM1.tNotaFiscal.FindKey([DM1.tFilialCodigo.AsInteger,vNumSeqAux]);
  end;
end;

procedure TfEmissaoNotaFiscal.Cancelar1Click(Sender: TObject);
begin
  if DM1.tNotaFiscalNumNota.AsInteger < 1 then
    exit;
  if Trim(DM1.tNotaFiscalNFeChaveAcesso.AsString) = '' then
  begin
    ShowMessage('Nota sem chave de acesso não pode ser cancelada!');
    exit;
  end;

  if (DM1.tNotaFiscalCancelada.AsBoolean) and (DM1.tNotaFiscalNFeProtocoloCancelada.AsString <> '') then
  begin
    fNotaFiscalCancelada := TfNotaFiscalCancelada.Create(Self);
    fNotaFiscalCancelada.DBEdit1.ReadOnly := True;
    fNotaFiscalCancelada.ShowModal;
    exit;
  end;

  if not Cancelar then
    exit;

  if MessageDlg('Deseja realmente cancelar esta nota fiscal?',mtWarning,[mbOK,mbNO],0) = mrNo then
    exit;

  if MessageDlg('                                  ATENÇÃO'
                  +#13#13+
                  'Após cancelada, esta operação não mais poderá ser desfeita!'+#13+
                  '  Clique no botão OK para cancelar a nota fiscal.',mtInformation,
                  [mbOK,mbNO],0) = mrNo then
    exit;

  try
    Tag := 99;
    DM1.tNotaFiscal.Edit;
    fNotaFiscalCancelada := TfNotaFiscalCancelada.Create(Self);
    fNotaFiscalCancelada.DBEdit1.ReadOnly := False;
    fNotaFiscalCancelada.ShowModal;
    DM1.tNotaFiscal.Post;

    NFeDanfe1Click(fEmissaoNotaFiscal);
    Tag := 0;

    if Trim(DM1.tNotaFiscalNFeProtocoloCancelada.AsString) <> '' then
      Cancelamento(True);

  except
    on E: Exception do
      ShowMessage('problema no cancelamento, erro: ' + E.Message + '!');
  end;

  Verifica_Nota_Cancelada;
end;

procedure TfEmissaoNotaFiscal.ComboBox3Change(Sender: TObject);
begin
  RxDBFilter1.Active       := False;
  SpeedButton17.Enabled    := False;
  case ComboBox3.ItemIndex of
    0: begin
         RzDBLookupComboBox1.ListSource := DM1.dsProduto;
         RzDBLookupComboBox1.ListField  := 'Nome';
         RzDBLookupComboBox1.KeyField   := 'Codigo';

         DM1.tProduto.IndexFieldNames   := 'Nome';
         SpeedButton17.Enabled          := True;
       end;
    1: begin
         RzDBLookupComboBox1.ListSource := DM1.dsMaterial;
         RzDBLookupComboBox1.ListField  := 'Nome';
         RzDBLookupComboBox1.KeyField   := 'Codigo';

         DM1.tMaterial.IndexFieldNames  := 'Nome';
         if DM1.tNotaFiscalSaidaEntrada.AsString = 'S' then
           if BitBtn7.Tag = 0 then
             if MessageDlg('Esta nota é devolução de material?',mtConfirmation,[mbOK,mbNo],0) = mrOK then
             begin
               fEscNotaDevol := TfEscNotaDevol.Create(Self);
               fEscNotaDevol.ShowModal;
             end;
       end;
    2: begin
         RxDBFilter1.Active             := True;
         RzDBLookupComboBox1.ListSource := DM1.dsProduto;
         RzDBLookupComboBox1.ListField  := 'Nome';
         RzDBLookupComboBox1.KeyField   := 'Codigo';

         DM1.tProduto.IndexFieldNames   := 'Nome';
         SpeedButton17.Enabled          := True;
       end;
  end;

end;

procedure TfEmissaoNotaFiscal.RzDBLookupComboBox1CloseUp(Sender: TObject);
begin
  if (Edit1.Text <> '') or (RzDBLookupComboBox1.Text <> '') then
  begin
    if ComboBox3.ItemIndex = 0 then
      Edit1.Text := DM1.tProdutoReferencia.AsString
    else
    if ComboBox3.ItemIndex = 1 then
      Edit1.Text := DM1.tMaterialCodigo.AsString;
  end;
end;

procedure TfEmissaoNotaFiscal.Cancelamento(Cancelar: Boolean);
begin
  Exclui_Pgto('C');

  DM1.tNotaFiscalItens.First;
  while not DM1.tNotaFiscalItens.Eof do
    begin
      Excluir_ItemNota('C');
      DM1.tNotaFiscalItens.Next;
    end;
  Desfaz_ExtComissao;
  Desfaz_ExtComissao_Modelista;

  vItemNota := 0;
  Verifica_Nota_Cancelada;

  if DM1.tNotaFiscalSaidaEntrada.AsString = 'E' then
  begin
    tNotaFiscalDev.IndexFieldNames := 'NumNotaDevol';
    tNotaFiscalDev.SetKey;
    tNotaFiscalDevNumNotaDevol.AsInteger := DM1.tNotaFiscalNumNota.AsInteger;
    if tNotaFiscalDev.GotoKey then
    begin
      tNotaFiscalDev.Edit;
      tNotaFiscalDevNumNotaDevol.Clear;
      tNotaFiscalDev.Post;
      tNotaFiscalDev.Refresh;
    end;
    tNotaFiscalDev.IndexFieldNames := 'NumNota';
  end;

  vItemNota    := 0;
  vMercadoItem := '';
  Verifica_Nota_Cancelada;
end;

procedure TfEmissaoNotaFiscal.FormShow(Sender: TObject);
begin
  if not Assigned(DMNotaFiscal) then
    DMNotaFiscal := TDMNotaFiscal.Create(Self);

  //3.10  21/03/2015
  DM1.tFilial_Download.Open;

  if not Assigned(DMTabImposto) then
    DMTabImposto := TDMTabImposto.Create(Self);
  if not Assigned(DMTabEnqIPI) then
    DMTabEnqIPI := TDMTabEnqIPI.Create(Self);

  DMNotaFiscal.tNotaFiscalImp.Open;
  DMNotaFiscal.tNotaFiscalImpAdicao.Open;
  DMNotaFiscal.tNotaFiscalReboque.Open;
  DMNotaFiscal.tNotaFiscalLacre.Open;
  DMNotaFiscal.tNotaFiscalTBDesconto.Open;
  DM1.tNotaFiscalRef.Open;

  DMTabEnqIPI.Abre_Tab_EnqIPI(0);

  DM1.tIndexador.Open;
  DM1.tIndexador.Last;
  DM1.tNotaFiscal.Refresh;
  DM1.tProduto.IndexFieldNames := 'Nome';
  Verifica_Nota_Cancelada;
  Label53.Caption := RxDBLookupCombo8.LookupDisplay;
  DM1.tParametros.First;
  dm1.tNotaFiscal.Last;
  if DM1.tParametrosNroItensNota.AsInteger < 1 then
    ShowMessage('Não foi informada a quantidade de itens da nota!');

  fEmissaoNotaFiscal.WindowState := wsMaximized;
end;

procedure TfEmissaoNotaFiscal.RxDBLookupCombo9Change(Sender: TObject);
begin
  if RxDBLookupCombo9.Text <> '' then
    begin
      if DM1.tVendedorPercComissao.AsCurrency > 0 then
        DM1.tNotaFiscalPercComissao.AsCurrency := DM1.tVendedorPercComissao.AsCurrency;
    end
  else
    DM1.tNotaFiscalPercComissao.AsCurrency := 0;
end;

procedure TfEmissaoNotaFiscal.Panel1Exit(Sender: TObject);
begin
  if dm1.tNotaFiscalCodCli.IsNull then
    Exit;
  if (DM1.tClienteNumEnd.AsString = '') then
  ShowMessage('O número do endereço do cliente não está preenchido!' + #13 +
              'Esta informação é exigida pela nota fiscal eletrônica!');

  if (DM1.tClienteBairro.AsString = '') then
    ShowMessage('O bairro do cliente não está preenchido!' + #13 +
                'Esta informação é exigida pela nota fiscal eletrônica!');

  if (DM1.tClienteCep.AsString      = '') or (DM1.tClienteCodCidade.AsInteger < 1) or
     (DM1.tClienteEndereco.AsString = '') or (DM1.tClienteUF.AsString = '') then
    ShowMessage('Os dados obrigatórios do cliente devem ser preenchidos:' + #13 +
                'Endereço, Cidade, Estado e CEP!' + #13 +
                'Estas informações são exigidas pela nota fiscal eletrônica!');

  if (DM1.tClienteEmailNFe.AsString = '') then
    ShowMessage('O cliente não tem email para receber a NFe!' + #13 +
                'Esta informação é exigida pela nota fiscal eletrônica!');

  if not dm1.tNotaFiscalExportacao.AsBoolean then
  begin
    dm1.tCidade.Locate('Codigo',dm1.tClienteCodCidade.AsInteger,[loCaseInsensitive]);
    if dm1.tCidadeCodMunicipio.IsNull then
      ShowMessage('Município não possui o código do IBGE cadastrado!');
  end;
end;

procedure TfEmissaoNotaFiscal.BitBtn5Click(Sender: TObject);
begin
  if not(DM1.tNotaFiscalItens.IsEmpty) then
  begin
    fNotaFiscalItensObsComplementar := TfNotaFiscalItensObsComplementar.Create(Self);
    if not dm1.tNotaFiscalNFeChaveAcesso.IsNull then
      fNotaFiscalItensObsComplementar.DBMemo1.ReadOnly := True;
    fNotaFiscalItensObsComplementar.ShowModal;
  end;
end;

procedure TfEmissaoNotaFiscal.Panel14Exit(Sender: TObject);
begin
  Verifica_UF;
  Query1.Close;
  if ComboBox3.ItemIndex = 0 then
  begin
    Monta_Cor('P');
    if (DM1.tProduto.Locate('Referencia;DescMaterial',VarArrayOf([Edit1.Text,RzDBLookupComboBox2.Text]),[locaseinsensitive]))  and (vItemNota < 1) then
      Move_Item;
  end;

  if ComboBox3.ItemIndex = 1 then
  begin
    Monta_Cor('M');
    if DM1.tMaterial.Locate('Codigo',RzDBLookupComboBox1.KeyValue,[loCaseInsensitive])  and (vItemNota < 1) then
      Move_Item;
  end;

  if ComboBox3.ItemIndex = 2 then
  begin
    Monta_Cor('P');
    if DM1.tProduto.Locate('Codigo',RzDBLookupComboBox1.KeyValue,[loCaseInsensitive])  and (vItemNota < 1) then
      Move_Item;
  end;
  Move_Tributos;
  Label86.Visible := False;
end;

procedure TfEmissaoNotaFiscal.Edit1Exit(Sender: TObject);
begin
  qMatRef.Close;
  if edit1.Text = '' then
    exit;
  if (ComboBox3.ItemIndex = 1) and not(DM1.tMaterial.Locate('Codigo',Edit1.Text,[loCaseInsensitive])) then
  begin
    ShowMessage('Material não encontrado!');
    exit;
  end;
  if (ComboBox3.ItemIndex <> 1) and not(DM1.tProduto.Locate('Referencia',Edit1.Text,[loCaseInsensitive])) then
  begin
    ShowMessage('Referência não encontrada!');
    exit;
  end;
  if (ComboBox3.ItemIndex = 0) then
  begin
    qMatRef.ParamByName('Ref').AsString := Edit1.Text;
    qMatRef.Open;
    if trim(vDesc_Material_Pos) <> '' then
      RzDBLookupComboBox2.KeyValue := vDesc_Material_Pos;
  end;
  if ComboBox3.ItemIndex = 1 then
    RzDBLookupComboBox1.KeyValue := DM1.tMaterialCodigo.AsInteger
  else
    RzDBLookupComboBox1.KeyValue := DM1.tProdutoCodigo.AsInteger;
end;

procedure TfEmissaoNotaFiscal.RzDBLookupComboBox2Exit(Sender: TObject);
begin
  if ComboBox3.ItemIndex <> 0 then
    exit;
  if not DM1.tProduto.Locate('Referencia;DescMaterial',VarArrayOf([Edit1.Text,RzDBLookupComboBox2.Text]),[locaseinsensitive]) then
  begin
    ShowMessage('Referência não encontrada!');
    exit;
  end;
 RzDBLookupComboBox1.KeyValue := DM1.tProdutoCodigo.AsInteger;
end;

procedure TfEmissaoNotaFiscal.Monta_Cor(Tipo: String);
begin
  if RzDBLookupComboBox1.KeyValue > 0 then
  begin
    Query1.Close;
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT Codigo, Nome');
    if Tipo = 'P' then
    begin
      Query1.SQL.Add('FROM dbCor, dbProdutoCor');
      Query1.SQL.Add('WHERE (CodProduto = :x0 AND Codigo = CodCor)');
    end
    else
    begin
      Query1.SQL.Add('FROM dbCor, dbMaterialCor');
      Query1.SQL.Add('WHERE (CodMaterial = :x0 AND Codigo = CodCor)');
    end;
    Query1.Params[0].AsInteger := RzDBLookupComboBox1.KeyValue;
    Query1.SQL.Add('ORDER BY Nome');
    Query1.Open;
  end;
end;

procedure TfEmissaoNotaFiscal.BitBtn11Click(Sender: TObject);
begin
  fNotaFiscalImp := TfNotaFiscalImp.Create(Self);
  fNotaFiscalImp.ShowModal;
end;

procedure TfEmissaoNotaFiscal.BitBtn13Click(Sender: TObject);
begin
  if DM1.tNotaFiscal.State in [dsBrowse] then
  begin
    vCodNatOper := '';
    if DM1.tNatOperacao.Locate('Codigo',DM1.tNotaFiscalCodNatOper.AsInteger,[loCaseInsensitive]) then
      vCodNatOper := DM1.tNatOperacaoCodNatOper.AsString;

    DM1.tCReceber.Filtered := False;
    DM1.tCReceber.Filter   := 'NumSeqNota = '''+DM1.tNotaFiscalNumSeq.AsString+''' and CodCli = '''+DM1.tNotaFiscalCodCli.AsString+''' and Filial = '''+Dm1.tNotaFiscalFilial.AsString+'''';
    DM1.tCReceber.Filtered := True;

    if not DM1.tCReceber.IsEmpty then
      exit;

    DM1.tCReceber.Filtered := False;
    Grava_Pgto('A');
  end;

end;

procedure TfEmissaoNotaFiscal.Rtulos1Click(Sender: TObject);
begin
  fPrevRelComprovante := TfPrevRelComprovante.Create(Self);
  fPrevRelComprovante.Edit1.Text := Dm1.tNotaFiscalNumNota.AsString;
  fPrevRelComprovante.Edit2.Text := Dm1.tNotaFiscalNumNota.AsString;
  if Dm1.tNotaFiscalCodTransp.AsInteger > 0 then
    fPrevRelComprovante.DBLookupComboBox1.KeyValue := Dm1.tNotaFiscalCodTransp.AsInteger;
  fPrevRelComprovante.SpeedButton1Click(Sender);
  fPrevRelComprovante.ShowModal;
end;

function TfEmissaoNotaFiscal.Verifica_DadosProduto: Boolean;
begin
  Result := False;
  DM1.tProduto.IndexFieldNames := 'Codigo';
  if not DM1.tProduto.FindKey([RzDBLookupComboBox1.KeyValue]) then
  begin
    vMSGErro := vMSGErro + #13 + '*** Produto não encontrado!';
    exit;
  end;

  if (RxDBLookupCombo4.Text = '') and (ComboBox3.ItemIndex = 0) then
  begin
    vMSGErro := vMSGErro + #13 + '*** Item não pode ser confirmado sem cor!';
    Exit;
  end;

  vNomeItem       := DM1.tProdutoNome.AsString;
  vRefItem        := DM1.tProdutoReferencia.AsString;
  vCodItem        := DM1.tProdutoCodigo.AsInteger;
  vClasFiscalItem := DM1.tProdutoCodClasFiscal.AsString;

  if DM1.tProdutoProdMat.AsString = 'P' then
    vOrigemProdAux  := DM1.tProdutoOrigemProd.AsString
  else
  begin
    vOrigemProdAux  := '0';
    vClasFiscalItem := '00';
    vClasFiscalItem := DM1.tProdutoCodClasFiscal.AsString;
  end;

  vTipoReg := DM1.tProdutoProdMat.AsString;
  Result   := True;
end;

function TfEmissaoNotaFiscal.Verifica_DadosMaterial: Boolean;
var
  vQtdGrade: Integer;
begin
  Result := False;
  DM1.tMaterial.IndexFieldNames := 'Codigo';
  if not DM1.tMaterial.FindKey([RzDBLookupComboBox1.KeyValue]) then
  begin
    vMSGErro := vMSGErro + #13 + '*** Material não encontrado!';
    exit;
  end;
  if Dm1.tMaterialLancaGrade.AsBoolean then
  begin
    vQtdGrade := 0;
    tAuxNotaFiscalGrade.First;
    while not tAuxNotaFiscalGrade.Eof do
    begin
      vQtdGrade := vQtdGrade + tAuxNotaFiscalGradeQtd.AsInteger;
      tAuxNotaFiscalGrade.Next;
    end;
    if vQtdGrade < 1 then
    begin
      vMSGErro := vMSGErro + #13 + 'Deve ser informada a grade para esse material!';
      exit;
    end
    else
    if (Dm1.tMaterialLancaCor.AsBoolean) and (RxDBLookupCombo4.Text = '') then
    begin
      vMSGErro := vMSGErro + #13 + 'Deve ser informada a cor desse material!';
      exit;
    end
    else
    if not (Dm1.tMaterialLancaCor.AsBoolean) and (RxDBLookupCombo4.Text <> '') then
    begin
      vMSGErro := vMSGErro + #13 + 'Material não possui cor!';
      exit;
    end;
  end;
  if DM1.tMaterialTipoMat.AsString = 'O' then
    vOrigemProdAux := '0'
  else
    vOrigemProdAux := DM1.tMaterialOrigemProd.AsString;
  vTipoReg := 'M';
  vNomeItem        := DM1.tMaterialNome.AsString;
  vRefItem         := DM1.tMaterialCodigo.AsString;
  vCodItem         := DM1.tMaterialCodigo.AsInteger;
  if DM1.tMaterialTipoReg.AsString = 'N' then
    vClasFiscalItem  := '00'
  else
    vClasFiscalItem  := DM1.tMaterialCodClasFiscal.AsString;
  Result := True;
end;

procedure TfEmissaoNotaFiscal.RzButton5Click(Sender: TObject);
var
  vOrigemAux: String;
begin
  fNotaFiscalAliq := TfNotaFiscalAliq.Create(Self);
  fNotaFiscalAliq.CurrencyEdit1.Value := fEmissaoNotaFiscal.vPercPis;
  fNotaFiscalAliq.CurrencyEdit2.Value := fEmissaoNotaFiscal.vPercCofins;
  fNotaFiscalAliq.CurrencyEdit3.Value := fEmissaoNotaFiscal.vVlrPis;
  fNotaFiscalAliq.CurrencyEdit4.Value := fEmissaoNotaFiscal.vVlrCofins;
  fNotaFiscalAliq.cePercImportacao.Value := fEmissaoNotaFiscal.vPercImportacao;
  fNotaFiscalAliq.ceDespAduaneira.Value  := fEmissaoNotaFiscal.vVlrAduaneira;
  fNotaFiscalAliq.ckSomaImportacao.Checked := fEmissaoNotaFiscal.vSoma_Automatico_Imp;

  if fEmissaoNotaFiscal.vCodPis <> '' then
    fNotaFiscalAliq.RxDBCodPis.Value    := fEmissaoNotaFiscal.vCodPis
  else
    fNotaFiscalAliq.RxDBCodPis.Value    := '';
  if fEmissaoNotaFiscal.vCodCofins <> '' then
    fNotaFiscalAliq.RXDBCodCofins.Value := fEmissaoNotaFiscal.vCodCofins
  else
    fNotaFiscalAliq.RXDBCodCofins.Value := '';
  if fEmissaoNotaFiscal.vTipoPis = 'P' then
    fNotaFiscalAliq.cbTipoPis.ItemIndex := 0
  else
    fNotaFiscalAliq.cbTipoPis.ItemIndex := 1;
  if fEmissaoNotaFiscal.vTipoCofins = 'P' then
    fNotaFiscalAliq.cbTipoCofins.ItemIndex := 0
  else
    fNotaFiscalAliq.cbTipoCofins.ItemIndex := 1;
  if fEmissaoNotaFiscal.vOrigemMerc <> '' then
    fNotaFiscalAliq.rxdbOrigem.Value := fEmissaoNotaFiscal.vOrigemMerc;
  if fEmissaoNotaFiscal.vSomaVlrTotalProd then
    fNotaFiscalAliq.cbSomaTotal.ItemIndex := 0
  else
    fNotaFiscalAliq.cbSomaTotal.ItemIndex := 1;
  fNotaFiscalAliq.BitBtn1.Enabled := ((DM1.tNotaFiscal.State in [dsEdit,dsInsert]) and (Edit1.Text <> ''));
  fNotaFiscalAliq.ShowModal;

  if fEmissaoNotaFiscal.vOrigemMerc <> vOrigemAux then
    prc_Mover_Lei_Transparencia;

  //05/12/2012
  {fNotaFiscalAliq.ceBaseImportacao.Value := fEmissaoNotaFiscal.vBaseImportacao;
  fNotaFiscalAliq.ceVlrImportacao.Value  := fEmissaoNotaFiscal.vVlrImportacao;
  fNotaFiscalAliq.ceVlrAduaneira.Value   := fEmissaoNotaFiscal.vVlrAduaneira;
  fNotaFiscalAliq.ceVlrIOF.Value         := fEmissaoNotaFiscal.vVlrIOF;}

  //28/10/2010 Cleomar
  {if fEmissaoNotaFiscal.vCodPis <> '' then
    fNotaFiscalAliq.RxDBCodPis.Value    := fEmissaoNotaFiscal.vCodPis
  else
    fNotaFiscalAliq.RxDBCodPis.Value    := '';
  if fEmissaoNotaFiscal.vCodCofins <> '' then
    fNotaFiscalAliq.RXDBCodCofins.Value := fEmissaoNotaFiscal.vCodCofins
  else
    fNotaFiscalAliq.RXDBCodCofins.Value := '';
  if fEmissaoNotaFiscal.vTipoPis = 'P' then
    fNotaFiscalAliq.cbTipoPis.ItemIndex := 0
  else
    fNotaFiscalAliq.cbTipoPis.ItemIndex := 1;
  if fEmissaoNotaFiscal.vTipoCofins = 'P' then
    fNotaFiscalAliq.cbTipoCofins.ItemIndex := 0
  else
    fNotaFiscalAliq.cbTipoCofins.ItemIndex := 1;
  if fEmissaoNotaFiscal.vOrigemMerc <> '' then
    fNotaFiscalAliq.rxdbOrigem.Value := fEmissaoNotaFiscal.vOrigemMerc;
  if fEmissaoNotaFiscal.vSomaVlrTotalProd then
    fNotaFiscalAliq.cbSomaTotal.ItemIndex := 0
  else
    fNotaFiscalAliq.cbSomaTotal.ItemIndex := 1;

  //****************
  fNotaFiscalAliq.BitBtn1.Enabled := ((DM1.tNotaFiscal.State in [dsEdit,dsInsert]) and (Edit1.Text <> ''));
  fNotaFiscalAliq.ShowModal;}
end;

procedure TfEmissaoNotaFiscal.RzButton2Click(Sender: TObject);
begin
  fNotaFiscalReboque := TfNotaFiscalReboque.Create(Self);
  fNotaFiscalReboque.ShowModal;
end;

procedure TfEmissaoNotaFiscal.RzButton3Click(Sender: TObject);
begin
  fNotaFiscalLacre := TfNotaFiscalLacre.Create(Self);
  fNotaFiscalLacre.ShowModal;
end;

procedure TfEmissaoNotaFiscal.BitBtn3Click(Sender: TObject);
begin
  fNotaFiscalOBS := TfNotaFiscalOBS.Create(Self);
  fNotaFiscalOBS.ShowModal;
end;

procedure TfEmissaoNotaFiscal.BitBtn20Click(Sender: TObject);
begin
  if DM1.tNotaFiscalTipoDesconto.AsString = 'I' then
  begin
    ShowMessage('Desconto foi aplicado por item!');
    exit;
  end;

  if DM1.tNotaFiscalItens.RecordCount > 0 then
  begin
    fInfDescontoNota := TfInfDescontoNota.Create(Self);
    fInfDescontoNota.ShowModal;
    RzButton4Click(Sender);
  end
  else
  begin
    ShowMessage('Informar o desconto só depois de digitar os itens!');
    DM1.tNotaFiscalPercDesc.Clear;
    DM1.tNotaFiscalVlrTotalDesc.Clear;
  end;
end;

procedure TfEmissaoNotaFiscal.RzButton1Click(Sender: TObject);
begin
  fNotaFiscalOutrasDespesas := TfNotaFiscalOutrasDespesas.Create(Self);
  fNotaFiscalOutrasDespesas.ShowModal;
  RzButton4Click(Sender);
end;

procedure TfEmissaoNotaFiscal.RzButton4Click(Sender: TObject);
begin
  Calcula_Desconto_Novo(False);
end;

procedure TfEmissaoNotaFiscal.BitBtn9Click(Sender: TObject);
begin
  //NFe 2.0
  if (Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '2') or (Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '3') then
  begin
    fNotaFiscalContingencia := TfNotaFiscalContingencia.Create(Self);
    fNotaFiscalContingencia.DBDateEdit1.ReadOnly       := True;
    fNotaFiscalContingencia.RzDBDateTimeEdit2.ReadOnly := True;
    fNotaFiscalContingencia.DBMemo2.ReadOnly           := True;
    fNotaFiscalContingencia.ShowModal;
  end;
end;

procedure TfEmissaoNotaFiscal.BitBtn10Click(Sender: TObject);
begin
  fNotaFiscalRef := TfNotaFiscalRef.Create(Self);
  fNotaFiscalRef.ShowModal;
end;

procedure TfEmissaoNotaFiscal.BitBtn12Click(Sender: TObject);
begin
  if DM1.tNotaFiscalRef.IsEmpty then
    exit;
  if MessageDlg('Deseja excluir a nota referencia?',mtConfirmation,[mbOK,mbNo],0) = mrOK then
    DM1.tNotaFiscalRef.Delete;
end;

function TfEmissaoNotaFiscal.Cancelar: Boolean;
var
  vFlag: String;
begin
  Result := False;
  vFlag := 'S';
  if DM1.tNotaFiscalImpressa.AsBoolean then
  begin
    vEncComissao := False;
    if (DM1.tNotaFiscalCodVendedor.AsInteger > 0) and (DM1.tNotaFiscalNroLancExtComissao.AsInteger > 0) then
    begin
      DM1.Verifica_ComissaoEnc(DM1.tNotaFiscalCodVendedor.AsInteger,DM1.tNotaFiscalDtEmissao.AsDateTime);
      if vEncComissao then
        exit;
    end;

    DM1.tCReceber.Filtered := False;
    DM1.tCReceber.Filter   := 'NumSeqNota = '''+DM1.tNotaFiscalNumSeq.AsString+''' and CodCli = '''+DM1.tNotaFiscalCodCli.AsString+''' and Filial = '''+Dm1.tNotaFiscalFilial.AsString+'''';
    DM1.tCReceber.Filtered := True;
    if not DM1.tCReceber.IsEmpty then
    begin
      DM1.tCReceberParc.First;
      while not DM1.tCReceberParc.Eof do
      begin
        if (DM1.tCReceberParcPgtoParcial.AsFloat > 0) or (DM1.tCReceberParcVlrDevolucao.AsFloat > 0)  then
        begin
          vFlag := 'P';
          DM1.tCReceberParc.Last;
        end;
        DM1.tCReceberParc.Next;
      end;
    end;
  end;
  DM1.tCReceber.Filtered := False;
  if vFlag = 'P' then
  begin
    ShowMessage('Já foi feito pagamento nesta nota!');
    exit;
  end;
  if vFlag = 'E' then
    begin
      ShowMessage('Já foi gerado arquivo para o banco com esta nota!');
      exit;
    end;
  Result := True;
end;

function TfEmissaoNotaFiscal.Verifica_Dados: Boolean;
var
  vValorTotalStr: String;
begin
  Result   := False;
  vMSGErro := '';
  try
    if (StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalDupl.AsFloat)) > 0) and (DM1.tNotaFiscalCodTipoCobr.AsInteger <= 0) then
      vMSGErro := vMSGErro + #13 + '*** Forma de Pagamento não informada!';
    if DM1.tNotaFiscalDtEmissao.AsDateTime < 10 then
      vMSGErro := vMSGErro + #13 + '*** Data de emissão não foi informada!';
    if (DM1.tNotaFiscalEmitDest.AsString = '1') and (DM1.tNotaFiscalEmitDest.AsString = '2') and
       (DM1.tNotaFiscalEmitDest.AsString = '3') and (DM1.tNotaFiscalEmitDest.AsString = '9') then
      vMSGErro := vMSGErro + #13 + '*** Não foi informado o tipo do frete!';
    if (StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalDupl.AsFloat)) < 0) or
       (StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalItens.AsFloat)) < 0) or
       (StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalNota.AsFloat)) < 0) then
      vMSGErro := vMSGErro + #13 + '*** Valor das duplicatas, total do itens ou total da nota com problema!';
    if (dm1.tNotaFiscalVlrTotalDupl.AsCurrency > 0) and (dm1.tNotaFiscalCondPgto.AsString = 'N') then
      vMSGErro := vMSGErro + #13 + '*** Exite valor de duplicatas, condição de pagamento deve ser escolhida!';
    if (vDataAnt > 0) and (DM1.tNotaFiscalDtEmissao.AsDateTime < vDataAnt) and (DM1.tNotaFiscalItens.RecordCount > 0) then
      vMSGErro := vMSGErro + #13 + '*** Data de emissão menor que a nota anterior!';
    if RxDBLookupCombo7.Text = '' then
      vMSGErro := vMSGErro + #13 + '*** Você deve preencher a Natureza de Operação!';
    if trim(DM1.tNotaFiscalSituacao.AsString) = '' then
      vMSGErro := vMSGErro + #13 + '*** Você deve preencher a situação!';
    if DM1.tNotaFiscalCodCli.AsString = '' then
      vMSGErro := vMSGErro + #13 + '*** Você deve selecionar um cliente!';
    if (DM1.tNotaFiscalCondPgto.AsString <> 'P') and (DM1.tNotaFiscalPrazoPgto.AsInteger > 0) then
      vMSGErro := vMSGErro + #13 + '*** Cond. de pagto. a vista ou nenhum não pode ter prazo e nem parcelas!';
    if DM1.tClienteCodigo.AsInteger <> DM1.tNotaFiscalCodCli.AsInteger then
    begin
      Dm1.tCliente.IndexFieldNames := 'Codigo';
      if (DM1.tCliente.FindKey([DM1.tNotaFiscalCodCli.AsInteger])) and
         (DM1.tClienteCgcCpf.AsString = '   .   .   -  ') or (DM1.tClienteCgcCpf.AsString = '  .   .   /    -  ') or (DM1.tClienteCgcCpf.AsString = '')then
        vMSGErro := vMSGErro + #13 + '*** Cliente sem CNPJ não pode ser confirmado!'
      else
        vMSGErro := vMSGErro + #13 + '*** Cliente não encontradoo!'
    end;
    if Length(Trim(DM1.tNotaFiscalPlaca.AsString)) > 7 then
      vMSGErro := vMSGErro + #13 + '*** Placa só pode conter letras e números!';
    Verifica_UF;
    if DM1.tPaisID.AsInteger <> DM1.tUFIDPais.AsInteger then
    begin
      DM1.tPais.IndexFieldNames := 'ID';
      if not DM1.tPais.FindKey([DM1.tUFIDPais.AsInteger]) then
        vMSGErro := vMSGErro + #13 + '*** País não cadastrado!';
    end;
    if (DM1.tClienteBairro.AsString = '') or (DM1.tClienteNumEnd.AsString = '') then
      vMSGErro := vMSGErro + #13 + '*** Cliente não possui bairro ou o nº no endereço!';
    if not DM1.tCidade.Locate('Codigo',DM1.tClienteCodCidade.AsInteger,([Locaseinsensitive])) then
      vMSGErro := vMSGErro + #13 + '*** Cidade não cadastrada!';
    if (DM1.tPaisCodPais.AsString = '1058') and (DM1.tCidadeCodMunicipio.AsString = '') then
      vMSGErro := vMSGErro + #13 + '*** Código do município não cadastrado!';
    if (DM1.tNotaFiscalCodTransp.AsInteger > 0) and (DM1.tNotaFiscalPlaca.AsString <> '') and (DM1.tNotaFiscalUFPlaca.AsString = '') then
      vMSGErro := vMSGErro + #13 + '*** Foi informada a placa e faltou a UF!';
    if (DM1.tNotaFiscalCodTransp.AsInteger > 0) and (DM1.tTransp.Locate('Codigo',DM1.tNotaFiscalCodTransp.AsInteger,([Locaseinsensitive]))) then
    begin
      if (Trim(Copy(DM1.tTranspCNPJ.AsString,1,2)) = '') or (DM1.tTranspCodCidade.AsInteger < 1) or (Trim(DM1.tTranspEndereco.AsString) = '') then
        vMSGErro := vMSGErro + #13 + '*** Faltou informar o CNPJ ou o endereço completo da transportadora!';
    end;
    if StrToFloat(FormatFloat('0.000000',DM1.tNotaFiscalPesoBruto.AsFloat)) < StrToFloat(FormatFloat('0.000000',DM1.tNotaFiscalPesoLiquido.AsFloat)) then
      vMSGErro := vMSGErro + #13 + '*** Peso bruto não pode ser menor que peso líquido!';
    if (RxDBLookupCombo7.Text = '') then
      vMSGErro := vMSGErro + #13 + '*** Você deve preencher a Natureza de Operação!';
    //if (RxDBComboBox2.ItemIndex = 0) and (DM1.tNotaFiscalCodVendedor.AsInteger <= 0) then
    //  vMSGErro := vMSGErro + #13 + '*** Você deve selecionar um vendedor!';
    if RxDBComboBox2.ItemIndex = 2 then
    begin
      if (RxDBLookupCombo9.Text <> '') or (DM1.tNotaFiscalPercComissao.AsFloat > 0) then
        vMSGErro := vMSGErro + #13 + '*** Não pode haver vendedor selecionado e/ou percentual de comissão!';
      if (DM1.tNotaFiscalCondPgto.AsString <> 'N') then
        vMSGErro := vMSGErro + #13 + '*** Não pode haver cond. de pgto. diferente de "Nenhum"!';
    end;
    if DBRadioGroup2.Value = 'P' then
    begin
      if (DM1.tNotaFiscalParc.IsEmpty) and (DM1.tNotaFiscalEntrada.AsCurrency <> DM1.tNotaFiscalVlrTotalDupl.AsCurrency) then
        vMSGErro := vMSGErro + #13 + '*** Você escolheu Cond.Pgto a Prazo, deve digitar as parcelas!';
      if trim(vMSGErro) = '' then
      begin
        vValorTotalStr := FormatFloat('0.00',DM1.tNotaFiscalVlrTotalDupl.AsFloat);
        Compara_Valor_Parcelas;
        if vValorParcelaTot <> vValorTotalStr then
          vMSGErro := vMSGErro + #13 + '*** Valor das parcelas não confere com total da nota fiscal!';
      end;
    end;
    if trim(vMSGErro) <> '' then
      MessageDlg(vMSGErro, mtError, [mbOk], 0)
    else
      Result := True;
    if trim(vMSGErro) = '' then
    begin
      if not(DM1.tNotaFiscalItens.IsEmpty) and ((RxDBLookupCombo10.Text = '') or (DBEdit26.Text = '') or (DBEdit29.Text = '') or (DBEdit30.Text = '')) then
      begin
        if MessageDlg('Há campos em branco "Transportadora", "Espécie", "Peso Bruto" ou "Peso Líquido" Deseja Confirmar assim mesmo?!',mtconfirmation,[mbok,mbno],0)=mrNo then
          vMSGErro := 'Erro';
      end;
      if (trim(vMSGErro) = '') and (DM1.tNotaFiscalQtd.AsInteger < 1) and (MessageDlg('Nota sem volume, confirma?',mtWarning,[mbOK,mbNO],0) = mrNo) then
        vMSGErro := 'Erro';
    end;
    if trim(vMSGErro) <> '' then
      Result := False;
  except
    on E: Exception do
    begin
      Result := False;
      MessageDlg('Falha na verificação dos dados da nota, favor tentar novamente!' +#13+#13 + E.Message , mtError, [mbOk], 0);
    end;
  end;
end;

procedure TfEmissaoNotaFiscal.Move_Tributos;
var
  //12.741/12
  vDescExp: String;
begin
  if RxDBLookupCombo15.Text = '' then
    exit;
  if DM1.tClienteCodigo.AsInteger <> DM1.tNotaFiscalCodCli.AsInteger then
  begin
    DM1.tCliente.IndexFieldNames := 'Codigo';
    DM1.tCliente.FindKey([DM1.tNotaFiscalCodCli.AsInteger]);
  end;
  if DM1.tNatOperacaoCodigo.AsInteger <> RxDBLookupCombo15.KeyValue then
  begin
    DM1.tNatOperacao.IndexFieldNames := 'Codigo';
    DM1.tNatOperacao.FindKey([RxDBLookupCombo15.KeyValue]);
  end;

  //if DM1.tClienteCodCSTIPI.AsString <> '' then
  //  RxDBLookupCombo6.Value := DM1.tClienteCodCSTIPI.AsString
  //else
  if ((ComboBox3.ItemIndex = 0) or (ComboBox3.ItemIndex = 2)) and (DM1.tProdutoCodCSTIPI.AsString <> '') then
    RxDBLookupCombo6.Value := DM1.tProdutoCodCSTIPI.AsString
  else
  if DM1.tNatOperacaoCodCSTIPI.AsString <> '' then
    RxDBLookupCombo6.Value := DM1.tNatOperacaoCodCSTIPI.AsString
  else
  if DM1.tFilialCodCSTIPI.AsString <> '' then
    RxDBLookupCombo6.Value := DM1.tFilialCodCSTIPI.AsString;

  fEmissaoNotaFiscal.vSomaVlrTotalProd := DM1.tNatOperacaoSomaMercNF.AsBoolean;
  if ComboBox3.ItemIndex <> 1 then
    fEmissaoNotaFiscal.vOrigemMerc := DM1.tProdutoOrigemProd.AsString
  else
    fEmissaoNotaFiscal.vOrigemMerc := DM1.tMaterialOrigemProd.AsString;

  if (fEmissaoNotaFiscal.SpeedButton23.Tag <> 1) then
  begin
    if DM1.tNatOperacaoCodPis.AsString <> '' then
    begin
      fEmissaoNotaFiscal.vCodPis  := DM1.tNatOperacaoCodPis.AsString;
      fEmissaoNotaFiscal.vTipoPis := DM1.tNatOperacaoTipoPis.AsString;
      fEmissaoNotaFiscal.vPercPis := DM1.tNatOperacaoPercPis.AsFloat;
    end
    else
    begin
      fEmissaoNotaFiscal.vCodPis  := DM1.tFilialCodPis.AsString;
      fEmissaoNotaFiscal.vTipoPis := DM1.tFilialTipoPis.AsString;
      fEmissaoNotaFiscal.vPercPis := DM1.tFilialPercPis.AsFloat;
    end;

    if DM1.tNatOperacaoCodCofins.AsString <> '' then
    begin
      fEmissaoNotaFiscal.vCodCofins  := DM1.tNatOperacaoCodCofins.AsString;
      fEmissaoNotaFiscal.vTipoCofins := DM1.tNatOperacaoTipoCofins.AsString;
      fEmissaoNotaFiscal.vPercCofins := DM1.tNatOperacaoPercCofins.AsFloat;
    end
    else
    begin
      fEmissaoNotaFiscal.vCodCofins  := DM1.tFilialCodCofins.AsString;
      fEmissaoNotaFiscal.vTipoCofins := DM1.tFilialTipoCofins.AsString;
      fEmissaoNotaFiscal.vPercCofins := DM1.tFilialPercCofins.AsFloat;
    end;
  end;
  //12.741/12
  vDescExp := '';
  if copy(DM1.tNatOperacaoCodNatOper.AsString,1,1) = '7' then
    vDescExp := '_EXP';
  if DM1.tNatOperacaoTipo_Ind_Ven.AsString = 'V' then
    vPercTributo := StrToFloat(FormatFloat('0.00',DM1.tFilial.FieldByName('Perc_Trib_NTS_Ven'+vDescExp).AsFloat))
  else
  if DM1.tNatOperacaoTipo_Ind_Ven.AsString = 'I' then
    vPercTributo := StrToFloat(FormatFloat('0.00',DM1.tFilial.FieldByName('Perc_Trib_NTS_Ind'+vDescExp).AsFloat));
  //********
end;

procedure TfEmissaoNotaFiscal.CartadeCorreo1Click(Sender: TObject);
begin
  //16/05/2012
  if (DM1.tNotaFiscalCancelada.AsBoolean) or (DM1.tNotaFiscalNFeProtocoloCancelada.AsString <> '') then
  begin
    ShowMessage('Nota Fiscal Cancelada!');
    exit;
  end;
  if trim(DM1.tNotaFiscalNFeChaveAcesso.AsString) = '' then
  begin
    ShowMessage('Nota Fiscal sem a chave de acesso!');
    exit;
  end;
  fNotaFiscalCCe := TfNotaFiscalCCe.Create(Self);
  fNotaFiscalCCe.vFilial := DM1.tNotaFiscalFilial.AsInteger;
  fNotaFiscalCCe.vNumSeq := DM1.tNotaFiscalNumSeq.AsInteger;
  fNotaFiscalCCe.ShowModal;
end;

procedure TfEmissaoNotaFiscal.prc_Chamar_Sel_Produto;
begin
  vCodProduto_Pos := 0;
  fSel_Produto := TfSel_Produto.Create(Self);
  fSel_Produto.ShowModal;
  if vCodProduto_Pos > 0 then
  begin
    Edit1.SetFocus;
    Edit1.Text := vReferencia_Pos;
  end;
end;

procedure TfEmissaoNotaFiscal.RzDBLookupComboBox2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F5) and (DM1.tNotaFiscal.State in [dsEdit,dsInsert]) then
    prc_Chamar_Sel_Produto;
end;

procedure TfEmissaoNotaFiscal.RzDBLookupComboBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F5) and (DM1.tNotaFiscal.State in [dsEdit,dsInsert]) then
    prc_Chamar_Sel_Produto;
end;

procedure TfEmissaoNotaFiscal.Panel14Enter(Sender: TObject);
begin
  Label86.Visible := (ComboBox3.ItemIndex = 0);
end;

procedure TfEmissaoNotaFiscal.RxDBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F9) and not(DM1.tNotaFiscalItens.IsEmpty) then
  begin
    fNotaFiscalAjustarIcms := TfNotaFiscalAjustarIcms.Create(Self);
    fNotaFiscalAjustarIcms.ShowModal;
  end;
end;

function TfEmissaoNotaFiscal.fnc_Verifica_Pagamento: String;
begin
  Result := 'N';
  DM1.tCReceber.Filtered := False;
  DM1.tCReceber.Filter   := 'NumSeqNota = '''+DM1.tNotaFiscalNumSeq.AsString+''' and CodCli = '''+DM1.tNotaFiscalCodCli.AsString+''' and Filial = '''+Dm1.tNotaFiscalFilial.AsString+'''';
  DM1.tCReceber.Filtered := True;
  DM1.tCReceber.First;

  DM1.tCReceberParc.First;
  while not DM1.tCReceberParc.Eof do
  begin
    if (StrToFloat(FormatFloat('0.00',DM1.tCReceberParcVlrDevolucao.AsFloat)) > 0) or
       (StrToFloat(FormatFloat('0.00',DM1.tCReceberParcPgtoParcial.AsFloat)) > 0) then
    begin
      Result := 'S';
      DM1.tCReceberParc.Last;
    end;
    DM1.tCReceberParc.Next;
  end;
  DM1.tCReceber.Filtered := False;
  if Result = 'S' then
    ShowMessage('Nota não pode ser alterado pois tem duplicatas pagas!')
end;

procedure TfEmissaoNotaFiscal.BitBtn14Click(Sender: TObject);
begin
  if Trim(DM1.tNotaFiscalNFeChaveAcesso.AsString) <> '' then
  begin
    MessageDlg('*** Nota não pode ser excluida pois já possui Chave de Acesso!', mtError, [mbOk], 0);
    exit;
  end;
  //if DM1.tNotaFiscalNumSeq.AsInteger <= 0 then
  //  exit;
  if MessageDlg('Deseja excluir esta nota fiscal?',mtWarning,[mbOK,mbNO],0) = mrNo then
    exit;

  if not fnc_Excluir then
  begin
    MessageDlg('*** Nota não é a última!', mtWarning, [mbOk], 0);
    exit;
  end;
  prc_Excluir_Nota;
end;

procedure TfEmissaoNotaFiscal.prc_Excluir_Nota;
var
  ID: TTransactionDesc;
  sds: TSQLDataSet;
  vFlag: Boolean;
begin
  sds  := TSQLDataSet.Create(nil);
  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    vFlag := False;
    while not vflag do
    begin
      try
        sds.Close;
        sds.SQLConnection := dmDatabase.scoDados;
        sds.NoMetadata    := True;
        sds.GetMetadata   := False;
        sds.CommandText := ' UPDATE TABELALOC SET FLAG = 0 ' +
                           ' WHERE TABELA = ' + QuotedStr('NOTAFISCAL');
        sds.ExecSQL();
        vFlag := True;
      except
        vFlag := False;
      end
    end;

    if DM1.tNotaFiscalNumSeq.AsInteger > 0 then
    begin
      Exclui_Pgto('E');
      Desfaz_ExtComissao;
      Desfaz_ExtComissao_Modelista;
    end;

    DM1.tNotaFiscalItens.First;
    while not DM1.tNotaFiscalItens.Eof do
    begin
       Excluir_ItemNota('E');
       DM1.tNotaFiscalItens.Delete;
    end;
    DM1.tNotaFiscalParc.First;
    if not DM1.tNotaFiscalParc.IsEmpty then
      while not DM1.tNotaFiscalParc.Eof do
        DM1.tNotaFiscalParc.Delete;
    DM1.tNotaFiscalTBObs.First;
    while not DM1.tNotaFiscalTBObs.Eof do
      DM1.tNotaFiscalTBObs.Delete;
    DM1.tNotaFiscalRef.First;
    while not DM1.tNotaFiscalRef.Eof do
      DM1.tNotaFiscalRef.Delete;

    DMNotaFiscal.tNotaFiscalTBDesconto.First;
    while not DMNotaFiscal.tNotaFiscalTBDesconto.Eof do
      DMNotaFiscal.tNotaFiscalTBDesconto.Delete;
    DMNotaFiscal.tNotaFiscalTBDesconto.First;
    while not DMNotaFiscal.tNotaFiscalTBDesconto.Eof do
      DMNotaFiscal.tNotaFiscalTBDesconto.Delete;
    DMNotaFiscal.tNotaFiscalImp.First;
    while not DMNotaFiscal.tNotaFiscalImp.Eof do
    begin
      DMNotaFiscal.tNotaFiscalImpAdicao.First;
      while not DMNotaFiscal.tNotaFiscalImpAdicao.Eof do
        DMNotaFiscal.tNotaFiscalImpAdicao.Delete;
      DMNotaFiscal.tNotaFiscalImp.Delete;
    end;
    DMNotaFiscal.tNotaFiscalReboque.First;
    while not DMNotaFiscal.tNotaFiscalReboque.Eof do
      DMNotaFiscal.tNotaFiscalReboque.Delete;
    DMNotaFiscal.tNotaFiscalLacre.First;
    while not DMNotaFiscal.tNotaFiscalLacre.Eof do
      DMNotaFiscal.tNotaFiscalLacre.Delete;

    prc_Excluir_Sequencia_Nota;

    DM1.tNotaFiscal.Delete;

    dmDatabase.scoDados.Commit(ID);

  except
    on e: Exception do
      begin
        dmDatabase.scoDados.Rollback(ID);
        raise Exception.Create('Erro ao excluir a NOTA, favor tentar novamente: ' + #13 + e.Message);
      end;
  end;
  FreeAndNil(sds);
  Verifica_Nota_Cancelada;
end;

function TfEmissaoNotaFiscal.fnc_Erro: String;
var
  vErroProd: Boolean;
  vNat: Boolean;
begin
  vErroProd := False;
  Result    := 'N';
  try
    vMSGErro := '';
    if RxDBLookupCombo13.Text = '' then
      vMSGErro := vMSGErro + #13 + '*** Situação tributária é obrigatória para NFe!';
    if RxDBLookupCombo15.Text = '' then
      vMSGErro := vMSGErro + #13 + '*** Natureza de Operação não informada!';
    if DM1.tClienteCodigo.AsInteger <> DM1.tNotaFiscalCodCli.AsInteger then
    begin
      DM1.tCliente.IndexFieldNames := 'Codigo';
      DM1.tCliente.FindKey([DM1.tNotaFiscalCodCli.AsInteger]);
    end;
    DM1.tNatOperacao.IndexFieldNames := 'Codigo';
    if not DM1.tNatOperacao.FindKey([RxDBLookupCombo15.KeyValue]) then
      vMSGErro := vMSGErro + #13 + '*** Natureza de operação não encontrada!';
    if vSiglaUF = '' then
      Verifica_UF;
    if trim(vSiglaUF) = '' then
      vMSGErro := vMSGErro + #13 + '*** UF do cliente não informada!';
    tNotaFiscalItensIns.First;
    if ComboBox3.ItemIndex = 1 then
      vErroProd := Verifica_DadosMaterial
    else
      vErroProd := Verifica_DadosProduto;
    if Trim(vOrigemProdAux) = '' then
      vMSGErro := vMSGErro + #13 + '*** Origem do produto não foi informada!';
    if RzDBLookupComboBox1.Text = '' then
      vMSGErro := vMSGErro + #13 + '*** Falta informar o nome do produto!';

    if Trim(vOrigemProdAux) = '' then
      vMSGErro := vMSGErro + #13 + '*** Origem do produto não foi informada!';
    if (Trim(vClasFiscalItem) = '') and (vTipoReg <> 'N') then
      vClasFiscalItem := RxDBLookupCombo1.Text;
    if (Trim(vClasFiscalItem) = '') and (vTipoReg <> 'N') then
      vMSGErro := vMSGErro + #13 + '*** Classificação Fiscal não informada!';
    if (vTipoReg <> 'N') and ((Edit2.Text = '') or (Edit3.Text = '') or (Edit7.Text = '') or (RxDBLookupCombo13.Text = '')) then
      vMSGErro := vMSGErro + #13 + '*** Há campos requeridos em branco "U.M", "Quant.", "Valor Unitário", "Produto", "Sit. Tributária" !';
    vNat := True;
    if trim(vMSGErro) = '' then
    begin
      if ((ComboBox2.ItemIndex = 0) and not(DM1.tNatOperacaoCalcComissao.AsBoolean)) or
        (not(ComboBox2.ItemIndex = 0) and (DM1.tNatOperacaoCalcComissao.AsBoolean)) then
      begin
        if MessageDlg('Nat. não calcula comissão, porém o campo do item esta marcado para calcular' +#13+
              'Confirma este item para calcular a comissão?', mtConfirmation,[mbOK,mbNO],0) = mrNo then
          vNat := False;
      end;
    end;
    if trim(vMSGErro) = '' then
    begin
      if not(DM1.tNatOperacaoGeraDuplicata.AsBoolean) and (CurrencyEdit1.Value > 0) and (RxDBLookupCombo14.Text <> '') then
      begin
        if MessageDlg('Este item não gera valor de cobrança, e existe % Modelista e Modelista no item, ' +#13+
              'Confirmar, caso confirme, vai gerar comissão para o modelista?', mtConfirmation,
              [mbOK,mbNO],0) = mrNO then
          vNat := False;
      end;
    end;
    if not vNat then
      Result := 'S'
    else
    if trim(vMSGErro) <> '' then
    begin
      MessageDlg(vMSGErro, mtError, [mbOk], 0);
      Result := 'S';
    end;
  except
    on E: Exception do
    begin
      Result := '';
      MessageDlg('Falha na verificação do item, favor tentar novamente!' +#13+#13 + E.Message , mtError, [mbOk], 0);
    end;
  end;

end;

procedure TfEmissaoNotaFiscal.prc_Gravar_Numero_Nota;
var
  sds: TSQLDataSet;
  vAux: Integer;
  vFlag: Boolean;
begin
  sds  := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := ' SELECT MAX(NUMNOTA) NUMNOTA FROM SEQUENCIAL_NUMNOTA '

                       +  ' WHERE FILIAL = ' + IntToStr(DM1.tFilialCodigo.AsInteger)
                       +  '   AND SERIE  = ' + QuotedStr(DM1.tParametrosSerieNormal.AsString);
    sds.Open;
    vAux := sds.FieldByName('NUMNOTA').AsInteger;

    vFlag := False;
    while not vFlag do
    begin
      vAux := vAux + 1;
      DM1.qVerificarNota.Close;
      DM1.qVerificarNota.ParamByName('Filial').AsInteger  := DM1.tNotaFiscalFilial.AsInteger;
      DM1.qVerificarNota.ParamByName('Serie').AsString    := DM1.tParametrosSerieNormal.AsString;
      DM1.qVerificarNota.ParamByName('NumNota').AsInteger := vAux;
      DM1.qVerificarNota.Open;
      if DM1.qVerificarNota.IsEmpty then
        vFlag := True;
    end;

    if not(DM1.tNotaFiscal.State in [dsEdit,dsInsert]) then
      DM1.tNotaFiscal.Edit;
    DM1.tNotaFiscalNumNota.AsInteger := vAux;
    DM1.tNotaFiscalSerie.AsString    := DM1.tParametrosSerieNormal.AsString;

    DM1.tNotaFiscalTipoEnvioNF.AsString        := '1-NORMAL';
    DM1.tNotaFiscalVersaoNFe.AsString          := DM1.tParametrosVersaoNFe.AsString;
    DM1.tNotaFiscalIdentVersaoEmissao.AsString := DM1.tParametrosVersaoEmissaoNFe.AsString;

    sds.Close;
    sds.CommandText   := ' UPDATE SEQUENCIAL_NUMNOTA SET NUMNOTA = ' + IntToStr(DM1.tNotaFiscalNumNota.AsInteger)
                       +  ' WHERE FILIAL = ' + IntToStr(DM1.tNotaFiscalFilial.AsInteger)
                       +  '   AND SERIE  = ' + QuotedStr(DM1.tNotaFiscalSerie.AsString);
    sds.ExecSQL();
  finally
    FreeAndNil(sds);
  end;
end;

procedure TfEmissaoNotaFiscal.prc_Excluir_Sequencia_Nota;
var
  sds: TSQLDataSet;
  vAux: Integer;
begin
  if DM1.tNotaFiscalNumNota.AsInteger <= 0 then
    exit;

  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := ' SELECT MAX(NUMNOTA) NUMNOTA FROM SEQUENCIAL_NUMNOTA '
                       +  ' WHERE FILIAL = ' + IntToStr(DM1.tNotaFiscalFilial.AsInteger)
                       +  '   AND SERIE  = ' + QuotedStr(DM1.tNotaFiscalSerie.AsString);
    sds.Open;
    if sds.FieldByName('NUMNOTA').AsInteger = DM1.tNotaFiscalNumNota.AsInteger then
    begin
      sds.Close;
      vAux := DM1.tNotaFiscalNumNota.AsInteger  - 1;
      sds.CommandText   := ' UPDATE SEQUENCIAL_NUMNOTA SET NUMNOTA = ' + IntToStr(vAux)
                         +  ' WHERE FILIAL = ' + IntToStr(DM1.tNotaFiscalFilial.AsInteger)
                         +  '   AND SERIE  = ' + QuotedStr(DM1.tNotaFiscalSerie.AsString);
      sds.ExecSQL();
    end;

  finally
    FreeAndNil(sds);
  end;

end;

function TfEmissaoNotaFiscal.fnc_Excluir: Boolean;
var
  vAux: Integer;
begin
  Result := True;
  if DM1.tNotaFiscalNumNota.AsInteger > 0 then
  begin
    vAux := DM1.tNotaFiscalNumNota.AsInteger + 1;
    if DMNotaFiscal.tNotaFiscalIns.Locate('Filial;NumNota;Serie',VarArrayOf([DM1.tNotaFiscalFilial.AsInteger,vAux,DM1.tNotaFiscalSerie.AsString]),[locaseinsensitive]) then
      Result := False;
  end;
end;

procedure TfEmissaoNotaFiscal.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = TabSheet10 then
  begin
    Label89.Font.Color := clBlack;
    Label90.Font.Color := clBlack;
    Label91.Font.Color := clBlack;
    Label92.Font.Color := clBlack;
    Label93.Font.Color := clBlack;
    Label94.Font.Color := clBlack;
    Label95.Font.Color := clBlack;
  end;
end;

procedure TfEmissaoNotaFiscal.prc_Mover_Lei_Transparencia;
var
  vDescExp: String;
begin
  {ceFederal.value   := StrToFloat(FormatFloat('0.00',0));
  ceEstadual.value  := StrToFloat(FormatFloat('0.00',0));
  ceMunicipal.value := StrToFloat(FormatFloat('0.00',0));
  vFonte_Trib       := '';
  vVersao_Trib      := '';
  if dm1.tNatOperacaoCodigo.AsInteger <> RxDBLookupCombo15.KeyValue then
    if not dm1.tNatOperacao.Locate('ID',RxDBLookupCombo15.KeyValue,[loCaseInsensitive]) then
      exit;
  if (DM1.tParametrosLei_Transp_Calcular.AsString = 'C') and (DM1.tNotaFiscalTipo_Consumidor.AsInteger = 0) then
    exit;
  prc_Busca_IBPT;}
end;

procedure TfEmissaoNotaFiscal.prc_Busca_IBPT;
var
  vComandoAux: String;
begin
  //24/10/2013
  //ceFederal.Value   := StrToFloat(FormatFloat('0.00',0));
  //ceEstadual.Value  := StrToFloat(FormatFloat('0.00',0));
  //ceMunicipal.Value := StrToFloat(FormatFloat('0.00',0));
  //vVersao_Trib      := '';
  //vFonte_Trib       := '';
  {if trim(rxDBLookupCombo15.Text) = '' then
    exit;
  if CurrencyEdit6.AsInteger <> DM1.tProdutoCodigo.AsInteger then
    DM1.tProduto.Locate('Codigo',CurrencyEdit6.AsInteger,[loCaseInsensitive]);

  if RxDBLookupCombo15.KeyValue <> DM1.tNatOperacaoCodigo.AsInteger then
    DM1.tNatOperacao.Locate('Codigo',RxDBLookupCombo15.KeyValue,[loCaseInsensitive]);

  if (DM1.tNatOperacaoGerar_Tributo.AsString <> 'S') then
    exit;

  vComandoAux := '';
  DMTabIBPT.qIBPT.Close;
  DMTabIBPT.qIBPT.SQL.Text := DMTabIBPT.ctqIBPT;
  if (DM1.tParametrosTipo_Lei_Transp.AsString = 'P') then
  begin
    if DM1.tNatOperacaoTipo_Ind_Ven.AsString = 'V' then
      vComandoAux := 'WHERE I.CODIGO = ' + QuotedStr('COMERCIO')
    else
    if DM1.tNatOperacaoTipo_Ind_Ven.AsString = 'I' then
      vComandoAux := 'WHERE I.CODIGO = ' + QuotedStr('INDUSTRIA');
  end
  else
  begin
    vComandoAux := 'WHERE I.CODIGO = ' + QuotedStr(RxDBLookupCombo5.Value);
    vComandoAux := vComandoAux + '  AND I.EX = ' + QuotedStr(DM1.tProdutoNCM_Ex.AsString);
  end;
  if trim(vComandoAux) = '' then
    exit;
  DMTabIBPT.qIBPT.SQL.Text := DMTabIBPT.qIBPT.SQL.Text + ' ' + vComandoAux;
  DMTabIBPT.qIBPT.Open;
  if not DMTabIBPT.qIBPT.IsEmpty then
  begin
    if (fEmissaoNotaFiscal.vOrigemMerc = '0') or (fEmissaoNotaFiscal.vOrigemMerc = '3')
      or (fEmissaoNotaFiscal.vOrigemMerc = '4') or (fEmissaoNotaFiscal.vOrigemMerc = '5') then
      ceFederal.Value := StrToFloat(FormatFloat('0.00',DMTabIBPT.qIBPTPERC_NACIONAL.AsFloat))
    else
      ceFederal.Value := StrToFloat(FormatFloat('0.00',DMTabIBPT.qIBPTPERC_IMPORTACAO.AsFloat));
    ceEstadual.Value  := StrToFloat(FormatFloat('0.00',DMTabIBPT.qIBPTPERC_ESTADUAL.AsFloat));
    ceMunicipal.value := StrToFloat(FormatFloat('0.00',DMTabIBPT.qIBPTPERC_MUNICIPAL.AsFloat));
    vFonte_Trib       := DMTabIBPT.qIBPTFONTE.AsString;
    vVersao_Trib      := DMTabIBPT.qIBPTVERSAO.AsString;
  end;

  {CurrencyEdit8.Value := StrToFloat(FormatFloat('0.00',0));
  DMTabIBPT.qIBPT.Close;
  DMTabIBPT.qIBPT.ParamByName('CODIGO').AsString := RxDBLookupCombo5.Value;
  DMTabIBPT.qIBPT.ParamByName('EX').AsString     := DM1.tProdutoNCM_Ex.AsString;
  DMTabIBPT.qIBPT.Open;
  if not DMTabIBPT.qIBPT.IsEmpty then
  begin
    if (fEmissaoNotaFiscal.vOrigemMerc = '0') or (fEmissaoNotaFiscal.vOrigemMerc = '3')
      or (fEmissaoNotaFiscal.vOrigemMerc = '4') or (fEmissaoNotaFiscal.vOrigemMerc = '5') then
      CurrencyEdit8.Value := StrToFloat(FormatFloat('0.00',DMTabIBPT.qIBPTPERC_NACIONAL.AsFloat))
    else
      CurrencyEdit8.Value := StrToFloat(FormatFloat('0.00',DMTabIBPT.qIBPTPERC_IMPORTACAO.AsFloat));
  end;}
end;

procedure TfEmissaoNotaFiscal.RxDBLookupCombo10Enter(Sender: TObject);
begin
  DM1.tTransp.IndexFieldNames := 'Nome';
end;

procedure TfEmissaoNotaFiscal.RxDBLookupCombo15Enter(Sender: TObject);
begin
  DM1.tNatOperacao.IndexFieldNames := 'CodNatOper';
end;

procedure TfEmissaoNotaFiscal.rxdbEnq_IPIKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_F5 then
  begin
    vID_EnqIPI_Pos := 0;
    fSel_EnqIPI := TfSel_EnqIPI.Create(Self);
    fSel_EnqIPI.ShowModal;
    if vID_EnqIPI_Pos > 0 then
      rxdbEnq_IPI.KeyValue := vID_EnqIPI_Pos;
  end;
end;

procedure TfEmissaoNotaFiscal.DBDateEdit2Exit(Sender: TObject);
begin
  try
    DM1.tNotaFiscalDtEntr.AsDateTime := DM1.tNotaFiscalDtEmissao.AsDateTime;
  except
  end;
end;

procedure TfEmissaoNotaFiscal.btnExpDrawBackClick(Sender: TObject);
begin
  if DM1.tNotaFiscalItensItem.AsInteger <= 0 then
    exit;
  frmCadNotaFiscal_Itens_DrawBack := TfrmCadNotaFiscal_Itens_DrawBack.Create(Self);
  frmCadNotaFiscal_Itens_DrawBack.vID_Loc   := DM1.tNotaFiscalNumSeq.AsInteger;
  frmCadNotaFiscal_Itens_DrawBack.vItem_Loc := DM1.tNotaFiscalItensItem.AsInteger;
  frmCadNotaFiscal_Itens_DrawBack.vEdicao   := (DM1.tNotaFiscal.State in [dsedit,dsInsert]);
  frmCadNotaFiscal_Itens_DrawBack.ShowModal;
  FreeAndNil(frmCadNotaFiscal_Itens_DrawBack);
end;

procedure TfEmissaoNotaFiscal.SpeedButton10Click(Sender: TObject);
begin
  if DM1.tUsuarioTiposCobr.AsBoolean then
  begin
    fTipoCobranca := TfTipoCobranca.Create(Self);
    fTipoCobranca.ShowModal;
    FreeAndNil(fTipoCobranca);
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado!');
end;

end.

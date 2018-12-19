unit UPedido;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, DBCtrls, StdCtrls, Buttons, ToolEdit,
  Mask, CurrEdit, ComCtrls, Db, DBTables, RXLookup, Grids, DBGrids, RXDBCtrl, MemTable, Menus, RXCtrls, DBFilter, Variants,
  ALed, RzDBCmbo, DBClient;

type
  TfPedido = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    Panel4: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    BitBtn5: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    tPedidoItemIns: TTable;
    Bevel1: TBevel;
    DBDateEdit1: TDBDateEdit;
    Label8: TLabel;
    DBText2: TDBText;
    tAuxPedidoGrade: TTable;
    dsAuxPedidoGrade: TDataSource;
    tPedidoItemInsPedido: TIntegerField;
    tPedidoItemInsItem: TIntegerField;
    tPedidoItemInsCodProduto: TIntegerField;
    tPedidoItemInsCodCor: TIntegerField;
    tPedidoItemInsCodGrade: TIntegerField;
    tPedidoItemInsQtdPares: TFloatField;
    tPedidoItemInsPreco: TFloatField;
    tPedidoParcIns: TTable;
    Label9: TLabel;
    SpeedButton6: TSpeedButton;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    GroupBox3: TGroupBox;
    DBGrid3: TDBGrid;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    Label11: TLabel;
    SpeedButton7: TSpeedButton;
    Label12: TLabel;
    DBDateEdit2: TDBDateEdit;
    Label13: TLabel;
    DBDateEdit3: TDBDateEdit;
    tPedidoItemInsVlrTotal: TFloatField;
    tPedidoMaterialIns: TTable;
    tPedidoMaterialInsPedido: TIntegerField;
    tPedidoMaterialInsItemPed: TIntegerField;
    tPedidoMaterialInsOrdem: TIntegerField;
    tPedidoMaterialInsCodCor: TIntegerField;
    tPedidoMaterialInsCodMaterial: TIntegerField;
    tPedidoMaterialInsConsumoPr: TFloatField;
    tAuxPedidoGradeCodGrade: TIntegerField;
    tAuxPedidoGradePosicao: TIntegerField;
    tAuxPedidoGradeQtd: TFloatField;
    tAuxPedidoGradeVlrUnitario: TFloatField;
    tAuxPedidoGradeVlrTotal: TFloatField;
    tAuxPedidoGradelkTamanho: TStringField;
    tPedidoParcInsPedido: TIntegerField;
    tPedidoParcInsItem: TIntegerField;
    tPedidoParcInsDtVencto: TDateField;
    tPedidoParcInsValor: TFloatField;
    tPedidoDescontoIns: TTable;
    tPedidoDescontoInsPedido: TIntegerField;
    tPedidoDescontoInsItem: TIntegerField;
    tPedidoDescontoInsPercDesconto: TFloatField;
    tPedidoDescontoInsVlrDesconto: TFloatField;
    Label15: TLabel;
    DBText3: TDBText;
    Label16: TLabel;
    DBText4: TDBText;
    tPedidoIns: TTable;
    tPedidoInsPedido: TIntegerField;
    tPedidoInsDtEmissao: TDateField;
    tPedidoInsCodCliente: TIntegerField;
    tPedidoInsCodTransp: TIntegerField;
    tPedidoInsCodRedespacho: TIntegerField;
    tPedidoInsCodCondPgto: TIntegerField;
    tPedidoInsTipoFrete: TStringField;
    tPedidoInsCodVendedor: TIntegerField;
    tPedidoInsPercComissao: TFloatField;
    tPedidoInsDtIniEmbarque: TDateField;
    tPedidoInsDtFinEmbarque: TDateField;
    tPedidoInsCodNatOper: TIntegerField;
    tPedidoInsSituacao: TIntegerField;
    tPedidoInsNumLote: TIntegerField;
    tPedidoInsQtdPares: TFloatField;
    tPedidoInsVlrTotal: TFloatField;
    tPedidoInsVlrMercadoria: TFloatField;
    tPedidoInsVlrDesconto: TFloatField;
    DBRadioGroup2: TDBRadioGroup;
    RxSpeedButton2: TRxSpeedButton;
    tPedidoInsGerarLote: TStringField;
    tPedidoInsCancelado: TBooleanField;
    tPedidoInsSuspenso: TBooleanField;
    tPedidoInsImpresso: TBooleanField;
    Panel6: TPanel;
    BitBtn10: TBitBtn;
    Panel8: TPanel;
    Label14: TLabel;
    tPedidoItemInsCodCabedal1: TIntegerField;
    tPedidoItemInsCodCabedal2: TIntegerField;
    tPedidoItemInsCodCorForro: TIntegerField;
    tPedidoItemInsCodCorSolado: TIntegerField;
    tPedidoItemInsCodCorPalmilha: TIntegerField;
    tPedidoItemInsCancelado: TBooleanField;
    Panel10: TPanel;
    BitBtn15: TBitBtn;
    tPedidoInsPesoBruto: TFloatField;
    tPedidoInsPesoLiquido: TFloatField;
    tPedidoItemInsQtdParesFat: TFloatField;
    tPedidoItemInsQtdParesRest: TFloatField;
    tPedidoItemInsCopiado: TBooleanField;
    tPedidoItemInsSelecionado: TBooleanField;
    tPedidoItemInsQtdParesCanc: TFloatField;
    DBEdit2: TDBEdit;
    Label17: TLabel;
    tPedidoInsSelecionado: TBooleanField;
    tPedidoInsCopiado: TBooleanField;
    tPedidoInsPedidoCliente: TIntegerField;
    tPedidoInsObs: TMemoField;
    tAuxPedidoMat: TTable;
    dsAuxPedidoMat: TDataSource;
    tAuxPedidoMatItem: TIntegerField;
    tAuxPedidoMatCodCor: TIntegerField;
    tAuxPedidoMatCodMaterial: TIntegerField;
    tAuxPedidoMatConsumoPr: TFloatField;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    tProdutoCor: TTable;
    dsProdutoCor: TDataSource;
    tProdutoCorCodProduto: TIntegerField;
    tProdutoCorCodCor: TIntegerField;
    tProdutoCorlkNomeCor: TStringField;
    Label18: TLabel;
    Label21: TLabel;
    DBText7: TDBText;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    qCorRef: TQuery;
    dsqCorRef: TDataSource;
    RxDBFilter1: TRxDBFilter;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    StaticText1: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText9: TStaticText;
    RxDBLookupCombo3: TRxDBLookupCombo;
    TabSheet2: TTabSheet;
    DBMemo1: TDBMemo;
    Panel9: TPanel;
    Label39: TLabel;
    RxDBGrid1: TRxDBGrid;
    Edit2: TEdit;
    Edit3: TEdit;
    tAuxTamanho: TTable;
    dsAuxTamanho: TDataSource;
    tGradeItem: TTable;
    dsGradeItem: TDataSource;
    tGradeItemCodGrade: TIntegerField;
    tGradeItemPosicao: TIntegerField;
    tGradeItemTamanho: TStringField;
    tPedidoGrade: TTable;
    tPedidoGradePedido: TIntegerField;
    tPedidoGradeItemPed: TIntegerField;
    tPedidoGradeCodGrade: TIntegerField;
    tPedidoGradePosicao: TIntegerField;
    tPedidoGradeQtd: TFloatField;
    tPedidoGradeVlrUnitario: TFloatField;
    tPedidoGradeVlrTotal: TFloatField;
    tPedidoGradelkTamanho: TStringField;
    BitBtn17: TBitBtn;
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
    tPedido2PesoBruto: TFloatField;
    tPedido2PesoLiquido: TFloatField;
    tPedido2Selecionado: TBooleanField;
    tPedido2Copiado: TBooleanField;
    tPedido2PedidoCliente: TIntegerField;
    tPedido2Obs: TMemoField;
    StaticText2: TStaticText;
    Edit4: TEdit;
    RxDBLookupCombo4: TRxDBLookupCombo;
    tPedidoItemInsCodForro: TIntegerField;
    tPedidoItemInsCodEtiqueta: TIntegerField;
    tPedidoItemInsVlrDesconto: TFloatField;
    tPedidoItemInsCodSolado: TIntegerField;
    tPedidoItemInsSitTrib: TSmallintField;
    tPedidoInsQtdParesCanc: TFloatField;
    tPedidoInsQtdParesFat: TFloatField;
    tPedidoInsQtdParesRest: TFloatField;
    BitBtn18: TBitBtn;
    Label19: TLabel;
    BitBtn13: TBitBtn;
    DBEdit8: TDBEdit;
    tPedido2NumNota: TFloatField;
    tPedido2DtNota: TDateField;
    tPedido2QtdParesCanc: TFloatField;
    tPedido2QtdParesFat: TFloatField;
    tPedido2QtdParesRest: TFloatField;
    tPedido2QtdFatAut: TFloatField;
    tPedido2QtdFatMan: TFloatField;
    tPedidoInsNumNota: TFloatField;
    tPedidoInsDtNota: TDateField;
    tPedidoInsQtdFatAut: TFloatField;
    tPedidoInsQtdFatMan: TFloatField;
    tPedidoItemInsQtdFatAut: TFloatField;
    tPedidoItemInsQtdFatMan: TFloatField;
    tPedido2PedCliDif: TStringField;
    tPedidoInsPedCliDif: TStringField;
    tAuxPedidoGradePedido: TIntegerField;
    tAuxPedidoMatPedido: TIntegerField;
    tPedidoItemInsCodTaloneira: TIntegerField;
    tClientes: TTable;
    dsClientes: TDataSource;
    tClientesCodigo: TIntegerField;
    tClientesNome: TStringField;
    tClientesFantasia: TStringField;
    tClientesEndereco: TStringField;
    tClientesBairro: TStringField;
    tClientesCidade: TStringField;
    tClientesUf: TStringField;
    BitBtn20: TBitBtn;
    TabSheet3: TTabSheet;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    DBText8: TDBText;
    DBText5: TDBText;
    Label26: TLabel;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    tPedidoInsImpRotulo: TBooleanField;
    tPedidoInsImpCalcLote: TBooleanField;
    tPedidoInsObsRotulo: TMemoField;
    tPedido2ImpRotulo: TBooleanField;
    tPedido2ImpCalcLote: TBooleanField;
    tPedido2ObsRotulo: TMemoField;
    TabSheet4: TTabSheet;
    DBMemo2: TDBMemo;
    Label27: TLabel;
    DBEdit3: TDBEdit;
    tAuxTamanhoPedido: TIntegerField;
    tAuxTamanhoControle: TIntegerField;
    tAuxTamanhoTamanho: TStringField;
    tAuxTamanhoIndice: TIntegerField;
    tClientesCep: TStringField;
    RxDBLookupCombo5: TRxDBLookupCombo;
    RxDBLookupCombo6: TRxDBLookupCombo;
    Label28: TLabel;
    DBEdit4: TDBEdit;
    BitBtn19: TBitBtn;
    Label29: TLabel;
    DBEdit6: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    StaticText6: TStaticText;
    Edit5: TEdit;
    RxDBLookupCombo9: TRxDBLookupCombo;
    StaticText7: TStaticText;
    CheckBox1: TCheckBox;
    tPedidoItemInsReposicao: TBooleanField;
    Bevel6: TBevel;
    Label30: TLabel;
    DBText6: TDBText;
    Label31: TLabel;
    DBText12: TDBText;
    Bevel7: TBevel;
    Bevel8: TBevel;
    tAuxTamanhoPosicao: TIntegerField;
    tAuxPedidoMatCodPosicao: TIntegerField;
    tAuxPedidoMatImpTalao: TStringField;
    TabSheet5: TTabSheet;
    Panel11: TPanel;
    Label2: TLabel;
    RxDBLookupCombo7: TRxDBLookupCombo;
    SpeedButton4: TSpeedButton;
    Label6: TLabel;
    RxDBLookupCombo8: TRxDBLookupCombo;
    DBRadioGroup1: TDBRadioGroup;
    Label20: TLabel;
    DBEdit5: TDBEdit;
    tAuxPedidoMatlkTipoMat: TStringField;
    qTransp: TQuery;
    qTranspNome: TStringField;
    qTranspCodigo: TIntegerField;
    qTranspItem: TIntegerField;
    qTranspCodCidade: TIntegerField;
    qTranspEstado: TStringField;
    qsTransp: TDataSource;
    StaticText8: TStaticText;
    qMatRef: TQuery;
    dsqMatRef: TDataSource;
    GroupBox2: TGroupBox;
    SpeedButton3: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    qCorRefCodCor: TIntegerField;
    qCorRefNome: TStringField;
    BitBtn7: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn8: TBitBtn;
    RxDBLookupCombo11: TRxDBLookupCombo;
    RxLabel1: TRxLabel;
    GroupBox4: TGroupBox;
    StaticText10: TStaticText;
    DBText13: TDBText;
    StaticText11: TStaticText;
    DBText14: TDBText;
    StaticText12: TStaticText;
    DBText15: TDBText;
    StaticText13: TStaticText;
    DBText16: TDBText;
    StaticText14: TStaticText;
    DBText17: TDBText;
    StaticText15: TStaticText;
    DBText18: TDBText;
    StaticText16: TStaticText;
    DBEdit7: TDBEdit;
    RxDBFilter2: TRxDBFilter;
    ALed1: TALed;
    Label32: TLabel;
    Label33: TLabel;
    ALed2: TALed;
    ALed3: TALed;
    Label34: TLabel;
    tPedido2Stock: TStringField;
    tPedido2LoteExp: TBooleanField;
    tPedido2Dolar: TBooleanField;
    tPedido2POCliente: TStringField;
    tPedido2Invoice: TStringField;
    tPedido2Carimbo: TStringField;
    tPedido2QtdParesRep: TFloatField;
    tPedido2VlrReposicao: TFloatField;
    tPedido2Caixinha: TStringField;
    tPedido2Mercado: TStringField;
    Label35: TLabel;
    RxDBLookupCombo12: TRxDBLookupCombo;
    SpeedButton5: TSpeedButton;
    tPedidoInsStock: TStringField;
    tPedidoInsLoteExp: TBooleanField;
    tPedidoInsDolar: TBooleanField;
    tPedidoInsPOCliente: TStringField;
    tPedidoInsInvoice: TStringField;
    tPedidoInsCarimbo: TStringField;
    tPedidoInsQtdParesRep: TFloatField;
    tPedidoInsVlrReposicao: TFloatField;
    tPedidoInsCaixinha: TStringField;
    tPedidoInsMercado: TStringField;
    tPedidoInsCodFabrica: TIntegerField;
    DBRadioGroup3: TDBRadioGroup;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    Panel12: TPanel;
    SpeedButton8: TSpeedButton;
    Label36: TLabel;
    Edit1: TEdit;
    RxDBLookupCombo13: TRxDBLookupCombo;
    qPedidoItem: TQuery;
    qPedidoItemPedido: TIntegerField;
    qPedidoItemItem: TIntegerField;
    qPedidoItemCodProduto: TIntegerField;
    qPedidoItemCodCor: TIntegerField;
    qPedidoItemCodGrade: TIntegerField;
    qPedidoItemQtdPares: TFloatField;
    qPedidoItemQtdParesFat: TFloatField;
    qPedidoItemQtdParesRest: TFloatField;
    qPedidoItemPreco: TFloatField;
    qPedidoItemVlrTotal: TFloatField;
    qPedidoItemCodCabedal1: TIntegerField;
    qPedidoItemCodCabedal2: TIntegerField;
    qPedidoItemCodCorForro: TIntegerField;
    qPedidoItemCodCorSolado: TIntegerField;
    qPedidoItemCodCorPalmilha: TIntegerField;
    qPedidoItemCancelado: TBooleanField;
    qPedidoItemCopiado: TBooleanField;
    qPedidoItemSelecionado: TBooleanField;
    qPedidoItemQtdParesCanc: TFloatField;
    qPedidoItemCodForro: TIntegerField;
    qPedidoItemCodEtiqueta: TIntegerField;
    qPedidoItemVlrDesconto: TFloatField;
    qPedidoItemCodSolado: TIntegerField;
    qPedidoItemSitTrib: TSmallintField;
    qPedidoItemQtdFatAut: TFloatField;
    qPedidoItemQtdFatMan: TFloatField;
    qPedidoItemCodTaloneira: TIntegerField;
    qPedidoItemCodCorTaloneira: TIntegerField;
    qPedidoItemCodPalmilha: TIntegerField;
    qPedidoItemInvoice: TStringField;
    qPedidoItemLoteGer: TBooleanField;
    qPedidoItemReposicao: TBooleanField;
    qPedidoItemCodForma: TIntegerField;
    qPedidoItemObsLote: TStringField;
    Label37: TLabel;
    CurrencyEdit4: TCurrencyEdit;
    tAuxPedidoGradeQtd_PorItem: TIntegerField;
    tAuxPedidoGradeQtd_Excedente: TIntegerField;
    ProgressBar1: TProgressBar;
    mAuxGrade: TClientDataSet;
    mAuxGradeTamanho: TStringField;
    mAuxGradeQtd: TIntegerField;
    mAuxGradeQtd_Item: TIntegerField;
    mAuxGradeQtd_Excedente: TIntegerField;
    mAuxGradeCodGrade: TIntegerField;
    mAuxGradePosicao: TIntegerField;
    mAuxGradeQtdIndice: TIntegerField;
    qPedido_Com_Lote: TQuery;
    qPedido_Com_LoteLOTE: TIntegerField;
    Label86: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure DBLookupComboBox1DropDown(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure tAuxPedidoGradeBeforeInsert(DataSet: TDataSet);
    procedure BitBtn11Click(Sender: TObject);
    procedure GroupBox2Enter(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure GroupBox3Exit(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure GroupBox3Enter(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure BitBtn13Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure BitBtn10Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure RxDBLookupCombo2Change(Sender: TObject);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure DBDateEdit1Exit(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure RxDBLookupCombo4Enter(Sender: TObject);
    procedure RxDBLookupCombo4Exit(Sender: TObject);
    procedure p(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn18Click(Sender: TObject);
    procedure RxDBLookupCombo4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit8Exit(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure RxDBLookupCombo4Change(Sender: TObject);
    procedure RxDBLookupCombo5Exit(Sender: TObject);
    procedure RxDBLookupCombo5Enter(Sender: TObject);
    procedure RxDBLookupCombo6Exit(Sender: TObject);
    procedure RxDBLookupCombo6Enter(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure RxDBLookupCombo9CloseUp(Sender: TObject);
    procedure RxDBLookupCombo9DropDown(Sender: TObject);
    procedure RxDBLookupCombo9Exit(Sender: TObject);
    procedure RxDBLookupCombo8Enter(Sender: TObject);
    procedure RxDBLookupCombo7Exit(Sender: TObject);
    procedure RxDBLookupCombo10Exit(Sender: TObject);
    procedure RxDBLookupCombo11Enter(Sender: TObject);
    procedure RxDBLookupCombo11Exit(Sender: TObject);
    procedure DBEdit7Enter(Sender: TObject);
    procedure DBRadioGroup2Exit(Sender: TObject);
    procedure RxDBLookupCombo12Enter(Sender: TObject);
    procedure RxDBLookupCombo12Exit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure RzDBLookupComboBox1Exit(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure RxDBLookupCombo13Change(Sender: TObject);
    procedure RxDBLookupCombo13Enter(Sender: TObject);
    procedure RxDBLookupCombo13Exit(Sender: TObject);
    procedure tAuxPedidoGradeNewRecord(DataSet: TDataSet);
    procedure RxDBLookupCombo11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxSpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
    vCancItem: String[1];
    vItem, vAltera, Cor: Integer;
    vDescMat: String;
    procedure Habilita;
    procedure Habilita_Item;
    procedure Calc_desc_Item;
    procedure Calc_Vlr_Pedido;
    procedure Grava_Material;
    procedure Verifica_Pedido;
    procedure Verifica_Transp;
    procedure prc_Chamar_Sel_Produto;

    function fnc_Posiciona_SitTributaria(Codigo: Integer): Boolean;
    function fnc_Pedido_Com_Lote: Boolean;

  public
    { Public declarations }
    vQtd_Talao, vQtd_ParesTalao: Integer;
    vEdit: String[1];  // N = Inserção do pedido
                       // S = Alteracao do pedido
                       // C = Consulta dos pares da grade da referencia
  end;

var
  fPedido: TfPedido;

implementation

uses UGrupos, UDM1, USubGrupos, UCliente, UCondPgto, UTransp, UMaterial, UPedidoGrade, UVendedor, UNatOperacao, UPedidoMat,
  UPedidoDesconto, URelPedido, Printers, UCopiaPedidos, UProduto, UConsNPedCli, UConsPedido, USitTributaria, UConsPedidoNota,
  UPedidoCancItem, UConsPedidoLote, UFabrica, UGrade, UAgendaTelef, USel_Produto, uUtilPadrao, USel_Cliente;

{$R *.DFM}

procedure TfPedido.Verifica_Transp;
begin
  if DM1.tPedidoCodCliente.AsInteger > 0 then
    begin
      DM1.tCliente.IndexFieldNames := 'Codigo';
      DM1.tCliente.SetKey;
      DM1.tClienteCodigo.AsInteger := DM1.tPedidoCodCliente.AsInteger;
      if (DM1.tCliente.GotoKey) and (DM1.tClienteCodCidade.AsInteger > 0) then
        begin
          qTransp.Active   := False;
          qTransp.Active   := True;
          qTransp.Filtered := False;
          qTransp.Filter   := 'CodCidade = '''+DM1.tClienteCodCidade.AsString+''' and Estado = '''+DM1.tClienteUf.AsString+'''';
          qTransp.Filtered := True;
          if qTransp.IsEmpty then
            begin
              qTransp.Active   := False;
              qTransp.Active   := True;
              qTransp.Filtered := False;
              qTransp.Filter   := 'CodCidade <= ''0'' and Estado = '''+DM1.tClienteUf.AsString+'''';
              qTransp.Filtered := True;
            end;
        end;
    end;
end;

procedure TfPedido.Habilita_Item;
begin
  BitBtn9.Enabled  := not(BitBtn9.Enabled);
  BitBtn16.Enabled := not(BitBtn16.Enabled);
end;

procedure TfPedido.Habilita;
begin
  GroupBox1.Enabled      := not(GroupBox1.Enabled);
  GroupBox2.Enabled      := not(GroupBox2.Enabled);
  GroupBox4.Enabled      := not(GroupBox4.Enabled);
  DBMemo1.Enabled        := not(DBMemo1.Enabled);
  DBMemo2.Enabled        := not(DBMemo2.Enabled);
  Panel11.Enabled        := not(Panel11.Enabled);
  Panel2.Enabled         := not(Panel2.Enabled);
  Panel4.Enabled         := not(Panel4.Enabled);
  BitBtn1.Enabled        := not(BitBtn1.Enabled);
  BitBtn2.Enabled        := not(BitBtn2.Enabled);
  BitBtn3.Enabled        := not(BitBtn3.Enabled);
  BitBtn4.Enabled        := not(BitBtn4.Enabled);
  BitBtn5.Enabled        := not(BitBtn5.Enabled);
  BitBtn6.Enabled        := not(BitBtn6.Enabled);
  BitBtn10.Enabled       := not(BitBtn10.Enabled);
  BitBtn20.Enabled       := not(BitBtn20.Enabled);
  RxSpeedButton2.Enabled := not(RxSpeedButton2.Enabled);
  DBNavigator1.Enabled   := not(DBNavigator1.Enabled);
  CurrencyEdit1.Enabled  := False;
end;

procedure TfPedido.Calc_desc_Item;
var
 vAux, vVlrDesc, vVlrTotal: Real;
begin
//  vAux      := 0;
  vVlrDesc  := 0;
  vVlrTotal := DM1.tPedidoItemPreco.AsFloat;
  DM1.tPedidoItemVlrDesconto.AsFloat := 0;
  DM1.tPedidoDesconto.First;
  while not DM1.tPedidoDesconto.EOF do
    begin
      vAux := StrToFloat(FormatFloat('0.00',(vVlrTotal * DM1.tPedidoDescontoPercDesconto.AsFloat / 100)));
      vVlrTotal := vVlrTotal - vAux;
      vVlrDesc := vVlrDesc + vAux;
      DM1.tPedidoDesconto.Next;
    end;
  DM1.tPedidoItemVlrDesconto.AsFloat := vVlrDesc;
  DM1.tPedidoItemVlrTotal.AsFloat    := vVlrTotal * DM1.tPedidoItemQtdPares.AsInteger;
  if DM1.tPedidoItemReposicao.AsBoolean then
    DM1.tPedidoVlrReposicao.AsFloat  := DM1.tPedidoVlrReposicao.AsFloat + DM1.tPedidoItemVlrTotal.AsFloat
  else
    begin
      DM1.tPedidoVlrDesconto.AsFloat   := DM1.tPedidoVlrDesconto.AsFloat + (vVlrDesc * DM1.tPedidoItemQtdPares.AsInteger);
      DM1.tPedidoVlrTotal.AsFloat      := DM1.tPedidoVlrMercadoria.AsFloat - DM1.tPedidoVlrDesconto.AsFloat;
    end;
end;

procedure TfPedido.Calc_Vlr_Pedido;
var
 vAux, vVlrDesc, vVlrTotal: Real;
begin
  DM1.tPedidoVlrDesconto.AsFloat   := 0;
  DM1.tPedidoVlrMercadoria.AsFloat := 0;
  DM1.tPedidoVlrReposicao.AsFloat  := 0;
  DM1.tPedidoItem.First;
  while not DM1.tPedidoItem.Eof do
    begin
      if (not DM1.tPedidoItemCancelado.AsBoolean) and (not DM1.tPedidoItemReposicao.AsBoolean) then
        begin
          DM1.tPedidoItem.Edit;
          vVlrDesc  := 0;
          vVlrTotal := DM1.tPedidoItemPreco.AsFloat;
          DM1.tPedidoItemVlrDesconto.AsFloat := 0;
          DM1.tPedidoDesconto.First;
          while not DM1.tPedidoDesconto.EOF do
            begin
              vAux := StrToFloat(FormatFloat('0.00',(vVlrTotal * DM1.tPedidoDescontoPercDesconto.AsFloat / 100)));
              vVlrTotal := vVlrTotal - vAux;
              vVlrDesc := vVlrDesc + vAux;
              DM1.tPedidoDesconto.Next;
            end;

          DM1.tPedidoVlrMercadoria.AsFloat   := DM1.tPedidoVlrMercadoria.AsFloat +
                                               (DM1.tPedidoItemPreco.AsFloat * DM1.tPedidoItemQtdPares.AsInteger);
          DM1.tPedidoItemVlrDesconto.AsFloat := vVlrDesc;
          DM1.tPedidoItemVlrTotal.AsFloat    := vVlrTotal * DM1.tPedidoItemQtdPares.AsInteger;
          DM1.tPedidoVlrDesconto.AsFloat     := DM1.tPedidoVlrDesconto.AsFloat + (vVlrDesc * DM1.tPedidoItemQtdPares.AsInteger);
          DM1.tPedidoVlrTotal.AsFloat        := DM1.tPedidoVlrMercadoria.AsFloat - DM1.tPedidoVlrDesconto.AsFloat;
          DM1.tPedidoItem.Post;
        end
      else
      if DM1.tPedidoItemReposicao.AsBoolean then
        begin
          DM1.tPedidoItem.Edit;
          vVlrDesc  := 0;
          vVlrTotal := DM1.tPedidoItemPreco.AsFloat;
          DM1.tPedidoItemVlrDesconto.AsFloat := 0;
          DM1.tPedidoDesconto.First;
          while not DM1.tPedidoDesconto.EOF do
            begin
              vAux := StrToFloat(FormatFloat('0.00',(vVlrTotal * DM1.tPedidoDescontoPercDesconto.AsFloat / 100)));
              vVlrTotal := vVlrTotal - vAux;
              vVlrDesc := vVlrDesc + vAux;
              DM1.tPedidoDesconto.Next;
            end;
          DM1.tPedidoItemVlrDesconto.AsFloat := vVlrDesc;
          DM1.tPedidoItemVlrTotal.AsFloat    := vVlrTotal * DM1.tPedidoItemQtdPares.AsInteger;
          DM1.tPedidoVlrReposicao.AsFloat    := DM1.tPedidoVlrReposicao.AsFloat + DM1.tPedidoItemVlrTotal.AsFloat;
          DM1.tPedidoItem.Post;
        end;
      DM1.tPedidoItem.Next;
    end;
end;

procedure TfPedido.Grava_Material;
var
 vQtdPar, vQtdParFat, vQtdParCanc, vQtdParRep: Integer;
begin
// Faz a gravação dos materiais nos itens dos pedidos, para gerar os talões
  DM1.tMaterial.IndexFieldNames := 'Codigo';
  vQtdPar     := 0;
  vQtdParFat  := 0;
  vQtdParCanc := 0;
  vQtdParRep  := 0;
  DM1.tPedidoItem.First;
  while not DM1.tPedidoItem.EOF do
    begin
      if DM1.tPedidoItemCancelado.AsBoolean then
        vQtdParCanc := vQtdParCanc + DM1.tPedidoItemQtdParesCanc.AsInteger
      else
        begin
          DM1.tPedidoItem.Edit;
          DM1.tPedidoItemCodCabedal1.AsInteger := 0;
          DM1.tPedidoItemCodCabedal2.AsInteger := 0;
          DM1.tPedidoItem.Post;
          DM1.tPedidoMaterial.First;
          while not DM1.tPedidoMaterial.EOF do
            begin
              DM1.tPosicao.FindKey([DM1.tPedidoMaterialCodPosicao.AsInteger]);
              if (DM1.tPedidoMateriallkTipo.AsString = 'S') or (DM1.tPedidoMateriallkTipo.AsString = 'C') or
                 (DM1.tPedidoMateriallkTipo.AsString = 'F') or (DM1.tPedidoMateriallkTipo.AsString = 'T') or
                 (DM1.tPedidoMateriallkTipo.AsString = 'P') or (DM1.tPedidoMateriallkTipo.AsString = 'E') or
                 (DM1.tPedidoMateriallkTipo.AsString = '1') then
                DM1.AjustaMaterial_PedidoItem;
              DM1.tPedidoMaterial.Next;
            end;
          if DM1.tPedidoItemReposicao.AsBoolean then
            vQtdParRep := vQtdParRep + DM1.tPedidoItemQtdPares.AsInteger
          else
            vQtdPar    := vQtdPar + DM1.tPedidoItemQtdPares.AsInteger;
          vQtdParFat := vQtdParFat + DM1.tPedidoItemQtdParesFat.AsInteger;
        end;
      DM1.tPedidoItem.Next;
    end;
  DM1.tPedidoQtdPares.AsInteger     := vQtdPar;
  DM1.tPedidoQtdParesCanc.AsInteger := vQtdParCanc;
  DM1.tPedidoQtdParesFat.AsInteger  := vQtdParFat;
  DM1.tPedidoQtdParesRest.AsInteger := vQtdPar - vQtdParFat;
  DM1.tPedidoQtdParesRep.AsInteger  := vQtdParRep;
end;

procedure TfPedido.Verifica_Pedido;
begin
  if DM1.tPedidoSuspenso.AsBoolean = True then
    Label14.Caption := 'S U S P E N S O'
  else
    Label14.Caption := '';
  if DM1.tPedidoCancelado.AsBoolean = False then
    Panel9.SendToBack
  else
    Panel9.BringToFront;
  if RxDBLookupCombo9.Text <> '' then
    begin
      if DM1.tPedidolkPrazoVista.AsString = 'P' then
        GroupBox3.Visible := True
      else
        GroupBox3.Visible := False;
    end
  else
    GroupBox3.Visible := False;
  if (DM1.tPedidoCopiado.AsBoolean) or (DM1.tPedidoQtdParesFat.AsInteger > 0) then
    begin
      BitBtn18.Enabled := True;
      BitBtn18.Visible := True;
    end
  else
    begin
      BitBtn18.Enabled := False;
      BitBtn18.Visible := False;
    end;

  if (DM1.tPedidoGerarLote.AsString = '1') or (DM1.tPedidoLoteExp.AsBoolean = True) then
    begin
      BitBtn19.Enabled := True;
      BitBtn19.Visible := True;
      if (DM1.tPedidoLoteExp.AsBoolean = False) and (DM1.tPedidoNumLote.AsInteger > 0) then
        BitBtn19.Caption := 'Lote Nº.: ' + DM1.tPedidoNumLote.AsString
      else
        BitBtn19.Caption := 'LOTE GERADO';
    end
  else
    begin
      BitBtn19.Enabled := False;
      BitBtn19.Visible := False;
    end;
end;

procedure TfPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM1.tSetor.Close;
  DM1.tUF.Close;
  DM1.tCidade.Close;
  DM1.tPedidoNota.Close;
  DM1.tPedidoMaterial.Close;
  DM1.tPedidoDesconto.Close;
  DM1.tPedidoGrade.Close;
  DM1.tPedidoItem.Close;
  DM1.tPedido2.Close;
  DM1.tPedido.Close;

  DM1.tProdutoTam.Close;
  DM1.tProdutoMat.Close;
  DM1.tProdutoCor.Close;
  DM1.tProduto.Close;

  DM1.tCliente.Close;
  DM1.tCondPgto.Close;
  DM1.tVendedor.Close;
  DM1.tVendedor2.Close;
  DM1.tTransp.Close;
  DM1.tNatOperacao.Close;
  DM1.tSitTributaria.Close;
  DM1.tClasFiscal.Close;
  DM1.tTalaoGrade.Close;
  DM1.tTalao.Close;
  DM1.tLote.Close;
  DM1.tGradeItem.Close;
  DM1.tGrade.Close;
  DM1.tTipoCobranca.Close;

  DM1.tMaterialCor.Close;
  DM1.tMaterial.Close;
  DM1.tPosicao.Close;
  DM1.tCor.Close;
  DM1.tConstrucao.Close;

  Action := Cafree;
end;

procedure TfPedido.BitBtn6Click(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
  Close;
end;

procedure TfPedido.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioClientes.AsBoolean then
    begin
      fCliente := TfCliente.Create(Self);
      fCliente.ShowModal;
      DM1.tCliente.Refresh;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de fornecedores!');
end;

procedure TfPedido.BitBtn1Click(Sender: TObject);
begin
  BitBtn2.Tag := 0;
  BitBtn4.Tag := 1;
  if DM1.tUsuarioInsPedido.AsBoolean then
    begin
      BitBtn18.Enabled  := False;
      BitBtn18.Visible  := False;
      BitBtn15.Enabled            := True;
      DM1.tPedido.Refresh;
      tPedidoIns.Refresh;
      DM1.tPedido.IndexFieldNames := 'Pedido';
      tPedidoIns.IndexFieldNames  := 'Pedido';
      tPedidoIns.Refresh;
      tPedidoIns.Last;
      DM1.tPedido.Insert;
      DM1.tPedidoDolar.AsBoolean        := False;
      DM1.tPedidoCancelado.AsBoolean    := False;
      DM1.tPedidoSuspenso.AsBoolean     := False;
      DM1.tPedidoImpCalcLote.AsBoolean  := True;
      DM1.tPedidoMercado.AsString       := 'I';
      if DM1.tPedidoSuspenso.AsBoolean = True then
        Label14.Caption := 'S U S P E N S O'
      else
        Label14.Caption := '';
      if DM1.tPedidoCancelado.AsBoolean = False then
        Panel9.SendToBack
      else
        Panel9.BringToFront;
      DM1.tPedidoPedido.AsInteger  := tPedidoInsPedido.AsInteger + 1;
      //DM1.tPedidoCarimbo.AsString  := 'PESA VENTO';
      //DM1.tPedidoCaixinha.AsString := 'PESA VENTO';
      DM1.tPedidoCarimbo.AsString  := DM1.tParametrosCarimbo.AsString;
      DM1.tPedidoCaixinha.AsString := DM1.tParametrosCaixinha.AsString;
      DM1.tPedido.Post;
      DM1.tPedido.Edit;
      DM1.tPedidoDtEmissao.AsDateTime  := Date();
      DM1.tPedidoTipoFrete.AsString    := 'F';
      DM1.tPedidoSituacao.AsInteger    := 1;
      DM1.tPedidoGerarLote.AsString    := '2';
      DM1.tPedidoVlrDesconto.AsFloat   := 0;
      DM1.tPedidoSelecionado.AsBoolean := False;
      DM1.tPedidoCopiado.AsBoolean     := False;
      DM1.tPedidoCancelado.AsBoolean   := False;
      DM1.tPedidoLoteExp.AsBoolean     := False;
      vEdit := 'N';
      GroupBox3.Visible := False;
      Habilita;
      BitBtn9.Enabled  := True;
      BitBtn16.Enabled := True;
      RxDBLookupCombo4.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfPedido.BitBtn2Click(Sender: TObject);
var
 vFat: String[1];
begin
  DM1.tPedido.IndexFieldNames := 'Pedido';
  vEdit := 'N';
  BitBtn2.Tag := 1;
  BitBtn4.Tag := 0;
  PageControl1.ActivePage := TabSheet1;
  if DM1.tUsuarioAltPedido.AsBoolean then
    begin
      if DM1.tPedidoCancelado.AsBoolean <> True then
        begin
          vFat := 'N';
          DM1.tPedidoItem.First;
          while not DM1.tPedidoItem.Eof do
            begin
              if DM1.tPedidoItemQtdParesFat.AsInteger > 0 then
                vFat := 'S';
              DM1.tPedidoItem.Next;
            end;
          if vFat = 'S' then
            ShowMessage('Pedido não pode ser alterado. Já foi gerado nota')
          else
            begin
              DM1.tPedido.Edit;
              Habilita;
//              if (DM1.tPedidoGerarLote.AsString = '1') or (DM1.tPedidoLoteExp.AsBoolean = True) then
//                GroupBox1.Enabled    := False;
              BitBtn9.Enabled  := True;
              BitBtn16.Enabled := True;
              RxDBLookupCombo4.SetFocus;
            end;
        end
      else
        ShowMessage('Este pedido foi cancelado e não pode ser alterado!');
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfPedido.BitBtn4Click(Sender: TObject);
begin
  if BitBtn4.Tag = 0 then
    begin
      DM1.tPedido.Cancel;
      BitBtn2.Tag := 0;
      Habilita;
      RxDBLookupCombo3.ClearValue;
      RxDBLookupCombo11.ClearValue;
      CurrencyEdit1.Clear;
      CurrencyEdit2.Clear;
      CurrencyEdit3.Clear;
      Edit4.Clear;
      Edit5.Clear;
      BitBtn15.Enabled := False;
      Habilita_Item;
      GroupBox1.Enabled := False;
    end;
  if BitBtn4.Tag = 1 then
    begin
      DM1.tPedidoItem.First;
      while not DM1.tPedidoItem.Eof do
        begin
          DM1.tPedidoGrade.First;
          while not DM1.tPedidoGrade.Eof do
            DM1.tPedidoGrade.Delete;
          DM1.tPedidoMaterial.First;
          while not DM1.tPedidoMaterial.Eof do
            DM1.tPedidoMaterial.Delete;
          DM1.tPedidoItem.Delete;
        end;
      DM1.tPedidoParc.First;
      while not DM1.tPedidoParc.Eof do
        DM1.tPedidoParc.Delete;
      DM1.tPedidoDesconto.First;
      while not DM1.tPedidoDesconto.Eof do
        DM1.tPedidoDesconto.Delete;
      DM1.tPedido.Delete;
      DM1.tPedido.Refresh;
      DM1.tPedidoParc.Refresh;
      DBGrid3.Refresh;
      Habilita;
      GroupBox1.Enabled := False;
    end;
 vEdit := '';
end;

procedure TfPedido.BitBtn3Click(Sender: TObject);
begin
  BitBtn2.Tag := 0;
  if DM1.tUsuarioExcPedido.AsBoolean then
    begin
      if DM1.tPedidoQtdParesFat.AsInteger > 0 then
        ShowMessage('Pedido não pode ser excluido, já esta faturado!')
      else
      if DM1.tPedidoGerarLote.AsString = '1' then
        ShowMessage('Pedido não pode ser excluido, já foi gerado Lote!')
      else
      if not fnc_Pedido_Com_Lote then
        begin
          if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
            begin
              DM1.tPedidoItem.First;
              while not DM1.tPedidoItem.Eof do
                begin
                  DM1.tPedidoGrade.First;
                  while not DM1.tPedidoGrade.Eof do
                    DM1.tPedidoGrade.Delete;
                  DM1.tPedidoMaterial.First;
                  while not DM1.tPedidoMaterial.Eof do
                    DM1.tPedidoMaterial.Delete;
                  DM1.tPedidoItem.Delete;
                end;
              DM1.tPedidoParc.First;
              while not DM1.tPedidoParc.Eof do
                DM1.tPedidoParc.Delete;
              DM1.tPedidoDesconto.First;
              while not DM1.tPedidoDesconto.Eof do
                DM1.tPedidoDesconto.Delete;
              DM1.tPedido.Delete;
              DM1.tPedido.Refresh;
              DM1.tPedidoParc.Refresh;
              DBGrid3.Refresh;
            end
        end;
      DM1.tPedido.Refresh;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
  vEdit := '';  
end;

procedure TfPedido.BitBtn5Click(Sender: TObject);
var
 vVlrParc: Real;
begin
  if (DBEdit2.Text <> '') and (DBDateEdit3.Text <> '  /  /    ') then
    begin
      BitBtn2.Tag := 0;
      PageControl1.ActivePage := TabSheet1;
      if DM1.tPedido.State in [dsEdit,dsInsert] then
        begin
          if DM1.tPedidoSituacao.AsString = '' then
            begin
              ShowMessage('Não foi preenchido a situação!');
              DBRadioGroup2.SetFocus;
            end
          else
            begin
              Calc_Vlr_Pedido;
              if DM1.tPedidolkPrazoVista.AsString = 'P' then
                begin
                  if (DM1.tPedidolkPrazoVista.AsString = 'P') and (DM1.tPedidoParc.IsEmpty) then
                      ShowMessage('Parcelas de Pagamento não geradas!')
                  else
                    begin
              // Verifica o valor das parcelas de pagamento
                      DM1.tPedidoParc.First;
                      vVlrParc := 0;
                      while not DM1.tPedidoParc.EOF do
                        begin
                          vVlrParc := vVlrParc + DM1.tPedidoParcValor.AsFloat;
                          DM1.tPedidoParc.Next;
                        end;
                      if formatfloat('0.00',vVlrParc) <> formatfloat('0.00',DM1.tPedidoVlrTotal.AsFloat) then
                        ShowMessage('Soma das parcelas é diferente do total do pedido!')
                      else
                        begin
                          Grava_Material;  // Grava os materiais nos itens dos pedidos, vai servir para a
                                          // montagem dos lotes.
                          DM1.tPedido.Post;
                          Habilita;
                          BitBtn1.SetFocus;
                          BitBtn15.Enabled := False;
                        end;
                    end;
                end
              else
                begin
                  Grava_Material;  // Grava os materiais nos itens dos pedidos, vai servir para a
                                  // montagem dos lotes.
                  DM1.tPedido.Post;
                  Habilita;
                  BitBtn1.SetFocus;
                  BitBtn15.Enabled := False;
                end;
            end;
        end;
    end
  else
    begin
      ShowMessage('Os Campos "Nº Pedido do Cliente" e "Dt. Final de Embarque", não podem estar vazios!');
      DBEdit2.SetFocus;
    end;
  vEdit := '';
end;

procedure TfPedido.SpeedButton2Click(Sender: TObject);
begin
  if DM1.tUsuarioCondPgto.AsBoolean then
    begin
      fCondPgto := TfCondPgto.Create(Self);
      fCondPgto.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de cond.pagto.!');
end;

procedure TfPedido.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
//  DM1.tPedido.IndexFieldNames := 'Pedido';
end;

procedure TfPedido.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tPedido.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar o pedido antes de fechar esta janela');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfPedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
  if (Key = Vk_F2) and (DM1.tPedido.State in [dsBrowse]) then
    begin
      fConsPedido := TfConsPedido.Create(Self);
      fConsPedido.ShowModal;
    end;
  Verifica_Pedido;
end;

procedure TfPedido.BitBtn7Click(Sender: TObject);
var
  i: Integer;
  vQtdDupl: Integer;
  vQtdAux: Integer;
  //vQtdAux2: Integer;
  vQtdItem: Integer;
  vFlag: Integer;
  vZerado: Boolean;
  vExiste: Boolean;
  vQtdSomar: Integer;
begin
  if (RxDBLookupCombo11.Text = '') or (RxDBLookupCombo3.Text = '') or (CurrencyEdit1.Value = 0) or  (CurrencyEdit2.Value = 0)then
  begin
    ShowMessage('Há campos em branco!');
    exit;
  end;
  if not DM1.tProduto.Locate('Referencia;DescMaterial',VarArrayOf([RxDBLookupCombo11.Text,RzDBLookupComboBox1.Text]),[loCaseInsensitive]) then
  begin
    ShowMessage('Referência não cadastrada com este material');
    RzDBLookupComboBox1.SetFocus;
    exit;
  end;

  if Edit4.Text <> '' then
  begin
    if not fnc_Posiciona_SitTributaria(StrToInt(Edit4.Text)) then
    begin
      Edit4.SetFocus;
      exit;
    end;
  end;

  if vQtd_Talao > 0 then
    vQtdDupl := vQtd_Talao
  else
  if vQtd_ParesTalao > 0 then
  begin
    vQtdDupl := CurrencyEdit1.AsInteger div vQtd_ParesTalao;
    if CurrencyEdit1.AsInteger mod vQtd_ParesTalao > 0 then
      vQtdDupl := vQtdDupl + 1;
  end
  else
    vQtdDupl := CurrencyEdit4.AsInteger;
  if vQtdDupl <= 0 then
    vQtdDupl := 1;

  mAuxGrade.EmptyDataSet;
  tAuxPedidoGrade.First;
  while not tAuxPedidoGrade.eof do
  begin
    if (vQtdDupl <= 1) and (vQtd_ParesTalao <= 0) then
      vQtdAux := tAuxPedidoGradeQtd.AsInteger
    else
    if tAuxPedidoGradeQtd.AsInteger < vQtdDupl then
    begin
      vQtdAux  := 1;
      //vQtdAux2 := 0;
    end
    else
    begin
      vQtdAux := tAuxPedidoGradeQtd.AsInteger div vQtdDupl;
      //tirado 17/09/2013
      //if tAuxPedidoGradeQtd.AsInteger mod vQtdDupl > 0 then
      //  vQtdAux2 := StrToInt(FormatFloat('0',tAuxPedidoGradeQtd.AsInteger - (vQtdAux * vQtdDupl)))
      //else
      //  vQtdAux2 := StrToInt(FormatFloat('0',0));
    end;
    tAuxPedidoGrade.Edit;
    tAuxPedidoGradeQtd_PorItem.AsInteger   := vQtdAux;
    //tAuxPedidoGradeQtd_Excedente.AsInteger := vQtdAux2;
    tAuxPedidoGrade.Post;
      
    mAuxGrade.Insert;
    mAuxGradeTamanho.AsString        := tAuxPedidoGradelkTamanho.AsString;
    mAuxGradeQtd.AsInteger           := tAuxPedidoGradeQtd.AsInteger;
    mAuxGradeQtd_Item.AsInteger      := tAuxPedidoGradeQtd_PorItem.AsInteger;
    mAuxGradeQtd_Excedente.AsInteger := tAuxPedidoGradeQtd_Excedente.AsInteger;
    mAuxGradeCodGrade.AsInteger      := tAuxPedidoGradeCodGrade.AsInteger;
    mAuxGradePosicao.AsInteger       := tAuxPedidoGradePosicao.AsInteger;
    mAuxGradeQtdIndice.AsInteger     := tAuxPedidoGradeQtd.AsInteger;
    mAuxGrade.Post;

    tAuxPedidoGrade.Next;
  end;

  ProgressBar1.Max      := vQtdDupl;
  ProgressBar1.Position := 0;

  try
    for i := 1 to vQtdDupl do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;
      tAuxPedidoGrade.First;
      DM1.tPedidoItem.Refresh;
      tPedidoItemIns.Refresh;
      tPedidoItemIns.Last;
      DM1.tPedidoItem.Insert;
      DM1.tPedidoItemPedido.AsInteger      := DM1.tPedidoPedido.AsInteger;
      if vEdit = 'S' then
        DM1.tPedidoItemItem.AsInteger      := vItem
      else
        DM1.tPedidoItemItem.AsInteger      := tPedidoItemInsItem.AsInteger + 1;

      if DM1.tProdutoLancaGrade.AsBoolean then
      begin
        vQtdItem := 0;
        vflag    := 0;
        while vflag < 2 do
        begin
          vFlag := vFlag + 1;
          mAuxGrade.IndexName       := '';
          mAuxGrade.IndexFieldNames := 'Posicao';
          mAuxGrade.First;
          while not mAuxGrade.Eof do
          begin
            mAuxGrade.Edit;
            mAuxGradeQtdIndice.AsInteger := mAuxGradeQtd.AsInteger;
            mAuxGrade.Post;
            mAuxGrade.Next;
          end;
          if vFlag = 2 then
          begin
            mAuxGrade.IndexFieldNames := '';
            mAuxGrade.IndexName       := 'iQtd_2';
          end
          else
          begin
            mAuxGrade.IndexName       := '';
            mAuxGrade.IndexFieldNames := 'Posicao';
          end;
          vZerado := True;
          mAuxGrade.First;
          while not mAuxGrade.Eof do
          begin
            vExiste := False;
            if ((vFlag > 1) and (mAuxGradeQtd.AsInteger > 0)) or (vFlag < 2) then
            begin
              if (vFlag > 1) then
              begin
                if DM1.tPedidoGrade.Locate('Pedido;ItemPed;CodGrade;Posicao',VarArrayOf([DM1.tPedidoPedido.AsInteger,DM1.tPedidoItemItem.AsInteger,mAuxGradeCodGrade.AsInteger,mAuxGradePosicao.AsInteger]),[loCaseInsensitive]) then
                  vExiste := True;
              end;
              if vExiste then
                DM1.tPedidoGrade.Edit
              else
              begin
                DM1.tPedidoGrade.Insert;
                DM1.tPedidoGradePedido.AsInteger    := DM1.tPedidoPedido.AsInteger;
                DM1.tPedidoGradeItemPed.AsInteger   := DM1.tPedidoItemItem.AsInteger;
                DM1.tPedidoGradeCodGrade.AsInteger  := mAuxGradeCodGrade.AsInteger;
                DM1.tPedidoGradePosicao.AsInteger   := mAuxGradePosicao.AsInteger;
              end;

              vQtdSomar := 0;
              if mAuxGradeQtd.AsInteger > 0 then
              begin
                if vFlag > 1 then
                begin
                  vQtdSomar := DM1.tPedidoGradeQtd.AsInteger;
                  DM1.tPedidoGradeQtd.AsInteger := DM1.tPedidoGradeQtd.AsInteger + 1;
                end
                else
                if (vQtd_ParesTalao > 0) or (vQtd_Talao > 0) then
                begin
                  if mAuxGradeQtd.AsInteger < mAuxGradeQtd_Item.AsInteger then
                    DM1.tPedidoGradeQtd.AsInteger := mAuxGradeQtd.AsInteger
                  else
                    DM1.tPedidoGradeQtd.AsFloat   := mAuxGradeQtd_Item.asFloat;
                  //17/09/2013
                  //if mAuxGradeQtd_Excedente.AsInteger > 0 then
                  //  DM1.tPedidoGradeQtd.AsFloat       := DM1.tPedidoGradeQtd.AsFloat + 1;
                end
                else
                  DM1.tPedidoGradeQtd.AsFloat         := mAuxGradeQtd.asFloat;
                DM1.tPedidoGradeVlrUnitario.AsFloat := 0;
                DM1.tPedidoGradeVlrTotal.AsFloat    := 0;
                vZerado := False;
              end
              else
                DM1.tPedidoGradeQtd.AsInteger := 0;
              vQtdItem := vQtdItem + DM1.tPedidoGradeQtd.AsInteger - vQtdSomar;
              try
                DM1.tPedidoGrade.Post;
              except
                begin
                  ShowMessage('Item ' + DM1.tPedidoItemItem.AsString + ' Tamanho = ' + DM1.tPedidoGradelkTamanho.AsString);
                  DM1.tPedidoGrade.Cancel;
                  DM1.tPedidoGrade.First;
                  while not DM1.tPedidoGrade.Eof do
                    DM1.tPedidoGrade.Delete;
                  break;
                end;
              end;

              if mAuxGradeQtd.AsInteger > 0 then
              begin
                mAuxGrade.Edit;
                if vFlag > 1 then
                  mAuxGradeQtd.AsInteger  := mAuxGradeQtd.AsInteger - 1
                else
                begin
                  mAuxGradeQtd.AsInteger  := mAuxGradeQtd.AsInteger - DM1.tPedidoGradeQtd.AsInteger;
                  //17/09/2013
                  //if mAuxGradeQtd_Excedente.AsInteger > 0 then
                  //  mAuxGradeQtd_Excedente.AsInteger := mAuxGradeQtd_Excedente.AsInteger - 1;
                end;
                mAuxGrade.Post;
              end;
            end;
            mAuxGrade.Next;
            //17/09/2013
            //if (vQtdItem >= vQtd_ParesTalao) or (vFlag > 1) then
            if (vQtdItem >= vQtd_ParesTalao) and (vQtd_ParesTalao > 0) then
              mAuxGrade.Last;
          end;
          if not(vZerado) and (vQtdItem < vQtd_ParesTalao) and (vFlag = 2) then
            vFlag := 1
          else
          begin
            if vQtdItem >= vQtd_ParesTalao then
              vFlag := vFlag + 1;
            if vZerado then
              vFlag := 2;
          end;
          CurrencyEdit1.AsInteger := vQtdItem;
        end;
      end;

      if CurrencyEdit1.AsInteger <= 0 then
      begin
        DM1.tPedidoGrade.First;
        while not DM1.tPedidoGrade.Eof do
          DM1.tPedidoGrade.Delete;
        DM1.tPedidoItem.Cancel;
      end
      else
      begin
        DM1.tPedidoItemCodProduto.AsInteger  := DM1.tProdutoCodigo.AsInteger;
        DM1.tPedidoItemCodGrade.AsInteger    := tAuxPedidoGradeCodGrade.AsInteger;
        if RxDBLookupCombo3.Text <> '' then
          DM1.tPedidoItemCodCor.AsInteger    := RxDBLookupCombo3.KeyValue;
        DM1.tPedidoItemSitTrib.AsString      := Edit4.Text;
        DM1.tPedidoItemQtdPares.AsFloat      := CurrencyEdit1.Value;
        DM1.tPedidoItemReposicao.AsBoolean   := CheckBox1.Checked;
        DM1.tPedidoItemQtdParesRest.AsFloat  := DM1.tPedidoItemQtdPares.AsFloat;
        DM1.tPedidoItemPreco.AsFloat         := CurrencyEdit2.Value;
        DM1.tPedidoItemInvoice.AsString      := Edit5.Text;
        DM1.tPedidoItemCancelado.AsBoolean   := False;
        if DM1.tPedidoItemReposicao.AsBoolean then
          DM1.tPedidoQtdParesRep.AsFloat := DM1.tPedidoQtdParesRep.AsFloat + CurrencyEdit1.Value
        else
        begin
          DM1.tPedidoQtdPares.AsFloat          := DM1.tPedidoQtdPares.AsFloat + CurrencyEdit1.Value;
          DM1.tPedidoQtdParesRest.AsFloat      := DM1.tPedidoQtdParesRest.AsFloat + CurrencyEdit1.Value;
          DM1.tPedidoVlrMercadoria.AsFloat     := DM1.tPedidoVlrMercadoria.AsFloat +
                                                  (DM1.tPedidoItemPreco.AsFloat * DM1.tPedidoItemQtdPares.AsInteger);
          DM1.tPedidoPesoBruto.AsFloat         := DM1.tPedidoPesoBruto.AsFloat + DM1.tPedidoItemlkPesoBruto.AsFloat *
                                                  DM1.tPedidoItemQtdPares.AsFloat;
          DM1.tPedidoPesoLiquido.AsFloat       := DM1.tPedidoPesoLiquido.AsFloat + DM1.tPedidoItemlkPesoLiquido.AsFloat *
                                                  DM1.tPedidoItemQtdPares.AsFloat;
        end;
        Calc_Desc_Item;
        DM1.tPedidoItemVlrTotal.AsFloat      := DM1.tPedidoItemQtdPares.AsFloat *
                                                (DM1.tPedidoItemPreco.AsFloat - DM1.tPedidoItemVlrDesconto.AsFloat);
        DM1.tPedidoItem.Post;
      // grava a grade nos itens
      {if DM1.tProdutoLancaGrade.AsBoolean then
      begin
        tAuxPedidoGrade.First;
        while not tAuxPedidoGrade.Eof do
        begin
          DM1.tPedidoGrade.Insert;
          DM1.tPedidoGradePedido.AsInteger    := DM1.tPedidoPedido.AsInteger;
          DM1.tPedidoGradeItemPed.AsInteger   := DM1.tPedidoItemItem.AsInteger;
          DM1.tPedidoGradeCodGrade.AsInteger  := tAuxPedidoGradeCodGrade.AsInteger;
          DM1.tPedidoGradePosicao.AsInteger   := tAuxPedidoGradePosicao.AsInteger;
          if tAuxPedidoGradeQtd.AsInteger > 0 then
          begin
            if (vQtd_ParesTalao > 0) or (vQtd_Talao > 0) then
            begin
              DM1.tPedidoGradeQtd.AsFloat         := tAuxPedidoGradeQtd_PorItem.asFloat;
              if tAuxPedidoGradeQtd_Excedente.AsInteger > 0 then
                DM1.tPedidoGradeQtd.AsFloat       := DM1.tPedidoGradeQtd.AsFloat + 1;
            end
            else
              DM1.tPedidoGradeQtd.AsFloat         := tAuxPedidoGradeQtd.asFloat;
            DM1.tPedidoGradeVlrUnitario.AsFloat := tAuxPedidoGradeVlrUnitario.asFloat;
            DM1.tPedidoGradeVlrTotal.AsFloat    := DM1.tPedidoGradeQtd.AsFloat * DM1.tPedidoGradeVlrUnitario.AsFloat;
          end
          else
            DM1.tPedidoGradeQtd.AsInteger := 0;
          DM1.tPedidoGrade.Post;

          tAuxPedidoGrade.Edit;
          tAuxPedidoGradeQtd.AsInteger  := tAuxPedidoGradeQtd.AsInteger - DM1.tPedidoGradeQtd.AsInteger;
          if tAuxPedidoGradeQtd_Excedente.AsInteger > 0 then
            tAuxPedidoGradeQtd_Excedente.AsInteger := tAuxPedidoGradeQtd_Excedente.AsInteger - 1;
          tAuxPedidoGrade.Post;

          tAuxPedidoGrade.Next;
        end;
      end;}
        // Grava os materiais da referência
        DM1.tPedidoMaterial.First;
        while not DM1.tPedidoMaterial.Eof do
          DM1.tPedidoMaterial.Delete;
        if vEdit = 'S' then
        begin
          tAuxPedidoMat.Refresh;
          tAuxPedidoMat.First;
          while not tAuxPedidoMat.EOF do
          begin
            tPedidoMaterialIns.Refresh;
            tPedidoMaterialIns.Last;
            DM1.tPedidoMaterial.Refresh;
            DM1.tPedidoMaterial.Insert;
            DM1.tPedidoMaterialPedido.AsInteger      := DM1.tPedidoPedido.AsInteger;
            DM1.tPedidoMaterialItemPed.AsInteger     := DM1.tPedidoItemItem.AsInteger;
            //DM1.tPedidoMaterialOrdem.AsInteger       := tPedidoMaterialInsOrdem.AsInteger + 1;
            DM1.tPedidoMaterialOrdem.AsInteger       := tAuxPedidoMatItem.AsInteger;
            DM1.tPedidoMaterialCodCor.AsInteger      := tAuxPedidoMatCodCor.AsInteger;
            DM1.tPedidoMaterialCodMaterial.AsInteger := tAuxPedidoMatCodMaterial.AsInteger;
            DM1.tPedidoMaterialConsumoPr.AsFloat     := tAuxPedidoMatConsumoPr.AsFloat;
            DM1.tPedidoMaterialCodPosicao.AsInteger  := tAuxPedidoMatCodPosicao.AsInteger;
            DM1.tPedidoMaterialImpTalao.AsString     := tAuxPedidoMatImpTalao.AsString;
            DM1.tPedidoMaterial.Post;
            tAuxPedidoMat.Next;
          end;
        end
        else
        begin
          tPedidoMaterialIns.Refresh;
          tPedidoMaterialIns.Last;
          DM1.tProduto.IndexFieldNames := 'Codigo';
          DM1.tProdutoCor.SetKey;
          DM1.tProdutoCorCodProduto.AsInteger := DM1.tPedidoItemCodProduto.AsInteger;
          DM1.tProdutoCorCodCor.AsInteger     := DM1.tPedidoItemCodCor.AsInteger;
          if DM1.tProdutoCor.GotoKey then
          begin
            DM1.tProdutoMat.First;
            while not DM1.tProdutoMat.EOF do
            begin
              DM1.Grava_PedidoMaterial;
              DM1.tProdutoMat.Next
            end;
          end;
          DM1.tPedidoMaterial.Refresh;
        end;
      end;
    if vZerado then
      Break;
    end;
  finally
    BitBtn8Click(Sender);
  end;

  vAltera := 0;
end;

procedure TfPedido.BitBtn8Click(Sender: TObject);
begin
  RxDBLookupCombo3.ClearValue;
  RzDBLookupComboBox1.ClearKeyValue;
  RxDBLookupCombo11.ClearValue;
  Edit4.Clear;
  Edit5.Clear;
  CurrencyEdit1.Clear;
  CurrencyEdit2.Clear;
  CurrencyEdit3.Clear;
  CurrencyEdit1.Enabled := False;
  CheckBox1.Checked := False;
  RxDBLookupCombo11.SetFocus;
  BitBtn16.Tag := 0;
  vEdit := 'N';
  BitBtn9.Enabled  := True;
  BitBtn16.Enabled := True;
  tAuxPedidoMat.First;
  while not tAuxPedidoMat.EOF do
    tAuxPedidoMat.Delete;
  tAuxPedidoGrade.First;
  while not tAuxPedidoGrade.Eof do
    tAuxPedidoGrade.Delete;
end;

procedure TfPedido.BitBtn9Click(Sender: TObject);
begin
  if DM1.tPedidoGerarLote.AsString <> '1' then
    begin
      if DM1.tPedidoItemQtdParesFat.AsFloat > 0 then
        ShowMessage('Este item já foi faturado')
      else
      if DM1.tPedidoItemLoteGer.AsBoolean then
        ShowMessage('Este item já foi gerado lote')
      else
      if MessageDlg('Deseja realmente excluir este produto do pedido?',mtConfirmation,
         [mbOK,mbNo],0) = mrOK then
        begin
          if DM1.tPedidoItemReposicao.AsBoolean then
            begin
              DM1.tPedidoQtdParesRep.AsFloat  := DM1.tPedidoQtdParesRep.AsFloat - DM1.tPedidoItemQtdPares.AsFloat;
              DM1.tPedidoVlrReposicao.AsFloat := DM1.tPedidoVlrReposicao.AsFloat - DM1.tPedidoItemVlrTotal.AsFloat;
              DM1.tPedidoGrade.First;
              while not DM1.tPedidoGrade.Eof do
                DM1.tPedidoGrade.Delete;
              DM1.tPedidoMaterial.First;
              while not DM1.tPedidoMaterial.Eof do
                DM1.tPedidoMaterial.Delete;
            end
          else
            begin
              DM1.tPedidoQtdPares.AsFloat      := DM1.tPedidoQtdPares.AsFloat - DM1.tPedidoItemQtdPares.AsFloat;
              DM1.tPedidoQtdParesRest.AsFloat  := DM1.tPedidoQtdParesRest.AsFloat - DM1.tPedidoItemQtdPares.AsFloat;
              DM1.tPedidoQtdParesCanc.AsFloat  := DM1.tPedidoQtdParesCanc.AsFloat - DM1.tPedidoItemQtdParesCanc.AsFloat;
              DM1.tPedidoVlrMercadoria.AsFloat := DM1.tPedidoVlrMercadoria.AsFloat -
                                                  (DM1.tPedidoItemPreco.AsFloat * DM1.tPedidoItemQtdPares.AsInteger);
              DM1.tPedidoPesoBruto.AsFloat     := DM1.tPedidoPesoBruto.AsFloat - DM1.tPedidoItemlkPesoBruto.AsFloat *
                                                  DM1.tPedidoItemQtdPares.AsFloat;
              DM1.tPedidoPesoLiquido.AsFloat   := DM1.tPedidoPesoLiquido.AsFloat - DM1.tPedidoItemlkPesoLiquido.AsFloat *
                                                  DM1.tPedidoItemQtdPares.AsFloat;
              DM1.tPedidoVlrDesconto.AsFloat   := DM1.tPedidoVlrDesconto.AsFloat -
                                                  (DM1.tPedidoItemVlrDesconto.AsFloat * DM1.tPedidoItemQtdPares.AsInteger);
              DM1.tPedidoVlrTotal.AsFloat      := DM1.tPedidoVlrMercadoria.AsFloat - DM1.tPedidoVlrDesconto.AsFloat;
              DM1.tPedidoGrade.First;
              while not DM1.tPedidoGrade.Eof do
                DM1.tPedidoGrade.Delete;
              DM1.tPedidoMaterial.First;
              while not DM1.tPedidoMaterial.Eof do
                DM1.tPedidoMaterial.Delete;
            end;
            DM1.tPedidoItem.Delete;
        end;
    end
  else
    ShowMessage('Lote já gerado, item não pode ser excluido')
end;

procedure TfPedido.CurrencyEdit1Exit(Sender: TObject);
begin
  CurrencyEdit3.Value := CurrencyEdit2.Value * CurrencyEdit1.Value;
end;

procedure TfPedido.DBLookupComboBox1DropDown(Sender: TObject);
begin
  DM1.tPedido.Refresh;
  DM1.tPedido.IndexFieldNames := 'Pedido';
end;

procedure TfPedido.SpeedButton4Click(Sender: TObject);
begin
  if DM1.tUsuarioTransp.AsBoolean then
    begin
      fTransp := TfTransp.Create(Self);
      fTransp.ShowModal;
      Verifica_Transp;
      DM1.tPedidoCodTransp.Clear;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de transportadora!');
end;

procedure TfPedido.tAuxPedidoGradeBeforeInsert(DataSet: TDataSet);
var
 icount: integer;
begin
  i2 := 0;
  if vEdit <> 'C' then
    begin
      icount := fPedido.tAuxPedidoGrade.RecordCount;
      if icount >= DM1.tGradeItem.RecordCount then
        begin
         fPedidoGrade.BitBtn5.SetFocus;
         Abort;
       end;
    end;
end;

procedure TfPedido.BitBtn11Click(Sender: TObject);
var
 QtdParcela: Integer;
 VlrPrest, VlrFinal: Currency;
 ValorVarTotal, ValorTotalPed, VlrPrest2: String;
begin
  DM1.tCondPgtoItem.First;
  QtdParcela      := DM1.tCondPgtoItem.RecordCount;
  VlrPrest        := DM1.tPedidoVlrTotal.AsFloat / QtdParcela;
  VlrPrest2       := FormatFloat('0.00',VlrPrest);
  ValorTotalPed   := FormatFloat('0.00',DM1.tPedidoVlrTotal.AsFloat);
  VlrFinal        := StrToFloat(VlrPrest2) * QtdParcela;
  ValorVarTotal   := FormatFloat('0.00',VlrFinal);
  VlrFinal        := StrToFloat(ValorTotalPed) - StrToFloat(ValorVarTotal);
  DM1.tPedidoParc.First;
  if not DM1.tPedidoParc.IsEmpty then
    ShowMessage('Já foram geradas as parcelas')
  else
    begin
      while not DM1.tCondPgtoItem.Eof do
        begin
          DM1.tPedidoParc.Insert;
          DM1.tPedidoParcDtVencto.AsDateTime  := DM1.tPedidoDtEmissao.AsDateTime +
                                                 DM1.tCondPgtoItemQtdDias.AsInteger;
          DM1.tPedidoParcValor.AsString := FormatFloat('0.00',VlrPrest);
          DM1.tPedidoParc.Post;
          DM1.tCondPgtoItem.Next;
        end;
      DM1.tPedidoParc.Last;
      DM1.tPedidoParc.Edit;
      DM1.tPedidoParcValor.AsCurrency := DM1.tPedidoParcValor.AsCurrency +
                                         VlrFinal;
      DM1.tPedidoParc.Post;
    end;
end;

procedure TfPedido.GroupBox2Enter(Sender: TObject);
begin
  if DM1.tPedidolkPrazoVista.AsString = 'V' then
    ShowMessage('Condição de pagamento é à vista');
end;

procedure TfPedido.BitBtn12Click(Sender: TObject);
begin
  DM1.tPedidoParc.Delete;
end;

procedure TfPedido.GroupBox3Exit(Sender: TObject);
var
 VlrTotal: Real;
 VlrTotal2: String;
begin
  VlrTotal := 0;
  DM1.tPedidoParc.First;
  while not DM1.tPedidoParc.Eof do
    begin
      VlrTotal := VlrTotal + DM1.tPedidoParcValor.AsFloat;
      DM1.tPedidoParc.Next
    end;
  VlrTotal2 := FormatFloat('0.00',VlrTotal);
  if VlrTotal2 <> FormatFloat('0.00',DM1.tPedidoVlrTotal.AsFloat) then
    begin
      ShowMessage('Vlr.das parcelas diferente do vlr.total!');
      GroupBox3.SetFocus;
    end;
end;

procedure TfPedido.SpeedButton6Click(Sender: TObject);
begin
  if DM1.tUsuarioVendedor.AsBoolean then
    begin
      fVendedor := TfVendedor.Create(Self);
      fVendedor.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de vendedor!');
end;

procedure TfPedido.GroupBox3Enter(Sender: TObject);
begin
  if DM1.tPedidolkPrazoVista.AsString = 'V' then
    ShowMessage('Condição de pagamento é à vista');
end;

procedure TfPedido.SpeedButton7Click(Sender: TObject);
begin
  if DM1.tUsuarioTransp.AsBoolean then
    begin
      fNatOperacao := TfNatOperacao.Create(Self);
      fNatOperacao.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de transportadora!');
end;

procedure TfPedido.BitBtn13Click(Sender: TObject);
begin
  fPedidoDesconto := TfPedidoDesconto.Create(Self);
  fPedidoDesconto.ShowModal;
end;

procedure TfPedido.SpeedButton8Click(Sender: TObject);
begin
  if DM1.tPedidoItemItem.AsInteger > 0 then
  begin
    fPedidoMat := TfPedidoMat.Create(Self);
    fPedidoMat.ShowModal;
  end;
end;

procedure TfPedido.BitBtn13Exit(Sender: TObject);
begin
  if DM1.tPedido.State in [dsInsert,dsEdit] then
    begin
      DM1.tPedidoVlrDesconto.AsFloat  := 0;
      DM1.tPedidoVlrReposicao.AsFloat := 0;
      DM1.tPedidoItem.First;
      while not DM1.tPedidoItem.EOF do
        begin
          if not (DM1.tPedidoItemCancelado.AsBoolean) then
            begin
              DM1.tPedidoItem.Edit;
              Calc_Desc_Item;
              DM1.tPedidoItem.Post;
            end;
          DM1.tPedidoItem.Next;
        end;
    end;
end;

procedure TfPedido.FormCreate(Sender: TObject);
begin
  DM1.tSetor.Open;
  DM1.tUF.Open;
  DM1.tCidade.Open;
  DM1.tPedido.Open;
  DM1.tPedidoItem.Open;
  DM1.tPedido2.Open;
  DM1.tPedidoItem.Open;
  DM1.tPedidoGrade.Open;
  DM1.tPedidoDesconto.Open;
  DM1.tPedidoMaterial.Open;
  DM1.tPedidoNota.Open;

  DM1.tProduto.Open;
  DM1.tProdutoCor.Open;
  DM1.tProdutoMat.Open;
  DM1.tProdutoTam.Open;
  DM1.tCliente.Open;
  DM1.tCondPgto.Open;
  DM1.tVendedor.Open;
  DM1.tVendedor2.Open;
  DM1.tTransp.Open;
  DM1.tNatOperacao.Open;
  DM1.tSitTributaria.Open;
  DM1.tClasFiscal.Open;
  DM1.tLote.Open;
  DM1.tTalao.Open;
  DM1.tTalaoGrade.Open;
  DM1.tGrade.Open;
  DM1.tGradeItem.Open;
  DM1.tGradeItemlk.Open;
  DM1.tTipoCobranca.Open;
  Dm1.tFabrica.Open;
  Dm1.tCondPgto.Open;
  Dm1.tCondPgtoItem.Open;
  Dm1.tPedidoParc.Open;

  DM1.tMaterial.Open;
  DM1.tMaterialCor.Open;
  DM1.tPosicao.Open;
  DM1.tCor.Open;
  DM1.tConstrucao.Open;

  tPedido2.open;
  tProdutoCor.open;
  tClientes.open;
  tPedidoIns.open;
  tPedidoItemIns.open;
  tAuxPedidoGrade.open;
  tPedidoMaterialIns.open;
  tPedidoDescontoIns.open;

  tAuxPedidoMat.open;
  tGradeItem.open;
  tPedidoGrade.open;
  DM1.tPedido.Refresh;
//  DM1.tPedido.Last;
  if DM1.tPedidoSuspenso.AsBoolean = True then
    Label14.Caption := 'S U S P E N S O'
  else
    Label14.Caption := '';
  if DM1.tPedidoCancelado.AsBoolean = False then
    Panel9.SendToBack
  else
    Panel9.BringToFront;
  if RxDBLookupCombo9.KeyValue > 0 then
     if DM1.tPedidolkPrazoVista.AsString = 'P' then
       GroupBox3.Visible := True
     else
       GroupBox3.Visible := False;
end;

procedure TfPedido.FormShow(Sender: TObject);
begin
  Label19.Caption := RxDBLookupCombo4.LookupDisplay;
  PageControl1.ActivePage := TabSheet1;
  Panel12.Enabled := True;
  if DM1.tPedidoSuspenso.AsBoolean = True then
    Label14.Caption := 'S U S P E N S O'
  else
    Label14.Caption := '';
  if DM1.tPedidoCancelado.AsBoolean = False then
    Panel9.SendToBack
  else
    Panel9.BringToFront;
  if RxDBLookupCombo9.Text <> '' then
     if DM1.tPedidolkPrazoVista.AsString = 'P' then
       GroupBox3.Visible := True
     else
       GroupBox3.Visible := False;
  if (DM1.tPedidoCopiado.AsBoolean) or (DM1.tPedidoQtdParesFat.AsInteger > 0) then
    begin
      BitBtn18.Enabled := True;
      BitBtn18.Visible := True;
    end
  else
    begin
      BitBtn18.Enabled := False;
      BitBtn18.Visible := False;
    end;
  SpeedButton8.Enabled := True;
  vAltera := 0;
end;

procedure TfPedido.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  Verifica_Pedido;
end;

procedure TfPedido.BitBtn10Click(Sender: TObject);
begin
  if DM1.tPedidoQtdParesFat.AsInteger > 0 then
    ShowMessage('Pedido não pode ser cancelado, já foi faturado')
  else
    begin
      if DM1.tPedidoGerarLote.AsString = '1' then
        ShowMessage('Pedido não pode ser cancelado, já foi gerado Lote!')
      else
        begin
          if DM1.tPedidoCancelado.AsBoolean = False then
            begin
              if MessageDlg('Deseja realmente cancelar este pedido?',mtWarning,[mbOK,mbNO],0) = mrOK then
                begin
                  if MessageDlg('                                  ATENÇÃO'
                                +#13#13+
                                'Após cancelado, esta operação não mais poderá ser desfeita!'+#13+
                                '  Clique no botão "Não" para sair sem cancelar o pedido.',mtInformation,
                                [mbOK,mbNO],0) = mrOK then
                    begin
                      DM1.tPedido.Edit;
                      DM1.tPedidoCancelado.AsBoolean    := True;
                      DM1.tPedidoQtdParesCanc.AsInteger := DM1.tPedidoQtdParesCanc.AsInteger + DM1.tPedidoQtdParesRest.AsInteger;
                      DM1.tPedidoQtdParesRest.AsInteger := 0;
                      DM1.tPedido.Post;
                      Verifica_Pedido;
                    end;
                end;
            end
          else
            ShowMessage('Este pedido já foi cancelado!');
        end;
    end;
end;

procedure TfPedido.SpeedButton3Click(Sender: TObject);
begin
  if DM1.tPedidoGerarLote.AsString = '1' then
    ShowMessage('Lote já gerado, item não pode ser cancelado!')
  else
  if DM1.tPedidoItemQtdParesCanc.AsInteger > 0 then
    ShowMessage('Item já esta cancelado!')
  else
  if DM1.tPedidoItemReposicao.AsBoolean then
    ShowMessage('Este item é reposição, não pode ser cancelado, só excluido!')
  else
  if DM1.tPedidoItemQtdParesFat.AsInteger > 0 then
    ShowMessage('Item já esta faturado, não pode ser cancelado!')
  else
  if MessageDlg('Deseja realmente cancelar o item '+DM1.tPedidoItemItem.AsString+' ?',mtConfirmation,[mbOK,mbNo],0) = mrOK then
    begin
      vCancItem := 'S';
      DM1.tPedidoItem.Edit;
      DM1.tPedidoItemCancelado.AsBoolean    := True;
      DM1.tPedidoVlrMercadoria.AsFloat      := DM1.tPedidoVlrMercadoria.AsFloat -
                                              (DM1.tPedidoItemPreco.AsFloat * DM1.tPedidoItemQtdPares.AsInteger);
      DM1.tPedidoPesoBruto.AsFloat          := DM1.tPedidoPesoBruto.AsFloat - DM1.tPedidoItemlkPesoBruto.AsFloat *
                                              DM1.tPedidoItemQtdPares.AsFloat;
      DM1.tPedidoPesoLiquido.AsFloat        := DM1.tPedidoPesoLiquido.AsFloat - DM1.tPedidoItemlkPesoLiquido.AsFloat *
                                              DM1.tPedidoItemQtdPares.AsFloat;
      DM1.tPedidoQtdPares.AsFloat           := DM1.tPedidoQtdPares.AsFloat - DM1.tPedidoItemQtdPares.AsFloat;
      DM1.tPedidoQtdParesRest.AsFloat       := DM1.tPedidoQtdParesRest.AsFloat - DM1.tPedidoItemQtdPares.AsFloat;
      DM1.tPedidoQtdParesCanc.AsFloat       := DM1.tPedidoQtdParesCanc.AsFloat + DM1.tPedidoItemQtdPares.AsFloat;
      DM1.tPedidoVlrDesconto.AsFloat        := DM1.tPedidoVlrDesconto.AsFloat -
                                              (DM1.tPedidoItemVlrDesconto.AsFloat * DM1.tPedidoItemQtdPares.AsInteger);
      DM1.tPedidoVlrTotal.AsFloat           := DM1.tPedidoVlrMercadoria.AsFloat - DM1.tPedidoVlrDesconto.AsFloat;
      DM1.tPedidoItemQtdParesCanc.AsInteger := DM1.tPedidoItemQtdPares.AsInteger;
      DM1.tPedidoItemQtdParesRest.AsInteger := 0;
      DM1.tPedidoItem.Post;
    end;
end;

procedure TfPedido.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if DM1.tPedidoItemCancelado.AsBoolean then
    begin
      Background  := clRed;
      AFont.Color := clWhite;
    end
  else
  if DM1.tPedidoItemReposicao.AsBoolean then
    begin
      Background  := clAqua;
      AFont.Color := clBlack;
    end
  else
  if not (DM1.tPedidoItemCancelado.AsBoolean) and (DM1.tPedidoItemQtdParesRest.AsFloat = 0) and (DM1.tPedidoItemQtdParesFat.AsFloat > 0) then
    begin
      Background  := clTeal;
      AFont.Color := clWhite;
    end
  else
    begin
      Background  := clWhite;
      AFont.Color := clBlack;
    end;
end;

procedure TfPedido.BitBtn15Click(Sender: TObject);
begin
  fCopiaPedidos := TfCopiaPedidos.Create(Self);
  fCopiaPedidos.ShowModal;
end;

procedure TfPedido.BitBtn16Click(Sender: TObject);
var
 i: Integer;
begin
  vAltera := 1;
  if DM1.tPedidoGerarLote.AsString <> '1' then
    begin
      if DM1.tPedidoItemQtdParesFat.AsInteger > 0 then
        ShowMessage('Item do pedido já esta faturado!')
      else
      if DM1.tPedidoItemQtdParesCanc.AsInteger > 0 then
        ShowMessage('Item do pedido já esta cancelado!')
      else
        begin
          if not DM1.tPedidoItem.IsEmpty then
            begin
              if RxDBLookupCombo11.Text = '' then
                begin
                  vEdit := 'S';
                  vItem := DM1.tPedidoItemItem.AsInteger;
                  RxDBLookupCombo11.Value      := DM1.tPedidoItemlkReferencia.AsString;
                  RxDBLookupCombo11.OnExit(Sender);
                  RzDBLookupComboBox1.KeyValue := DM1.tPedidoItemlkDescMaterial.AsString;
                  RxDBLookupCombo3.KeyValue    := DM1.tPedidoItemCodCor.AsInteger;
                  Edit4.Text := DM1.tPedidoItemSitTrib.AsString;
                  Edit5.Text := DM1.tPedidoItemInvoice.AsString;
                  CheckBox1.Checked := DM1.tPedidoItemReposicao.AsBoolean;
                  CurrencyEdit1.Value := DM1.tPedidoItemQtdPares.AsCurrency;
                  CurrencyEdit2.Value := DM1.tPedidoItemPreco.AsCurrency;
                  CurrencyEdit3.Value := DM1.tPedidoItemVlrTotal.AsCurrency;
                  Cor                 := DM1.tPedidoItemCodCor.AsInteger;
                  vDescMat            := DM1.tPedidoItemlkDescMaterial.AsString;

                  if DM1.tPedidoItemReposicao.AsBoolean then
                    begin
                      DM1.tPedidoQtdParesRep.AsFloat  := DM1.tPedidoQtdParesRep.AsFloat - CurrencyEdit1.Value;
                      DM1.tPedidoVlrReposicao.AsFloat := DM1.tPedidoVlrReposicao.AsFloat - DM1.tPedidoItemVlrTotal.AsFloat;
                    end
                  else
                    begin
                      DM1.tPedidoQtdPares.AsFloat      := DM1.tPedidoQtdPares.AsFloat - CurrencyEdit1.Value;
                      DM1.tPedidoQtdParesRest.AsFloat  := DM1.tPedidoQtdParesRest.AsFloat - CurrencyEdit1.Value;
                      DM1.tPedidoPesoBruto.AsFloat     := DM1.tPedidoPesoBruto.AsFloat - (DM1.tPedidoItemlkPesoBruto.AsFloat *
                                                          DM1.tPedidoItemQtdPares.AsFloat);
                      DM1.tPedidoPesoLiquido.AsFloat   := DM1.tPedidoPesoLiquido.AsFloat - (DM1.tPedidoItemlkPesoLiquido.AsFloat *
                                                          DM1.tPedidoItemQtdPares.AsFloat);
                      DM1.tPedidoVlrMercadoria.AsFloat := DM1.tPedidoVlrMercadoria.AsFloat -
                                                          (DM1.tPedidoItemPreco.AsFloat * DM1.tPedidoItemQtdPares.AsInteger);
                      DM1.tPedidoVlrDesconto.AsFloat   := DM1.tPedidoVlrDesconto.AsFloat -
                                                          (DM1.tPedidoItemVlrDesconto.AsFloat * DM1.tPedidoItemQtdPares.AsInteger);
                      DM1.tPedidoVlrTotal.AsFloat      := DM1.tPedidoVlrMercadoria.AsFloat - DM1.tPedidoVlrDesconto.AsFloat;
                    end;
                  BitBtn16.Tag := 1;
            // grava a grade nos itens
                  tAuxPedidoGrade.First;
                  while not tAuxPedidoGrade.Eof do
                    tAuxPedidoGrade.Delete;
                  DM1.tPedidoGrade.First;
                  if DM1.tPedidoItemCodGrade.AsInteger > 0 then
                    begin
                      DM1.tGrade.IndexFieldNames := 'Codigo';
                      DM1.tGrade.FindKey([DM1.tPedidoItemCodGrade.AsInteger]);
                    end;
                  while not DM1.tPedidoGrade.Eof do
                    begin
                      tAuxPedidoGrade.Insert;
                      tAuxPedidoGradePedido.AsInteger    := DM1.tPedidoGradePedido.AsInteger;
                      tAuxPedidoGradeCodGrade.AsInteger  := DM1.tPedidoGradeCodGrade.AsInteger;
                      tAuxPedidoGradePosicao.AsInteger   := DM1.tPedidoGradePosicao.AsInteger;
                      tAuxPedidoGradeQtd.asFloat         := DM1.tPedidoGradeQtd.AsFloat;
                      tAuxPedidoGradeVlrUnitario.asFloat := DM1.tPedidoGradeVlrUnitario.AsFloat;
                      tAuxPedidoGrade.Post;
                      DM1.tPedidoGrade.Delete;
                    end;
            // grava os materiais na tabela auxiliar
                  tAuxPedidoMat.First;
                  while not tAuxPedidoMat.EOF do
                    tAuxPedidoMat.Delete;
                  i := 0;
                  DM1.tPedidoMaterial.First;
                  while not DM1.tPedidoMaterial.EOF do
                    begin
                      inc(i);
                      tAuxPedidoMat.Insert;
                      tAuxPedidoMatItem.AsInteger        := i;
                      tAuxPedidoMatCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
                      tAuxPedidoMatCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                      tAuxPedidoMatConsumoPr.AsFloat     := DM1.tPedidoMaterialConsumoPr.AsFloat;
                      tAuxPedidoMatCodPosicao.AsInteger  := DM1.tPedidoMaterialCodPosicao.AsInteger;
                      tAuxPedidoMatImpTalao.AsString     := DM1.tPedidoMaterialImpTalao.AsString;
                      tAuxPedidoMat.Post;
                      DM1.tPedidoMaterial.Delete;
                    end;
                  DM1.tPedidoItem.Delete;
                  Habilita_Item;
                end
              else
                ShowMessage('Há um item pendente, você deve confirmar ou cancelar antes de alterar outro item!');
            end
          else
            ShowMessage('Não há registro p/ ser alterado!');
        end;
      RxDBLookupCombo11.SetFocus;
    end
  else
    ShowMessage('Lote já gerado, item não pode ser alterado')
end;

procedure TfPedido.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tPedido.IndexFieldNames := 'PedidoCliente';
  Edit3.Text := RxDBLookupCombo1.Text;
end;

procedure TfPedido.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tPedido.IndexFieldNames := 'Pedido';
  Edit3.Text := RxDBLookupCombo1.Text;
end;

procedure TfPedido.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tPedido.IndexFieldNames := 'Pedido';
  Edit2.Text := RxDBLookupCombo2.Text;
end;

procedure TfPedido.SpeedButton9Click(Sender: TObject);
begin
  if DM1.tUsuarioProduto.AsBoolean then
    begin
      fProduto := TfProduto.Create(Self);
      fProduto.ShowModal;
      DM1.tProduto.Refresh;
      DM1.tProdutoCor.Refresh;
      DM1.tProdutoMat.Refresh;
      if (RxDBLookupCombo11.Text <> '') and (BitBtn16.Tag <> 1) then
        begin
          DM1.tProduto.Locate('Referencia;DescMaterial',VarArrayOf([RxDBLookupCombo11.Text,RzDBLookupComboBox1.Text]),[loCaseInsensitive]);
          qCorRef.Active              := False;
          qCorRef.Params[0].AsInteger := DM1.tProdutoCodigo.AsInteger;
          qCorRef.Active              := True;
        end;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfPedido.Edit2Change(Sender: TObject);
begin
  try
    DM1.tPedido.IndexFieldNames := 'Pedido';
    DM1.tPedido.FindNearest([Edit2.Text]);
    Verifica_Pedido;
  except
    ShowMessage('Digite apenas números aqui!');
  end;
end;

procedure TfPedido.RxDBLookupCombo2Change(Sender: TObject);
begin
  Edit2.Text := RxDBLookupCombo2.Text;
end;

procedure TfPedido.RxDBLookupCombo2Exit(Sender: TObject);
begin
  Edit2.Text := RxDBLookupCombo2.Text;
end;

procedure TfPedido.Edit3Change(Sender: TObject);
begin
  try
    DM1.tPedido.IndexFieldNames := 'PedidoCliente';
    DM1.tPedido.FindNearest([Edit3.Text]);
    Verifica_Pedido;
  except
    ShowMessage('Digite apenas números aqui!');
  end;
end;

procedure TfPedido.RxDBLookupCombo1Change(Sender: TObject);
begin
  Edit3.Text := RxDBLookupCombo1.Text;
end;

procedure TfPedido.BitBtn17Click(Sender: TObject);
begin
  if DM1.tPedidoCodCliente.AsInteger > 0 then
    begin
      fConsNPedCli := TfConsNPedCli.Create(Self);
      fConsNPedCli.ShowModal;
    end
  else
    ShowMessage('Para mostrar esta consulta é obrigatório coloca o cliente!');
end;

procedure TfPedido.DBDateEdit1Exit(Sender: TObject);
begin
  if DM1.tPedidoDtEmissao.AsDateTime < 10 then
  begin
    ShowMessage('Data de emissão não pode ser vazia!');
    DBDateEdit1.SetFocus;
    DBDateEdit1.Date := Date;
  end;
end;

procedure TfPedido.RxDBGrid1DblClick(Sender: TObject);
begin
  vEdit := 'C';
// grava a grade nos itens
  tAuxPedidoGrade.First;
  while not tAuxPedidoGrade.Eof do
    tAuxPedidoGrade.Delete;
  DM1.tPedidoGrade.First;
  while not DM1.tPedidoGrade.Eof do
    begin
      tAuxPedidoGrade.Insert;
      tAuxPedidoGradeCodGrade.AsInteger   := DM1.tPedidoGradeCodGrade.AsInteger;
      tAuxPedidoGradePosicao.AsInteger    := DM1.tPedidoGradePosicao.AsInteger;
      tAuxPedidoGradeQtd.asFloat          := DM1.tPedidoGradeQtd.AsFloat;
      tAuxPedidoGradeVlrUnitario.asFloat  := DM1.tPedidoGradeVlrUnitario.AsFloat;
      tAuxPedidoGrade.Post;
      DM1.tPedidoGrade.Next;
    end;
  fPedidoGrade := TfPedidoGrade.Create(Self);
  fPedidoGrade.ShowModal;
  vQtd_ParesTalao := 0;
  vQtd_Talao      := 0;
  vEdit := 'N';
// Apaga a tabela auxiliar
  tAuxPedidoGrade.First;
  while not tAuxPedidoGrade.Eof do
    tAuxPedidoGrade.Delete;
end;

procedure TfPedido.Edit4Exit(Sender: TObject);
begin
  if Edit4.Text <> '' then
    begin
      DM1.tSitTributaria.IndexFieldNames := 'Codigo';
      DM1.tSitTributaria.SetKey;
      DM1.tSitTributariaCodigo.AsInteger := StrToInt(Edit4.Text);
      if not DM1.tSitTributaria.GotoKey then
        begin
          ShowMessage('Situação tributária não cadastrada!');
          Edit4.Clear;
          Edit4.SetFocus;
        end;
    end;
end;

procedure TfPedido.SpeedButton10Click(Sender: TObject);
begin
  if DM1.tUsuarioSitTrib.AsBoolean then
    begin
      fSitTributaria := TfSitTributaria.Create(Self);
      fSitTributaria.ShowModal;
      DM1.tSitTributaria.Refresh;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfPedido.RxDBLookupCombo4Enter(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet3;
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

procedure TfPedido.RxDBLookupCombo4Exit(Sender: TObject);
begin
  Dm1.tCliente.IndexFieldNames   := 'Codigo';
  PageControl1.ActivePage        := TabSheet1;
  RxDBLookupCombo4.LookupDisplay := 'Nome';
  Label19.Caption                := RxDBLookupCombo4.LookupDisplay;
  Verifica_Transp;
  if RxDBLookupCombo4.Text <> '' then
    begin
      DM1.tCliente.SetKey;
      DM1.tClienteCodigo.AsInteger   := RxDBLookupCombo4.KeyValue;
      if DM1.tCliente.GotoKey then
        begin
          if (DM1.tPedidoCodVendedor.AsInteger <= 0) and (DM1.tClienteCodVendedor.AsInteger > 0) then
            begin
              DM1.tPedidoCodVendedor.AsInteger := DM1.tClienteCodVendedor.AsInteger;
              DM1.tPedidoPercComissao.AsFloat  := DM1.tClientelkComissao.AsFloat;
            end;
        end;
    end;
end;

procedure TfPedido.p(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if RxDBLookupCombo4.Text <> '' then
    DM1.tPedidoCodCliente.AsInteger := RxDBLookupCombo4.KeyValue;
end;

procedure TfPedido.BitBtn18Click(Sender: TObject);
begin
  fConsPedidoNota := TfConsPedidoNota.Create(Self);
  fConsPedidoNota.ShowModal;
end;

procedure TfPedido.RxDBLookupCombo4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F2 then
  begin
    if RxDBLookupCombo4.LookupDisplay = 'Nome' then
    begin
       RxDBLookupCombo4.CloseUp(True);
       RxDBLookupCombo4.LookupDisplay := 'Fantasia';
       Dm1.tCliente.IndexFieldNames   := 'Fantasia';
       Dm1.tCliente.Refresh;
    end
    else
    begin
      RxDBLookupCombo4.CloseUp(True);
      RxDBLookupCombo4.LookupDisplay := 'Nome';
      Dm1.tCliente.IndexFieldNames   := 'Nome';
      Dm1.tCliente.Refresh;
    end;
    Label19.Caption := RxDBLookupCombo4.LookupDisplay;
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

procedure TfPedido.DBEdit8Exit(Sender: TObject);
var
  vPedCliente: Integer;
  vDigito: String;
begin
  if DBEdit2.Text <> '' then
    begin
      vPedCliente := StrToInt(DBEdit2.Text);
      vDigito     := DBEdit8.Text;
      tPedidoIns.IndexFieldNames := 'PedidoCliente;PedCliDif';
      tPedidoIns.SetKey;
      tPedidoInsPedidoCliente.AsInteger := vPedCliente;
      tPedidoInsPedCliDif.AsString      := vDigito;
      if (tPedidoIns.GotoKey) and (tPedidoInsPedido.AsInteger <> DM1.tPedidoPedido.AsInteger) then
        begin
          ShowMessage('Já existe esse nº de pedido de cliente p/ o mesmo cliente em outro pedido!');
          DBEdit2.Clear;
          DBEdit2.SetFocus;
        end;
    end;
end;

procedure TfPedido.BitBtn20Click(Sender: TObject);
begin 
  if DM1.tPedidoGerarLote.AsString = '1' then
    ShowMessage('Lote já gerado, item não pode ser excluido')
  else
    begin
      vCancItem := 'N';
      if MessageDlg('ATENÇÃO, deseja cancelar o item '+DM1.tPedidoItemItem.AsString+' ?',mtConfirmation,[mbOK,mbNo],0) = mrOK then
        begin               
          DM1.tPedido.Edit;
          SpeedButton3.Click;
          if vCancItem = 'S' then
            begin
              DM1.tPedidoParc.First;
              while not DM1.tPedidoParc.Eof do
                DM1.tPedidoParc.Delete;
              BitBtn11.Click;
            end;
          DM1.tPedido.Post;
        end;
    end;
end;

procedure TfPedido.RxDBLookupCombo4Change(Sender: TObject);
begin
  if RxDBLookupCombo4.LookupDisplay = 'Nome' then
    DM1.tCliente.IndexFieldNames := 'Nome'
  else
    Dm1.tCliente.IndexFieldNames := 'Fantasia';
end;

procedure TfPedido.RxDBLookupCombo5Exit(Sender: TObject);
begin
  DM1.tNatOperacao.IndexFieldNames := 'Codigo';
end;

procedure TfPedido.RxDBLookupCombo5Enter(Sender: TObject);
begin
  DM1.tNatOperacao.IndexFieldNames := 'CodNatOper';
end;

procedure TfPedido.RxDBLookupCombo6Exit(Sender: TObject);
begin
  if DM1.tPedidoCodVendedor.AsInteger > 0 then
    DM1.tPedidoPercComissao.AsFloat := DM1.tVendedorPercComissao.AsFloat;
  DM1.tVendedor.IndexFieldNames := 'Codigo';
end;

procedure TfPedido.RxDBLookupCombo6Enter(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Nome';
end;

procedure TfPedido.DBEdit4Exit(Sender: TObject);
var
 i: Integer;
begin
  i := 0;
  if DM1.tPedidoPOCliente.AsString <> '' then
    begin
      if Copy(DM1.tPedidoPOCliente.AsString,i,1) = ' ' then
        begin
          ShowMessage('O campo não pode conter espaços');
          DBEdit4.SetFocus;
          DM1.tPedidoPoCliente.Clear;
        end;
    end;
end;

procedure TfPedido.BitBtn19Click(Sender: TObject);
begin
  if (DM1.tPedidoLoteExp.AsBoolean = True) and (DM1.tPedidoNumLote.AsInteger < 1) then
    begin
      fConsPedidoLote := TfConsPedidoLote.Create(Self);
      fConsPedidoLote.ShowModal;
    end;
end;

procedure TfPedido.RxDBLookupCombo9CloseUp(Sender: TObject);
begin
  DM1.tCondPgto.IndexFieldNames := 'Codigo';
end;

procedure TfPedido.RxDBLookupCombo9DropDown(Sender: TObject);
begin
  DM1.tCondPgto.IndexFieldNames := 'Nome';
end;

procedure TfPedido.RxDBLookupCombo9Exit(Sender: TObject);
begin
  if RxDBLookupCombo9.Text <> '' then
    begin
      if DM1.tPedidolkPrazoVista.AsString = 'P' then
        GroupBox3.Visible := True
      else
        GroupBox3.Visible := False;
    end
  else
    GroupBox3.Visible := False;
end;

procedure TfPedido.RxDBLookupCombo8Enter(Sender: TObject);
begin
  DM1.tTransp.IndexFieldNames := 'Nome';
end;

procedure TfPedido.RxDBLookupCombo7Exit(Sender: TObject);
begin
  if DM1.tPedidoCodCliente.AsInteger <= 0 then
    begin
      ShowMessage('Você deve selecionar um "Cliente" antes de selecionar a transportadora!');
      DM1.tPedidoCodTransp.Clear;
    end;
end;

procedure TfPedido.RxDBLookupCombo10Exit(Sender: TObject);
begin
  if RxDBLookupCombo11.Text <> '' then
  begin
    if DM1.tProduto.Locate('Referencia;DescMaterial',VarArrayOf([RxDBLookupCombo11.Text,RzDBLookupComboBox1.Text]),[loCaseInsensitive]) then
    begin
      // monta a query da cor da referência
      DM1.tProdutoCor.Refresh;
      qCorRef.Active              := False;
      qCorRef.Params[0].AsInteger := DM1.tProdutoCodigo.AsInteger;
      qCorRef.Active              := True;
      if BitBtn16.Tag = 1 then
        RxDBLookupCombo3.KeyValue := Cor;
      if DM1.tProdutoLancaGrade.AsBoolean then
      begin
        vQtd_ParesTalao := 0;
        vQtd_Talao      := 0;
        fPedidoGrade := TfPedidoGrade.Create(Self);
        fPedidoGrade.ShowModal;
        CurrencyEdit1.Enabled := False;
      end
      else
        CurrencyEdit1.Enabled := True;
    end
    else
    begin
      ShowMessage('Referência não encontrada!');
      RxDBLookupCombo11.ClearValue;
      RxDBLookupCombo11.SetFocus;
    end;
  end;
end;

procedure TfPedido.RxDBLookupCombo11Enter(Sender: TObject);
begin
  RxDBFilter2.Active           := True;
  DM1.tProduto.Refresh;
  DM1.tProduto.IndexFieldNames := 'Referencia';
end;

procedure TfPedido.RxDBLookupCombo11Exit(Sender: TObject);
begin
  if RxDBLookupCombo11.Text <> '' then
    begin
      qMatRef.Active             := False;
      qMatRef.Params[0].AsString := RxDBLookupCombo11.Text;
      qMatRef.Active             := True;
      if (BitBtn16.Tag = 1) and (vDescMat <> '') then
        RzDBLookupComboBox1.KeyValue := vDescMat;
      RzDBLookupComboBox1.SetFocus;
    end;
  RxDBFilter2.Active := False;
end;

procedure TfPedido.DBEdit7Enter(Sender: TObject);
begin
  if DM1.tPedidoItem.IsEmpty then
    begin
      ShowMessage('Não há item registrado p/ ser inserido a observação!');
      DBMemo1.SetFocus;
    end;
end;

procedure TfPedido.DBRadioGroup2Exit(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
  RxDBLookupCombo11.SetFocus;
end;

procedure TfPedido.RxDBLookupCombo12Enter(Sender: TObject);
begin
  DM1.tFabrica.IndexFieldNames := 'Nome';
end;

procedure TfPedido.RxDBLookupCombo12Exit(Sender: TObject);
begin
  DM1.tFabrica.IndexFieldNames := 'Codigo';
end;

procedure TfPedido.SpeedButton5Click(Sender: TObject);
begin
  if DM1.tUsuarioFabrica.AsBoolean then
    begin
      fFabrica := TfFabrica.Create(Self);
      fFabrica.ShowModal;
    end
  else
    ShowMessage('Usuário "'+DM1.tUsuarioUsuario.AsString+'" não autorizado a abrir o formulário de fábricas!');
end;

procedure TfPedido.RzDBLookupComboBox1Exit(Sender: TObject);
begin
  if RxDBLookupCombo11.Text <> '' then
    begin
      if DM1.tProduto.Locate('Referencia;DescMaterial',VarArrayOf([RxDBLookupCombo11.Text,RzDBLookupComboBox1.Text]),[loCaseInsensitive]) then
        begin
          // monta a query da cor da referência
          DM1.tProdutoCor.Refresh;
          qCorRef.Active              := False;
          qCorRef.Params[0].AsInteger := DM1.tProdutoCodigo.AsInteger;
          qCorRef.Active              := True;
          if BitBtn16.Tag = 1 then
            RxDBLookupCombo3.KeyValue := Cor;
          if vAltera = 0 then
            begin
              if DM1.tProdutoLancaGrade.AsBoolean then
                begin
                  fPedidoGrade := TfPedidoGrade.Create(Self);
                  fPedidoGrade.ShowModal;
                  CurrencyEdit1.Enabled := False;
                end
              else
                CurrencyEdit1.Enabled := True;
            end
          else
            RxDBLookupCombo11.SetFocus;
        end
      else
        begin
          ShowMessage('Referência não encontrada!');
          RxDBLookupCombo11.ClearValue;
          RxDBLookupCombo11.SetFocus;
        end;
    end;
  vAltera := 0;
end;

procedure TfPedido.Edit1Change(Sender: TObject);
begin
    DM1.tPedido.IndexFieldNames := 'POCliente';
    DM1.tPedido.FindNearest([Edit1.Text]);
    Verifica_Pedido;
end;

procedure TfPedido.RxDBLookupCombo13Change(Sender: TObject);
begin
  Edit1.Text := RxDBLookupCombo13.Text;
end;

procedure TfPedido.RxDBLookupCombo13Enter(Sender: TObject);
begin
  DM1.tPedido.IndexFieldNames := 'POCliente';
  Edit1.Text := RxDBLookupCombo13.Text;
end;

procedure TfPedido.RxDBLookupCombo13Exit(Sender: TObject);
begin
  Edit1.Text := RxDBLookupCombo13.Text;
end;

function TfPedido.fnc_Posiciona_SitTributaria(Codigo: Integer): Boolean;
begin
  Result := True;
  DM1.tSitTributaria.IndexFieldNames := 'Codigo';
  DM1.tSitTributaria.SetKey;
  DM1.tSitTributariaCodigo.AsInteger := Codigo;
  if not DM1.tSitTributaria.GotoKey then
  begin
    Result := False;
    ShowMessage('Situação tributária não cadastrada!');
    Edit4.Clear;
  end;
end;

procedure TfPedido.tAuxPedidoGradeNewRecord(DataSet: TDataSet);
begin
  tAuxPedidoGradeQtd_PorItem.AsInteger   := 0;
  tAuxPedidoGradeQtd_Excedente.AsInteger := 0;
end;

function TfPedido.fnc_Pedido_Com_Lote: Boolean;
begin
  Result := False;
  qPedido_Com_Lote.Close;
  qPedido_Com_Lote.ParamByName('Pedido').AsInteger := DM1.tPedidoPedido.AsInteger;
  qPedido_Com_Lote.Open;
  if not(qPedido_Com_Lote.IsEmpty) and (qPedido_Com_LoteLOTE.AsInteger > 0) then
    Result := True;
  qPedido_Com_Lote.Close;
end;

procedure TfPedido.RxDBLookupCombo11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F5) and (DM1.tPedido.State in [dsEdit,dsInsert]) then
    prc_Chamar_Sel_Produto;
end;

procedure TfPedido.prc_Chamar_Sel_Produto;
begin
  vCodProduto_Pos := 0;
  fSel_Produto := TfSel_Produto.Create(Self);
  fSel_Produto.ShowModal;
  if vCodProduto_Pos > 0 then
  begin
    RxDBLookupCombo11.SetFocus;
    RxDBLookupCombo11.Value := vReferencia_Pos;
  end;
end;

procedure TfPedido.RxSpeedButton2Click(Sender: TObject);
var
  NumPed: Integer;
begin
  RxDBFilter1.Active := True;
  NumPed := DM1.tPedidoPedido.AsInteger;
  DM1.tPedido.Filtered := False;
  DM1.tPedido.Filter   := 'Pedido = '''+IntToStr(NumPed)+'''';
  DM1.tPedido.Filtered := True;
  fRelPedido := tfRelPedido.Create(Self);
  fRelPedido.QuickRep1.Preview;
  fRelPedido.QuickRep1.Free;
  DM1.tPedido.Filtered := False;
  DM1.tPedido.FindKey([NumPed]);
  RxDBFilter1.Active := False;
end;

end.

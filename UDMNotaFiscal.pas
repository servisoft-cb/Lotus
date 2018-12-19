unit UDMNotaFiscal;

interface

uses
  SysUtils, Classes, DB, DBTables, Variants, Dialogs, FMTBcd, DBClient,
  Provider, SqlExpr;

type
  TDMNotaFiscal = class(TDataModule)
    tNotaFiscalIns: TTable;
    tNotaFiscalInsFilial: TIntegerField;
    tNotaFiscalInsNumSeq: TIntegerField;
    tNotaFiscalInsDtEmissao: TDateField;
    tNotaFiscalInsImpressa: TBooleanField;
    tNotaFiscalInsNFeRecibo: TStringField;
    tNotaFiscalInsNFeProtocolo: TStringField;
    tNotaFiscalInsNFeChaveAcesso: TStringField;
    tNotaFiscalInsNFeProtocoloCancelada: TStringField;
    tNotaFiscalInsSerie: TStringField;
    tNotaFiscalInsTipoEnvioNF: TStringField;
    dsNotaFiscalIns: TDataSource;
    tNotaFiscalItensIns: TTable;
    dsNotaFiscalItensIns: TDataSource;
    tNotaFiscalItensInsFilial: TIntegerField;
    tNotaFiscalItensInsNumSeq: TIntegerField;
    tNotaFiscalItensInsItem: TSmallintField;
    tNotaFiscalItensInsCodProduto: TIntegerField;
    tNotaFiscalItensInsCodCor: TIntegerField;
    tNotaFiscalItensInsClasFiscal: TStringField;
    tNotaFiscalItensInsUnidade: TStringField;
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
    tNotaFiscalItensInsNumNota: TIntegerField;
    qNatOper: TQuery;
    qNatOperNatOper: TSmallintField;
    tNotaFiscalInsNumNota: TIntegerField;
    tNotaFiscalInsCodNatOper: TSmallintField;
    tNotaFiscalInsCodCli: TIntegerField;
    tNotaFiscalInsCondPgto: TStringField;
    tNotaFiscalInsCodVendedor: TIntegerField;
    tNotaFiscalInsBaseIcms: TFloatField;
    tNotaFiscalInsVlrIcms: TFloatField;
    tNotaFiscalInsVlrIpi: TFloatField;
    tNotaFiscalInsVlrTotalNota: TFloatField;
    tNotaFiscalInsVlrTotalItens: TFloatField;
    tNotaFiscalInsPercDesc: TFloatField;
    tNotaFiscalInsVlrTotalDesc: TFloatField;
    tNotaFiscalInsVlrFrete: TFloatField;
    tNotaFiscalInsVlrSeguro: TFloatField;
    tNotaFiscalInsOutrasDesp: TFloatField;
    tNotaFiscalInsQtd: TIntegerField;
    tNotaFiscalInsEspecie: TStringField;
    tNotaFiscalInsMarca: TStringField;
    tNotaFiscalInsNumero: TStringField;
    tNotaFiscalInsPesoBruto: TFloatField;
    tNotaFiscalInsPesoLiquido: TFloatField;
    tNotaFiscalInsPlaca: TStringField;
    tNotaFiscalInsUFPlaca: TStringField;
    tNotaFiscalInsEmitDest: TStringField;
    tNotaFiscalInsCodTransp: TIntegerField;
    tNotaFiscalInsObs: TMemoField;
    tNotaFiscalInsSaidaEntrada: TStringField;
    tNotaFiscalInsCancelada: TBooleanField;
    tNotaFiscalInsDtSaidaEnt: TDateField;
    tNotaFiscalInsHoraSaida: TTimeField;
    tNotaFiscalInsLocalEntrega: TBooleanField;
    tNotaFiscalInsInss: TBooleanField;
    tNotaFiscalInsIrf: TBooleanField;
    tNotaFiscalInsVlrInss: TFloatField;
    tNotaFiscalInsVlrIrf: TFloatField;
    tNotaFiscalInsPrazoPgto: TIntegerField;
    tNotaFiscalInsEntrada: TFloatField;
    tNotaFiscalInsPercComissao: TFloatField;
    tNotaFiscalInsDtEntr: TDateField;
    tNotaFiscalInsIcmsIpi: TBooleanField;
    tNotaFiscalInsPlanoContas: TIntegerField;
    tNotaFiscalInsSituacao: TIntegerField;
    tNotaFiscalInsNroLancExtComissao: TIntegerField;
    tNotaFiscalInsTipoNota: TStringField;
    tNotaFiscalInsDescricaoDesc: TStringField;
    tNotaFiscalInsDescTransf: TMemoField;
    tNotaFiscalInsExportacao: TBooleanField;
    tNotaFiscalInsObsAux: TMemoField;
    tNotaFiscalInsPercIssqn: TFloatField;
    tNotaFiscalInsVlrMObra: TFloatField;
    tNotaFiscalInsVlrIssqn: TFloatField;
    tNotaFiscalInsDtCad: TDateField;
    tNotaFiscalInsHrCad: TTimeField;
    tNotaFiscalImp: TTable;
    tNotaFiscalImpFilial: TIntegerField;
    tNotaFiscalImpNumSeq: TIntegerField;
    tNotaFiscalImpItem: TIntegerField;
    tNotaFiscalImpNumDI: TStringField;
    tNotaFiscalImpDataRegistro: TDateField;
    tNotaFiscalImpDataDesembaraco: TDateField;
    tNotaFiscalImpCodExportador: TStringField;
    tNotaFiscalImpCodCidade: TIntegerField;
    tNotaFiscalImpNroFatura: TStringField;
    dsNotaFiscalImp: TDataSource;
    tNotaFiscalImpAdicao: TTable;
    tNotaFiscalImpAdicaoFilial: TIntegerField;
    tNotaFiscalImpAdicaoNumSeq: TIntegerField;
    tNotaFiscalImpAdicaoItemImp: TIntegerField;
    tNotaFiscalImpAdicaoItemAdicao: TIntegerField;
    tNotaFiscalImpAdicaoNumAdicao: TIntegerField;
    tNotaFiscalImpAdicaoCodFabricante: TStringField;
    tNotaFiscalImpAdicaoValorDescontoDI: TFloatField;
    dsNotaFiscalImpAdicao: TDataSource;
    tUF2: TTable;
    tUF2Sigla: TStringField;
    tUF2Percentual: TFloatField;
    tUF2CodSitTrib: TIntegerField;
    tUF2IDPais: TIntegerField;
    tUF2CodUF: TStringField;
    tUF2IcmsInterno: TFloatField;
    dsUF2: TDataSource;
    tNotaFiscalReboque: TTable;
    tNotaFiscalReboqueFilial: TIntegerField;
    tNotaFiscalReboqueNumSeq: TIntegerField;
    tNotaFiscalReboqueItem: TIntegerField;
    tNotaFiscalReboquePlaca: TStringField;
    tNotaFiscalReboqueUF: TStringField;
    tNotaFiscalReboqueRNTC: TStringField;
    dsNotaFiscalReboque: TDataSource;
    tNotaFiscalLacre: TTable;
    tNotaFiscalLacreFilial: TIntegerField;
    tNotaFiscalLacreNumSeq: TIntegerField;
    tNotaFiscalLacreItem: TIntegerField;
    tNotaFiscalLacreNumLacre: TStringField;
    dsNotaFiscalLacre: TDataSource;
    tNotaFiscalTBDesconto: TTable;
    tNotaFiscalTBDescontoFilial: TIntegerField;
    tNotaFiscalTBDescontoNumSeq: TIntegerField;
    tNotaFiscalTBDescontoItem: TIntegerField;
    tNotaFiscalTBDescontoPercDesconto: TFloatField;
    dsNotaFiscalTBDesconto: TDataSource;
    tNotaFiscalImpAdicaoNUM_DRAWBACK: TStringField;
    tNotaFiscalImpLOCAL_DESEMBARACO: TStringField;
    tNotaFiscalImpUF: TStringField;
    tNotaFiscalImpTIPO_VIA_TRANSORTE: TIntegerField;
    tNotaFiscalImpVLR_AFRMM: TFloatField;
    tNotaFiscalImpTIPO_INTERMEDIO: TIntegerField;
    tNotaFiscalImpCNPJ: TStringField;
    tNotaFiscalImpUF_TERCEIRO: TStringField;
    sdsNotaFiscal_DrawBack: TSQLDataSet;
    sdsNotaFiscal_DrawBackID: TIntegerField;
    sdsNotaFiscal_DrawBackITEM: TIntegerField;
    sdsNotaFiscal_DrawBackITEM_DRAWBACK: TIntegerField;
    sdsNotaFiscal_DrawBackNUM_DRAWBACK: TStringField;
    sdsNotaFiscal_DrawBackNUM_REG_EXPORTACAO: TStringField;
    sdsNotaFiscal_DrawBackNUM_CHAVE_ACESSO_NFE: TStringField;
    sdsNotaFiscal_DrawBackQTD: TFloatField;
    dspNotaFiscal_DrawBack: TDataSetProvider;
    cdsNotaFiscal_DrawBack: TClientDataSet;
    cdsNotaFiscal_DrawBackID: TIntegerField;
    cdsNotaFiscal_DrawBackITEM: TIntegerField;
    cdsNotaFiscal_DrawBackITEM_DRAWBACK: TIntegerField;
    cdsNotaFiscal_DrawBackNUM_DRAWBACK: TStringField;
    cdsNotaFiscal_DrawBackNUM_REG_EXPORTACAO: TStringField;
    cdsNotaFiscal_DrawBackNUM_CHAVE_ACESSO_NFE: TStringField;
    cdsNotaFiscal_DrawBackQTD: TFloatField;
    dsNotaFiscal_DrawBack: TDataSource;
    qIcmsPartilha: TSQLQuery;
    qIcmsPartilhaANO: TIntegerField;
    qIcmsPartilhaPERC_DESTINO: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
    vNumSeqNFe : Integer;
    procedure Grava_NumSeq;

  end;

var
  DMNotaFiscal: TDMNotaFiscal;

implementation

uses UDM1;

{$R *.dfm}

procedure TDMNotaFiscal.Grava_NumSeq;
var
  vNumAux : Integer;
  vflag : Boolean;
begin
  DM1.tNotaFiscal.Refresh;
  DMNotaFiscal.tNotaFiscalIns.Refresh;
  DMNotaFiscal.tNotaFiscalIns.Last;
  vflag := False;
  vNumAux := DMNotaFiscal.tNotaFiscalInsNumSeq.AsInteger;
  DMNotaFiscal.tNotaFiscalIns.Refresh;
  DM1.tNotaFiscal.Insert;
  while vflag = False do
    begin
      vNumAux := vNumAux + 1;
      try
        DM1.tNotaFiscalNumSeq.AsInteger        := vNumAux;
        DM1.tNotaFiscal.Post;
        DM1.tNotaFiscal.Refresh;
        DMNotaFiscal.tNotaFiscalIns.Refresh;
        DM1.tNotaFiscal.Locate('Filial;NumSeq',VarArrayOf([DM1.tNotaFiscalFilial.AsInteger,vNumAux]),[locaseinsensitive]);
        DM1.tNotaFiscal.Edit;
        vflag := True;
      except
        on E: Exception do
        begin
          ShowMessage('Não foi possível gravar, ' + E.Message + ' clique para continuar! ');
          vFlag := False;
        end;
      end;
    end;
end;

end.

unit UGeraFB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, FMTBcd, DB, DBClient,
  Provider, SqlExpr, DBTables;

type
  TfGeraFB = class(TForm)
    BitBtn1: TBitBtn;
    sdsTalaoGrade: TSQLDataSet;
    sdsTalaoGradeLOTE: TIntegerField;
    sdsTalaoGradeITEM: TIntegerField;
    sdsTalaoGradeTALAO: TIntegerField;
    sdsTalaoGradeCODGRADE: TIntegerField;
    sdsTalaoGradePOSICAO: TIntegerField;
    sdsTalaoGradeQTDPAR: TIntegerField;
    dspTalaoGrade: TDataSetProvider;
    cdsTalaoGrade: TClientDataSet;
    cdsTalaoGradeLOTE: TIntegerField;
    cdsTalaoGradeITEM: TIntegerField;
    cdsTalaoGradeTALAO: TIntegerField;
    cdsTalaoGradeCODGRADE: TIntegerField;
    cdsTalaoGradePOSICAO: TIntegerField;
    cdsTalaoGradeQTDPAR: TIntegerField;
    tTalaoGrade: TTable;
    tTalaoGradeLote: TIntegerField;
    tTalaoGradeItem: TIntegerField;
    tTalaoGradeTalao: TIntegerField;
    tTalaoGradeCodGrade: TIntegerField;
    tTalaoGradePosicao: TIntegerField;
    tTalaoGradeQtdPar: TIntegerField;
    sdsTalaoMov: TSQLDataSet;
    dspTalaoMov: TDataSetProvider;
    cdsTalaoMov: TClientDataSet;
    tTalaoMov: TTable;
    sdsTalaoMovLOTE: TIntegerField;
    sdsTalaoMovTALAO: TIntegerField;
    sdsTalaoMovSETOR: TIntegerField;
    sdsTalaoMovDATAENT: TDateField;
    sdsTalaoMovHORAENT: TTimeField;
    sdsTalaoMovDATASAIDA: TDateField;
    sdsTalaoMovHORASAIDA: TTimeField;
    sdsTalaoMovCODATELIER: TIntegerField;
    cdsTalaoMovLOTE: TIntegerField;
    cdsTalaoMovTALAO: TIntegerField;
    cdsTalaoMovSETOR: TIntegerField;
    cdsTalaoMovDATAENT: TDateField;
    cdsTalaoMovHORAENT: TTimeField;
    cdsTalaoMovDATASAIDA: TDateField;
    cdsTalaoMovHORASAIDA: TTimeField;
    cdsTalaoMovCODATELIER: TIntegerField;
    tTalaoMovLote: TIntegerField;
    tTalaoMovTalao: TIntegerField;
    tTalaoMovSetor: TIntegerField;
    tTalaoMovDataEnt: TDateField;
    tTalaoMovHoraEnt: TTimeField;
    tTalaoMovDataSaida: TDateField;
    tTalaoMovHoraSaida: TTimeField;
    tTalaoMovCodAtelier: TIntegerField;
    BitBtn2: TBitBtn;
    sdsTalao: TSQLDataSet;
    dspTalao: TDataSetProvider;
    cdsTalao: TClientDataSet;
    tTalao: TTable;
    BitBtn3: TBitBtn;
    sdsTalaoLOTE: TIntegerField;
    sdsTalaoITEM: TIntegerField;
    sdsTalaoCODPRODUTO: TIntegerField;
    sdsTalaoCODCABEDAL1: TIntegerField;
    sdsTalaoCODCABEDAL2: TIntegerField;
    sdsTalaoCODCOR: TIntegerField;
    sdsTalaoCODCORFORRO: TIntegerField;
    sdsTalaoCODCORPALMILHA: TIntegerField;
    sdsTalaoCODCORSOLADO: TIntegerField;
    sdsTalaoQTDPAR: TIntegerField;
    sdsTalaoCODFORRO: TIntegerField;
    sdsTalaoCODETIQUETA: TIntegerField;
    sdsTalaoCODSOLADO: TIntegerField;
    sdsTalaoCODTALONEIRA: TIntegerField;
    sdsTalaoCODCORTALONEIRA: TIntegerField;
    sdsTalaoCODPALMILHA: TIntegerField;
    sdsTalaoINVOICE: TStringField;
    sdsTalaoCODFORMA: TIntegerField;
    sdsTalaoCODFABRICA: TIntegerField;
    cdsTalaoLOTE: TIntegerField;
    cdsTalaoITEM: TIntegerField;
    cdsTalaoCODPRODUTO: TIntegerField;
    cdsTalaoCODCABEDAL1: TIntegerField;
    cdsTalaoCODCABEDAL2: TIntegerField;
    cdsTalaoCODCOR: TIntegerField;
    cdsTalaoCODCORFORRO: TIntegerField;
    cdsTalaoCODCORPALMILHA: TIntegerField;
    cdsTalaoCODCORSOLADO: TIntegerField;
    cdsTalaoQTDPAR: TIntegerField;
    cdsTalaoCODFORRO: TIntegerField;
    cdsTalaoCODETIQUETA: TIntegerField;
    cdsTalaoCODSOLADO: TIntegerField;
    cdsTalaoCODTALONEIRA: TIntegerField;
    cdsTalaoCODCORTALONEIRA: TIntegerField;
    cdsTalaoCODPALMILHA: TIntegerField;
    cdsTalaoINVOICE: TStringField;
    cdsTalaoCODFORMA: TIntegerField;
    cdsTalaoCODFABRICA: TIntegerField;
    tTalaoLote: TIntegerField;
    tTalaoItem: TIntegerField;
    tTalaoCodProduto: TIntegerField;
    tTalaoCodCabedal1: TIntegerField;
    tTalaoCodCabedal2: TIntegerField;
    tTalaoCodCor: TIntegerField;
    tTalaoCodCorForro: TIntegerField;
    tTalaoCodCorPalmilha: TIntegerField;
    tTalaoCodCorSolado: TIntegerField;
    tTalaoQtdPar: TIntegerField;
    tTalaoCodForro: TIntegerField;
    tTalaoCodEtiqueta: TIntegerField;
    tTalaoCodSolado: TIntegerField;
    tTalaoCodTaloneira: TIntegerField;
    tTalaoCodCorTaloneira: TIntegerField;
    tTalaoCodPalmilha: TIntegerField;
    tTalaoInvoice: TStringField;
    tTalaoCodForma: TIntegerField;
    tTalaoCodFabrica: TIntegerField;
    BitBtn4: TBitBtn;
    sdsLote: TSQLDataSet;
    dspLote: TDataSetProvider;
    cdsLote: TClientDataSet;
    tLote: TTable;
    sdsLoteLOTE: TIntegerField;
    sdsLoteQTDTALOES: TIntegerField;
    sdsLoteQTDPARES: TFloatField;
    sdsLoteOBS: TMemoField;
    sdsLoteIMPCALCMATERIAL: TStringField;
    sdsLoteNROPEDIDO: TIntegerField;
    sdsLoteIMPRESSO: TStringField;
    sdsLoteOCGERADO: TStringField;
    sdsLoteITEMPED: TIntegerField;
    sdsLoteNUMMAPACOMPRAS: TIntegerField;
    sdsLoteDTEMBARQUE: TDateField;
    sdsLoteTIPOTALAO: TStringField;
    sdsLoteCODFABRICA: TIntegerField;
    sdsLoteNUMPROGRAMACAO: TIntegerField;
    sdsLoteNUMOCINI: TIntegerField;
    sdsLoteNUMOCFIN: TIntegerField;
    cdsLoteLOTE: TIntegerField;
    cdsLoteQTDTALOES: TIntegerField;
    cdsLoteQTDPARES: TFloatField;
    cdsLoteOBS: TMemoField;
    cdsLoteIMPCALCMATERIAL: TStringField;
    cdsLoteNROPEDIDO: TIntegerField;
    cdsLoteIMPRESSO: TStringField;
    cdsLoteOCGERADO: TStringField;
    cdsLoteITEMPED: TIntegerField;
    cdsLoteNUMMAPACOMPRAS: TIntegerField;
    cdsLoteDTEMBARQUE: TDateField;
    cdsLoteTIPOTALAO: TStringField;
    cdsLoteCODFABRICA: TIntegerField;
    cdsLoteNUMPROGRAMACAO: TIntegerField;
    cdsLoteNUMOCINI: TIntegerField;
    cdsLoteNUMOCFIN: TIntegerField;
    tLoteLote: TIntegerField;
    tLoteQtdTaloes: TIntegerField;
    tLoteQtdPares: TFloatField;
    tLoteObs: TMemoField;
    tLoteImpCalcMaterial: TBooleanField;
    tLoteNroPedido: TIntegerField;
    tLoteImpresso: TBooleanField;
    tLoteOCGerado: TBooleanField;
    tLoteItemPed: TIntegerField;
    tLoteNumMapaCompras: TIntegerField;
    tLoteDtEmbarque: TDateField;
    tLoteTipoTalao: TStringField;
    tLoteCodFabrica: TIntegerField;
    tLoteNumProgramacao: TIntegerField;
    tLoteNumOCIni: TIntegerField;
    tLoteNumOCFin: TIntegerField;
    BitBtn5: TBitBtn;
    sdsProduto: TSQLDataSet;
    dspProduto: TDataSetProvider;
    cdsProduto: TClientDataSet;
    tProduto: TTable;
    sdsProdutoCODIGO: TIntegerField;
    sdsProdutoCODGRUPO: TIntegerField;
    sdsProdutoCODSUBGRUPO: TIntegerField;
    sdsProdutoREFERENCIA: TStringField;
    sdsProdutoNOME: TStringField;
    sdsProdutoUNIDADE: TStringField;
    sdsProdutoCODCLASFISCAL: TStringField;
    sdsProdutoCODSITTRIB: TIntegerField;
    sdsProdutoLANCAGRADE: TStringField;
    sdsProdutoCODGRADE: TIntegerField;
    sdsProdutoQPARTALAO: TFloatField;
    sdsProdutoPESOLIQUIDO: TFloatField;
    sdsProdutoPESOBRUTO: TFloatField;
    sdsProdutoINATIVO: TStringField;
    sdsProdutoCONSUMO: TStringField;
    sdsProdutoALIQICMS: TFloatField;
    sdsProdutoALIQIPI: TFloatField;
    sdsProdutoNOMEEXP: TStringField;
    sdsProdutoCODMODELISTA: TIntegerField;
    sdsProdutoCOMISSAOMOD: TFloatField;
    sdsProdutoDESCMATERIAL: TStringField;
    sdsProdutoREFERENCIA2: TStringField;
    sdsProdutoVLRATELIER: TFloatField;
    sdsProdutoCONSTRUCAO: TStringField;
    sdsProdutoNOMEMODELO: TStringField;
    sdsProdutoFOTOJPEG: TMemoField;
    sdsProdutoPALMINTERNA: TStringField;
    sdsProdutoOBS: TMemoField;
    sdsProdutoENDETIQ: TStringField;
    sdsProdutoMERCADO: TStringField;
    sdsProdutoCODFORMA: TIntegerField;
    sdsProdutoTEMPOREAL: TFloatField;
    sdsProdutoCODCONSTRUCAO: TIntegerField;
    sdsProdutoCODCONSTRUCAOGRUPO: TIntegerField;
    sdsProdutoDTCADASTRO: TDateField;
    sdsProdutoCADASTROCOMPLETO: TStringField;
    sdsProdutoCOMPLEMENTO: TStringField;
    sdsProdutoPRODMAT: TStringField;
    sdsProdutoORIGEMPROD: TStringField;
    sdsProdutoCODCSTIPI: TStringField;
    sdsProdutoLANCACOR: TStringField;
    sdsProdutoENDFOTO: TStringField;
    tProdutoCodigo: TIntegerField;
    tProdutoCodGrupo: TIntegerField;
    tProdutoCodSubGrupo: TIntegerField;
    tProdutoReferencia: TStringField;
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
    tProdutoReferencia2: TStringField;
    tProdutoVlrAtelier: TFloatField;
    tProdutoConstrucao: TStringField;
    tProdutoNomeModelo: TStringField;
    tProdutoFotoJpeg: TBlobField;
    tProdutoPalmInterna: TStringField;
    tProdutoObs: TMemoField;
    tProdutoEndEtiq: TStringField;
    tProdutoMercado: TStringField;
    tProdutoCodForma: TIntegerField;
    tProdutoTempoCalculo: TFloatField;
    tProdutoTempoReal: TFloatField;
    tProdutoCodConstrucao: TIntegerField;
    tProdutoCodConstrucaoGrupo: TIntegerField;
    tProdutoDtCadastro: TDateField;
    tProdutoCadastroCompleto: TBooleanField;
    tProdutoComplemento: TStringField;
    tProdutoProdMat: TStringField;
    tProdutoOrigemProd: TStringField;
    tProdutoCodCSTIPI: TStringField;
    tProdutoLancaCor: TBooleanField;
    tProdutoEndFoto: TStringField;
    cdsProdutoCODIGO: TIntegerField;
    cdsProdutoCODGRUPO: TIntegerField;
    cdsProdutoCODSUBGRUPO: TIntegerField;
    cdsProdutoREFERENCIA: TStringField;
    cdsProdutoNOME: TStringField;
    cdsProdutoUNIDADE: TStringField;
    cdsProdutoCODCLASFISCAL: TStringField;
    cdsProdutoCODSITTRIB: TIntegerField;
    cdsProdutoLANCAGRADE: TStringField;
    cdsProdutoCODGRADE: TIntegerField;
    cdsProdutoQPARTALAO: TFloatField;
    cdsProdutoPESOLIQUIDO: TFloatField;
    cdsProdutoPESOBRUTO: TFloatField;
    cdsProdutoINATIVO: TStringField;
    cdsProdutoCONSUMO: TStringField;
    cdsProdutoALIQICMS: TFloatField;
    cdsProdutoALIQIPI: TFloatField;
    cdsProdutoNOMEEXP: TStringField;
    cdsProdutoCODMODELISTA: TIntegerField;
    cdsProdutoCOMISSAOMOD: TFloatField;
    cdsProdutoDESCMATERIAL: TStringField;
    cdsProdutoREFERENCIA2: TStringField;
    cdsProdutoVLRATELIER: TFloatField;
    cdsProdutoCONSTRUCAO: TStringField;
    cdsProdutoNOMEMODELO: TStringField;
    cdsProdutoFOTOJPEG: TMemoField;
    cdsProdutoPALMINTERNA: TStringField;
    cdsProdutoOBS: TMemoField;
    cdsProdutoENDETIQ: TStringField;
    cdsProdutoMERCADO: TStringField;
    cdsProdutoCODFORMA: TIntegerField;
    cdsProdutoTEMPOREAL: TFloatField;
    cdsProdutoCODCONSTRUCAO: TIntegerField;
    cdsProdutoCODCONSTRUCAOGRUPO: TIntegerField;
    cdsProdutoDTCADASTRO: TDateField;
    cdsProdutoCADASTROCOMPLETO: TStringField;
    cdsProdutoCOMPLEMENTO: TStringField;
    cdsProdutoPRODMAT: TStringField;
    cdsProdutoORIGEMPROD: TStringField;
    cdsProdutoCODCSTIPI: TStringField;
    cdsProdutoLANCACOR: TStringField;
    cdsProdutoENDFOTO: TStringField;
    BitBtn6: TBitBtn;
    sdsMaterial: TSQLDataSet;
    dspMaterial: TDataSetProvider;
    cdsMaterial: TClientDataSet;
    tMaterial: TTable;
    sdsMaterialCODIGO: TIntegerField;
    sdsMaterialNOME: TStringField;
    sdsMaterialGRUPO: TIntegerField;
    sdsMaterialSUBGRUPO: TIntegerField;
    sdsMaterialUNIDADE: TStringField;
    sdsMaterialICMS: TFloatField;
    sdsMaterialIPI: TFloatField;
    sdsMaterialPRCUSTO: TFloatField;
    sdsMaterialFORNECEDOR: TIntegerField;
    sdsMaterialCODGRADE: TIntegerField;
    sdsMaterialESTMINIMO: TFloatField;
    sdsMaterialINATIVO: TStringField;
    sdsMaterialLANCACOR: TStringField;
    sdsMaterialPRECOCOR: TStringField;
    sdsMaterialLANCAGRADE: TStringField;
    sdsMaterialPRECOGRADE: TStringField;
    sdsMaterialTIPOMAT: TStringField;
    sdsMaterialTIPOSOLADO: TStringField;
    sdsMaterialMATERIALOUTROS: TStringField;
    sdsMaterialDTALTERACAO: TDateField;
    sdsMaterialCALCMATERIAL: TStringField;
    sdsMaterialPRE: TStringField;
    sdsMaterialCODCLASFISCAL: TStringField;
    sdsMaterialIMPGRADETALAOAUXILIAR: TStringField;
    sdsMaterialIMPTALAOAUXILIAR: TStringField;
    sdsMaterialIMPCALCMATERIAL: TStringField;
    sdsMaterialTIPOREG: TStringField;
    sdsMaterialCOMPLEMENTO: TStringField;
    sdsMaterialCODSITTRIB: TIntegerField;
    sdsMaterialGERAOC: TStringField;
    sdsMaterialORIGEMPROD: TStringField;
    sdsMaterialUSUARIO: TStringField;
    sdsMaterialCORRETO: TStringField;
    cdsMaterialCODIGO: TIntegerField;
    cdsMaterialNOME: TStringField;
    cdsMaterialGRUPO: TIntegerField;
    cdsMaterialSUBGRUPO: TIntegerField;
    cdsMaterialUNIDADE: TStringField;
    cdsMaterialICMS: TFloatField;
    cdsMaterialIPI: TFloatField;
    cdsMaterialPRCUSTO: TFloatField;
    cdsMaterialFORNECEDOR: TIntegerField;
    cdsMaterialCODGRADE: TIntegerField;
    cdsMaterialESTMINIMO: TFloatField;
    cdsMaterialINATIVO: TStringField;
    cdsMaterialLANCACOR: TStringField;
    cdsMaterialPRECOCOR: TStringField;
    cdsMaterialLANCAGRADE: TStringField;
    cdsMaterialPRECOGRADE: TStringField;
    cdsMaterialTIPOMAT: TStringField;
    cdsMaterialTIPOSOLADO: TStringField;
    cdsMaterialMATERIALOUTROS: TStringField;
    cdsMaterialDTALTERACAO: TDateField;
    cdsMaterialCALCMATERIAL: TStringField;
    cdsMaterialPRE: TStringField;
    cdsMaterialCODCLASFISCAL: TStringField;
    cdsMaterialIMPGRADETALAOAUXILIAR: TStringField;
    cdsMaterialIMPTALAOAUXILIAR: TStringField;
    cdsMaterialIMPCALCMATERIAL: TStringField;
    cdsMaterialTIPOREG: TStringField;
    cdsMaterialCOMPLEMENTO: TStringField;
    cdsMaterialCODSITTRIB: TIntegerField;
    cdsMaterialGERAOC: TStringField;
    cdsMaterialORIGEMPROD: TStringField;
    cdsMaterialUSUARIO: TStringField;
    cdsMaterialCORRETO: TStringField;
    tMaterialCodigo: TIntegerField;
    tMaterialNome: TStringField;
    tMaterialGrupo: TIntegerField;
    tMaterialSubGrupo: TIntegerField;
    tMaterialUnidade: TStringField;
    tMaterialICMS: TFloatField;
    tMaterialIPI: TFloatField;
    tMaterialPrCusto: TFloatField;
    tMaterialFornecedor: TIntegerField;
    tMaterialCodGrade: TIntegerField;
    tMaterialEstMinimo: TFloatField;
    tMaterialInativo: TBooleanField;
    tMaterialLancaCor: TBooleanField;
    tMaterialPrecoCor: TBooleanField;
    tMaterialLancaGrade: TBooleanField;
    tMaterialPrecoGrade: TBooleanField;
    tMaterialTipoMat: TStringField;
    tMaterialTipoSolado: TStringField;
    tMaterialMaterialOutros: TStringField;
    tMaterialDtAlteracao: TDateField;
    tMaterialCalcMaterial: TBooleanField;
    tMaterialPre: TBooleanField;
    tMaterialCodClasFiscal: TStringField;
    tMaterialImpGradeTalaoAuxiliar: TBooleanField;
    tMaterialImpTalaoAuxiliar: TBooleanField;
    tMaterialImpCalcMaterial: TBooleanField;
    tMaterialTipoReg: TStringField;
    tMaterialComplemento: TStringField;
    tMaterialCodSitTrib: TIntegerField;
    tMaterialGeraOC: TBooleanField;
    tMaterialOrigemProd: TStringField;
    tMaterialUsuario: TStringField;
    tMaterialCorreto: TBooleanField;
    BitBtn7: TBitBtn;
    sdsArmazenamento_Ref: TSQLDataSet;
    dspArmazenamento_Ref: TDataSetProvider;
    cdsArmazenamento_Ref: TClientDataSet;
    tArmazReferencia: TTable;
    sdsArmazenamento_RefID: TIntegerField;
    sdsArmazenamento_RefCAIXA: TStringField;
    sdsArmazenamento_RefREFERENCIA: TStringField;
    sdsArmazenamento_RefCIA: TStringField;
    sdsArmazenamento_RefDATA: TDateField;
    cdsArmazenamento_RefID: TIntegerField;
    cdsArmazenamento_RefCAIXA: TStringField;
    cdsArmazenamento_RefREFERENCIA: TStringField;
    cdsArmazenamento_RefCIA: TStringField;
    cdsArmazenamento_RefDATA: TDateField;
    tArmazReferenciaId: TIntegerField;
    tArmazReferenciaCaixa: TStringField;
    tArmazReferenciaReferencia: TStringField;
    tArmazReferenciaCia: TStringField;
    tArmazReferenciaData: TDateField;
    BitBtn8: TBitBtn;
    sdsNavalha_Local: TSQLDataSet;
    dspNavalha_Local: TDataSetProvider;
    cdsNavalha_Local: TClientDataSet;
    tNavalha_Local: TTable;
    tNavalha_LocalId: TIntegerField;
    tNavalha_LocalDtEntrada: TDateField;
    tNavalha_LocalLocalizacao: TStringField;
    tNavalha_LocalNavalha: TStringField;
    tNavalha_LocalReorder: TStringField;
    tNavalha_LocalDtDescarte: TDateField;
    tNavalha_LocalDtEstoque: TDateField;
    sdsNavalha_LocalID: TIntegerField;
    sdsNavalha_LocalDTENTRADA: TDateField;
    sdsNavalha_LocalLOCALIZACAO: TStringField;
    sdsNavalha_LocalNAVALHA: TStringField;
    sdsNavalha_LocalREORDER: TStringField;
    sdsNavalha_LocalDTDESCARTE: TDateField;
    sdsNavalha_LocalDTESTOQUE: TDateField;
    cdsNavalha_LocalID: TIntegerField;
    cdsNavalha_LocalDTENTRADA: TDateField;
    cdsNavalha_LocalLOCALIZACAO: TStringField;
    cdsNavalha_LocalNAVALHA: TStringField;
    cdsNavalha_LocalREORDER: TStringField;
    cdsNavalha_LocalDTDESCARTE: TDateField;
    cdsNavalha_LocalDTESTOQUE: TDateField;
    sdsProdutoTEMPOCALCULO: TFloatField;
    cdsProdutoTEMPOCALCULO: TFloatField;
    sdsMaterialNOMESEMACENTO: TStringField;
    cdsMaterialNOMESEMACENTO: TStringField;
    tMaterialNomeSemAcento: TStringField;
    BitBtn9: TBitBtn;
    sdsCliente: TSQLDataSet;
    dspCliente: TDataSetProvider;
    cdsCliente: TClientDataSet;
    tCliente: TTable;
    tClienteCodigo: TIntegerField;
    tClienteNome: TStringField;
    tClienteEndereco: TStringField;
    tClienteBairro: TStringField;
    tClienteCidade: TStringField;
    tClienteUf: TStringField;
    tClienteCep: TStringField;
    tClienteTelefone: TStringField;
    tClienteTelefone2: TStringField;
    tClienteFax: TStringField;
    tClientePessoa: TStringField;
    tClienteCgcCpf: TStringField;
    tClienteInscrEst: TStringField;
    tClienteContato: TStringField;
    tClienteObs: TMemoField;
    tClienteAprovCredito: TStringField;
    tClienteTipoAprov: TStringField;
    tClienteEndEntrega: TStringField;
    tClienteBairroEntrega: TStringField;
    tClienteCidEntrega: TStringField;
    tClienteCepEntrega: TStringField;
    tClienteUfEntrega: TStringField;
    tClienteCgcCpfEntrega: TStringField;
    tClienteInscEntrega: TStringField;
    tClienteEndPgto: TStringField;
    tClienteBairroPgto: TStringField;
    tClienteCidPgto: TStringField;
    tClienteCepPgto: TStringField;
    tClienteUfPgto: TStringField;
    tClienteFantasia: TStringField;
    tClienteDtCadastro: TDateField;
    tClienteCodVendedor: TIntegerField;
    tClienteObsCtas: TMemoField;
    tClienteLojas: TIntegerField;
    tClienteSelecionado: TBooleanField;
    tClienteCaixaPostal: TStringField;
    tClienteRg: TStringField;
    tClienteCodCidade: TIntegerField;
    tClienteCodCidadeE: TIntegerField;
    tClienteCodCidadeP: TIntegerField;
    tClienteEmail: TStringField;
    tClienteMercado: TStringField;
    tClienteNumEnd: TStringField;
    tClienteNumEndEntrega: TStringField;
    tClienteEmailNfe: TStringField;
    tClienteComplEndereco: TStringField;
    tClienteDtValidadeIPI: TDateField;
    tClienteCodObsIPI: TIntegerField;
    tClienteHomePage: TStringField;
    tClienteComplEnderecoEntrega: TStringField;
    tClienteCodSitTribSimples: TIntegerField;
    tClienteUsaIcmsSimples: TBooleanField;
    tClienteDDDFone1: TIntegerField;
    tClienteDDDFone2: TIntegerField;
    tClienteDDDFax: TIntegerField;
    tClienteIDPais: TIntegerField;
    tClienteEmailNFe2: TStringField;
    sdsClienteCODIGO: TIntegerField;
    sdsClienteNOME: TStringField;
    sdsClienteENDERECO: TStringField;
    sdsClienteBAIRRO: TStringField;
    sdsClienteCIDADE: TStringField;
    sdsClienteUF: TStringField;
    sdsClienteCEP: TStringField;
    sdsClienteTELEFONE: TStringField;
    sdsClienteTELEFONE2: TStringField;
    sdsClienteFAX: TStringField;
    sdsClientePESSOA: TStringField;
    sdsClienteCGCCPF: TStringField;
    sdsClienteINSCREST: TStringField;
    sdsClienteCONTATO: TStringField;
    sdsClienteOBS: TMemoField;
    sdsClienteAPROVCREDITO: TStringField;
    sdsClienteTIPOAPROV: TStringField;
    sdsClienteENDENTREGA: TStringField;
    sdsClienteBAIRROENTREGA: TStringField;
    sdsClienteCIDENTREGA: TStringField;
    sdsClienteCEPENTREGA: TStringField;
    sdsClienteUFENTREGA: TStringField;
    sdsClienteCGCCPFENTREGA: TStringField;
    sdsClienteINSCENTREGA: TStringField;
    sdsClienteENDPGTO: TStringField;
    sdsClienteBAIRROPGTO: TStringField;
    sdsClienteCIDPGTO: TStringField;
    sdsClienteCEPPGTO: TStringField;
    sdsClienteUFPGTO: TStringField;
    sdsClienteFANTASIA: TStringField;
    sdsClienteDTCADASTRO: TDateField;
    sdsClienteCODVENDEDOR: TIntegerField;
    sdsClienteOBSCTAS: TMemoField;
    sdsClienteLOJAS: TIntegerField;
    sdsClienteSELECIONADO: TStringField;
    sdsClienteCAIXAPOSTAL: TStringField;
    sdsClienteRG: TStringField;
    sdsClienteCODCIDADE: TIntegerField;
    sdsClienteCODCIDADEE: TIntegerField;
    sdsClienteEMAIL: TStringField;
    sdsClienteMERCADO: TStringField;
    sdsClienteNUMEND: TStringField;
    sdsClienteNUMENDENTREGA: TStringField;
    sdsClienteEMAILNFE: TStringField;
    sdsClienteCOMPLENDERECO: TStringField;
    sdsClienteDTVALIDADEIPI: TDateField;
    sdsClienteCODOBSIPI: TIntegerField;
    sdsClienteHOMEPAGE: TStringField;
    sdsClienteCOMPLENDERECOENTREGA: TStringField;
    sdsClienteCODSITTRIBSIMPLES: TIntegerField;
    sdsClienteUSAICMSSIMPLES: TStringField;
    sdsClienteDDDFONE1: TIntegerField;
    sdsClienteDDDFONE2: TIntegerField;
    sdsClienteDDDFAX: TIntegerField;
    sdsClienteIDPAIS: TIntegerField;
    sdsClienteEMAILNFE2: TStringField;
    cdsClienteCODIGO: TIntegerField;
    cdsClienteNOME: TStringField;
    cdsClienteENDERECO: TStringField;
    cdsClienteBAIRRO: TStringField;
    cdsClienteCIDADE: TStringField;
    cdsClienteUF: TStringField;
    cdsClienteCEP: TStringField;
    cdsClienteTELEFONE: TStringField;
    cdsClienteTELEFONE2: TStringField;
    cdsClienteFAX: TStringField;
    cdsClientePESSOA: TStringField;
    cdsClienteCGCCPF: TStringField;
    cdsClienteINSCREST: TStringField;
    cdsClienteCONTATO: TStringField;
    cdsClienteOBS: TMemoField;
    cdsClienteAPROVCREDITO: TStringField;
    cdsClienteTIPOAPROV: TStringField;
    cdsClienteENDENTREGA: TStringField;
    cdsClienteBAIRROENTREGA: TStringField;
    cdsClienteCIDENTREGA: TStringField;
    cdsClienteCEPENTREGA: TStringField;
    cdsClienteUFENTREGA: TStringField;
    cdsClienteCGCCPFENTREGA: TStringField;
    cdsClienteINSCENTREGA: TStringField;
    cdsClienteENDPGTO: TStringField;
    cdsClienteBAIRROPGTO: TStringField;
    cdsClienteCIDPGTO: TStringField;
    cdsClienteCEPPGTO: TStringField;
    cdsClienteUFPGTO: TStringField;
    cdsClienteFANTASIA: TStringField;
    cdsClienteDTCADASTRO: TDateField;
    cdsClienteCODVENDEDOR: TIntegerField;
    cdsClienteOBSCTAS: TMemoField;
    cdsClienteLOJAS: TIntegerField;
    cdsClienteSELECIONADO: TStringField;
    cdsClienteCAIXAPOSTAL: TStringField;
    cdsClienteRG: TStringField;
    cdsClienteCODCIDADE: TIntegerField;
    cdsClienteCODCIDADEE: TIntegerField;
    cdsClienteEMAIL: TStringField;
    cdsClienteMERCADO: TStringField;
    cdsClienteNUMEND: TStringField;
    cdsClienteNUMENDENTREGA: TStringField;
    cdsClienteEMAILNFE: TStringField;
    cdsClienteCOMPLENDERECO: TStringField;
    cdsClienteDTVALIDADEIPI: TDateField;
    cdsClienteCODOBSIPI: TIntegerField;
    cdsClienteHOMEPAGE: TStringField;
    cdsClienteCOMPLENDERECOENTREGA: TStringField;
    cdsClienteCODSITTRIBSIMPLES: TIntegerField;
    cdsClienteUSAICMSSIMPLES: TStringField;
    cdsClienteDDDFONE1: TIntegerField;
    cdsClienteDDDFONE2: TIntegerField;
    cdsClienteDDDFAX: TIntegerField;
    cdsClienteIDPAIS: TIntegerField;
    cdsClienteEMAILNFE2: TStringField;
    sdsClienteNOMESEMACENTO: TStringField;
    cdsClienteNOMESEMACENTO: TStringField;
    tClienteNomeSemAcento: TStringField;
    BitBtn10: TBitBtn;
    qCriaCampos: TQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGeraFB: TfGeraFB;

implementation

uses DmdDatabase, uUtilPadrao;

{$R *.dfm}

procedure TfGeraFB.BitBtn1Click(Sender: TObject);
begin
  cdsTalaoGrade.Close;
  cdsTalaoGrade.Open;
  tTalaoGrade.First;
  while not tTalaoGrade.Eof do
  begin
    cdsTalaoGrade.Insert;
    cdsTalaoGradeLOTE.AsInteger     := tTalaoGradeLote.AsInteger;
    cdsTalaoGradeITEM.AsInteger     := tTalaoGradeItem.AsInteger;
    cdsTalaoGradeTALAO.AsInteger    := tTalaoGradeTalao.AsInteger;
    cdsTalaoGradeCODGRADE.AsInteger := tTalaoGradeCodGrade.AsInteger;
    cdsTalaoGradePOSICAO.AsInteger  := tTalaoGradePosicao.AsInteger;
    cdsTalaoGradeQTDPAR.AsInteger   := tTalaoGradeQtdPar.AsInteger;
    cdsTalaoGrade.Post;
    cdsTalaoGrade.ApplyUpdates(0);
    tTalaoGrade.Next;
  end;
  ShowMessage('Talão Grade gerado!');
end;

procedure TfGeraFB.BitBtn2Click(Sender: TObject);
begin
  cdsTalaoMov.Close;
  cdsTalaoMov.Open;
  tTalaoMov.First;
  while not tTalaoMov.Eof do
  begin
    cdsTalaoMov.Insert;

    cdsTalaoMovLOTE.AsInteger       := tTalaoMovLote.AsInteger;
    cdsTalaoMovTALAO.AsInteger      := tTalaoMovTalao.AsInteger;
    cdsTalaoMovSETOR.AsInteger      := tTalaoMovSetor.AsInteger;
    cdsTalaoMovDATAENT.AsDateTime   := tTalaoMovDataEnt.AsDateTime;
    cdsTalaoMovHORAENT.AsDateTime   := tTalaoMovHoraEnt.AsDateTime;
    cdsTalaoMovDATASAIDA.AsDateTime := tTalaoMovDataSaida.AsDateTime;
    cdsTalaoMovHORASAIDA.AsDateTime := tTalaoMovHoraSaida.AsDateTime;
    cdsTalaoMovCODATELIER.AsInteger := tTalaoMovCodAtelier.AsInteger;

    cdsTalaoMov.Post;
    cdsTalaoMov.ApplyUpdates(0);

    tTalaoMov.Next;
  end;
  ShowMessage('Talão Mov gerado!');
end;

procedure TfGeraFB.BitBtn3Click(Sender: TObject);
begin
  cdsTalao.Close;
  cdsTalao.Open;
  tTalao.First;
  while not tTalao.Eof do
  begin
    cdsTalao.Insert;
    cdsTalaoLOTE.AsInteger            := tTalaoLote.AsInteger;
    cdsTalaoITEM.AsInteger            := tTalaoItem.AsInteger;
    cdsTalaoCODPRODUTO.AsInteger      := tTalaoCodProduto.AsInteger;
    cdsTalaoCODCABEDAL1.AsInteger     := tTalaoCodCabedal1.AsInteger;
    cdsTalaoCODCABEDAL2.AsInteger     := tTalaoCodCabedal2.AsInteger;
    cdsTalaoCODCOR.AsInteger          := tTalaoCodCor.AsInteger;
    cdsTalaoCODCORFORRO.AsInteger     := tTalaoCodCorForro.AsInteger;
    cdsTalaoCODCORPALMILHA.AsInteger  := tTalaoCodCorPalmilha.AsInteger;
    cdsTalaoCODCORSOLADO.AsInteger    := tTalaoCodCorSolado.AsInteger;
    cdsTalaoQTDPAR.AsInteger          := tTalaoQtdPar.AsInteger;
    cdsTalaoCODFORRO.AsInteger        := tTalaoCodForro.AsInteger;
    cdsTalaoCODETIQUETA.AsInteger     := tTalaoCodEtiqueta.AsInteger;
    cdsTalaoCODSOLADO.AsInteger       := tTalaoCodSolado.AsInteger;
    cdsTalaoCODTALONEIRA.AsInteger    := tTalaoCodTaloneira.AsInteger;
    cdsTalaoCODCORTALONEIRA.AsInteger := tTalaoCodCorTaloneira.AsInteger;
    cdsTalaoCODPALMILHA.AsInteger     := tTalaoCodPalmilha.AsInteger;
    cdsTalaoINVOICE.AsString          := tTalaoInvoice.AsString;
    cdsTalaoCODFORMA.AsInteger        := tTalaoCodForma.AsInteger;
    cdsTalaoCODFABRICA.AsInteger      := tTalaoCodFabrica.AsInteger;
    cdsTalao.Post;
    cdsTalao.ApplyUpdates(0);

    tTalao.Next;
  end;
  ShowMessage('Talão gerado!');
end;

procedure TfGeraFB.BitBtn4Click(Sender: TObject);
begin
  cdsLote.Close;
  cdsLote.Open;
  tLote.First;
  while not tLote.Eof do
  begin
    cdsLote.Insert;

    cdsLoteLOTE.AsInteger := tLoteLote.AsInteger;
    cdsLoteQTDTALOES.AsInteger := tLoteQtdTaloes.AsInteger;
    cdsLoteQTDPARES.AsFloat    := tLoteQtdPares.AsFloat;
    cdsLoteOBS.Value           := tLoteObs.Value;
    if tLoteImpCalcMaterial.AsBoolean then
      cdsLoteIMPCALCMATERIAL.AsString := 'S'
    else
      cdsLoteIMPCALCMATERIAL.AsString := 'N';
    cdsLoteNROPEDIDO.AsInteger := tLoteNroPedido.AsInteger;
    if tLoteImpresso.AsBoolean then
      cdsLoteIMPRESSO.AsString := 'S'
    else
      cdsLoteIMPRESSO.AsString := 'N';
    if tLoteOCGerado.AsBoolean then
      cdsLoteOCGERADO.AsString := 'S'
    else
      cdsLoteOCGERADO.AsString := 'N';
    cdsLoteITEMPED.AsInteger := tLoteItemPed.AsInteger;
    cdsLoteNUMMAPACOMPRAS.AsInteger := tLoteNumMapaCompras.AsInteger;
    cdsLoteDTEMBARQUE.AsDateTime    := tLoteDtEmbarque.AsDateTime;
    cdsLoteTIPOTALAO.AsString       := tLoteTipoTalao.AsString;
    cdsLoteCODFABRICA.AsInteger     := tLoteCodFabrica.AsInteger;
    cdsLoteNUMPROGRAMACAO.AsInteger := tLoteNumProgramacao.AsInteger;
    cdsLoteNUMOCINI.AsInteger       := tLoteNumOCIni.AsInteger;
    cdsLoteNUMOCFIN.AsInteger       := tLoteNumOCFin.AsInteger;
    cdsLote.Post;
    cdsLote.ApplyUpdates(0);

    tLote.Next;
  end;
  ShowMessage('Lote gerado!');

end;

procedure TfGeraFB.BitBtn5Click(Sender: TObject);
begin
  cdsProduto.Close;
  cdsProduto.Open;
  cdsProduto.First;
  while not cdsProduto.Eof do
    cdsProduto.Delete;
  cdsProduto.ApplyUpdates(0);
  tProduto.Open;
  while not tProduto.Eof do
  begin
    cdsProduto.Insert;
    cdsProdutoCODIGO.AsInteger       := tProdutoCodigo.AsInteger;
    cdsProdutoCODGRUPO.AsInteger     := tProdutoCodGrupo.AsInteger;
    cdsProdutoCODSUBGRUPO.AsInteger  := tProdutoCodSubGrupo.AsInteger;
    cdsProdutoREFERENCIA.AsString    := tProdutoReferencia.AsString;
    cdsProdutoNOME.AsString          := tProdutoNome.AsString;
    cdsProdutoUNIDADE.AsString       := tProdutoUnidade.AsString;
    cdsProdutoCODCLASFISCAL.AsString := tProdutoCodClasFiscal.AsString;
    cdsProdutoCODSITTRIB.AsInteger   := tProdutoCodSitTrib.AsInteger;
    if tProdutoLancaGrade.AsBoolean then
      cdsProdutoLANCAGRADE.AsString := 'S'
    else
      cdsProdutoLANCAGRADE.AsString := 'N';
    cdsProdutoCODGRADE.AsInteger     := tProdutoCodGrade.AsInteger;
    cdsProdutoQPARTALAO.AsFloat      := tProdutoQParTalao.AsFloat;
    cdsProdutoPESOLIQUIDO.AsFloat    := tProdutoPesoLiquido.AsFloat;
    cdsProdutoPESOBRUTO.AsFloat      := tProdutoPesoBruto.AsFloat;
    if tProdutoInativo.AsBoolean then
      cdsProdutoINATIVO.AsString     := 'S'
    else
      cdsProdutoINATIVO.AsString     := 'N';
    cdsProdutoCONSUMO.AsString       := tProdutoConsumo.AsString;
    cdsProdutoALIQICMS.AsFloat       := tProdutoAliqIcms.AsFloat;
    cdsProdutoALIQIPI.AsFloat        := tProdutoAliqIPI.AsFloat;
    cdsProdutoNOMEEXP.AsString       := tProdutoNomeExp.AsString;
    cdsProdutoCODMODELISTA.AsInteger := tProdutoCodModelista.AsInteger;
    cdsProdutoCOMISSAOMOD.AsFloat    := tProdutoComissaoMod.AsFloat;
    cdsProdutoDESCMATERIAL.AsString  := tProdutoDescMaterial.AsString;
    cdsProdutoREFERENCIA2.AsString   := tProdutoReferencia2.AsString;
    cdsProdutoVLRATELIER.AsFloat     := tProdutoVlrAtelier.AsFloat;
    cdsProdutoCONSTRUCAO.AsString    := tProdutoConstrucao.AsString;
    cdsProdutoNOMEMODELO.AsString    := tProdutoNomeModelo.AsString;
    cdsProdutoPALMINTERNA.AsString   := tProdutoPalmInterna.AsString;
    cdsProdutoOBS.Value              := tProdutoObs.Value;
    cdsProdutoENDETIQ.AsString       := tProdutoEndEtiq.AsString;
    cdsProdutoMERCADO.AsString       := tProdutoMercado.AsString;
    cdsProdutoCODFORMA.AsInteger     := tProdutoCodForma.AsInteger;
    cdsProdutoTEMPOCALCULO.AsFloat   := tProdutoTempoCalculo.AsFloat;
    cdsProdutoTEMPOREAL.AsFloat      := tProdutoTempoReal.AsFloat;
    cdsProdutoCODCONSTRUCAO.AsInteger := tProdutoCodConstrucao.AsInteger;
    cdsProdutoCODCONSTRUCAOGRUPO.AsInteger := tProdutoCodConstrucaoGrupo.AsInteger;
    cdsProdutoDTCADASTRO.AsDateTime        := tProdutoDtCadastro.AsDateTime;
    if tProdutoCadastroCompleto.AsBoolean then
      cdsProdutoCADASTROCOMPLETO.AsString := 'S'
    else
      cdsProdutoCADASTROCOMPLETO.AsString := 'N';
    cdsProdutoCOMPLEMENTO.AsString := tProdutoComplemento.AsString;
    cdsProdutoPRODMAT.AsString     := tProdutoProdMat.AsString;
    cdsProdutoORIGEMPROD.AsString  := tProdutoOrigemProd.AsString;
    cdsProdutoCODCSTIPI.AsString   := tProdutoCodCSTIPI.AsString;
    if tProdutoLancaCor.AsBoolean then
      cdsProdutoLANCACOR.AsString := 'S'
    else
      cdsProdutoLANCACOR.AsString := 'N';
    cdsProdutoENDFOTO.AsString := tProdutoEndFoto.AsString;
    cdsProduto.Post;
    cdsProduto.ApplyUpdates(0);
    tProduto.Next;
  end;
  ShowMessage('Geração dos Produtos concluída');
end;

procedure TfGeraFB.BitBtn6Click(Sender: TObject);
begin
  cdsMaterial.Close;
  cdsMaterial.Open;
  tMaterial.Open;
  tMaterial.First;
  while not tMaterial.Eof do
  begin
    cdsMaterial.Insert;
    cdsMaterialCODIGO.AsInteger     := tMaterialCodigo.AsInteger;
    cdsMaterialNOME.AsString        := tMaterialNome.AsString;
    cdsMaterialGRUPO.AsInteger      := tMaterialGrupo.AsInteger;
    cdsMaterialSUBGRUPO.AsInteger   := tMaterialSubGrupo.AsInteger;
    cdsMaterialUNIDADE.AsString     := tMaterialUnidade.AsString;
    cdsMaterialICMS.AsFloat         := tMaterialICMS.AsFloat;
    cdsMaterialIPI.AsFloat          := tMaterialIPI.AsFloat;
    cdsMaterialPRCUSTO.AsFloat      := tMaterialPrCusto.AsFloat;
    cdsMaterialFORNECEDOR.AsInteger := tMaterialFornecedor.AsInteger;
    cdsMaterialCODGRADE.AsInteger   := tMaterialCodGrade.AsInteger;
    cdsMaterialESTMINIMO.AsFloat    := tMaterialEstMinimo.AsFloat;
    if tMaterialInativo.AsBoolean then
      cdsMaterialINATIVO.AsString := 'S'
    else
      cdsMaterialINATIVO.AsString := 'N';
    if tMaterialLancaCor.AsBoolean then
      cdsMaterialLANCACOR.AsString := 'S'
    else
      cdsMaterialLANCACOR.AsString := 'N';
    if tMaterialPrecoCor.AsBoolean then
      cdsMaterialPRECOCOR.AsString := 'S'
    else
      cdsMaterialPRECOCOR.AsString := 'N';
    if tMaterialLancaGrade.AsBoolean then
      cdsMaterialLANCAGRADE.AsString := 'S'
    else
      cdsMaterialLANCAGRADE.AsString := 'N';
    if tMaterialPrecoGrade.AsBoolean then
      cdsMaterialPRECOGRADE.AsString := 'S'
    else
      cdsMaterialPRECOGRADE.AsString := 'N';
    cdsMaterialTIPOMAT.AsString        := tMaterialTipoMat.AsString;
    cdsMaterialTIPOSOLADO.AsString     := tMaterialTipoSolado.AsString;
    cdsMaterialMATERIALOUTROS.AsString := tMaterialMaterialOutros.AsString;
    cdsMaterialDTALTERACAO.AsDateTime  := tMaterialDtAlteracao.AsDateTime;
    if tMaterialCalcMaterial.AsBoolean then
      cdsMaterialCALCMATERIAL.AsString := 'S'
    else
      cdsMaterialCALCMATERIAL.AsString := 'N';
    if tMaterialPre.AsBoolean then
      cdsMaterialPRE.AsString := 'S'
    else
      cdsMaterialPRE.AsString := 'N';
    cdsMaterialCODCLASFISCAL.AsString := tMaterialCodClasFiscal.AsString;
    if tMaterialImpGradeTalaoAuxiliar.AsBoolean then
      cdsMaterialIMPGRADETALAOAUXILIAR.AsString := 'S'
    else
      cdsMaterialIMPGRADETALAOAUXILIAR.AsString := 'N';
    if tMaterialImpTalaoAuxiliar.AsBoolean then
      cdsMaterialIMPTALAOAUXILIAR.AsString := 'S'
    else
      cdsMaterialIMPTALAOAUXILIAR.AsString := 'N';
    if tMaterialImpCalcMaterial.AsBoolean then
      cdsMaterialIMPCALCMATERIAL.AsString := 'S'
    else
      cdsMaterialIMPCALCMATERIAL.AsString := 'N';
    cdsMaterialTIPOREG.AsString     := tMaterialTipoReg.AsString;
    cdsMaterialCOMPLEMENTO.AsString := tMaterialComplemento.AsString;
    cdsMaterialCODSITTRIB.AsInteger := tMaterialCodSitTrib.AsInteger;
    if tMaterialGeraOC.AsBoolean then
      cdsMaterialGERAOC.AsString := 'S'
    else
      cdsMaterialGERAOC.AsString := 'N';
    cdsMaterialORIGEMPROD.AsString := tMaterialOrigemProd.AsString;
    cdsMaterialUSUARIO.AsString    := tMaterialUsuario.AsString;
    if tMaterialCorreto.AsBoolean then
      cdsMaterialCORRETO.AsString := 'S'
    else
      cdsMaterialCORRETO.AsString := 'N';
    cdsMaterialNOMESEMACENTO.AsString := tMaterialNomeSemAcento.AsString;
    cdsMaterial.Post;
    cdsMaterial.ApplyUpdates(0);
    tMaterial.Next;
  end;
  ShowMessage('Geração dos Materiais concluída');
end;

procedure TfGeraFB.BitBtn7Click(Sender: TObject);
begin
  cdsArmazenamento_Ref.Close;
  cdsArmazenamento_Ref.Open;
  tArmazReferencia.Open;
  tArmazReferencia.First;
  while not tArmazReferencia.Eof do
  begin
    cdsArmazenamento_Ref.Insert;
    cdsArmazenamento_RefID.AsInteger := tArmazReferenciaId.AsInteger;
    cdsArmazenamento_RefCAIXA.AsString := tArmazReferenciaCaixa.AsString;
    cdsArmazenamento_RefREFERENCIA.AsString := tArmazReferenciaReferencia.AsString;
    cdsArmazenamento_RefCIA.AsString        := tArmazReferenciaCia.AsString;
    cdsArmazenamento_RefDATA.AsDateTime     := tArmazReferenciaData.AsDateTime;
    cdsArmazenamento_Ref.Post;
    cdsArmazenamento_Ref.ApplyUpdates(0);

    tArmazReferencia.Next;
  end;
  ShowMessage('Geração da tabela ARMAZENAMENTO_REF concluída');
end;

procedure TfGeraFB.BitBtn8Click(Sender: TObject);
begin
  cdsNavalha_Local.Close;
  cdsNavalha_Local.Open;
  tNavalha_Local.Open;
  tNavalha_Local.First;
  while not tNavalha_Local.Eof do
  begin
    cdsNavalha_Local.Insert;
    cdsNavalha_LocalID.AsInteger := tNavalha_LocalId.AsInteger;
    cdsNavalha_LocalDTENTRADA.AsDateTime  := tNavalha_LocalDtEntrada.AsDateTime;
    cdsNavalha_LocalLOCALIZACAO.AsString  := tNavalha_LocalLocalizacao.AsString;
    cdsNavalha_LocalNAVALHA.AsString      := tNavalha_LocalNavalha.AsString;
    cdsNavalha_LocalREORDER.AsString      := tNavalha_LocalReorder.AsString;
    cdsNavalha_LocalDTDESCARTE.AsDateTime := tNavalha_LocalDtDescarte.AsDateTime;
    cdsNavalha_LocalDTESTOQUE.AsDateTime  := tNavalha_LocalDtEstoque.AsDateTime;
    cdsNavalha_Local.Post;
    cdsNavalha_Local.ApplyUpdates(0);
    tNavalha_Local.Next;
  end;
  ShowMessage('Geração da tabela NAVALHA_LOCAL concluída');
end;

procedure TfGeraFB.BitBtn9Click(Sender: TObject);
begin
  cdsCliente.Close;
  cdsCliente.Open;
  tCliente.Open;
  tCliente.First;
  while not tCliente.Eof do
  begin
    cdsCliente.Insert;
    cdsClienteCODIGO.AsInteger     := tClienteCodigo.AsInteger;
    cdsClienteNOME.AsString        := tClienteNome.AsString;
    cdsClienteENDERECO.AsString    := tClienteEndereco.AsString;
    cdsClienteBAIRRO.AsString      := tClienteBairro.AsString;
    cdsClienteCIDADE.AsString      := tClienteCidade.AsString;
    cdsClienteUF.AsString          := tClienteUf.AsString;
    cdsClienteCEP.AsString         := tClienteCep.AsString;
    cdsClienteTELEFONE.AsString    := tClienteTelefone.AsString;
    cdsClienteTELEFONE2.AsString   := tClienteTelefone2.AsString;
    cdsClienteFAX.AsString         := tClienteFax.AsString;
    cdsClientePESSOA.AsString      := tClientePessoa.AsString;
    cdsClienteCGCCPF.AsString      := tClienteCgcCpf.AsString;
    cdsClienteINSCREST.AsString    := tClienteInscrEst.AsString;
    cdsClienteCONTATO.AsString     := tClienteContato.AsString;
    cdsClienteOBS.Value            := tClienteObs.Value;
    cdsClienteAPROVCREDITO.AsString := tClienteAprovCredito.AsString;
    cdsClienteTIPOAPROV.AsString    := tClienteTipoAprov.AsString;
    cdsClienteENDENTREGA.AsString := tClienteEndEntrega.AsString;
    cdsClienteBAIRROENTREGA.AsString := tClienteBairroEntrega.AsString;
    cdsClienteCIDENTREGA.AsString := tClienteCidEntrega.AsString;
    cdsClienteCEPENTREGA.AsString := tClienteCepEntrega.AsString;
    cdsClienteUFENTREGA.AsString := tClienteUfEntrega.AsString;
    cdsClienteCGCCPFENTREGA.AsString := tClienteCgcCpfEntrega.AsString;
    cdsClienteINSCENTREGA.AsString := tClienteInscEntrega.AsString;
    cdsClienteENDPGTO.AsString := tClienteEndPgto.AsString;
    cdsClienteBAIRROPGTO.AsString := tClienteBairroPgto.AsString;
    cdsClienteCIDPGTO.AsString := tClienteCidPgto.AsString;
    cdsClienteCEPPGTO.AsString := tClienteCepPgto.AsString;
    cdsClienteUFPGTO.AsString := tClienteUfPgto.AsString;
    cdsClienteFANTASIA.AsString := tClienteFantasia.AsString;
    cdsClienteDTCADASTRO.AsDateTime := tClienteDtCadastro.AsDateTime;
    cdsClienteCODVENDEDOR.AsInteger := tClienteCodVendedor.AsInteger;
    cdsClienteOBSCTAS.Value         := tClienteObsCtas.Value;
    cdsClienteLOJAS.AsInteger       := tClienteLojas.AsInteger;
    if tClienteSelecionado.AsBoolean then
      cdsClienteSELECIONADO.AsString  := 'S'
    else
      cdsClienteSELECIONADO.AsString  := 'N';
    cdsClienteCAIXAPOSTAL.AsString := tClienteCaixaPostal.AsString;
    cdsClienteRG.AsString := tClienteRg.AsString;
    cdsClienteCODCIDADE.AsInteger := tClienteCodCidade.AsInteger;
    cdsClienteCODCIDADEE.AsInteger := tClienteCodCidadeE.AsInteger;
    cdsClienteEMAIL.AsString := tClienteEmail.AsString;
    cdsClienteMERCADO.AsString := tClienteMercado.AsString;
    cdsClienteNUMEND.AsString := tClienteNumEnd.AsString;
    cdsClienteNUMENDENTREGA.AsString := tClienteNumEndEntrega.AsString;
    cdsClienteEMAILNFE.AsString := tClienteEmailNfe.AsString;
    cdsClienteCOMPLENDERECO.AsString := tClienteComplEndereco.AsString;
    cdsClienteDTVALIDADEIPI.AsDateTime  := tClienteDtValidadeIPI.AsDateTime;
    cdsClienteCODOBSIPI.AsInteger := tClienteCodObsIPI.AsInteger;
    cdsClienteHOMEPAGE.AsString := tClienteHomePage.AsString;
    cdsClienteCOMPLENDERECOENTREGA.AsString := tClienteComplEnderecoEntrega.AsString;
    cdsClienteCODSITTRIBSIMPLES.AsInteger := tClienteCodSitTribSimples.AsInteger;
    if tClienteUsaIcmsSimples.AsBoolean then
      cdsClienteUSAICMSSIMPLES.AsString := 'S'
    else
      cdsClienteUSAICMSSIMPLES.AsString := 'N';
    cdsClienteDDDFONE1.AsInteger     := tClienteDDDFone1.AsInteger;
    cdsClienteDDDFONE2.AsInteger     := tClienteDDDFone2.AsInteger;
    cdsClienteDDDFAX.AsInteger       := tClienteDDDFax.AsInteger;
    cdsClienteIDPAIS.AsInteger       := tClienteIDPais.AsInteger;
    cdsClienteEMAILNFE2.AsString     := tClienteEmailNFe2.AsString;
    cdsClienteNOMESEMACENTO.AsString := tClienteNomeSemAcento.AsString;
    cdsCliente.Post;
    cdsCliente.ApplyUpdates(0);
    tCliente.Next;
  end;
  ShowMessage('Geração da tabela CLIENTE concluída');
end;

procedure TfGeraFB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfGeraFB.BitBtn10Click(Sender: TObject);
begin
  qCriaCampos.SQL.Text := 'ALTER TABLE DBPRODUTO ADD NOME3 VARCHAR(100)';
  qCriaCampos.ExecSQL;
  ShowMessage('1');
  qCriaCampos.SQL.Text := 'UPDATE DBPRODUTO SET NOME3 = NOME';
  qCriaCampos.ExecSQL;
  ShowMessage('2');
  qCriaCampos.SQL.Text := 'ALTER TABLE DBPRODUTO DROP NOME';
  qCriaCampos.ExecSQL;
  ShowMessage('3');
  qCriaCampos.SQL.Text := 'ALTER TABLE DBPRODUTO ADD NOME VARCHAR(100)';
  qCriaCampos.ExecSQL;
  ShowMessage('4');
  qCriaCampos.SQL.Text := 'UPDATE DBPRODUTO SET NOME = NOME3';
  qCriaCampos.ExecSQL;
  ShowMessage('5');
  qCriaCampos.SQL.Text := 'ALTER TABLE DBPRODUTO DROP NOME3';
  qCriaCampos.ExecSQL;
  ShowMessage('6');
end;

end.

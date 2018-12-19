unit URelTalao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, StdCtrls, Barcode, Db, DBTables, JPEG,
  Grids, DBGrids, DBClient;

type
  TfRelTalao = class(TForm)
    QuickRep1: TQuickRep;
    Barcode1: TBarcode;
    QuickRep2: TQuickRep;
    DetailBand2: TQRBand;
    QRLabel62: TQRLabel;
    QRDBText49: TQRDBText;
    QRLabel63: TQRLabel;
    QRDBText50: TQRDBText;
    QRLabel64: TQRLabel;
    QRDBText51: TQRDBText;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRDBText53: TQRDBText;
    QRLabel67: TQRLabel;
    QRDBText54: TQRDBText;
    QRLabel68: TQRLabel;
    QRDBText55: TQRDBText;
    QRLabel69: TQRLabel;
    QRDBText56: TQRDBText;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRDBText57: TQRDBText;
    QRLabel72: TQRLabel;
    QRShape10: TQRShape;
    QRLabel73: TQRLabel;
    QRDBRichText1: TQRDBRichText;
    QRChildBand1: TQRChildBand;
    QRLabel74: TQRLabel;
    QRDBText58: TQRDBText;
    qTalaoGrade: TQuery;
    qTalaoGradetamanho: TStringField;
    qTalaoGradeQtdPar: TFloatField;
    QRDBText59: TQRDBText;
    QRDBText60: TQRDBText;
    QRImage8: TQRImage;
    QRLabel75: TQRLabel;
    QRDBText61: TQRDBText;
    QRLabel76: TQRLabel;
    QRImage9: TQRImage;
    QRLabel77: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel53: TQRLabel;
    QRLabel78: TQRLabel;
    qTalaoGradePosicao: TIntegerField;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRDBText72: TQRDBText;
    QRLabel91: TQRLabel;
    QRDBText81: TQRDBText;
    QuickRep3: TQuickRep;
    QRSubDetail2: TQRSubDetail;
    QRDBText82: TQRDBText;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRDBText83: TQRDBText;
    QRDBText84: TQRDBText;
    QRDBText85: TQRDBText;
    QRDBText86: TQRDBText;
    QRDBText87: TQRDBText;
    QRDBText88: TQRDBText;
    QRDBText89: TQRDBText;
    QRDBText90: TQRDBText;
    QRShape142: TQRShape;
    QRShape143: TQRShape;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRDBText91: TQRDBText;
    QRDBText92: TQRDBText;
    QRLabel152: TQRLabel;
    QRDBText134: TQRDBText;
    QRLabel153: TQRLabel;
    QRDBText136: TQRDBText;
    QRLabel161: TQRLabel;
    QRDBText144: TQRDBText;
    QRShape137: TQRShape;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRSubDetail3: TQRSubDetail;
    QRSubDetail1: TQRSubDetail;
    QRDBText5: TQRDBText;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel48: TQRLabel;
    QRShape8: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRLabel54: TQRLabel;
    QRShape9: TQRShape;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRLabel61: TQRLabel;
    QRImage2: TQRImage;
    QRImage3: TQRImage;
    QRImage4: TQRImage;
    QRImage5: TQRImage;
    QRImage6: TQRImage;
    QRImage7: TQRImage;
    QRImage1: TQRImage;
    QRLabel79: TQRLabel;
    QRDBText63: TQRDBText;
    QRDBText64: TQRDBText;
    QRDBText65: TQRDBText;
    QRDBText66: TQRDBText;
    QRDBText67: TQRDBText;
    QRDBText68: TQRDBText;
    QRDBText69: TQRDBText;
    QRDBText70: TQRDBText;
    QRLabel82: TQRLabel;
    QRDBText71: TQRDBText;
    QRLabel83: TQRLabel;
    QRDBText73: TQRDBText;
    QRLabel84: TQRLabel;
    QRDBText74: TQRDBText;
    QRLabel85: TQRLabel;
    QRDBText75: TQRDBText;
    QRLabel86: TQRLabel;
    QRDBText76: TQRDBText;
    QRLabel87: TQRLabel;
    QRDBText77: TQRDBText;
    QRLabel88: TQRLabel;
    QRDBText78: TQRDBText;
    QRLabel89: TQRLabel;
    QRDBText79: TQRDBText;
    QRLabel90: TQRLabel;
    QRDBText80: TQRDBText;
    cdsMemoTalao: TClientDataSet;
    cdsMemoTalaoLote: TIntegerField;
    cdsMemoTalaoReferencia: TStringField;
    cdsMemoTalaoQtdPar: TIntegerField;
    cdsMemoTalaoNomeCor: TStringField;
    cdsMemoTalaoNomeSolado: TStringField;
    cdsMemoTalaoNomeCorSolado: TStringField;
    cdsMemoTalaoNomePalmilha: TStringField;
    cdsMemoTalaoNomeCorPalmilha: TStringField;
    cdsMemoTalaoEmbarqueIni: TDateField;
    cdsMemoTalaoEmbarqueFim: TDateField;
    cdsMemoTalaoNomeCliente: TStringField;
    cdsMemoTalaoObsLote: TStringField;
    cdsMemoTalaoPedidoCliente: TStringField;
    cdsMemoTalaoDescMaterial: TStringField;
    cdsMemoTalaoPOCliente: TStringField;
    cdsMemoTalaoInvoice: TStringField;
    cdsMemoTalaoStock: TStringField;
    cdsMemoTalaoCarimbo: TStringField;
    cdsMemoTalaoTipoMaterial: TStringField;
    QuickRep4: TQuickRep;
    QRBand1: TQRBand;
    QRShape138: TQRShape;
    QRDBText52: TQRDBText;
    QRLabel105: TQRLabel;
    QRDBText62: TQRDBText;
    QRLabel106: TQRLabel;
    QRDBText93: TQRDBText;
    QRLabel107: TQRLabel;
    QRDBText94: TQRDBText;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    QRDBText95: TQRDBText;
    QRLabel110: TQRLabel;
    QRDBText96: TQRDBText;
    QRLabel111: TQRLabel;
    QRDBText97: TQRDBText;
    QRLabel112: TQRLabel;
    QRDBText98: TQRDBText;
    QRLabel113: TQRLabel;
    QRLabel114: TQRLabel;
    QRDBText99: TQRDBText;
    QRLabel115: TQRLabel;
    QRLabel116: TQRLabel;
    QRDBRichText2: TQRDBRichText;
    QRLabel117: TQRLabel;
    QRDBText100: TQRDBText;
    QRDBText101: TQRDBText;
    QRDBText102: TQRDBText;
    QRImage10: TQRImage;
    QRLabel118: TQRLabel;
    QRDBText103: TQRDBText;
    QRLabel119: TQRLabel;
    QRImage11: TQRImage;
    QRLabel120: TQRLabel;
    QRDBText104: TQRDBText;
    QRLabel121: TQRLabel;
    QRLabel122: TQRLabel;
    QRLabel123: TQRLabel;
    QRLabel124: TQRLabel;
    QRDBText105: TQRDBText;
    QRLabel125: TQRLabel;
    QRDBText106: TQRDBText;
    QRLabel126: TQRLabel;
    QRLabel127: TQRLabel;
    QRChildBand2: TQRChildBand;
    QRGroup1: TQRGroup;
    QuickRep5: TQuickRep;
    QRBand2: TQRBand;
    QRShape267: TQRShape;
    QRDBText107: TQRDBText;
    QRLabel131: TQRLabel;
    QRDBText109: TQRDBText;
    QRLabel132: TQRLabel;
    QRDBText110: TQRDBText;
    QRLabel133: TQRLabel;
    QRLabel134: TQRLabel;
    QRDBText111: TQRDBText;
    QRLabel135: TQRLabel;
    QRDBText112: TQRDBText;
    QRLabel136: TQRLabel;
    QRDBText113: TQRDBText;
    QRLabel137: TQRLabel;
    QRDBText114: TQRDBText;
    QRLabel138: TQRLabel;
    QRLabel139: TQRLabel;
    QRDBText115: TQRDBText;
    QRLabel140: TQRLabel;
    QRLabel141: TQRLabel;
    QRDBRichText3: TQRDBRichText;
    QRLabel142: TQRLabel;
    QRDBText116: TQRDBText;
    QRDBText117: TQRDBText;
    QRDBText118: TQRDBText;
    QRImage14: TQRImage;
    QRLabel143: TQRLabel;
    QRDBText119: TQRDBText;
    QRLabel144: TQRLabel;
    QRImage15: TQRImage;
    QRLabel145: TQRLabel;
    QRDBText120: TQRDBText;
    QRLabel146: TQRLabel;
    QRLabel147: TQRLabel;
    QRLabel148: TQRLabel;
    QRLabel149: TQRLabel;
    QRDBText121: TQRDBText;
    QRLabel150: TQRLabel;
    QRDBText122: TQRDBText;
    QRLabel151: TQRLabel;
    QRLabel154: TQRLabel;
    QRChildBand3: TQRChildBand;
    QRShape268: TQRShape;
    QRLabel155: TQRLabel;
    QRShape269: TQRShape;
    QRLabel156: TQRLabel;
    QRShape270: TQRShape;
    QRLabel157: TQRLabel;
    QRShape271: TQRShape;
    QRLabel158: TQRLabel;
    QRShape272: TQRShape;
    QRLabel159: TQRLabel;
    QRShape273: TQRShape;
    QRLabel160: TQRLabel;
    QRShape274: TQRShape;
    QRLabel162: TQRLabel;
    QRShape275: TQRShape;
    QRLabel163: TQRLabel;
    QRShape276: TQRShape;
    QRLabel164: TQRLabel;
    QRShape277: TQRShape;
    QRLabel165: TQRLabel;
    QRShape278: TQRShape;
    QRLabel166: TQRLabel;
    QRShape279: TQRShape;
    QRLabel167: TQRLabel;
    QRShape280: TQRShape;
    QRLabel168: TQRLabel;
    QRShape281: TQRShape;
    QRLabel169: TQRLabel;
    QRShape282: TQRShape;
    QRLabel170: TQRLabel;
    QRShape283: TQRShape;
    QRLabel171: TQRLabel;
    QRShape284: TQRShape;
    QRLabel172: TQRLabel;
    QRShape285: TQRShape;
    QRLabel173: TQRLabel;
    QRShape286: TQRShape;
    QRLabel174: TQRLabel;
    QRShape287: TQRShape;
    QRLabel175: TQRLabel;
    QRShape288: TQRShape;
    QRLabel176: TQRLabel;
    QRShape289: TQRShape;
    QRLabel177: TQRLabel;
    QRShape290: TQRShape;
    QRLabel178: TQRLabel;
    QRShape291: TQRShape;
    QRLabel179: TQRLabel;
    QRShape292: TQRShape;
    QRLabel180: TQRLabel;
    QRShape293: TQRShape;
    QRLabel181: TQRLabel;
    QRShape294: TQRShape;
    QRLabel182: TQRLabel;
    QRShape295: TQRShape;
    QRLabel183: TQRLabel;
    QRShape296: TQRShape;
    QRShape297: TQRShape;
    QRShape298: TQRShape;
    QRShape299: TQRShape;
    QRShape300: TQRShape;
    QRShape301: TQRShape;
    QRShape302: TQRShape;
    QRShape303: TQRShape;
    QRShape304: TQRShape;
    QRShape305: TQRShape;
    QRShape306: TQRShape;
    QRShape307: TQRShape;
    QRShape308: TQRShape;
    QRShape309: TQRShape;
    QRShape310: TQRShape;
    QRShape311: TQRShape;
    QRShape312: TQRShape;
    QRShape313: TQRShape;
    QRShape314: TQRShape;
    QRShape315: TQRShape;
    QRShape316: TQRShape;
    QRShape317: TQRShape;
    QRShape318: TQRShape;
    QRShape319: TQRShape;
    QRShape320: TQRShape;
    QRShape321: TQRShape;
    QRShape322: TQRShape;
    QRShape323: TQRShape;
    QRShape324: TQRShape;
    QRShape325: TQRShape;
    QRShape326: TQRShape;
    QRShape327: TQRShape;
    QRShape328: TQRShape;
    QRShape329: TQRShape;
    QRShape330: TQRShape;
    QRShape331: TQRShape;
    QRShape332: TQRShape;
    QRShape333: TQRShape;
    QRShape334: TQRShape;
    QRShape335: TQRShape;
    QRShape336: TQRShape;
    QRShape337: TQRShape;
    QRShape338: TQRShape;
    QRShape339: TQRShape;
    QRShape340: TQRShape;
    QRShape341: TQRShape;
    QRShape342: TQRShape;
    QRShape343: TQRShape;
    QRShape344: TQRShape;
    QRShape345: TQRShape;
    QRShape346: TQRShape;
    QRShape347: TQRShape;
    QRShape348: TQRShape;
    QRShape349: TQRShape;
    QRShape350: TQRShape;
    QRShape351: TQRShape;
    QRShape352: TQRShape;
    QRShape353: TQRShape;
    QRShape354: TQRShape;
    QRShape355: TQRShape;
    QRShape356: TQRShape;
    QRShape357: TQRShape;
    QRShape358: TQRShape;
    QRShape359: TQRShape;
    QRShape360: TQRShape;
    QRShape361: TQRShape;
    QRShape362: TQRShape;
    QRShape363: TQRShape;
    QRShape364: TQRShape;
    QRShape365: TQRShape;
    QRShape366: TQRShape;
    QRShape367: TQRShape;
    QRShape368: TQRShape;
    QRShape369: TQRShape;
    QRShape370: TQRShape;
    QRShape371: TQRShape;
    QRShape372: TQRShape;
    QRShape373: TQRShape;
    QRShape374: TQRShape;
    QRShape375: TQRShape;
    QRShape376: TQRShape;
    QRShape377: TQRShape;
    QRShape378: TQRShape;
    QRShape379: TQRShape;
    QRShape380: TQRShape;
    QRShape381: TQRShape;
    QRShape382: TQRShape;
    QRShape383: TQRShape;
    QRShape384: TQRShape;
    QRShape385: TQRShape;
    QRShape386: TQRShape;
    QRShape387: TQRShape;
    QRShape388: TQRShape;
    QRShape389: TQRShape;
    QRShape390: TQRShape;
    QRShape391: TQRShape;
    QRShape392: TQRShape;
    QRShape393: TQRShape;
    cdsReferencia: TClientDataSet;
    cdsReferenciaDescMaterial: TStringField;
    cdsReferenciaNomeCor: TStringField;
    cdsReferenciaReferencia: TStringField;
    cdsReferenciaQtdPar: TIntegerField;
    cdsReferenciaNomeSolado: TStringField;
    cdsReferenciaNomeCorSolado: TStringField;
    cdsReferenciaNomePalmilha: TStringField;
    cdsReferenciaNomeCorPalmilha: TStringField;
    cdsReferenciaEmbarqueIni: TDateField;
    cdsReferenciaEmbarqueFim: TDateField;
    cdsReferenciaNomeCliente: TStringField;
    cdsReferenciaObsLote: TStringField;
    cdsReferenciaPedidoCliente: TStringField;
    cdsReferenciaPOCliente: TStringField;
    cdsReferenciaInvoice: TStringField;
    cdsReferenciaStock: TStringField;
    cdsReferenciaCarimbo: TStringField;
    cdsReferenciaCodGrade: TIntegerField;
    QRShape394: TQRShape;
    QRLabel128: TQRLabel;
    QRDBText108: TQRDBText;
    QRShape395: TQRShape;
    QRLabel129: TQRLabel;
    QRDBText123: TQRDBText;
    qTalaoGradeMarcarTam: TStringField;
    QRShape139: TQRShape;
    QRShape140: TQRShape;
    QRShape141: TQRShape;
    QRShape144: TQRShape;
    QRShape145: TQRShape;
    QRShape146: TQRShape;
    QRShape147: TQRShape;
    QRShape148: TQRShape;
    QRShape149: TQRShape;
    QRShape150: TQRShape;
    QRShape151: TQRShape;
    QRShape152: TQRShape;
    QRShape153: TQRShape;
    QRShape154: TQRShape;
    QRShape155: TQRShape;
    QRShape156: TQRShape;
    QRShape157: TQRShape;
    QRShape158: TQRShape;
    QRShape159: TQRShape;
    QRShape160: TQRShape;
    QRShape161: TQRShape;
    QRShape162: TQRShape;
    QRShape163: TQRShape;
    QRShape164: TQRShape;
    QRShape165: TQRShape;
    QRShape166: TQRShape;
    QRShape167: TQRShape;
    QRShape168: TQRShape;
    QRShape169: TQRShape;
    QRShape170: TQRShape;
    QRShape171: TQRShape;
    QRShape172: TQRShape;
    QRShape173: TQRShape;
    QRShape174: TQRShape;
    QRShape175: TQRShape;
    QRShape176: TQRShape;
    QRShape177: TQRShape;
    QRShape178: TQRShape;
    QRShape179: TQRShape;
    QRShape180: TQRShape;
    QRShape181: TQRShape;
    QRShape182: TQRShape;
    QRShape183: TQRShape;
    QRShape184: TQRShape;
    QRShape185: TQRShape;
    QRShape186: TQRShape;
    QRShape187: TQRShape;
    QRShape188: TQRShape;
    QRShape189: TQRShape;
    QRShape190: TQRShape;
    QRShape191: TQRShape;
    QRShape192: TQRShape;
    QRShape193: TQRShape;
    QRShape194: TQRShape;
    QRShape195: TQRShape;
    QRShape196: TQRShape;
    QRShape197: TQRShape;
    QRShape198: TQRShape;
    QRShape199: TQRShape;
    QRShape200: TQRShape;
    QRShape201: TQRShape;
    QRShape202: TQRShape;
    QRShape203: TQRShape;
    QRShape204: TQRShape;
    QRShape205: TQRShape;
    QRShape206: TQRShape;
    QRShape207: TQRShape;
    QRShape208: TQRShape;
    QRShape209: TQRShape;
    QRShape210: TQRShape;
    QRShape211: TQRShape;
    QRShape212: TQRShape;
    QRShape213: TQRShape;
    QRShape214: TQRShape;
    QRShape215: TQRShape;
    QRShape216: TQRShape;
    QRShape217: TQRShape;
    QRShape218: TQRShape;
    QRShape219: TQRShape;
    QRShape220: TQRShape;
    QRShape221: TQRShape;
    QRShape222: TQRShape;
    QRShape223: TQRShape;
    QRShape224: TQRShape;
    QRShape225: TQRShape;
    QRShape226: TQRShape;
    QRShape227: TQRShape;
    QRShape228: TQRShape;
    QRShape229: TQRShape;
    QRShape230: TQRShape;
    QRShape231: TQRShape;
    QRShape232: TQRShape;
    QRShape233: TQRShape;
    QRShape234: TQRShape;
    QRShape235: TQRShape;
    QRShape236: TQRShape;
    QRShape237: TQRShape;
    QRShape238: TQRShape;
    Pr1: TQRLabel;
    Pr2: TQRLabel;
    Pr3: TQRLabel;
    Pr4: TQRLabel;
    Pr5: TQRLabel;
    Pr6: TQRLabel;
    Pr7: TQRLabel;
    Pr8: TQRLabel;
    Pr9: TQRLabel;
    Pr10: TQRLabel;
    Pr11: TQRLabel;
    Pr12: TQRLabel;
    Pr13: TQRLabel;
    Pr14: TQRLabel;
    QRShape239: TQRShape;
    QRShape240: TQRShape;
    QRShape241: TQRShape;
    QRShape242: TQRShape;
    Tama1: TQRLabel;
    QRShape243: TQRShape;
    Tama2: TQRLabel;
    QRShape244: TQRShape;
    Tama3: TQRLabel;
    QRShape245: TQRShape;
    Tama4: TQRLabel;
    QRShape246: TQRShape;
    Tama5: TQRLabel;
    QRShape247: TQRShape;
    Tama6: TQRLabel;
    QRShape248: TQRShape;
    Tama7: TQRLabel;
    QRShape249: TQRShape;
    Tama8: TQRLabel;
    QRShape250: TQRShape;
    Tama9: TQRLabel;
    QRShape251: TQRShape;
    Tama10: TQRLabel;
    QRShape252: TQRShape;
    Tama11: TQRLabel;
    Tama12: TQRLabel;
    QRShape253: TQRShape;
    Tama13: TQRLabel;
    QRShape254: TQRShape;
    Tama14: TQRLabel;
    QRShape255: TQRShape;
    QRShape256: TQRShape;
    QRShape257: TQRShape;
    QRShape258: TQRShape;
    QRShape259: TQRShape;
    QRShape260: TQRShape;
    QRShape261: TQRShape;
    QRShape262: TQRShape;
    QRShape263: TQRShape;
    QRShape264: TQRShape;
    QRShape265: TQRShape;
    QRShape266: TQRShape;
    QRLabel214: TQRLabel;
    QRLabel215: TQRLabel;
    QRLabel216: TQRLabel;
    Mara1: TQRLabel;
    Mara2: TQRLabel;
    Mara3: TQRLabel;
    Mara4: TQRLabel;
    Mara5: TQRLabel;
    Mara6: TQRLabel;
    Mara7: TQRLabel;
    Mara8: TQRLabel;
    Mara9: TQRLabel;
    Mara10: TQRLabel;
    Mara11: TQRLabel;
    Mara12: TQRLabel;
    Mara13: TQRLabel;
    Mara14: TQRLabel;
    QRLabel186: TQRLabel;
    QRImage12: TQRImage;
    QRLabel187: TQRLabel;
    QRLabel188: TQRLabel;
    QRLabel189: TQRLabel;
    QRShape396: TQRShape;
    QRShape136: TQRShape;
    QRShape135: TQRShape;
    QRShape134: TQRShape;
    QRShape133: TQRShape;
    QRShape132: TQRShape;
    QRShape131: TQRShape;
    QRShape130: TQRShape;
    QRShape129: TQRShape;
    QRShape128: TQRShape;
    QRShape127: TQRShape;
    QRShape126: TQRShape;
    QRShape125: TQRShape;
    QRShape124: TQRShape;
    QRShape123: TQRShape;
    QRShape109: TQRShape;
    QRShape110: TQRShape;
    QRShape111: TQRShape;
    QRShape112: TQRShape;
    QRShape113: TQRShape;
    QRShape114: TQRShape;
    QRShape115: TQRShape;
    QRShape116: TQRShape;
    QRShape117: TQRShape;
    QRShape118: TQRShape;
    QRShape119: TQRShape;
    QRShape120: TQRShape;
    QRShape121: TQRShape;
    QRShape122: TQRShape;
    QRShape108: TQRShape;
    QRShape107: TQRShape;
    QRShape106: TQRShape;
    QRShape105: TQRShape;
    QRShape104: TQRShape;
    QRShape103: TQRShape;
    QRShape102: TQRShape;
    QRShape101: TQRShape;
    QRShape100: TQRShape;
    QRShape99: TQRShape;
    QRShape98: TQRShape;
    QRShape97: TQRShape;
    QRShape96: TQRShape;
    QRShape95: TQRShape;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRShape86: TQRShape;
    QRShape87: TQRShape;
    QRShape88: TQRShape;
    QRShape89: TQRShape;
    QRShape90: TQRShape;
    QRShape91: TQRShape;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QRShape65: TQRShape;
    QRShape64: TQRShape;
    QRShape63: TQRShape;
    QRShape62: TQRShape;
    QRShape61: TQRShape;
    QRShape60: TQRShape;
    QRShape59: TQRShape;
    QRShape58: TQRShape;
    QRShape57: TQRShape;
    QRShape56: TQRShape;
    QRShape55: TQRShape;
    QRShape54: TQRShape;
    QRShape67: TQRShape;
    QRShape53: TQRShape;
    QRShape66: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    QRShape52: TQRShape;
    QRShape51: TQRShape;
    QRShape50: TQRShape;
    QRShape49: TQRShape;
    QRShape48: TQRShape;
    QRShape47: TQRShape;
    QRShape46: TQRShape;
    QRShape45: TQRShape;
    QRShape44: TQRShape;
    QRShape43: TQRShape;
    QRShape42: TQRShape;
    QRShape41: TQRShape;
    QRShape40: TQRShape;
    QRShape39: TQRShape;
    QRShape29: TQRShape;
    QRShape22: TQRShape;
    QRShape37: TQRShape;
    QRShape11: TQRShape;
    Tam1: TQRLabel;
    QRShape12: TQRShape;
    Tam2: TQRLabel;
    QRShape13: TQRShape;
    Tam3: TQRLabel;
    QRShape14: TQRShape;
    Tam4: TQRLabel;
    QRShape15: TQRShape;
    Tam5: TQRLabel;
    QRShape16: TQRShape;
    Tam6: TQRLabel;
    QRShape17: TQRShape;
    Tam7: TQRLabel;
    QRShape18: TQRShape;
    Tam8: TQRLabel;
    QRShape19: TQRShape;
    Tam9: TQRLabel;
    QRShape20: TQRShape;
    Tam10: TQRLabel;
    QRShape21: TQRShape;
    Tam11: TQRLabel;
    Tam12: TQRLabel;
    QRShape23: TQRShape;
    Tam13: TQRLabel;
    QRShape24: TQRShape;
    Tam14: TQRLabel;
    QRShape38: TQRShape;
    Par14: TQRLabel;
    Par13: TQRLabel;
    QRShape36: TQRShape;
    Par12: TQRLabel;
    QRShape35: TQRShape;
    Par11: TQRLabel;
    QRShape34: TQRShape;
    Par10: TQRLabel;
    QRShape33: TQRShape;
    Par9: TQRLabel;
    QRShape32: TQRShape;
    Par8: TQRLabel;
    QRShape31: TQRShape;
    Par7: TQRLabel;
    QRShape30: TQRShape;
    Par6: TQRLabel;
    Par5: TQRLabel;
    QRShape28: TQRShape;
    Par4: TQRLabel;
    QRShape27: TQRShape;
    Par3: TQRLabel;
    QRShape26: TQRShape;
    Par2: TQRLabel;
    QRShape25: TQRShape;
    Par1: TQRLabel;
    QRLabel130: TQRLabel;
    QRLabel184: TQRLabel;
    QRLabel185: TQRLabel;
    Mar1: TQRLabel;
    Mar2: TQRLabel;
    Mar3: TQRLabel;
    Mar4: TQRLabel;
    Mar5: TQRLabel;
    Mar6: TQRLabel;
    Mar7: TQRLabel;
    Mar8: TQRLabel;
    Mar9: TQRLabel;
    Mar10: TQRLabel;
    Mar11: TQRLabel;
    Mar12: TQRLabel;
    Mar13: TQRLabel;
    Mar14: TQRLabel;
    QRShape397: TQRShape;
    QRShape398: TQRShape;
    QRShape399: TQRShape;
    QRShape400: TQRShape;
    QRShape401: TQRShape;
    QRShape402: TQRShape;
    QRShape403: TQRShape;
    QRShape404: TQRShape;
    QRShape405: TQRShape;
    QRShape406: TQRShape;
    QRShape407: TQRShape;
    QRShape408: TQRShape;
    QRShape409: TQRShape;
    QRShape410: TQRShape;
    QRShape411: TQRShape;
    QRShape412: TQRShape;
    QRShape413: TQRShape;
    QRShape414: TQRShape;
    QRShape415: TQRShape;
    QRShape416: TQRShape;
    QRShape417: TQRShape;
    QRShape418: TQRShape;
    QRShape419: TQRShape;
    Tam15: TQRLabel;
    QRShape420: TQRShape;
    Tam16: TQRLabel;
    QRShape421: TQRShape;
    Tam17: TQRLabel;
    QRShape422: TQRShape;
    Par17: TQRLabel;
    Par16: TQRLabel;
    QRShape423: TQRShape;
    Par15: TQRLabel;
    Mar15: TQRLabel;
    Mar16: TQRLabel;
    Mar17: TQRLabel;
    QRShape424: TQRShape;
    QRShape425: TQRShape;
    QRShape426: TQRShape;
    QRShape427: TQRShape;
    QRShape428: TQRShape;
    QRShape429: TQRShape;
    QRShape430: TQRShape;
    QRShape431: TQRShape;
    Tam18: TQRLabel;
    QRShape432: TQRShape;
    Par18: TQRLabel;
    Mar18: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
     procedure Mostra_Setores;
  public
    { Public declarations }
  end;

var
  fRelTalao: TfRelTalao;
  vCodSetor: array [1..7] of integer;

implementation

uses UDM1, UConsLoteExp;

{$R *.DFM}

procedure Le_Imagem_JPEG(Campo:TBlobField;Foto:TQRImage);
var
  BS : TBlobStream;
  MinhaImagem : TJPEGImage;
begin
  if Campo.AsString <> '' then
    begin
      BS := TBlobStream.Create((Campo as TBlobField), BMRead);
      MinhaImagem := TJPEGImage.Create;
      MinhaImagem.LoadFromStream(BS);
      Foto.Picture.Assign(MinhaImagem);
      BS.Free;
      MinhaImagem.Free;
    end
  else
    Foto.Picture.LoadFromFile('C:\');
end;

procedure TfRelTalao.Mostra_Setores;

begin
  if DM1.tLoteSetorItem.AsInteger = 1 then
    begin
      QRShape9.Enabled   := True;
      QRLabel55.Enabled  := True;
      QRLabel56.Enabled  := True;
      QRLabel57.Enabled  := True;
      QRLabel58.Enabled  := True;
      QRLabel59.Enabled  := True;
      QRLabel60.Enabled  := True;
      QRLabel61.Enabled  := True;
      QRLabel83.Enabled  := True;
      QRImage7.Enabled   := True;
      QRDBText43.Enabled := True;
      QRDBText44.Enabled := True;
      QRDBText45.Enabled := True;
      QRDBText46.Enabled := True;
      QRDBText47.Enabled := True;
      QRDBText70.Enabled := True;
      QRDBText73.Enabled := True;
    end
  else
  if DM1.tLoteSetorItem.AsInteger = 2 then
    begin
      QRShape8.Enabled  := True;
      QRLabel1.Enabled  := True;
      QRLabel43.Enabled := True;
      QRLabel44.Enabled := True;
      QRLabel45.Enabled := True;
      QRLabel46.Enabled := True;
      QRLabel47.Enabled := True;
      QRLabel54.Enabled := True;
      QRLabel89.Enabled := True;
      QRImage6.Enabled  := True;
      QRDBText38.Enabled := True;
      QRDBText39.Enabled := True;
      QRDBText40.Enabled := True;
      QRDBText41.Enabled := True;
      QRDBText42.Enabled := True;
      QRDBText68.Enabled := True;
      QRDBText79.Enabled := True;
    end
  else
  if DM1.tLoteSetorItem.AsInteger = 3 then
    begin
      QRShape7.Enabled  := True;
      QRLabel17.Enabled  := True;
      QRLabel38.Enabled := True;
      QRLabel39.Enabled := True;
      QRLabel40.Enabled := True;
      QRLabel41.Enabled := True;
      QRLabel42.Enabled := True;
      QRLabel52.Enabled := True;
      QRLabel88.Enabled := True;
      QRImage5.Enabled  := True;
      QRDBText32.Enabled := True;
      QRDBText33.Enabled := True;
      QRDBText34.Enabled := True;
      QRDBText35.Enabled := True;
      QRDBText36.Enabled := True;
      QRDBText67.Enabled := True;
      QRDBText78.Enabled := True;
    end
  else
  if DM1.tLoteSetorItem.AsInteger = 4 then
    begin
      QRShape6.Enabled  := True;
      QRLabel16.Enabled  := True;
      QRLabel33.Enabled := True;
      QRLabel34.Enabled := True;
      QRLabel35.Enabled := True;
      QRLabel36.Enabled := True;
      QRLabel37.Enabled := True;
      QRLabel51.Enabled := True;
      QRLabel87.Enabled := True;
      QRImage4.Enabled  := True;
      QRDBText27.Enabled := True;
      QRDBText28.Enabled := True;
      QRDBText29.Enabled := True;
      QRDBText30.Enabled := True;
      QRDBText31.Enabled := True;
      QRDBText66.Enabled := True;
      QRDBText77.Enabled := True;
    end
  else
  if DM1.tLoteSetorItem.AsInteger = 5 then
    begin
      QRShape5.Enabled   := True;
      QRLabel15.Enabled  := True;
      QRLabel28.Enabled  := True;
      QRLabel29.Enabled  := True;
      QRLabel30.Enabled  := True;
      QRLabel31.Enabled  := True;
      QRLabel32.Enabled  := True;
      QRLabel50.Enabled  := True;
      QRLabel86.Enabled  := True;
      QRImage3.Enabled   := True;
      QRDBText22.Enabled := True;
      QRDBText23.Enabled := True;
      QRDBText24.Enabled := True;
      QRDBText25.Enabled := True;
      QRDBText26.Enabled := True;
      QRDBText65.Enabled := True;
      QRDBText76.Enabled := True;
    end
  else
  if DM1.tLoteSetorItem.AsInteger = 6 then
    begin
      QRShape4.Enabled   := True;
      QRLabel14.Enabled  := True;
      QRLabel23.Enabled  := True;
      QRLabel24.Enabled  := True;
      QRLabel25.Enabled  := True;
      QRLabel26.Enabled  := True;
      QRLabel27.Enabled  := True;
      QRLabel49.Enabled  := True;
      QRLabel85.Enabled  := True;
      QRImage2.Enabled   := True;
      QRDBText17.Enabled := True;
      QRDBText18.Enabled := True;
      QRDBText19.Enabled := True;
      QRDBText20.Enabled := True;
      QRDBText21.Enabled := True;
      QRDBText64.Enabled := True;
      QRDBText75.Enabled := True;
    end
  else
  if DM1.tLoteSetorItem.AsInteger = 7 then
    begin
      QRShape3.Enabled   := True;
      QRLabel13.Enabled  := True;
      QRLabel18.Enabled  := True;
      QRLabel19.Enabled  := True;
      QRLabel20.Enabled  := True;
      QRLabel21.Enabled  := True;
      QRLabel22.Enabled  := True;
      QRLabel48.Enabled  := True;
      QRLabel84.Enabled  := True;
      QRImage1.Enabled   := True;
      QRDBText12.Enabled := True;
      QRDBText13.Enabled := True;
      QRDBText14.Enabled := True;
      QRDBText15.Enabled := True;
      QRDBText16.Enabled := True;
      QRDBText63.Enabled := True;
      QRDBText74.Enabled := True;
    end;
end;

procedure TfRelTalao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfRelTalao.QRChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  Posicao: Integer;
begin
  for posicao := 1 to 18 do
    begin
      TQRLabel(FindComponent('Tam'+IntToStr(Posicao))).Enabled := False;
      TQRLabel(FindComponent('Mar'+IntToStr(Posicao))).Enabled := False;
      TQRLabel(FindComponent('Par'+IntToStr(Posicao))).Enabled := False;
    end;
  qTalaoGrade.First;
  Posicao := 0;
  while not qTalaoGrade.EOF do
    begin
      Inc(Posicao);
      if Posicao > 18 then
        ShowMessage('Existe mais de 18 tamanhos!')
      else
      begin
        TQRLabel(FindComponent('Tam' + IntToStr(Posicao))).Enabled  := True;
        TQRLabel(FindComponent('Tam' + IntToStr(Posicao))).Caption  := qTalaoGradeTamanho.AsString;
        TQRLabel(FindComponent('Mar' + IntToStr(Posicao))).Enabled  := True;
        TQRLabel(FindComponent('Mar' + IntToStr(Posicao))).Caption  := qTalaoGradeMarcarTam.AsString;
        TQRLabel(FindComponent('Par' + IntToStr(Posicao))).Enabled  := True;
        TQRLabel(FindComponent('Par' + IntToStr(Posicao))).Caption  := qTalaoGradeQtdPar.AsString;
      end;
      qTalaoGrade.Next;
    end;
end;

procedure TfRelTalao.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  vCodBarra: array [1..7] of string;
  i : Integer;
begin
  Barcode1.Top     := 0;
  Barcode1.Left    := 10;
  QRImage1.Picture := nil;
  QRImage2.Picture := nil;
  QRImage3.Picture := nil;
  QRImage4.Picture := nil;
  QRImage5.Picture := nil;
  QRImage6.Picture := nil;
  QRImage7.Picture := nil;
  for i := 1 to 7 do
    begin
      if vCodSetor[i] > 0 then
        begin
          vCodBarra[i] := '2' + FormatFloat('00000',DM1.tTalaoLote.AsInteger) +
                          FormatFloat('0000',DM1.tTalaoGradeTalao.AsInteger) +
                          FormatFloat('00',vCodSetor[i]);
          Barcode1.Text := vCodBarra[i];
          case i of
            1 :  Barcode1.DrawBarcode(QRImage7.Canvas);
            2 :  Barcode1.DrawBarcode(QRImage6.Canvas);
            3 :  Barcode1.DrawBarcode(QRImage5.Canvas);
            4 :  Barcode1.DrawBarcode(QRImage4.Canvas);
            5 :  Barcode1.DrawBarcode(QRImage3.Canvas);
            6 :  Barcode1.DrawBarcode(QRImage2.Canvas);
            7 :  Barcode1.DrawBarcode(QRImage1.Canvas);
          end;
        end;
    end;
  for i := 1 to 7 do
    begin
      if vCodSetor[i] > 0 then
        begin
          case i of
            1 : QRlabel61.Caption := vCodBarra[1];
            2 : QRlabel54.Caption := vCodBarra[2];
            3 : QRlabel52.Caption := vCodBarra[3];
            4 : QRlabel51.Caption := vCodBarra[4];
            5 : QRlabel50.Caption := vCodBarra[5];
            6 : QRlabel49.Caption := vCodBarra[6];
            7 : QRlabel48.Caption := vCodBarra[7];
          end;
        end;
    end;
  QRLabel79.Enabled := DM1.tLotePedidolkReposicao.AsBoolean;

//aaaaaaaaaaaaaaaaaaaaaaaa
  {Barcode1.Top := 0;
  Barcode1.Left := 10;
  QRImage1.Picture := nil;
  QRImage2.Picture := nil;
  QRImage3.Picture := nil;
  QRImage4.Picture := nil;
  QRImage5.Picture := nil;
  QRImage6.Picture := nil;
  QRImage7.Picture := nil;
  for i := 1 to 7 do
    begin
      vCodBarra[i] := FormatFloat('000000',DM1.tTalaoLote.AsInteger) +
                      FormatFloat('0000',DM1.tTalaoGradeTalao.AsInteger) +
                      FormatFloat('00',i);
      Barcode1.Text := vCodBarra[i];
      case i of
        1 :  Barcode1.DrawBarcode(QRImage7.Canvas);
        2 :  Barcode1.DrawBarcode(QRImage6.Canvas);
        3 :  Barcode1.DrawBarcode(QRImage5.Canvas);
        4 :  Barcode1.DrawBarcode(QRImage4.Canvas);
        5 :  Barcode1.DrawBarcode(QRImage3.Canvas);
        6 :  Barcode1.DrawBarcode(QRImage2.Canvas);
        7 :  Barcode1.DrawBarcode(QRImage1.Canvas);
      end;
    end;
  QRlabel61.Caption := vCodBarra[1];
  QRlabel54.Caption := vCodBarra[2];
  QRlabel52.Caption := vCodBarra[3];
  QRlabel51.Caption := vCodBarra[4];
  QRlabel50.Caption := vCodBarra[5];
  QRlabel49.Caption := vCodBarra[6];
  QRlabel48.Caption := vCodBarra[7];}

end;

procedure TfRelTalao.DetailBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  vCodBarra: string;
  vCodSetorAux : Integer;
begin
  qTalaoGrade.Active := False;
  qTalaoGrade.Params[0].AsInteger := DM1.tTalaoLote.AsInteger;
  qTalaoGrade.Params[1].AsInteger := DM1.tTalaoItem.AsInteger;
  qTalaoGrade.Active := True;
  DM1.tTalaoGrade.First;
  if DM1.tTalaoGradelkLargura.AsString <> '' then
    begin
      QRLabel80.Visible := True;
      QRLabel81.Visible := True;
      QRLabel81.Caption := DM1.tTalaoGradelkLargura.AsString;
    end
  else
    begin
      QRLabel80.Visible := False;
      QRLabel81.Visible := False;
      QRLabel81.Caption := '';
    end;
  DM1.tParametros.First;
  //vCodBarra := FormatFloat('00000',DM1.tTalaoLote.AsInteger) + '0000' +
  //             FormatFloat('00',DM1.tLoteSetorCodSetor.AsInteger);
  vCodBarra          := '';
  QRLabel77.Caption  := '';
  QRLabel186.Caption := '';
  if DM1.tParametrosCodSetor1FolhaLote.AsInteger > 0 then
    begin
      vCodBarra := FormatFloat('00000',DM1.tTalaoLote.AsInteger) + '0000' +
                   FormatFloat('00',DM1.tParametrosCodSetor1FolhaLote.AsInteger);
      Barcode1.Text := '1' + vCodBarra;
      Barcode1.DrawBarcode(QRImage9.Canvas);
      QRlabel77.Caption := '1' + vCodBarra;

      Barcode1.Text := '3' + vCodBarra;
      Barcode1.DrawBarcode(QRImage12.Canvas);
      QRlabel186.Caption := '3' + vCodBarra;
    end;
  QRImage8.Picture   := nil;
  QRLabel103.Caption := '';
  QRLabel104.Caption := '';
  vCodSetorAux       := 0;
  DM1.tProduto.IndexFieldNames := 'Codigo';
  DM1.tProduto.SetKey;
  DM1.tProdutoCodigo.AsInteger := DM1.tTalaoCodProduto.AsInteger;
  if DM1.tProduto.GotoKey then
    begin
      //26/07/2014 Foto Nova
      if FileExists(DM1.tProdutoEndFoto.AsString) then
        QRImage8.Picture.LoadFromFile(DM1.tProdutoEndFoto.AsString)
      else
      if not DM1.tProdutoFotoJpeg.IsNull then
        Le_Imagem_JPEG(DM1.tProdutoFotoJpeg,QRImage8);
      DM1.tConstrucao.IndexFieldNames := 'Codigo';
      DM1.tConstrucao.SetKey;
      DM1.tConstrucaoCodigo.AsInteger := DM1.tProdutoCodConstrucao.AsInteger;
      if DM1.tConstrucao.GotoKey then
        QRLabel104.Caption := DM1.tConstrucaoNome.AsString;
      DM1.tMaterial.IndexFieldNames := 'Codigo';
      DM1.tMaterial.SetKey;
      DM1.tMaterialCodigo.AsInteger := DM1.tProdutoCodForma.AsInteger;
      if DM1.tMaterial.GotoKey then
        QRLabel103.Caption := DM1.tMaterialNome.AsString;
    end;
  QRLabel78.Enabled := DM1.tLotePedidolkReposicao.AsBoolean;
end;

procedure TfRelTalao.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
 i : Integer;
begin
  for i := 1 to 7 do
    vCodSetor[i] := 0;
  DM1.tLoteSetor.First;
  while not DM1.tLoteSetor.Eof do
    begin
      if DM1.tLoteSetorItem.AsInteger < 8 then
        begin
          Mostra_Setores;
          case DM1.tLoteSetorItem.AsInteger of
            1 : QRLabel55.Caption := DM1.tLoteSetorlkNomeSetor.AsString;
            2 : QRLabel1.Caption  := DM1.tLoteSetorlkNomeSetor.AsString;
            3 : QRLabel17.Caption := DM1.tLoteSetorlkNomeSetor.AsString;
            4 : QRLabel16.Caption := DM1.tLoteSetorlkNomeSetor.AsString;
            5 : QRLabel15.Caption := DM1.tLoteSetorlkNomeSetor.AsString;
            6 : QRLabel14.Caption := DM1.tLoteSetorlkNomeSetor.AsString;
            7 : QRLabel13.Caption := DM1.tLoteSetorlkNomeSetor.AsString;
          end;
          vCodSetor[DM1.tLoteSetorItem.AsInteger] := DM1.tLoteSetorCodSetor.AsInteger;
        end;
      DM1.tLoteSetor.Next;
    end;
end;

procedure TfRelTalao.QRSubDetail2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel152.Enabled := DM1.tLotePedidolkReposicao.AsBoolean;
  QRLabel189.Caption := fConsLoteExp.Edit4.Text;
  QRShape396.Enabled := (fConsLoteExp.Edit4.Text <> '');
end;

procedure TfRelTalao.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  vCodBarra: string;
begin
  qTalaoGrade.Active := False;
  qTalaoGrade.Params[0].AsInteger := DM1.tTalaoLote.AsInteger;
  qTalaoGrade.Params[1].AsInteger := DM1.tTalaoItem.AsInteger;
  qTalaoGrade.Active := True;
  DM1.tTalaoGrade.First;
  if DM1.tTalaoGradelkLargura.AsString <> '' then
    begin
      QRLabel123.Visible := True;
      QRLabel124.Visible := True;
      QRLabel124.Caption := DM1.tTalaoGradelkLargura.AsString;
    end
  else
    begin
      QRLabel123.Visible := False;
      QRLabel124.Visible := False;
      QRLabel124.Caption := '';
    end;
  DM1.tLoteSetor.First;
  vCodBarra := '2' + FormatFloat('00000',DM1.tTalaoLote.AsInteger) + '0000' +
               FormatFloat('00',DM1.tLoteSetorCodSetor.AsInteger);
  Barcode1.Text := vCodBarra;
  Barcode1.DrawBarcode(QRImage11.Canvas);
  QRlabel120.Caption  := vCodBarra;
  QRImage10.Picture   := nil;
  QRLabel126.Caption := '';
  QRLabel127.Caption := '';
  DM1.tProduto.IndexFieldNames := 'Codigo';
  DM1.tProduto.SetKey;
  DM1.tProdutoCodigo.AsInteger := DM1.tTalaoCodProduto.AsInteger;
  if DM1.tProduto.GotoKey then
    begin
      //26/07/2014 Foto Nova
      if FileExists(DM1.tProdutoEndFoto.AsString) then
        QRImage10.Picture.LoadFromFile(DM1.tProdutoEndFoto.AsString)
      else
      if not DM1.tProdutoFotoJpeg.IsNull then
        Le_Imagem_JPEG(DM1.tProdutoFotoJpeg,QRImage10);
      DM1.tConstrucao.IndexFieldNames := 'Codigo';
      DM1.tConstrucao.SetKey;
      DM1.tConstrucaoCodigo.AsInteger := DM1.tProdutoCodConstrucao.AsInteger;
      if DM1.tConstrucao.GotoKey then
        QRLabel127.Caption := DM1.tConstrucaoNome.AsString;
      DM1.tMaterial.IndexFieldNames := 'Codigo';
      DM1.tMaterial.SetKey;
      DM1.tMaterialCodigo.AsInteger := DM1.tProdutoCodForma.AsInteger;
      if DM1.tMaterial.GotoKey then
        QRLabel126.Caption := DM1.tMaterialNome.AsString;
    end;
  QRLabel122.Enabled := DM1.tLotePedidolkReposicao.AsBoolean;
end;

procedure TfRelTalao.QRChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  Posicao: Integer;
begin
  for posicao := 1 to 14 do
    begin
      TQRLabel(FindComponent('Tama'+IntToStr(Posicao))).Enabled := False;
      TQRLabel(FindComponent('Mara'+IntToStr(Posicao))).Enabled := False;
      TQRLabel(FindComponent('Pr'+IntToStr(Posicao))).Enabled   := False;
    end;
  qTalaoGrade.First;
  Posicao := 0;
  while not qTalaoGrade.EOF do
    begin
      Inc(Posicao);
      TQRLabel(FindComponent('Tama' + IntToStr(Posicao))).Enabled := True;
      TQRLabel(FindComponent('Tama' + IntToStr(Posicao))).Caption := qTalaoGradeTamanho.AsString;
      TQRLabel(FindComponent('Mara' + IntToStr(Posicao))).Enabled := True;
      TQRLabel(FindComponent('Mara' + IntToStr(Posicao))).Caption := qTalaoGradeMarcarTam.AsString;
      TQRLabel(FindComponent('Pr' + IntToStr(Posicao))).Enabled   := True;
      TQRLabel(FindComponent('Pr' + IntToStr(Posicao))).Caption   := qTalaoGradeQtdPar.AsString;
      qTalaoGrade.Next;
    end;
end;

end.

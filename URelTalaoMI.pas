unit URelTalaoMI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, QuickRpt, Qrctrls, Barcode, JPEG,
  DB, DBTables, DBClient;

type
  TfRelTalaoMI = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRImage1: TQRImage;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText10: TQRDBText;
    QRShape1: TQRShape;
    QRImage2: TQRImage;
    QRLabel14: TQRLabel;
    QRShape4: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    Mat1: TQRLabel;
    Cons1: TQRLabel;
    Mat2: TQRLabel;
    Cons2: TQRLabel;
    Mat3: TQRLabel;
    Cons3: TQRLabel;
    Mat4: TQRLabel;
    Cons4: TQRLabel;
    Mat5: TQRLabel;
    Cons5: TQRLabel;
    Mat6: TQRLabel;
    Cons6: TQRLabel;
    Mat7: TQRLabel;
    Cons7: TQRLabel;
    Mat8: TQRLabel;
    Cons8: TQRLabel;
    Mat9: TQRLabel;
    Cons9: TQRLabel;
    Mat10: TQRLabel;
    Cons10: TQRLabel;
    Mat11: TQRLabel;
    Cons11: TQRLabel;
    Mat12: TQRLabel;
    Cons12: TQRLabel;
    Mat13: TQRLabel;
    Cons13: TQRLabel;
    Mat14: TQRLabel;
    Cons14: TQRLabel;
    QRShape5: TQRShape;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    Mat15: TQRLabel;
    Mat16: TQRLabel;
    Mat17: TQRLabel;
    Mat18: TQRLabel;
    Mat19: TQRLabel;
    Mat20: TQRLabel;
    Mat21: TQRLabel;
    Mat22: TQRLabel;
    Mat23: TQRLabel;
    Mat24: TQRLabel;
    Mat25: TQRLabel;
    Mat26: TQRLabel;
    Mat27: TQRLabel;
    Mat28: TQRLabel;
    Cons15: TQRLabel;
    Cons16: TQRLabel;
    Cons17: TQRLabel;
    Cons18: TQRLabel;
    Cons19: TQRLabel;
    Cons20: TQRLabel;
    Cons21: TQRLabel;
    Cons22: TQRLabel;
    Cons23: TQRLabel;
    Cons24: TQRLabel;
    Cons25: TQRLabel;
    Cons26: TQRLabel;
    Cons27: TQRLabel;
    Cons28: TQRLabel;
    QRDBText11: TQRDBText;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRLabel42: TQRLabel;
    QRDBText12: TQRDBText;
    Setor1: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText15: TQRDBText;
    QRShape34: TQRShape;
    Setor2: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText18: TQRDBText;
    QRImage3: TQRImage;
    QRShape35: TQRShape;
    Setor3: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText21: TQRDBText;
    QRImage4: TQRImage;
    QRShape36: TQRShape;
    Setor4: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText24: TQRDBText;
    QRImage5: TQRImage;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QuickRep2: TQuickRep;
    QRBand1: TQRBand;
    QRShape23: TQRShape;
    QRLabel52: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel53: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel54: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRDBText28: TQRDBText;
    QRImage6: TQRImage;
    QRLabel57: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel58: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel62: TQRLabel;
    QRDBText34: TQRDBText;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    AMat1: TQRLabel;
    ACons1: TQRLabel;
    AMat2: TQRLabel;
    ACons2: TQRLabel;
    AMat3: TQRLabel;
    ACons3: TQRLabel;
    AMat4: TQRLabel;
    ACons4: TQRLabel;
    AMat5: TQRLabel;
    ACons5: TQRLabel;
    AMat6: TQRLabel;
    ACons6: TQRLabel;
    AMat7: TQRLabel;
    ACons7: TQRLabel;
    AMat8: TQRLabel;
    ACons8: TQRLabel;
    AMat9: TQRLabel;
    ACons9: TQRLabel;
    AMat10: TQRLabel;
    ACons10: TQRLabel;
    AMat11: TQRLabel;
    ACons11: TQRLabel;
    AMat12: TQRLabel;
    ACons12: TQRLabel;
    AMat13: TQRLabel;
    ACons13: TQRLabel;
    AMat14: TQRLabel;
    ACons14: TQRLabel;
    QRShape27: TQRShape;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    AMat15: TQRLabel;
    AMat16: TQRLabel;
    AMat17: TQRLabel;
    AMat18: TQRLabel;
    AMat19: TQRLabel;
    AMat20: TQRLabel;
    AMat21: TQRLabel;
    AMat22: TQRLabel;
    AMat23: TQRLabel;
    AMat24: TQRLabel;
    AMat25: TQRLabel;
    AMat26: TQRLabel;
    AMat27: TQRLabel;
    AMat28: TQRLabel;
    ACons15: TQRLabel;
    ACons16: TQRLabel;
    ACons17: TQRLabel;
    ACons18: TQRLabel;
    ACons19: TQRLabel;
    ACons20: TQRLabel;
    ACons21: TQRLabel;
    ACons22: TQRLabel;
    ACons23: TQRLabel;
    ACons24: TQRLabel;
    ACons25: TQRLabel;
    ACons26: TQRLabel;
    ACons27: TQRLabel;
    ACons28: TQRLabel;
    QRDBText35: TQRDBText;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRLabel150: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel173: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel36: TQRLabel;
    QRDBText38: TQRDBText;
    QRLabel37: TQRLabel;
    QRDBText39: TQRDBText;
    QRLabel38: TQRLabel;
    QRImage7: TQRImage;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRDBText40: TQRDBText;
    QRLabel41: TQRLabel;
    QRDBText41: TQRDBText;
    QRLabel43: TQRLabel;
    QRDBText42: TQRDBText;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRDBText44: TQRDBText;
    QRLabel46: TQRLabel;
    QRLabel49: TQRLabel;
    QRDBText46: TQRDBText;
    QRLabel50: TQRLabel;
    QRShape9: TQRShape;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRShape10: TQRShape;
    QRLabel68: TQRLabel;
    BMat1: TQRLabel;
    BMat2: TQRLabel;
    BMat3: TQRLabel;
    BMat4: TQRLabel;
    BMat5: TQRLabel;
    BMat6: TQRLabel;
    BMat7: TQRLabel;
    BMat8: TQRLabel;
    BMat9: TQRLabel;
    BMat10: TQRLabel;
    BMat11: TQRLabel;
    BMat12: TQRLabel;
    BMat13: TQRLabel;
    BMat14: TQRLabel;
    BCons14: TQRLabel;
    BCons13: TQRLabel;
    BCons12: TQRLabel;
    BCons11: TQRLabel;
    BCons10: TQRLabel;
    BCons9: TQRLabel;
    BCons8: TQRLabel;
    BCons7: TQRLabel;
    BCons6: TQRLabel;
    BCons5: TQRLabel;
    BCons4: TQRLabel;
    BCons3: TQRLabel;
    BCons2: TQRLabel;
    BCons1: TQRLabel;
    BMat15: TQRLabel;
    BMat16: TQRLabel;
    BMat17: TQRLabel;
    BMat19: TQRLabel;
    BMat18: TQRLabel;
    BMat20: TQRLabel;
    BMat21: TQRLabel;
    BMat22: TQRLabel;
    BMat23: TQRLabel;
    BMat24: TQRLabel;
    BMat25: TQRLabel;
    BMat26: TQRLabel;
    BMat27: TQRLabel;
    BMat28: TQRLabel;
    BCons28: TQRLabel;
    BCons27: TQRLabel;
    BCons26: TQRLabel;
    BCons25: TQRLabel;
    BCons24: TQRLabel;
    BCons23: TQRLabel;
    BCons22: TQRLabel;
    BCons21: TQRLabel;
    BCons20: TQRLabel;
    BCons19: TQRLabel;
    BCons18: TQRLabel;
    BCons16: TQRLabel;
    BCons17: TQRLabel;
    BCons15: TQRLabel;
    QRLabel127: TQRLabel;
    QRDBText47: TQRDBText;
    QRShape28: TQRShape;
    QRLabel143: TQRLabel;
    QRShape29: TQRShape;
    QRDBText48: TQRDBText;
    QRShape67: TQRShape;
    QRLabel69: TQRLabel;
    QRDBText49: TQRDBText;
    QRLabel70: TQRLabel;
    QRDBText50: TQRDBText;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QuickRep3: TQuickRep;
    QRBand2: TQRBand;
    QRShape16: TQRShape;
    QRShape41: TQRShape;
    QRLabel91: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel92: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel93: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRDBText32: TQRDBText;
    QRImage8: TQRImage;
    QRLabel98: TQRLabel;
    QRDBText43: TQRDBText;
    QRLabel99: TQRLabel;
    QRDBText45: TQRDBText;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRDBText51: TQRDBText;
    QRLabel103: TQRLabel;
    QRDBText52: TQRDBText;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    PMat1: TQRLabel;
    PCons1: TQRLabel;
    PMat2: TQRLabel;
    PCons2: TQRLabel;
    PMat3: TQRLabel;
    PCons3: TQRLabel;
    PMat4: TQRLabel;
    PCons4: TQRLabel;
    PMat5: TQRLabel;
    PCons5: TQRLabel;
    PMat6: TQRLabel;
    PCons6: TQRLabel;
    PMat7: TQRLabel;
    PCons7: TQRLabel;
    PMat8: TQRLabel;
    PCons8: TQRLabel;
    PMat9: TQRLabel;
    PCons9: TQRLabel;
    PMat10: TQRLabel;
    PCons10: TQRLabel;
    PMat11: TQRLabel;
    PCons11: TQRLabel;
    PMat12: TQRLabel;
    PCons12: TQRLabel;
    PMat13: TQRLabel;
    PCons13: TQRLabel;
    PMat14: TQRLabel;
    PCons14: TQRLabel;
    QRShape44: TQRShape;
    QRLabel137: TQRLabel;
    QRLabel138: TQRLabel;
    PMat15: TQRLabel;
    PMat16: TQRLabel;
    PMat17: TQRLabel;
    PMat18: TQRLabel;
    PMat19: TQRLabel;
    PMat20: TQRLabel;
    PMat21: TQRLabel;
    PMat22: TQRLabel;
    PMat23: TQRLabel;
    PMat24: TQRLabel;
    PMat25: TQRLabel;
    PMat26: TQRLabel;
    PMat27: TQRLabel;
    PMat28: TQRLabel;
    PCons15: TQRLabel;
    PCons16: TQRLabel;
    PCons17: TQRLabel;
    PCons18: TQRLabel;
    PCons19: TQRLabel;
    PCons20: TQRLabel;
    PCons21: TQRLabel;
    PCons22: TQRLabel;
    PCons23: TQRLabel;
    PCons24: TQRLabel;
    PCons25: TQRLabel;
    PCons26: TQRLabel;
    PCons27: TQRLabel;
    PCons28: TQRLabel;
    QRDBText53: TQRDBText;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRLabel200: TQRLabel;
    QRDBText54: TQRDBText;
    QRLabel203: TQRLabel;
    QRLabel320: TQRLabel;
    QRLabel321: TQRLabel;
    QRLabel77: TQRLabel;
    QRDBText55: TQRDBText;
    QRLabel78: TQRLabel;
    QRDBText56: TQRDBText;
    QRLabel79: TQRLabel;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRLabel80: TQRLabel;
    QuickRep4: TQuickRep;
    QRBand3: TQRBand;
    QRShape17: TQRShape;
    QRShape45: TQRShape;
    QRLabel112: TQRLabel;
    QRDBText59: TQRDBText;
    QRLabel113: TQRLabel;
    QRDBText60: TQRDBText;
    QRLabel114: TQRLabel;
    QRDBText61: TQRDBText;
    QRLabel115: TQRLabel;
    QRLabel116: TQRLabel;
    QRDBText62: TQRDBText;
    QRImage9: TQRImage;
    QRLabel117: TQRLabel;
    QRDBText63: TQRDBText;
    QRLabel118: TQRLabel;
    QRDBText64: TQRDBText;
    QRLabel119: TQRLabel;
    QRLabel120: TQRLabel;
    QRLabel121: TQRLabel;
    QRDBText65: TQRDBText;
    QRLabel122: TQRLabel;
    QRDBText66: TQRDBText;
    QRLabel123: TQRLabel;
    QRLabel124: TQRLabel;
    QRLabel125: TQRLabel;
    QRShape50: TQRShape;
    QRLabel162: TQRLabel;
    QRLabel163: TQRLabel;
    QRDBText67: TQRDBText;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRLabel225: TQRLabel;
    QRDBText68: TQRDBText;
    QRLabel228: TQRLabel;
    QRLabel229: TQRLabel;
    QRDBText69: TQRDBText;
    QRLabel230: TQRLabel;
    QRDBText70: TQRDBText;
    QRLabel231: TQRLabel;
    QRDBText71: TQRDBText;
    QRLabel232: TQRLabel;
    QRImage10: TQRImage;
    QRLabel233: TQRLabel;
    QRLabel234: TQRLabel;
    QRDBText72: TQRDBText;
    QRLabel235: TQRLabel;
    QRDBText73: TQRDBText;
    QRLabel236: TQRLabel;
    QRDBText74: TQRDBText;
    QRLabel237: TQRLabel;
    QRLabel238: TQRLabel;
    QRDBText75: TQRDBText;
    QRLabel239: TQRLabel;
    QRLabel240: TQRLabel;
    QRDBText76: TQRDBText;
    QRShape88: TQRShape;
    QRLabel241: TQRLabel;
    QRShape89: TQRShape;
    QRLabel242: TQRLabel;
    QRLabel299: TQRLabel;
    QRDBText77: TQRDBText;
    QRShape104: TQRShape;
    QRLabel314: TQRLabel;
    QRShape105: TQRShape;
    QRDBText78: TQRDBText;
    QRLabel345: TQRLabel;
    QRLabel346: TQRLabel;
    QRLabel347: TQRLabel;
    QRLabel348: TQRLabel;
    QRLabel349: TQRLabel;
    CMat14: TQRLabel;
    CMat13: TQRLabel;
    CMat12: TQRLabel;
    CMat11: TQRLabel;
    CMat10: TQRLabel;
    CMat9: TQRLabel;
    CMat8: TQRLabel;
    CMat7: TQRLabel;
    CMat6: TQRLabel;
    CMat5: TQRLabel;
    CMat4: TQRLabel;
    CMat3: TQRLabel;
    CMat2: TQRLabel;
    CMat1: TQRLabel;
    CCons1: TQRLabel;
    CCons2: TQRLabel;
    CCons3: TQRLabel;
    CCons4: TQRLabel;
    CCons5: TQRLabel;
    CCons6: TQRLabel;
    CCons7: TQRLabel;
    CCons8: TQRLabel;
    CCons9: TQRLabel;
    CCons10: TQRLabel;
    CCons11: TQRLabel;
    CCons12: TQRLabel;
    CCons13: TQRLabel;
    CCons14: TQRLabel;
    CMat15: TQRLabel;
    CMat16: TQRLabel;
    CMat17: TQRLabel;
    CMat18: TQRLabel;
    CMat19: TQRLabel;
    CMat20: TQRLabel;
    CMat21: TQRLabel;
    CMat22: TQRLabel;
    CMat23: TQRLabel;
    CMat24: TQRLabel;
    CMat25: TQRLabel;
    CMat26: TQRLabel;
    CMat27: TQRLabel;
    CMat28: TQRLabel;
    CCons28: TQRLabel;
    CCons27: TQRLabel;
    CCons25: TQRLabel;
    CCons26: TQRLabel;
    CCons24: TQRLabel;
    CCons22: TQRLabel;
    CCons23: TQRLabel;
    CCons21: TQRLabel;
    CCons20: TQRLabel;
    CCons18: TQRLabel;
    CCons17: TQRLabel;
    CCons19: TQRLabel;
    CCons16: TQRLabel;
    CCons15: TQRLabel;
    DMat1: TQRLabel;
    DMat2: TQRLabel;
    DMat3: TQRLabel;
    DMat4: TQRLabel;
    DMat5: TQRLabel;
    DMat6: TQRLabel;
    DMat7: TQRLabel;
    DMat8: TQRLabel;
    DMat9: TQRLabel;
    DMat10: TQRLabel;
    DMat11: TQRLabel;
    DMat12: TQRLabel;
    DMat13: TQRLabel;
    DMat14: TQRLabel;
    DCons14: TQRLabel;
    DCons13: TQRLabel;
    DCons12: TQRLabel;
    DCons11: TQRLabel;
    DCons10: TQRLabel;
    DCons9: TQRLabel;
    DCons8: TQRLabel;
    DCons7: TQRLabel;
    DCons6: TQRLabel;
    DCons5: TQRLabel;
    DCons4: TQRLabel;
    DCons3: TQRLabel;
    DCons2: TQRLabel;
    DCons1: TQRLabel;
    DMat15: TQRLabel;
    DMat16: TQRLabel;
    DMat17: TQRLabel;
    DMat18: TQRLabel;
    DMat19: TQRLabel;
    DMat21: TQRLabel;
    DMat22: TQRLabel;
    DMat20: TQRLabel;
    DMat23: TQRLabel;
    DMat24: TQRLabel;
    DMat26: TQRLabel;
    DMat25: TQRLabel;
    DMat27: TQRLabel;
    DMat28: TQRLabel;
    DCons28: TQRLabel;
    DCons27: TQRLabel;
    DCons26: TQRLabel;
    DCons25: TQRLabel;
    DCons24: TQRLabel;
    DCons22: TQRLabel;
    DCons23: TQRLabel;
    DCons21: TQRLabel;
    DCons20: TQRLabel;
    DCons19: TQRLabel;
    DCons17: TQRLabel;
    DCons18: TQRLabel;
    DCons16: TQRLabel;
    DCons15: TQRLabel;
    QRLabel81: TQRLabel;
    Barcode1: TBarcode;
    QRLabel82: TQRLabel;
    QRDBText79: TQRDBText;
    QRDBText80: TQRDBText;
    QRLabel83: TQRLabel;
    QRDBText81: TQRDBText;
    QRLabel84: TQRLabel;
    QRDBText82: TQRDBText;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRDBText83: TQRDBText;
    QRLabel87: TQRLabel;
    QRDBText84: TQRDBText;
    QRLabel88: TQRLabel;
    QRDBText85: TQRDBText;
    QRLabel89: TQRLabel;
    QRDBText86: TQRDBText;
    QRLabel107: TQRLabel;
    QRDBText87: TQRDBText;
    QRLabel108: TQRLabel;
    QRDBText88: TQRDBText;
    QRLabel109: TQRLabel;
    QRDBText89: TQRDBText;
    QRLabel110: TQRLabel;
    QRDBText90: TQRDBText;
    QRLabel126: TQRLabel;
    QRDBText91: TQRDBText;
    QRLabel129: TQRLabel;
    QRDBText92: TQRDBText;
    QRLabel130: TQRLabel;
    QRDBText93: TQRDBText;
    QRLabel131: TQRLabel;
    QRDBText94: TQRDBText;
    QRLabel132: TQRLabel;
    QRDBText95: TQRDBText;
    QRLabel133: TQRLabel;
    QRDBText96: TQRDBText;
    Tam1: TQRLabel;
    Tam2: TQRLabel;
    Tam3: TQRLabel;
    Tam4: TQRLabel;
    Tam5: TQRLabel;
    Tam6: TQRLabel;
    Tam7: TQRLabel;
    Tam8: TQRLabel;
    Tam9: TQRLabel;
    Tam10: TQRLabel;
    Tam11: TQRLabel;
    Tam12: TQRLabel;
    Tam13: TQRLabel;
    QRLabel18: TQRLabel;
    Tam14: TQRLabel;
    Tam15: TQRLabel;
    Qtd1: TQRLabel;
    Qtd2: TQRLabel;
    Qtd3: TQRLabel;
    Qtd4: TQRLabel;
    Qtd5: TQRLabel;
    Qtd6: TQRLabel;
    Qtd7: TQRLabel;
    Qtd8: TQRLabel;
    Qtd9: TQRLabel;
    Qtd10: TQRLabel;
    Qtd11: TQRLabel;
    Qtd12: TQRLabel;
    Qtd13: TQRLabel;
    QRLabel22: TQRLabel;
    Qtd14: TQRLabel;
    Qtd15: TQRLabel;
    Marc13: TQRLabel;
    Marc12: TQRLabel;
    Marc11: TQRLabel;
    Marc10: TQRLabel;
    Marc9: TQRLabel;
    Marc8: TQRLabel;
    Marc7: TQRLabel;
    Marc6: TQRLabel;
    Marc5: TQRLabel;
    Marc4: TQRLabel;
    Marc3: TQRLabel;
    Marc2: TQRLabel;
    Marc1: TQRLabel;
    QRLabel26: TQRLabel;
    Marc14: TQRLabel;
    Marc15: TQRLabel;
    ATam1: TQRLabel;
    ATam2: TQRLabel;
    ATam3: TQRLabel;
    ATam4: TQRLabel;
    ATam5: TQRLabel;
    ATam6: TQRLabel;
    ATam7: TQRLabel;
    ATam8: TQRLabel;
    ATam9: TQRLabel;
    ATam10: TQRLabel;
    ATam11: TQRLabel;
    ATam12: TQRLabel;
    ATam13: TQRLabel;
    QRLabel149: TQRLabel;
    ATam14: TQRLabel;
    ATam15: TQRLabel;
    AQtd1: TQRLabel;
    AQtd2: TQRLabel;
    AQtd3: TQRLabel;
    AQtd4: TQRLabel;
    AQtd5: TQRLabel;
    AQtd6: TQRLabel;
    AQtd7: TQRLabel;
    AQtd8: TQRLabel;
    AQtd9: TQRLabel;
    AQtd10: TQRLabel;
    AQtd11: TQRLabel;
    AQtd12: TQRLabel;
    AQtd13: TQRLabel;
    QRLabel170: TQRLabel;
    AQtd14: TQRLabel;
    AQtd15: TQRLabel;
    AMarc13: TQRLabel;
    AMarc12: TQRLabel;
    AMarc11: TQRLabel;
    AMarc10: TQRLabel;
    AMarc9: TQRLabel;
    AMarc8: TQRLabel;
    AMarc7: TQRLabel;
    AMarc6: TQRLabel;
    AMarc5: TQRLabel;
    AMarc4: TQRLabel;
    AMarc3: TQRLabel;
    AMarc2: TQRLabel;
    AMarc1: TQRLabel;
    QRLabel187: TQRLabel;
    AMarc14: TQRLabel;
    AMarc15: TQRLabel;
    PTam1: TQRLabel;
    PTam2: TQRLabel;
    PTam3: TQRLabel;
    PTam4: TQRLabel;
    PTam5: TQRLabel;
    PTam6: TQRLabel;
    PTam7: TQRLabel;
    PTam8: TQRLabel;
    PTam9: TQRLabel;
    PTam10: TQRLabel;
    PTam11: TQRLabel;
    PTam12: TQRLabel;
    PTam13: TQRLabel;
    QRLabel148: TQRLabel;
    PTam14: TQRLabel;
    PTam15: TQRLabel;
    PQtd1: TQRLabel;
    PQtd2: TQRLabel;
    PQtd3: TQRLabel;
    PQtd4: TQRLabel;
    PQtd5: TQRLabel;
    PQtd6: TQRLabel;
    PQtd7: TQRLabel;
    PQtd8: TQRLabel;
    PQtd9: TQRLabel;
    PQtd10: TQRLabel;
    PQtd11: TQRLabel;
    PQtd12: TQRLabel;
    PQtd13: TQRLabel;
    QRLabel171: TQRLabel;
    PQtd14: TQRLabel;
    PQtd15: TQRLabel;
    PMarc13: TQRLabel;
    PMarc12: TQRLabel;
    PMarc11: TQRLabel;
    PMarc10: TQRLabel;
    PMarc9: TQRLabel;
    PMarc8: TQRLabel;
    PMarc7: TQRLabel;
    PMarc6: TQRLabel;
    PMarc5: TQRLabel;
    PMarc4: TQRLabel;
    PMarc3: TQRLabel;
    PMarc2: TQRLabel;
    PMarc1: TQRLabel;
    QRLabel189: TQRLabel;
    PMarc14: TQRLabel;
    PMarc15: TQRLabel;
    CTam1: TQRLabel;
    CTam2: TQRLabel;
    CTam3: TQRLabel;
    CTam4: TQRLabel;
    CTam5: TQRLabel;
    CTam6: TQRLabel;
    CTam7: TQRLabel;
    CTam8: TQRLabel;
    CTam9: TQRLabel;
    CTam10: TQRLabel;
    CTam11: TQRLabel;
    CTam12: TQRLabel;
    CTam13: TQRLabel;
    QRLabel147: TQRLabel;
    CTam14: TQRLabel;
    CTam15: TQRLabel;
    CQtd1: TQRLabel;
    CQtd2: TQRLabel;
    CQtd3: TQRLabel;
    CQtd4: TQRLabel;
    CQtd5: TQRLabel;
    CQtd6: TQRLabel;
    CQtd7: TQRLabel;
    CQtd8: TQRLabel;
    CQtd9: TQRLabel;
    CQtd10: TQRLabel;
    CQtd11: TQRLabel;
    CQtd12: TQRLabel;
    CQtd13: TQRLabel;
    QRLabel172: TQRLabel;
    CQtd14: TQRLabel;
    CQtd15: TQRLabel;
    CMarc13: TQRLabel;
    CMarc12: TQRLabel;
    CMarc11: TQRLabel;
    CMarc10: TQRLabel;
    CMarc9: TQRLabel;
    CMarc8: TQRLabel;
    CMarc7: TQRLabel;
    CMarc6: TQRLabel;
    CMarc5: TQRLabel;
    CMarc4: TQRLabel;
    CMarc3: TQRLabel;
    CMarc2: TQRLabel;
    CMarc1: TQRLabel;
    QRLabel191: TQRLabel;
    CMarc14: TQRLabel;
    CMarc15: TQRLabel;
    DTam1: TQRLabel;
    DTam2: TQRLabel;
    DTam3: TQRLabel;
    DTam4: TQRLabel;
    DTam5: TQRLabel;
    DTam6: TQRLabel;
    DTam7: TQRLabel;
    DTam8: TQRLabel;
    DTam9: TQRLabel;
    DTam10: TQRLabel;
    DTam11: TQRLabel;
    DTam12: TQRLabel;
    DTam13: TQRLabel;
    QRLabel151: TQRLabel;
    DTam14: TQRLabel;
    DTam15: TQRLabel;
    DQtd1: TQRLabel;
    DQtd2: TQRLabel;
    DQtd3: TQRLabel;
    DQtd4: TQRLabel;
    DQtd5: TQRLabel;
    DQtd6: TQRLabel;
    DQtd7: TQRLabel;
    DQtd8: TQRLabel;
    DQtd9: TQRLabel;
    DQtd10: TQRLabel;
    DQtd11: TQRLabel;
    DQtd12: TQRLabel;
    DQtd13: TQRLabel;
    QRLabel175: TQRLabel;
    DQtd14: TQRLabel;
    DQtd15: TQRLabel;
    DMarc13: TQRLabel;
    DMarc12: TQRLabel;
    DMarc11: TQRLabel;
    DMarc10: TQRLabel;
    DMarc9: TQRLabel;
    DMarc8: TQRLabel;
    DMarc7: TQRLabel;
    DMarc6: TQRLabel;
    DMarc5: TQRLabel;
    DMarc4: TQRLabel;
    DMarc3: TQRLabel;
    DMarc2: TQRLabel;
    DMarc1: TQRLabel;
    QRLabel194: TQRLabel;
    DMarc14: TQRLabel;
    DMarc15: TQRLabel;
    BTam1: TQRLabel;
    BTam2: TQRLabel;
    BTam3: TQRLabel;
    BTam4: TQRLabel;
    BTam5: TQRLabel;
    BTam6: TQRLabel;
    BTam7: TQRLabel;
    BTam8: TQRLabel;
    BTam9: TQRLabel;
    BTam10: TQRLabel;
    BTam11: TQRLabel;
    BTam12: TQRLabel;
    BTam13: TQRLabel;
    QRLabel146: TQRLabel;
    BTam14: TQRLabel;
    BTam15: TQRLabel;
    BQtd1: TQRLabel;
    BQtd2: TQRLabel;
    BQtd3: TQRLabel;
    BQtd4: TQRLabel;
    BQtd5: TQRLabel;
    BQtd6: TQRLabel;
    BQtd7: TQRLabel;
    BQtd8: TQRLabel;
    BQtd9: TQRLabel;
    BQtd10: TQRLabel;
    BQtd11: TQRLabel;
    BQtd12: TQRLabel;
    BQtd13: TQRLabel;
    QRLabel169: TQRLabel;
    BQtd14: TQRLabel;
    BQtd15: TQRLabel;
    BMarc13: TQRLabel;
    BMarc12: TQRLabel;
    BMarc11: TQRLabel;
    BMarc10: TQRLabel;
    BMarc9: TQRLabel;
    BMarc8: TQRLabel;
    BMarc7: TQRLabel;
    BMarc6: TQRLabel;
    BMarc5: TQRLabel;
    BMarc4: TQRLabel;
    BMarc3: TQRLabel;
    BMarc2: TQRLabel;
    BMarc1: TQRLabel;
    QRLabel193: TQRLabel;
    BMarc14: TQRLabel;
    BMarc15: TQRLabel;
    AInt1: TQRLabel;
    AInt3: TQRLabel;
    AInt2: TQRLabel;
    AInt4: TQRLabel;
    AInt5: TQRLabel;
    AInt6: TQRLabel;
    AInt7: TQRLabel;
    AInt8: TQRLabel;
    AInt9: TQRLabel;
    AInt10: TQRLabel;
    AInt11: TQRLabel;
    AInt12: TQRLabel;
    AInt13: TQRLabel;
    AInt14: TQRLabel;
    AInt15: TQRLabel;
    BInt13: TQRLabel;
    BInt12: TQRLabel;
    BInt11: TQRLabel;
    BInt10: TQRLabel;
    BInt9: TQRLabel;
    BInt8: TQRLabel;
    BInt7: TQRLabel;
    BInt6: TQRLabel;
    BInt5: TQRLabel;
    BInt4: TQRLabel;
    BInt3: TQRLabel;
    BInt2: TQRLabel;
    BInt1: TQRLabel;
    BInt14: TQRLabel;
    BInt15: TQRLabel;
    mAuxIntervalo: TClientDataSet;
    mAuxIntervaloTamIntervalo: TStringField;
    mAuxIntervaloQtd: TIntegerField;
    mAuxIntervalo2: TClientDataSet;
    mAuxIntervalo2TamIntervalo: TStringField;
    mAuxIntervalo2Qtd: TIntegerField;
    AQtdTamIntervalo: TQRLabel;
    BQtdTamIntervalo: TQRLabel;
    PInt1: TQRLabel;
    PInt2: TQRLabel;
    PInt3: TQRLabel;
    PInt4: TQRLabel;
    PInt5: TQRLabel;
    PInt6: TQRLabel;
    PInt7: TQRLabel;
    PInt8: TQRLabel;
    PInt9: TQRLabel;
    PInt10: TQRLabel;
    PInt11: TQRLabel;
    PInt12: TQRLabel;
    PInt13: TQRLabel;
    PInt14: TQRLabel;
    PInt15: TQRLabel;
    PQtdTamIntervalo: TQRLabel;
    CInt1: TQRLabel;
    CInt2: TQRLabel;
    CQtdTamIntervalo: TQRLabel;
    CInt3: TQRLabel;
    CInt4: TQRLabel;
    CInt5: TQRLabel;
    CInt6: TQRLabel;
    CInt7: TQRLabel;
    CInt8: TQRLabel;
    CInt9: TQRLabel;
    CInt10: TQRLabel;
    CInt11: TQRLabel;
    CInt12: TQRLabel;
    CInt13: TQRLabel;
    CInt14: TQRLabel;
    CInt15: TQRLabel;
    QRShape2: TQRShape;
    DInt1: TQRLabel;
    DQtdTamIntervalo: TQRLabel;
    DInt2: TQRLabel;
    DInt3: TQRLabel;
    DInt4: TQRLabel;
    DInt5: TQRLabel;
    DInt6: TQRLabel;
    DInt7: TQRLabel;
    DInt8: TQRLabel;
    DInt9: TQRLabel;
    DInt10: TQRLabel;
    DInt11: TQRLabel;
    DInt12: TQRLabel;
    DInt13: TQRLabel;
    DInt14: TQRLabel;
    DInt15: TQRLabel;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
     vJPG: TJPEGImage;
     vBMP: TBitMap;
     procedure prc_Carrega_Imagem(Foto: TQrImage);
     procedure Mostra_Setores;
     procedure prc_Gravar_mAuxIntervalo(Tamanho, Tipo : String ; Qtd : Integer); //Tipo 1= mAuxIntervalo   2= mAuxIntervalo2
  public
    vMetodoNovo_Imagem: Boolean;
    { Public declarations }
  end;

var
  fRelTalaoMI: TfRelTalaoMI;
  vCodSetor: array [1..4] of integer;

implementation

uses UDM1, UDM2, UConsLote, StrUtils;

{$R *.DFM}

procedure Le_Imagem_JPEG(Campo: TBlobField; Foto: TQrImage);
var
  BS: TBlobStream;
  MinhaImagem: TJPEGImage;
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

procedure TfRelTalaoMI.Mostra_Setores;
begin
  if DM1.tLoteSetorMIItem.AsInteger = 1 then
  begin
    QRShape1.Enabled   := True;
    Setor1.Enabled     := True;
    QRLabel12.Enabled  := True;
    QRLabel13.Enabled  := True;
    QRLabel17.Enabled  := True;
    QRLabel30.Enabled  := True;
    QRLabel77.Enabled  := True;
    QRImage2.Enabled   := True;
    QRDBText13.Enabled := True;
    QRDBText14.Enabled := True;
    QRDBText15.Enabled := True;
    QRDBText55.Enabled := True;
  end
  else
  if DM1.tLoteSetorMIItem.AsInteger = 2 then
  begin
    QRShape34.Enabled  := True;
    Setor2.Enabled     := True;
    QRLabel19.Enabled  := True;
    QRLabel20.Enabled  := True;
    QRLabel21.Enabled  := True;
    QRLabel31.Enabled  := True;
    QRLabel78.Enabled  := True;
    QRImage3.Enabled   := True;
    QRDBText16.Enabled := True;
    QRDBText17.Enabled := True;
    QRDBText18.Enabled := True;
    QRDBText56.Enabled := True;
  end
  else
  if DM1.tLoteSetorMIItem.AsInteger = 3 then
  begin
    QRShape35.Enabled  := True;
    Setor3.Enabled     := True;
    QRLabel23.Enabled  := True;
    QRLabel24.Enabled  := True;
    QRLabel25.Enabled  := True;
    QRLabel32.Enabled  := True;
    QRLabel79.Enabled  := True;
    QRImage4.Enabled   := True;
    QRDBText19.Enabled := True;
    QRDBText20.Enabled := True;
    QRDBText21.Enabled := True;
    QRDBText57.Enabled := True;
  end
  else
  if DM1.tLoteSetorMIItem.AsInteger = 4 then
  begin
    QRShape36.Enabled  := True;
    Setor4.Enabled     := True;
    QRLabel27.Enabled  := True;
    QRLabel28.Enabled  := True;
    QRLabel29.Enabled  := True;
    QRLabel33.Enabled  := True;
    QRLabel80.Enabled  := True;
    QRImage5.Enabled   := True;
    QRDBText22.Enabled := True;
    QRDBText23.Enabled := True;
    QRDBText24.Enabled := True;
    QRDBText58.Enabled := True;
  end;
end;

procedure TfRelTalaoMI.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  posicao, i: integer;
  vCodBarra: array [1..4] of string;
  vTexto1: String;
  vTamFonte: Integer;
begin
  QRImage1.Picture := nil;
  QRImage2.Picture := nil;
  QRImage3.Picture := nil;
  QRImage4.Picture := nil;
  QRImage5.Picture := nil;
  for i := 1 to 4 do
  begin
    if vCodSetor[i] > 0 then
    begin
      vCodBarra[i] := '1' + FormatFloat('00000',DM1.tTalaoMILote.AsInteger) +
                      FormatFloat('0000',DM1.tTalaoMIItem.AsInteger) +
                      FormatFloat('00',vCodSetor[i]);
      Barcode1.Text := vCodBarra[i];
      case i of
        1: Barcode1.DrawBarcode(QRImage2.Canvas);
        2: Barcode1.DrawBarcode(QRImage3.Canvas);
        3: Barcode1.DrawBarcode(QRImage4.Canvas);
        4: Barcode1.DrawBarcode(QRImage5.Canvas);
      end;
    end;
  end;
  for i := 1 to 4 do
  begin
    if vCodSetor[i] > 0 then
    begin
      case i of
        1: QRlabel30.Caption := vCodBarra[1];
        2: QRlabel31.Caption := vCodBarra[2];
        3: QRlabel32.Caption := vCodBarra[3];
        4: QRlabel33.Caption := vCodBarra[4];
      end;
    end;
  end;
  QRLabel71.Caption := '';
  QRLabel72.Caption := '';
  DM1.tProduto.IndexFieldNames := 'Codigo';
  DM1.tProduto.SetKey;
  DM1.tProdutoCodigo.AsInteger := DM1.tTalaoMICodProduto.AsInteger;
  if DM1.tProduto.GotoKey then
  begin
    QrImage1.Picture := nil;
    if FileExists(DM1.tProdutoEndFoto.AsString) then
      QRImage1.Picture.LoadFromFile(DM1.tProdutoEndFoto.AsString)
    else
    if DM1.tProdutoFotoJpeg.IsNull then
      QrImage1.Picture := nil
    else
    begin
      if vMetodoNovo_Imagem then
        prc_Carrega_Imagem(QRImage1)
      else
        Le_Imagem_JPEG(DM1.tProdutoFotoJpeg,QRImage1);
    end;
    DM1.tConstrucao.IndexFieldNames := 'Codigo';
    DM1.tConstrucao.SetKey;
    DM1.tConstrucaoCodigo.AsInteger := DM1.tProdutoCodConstrucao.AsInteger;
    if DM1.tConstrucao.GotoKey then
      QRLabel71.Caption := DM1.tConstrucaoNome.AsString;
    DM1.tMaterial.IndexFieldNames := 'Codigo';
    DM1.tMaterial.SetKey;
    DM1.tMaterialCodigo.AsInteger := DM1.tProdutoCodForma.AsInteger;
    if DM1.tMaterial.GotoKey then
      QRLabel72.Caption := DM1.tMaterialNome.AsString;
  end;
  for posicao := 1 to 28 do
  begin
    TQRLabel(FindComponent('Mat'+IntToStr(Posicao))).Enabled  := False;
    TQRLabel(FindComponent('Cons'+IntToStr(Posicao))).Enabled := False;
    case fConsLote.RadioGroup3.ItemIndex of
      0: vTamFonte := 7;
      1: vTamFonte := 8;
    end;
    TQRLabel(FindComponent('Mat'+IntToStr(Posicao))).Font.Size  := vTamFonte;
    TQRLabel(FindComponent('Cons'+IntToStr(Posicao))).Font.Size := vTamFonte;
  end;
  vTexto1 := '';
  DM1.tPedido.IndexFieldNames := 'Pedido';
  DM1.tPedido.SetKey;
  DM1.tPedidoPedido.AsInteger := DM1.tTalaoMINumPedido.AsInteger;
  if DM1.tPedido.GotoKey then
  begin
    Posicao                         := 0;
    DM1.tPedidoItem.IndexFieldNames := 'Pedido;Item';
    DM1.tPedidoItem.SetKey;
    DM1.tPedidoItemPedido.AsInteger := DM1.tTalaoMINumPedido.AsInteger;
    DM1.tPedidoItemItem.AsInteger   := DM1.tTalaoMIItemPedido.AsInteger;
    if DM1.tPedidoItem.GotoKey then
    begin
      DM1.tPedidoMaterial.First;
      while not DM1.tPedidoMaterial.Eof do
      begin
        if DM1.tPedidoMaterialImpTalao.AsString = 'S' then
        begin
          inc(Posicao);
          if Posicao > 28 then
            //vTexto1 := vTexto1 + ', ' + DM1.tTalaoItem.AsString;
            //ShowMessage('Existe mais de 28 materiais!')
            DM1.tPedidoMaterial.Last
          else
          begin
            TQRLabel(FindComponent('Mat' + IntToStr(Posicao))).Enabled  := True;
            TQRLabel(FindComponent('Mat' + IntToStr(Posicao))).Caption  := DM1.tPedidoMateriallkNomePosicao.AsString + '/' +
                                                                           DM1.tPedidoMateriallkNomeMaterial.AsString + '/' +
                                                                           DM1.tPedidoMateriallkNomeCor.AsString;
            TQRLabel(FindComponent('Cons' + IntToStr(Posicao))).Enabled := True;
            TQRLabel(FindComponent('Cons' + IntToStr(Posicao))).Caption := FormatFloat('##,##0.00000',DM1.tPedidoMaterialConsumoPr.AsFloat * DM1.tTalaoMIQtdPar.AsFloat);
          end;
        end;
        DM1.tPedidoMaterial.Next;
      end;
    end;
  end;
  QRLabel26.Enabled := False;
  for posicao := 1 to 15 do
  begin
    TQRLabel(FindComponent('Tam'+IntToStr(Posicao))).Enabled  := False;
    TQRLabel(FindComponent('Qtd'+IntToStr(Posicao))).Enabled  := False;
    TQRLabel(FindComponent('Marc'+IntToStr(Posicao))).Enabled  := False;
  end;
  DM1.tTalaoGradeMI.First;
  Posicao := 0;
  while not DM1.tTalaoGradeMI.EOF do
  begin
    if DM1.tTalaoGradeMIQtdPar.AsInteger > 0 then
    begin
      Inc(Posicao);
      if Posicao > 15 then
      begin
        ShowMessage('Existe mais de 15 tamanhos!');
        DM1.tTalaoGradeMI.Last;
      end
      else
      begin
        TQRLabel(FindComponent('Tam' + IntToStr(Posicao))).Enabled := True;
        TQRLabel(FindComponent('Tam' + IntToStr(Posicao))).Caption := DM1.tTalaoGradeMIlkTamanho.AsString;
        TQRLabel(FindComponent('Qtd' + IntToStr(Posicao))).Enabled := True;
        TQRLabel(FindComponent('Qtd' + IntToStr(Posicao))).Caption := DM1.tTalaoGradeMIQtdPar.AsString;
        if DM1.tTalaoGradeMIlkMarcarTam.AsString <> '' then
        begin
          QRLabel26.Enabled := True;
          TQRLabel(FindComponent('Marc' + IntToStr(Posicao))).Enabled := True;
          TQRLabel(FindComponent('Marc' + IntToStr(Posicao))).Caption := DM1.tTalaoGradeMIlkMarcarTam.AsString;
        end;
      end;
    end;
    DM1.tTalaoGradeMI.Next;
  end;
end;

procedure TfRelTalaoMI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelTalaoMI.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
 i: Integer;
begin
  for i := 1 to 4 do
    vCodSetor[i] := 0;
  DM1.tLoteSetorMI.First;
  while not DM1.tLoteSetorMI.Eof do
  begin
    Mostra_Setores;
    case DM1.tLoteSetorMIItem.AsInteger of
      1: Setor1.Caption := DM1.tLoteSetorMIlkNomeSetor.AsString;
      2: Setor2.Caption := DM1.tLoteSetorMIlkNomeSetor.AsString;
      3: Setor3.Caption := DM1.tLoteSetorMIlkNomeSetor.AsString;
      4: Setor4.Caption := DM1.tLoteSetorMIlkNomeSetor.AsString;
    end;
    vCodSetor[DM1.tLoteSetorMIItem.AsInteger] := DM1.tLoteSetorMICodSetor.AsInteger;
    DM1.tLoteSetorMI.Next;
  end;
end;

procedure TfRelTalaoMI.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  posicao: integer;
  vTamFonte: Integer;
  vImpMarca : Boolean;
begin
  QRImage6.Picture := nil;
  QRImage7.Picture := nil;
  AQtdTamIntervalo.Caption := '';
  BQtdTamIntervalo.Caption := '';
  DM1.tProduto.IndexFieldNames := 'Codigo';
  DM1.tProduto.FindKey([DM1.tTalaoMICodProduto.AsInteger]);
  if FileExists(DM1.tProdutoEndFoto.AsString) then
  begin
    QRImage6.Picture.LoadFromFile(DM1.tProdutoEndFoto.AsString);
    QRImage7.Picture.LoadFromFile(DM1.tProdutoEndFoto.AsString);
  end
  else
  if not DM1.tProdutoFotoJpeg.IsNull then
  begin
    begin
      if vMetodoNovo_Imagem then
      begin
        prc_Carrega_Imagem(QRImage6);
        prc_Carrega_Imagem(QRImage7);
      end
      else
      begin
        Le_Imagem_JPEG(DM1.tProdutoFotoJpeg,QRImage6);
        Le_Imagem_JPEG(DM1.tProdutoFotoJpeg,QRImage7);
      end;
    end;

  end;
  for posicao := 1 to 28 do
  begin
    TQRLabel(FindComponent('AMat'+IntToStr(Posicao))).Enabled  := False;
    TQRLabel(FindComponent('ACons'+IntToStr(Posicao))).Enabled := False;
    TQRLabel(FindComponent('BMat'+IntToStr(Posicao))).Enabled  := False;
    TQRLabel(FindComponent('BCons'+IntToStr(Posicao))).Enabled := False;

    case fConsLote.RadioGroup3.ItemIndex of
      0: vTamFonte := 7;
      1: vTamFonte := 8;
    end;
    TQRLabel(FindComponent('AMat'+IntToStr(Posicao))).Font.Size  := vTamFonte;
    TQRLabel(FindComponent('ACons'+IntToStr(Posicao))).Font.Size := vTamFonte;
  end;
  DM1.tPedido.IndexFieldNames := 'Pedido';
  DM1.tPedido.SetKey;
  DM1.tPedidoPedido.AsInteger := DM1.tTalaoMINumPedido.AsInteger;
  if DM1.tPedido.GotoKey then
  begin
    Posicao                         := 0;
    DM1.tPedidoItem.IndexFieldNames := 'Pedido;Item';
    DM1.tPedidoItem.SetKey;
    DM1.tPedidoItemPedido.AsInteger := DM1.tTalaoMINumPedido.AsInteger;
    DM1.tPedidoItemItem.AsInteger   := DM1.tTalaoMIItemPedido.AsInteger;
    if DM1.tPedidoItem.GotoKey then
    begin
      DM1.tPedidoMaterial.First;
      while not DM1.tPedidoMaterial.Eof do
      begin
        if DM1.tPedidoMaterialImpTalao.AsString = 'S' then
        begin
          inc(Posicao);
          if Posicao > 28 then
            //ShowMessage('Existe mais de 28 materiais!')
            DM1.tPedidoMaterial.Last
          else
          begin
            TQRLabel(FindComponent('AMat' + IntToStr(Posicao))).Enabled  := True;
            TQRLabel(FindComponent('BMat' + IntToStr(Posicao))).Enabled  := True;
            TQRLabel(FindComponent('AMat' + IntToStr(Posicao))).Caption  := DM1.tPedidoMateriallkNomePosicao.AsString + '/' +
                                                                            DM1.tPedidoMateriallkNomeMaterial.AsString + '/' +
                                                                            DM1.tPedidoMateriallkNomeCor.AsString;
            TQRLabel(FindComponent('BMat' + IntToStr(Posicao))).Caption  := DM1.tPedidoMateriallkNomePosicao.AsString + '/' +
                                                                            DM1.tPedidoMateriallkNomeMaterial.AsString + '/' +
                                                                            DM1.tPedidoMateriallkNomeCor.AsString;
            TQRLabel(FindComponent('ACons' + IntToStr(Posicao))).Enabled := True;
            TQRLabel(FindComponent('BCons' + IntToStr(Posicao))).Enabled := True;
            TQRLabel(FindComponent('ACons' + IntToStr(Posicao))).Caption := FormatFloat('##,##0.00000',DM1.tPedidoMaterialConsumoPr.AsFloat * DM1.tTalaoMIQtdPar.AsFloat);
            TQRLabel(FindComponent('BCons' + IntToStr(Posicao))).Caption := FormatFloat('##,##0.00000',DM1.tPedidoMaterialConsumoPr.AsFloat * DM1.tTalaoMIQtdPar.AsFloat);
          end;
        end;
        DM1.tPedidoMaterial.Next;
      end;
    end;
  end;
  for posicao := 1 to 15 do
  begin
    TQRLabel(FindComponent('ATam'+IntToStr(Posicao))).Enabled  := False;
    TQRLabel(FindComponent('BTam'+IntToStr(Posicao))).Enabled  := False;
    TQRLabel(FindComponent('AQtd'+IntToStr(Posicao))).Enabled  := False;
    TQRLabel(FindComponent('BQtd'+IntToStr(Posicao))).Enabled  := False;
    TQRLabel(FindComponent('AMarc'+IntToStr(Posicao))).Enabled := False;
    TQRLabel(FindComponent('BMarc'+IntToStr(Posicao))).Enabled := False;
    TQRLabel(FindComponent('AInt'+IntToStr(Posicao))).Enabled  := False;
    TQRLabel(FindComponent('BInt'+IntToStr(Posicao))).Enabled  := False;
  end;
  vImpMarca := False;
  mAuxIntervalo.EmptyDataSet;
  mAuxIntervalo2.EmptyDataSet;
  DM1.tTalaoGradeMI.First;
  Posicao := 0;
  while not DM1.tTalaoGradeMI.EOF do
  begin
    if DM1.tTalaoGradeMIQtdPar.AsFloat > 0 then
    begin
      Inc(Posicao);
      if Posicao > 15 then
      begin
        ShowMessage('Existe mais que 15 tamanhos!');
        DM1.tTalaoGradeMI.Last;
      end
      else
      begin
        TQRLabel(FindComponent('ATam' + IntToStr(Posicao))).Enabled := True;
        TQRLabel(FindComponent('BTam' + IntToStr(Posicao))).Enabled := True;
        TQRLabel(FindComponent('ATam' + IntToStr(Posicao))).Caption := DM1.tTalaoGradeMIlkTamanho.AsString;
        TQRLabel(FindComponent('BTam' + IntToStr(Posicao))).Caption := DM1.tTalaoGradeMIlkTamanho.AsString;
        TQRLabel(FindComponent('AQtd' + IntToStr(Posicao))).Enabled := True;
        TQRLabel(FindComponent('BQtd' + IntToStr(Posicao))).Enabled := True;
        TQRLabel(FindComponent('AQtd' + IntToStr(Posicao))).Caption := DM1.tTalaoGradeMIQtdPar.AsString;
        TQRLabel(FindComponent('BQtd' + IntToStr(Posicao))).Caption := DM1.tTalaoGradeMIQtdPar.AsString;
        if DM1.tTalaoGradeMIlkMarcarTam.AsString <> '' then
        begin
          TQRLabel(FindComponent('AMarc' + IntToStr(Posicao))).Enabled := True;
          TQRLabel(FindComponent('BMarc' + IntToStr(Posicao))).Enabled := True;
          TQRLabel(FindComponent('AMarc' + IntToStr(Posicao))).Caption := DM1.tTalaoGradeMIlkMarcarTam.AsString;
          TQRLabel(FindComponent('BMarc' + IntToStr(Posicao))).Caption := DM1.tTalaoGradeMIlkMarcarTam.AsString;
          vImpMarca := True;
        end;
        //18/08/2015
        if trim(DM1.tTalaoGradeMIlkTamPalmInterna.AsString) <> '' then
        begin
          TQRLabel(FindComponent('AInt' + IntToStr(Posicao))).Enabled := True;
          TQRLabel(FindComponent('AInt' + IntToStr(Posicao))).Caption := DM1.tTalaoGradeMIlkTamPalmInterna.AsString;
          prc_Gravar_mAuxIntervalo(DM1.tTalaoGradeMIlkTamPalmInterna.AsString,'1',DM1.tTalaoGradeMIQtdPar.AsInteger);
        end;
        if trim(DM1.tTalaoGradeMIlkTamDebrum.AsString) <> '' then
        begin
          TQRLabel(FindComponent('BInt' + IntToStr(Posicao))).Enabled := True;
          TQRLabel(FindComponent('BInt' + IntToStr(Posicao))).Caption := DM1.tTalaoGradeMIlkTamDebrum.AsString;
          prc_Gravar_mAuxIntervalo(DM1.tTalaoGradeMIlkTamDebrum.AsString,'2',DM1.tTalaoGradeMIQtdPar.AsInteger);
        end;
      end;
    end;
    DM1.tTalaoGradeMI.Next;
  end;
  //18/08/2015
  mAuxIntervalo.First;
  while not mAuxIntervalo.Eof do
  begin
    if AQtdTamIntervalo.Caption <> '' then
      AQtdTamIntervalo.Caption := AQtdTamIntervalo.Caption + '   ';
    AQtdTamIntervalo.Caption := AQtdTamIntervalo.Caption + 'Tam: ' + mAuxIntervaloTamIntervalo.AsString + ' = ' + mAuxIntervaloQtd.AsString;
    mAuxIntervalo.Next;
  end;
  mAuxIntervalo2.First;
  while not mAuxIntervalo2.Eof do
  begin
    if BQtdTamIntervalo.Caption <> '' then
      BQtdTamIntervalo.Caption := BQtdTamIntervalo.Caption + '   ';
    BQtdTamIntervalo.Caption := BQtdTamIntervalo.Caption + 'Tam: ' + mAuxIntervalo2TamIntervalo.AsString + ' = ' + mAuxIntervalo2Qtd.AsString;
    mAuxIntervalo2.Next;
  end;
  QRLabel187.Enabled := vImpMarca;
  QRLabel193.Enabled := vImpMarca;
  //*********************************

  QRLabel73.Caption := '';
  QRLabel74.Caption := '';
  QRLabel75.Caption := '';
  QRLabel76.Caption := '';
  DM1.tProduto.IndexFieldNames := 'Codigo';
  DM1.tProduto.SetKey;
  DM1.tProdutoCodigo.AsInteger := DM1.tTalaoMICodProduto.AsInteger;
  if DM1.tProduto.GotoKey then
  begin
    DM1.tConstrucao.IndexFieldNames := 'Codigo';
    DM1.tConstrucao.SetKey;
    DM1.tConstrucaoCodigo.AsInteger := DM1.tProdutoCodConstrucao.AsInteger;
    if DM1.tConstrucao.GotoKey then
    begin
      QRLabel73.Caption := DM1.tConstrucaoNome.AsString;
      QRLabel75.Caption := DM1.tConstrucaoNome.AsString;
    end;
    DM1.tMaterial.IndexFieldNames := 'Codigo';
    DM1.tMaterial.SetKey;
    DM1.tMaterialCodigo.AsInteger := DM1.tProdutoCodForma.AsInteger;
    if DM1.tMaterial.GotoKey then
    begin
      QRLabel74.Caption := DM1.tMaterialNome.AsString;
      QRLabel76.Caption := DM1.tMaterialNome.AsString;
    end;
  end;
end;

procedure TfRelTalaoMI.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  posicao: Integer;
  vTamFonte: Integer;
  vImpMarca : Boolean;
begin
  QRImage8.Picture := nil;
  DM1.tProduto.FindKey([DM1.tTalaoMICodProduto.AsInteger]);
  if FileExists(DM1.tProdutoEndFoto.AsString) then
    QRImage8.Picture.LoadFromFile(DM1.tProdutoEndFoto.AsString)
  else
  if not DM1.tProdutoFotoJpeg.IsNull then
  begin
    if vMetodoNovo_Imagem then
      prc_Carrega_Imagem(QRImage8)
    else
      Le_Imagem_JPEG(DM1.tProdutoFotoJpeg,QRImage8);
  end;
  for posicao := 1 to 28 do
  begin
    TQRLabel(FindComponent('PMat'+IntToStr(Posicao))).Enabled  := False;
    TQRLabel(FindComponent('PCons'+IntToStr(Posicao))).Enabled := False;

    case fConsLote.RadioGroup3.ItemIndex of
      0: vTamFonte := 7;
      1: vTamFonte := 8;
    end;
    TQRLabel(FindComponent('PMat'+IntToStr(Posicao))).Font.Size  := vTamFonte;
    TQRLabel(FindComponent('PCons'+IntToStr(Posicao))).Font.Size := vTamFonte;
  end;
  DM1.tPedido.IndexFieldNames := 'Pedido';
  DM1.tPedido.SetKey;
  DM1.tPedidoPedido.AsInteger := DM1.tTalaoMINumPedido.AsInteger;
  if DM1.tPedido.GotoKey then
  begin
    Posicao                         := 0;
    DM1.tPedidoItem.IndexFieldNames := 'Pedido;Item';
    DM1.tPedidoItem.SetKey;
    DM1.tPedidoItemPedido.AsInteger := DM1.tTalaoMINumPedido.AsInteger;
    DM1.tPedidoItemItem.AsInteger   := DM1.tTalaoMIItemPedido.AsInteger;
    if DM1.tPedidoItem.GotoKey then
    begin
      DM1.tPedidoMaterial.First;
      while not DM1.tPedidoMaterial.Eof do
      begin
        if (DM1.tPedidoMaterialImpTalao.AsString = 'S') and (DM1.tPedidoMateriallkPre.AsBoolean) then
        begin
          inc(Posicao);
          if Posicao > 28 then
          begin
            ShowMessage('Existe mais de 28 materiais!');
            DM1.tPedidoMaterial.Last;
          end
          else
          begin
            TQRLabel(FindComponent('PMat' + IntToStr(Posicao))).Enabled  := True;
            TQRLabel(FindComponent('PMat' + IntToStr(Posicao))).Caption  := DM1.tPedidoMateriallkNomePosicao.AsString + '/' +
                                                                            DM1.tPedidoMateriallkNomeMaterial.AsString + '/' +
                                                                            DM1.tPedidoMateriallkNomeCor.AsString;
            TQRLabel(FindComponent('PCons' + IntToStr(Posicao))).Enabled := True;
            TQRLabel(FindComponent('PCons' + IntToStr(Posicao))).Caption := FormatFloat('##,##0.00000',DM1.tPedidoMaterialConsumoPr.AsFloat * DM1.tTalaoMIQtdPar.AsFloat);
          end;
        end;
        DM1.tPedidoMaterial.Next;
      end;
    end;
  end;
  //18/08/2015
  PQtdTamIntervalo.Caption := '';
  vImpMarca                := False;
  mAuxIntervalo.EmptyDataSet;
  mAuxIntervalo2.EmptyDataSet;
  //**************  
  for posicao := 1 to 15 do
  begin
    TQRLabel(FindComponent('PTam'+IntToStr(Posicao))).Enabled  := False;
    TQRLabel(FindComponent('PQtd'+IntToStr(Posicao))).Enabled  := False;
    TQRLabel(FindComponent('PMarc'+IntToStr(Posicao))).Enabled := False;
    TQRLabel(FindComponent('PInt'+IntToStr(Posicao))).Enabled  := False;
  end;
  DM1.tTalaoGradeMI.First;
  Posicao := 0;
  while not DM1.tTalaoGradeMI.EOF do
  begin
    if DM1.tTalaoGradeMIQtdPar.AsFloat > 0 then
    begin
      Inc(Posicao);
      if Posicao > 15 then
      begin
        ShowMessage('Existe mais que 15 tamanhos!');
        DM1.tTalaoGradeMI.Last;
      end
      else
      begin
        TQRLabel(FindComponent('PTam' + IntToStr(Posicao))).Enabled := True;
        TQRLabel(FindComponent('PTam' + IntToStr(Posicao))).Caption := DM1.tTalaoGradeMIlkTamanho.AsString;
        TQRLabel(FindComponent('PQtd' + IntToStr(Posicao))).Enabled := True;
        TQRLabel(FindComponent('PQtd' + IntToStr(Posicao))).Caption := DM1.tTalaoGradeMIQtdPar.AsString;
        if DM1.tTalaoGradeMIlkMarcarTam.AsString <> '' then
        begin
          TQRLabel(FindComponent('PMarc' + IntToStr(Posicao))).Enabled := True;
          TQRLabel(FindComponent('PMarc' + IntToStr(Posicao))).Caption := DM1.tTalaoGradeMIlkMarcarTam.AsString;
          vImpMarca := True;
        end;
        //18/08/2015
        if trim(DM1.tTalaoGradeMIlkTamPre.AsString) <> '' then
        begin
          TQRLabel(FindComponent('PInt' + IntToStr(Posicao))).Enabled := True;
          TQRLabel(FindComponent('PInt' + IntToStr(Posicao))).Caption := DM1.tTalaoGradeMIlkTamPre.AsString;
          prc_Gravar_mAuxIntervalo(DM1.tTalaoGradeMIlkTamPre.AsString,'1',DM1.tTalaoGradeMIQtdPar.AsInteger);
        end;
      end;
    end;
    DM1.tTalaoGradeMI.Next;
  end;
  //18/08/2015
  QRLabel189.Enabled := vImpMarca;
  mAuxIntervalo.First;
  while not mAuxIntervalo.Eof do
  begin
    if PQtdTamIntervalo.Caption <> '' then
      PQtdTamIntervalo.Caption := PQtdTamIntervalo.Caption + '   ';
    PQtdTamIntervalo.Caption := PQtdTamIntervalo.Caption + 'Tam: ' + mAuxIntervaloTamIntervalo.AsString + ' = ' + mAuxIntervaloQtd.AsString;
    mAuxIntervalo.Next;
  end;
  //******************

  QRLabel320.Caption := '';
  QRLabel321.Caption := '';
  DM1.tProduto.IndexFieldNames := 'Codigo';
  DM1.tProduto.SetKey;
  DM1.tProdutoCodigo.AsInteger := DM1.tTalaoMICodProduto.AsInteger;
  if DM1.tProduto.GotoKey then
  begin
    DM1.tConstrucao.IndexFieldNames := 'Codigo';
    DM1.tConstrucao.SetKey;
    DM1.tConstrucaoCodigo.AsInteger := DM1.tProdutoCodConstrucao.AsInteger;
    if DM1.tConstrucao.GotoKey then
      QRLabel320.Caption := DM1.tConstrucaoNome.AsString;
    DM1.tMaterial.IndexFieldNames := 'Codigo';
    DM1.tMaterial.SetKey;
    DM1.tMaterialCodigo.AsInteger := DM1.tProdutoCodForma.AsInteger;
    if DM1.tMaterial.GotoKey then
      QRLabel321.Caption := DM1.tMaterialNome.AsString;
  end;
end;

procedure TfRelTalaoMI.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  posicao: Integer;
  vTamFonte: Integer;
  vImpMarca : Boolean;
begin
  QRImage9.Picture  := nil;
  QRImage10.Picture := nil;
  DM1.tProduto.FindKey([DM1.tTalaoMICodProduto.AsInteger]);
  if FileExists(DM1.tProdutoEndFoto.AsString) then
  begin
    QRImage9.Picture.LoadFromFile(DM1.tProdutoEndFoto.AsString);
    QRImage10.Picture.LoadFromFile(DM1.tProdutoEndFoto.AsString);
  end
  else
  if not DM1.tProdutoFotoJpeg.IsNull then
  begin
    if vMetodoNovo_Imagem then
    begin
      prc_Carrega_Imagem(QRImage9);
      prc_Carrega_Imagem(QRImage10);
    end
    else
    begin
      Le_Imagem_JPEG(DM1.tProdutoFotoJpeg,QRImage9);
      Le_Imagem_JPEG(DM1.tProdutoFotoJpeg,QRImage10);
    end;
  end;
  for posicao := 1 to 28 do
  begin
    TQRLabel(FindComponent('CMat'+IntToStr(Posicao))).Enabled  := False;
    TQRLabel(FindComponent('CCons'+IntToStr(Posicao))).Enabled := False;
    TQRLabel(FindComponent('DMat'+IntToStr(Posicao))).Enabled  := False;
    TQRLabel(FindComponent('DCons'+IntToStr(Posicao))).Enabled := False;

    case fConsLote.RadioGroup3.ItemIndex of
      0: vTamFonte := 7;
      1: vTamFonte := 8;
    end;
    TQRLabel(FindComponent('CMat'+IntToStr(Posicao))).Font.Size  := vTamFonte;
    TQRLabel(FindComponent('CCons'+IntToStr(Posicao))).Font.Size := vTamFonte;
    TQRLabel(FindComponent('DMat'+IntToStr(Posicao))).Font.Size  := vTamFonte;
    TQRLabel(FindComponent('DCons'+IntToStr(Posicao))).Font.Size := vTamFonte;
  end;
  DM1.tPedido.IndexFieldNames := 'Pedido';
  DM1.tPedido.SetKey;
  DM1.tPedidoPedido.AsInteger := DM1.tTalaoMINumPedido.AsInteger;
  if DM1.tPedido.GotoKey then
  begin
    Posicao                         := 0;
    DM1.tPedidoItem.IndexFieldNames := 'Pedido;Item';
    DM1.tPedidoItem.SetKey;
    DM1.tPedidoItemPedido.AsInteger := DM1.tTalaoMINumPedido.AsInteger;
    DM1.tPedidoItemItem.AsInteger   := DM1.tTalaoMIItemPedido.AsInteger;
    if DM1.tPedidoItem.GotoKey then
    begin
      DM1.tPedidoMaterial.First;
      while not DM1.tPedidoMaterial.Eof do
      begin
        if (DM1.tPedidoMaterialImpTalao.AsString = 'S') and (DM1.tPedidoMateriallkPre.AsBoolean) then
        begin
          inc(Posicao);
          if Posicao > 28 then
          begin
            ShowMessage('Existe mais de 28 materiais!');
            DM1.tPedidoMaterial.Last;
          end
          else
          begin
            TQRLabel(FindComponent('CMat' + IntToStr(Posicao))).Enabled  := True;
            TQRLabel(FindComponent('CMat' + IntToStr(Posicao))).Caption  := DM1.tPedidoMateriallkNomePosicao.AsString + '/' +
                                                                            DM1.tPedidoMateriallkNomeMaterial.AsString + '/' +
                                                                            DM1.tPedidoMateriallkNomeCor.AsString;
            TQRLabel(FindComponent('CCons' + IntToStr(Posicao))).Enabled := True;
            TQRLabel(FindComponent('CCons' + IntToStr(Posicao))).Caption := FormatFloat('##,##0.00000',DM1.tPedidoMaterialConsumoPr.AsFloat * DM1.tTalaoMIQtdPar.AsFloat);

            TQRLabel(FindComponent('DMat' + IntToStr(Posicao))).Enabled  := True;
            TQRLabel(FindComponent('DMat' + IntToStr(Posicao))).Caption  := DM1.tPedidoMateriallkNomePosicao.AsString + '/' +
                                                                            DM1.tPedidoMateriallkNomeMaterial.AsString + '/' +
                                                                            DM1.tPedidoMateriallkNomeCor.AsString;
            TQRLabel(FindComponent('DCons' + IntToStr(Posicao))).Enabled := True;
            TQRLabel(FindComponent('DCons' + IntToStr(Posicao))).Caption := FormatFloat('##,##0.00000',DM1.tPedidoMaterialConsumoPr.AsFloat * DM1.tTalaoMIQtdPar.AsFloat);
          end;
        end;
        DM1.tPedidoMaterial.Next;
      end;
    end;
  end;
  QRLabel11.Enabled  := False;

  for posicao := 1 to 15 do
  begin
    TQRLabel(FindComponent('CTam'+IntToStr(Posicao))).Enabled  := False;
    TQRLabel(FindComponent('CQtd'+IntToStr(Posicao))).Enabled  := False;
    TQRLabel(FindComponent('DTam'+IntToStr(Posicao))).Enabled  := False;
    TQRLabel(FindComponent('DQtd'+IntToStr(Posicao))).Enabled  := False;
    TQRLabel(FindComponent('CMarc'+IntToStr(Posicao))).Enabled := False;
    TQRLabel(FindComponent('DMarc'+IntToStr(Posicao))).Enabled := False;
    TQRLabel(FindComponent('CInt'+IntToStr(Posicao))).Enabled := False;
    TQRLabel(FindComponent('DInt'+IntToStr(Posicao))).Enabled := False;
  end;

  //18/08/2015
  CQtdTamIntervalo.Caption := '';
  DQtdTamIntervalo.Caption := '';
  vImpMarca                := False;
  mAuxIntervalo.EmptyDataSet;
  mAuxIntervalo2.EmptyDataSet;
  //******************
  DM1.tTalaoGradeMI.First;
  Posicao := 0;
  while not DM1.tTalaoGradeMI.EOF do
  begin
    if DM1.tTalaoGradeMIQtdPar.AsFloat > 0 then
    begin
      Inc(Posicao);
      if Posicao > 15 then
      begin
        ShowMessage('Existe mais que 15 tamanhos!');
        DM1.tTalaoGradeMI.Last;
      end
      else
      begin
        TQRLabel(FindComponent('CTam' + IntToStr(Posicao))).Enabled := True;
        TQRLabel(FindComponent('CTam' + IntToStr(Posicao))).Caption := DM1.tTalaoGradeMIlkTamanho.AsString;
        TQRLabel(FindComponent('CQtd' + IntToStr(Posicao))).Enabled := True;
        TQRLabel(FindComponent('CQtd' + IntToStr(Posicao))).Caption := DM1.tTalaoGradeMIQtdPar.AsString;

        TQRLabel(FindComponent('DTam' + IntToStr(Posicao))).Enabled := True;
        TQRLabel(FindComponent('DTam' + IntToStr(Posicao))).Caption := DM1.tTalaoGradeMIlkTamanho.AsString;
        TQRLabel(FindComponent('DQtd' + IntToStr(Posicao))).Enabled := True;
        TQRLabel(FindComponent('DQtd' + IntToStr(Posicao))).Caption := DM1.tTalaoGradeMIQtdPar.AsString;

        if DM1.tTalaoGradeMIlkMarcarTam.AsString <> '' then
        begin
          QRLabel11.Enabled := True;
          TQRLabel(FindComponent('CMarc' + IntToStr(Posicao))).Enabled := True;
          TQRLabel(FindComponent('CMarc' + IntToStr(Posicao))).Caption := DM1.tTalaoGradeMIlkMarcarTam.AsString;
          TQRLabel(FindComponent('DMarc' + IntToStr(Posicao))).Enabled := True;
          TQRLabel(FindComponent('DMarc' + IntToStr(Posicao))).Caption := DM1.tTalaoGradeMIlkMarcarTam.AsString;
          vImpMarca := True;
        end;
        //18/08/2015
        if trim(DM1.tTalaoGradeMIlkTamCapaSalto.AsString) <> '' then
        begin
          TQRLabel(FindComponent('CInt' + IntToStr(Posicao))).Enabled := True;
          TQRLabel(FindComponent('CInt' + IntToStr(Posicao))).Caption := DM1.tTalaoGradeMIlkTamCapaSalto.AsString;
          prc_Gravar_mAuxIntervalo(DM1.tTalaoGradeMIlkTamCapaSalto.AsString,'1',DM1.tTalaoGradeMIQtdPar.AsInteger);
        end;
        if trim(DM1.tTalaoGradeMIlkTamCapaPlataforma.AsString) <> '' then
        begin
          TQRLabel(FindComponent('DInt' + IntToStr(Posicao))).Enabled := True;
          TQRLabel(FindComponent('DInt' + IntToStr(Posicao))).Caption := DM1.tTalaoGradeMIlkTamCapaPlataforma.AsString;
          prc_Gravar_mAuxIntervalo(DM1.tTalaoGradeMIlkTamCapaPlataforma.AsString,'2',DM1.tTalaoGradeMIQtdPar.AsInteger);
        end;
      end;
    end;
    DM1.tTalaoGradeMI.Next;
  end;
  //18/08/2015
  mAuxIntervalo.First;
  while not mAuxIntervalo.Eof do
  begin
    if CQtdTamIntervalo.Caption <> '' then
      CQtdTamIntervalo.Caption := CQtdTamIntervalo.Caption + '   ';
    CQtdTamIntervalo.Caption := CQtdTamIntervalo.Caption + 'Tam: ' + mAuxIntervaloTamIntervalo.AsString + ' = ' + mAuxIntervaloQtd.AsString;
    mAuxIntervalo.Next;
  end;
  mAuxIntervalo2.First;
  while not mAuxIntervalo2.Eof do
  begin     
    if DQtdTamIntervalo.Caption <> '' then
      DQtdTamIntervalo.Caption := DQtdTamIntervalo.Caption + '   ';
    DQtdTamIntervalo.Caption := DQtdTamIntervalo.Caption + 'Tam: ' + mAuxIntervalo2TamIntervalo.AsString + ' = ' + mAuxIntervalo2Qtd.AsString;
    mAuxIntervalo2.Next;
  end;
  QRLabel191.Enabled := vImpMarca;
  QRLabel194.Enabled := vImpMarca;
  //*********************************

  QRLabel347.Caption := '';
  QRLabel348.Caption := '';
  QRLabel349.Caption := '';
  QRLabel81.Caption  := '';

  DM1.tProduto.IndexFieldNames := 'Codigo';
  DM1.tProduto.SetKey;
  DM1.tProdutoCodigo.AsInteger := DM1.tTalaoMICodProduto.AsInteger;
  if DM1.tProduto.GotoKey then
  begin
    DM1.tConstrucao.IndexFieldNames := 'Codigo';
    DM1.tConstrucao.SetKey;
    DM1.tConstrucaoCodigo.AsInteger := DM1.tProdutoCodConstrucao.AsInteger;
    if DM1.tConstrucao.GotoKey then
      QRLabel347.Caption := DM1.tConstrucaoNome.AsString;
      QRLabel349.Caption := DM1.tConstrucaoNome.AsString;
    DM1.tMaterial.IndexFieldNames := 'Codigo';
    DM1.tMaterial.SetKey;
    DM1.tMaterialCodigo.AsInteger := DM1.tProdutoCodForma.AsInteger;
    if DM1.tMaterial.GotoKey then
      QRLabel348.Caption := DM1.tMaterialNome.AsString;
      QRLabel81.Caption  := DM1.tConstrucaoNome.AsString;
  end;
end;

procedure TfRelTalaoMI.prc_Carrega_Imagem(Foto: TQrImage);
var
  vBS: TStream;
  vJPG: TJPEGImage;
  vBMP: Graphics.TBitmap;
  vImagemTipo: String;
begin
  //vImagemTipo := pQry.Fields.FieldByName('IMAGEM_TIPO').AsString;
  vImagemTipo := 'JPG';
  vBS := DM1.tProduto.CreateBlobStream(DM1.tProduto.FieldByName('FotoJpeg'), bmREAD);
  if vBS.size > 0 then
  begin
    // JPEG
    if vImagemTipo = 'JPG' then
    begin
      vJPG := TJPEGImage.Create;
      vJPG.LoadFromStream(vBS);
      Foto.Picture.Assign(vJPG);
      //pImagem.Picture.Assign(vJPG);
      vJPG.Free;
    end;
    // BITMAP
   if vImagemTipo = 'BMP' then
    begin
      vBMP := Graphics.TBitmap.Create;
      vBMP.LoadFromStream(vBS);
      //pImagem.Picture.Assign(vBMP);
      Foto.Picture.Assign(vBMP);
      vBMP.Free;
    end;
  end;
  vBS.Destroy;
end;

procedure TfRelTalaoMI.prc_Gravar_mAuxIntervalo(Tamanho, Tipo: String; Qtd: Integer);
begin
  if Tipo = '1' then
  begin
    if mAuxIntervalo.Locate('TamIntervalo',Tamanho,[loCaseInsensitive]) then
      mAuxIntervalo.Edit
    else
    begin
      mAuxIntervalo.Insert;
      mAuxIntervaloTamIntervalo.AsString := Tamanho;
      mAuxIntervaloQtd.AsInteger         := 0;
    end;
    mAuxIntervaloQtd.AsInteger := mAuxIntervaloQtd.AsInteger + Qtd;
    mAuxIntervalo.Post;
  end
  else
  if Tipo = '2' then
  begin
    if mAuxIntervalo2.Locate('TamIntervalo',Tamanho,[loCaseInsensitive]) then
      mAuxIntervalo2.Edit
    else
    begin
      mAuxIntervalo2.Insert;
      mAuxIntervalo2TamIntervalo.AsString := Tamanho;
      mAuxIntervalo2Qtd.AsInteger         := 0;
    end;
    mAuxIntervalo2Qtd.AsInteger := mAuxIntervalo2Qtd.AsInteger + Qtd;
    mAuxIntervalo2.Post;
  end;
end;

end.


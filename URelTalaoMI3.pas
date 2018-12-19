unit URelTalaoMI3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, QuickRpt, Qrctrls, JPEG,
  DB, DBTables, DBClient, Barcode;

type
  TfRelTalaoMI3 = class(TForm)
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
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel86: TQRLabel;
    QRDBText83: TQRDBText;
    QRLabel87: TQRLabel;
    QRDBText84: TQRDBText;
    QRLabel129: TQRLabel;
    QRDBText92: TQRDBText;
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
    mAuxIntervalo: TClientDataSet;
    mAuxIntervaloTamIntervalo: TStringField;
    mAuxIntervaloQtd: TIntegerField;
    AQtdTamIntervalo: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape1: TQRShape;
    QRImage2: TQRImage;
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
    QRLabel21: TQRLabel;
    QRDBText18: TQRDBText;
    QRImage3: TQRImage;
    QRShape35: TQRShape;
    Setor3: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText21: TQRDBText;
    QRImage4: TQRImage;
    QRShape36: TQRShape;
    Setor4: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel29: TQRLabel;
    QRDBText24: TQRDBText;
    QRImage5: TQRImage;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText19: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel77: TQRLabel;
    QRDBText55: TQRDBText;
    QRLabel78: TQRLabel;
    QRDBText56: TQRDBText;
    QRLabel79: TQRLabel;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRLabel80: TQRLabel;
    QRLabel82: TQRLabel;
    QRDBText79: TQRDBText;
    QRDBText80: TQRDBText;
    QRLabel83: TQRLabel;
    QRDBText81: TQRDBText;
    QRLabel84: TQRLabel;
    QRDBText82: TQRDBText;
    QRLabel85: TQRLabel;
    Barcode1: TBarcode;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep2BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
     vJPG: TJPEGImage;
     vBMP: TBitMap;
     vCodSetor: array [1..4] of integer;
     procedure prc_Carrega_Imagem(Foto: TQrImage);
     procedure prc_Gravar_mAuxIntervalo(Tamanho, Tipo : String ; Qtd : Integer); //Tipo 1= mAuxIntervalo   2= mAuxIntervalo2
     procedure prc_Monta_Setores;
     procedure prc_Visible_Setores;
     procedure Mostra_Setores;
  public
    vMetodoNovo_Imagem: Boolean;
    vTitulo_Via : String;
    //vCodTitulo_Via : Integer;
    { Public declarations }
  end;

var
  fRelTalaoMI3: TfRelTalaoMI3;

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

procedure TfRelTalaoMI3.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelTalaoMI3.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  posicao: integer;
  vTamFonte: Integer;
  vImpMarca : Boolean;
  vTamIntervalo : String;
  vImpMat : Boolean;
begin
  //QRLabel173.Caption := vTitulo_Via;
  PrintBand := True;
  if not DM1.tTalaoMI.FindKey([fConsLote.mAuxImpLote.AsInteger,fConsLote.mAuxImpItem.AsInteger]) then
  begin
    ShowMessage('Talão: ' + fConsLote.mAuxImpItem.AsString + ', não encontrado!');
    PrintBand := False;
    exit;
  end;

  prc_Visible_Setores;
  if fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0 then
    prc_Monta_Setores;

  QRImage6.Picture := nil;
  AQtdTamIntervalo.Caption := '';
  DM1.tProduto.IndexFieldNames := 'Codigo';
  DM1.tProduto.FindKey([DM1.tTalaoMICodProduto.AsInteger]);
  if FileExists(DM1.tProdutoEndFoto.AsString) then
  begin
    QRImage6.Picture.LoadFromFile(DM1.tProdutoEndFoto.AsString);
  end
  else
  if not DM1.tProdutoFotoJpeg.IsNull then
  begin
    begin
      if vMetodoNovo_Imagem then
        prc_Carrega_Imagem(QRImage6)
      else
        Le_Imagem_JPEG(DM1.tProdutoFotoJpeg,QRImage6);
    end;
  end;
  for posicao := 1 to 28 do
  begin
    TQRLabel(FindComponent('AMat'+IntToStr(Posicao))).Enabled  := False;
    TQRLabel(FindComponent('ACons'+IntToStr(Posicao))).Enabled := False;

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
        vImpMat := False;
        if DM1.tPedidoMaterialImpTalao.AsString = 'S' then
        begin
          case fConsLote.mAuxImpCodTitulo_Via.AsInteger of
            0 : vImpMat := True;
            1 : vImpMat := DM1.tPedidoMateriallkPre.AsBoolean;
            2 : vImpMat := (PosEx('FORRO',DM1.tPedidoMateriallkNomePosicao.AsString) > 0);
            3 : vImpMat := ((DM1.tPedidoMaterialCodPosicao.AsInteger = 100) or (DM1.tPedidoMaterialCodPosicao.AsInteger = 54) or (DM1.tPedidoMaterialCodPosicao.AsInteger = 129));
            4 : vImpMat := ((DM1.tPedidoMaterialCodPosicao.AsInteger = 98) or (DM1.tPedidoMaterialCodPosicao.AsInteger = 185) or (DM1.tPedidoMaterialCodPosicao.AsInteger = 192));
            5 : vImpMat := ((DM1.tPedidoMaterialCodPosicao.AsInteger = 26) or (DM1.tPedidoMaterialCodPosicao.AsInteger = 62) or (DM1.tPedidoMaterialCodPosicao.AsInteger = 286));
            6 : vImpMat := ((DM1.tPedidoMaterialCodPosicao.AsInteger = 109) or (DM1.tPedidoMaterialCodPosicao.AsInteger = 320) or (DM1.tPedidoMaterialCodPosicao.AsInteger = 321)
                         or (DM1.tPedidoMaterialCodPosicao.AsInteger = 1) or (DM1.tPedidoMaterialCodPosicao.AsInteger = 02) or (DM1.tPedidoMaterialCodPosicao.AsInteger = 93));
            7 : vImpMat := ((DM1.tPedidoMaterialCodPosicao.AsInteger = 37) or (DM1.tPedidoMaterialCodPosicao.AsInteger = 239) or (DM1.tPedidoMaterialCodPosicao.AsInteger = 342)
                         or (DM1.tPedidoMaterialCodPosicao.AsInteger = 320) or (DM1.tPedidoMaterialCodPosicao.AsInteger = 321));
            8 : vImpMat := ((DM1.tPedidoMaterialCodPosicao.AsInteger = 88) or (DM1.tPedidoMaterialCodPosicao.AsInteger = 144));
            9 : vImpMat := ((DM1.tPedidoMaterialCodPosicao.AsInteger = 193) or (DM1.tPedidoMaterialCodPosicao.AsInteger = 288));
           10 : vImpMat := (DM1.tPedidoMaterialCodPosicao.AsInteger = 33);
          end;
        end;
        //if DM1.tPedidoMaterialImpTalao.AsString = 'S' then
        if vImpMat then
        begin
          inc(Posicao);
          if Posicao > 28 then
            //ShowMessage('Existe mais de 28 materiais!')
            DM1.tPedidoMaterial.Last
          else
          begin
            TQRLabel(FindComponent('AMat' + IntToStr(Posicao))).Enabled  := True;
            TQRLabel(FindComponent('AMat' + IntToStr(Posicao))).Caption  := DM1.tPedidoMateriallkNomePosicao.AsString + '/' +
                                                                            DM1.tPedidoMateriallkNomeMaterial.AsString + '/' +
                                                                            DM1.tPedidoMateriallkNomeCor.AsString;
            TQRLabel(FindComponent('ACons' + IntToStr(Posicao))).Enabled := True;
            TQRLabel(FindComponent('ACons' + IntToStr(Posicao))).Caption := FormatFloat('##,##0.00000',DM1.tPedidoMaterialConsumoPr.AsFloat * DM1.tTalaoMIQtdPar.AsFloat);
          end;
        end;
        DM1.tPedidoMaterial.Next;
      end;
    end;
  end;
  for posicao := 1 to 15 do
  begin
    TQRLabel(FindComponent('ATam'+IntToStr(Posicao))).Enabled  := False;
    TQRLabel(FindComponent('AQtd'+IntToStr(Posicao))).Enabled  := False;
    TQRLabel(FindComponent('AMarc'+IntToStr(Posicao))).Enabled := False;
    TQRLabel(FindComponent('AInt'+IntToStr(Posicao))).Enabled  := False;
  end;
  vImpMarca := False;
  mAuxIntervalo.EmptyDataSet;
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
        TQRLabel(FindComponent('ATam' + IntToStr(Posicao))).Caption := DM1.tTalaoGradeMIlkTamanho.AsString;
        TQRLabel(FindComponent('AQtd' + IntToStr(Posicao))).Enabled := True;
        TQRLabel(FindComponent('AQtd' + IntToStr(Posicao))).Caption := DM1.tTalaoGradeMIQtdPar.AsString;
        if DM1.tTalaoGradeMIlkMarcarTam.AsString <> '' then
        begin
          TQRLabel(FindComponent('AMarc' + IntToStr(Posicao))).Enabled := True;
          TQRLabel(FindComponent('AMarc' + IntToStr(Posicao))).Caption := DM1.tTalaoGradeMIlkMarcarTam.AsString;
          vImpMarca := True;
        end;
        //18/08/2015
        vTamIntervalo := '';
        if (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 1) and (trim(DM1.tTalaoGradeMIlkTamPre.AsString) <> '') then
          vTamIntervalo := DM1.tTalaoGradeMIlkTamPre.AsString
        else
        if (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 2) and (trim(DM1.tTalaoGradeMIlkTamForro.AsString) <> '') then
          vTamIntervalo := DM1.tTalaoGradeMIlkTamForro.AsString
        else
        if (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 3) and (trim(DM1.tTalaoGradeMIlkTamPalmInterna.AsString) <> '') then
          vTamIntervalo := DM1.tTalaoGradeMIlkTamPalmInterna.AsString
        else
        if (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 4) and (trim(DM1.tTalaoGradeMIlkTamDebrum.AsString) <> '') then
          vTamIntervalo := DM1.tTalaoGradeMIlkTamDebrum.AsString
        else
        if (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 5) and (trim(DM1.tTalaoGradeMIlkTamBiqueira.AsString) <> '') then
          vTamIntervalo := DM1.tTalaoGradeMIlkTamBiqueira.AsString
        else
        if (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 6) and (trim(DM1.tTalaoGradeMIlkTamCapaSalto.AsString) <> '') then
          vTamIntervalo := DM1.tTalaoGradeMIlkTamCapaSalto.AsString
        else
        if (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 7) and (trim(DM1.tTalaoGradeMIlkTamCapaPlataforma.AsString) <> '') then
          vTamIntervalo := DM1.tTalaoGradeMIlkTamCapaPlataforma.AsString
        else
        if (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 8) and (trim(DM1.tTalaoGradeMIlkTamTaloneira.AsString) <> '') then
          vTamIntervalo := DM1.tTalaoGradeMIlkTamTaloneira.AsString
        else
        if (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 9) and (trim(DM1.tTalaoGradeMIlkTamEspuma.AsString) <> '') then
          vTamIntervalo := DM1.tTalaoGradeMIlkTamEspuma.AsString
        else
        if (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 10) and (trim(DM1.tTalaoGradeMIlkTamAvesso.AsString) <> '') then
          vTamIntervalo := DM1.tTalaoGradeMIlkTamAvesso.AsString;
        if trim(vTamIntervalo) <> '' then
        begin
          TQRLabel(FindComponent('AInt' + IntToStr(Posicao))).Enabled := True;
          TQRLabel(FindComponent('AInt' + IntToStr(Posicao))).Caption := vTamIntervalo;
          prc_Gravar_mAuxIntervalo(vTamIntervalo,'1',DM1.tTalaoGradeMIQtdPar.AsInteger);
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
  QRLabel187.Enabled := vImpMarca;
  //*********************************

  QRLabel73.Caption := '';
  QRLabel74.Caption := '';
  DM1.tProduto.IndexFieldNames := 'Codigo';
  DM1.tProduto.SetKey;
  DM1.tProdutoCodigo.AsInteger := DM1.tTalaoMICodProduto.AsInteger;
  if DM1.tProduto.GotoKey then
  begin
    DM1.tConstrucao.IndexFieldNames := 'Codigo';
    DM1.tConstrucao.SetKey;
    DM1.tConstrucaoCodigo.AsInteger := DM1.tProdutoCodConstrucao.AsInteger;
    if DM1.tConstrucao.GotoKey then
      QRLabel73.Caption := DM1.tConstrucaoNome.AsString;
    DM1.tMaterial.IndexFieldNames := 'Codigo';
    DM1.tMaterial.SetKey;
    DM1.tMaterialCodigo.AsInteger := DM1.tProdutoCodForma.AsInteger;
    if DM1.tMaterial.GotoKey then
      QRLabel74.Caption := DM1.tMaterialNome.AsString;
  end;
end;

procedure TfRelTalaoMI3.prc_Carrega_Imagem(Foto: TQrImage);
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

procedure TfRelTalaoMI3.prc_Gravar_mAuxIntervalo(Tamanho, Tipo: String; Qtd: Integer);
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
  end;
end;

procedure TfRelTalaoMI3.prc_Monta_Setores;
var
  posicao, i: integer;
  vCodBarra: array [1..4] of string;
  vTexto1: String;
  vTamFonte: Integer;
begin
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

end;

procedure TfRelTalaoMI3.prc_Visible_Setores;
begin
  AQtdTamIntervalo.Enabled := (fConsLote.mAuxImpCodTitulo_Via.AsInteger > 0);
  QRShape1.Enabled         := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRShape34.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRShape35.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRShape36.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  Setor1.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  Setor2.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  Setor3.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  Setor4.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRLabel82.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRLabel83.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRLabel84.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRLabel85.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRLabel12.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRLabel13.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRLabel17.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRLabel77.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRLabel30.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRLabel19.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRLabel20.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRLabel21.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRLabel78.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRLabel31.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRLabel23.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRLabel24.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRLabel25.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRLabel79.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRLabel32.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRLabel27.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRLabel28.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRLabel29.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRLabel80.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRLabel33.Enabled        := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRImage2.Enabled         := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRImage3.Enabled         := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRImage4.Enabled         := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRImage5.Enabled         := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRDBText13.Enabled       := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRDBText14.Enabled       := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRDBText15.Enabled       := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRDBText79.Enabled       := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRDBText55.Enabled       := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRDBText16.Enabled       := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRDBText17.Enabled       := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRDBText18.Enabled       := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRDBText80.Enabled       := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRDBText56.Enabled       := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRDBText19.Enabled       := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRDBText20.Enabled       := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRDBText21.Enabled       := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRDBText81.Enabled       := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRDBText57.Enabled       := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRDBText22.Enabled       := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRDBText23.Enabled       := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRDBText24.Enabled       := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRDBText82.Enabled       := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
  QRDBText58.Enabled       := (fConsLote.mAuxImpCodTitulo_Via.AsInteger = 0);
end;

procedure TfRelTalaoMI3.QuickRep2BeforePrint(Sender: TCustomQuickRep;
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

procedure TfRelTalaoMI3.Mostra_Setores;
begin

end;

end.


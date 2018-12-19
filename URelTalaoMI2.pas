unit URelTalaoMI2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, QuickRpt, Qrctrls, Barcode, JPEG,
  DB, DBTables, JvPcx;

type
  TfRelTalaoMI2 = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
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
    QRS1: TQRShape;
    Image1: TQRImage;
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
    Tam1: TQRLabel;
    Qtd1: TQRLabel;
    Tam2: TQRLabel;
    Qtd2: TQRLabel;
    Tam3: TQRLabel;
    Qtd3: TQRLabel;
    Qtd4: TQRLabel;
    Tam4: TQRLabel;
    Qtd5: TQRLabel;
    Tam5: TQRLabel;
    Tam6: TQRLabel;
    Qtd6: TQRLabel;
    Qtd7: TQRLabel;
    Tam7: TQRLabel;
    Tam8: TQRLabel;
    Qtd8: TQRLabel;
    Qtd9: TQRLabel;
    Tam9: TQRLabel;
    Tam10: TQRLabel;
    Qtd10: TQRLabel;
    Qtd11: TQRLabel;
    Tam11: TQRLabel;
    Tam12: TQRLabel;
    Qtd12: TQRLabel;
    Qtd13: TQRLabel;
    Tam13: TQRLabel;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRLabel42: TQRLabel;
    QRDBText12: TQRDBText;
    Setor1: TQRLabel;
    QRLLote1: TQRLabel;
    QRDLote1: TQRDBText;
    QRLPed1: TQRLabel;
    QRDPed1: TQRDBText;
    QRLTalao1: TQRLabel;
    QRDTalao1: TQRDBText;
    QRS2: TQRShape;
    Setor2: TQRLabel;
    QRLLote2: TQRLabel;
    QRDLote2: TQRDBText;
    QRLPed2: TQRLabel;
    QRDPed2: TQRDBText;
    QRLTalao2: TQRLabel;
    QRDTalao2: TQRDBText;
    Image2: TQRImage;
    QRS3: TQRShape;
    Setor3: TQRLabel;
    QRLLote3: TQRLabel;
    QRDLote3: TQRDBText;
    QRLPed3: TQRLabel;
    QRDPed3: TQRDBText;
    QRLTalao3: TQRLabel;
    QRDTalao3: TQRDBText;
    Image3: TQRImage;
    QRS4: TQRShape;
    Setor4: TQRLabel;
    QRLLote4: TQRLabel;
    QRDLote4: TQRDBText;
    QRLPed4: TQRLabel;
    QRDPed4: TQRDBText;
    QRLTalao4: TQRLabel;
    QRDTalao4: TQRDBText;
    Image4: TQRImage;
    QRLabel18: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel26: TQRLabel;
    Marc1: TQRLabel;
    Marc2: TQRLabel;
    Marc3: TQRLabel;
    Marc4: TQRLabel;
    Marc5: TQRLabel;
    Marc6: TQRLabel;
    Marc7: TQRLabel;
    Marc8: TQRLabel;
    Marc9: TQRLabel;
    Marc10: TQRLabel;
    Marc11: TQRLabel;
    Marc12: TQRLabel;
    Marc13: TQRLabel;
    QRLBarra1: TQRLabel;
    QRLBarra2: TQRLabel;
    QRLBarra3: TQRLabel;
    QRLBarra4: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel69: TQRLabel;
    QRDBText49: TQRDBText;
    QRLabel70: TQRLabel;
    QRDBText50: TQRDBText;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLQtd1: TQRLabel;
    QRDQtd1: TQRDBText;
    QRLQtd2: TQRLabel;
    QRDQtd2: TQRDBText;
    QRLQtd3: TQRLabel;
    QRDQtd3: TQRDBText;
    QRDQtd4: TQRDBText;
    QRLQtd4: TQRLabel;
    Barcode1: TBarcode;
    QRS5: TQRShape;
    Image5: TQRImage;
    Setor5: TQRLabel;
    QRLLote5: TQRLabel;
    QRDLote5: TQRDBText;
    QRLPed5: TQRLabel;
    QRDPed5: TQRDBText;
    QRLTalao5: TQRLabel;
    QRDTalao5: TQRDBText;
    QRS6: TQRShape;
    Setor6: TQRLabel;
    QRLLote6: TQRLabel;
    QRLTalao6: TQRLabel;
    QRDTalao6: TQRDBText;
    Image6: TQRImage;
    QRS7: TQRShape;
    Setor7: TQRLabel;
    QRLLote7: TQRLabel;
    QRLTalao7: TQRLabel;
    QRDTalao7: TQRDBText;
    Image7: TQRImage;
    QRS8: TQRShape;
    Setor8: TQRLabel;
    QRLLote8: TQRLabel;
    QRLTalao8: TQRLabel;
    QRDTalao8: TQRDBText;
    Image8: TQRImage;
    QRLBarra5: TQRLabel;
    QRLBarra6: TQRLabel;
    QRLBarra7: TQRLabel;
    QRLBarra8: TQRLabel;
    QRDLote6: TQRDBText;
    QRLPed6: TQRLabel;
    QRDPed6: TQRDBText;
    QRDLote7: TQRDBText;
    QRLPed7: TQRLabel;
    QRDPed7: TQRDBText;
    QRDLote8: TQRDBText;
    QRLPed8: TQRLabel;
    QRDPed8: TQRDBText;
    QRLQtd5: TQRLabel;
    QRDQtd5: TQRDBText;
    QRLQtd6: TQRLabel;
    QRDQtd6: TQRDBText;
    QRLQtd7: TQRLabel;
    QRDQtd7: TQRDBText;
    QRDQtd8: TQRDBText;
    QRLQtd8: TQRLabel;
    QRLabel133: TQRLabel;
    QRDBText96: TQRDBText;
    Tam14: TQRLabel;
    Qtd14: TQRLabel;
    Marc14: TQRLabel;
    Tam15: TQRLabel;
    Qtd15: TQRLabel;
    Marc15: TQRLabel;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
     procedure Mostra_Setores;
     procedure prc_Carrega_Imagem;
  public
    vMetodoNovo_Imagem : Boolean;
    { Public declarations }
  end;

var
  fRelTalaoMI2: TfRelTalaoMI2;
  vCodSetor: array [1..8] of integer;

implementation

uses UDM1, UDM2, UConsLote;

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

procedure TfRelTalaoMI2.Mostra_Setores;
begin
  TQRShape(FindComponent('QRS'+IntToStr(DM1.tLoteSetorMIItem.AsInteger))).Enabled       := True;
  TQRLabel(FindComponent('QRLLote'+IntToStr(DM1.tLoteSetorMIItem.AsInteger))).Enabled   := True;
  TQRLabel(FindComponent('QRLTalao'+IntToStr(DM1.tLoteSetorMIItem.AsInteger))).Enabled  := True;
  TQRLabel(FindComponent('QRLPed'+IntToStr(DM1.tLoteSetorMIItem.AsInteger))).Enabled    := True;
  TQRLabel(FindComponent('QRLQtd'+IntToStr(DM1.tLoteSetorMIItem.AsInteger))).Enabled    := True;
  TQRLabel(FindComponent('QRLBarra'+IntToStr(DM1.tLoteSetorMIItem.AsInteger))).Enabled  := True;
  TQRLabel(FindComponent('Setor'+IntToStr(DM1.tLoteSetorMIItem.AsInteger))).Enabled     := True;
  TQRImage(FindComponent('Image'+IntToStr(DM1.tLoteSetorMIItem.AsInteger))).Enabled     := True;
  TQRDBText(FindComponent('QRDLote'+IntToStr(DM1.tLoteSetorMIItem.AsInteger))).Enabled  := True;
  TQRDBText(FindComponent('QRDTalao'+IntToStr(DM1.tLoteSetorMIItem.AsInteger))).Enabled := True;
  TQRDBText(FindComponent('QRDPed'+IntToStr(DM1.tLoteSetorMIItem.AsInteger))).Enabled   := True;
  TQRDBText(FindComponent('QRDQtd'+IntToStr(DM1.tLoteSetorMIItem.AsInteger))).Enabled   := True;

  TQRLabel(FindComponent('Setor'+IntToStr(DM1.tLoteSetorMIItem.AsInteger))).Caption     := DM1.tLoteSetorMIlkNomeSetor.AsString;
end;

procedure TfRelTalaoMI2.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  posicao, i: integer;
  vCodBarra: array [1..8] of string;
  vTexto1: String;
  vTamFonte: Integer;
begin
  QRImage1.Picture := nil;
  for i := 1 to 8 do
  begin
    TQRImage(FindComponent('Image'+IntToStr(i))).Picture := nil;
    if vCodSetor[i] > 0 then
    begin
      vCodBarra[i] := '1' + FormatFloat('00000',DM1.tTalaoMILote.AsInteger) +
                      FormatFloat('0000',DM1.tTalaoMIItem.AsInteger) +
                      FormatFloat('00',vCodSetor[i]);
      Barcode1.Text := vCodBarra[i];

      Barcode1.DrawBarcode(TQRImage(FindComponent('Image'+IntToStr(i))).Canvas);

      TQRLabel(FindComponent('QRLBarra'+IntToStr(i))).Caption := vCodBarra[i];
    end;
  end;
  QRLabel71.Caption := '';
  QRLabel72.Caption := '';
  QrImage1.Picture  := nil;
  DM1.tProduto.IndexFieldNames := 'Codigo';
  DM1.tProduto.SetKey;
  DM1.tProdutoCodigo.AsInteger := DM1.tTalaoMICodProduto.AsInteger;
  if DM1.tProduto.GotoKey then
  begin
    if FileExists(DM1.tProdutoEndFoto.AsString) then
      QRImage1.Picture.LoadFromFile(DM1.tProdutoEndFoto.AsString)
    else
    if not DM1.tProdutoFotoJpeg.IsNull then
    begin
      if vMetodoNovo_Imagem then
        prc_Carrega_Imagem
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
    TQRLabel(FindComponent('Marc'+IntToStr(Posicao))).Enabled := False;
//    TQRShape(FindComponent('QSTam'+IntToStr(Posicao))).Enabled   := False;
//    TQRShape(FindComponent('QSQtd'+IntToStr(Posicao))).Enabled   := False;
//    TQRShape(FindComponent('QRSMarc'+IntToStr(Posicao))).Enabled := False;
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
        TQRLabel(FindComponent('Tam' + IntToStr(Posicao))).Enabled   := True;
        TQRLabel(FindComponent('Tam' + IntToStr(Posicao))).Caption   := DM1.tTalaoGradeMIlkTamanho.AsString;
        //TQRShape(FindComponent('QSTam' + IntToStr(Posicao))).Enabled := True;
        TQRLabel(FindComponent('Qtd' + IntToStr(Posicao))).Enabled   := True;
        TQRLabel(FindComponent('Qtd' + IntToStr(Posicao))).Caption   := DM1.tTalaoGradeMIQtdPar.AsString;
        //TQRShape(FindComponent('QSQtd' + IntToStr(Posicao))).Enabled := True;
        if DM1.tTalaoGradeMIlkMarcarTam.AsString <> '' then
        begin
//          QRShape6.Enabled  := True;
          QRLabel26.Enabled := True;
          TQRLabel(FindComponent('Marc' + IntToStr(Posicao))).Enabled    := True;
          TQRLabel(FindComponent('Marc' + IntToStr(Posicao))).Caption    := DM1.tTalaoGradeMIlkMarcarTam.AsString;
          //TQRShape(FindComponent('QRSMarc' + IntToStr(Posicao))).Enabled := True;
        end;
      end;
    end;
    DM1.tTalaoGradeMI.Next;
  end;
end;

procedure TfRelTalaoMI2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelTalaoMI2.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
 i: Integer;
begin
  for i := 1 to 8 do
    vCodSetor[i] := 0;
  DM1.tLoteSetorMI.First;
  while not DM1.tLoteSetorMI.Eof do
  begin
    Mostra_Setores;
    {case DM1.tLoteSetorMIItem.AsInteger of
      1: Setor1.Caption := DM1.tLoteSetorMIlkNomeSetor.AsString;
      2: Setor2.Caption := DM1.tLoteSetorMIlkNomeSetor.AsString;
      3: Setor3.Caption := DM1.tLoteSetorMIlkNomeSetor.AsString;
      4: Setor4.Caption := DM1.tLoteSetorMIlkNomeSetor.AsString;
    end;}
    vCodSetor[DM1.tLoteSetorMIItem.AsInteger] := DM1.tLoteSetorMICodSetor.AsInteger;
    DM1.tLoteSetorMI.Next;
  end;
end;

procedure TfRelTalaoMI2.prc_Carrega_Imagem;
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
      QRImage1.Picture.Assign(vJPG);
      //pImagem.Picture.Assign(vJPG);
      vJPG.Free;
    end;
    // BITMAP
   if vImagemTipo = 'BMP' then
    begin
      vBMP := Graphics.TBitmap.Create;
      vBMP.LoadFromStream(vBS);
      //pImagem.Picture.Assign(vBMP);
      QRImage1.Picture.Assign(vBMP);
      vBMP.Free;
    end;
  end;
  vBS.Destroy;
end;

end.



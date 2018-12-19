unit URelProgramacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, DB, JPeg, DBTables;

type
  TfRelProgramacao = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRShape2: TQRShape;
    QRLabel7: TQRLabel;
    QRShape3: TQRShape;
    QRLabel8: TQRLabel;
    QRShape4: TQRShape;
    QRLabel9: TQRLabel;
    QRShape5: TQRShape;
    QRLabel10: TQRLabel;
    QRShape6: TQRShape;
    QRLabel11: TQRLabel;
    QRShape7: TQRShape;
    QRLabel12: TQRLabel;
    QRShape8: TQRShape;
    QRLabel13: TQRLabel;
    QRShape9: TQRShape;
    QRLabel14: TQRLabel;
    QRShape10: TQRShape;
    QRLabel15: TQRLabel;
    QRShape11: TQRShape;
    QRLabel16: TQRLabel;
    QRShape12: TQRShape;
    QRLabel17: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel19: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel21: TQRLabel;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel22: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRLabel18: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel23: TQRLabel;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape38: TQRShape;
    QRDtCorteInicio: TQRLabel;
    QRDtCorteFinal: TQRLabel;
    QRDtCosturaInicio: TQRLabel;
    QRDtCosturaFinal: TQRLabel;
    QRDtPreInicio: TQRLabel;
    QRDtPreFinal: TQRLabel;
    QRDtMontagemInicio: TQRLabel;
    QRDtMontagemFinal: TQRLabel;
    QRDBText8: TQRDBText;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRLabel24: TQRLabel;
    QRDBText9: TQRDBText;
    QRShape41: TQRShape;
    QRDBText10: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel25: TQRLabel;
    QRExpr1: TQRExpr;
    QRShape42: TQRShape;
    QRLabel26: TQRLabel;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRDBText11: TQRDBText;
    QRShape45: TQRShape;
    QRLabel27: TQRLabel;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRDBText12: TQRDBText;
    QuickRep2: TQuickRep;
    DetailBand2: TQRBand;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    SummaryBand1: TQRBand;
    QRShape51: TQRShape;
    QRLabel46: TQRLabel;
    QRShape53: TQRShape;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRShape54: TQRShape;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRShape56: TQRShape;
    PageHeaderBand2: TQRBand;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape48: TQRShape;
    QRLabel31: TQRLabel;
    QRShape49: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    SummaryBand2: TQRBand;
    QRShape57: TQRShape;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape29: TQRShape;
    QRShape50: TQRShape;
    QRShape52: TQRShape;
    QRShape55: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure DetailBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelProgramacao: TfRelProgramacao;
  vNumPedido, vItemPedido : Integer;
  vQtdParesFat, vQtdParesRest : Integer;

implementation

uses UDM1, UPrevRelProgramacao, UDM2;

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

procedure TfRelProgramacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelProgramacao.PageHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLabel1.Caption := DM1.tEmpresaEndereco.AsString + ' - ' + DM1.tEmpresaBairro.AsString + ' - ' + DM1.tEmpresaCidade.AsString + '/' + DM1.tEmpresaEstado.AsString;
  QRLabel2.Caption := 'Fone: ' + DM1.tEmpresaTel.AsString;
end;

procedure TfRelProgramacao.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  //aqui 01/04/2010
  {if DM1.tProgramacaoItenslkQtdRestante.AsFloat > 0 then
    begin
      QRDtCorteInicio.Caption    := '';
      QRDtCorteFinal.Caption     := '';
      QRDtCosturaInicio.Caption  := '';
      QRDtCosturaFinal.Caption   := '';
      QRDtPreInicio.Caption      := '';
      QRDtPreFinal.Caption       := '';
      QRDtMontagemInicio.Caption := '';
      QRDtMontagemFinal.Caption  := '';
      if DM1.tProgramacaoItensDtCorteI.AsString <> '00/00/0000' then
        QRDtCorteInicio.Caption    := DM1.tProgramacaoItensDtCorteI.AsString;
      if DM1.tProgramacaoItensDtCorteF.AsString <> '00/00/0000' then
        QRDtCorteFinal.Caption     := DM1.tProgramacaoItensDtCorteF.AsString;
      if DM1.tProgramacaoItensDtCosturaI.AsString <> '00/00/0000' then
        QRDtCosturaInicio.Caption  := DM1.tProgramacaoItensDtCosturaI.AsString;
      if DM1.tProgramacaoItensDtCosturaF.AsString <> '00/00/0000' then
        QRDtCosturaFinal.Caption   := DM1.tProgramacaoItensDtCosturaF.AsString;
      if DM1.tProgramacaoItensDtPreI.AsString <> '00/00/0000' then
        QRDtPreInicio.Caption      := DM1.tProgramacaoItensDtPreI.AsString;
      if DM1.tProgramacaoItensDtPreF.AsString <> '00/00/0000' then
        QRDtPreFinal.Caption       := DM1.tProgramacaoItensDtPreF.AsString;
      if DM1.tProgramacaoItensDtMontagemI.AsString <> '00/00/0000' then
        QRDtMontagemInicio.Caption := DM1.tProgramacaoItensDtMontagemI.AsString;
      if DM1.tProgramacaoItensDtMontagemF.AsString <> '00/00/0000' then
        QRDtMontagemFinal.Caption  := DM1.tProgramacaoItensDtMontagemF.AsString;

      if (vNumPedido > 0) and (vNumPedido = DM2.tProgramacaoItens2Pedido.AsInteger) and
         (vItemPedido = DM2.tProgramacaoItens2ItemPedido.AsInteger) then
        begin
          QRDBText2.Enabled  := False;
          QRDBText3.Enabled  := False;
          QRDBText4.Enabled  := False;
          QRDBText5.Enabled  := False;
          QRDBText8.Enabled  := False;
          QRDBText11.Enabled := False;
        end
      else
        begin
          QRDBText2.Enabled  := True;
          QRDBText3.Enabled  := True;
          QRDBText4.Enabled  := True;
          QRDBText5.Enabled  := True;
          QRDBText8.Enabled  := True;
          QRDBText11.Enabled := True;
        end;
      PrintBand := True;
    end
  else
    PrintBand := False;}
end;

procedure TfRelProgramacao.DetailBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  {vNumPedido  := DM1.tProgramacaoItensPedido.AsInteger;
  vItemPedido := DM1.tProgramacaoItensItemPedido.AsInteger;
  DM2.tProgramacaoItens2.Next;}
end;

procedure TfRelProgramacao.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  {if DM1.tProgramacaoItens.RecordCount = DM1.tProgramacaoItens.RecNo then
    PrintBand := True
  else
    begin
      if vNumPedido = DM2.tProgramacaoItens2Pedido.AsInteger then
        PrintBand := False
      else
        PrintBand := True;
    end;}
end;

procedure TfRelProgramacao.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  vNumPedido    := 0;
  vItemPedido   := 0;
  vQtdParesFat  := 0;
  vQtdParesRest := 0;
  //aqui 01/04/2010
  //DM2.tProgramacaoItens2.First;
end;

procedure TfRelProgramacao.DetailBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  vQtdParesFat  := vQtdParesFat  + fPrevRelProgramacao.qQtdParRefQtdParesFat.AsInteger;
  vQtdParesRest := vQtdParesRest + fPrevRelProgramacao.qQtdParRefQtdParesRest.AsInteger;
  QRLabel37.Caption := fPrevRelProgramacao.qQtdParRefReferencia.AsString;
  QRLabel38.Caption := fPrevRelProgramacao.qQtdParRefQtdParesFat.AsString;
  QRLabel39.Caption := fPrevRelProgramacao.qQtdParRefQtdParesRest.AsString;
  {if Dm1.tProduto.Locate('Referencia',fPrevRelProgramacao.qQtdParRefReferencia.AsString,([LocaseInsensitive])) then
    begin
      if DM1.tProdutoFotoJpeg.IsNull then
        QRImage2.Picture := nil
      else
        Le_Imagem_JPEG(DM1.tProdutoFotoJpeg,QRImage2);
    end;}
  if fPrevRelProgramacao.qQtdParRef.RecNo <> fPrevRelProgramacao.qQtdParRef.RecordCount then
    begin
      fPrevRelProgramacao.qQtdParRef.Next;
      vQtdParesFat  := vQtdParesFat  + fPrevRelProgramacao.qQtdParRefQtdParesFat.AsInteger;
      vQtdParesRest := vQtdParesRest + fPrevRelProgramacao.qQtdParRefQtdParesRest.AsInteger;
      QRLabel40.Caption := fPrevRelProgramacao.qQtdParRefReferencia.AsString;
      QRLabel41.Caption := fPrevRelProgramacao.qQtdParRefQtdParesFat.AsString;
      QRLabel42.Caption := fPrevRelProgramacao.qQtdParRefQtdParesRest.AsString;
      {if Dm1.tProduto.Locate('Referencia',fPrevRelProgramacao.qQtdParRefReferencia.AsString,([LocaseInsensitive])) then
        begin
          if DM1.tProdutoFotoJpeg.IsNull then
            QRImage1.Picture := nil
          else
            Le_Imagem_JPEG(DM1.tProdutoFotoJpeg,QRImage1);
        end;}

{      if fPrevRelProgramacao.qQtdParRef.RecNo <> fPrevRelProgramacao.qQtdParRef.RecordCount then
        begin
          fPrevRelProgramacao.qQtdParRef.Next;
          vQtdParesFat  := vQtdParesFat  + fPrevRelProgramacao.qQtdParRefQtdParesFat.AsInteger;
          vQtdParesRest := vQtdParesRest + fPrevRelProgramacao.qQtdParRefQtdParesRest.AsInteger;
          QRLabel34.Caption := fPrevRelProgramacao.qQtdParRefReferencia.AsString;
          QRLabel35.Caption := fPrevRelProgramacao.qQtdParRefQtdParesFat.AsString;
          QRLabel36.Caption := fPrevRelProgramacao.qQtdParRefQtdParesRest.AsString;
        end
      else
        begin
          QRLabel34.Caption := '';
          QRLabel35.Caption := '';
          QRLabel36.Caption := '';
        end;}
    end
  else
    begin
      QRLabel40.Caption := '';
      QRLabel41.Caption := '';
      QRLabel42.Caption := '';
      //QRLabel34.Caption := '';
      //QRLabel35.Caption := '';
//      QRLabel36.Caption := '';
    end;
end;

procedure TfRelProgramacao.SummaryBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel56.Caption := FormatFloat('###,###,###',vQtdParesFat);
  QRLabel58.Caption := FormatFloat('###,###,###',vQtdParesRest);
  vQtdParesFat      := 0;
  vQtdParesRest     := 0;
end;

end.

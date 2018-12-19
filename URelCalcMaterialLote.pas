unit URelCalcMaterialLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Jpeg, Db, DbTables;

type
  TfRelCalcMaterialLote = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRSubDetail1: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    GroupFooterBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel6: TQRLabel;
    QRShape2: TQRShape;
    QRSubDetail3: TQRSubDetail;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRSubDetail2: TQRSubDetail;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape3: TQRShape;
    ChildBand2: TQRChildBand;
    QRLabel23: TQRLabel;
    QRLabel30: TQRLabel;
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
    Qtd14: TQRLabel;
    Qtd15: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText14: TQRDBText;
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QuickRep2: TQuickRep;
    DetailBand1: TQRBand;
    PageHeaderBand2: TQRBand;
    QRDBText15: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape6: TQRShape;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel25: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    ATam1: TQRLabel;
    AQtd1: TQRLabel;
    ATam2: TQRLabel;
    AQtd2: TQRLabel;
    ATam3: TQRLabel;
    AQtd3: TQRLabel;
    ATam4: TQRLabel;
    AQtd4: TQRLabel;
    ATam5: TQRLabel;
    AQtd5: TQRLabel;
    ATam6: TQRLabel;
    AQtd6: TQRLabel;
    ATam7: TQRLabel;
    AQtd7: TQRLabel;
    AQtd8: TQRLabel;
    ATam8: TQRLabel;
    ATam9: TQRLabel;
    AQtd9: TQRLabel;
    AQtd10: TQRLabel;
    ATam10: TQRLabel;
    ATam11: TQRLabel;
    AQtd11: TQRLabel;
    AQtd12: TQRLabel;
    ATam12: TQRLabel;
    ATam13: TQRLabel;
    AQtd13: TQRLabel;
    AQtd14: TQRLabel;
    ATam14: TQRLabel;
    ATam15: TQRLabel;
    AQtd15: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QtdP1: TQRLabel;
    TamP1: TQRLabel;
    TamP2: TQRLabel;
    QtdP2: TQRLabel;
    QtdP3: TQRLabel;
    TamP3: TQRLabel;
    TamP4: TQRLabel;
    QtdP4: TQRLabel;
    QtdP5: TQRLabel;
    TamP5: TQRLabel;
    TamP6: TQRLabel;
    QtdP6: TQRLabel;
    QtdP7: TQRLabel;
    TamP7: TQRLabel;
    QtdP8: TQRLabel;
    TamP8: TQRLabel;
    TamP9: TQRLabel;
    QtdP9: TQRLabel;
    QtdP10: TQRLabel;
    TamP11: TQRLabel;
    TamP10: TQRLabel;
    QtdP11: TQRLabel;
    QtdP12: TQRLabel;
    TamP12: TQRLabel;
    TamP13: TQRLabel;
    QtdP13: TQRLabel;
    QtdP14: TQRLabel;
    TamP14: TQRLabel;
    TamP15: TQRLabel;
    QtdP15: TQRLabel;
    QRShape7: TQRShape;
    QRLabel32: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText26: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeaderBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
//    function Verifica_Foto : Boolean;
  public
    { Public declarations }
  end;

var
  fRelCalcMaterialLote: TfRelCalcMaterialLote;

implementation

uses UPrevCalcMaterialLote, UPrevCalcMaterialLote2, UDM1, rsDBUtils;

{$R *.DFM}

{procedure Le_Imagem_JPEG(Campo:TBlobField;Foto:TQRImage);
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

function TfRelCalcMaterialLote.Verifica_Foto : Boolean;
begin
  Dm1.tProduto.IndexFieldNames := 'Codigo';
  Dm1.tProduto.SetKey;
  Dm1.tProdutoCodigo.AsInteger := fPrevCalcMaterialLote2.tAuxCalcMaterialProdCodProduto.AsInteger;
  if (Dm1.tProduto.GotoKey) and not (Dm1.tProdutoFotoJpeg.IsNull) then
    begin
      Le_Imagem_JPEG(DM1.tProdutoFotoJpeg,QRImage1);
      Result := True;
    end
  else
    begin
      QRImage1.Picture := nil;
      Result := False;
    end;
end;}

procedure TfRelCalcMaterialLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  oDBUtils.OpenTables(False,Self);
  Action := Cafree;
end;

procedure TfRelCalcMaterialLote.PageHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLabel1.Caption := 'Relação do Cálculo dos Materiais para Compras';
  case fPrevCalcMaterialLote2.RadioGroup2.ItemIndex of
    0 : QRLabel2.Caption := 'Pedido ' + fPrevCalcMaterialLote2.Edit1.Text +
                            ' a ' + fPrevCalcMaterialLote2.Edit2.Text;
    1 : QRLabel2.Caption := 'Lote MI: ' + fPrevCalcMaterialLote2.CurrencyEdit1.Text +
                            ' a ' + fPrevCalcMaterialLote2.CurrencyEdit2.Text;
    2 : QRLabel2.Caption := 'Lote Exp: ' + fPrevCalcMaterialLote2.CurrencyEdit1.Text +
                            ' a ' + fPrevCalcMaterialLote2.CurrencyEdit2.Text;
  end;
end;

procedure TfRelCalcMaterialLote.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  i : Integer;
begin
//  ChildBand1.Enabled := Verifica_Foto;

  if fPrevCalcMaterialLote2.CheckBox1.Checked then
    begin
      QRSubDetail1.Height := 52;
      for i := 1 to 15 do
        begin
          TQRLabel(FindComponent('TamP'+IntToStr(i))).Caption   := ' ';
          TQRLabel(FindComponent('QtdP'+IntToStr(i))).Caption   := ' ';
        end;
      i := 0;

      fPrevCalcMaterialLote2.tAuxCalcMaterialProdGrade.Filtered := False;
      fPrevCalcMaterialLote2.tAuxCalcMaterialProdGrade.Filter   := 'CodProduto = '''+fPrevCalcMaterialLote2.qAuxCalcMaterialProdCodProduto.AsString+'''';
      fPrevCalcMaterialLote2.tAuxCalcMaterialProdGrade.Filtered := True;
      fPrevCalcMaterialLote2.tAuxCalcMaterialProdGrade.First;
      while not fPrevCalcMaterialLote2.tAuxCalcMaterialProdGrade.Eof do
        begin
          if fPrevCalcMaterialLote2.tAuxCalcMaterialProdGradeQtdPar.AsFloat > 0 then
            begin
              inc(i);
              if i > 15 then
                begin
                  ShowMessage('Imprimiu só 15 tamanhos da referência ' + fPrevCalcMaterialLote2.qAuxCalcMaterialProdReferencia.AsString);
                  fPrevCalcMaterialLote2.tAuxCalcMaterialProdGrade.Last;
                end
              else
                begin
                  TQRLabel(FindComponent('TamP'+IntToStr(i))).Caption := fPrevCalcMaterialLote2.tAuxCalcMaterialProdGradeTamanho.AsString;
                  TQRLabel(FindComponent('QtdP'+IntToStr(i))).Caption := fPrevCalcMaterialLote2.tAuxCalcMaterialProdGradeQtdPar.AsString;
                end;
            end;
          fPrevCalcMaterialLote2.tAuxCalcMaterialProdGrade.Next;
        end;
    end
  else
    QRSubDetail1.Height := 19;
end;

procedure TfRelCalcMaterialLote.QRSubDetail2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  fPrevCalcMaterialLote2.tAuxCalcMaterial.Filtered := False;
  fPrevCalcMaterialLote2.tAuxCalcMaterial.Filter   := 'CodSetor = ' + fPrevCalcMaterialLote2.qSetorCodSetor.AsString;
  fPrevCalcMaterialLote2.tAuxCalcMaterial.Filtered := True;
end;

procedure TfRelCalcMaterialLote.ChildBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
 i : Integer;
 vConsumoAux : Real;
begin
  if fPrevCalcMaterialLote2.tAuxItCalcMaterial.RecordCount > 0 then
    begin
      PrintBand := True;
      if (fPrevCalcMaterialLote2.tAuxCalcMaterialLargura.AsString <> '') and (fPrevCalcMaterialLote2.tAuxCalcMaterialLargura.AsString <> ' ') then
        begin
          QRLabel14.Visible  := True;
          QRDBText14.Visible := True;
        end
      else
        begin
          QRLabel14.Visible  := False;
          QRDBText14.Visible := False;
        end;
      for i := 1 to 15 do
        begin
          TQRLabel(FindComponent('Tam'+IntToStr(i))).Caption   := ' ';
          TQRLabel(FindComponent('Qtd'+IntToStr(i))).Caption   := ' ';
        end;
      i := 0;
      vConsumoAux := 0;
      fPrevCalcMaterialLote2.tAuxItCalcMaterial.First;
      while not fPrevCalcMaterialLote2.tAuxItCalcMaterial.Eof do
        begin
          inc(i);
          TQRLabel(FindComponent('Tam'+IntToStr(i))).Caption := fPrevCalcMaterialLote2.tAuxItCalcMaterialTamMaterial.AsString;
          TQRLabel(FindComponent('Qtd'+IntToStr(i))).Caption := fPrevCalcMaterialLote2.tAuxItCalcMaterialQtdPares.AsString;
          vConsumoAux := vConsumoAux + fPrevCalcMaterialLote2.tAuxItCalcMaterialQtdPares.AsFloat;
          fPrevCalcMaterialLote2.tAuxItCalcMaterial.Next;
        end;
      //if StrToFloat(FormatFloat('0.00000',vConsumoAux)) <> StrToFloat(FormatFloat('0.00000',fPrevCalcMaterialLote2.tAuxCalcMaterialConsumo.AsFloat)) then
      //  ShowMessage('Material = (' + fPrevCalcMaterialLote2.tAuxCalcMaterialCodMaterial.AsString + ') ' +fPrevCalcMaterialLote2.tAuxCalcMaterialMaterial.AsString + 'Total da grade diferente!');
    end
  else
    PrintBand := False;
end;

procedure TfRelCalcMaterialLote.PageHeaderBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  case fPrevCalcMaterialLote2.RadioGroup2.ItemIndex of
    0 : QRLabel5.Caption := 'Pedido ' + fPrevCalcMaterialLote2.Edit1.Text +
                            ' a ' + fPrevCalcMaterialLote2.Edit2.Text;
    1 : QRLabel5.Caption := 'Lote: ' + fPrevCalcMaterialLote2.CurrencyEdit1.Text +
                            ' a ' + fPrevCalcMaterialLote2.CurrencyEdit2.Text;
  end;
end;

procedure TfRelCalcMaterialLote.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
 i : Integer;
begin
  if fPrevCalcMaterialLote2.qAuxItCalcMaterial.RecordCount > 0 then
    begin
      PrintBand := True;
      if (fPrevCalcMaterialLote2.qAuxCalcMaterialLargura.AsString <> '') and (fPrevCalcMaterialLote2.qAuxCalcMaterialLargura.AsString <> ' ') then
        begin
          QRLabel25.Visible  := True;
          QRDBText23.Visible := True;
        end
      else
        begin
          QRLabel25.Visible  := False;
          QRDBText23.Visible := False;
        end;
      for i := 1 to 15 do
        begin
          TQRLabel(FindComponent('ATam'+IntToStr(i))).Caption   := ' ';
          TQRLabel(FindComponent('AQtd'+IntToStr(i))).Caption   := ' ';
        end;
      i := 0;
      fPrevCalcMaterialLote2.qAuxItCalcMaterial.First;
      while not fPrevCalcMaterialLote2.qAuxItCalcMaterial.Eof do
        begin
          inc(i);
          TQRLabel(FindComponent('ATam'+IntToStr(i))).Caption := fPrevCalcMaterialLote2.qAuxItCalcMaterialTamMaterial.AsString;
          TQRLabel(FindComponent('AQtd'+IntToStr(i))).Caption := fPrevCalcMaterialLote2.qAuxItCalcMaterialQtdPares.AsString;
          fPrevCalcMaterialLote2.qAuxItCalcMaterial.Next;
        end;
    end
  else
    PrintBand := False;
end;

procedure TfRelCalcMaterialLote.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  fPrevCalcMaterialLote2.qAuxItCalcMaterial.Filtered := False;
  fPrevCalcMaterialLote2.qAuxItCalcMaterial.Filter   := 'CodMaterial = '''+IntToStr(fPrevCalcMaterialLote2.qAuxCalcMaterialCodMaterial.AsInteger)+''' and CodCor = '''+IntToStr(fPrevCalcMaterialLote2.qAuxCalcMaterialCodCor.AsInteger)+''' and Largura = '''+fPrevCalcMaterialLote2.qAuxCalcMaterialLargura.AsString+'''';
  fPrevCalcMaterialLote2.qAuxItCalcMaterial.Filtered := True;
end;

procedure TfRelCalcMaterialLote.FormCreate(Sender: TObject);
begin
  oDBUtils.OpenTables(True,Self);
end;

end.

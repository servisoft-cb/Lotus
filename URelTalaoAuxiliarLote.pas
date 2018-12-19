unit URelTalaoAuxiliarLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, QRCtrls, QuickRpt, ExtCtrls, Barcode, RLBarcode, JPEG,
  StdCtrls, Db, DBTables;

type
  TfRelTalaoAuxiliarLote = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLSubDetail2: TRLSubDetail;
    RLSubDetail3: TRLSubDetail;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLLabel1: TRLLabel;
    RLDBText2: TRLDBText;
    RLLabel2: TRLLabel;
    RLDBText3: TRLDBText;
    RLLabel3: TRLLabel;
    RLDBText4: TRLDBText;
    RLLabel4: TRLLabel;
    RLDBText5: TRLDBText;
    RLLabel5: TRLLabel;
    RLDBText6: TRLDBText;
    RLLabel6: TRLLabel;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLLabel8: TRLLabel;
    RLDBText9: TRLDBText;
    RLLabel9: TRLLabel;
    RLDBText10: TRLDBText;
    RLLabel10: TRLLabel;
    RLDBText11: TRLDBText;
    RLLabel11: TRLLabel;
    RLDBMemo1: TRLDBMemo;
    Barcode1: TBarcode;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    RLLabel12: TRLLabel;
    RLDBText12: TRLDBText;
    RLLabel13: TRLLabel;
    RLSubDetail4: TRLSubDetail;
    RLDraw5: TRLDraw;
    RLLabel17: TRLLabel;
    RLDBText15: TRLDBText;
    RLLabel20: TRLLabel;
    RLMemo1: TRLMemo;
    RLImage1: TRLImage;
    RLBand2: TRLBand;
    RLDraw6: TRLDraw;
    RLBarcode1: TRLBarcode;
    RLLabel7: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLBarcode3: TRLBarcode;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLDBText17: TRLDBText;
    RLLabel24: TRLLabel;
    RLDBText18: TRLDBText;
    RLLabel25: TRLLabel;
    RLDBText19: TRLDBText;
    RLLabel27: TRLLabel;
    RLDBText21: TRLDBText;
    RLBarcode2: TRLBarcode;
    RLLabel14: TRLLabel;
    RLLabel26: TRLLabel;
    RLDBText20: TRLDBText;
    RLDBText22: TRLDBText;
    RLLabel28: TRLLabel;
    RLDraw3: TRLDraw;
    Shape1: TRLDraw;
    T1: TRLLabel;
    C1: TRLLabel;
    Tam1: TRLLabel;
    Qtd1: TRLLabel;
    Shape2: TRLDraw;
    T2: TRLLabel;
    C2: TRLLabel;
    Tam2: TRLLabel;
    Qtd2: TRLLabel;
    Shape4: TRLDraw;
    Qtd4: TRLLabel;
    MTam4: TRLLabel;
    Tam4: TRLLabel;
    T4: TRLLabel;
    C4: TRLLabel;
    Shape5: TRLDraw;
    Qtd5: TRLLabel;
    MTam5: TRLLabel;
    Tam5: TRLLabel;
    T5: TRLLabel;
    C5: TRLLabel;
    Shape6: TRLDraw;
    Qtd6: TRLLabel;
    MTam6: TRLLabel;
    Tam6: TRLLabel;
    T6: TRLLabel;
    C6: TRLLabel;
    Shape7: TRLDraw;
    Qtd7: TRLLabel;
    MTam7: TRLLabel;
    Tam7: TRLLabel;
    T7: TRLLabel;
    C7: TRLLabel;
    Shape8: TRLDraw;
    Qtd8: TRLLabel;
    MTam8: TRLLabel;
    Tam8: TRLLabel;
    T8: TRLLabel;
    C8: TRLLabel;
    Shape9: TRLDraw;
    Qtd9: TRLLabel;
    MTam9: TRLLabel;
    Tam9: TRLLabel;
    T9: TRLLabel;
    C9: TRLLabel;
    Shape3: TRLDraw;
    Qtd3: TRLLabel;
    MTam3: TRLLabel;
    Tam3: TRLLabel;
    T3: TRLLabel;
    C3: TRLLabel;
    Shape10: TRLDraw;
    Qtd10: TRLLabel;
    MTam10: TRLLabel;
    Tam10: TRLLabel;
    T10: TRLLabel;
    C10: TRLLabel;
    Shape11: TRLDraw;
    Qtd11: TRLLabel;
    MTam11: TRLLabel;
    Tam11: TRLLabel;
    T11: TRLLabel;
    C11: TRLLabel;
    Shape12: TRLDraw;
    Qtd12: TRLLabel;
    MTam12: TRLLabel;
    Tam12: TRLLabel;
    T12: TRLLabel;
    C12: TRLLabel;
    Shape13: TRLDraw;
    T13: TRLLabel;
    C13: TRLLabel;
    MTam13: TRLLabel;
    Tam13: TRLLabel;
    Qtd13: TRLLabel;
    Shape14: TRLDraw;
    T14: TRLLabel;
    C14: TRLLabel;
    MTam14: TRLLabel;
    Tam14: TRLLabel;
    Qtd14: TRLLabel;
    Shape16: TRLDraw;
    Qtd16: TRLLabel;
    MTam16: TRLLabel;
    Tam16: TRLLabel;
    T16: TRLLabel;
    C16: TRLLabel;
    Shape17: TRLDraw;
    Qtd17: TRLLabel;
    MTam17: TRLLabel;
    Tam17: TRLLabel;
    T17: TRLLabel;
    C17: TRLLabel;
    Shape18: TRLDraw;
    Qtd18: TRLLabel;
    MTam18: TRLLabel;
    Tam18: TRLLabel;
    T18: TRLLabel;
    C18: TRLLabel;
    Shape19: TRLDraw;
    Qtd19: TRLLabel;
    MTam19: TRLLabel;
    Tam19: TRLLabel;
    T19: TRLLabel;
    C19: TRLLabel;
    Shape20: TRLDraw;
    Qtd20: TRLLabel;
    MTam20: TRLLabel;
    Tam20: TRLLabel;
    T20: TRLLabel;
    C20: TRLLabel;
    Shape21: TRLDraw;
    Qtd21: TRLLabel;
    MTam21: TRLLabel;
    Tam21: TRLLabel;
    T21: TRLLabel;
    C21: TRLLabel;
    Shape15: TRLDraw;
    Qtd15: TRLLabel;
    MTam15: TRLLabel;
    Tam15: TRLLabel;
    T15: TRLLabel;
    C15: TRLLabel;
    Shape22: TRLDraw;
    Qtd22: TRLLabel;
    MTam22: TRLLabel;
    Tam22: TRLLabel;
    T22: TRLLabel;
    C22: TRLLabel;
    Shape23: TRLDraw;
    Qtd23: TRLLabel;
    MTam23: TRLLabel;
    Tam23: TRLLabel;
    T23: TRLLabel;
    C23: TRLLabel;
    Shape24: TRLDraw;
    Qtd24: TRLLabel;
    MTam24: TRLLabel;
    Tam24: TRLLabel;
    T24: TRLLabel;
    C24: TRLLabel;
    MTam1: TRLLabel;
    MTam2: TRLLabel;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLBand3: TRLBand;
    RLImage2: TRLImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    
    procedure Le_Imagem_JPEG(Campo:TBlobField;Foto:TRLImage);
  public
    { Public declarations }
  end;

var
  fRelTalaoAuxiliarLote: TfRelTalaoAuxiliarLote;

implementation

uses UTalaoAuxiliar, UDM1, UConsLoteExp;

{$R *.dfm}

procedure TfRelTalaoAuxiliarLote.Le_Imagem_JPEG(Campo:TBlobField;Foto:TRLImage);
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

procedure TfRelTalaoAuxiliarLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tPedidoMaterial.Filtered := False;
  Action := Cafree;
end;

procedure TfRelTalaoAuxiliarLote.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  vCodBarra : String;
  posicao : integer;
begin
  RLMemo1.Lines.Clear;
  PrintIt := fTalaoAuxiliar.SMDBGrid2.SelectedRows.CurrentRowSelected;
  if not PrintIt then
    exit;
  PrintIt := fTalaoAuxiliar.SMDBGrid1.SelectedRows.CurrentRowSelected;
  if not PrintIt then
    exit;
  PrintIt := fTalaoAuxiliar.tTalaoAuxiliarlkImpTalao.AsBoolean;
  if not PrintIt then
    exit;

  if fTalaoAuxiliar.tTalaoAuxiliarlkCodPosicaoMat.AsInteger > 0 then
  begin
    DM1.tPedidoMaterial.Filtered := False;
    DM1.tPedidoMaterial.Filter   := 'CodPosicao = '''+fTalaoAuxiliar.tTalaoAuxiliarlkCodPosicaoMat.AsString+'''';
    DM1.tPedidoMaterial.Filtered := True;

    DM1.tPedidoMaterial.First;
    while not DM1.tPedidoMaterial.Eof do
      begin
        RLMemo1.Lines.Add(DM1.tPedidoMateriallkNomeMaterial.AsString + ' ' + DM1.tPedidoMateriallkNomeCor.AsString);
        DM1.tPedidoMaterial.Next;
      end;

    DM1.tPedidoMaterial.Filtered := False;
  end;

  RLLabel12.Visible := (fTalaoAuxiliar.tTalaoAuxiliarTamanho.AsString <> '');
  RLLabel17.Visible := (fTalaoAuxiliar.tTalaoAuxiliarTamanho.AsString <> '');
  RLDraw1.Visible   := (fTalaoAuxiliar.tTalaoAuxiliarTamanho.AsString <> '');
  RLDraw5.Visible   := (fTalaoAuxiliar.tTalaoAuxiliarTamanho.AsString <> '');

  RLLabel26.Visible := (fTalaoAuxiliar.tTalaoAuxiliarTamanho.AsString <> '');

  vCodBarra := FormatFloat('00000',fTalaoAuxiliar.tTalaoAuxiliarLote.AsInteger) +
               FormatFloat('0000',fTalaoAuxiliar.tTalaoAuxiliarTalao.AsInteger) +
               FormatFloat('00',fTalaoAuxiliar.tTalaoAuxiliarCodSetor.AsInteger);

  //Entrada no setor
  RLLabel7.Caption   := '1' + vCodBarra;
  RLBarcode1.Caption := '1' + vCodBarra;
  RLBarcode1.Refresh;

  //Saida do setor
  RLLabel14.Caption   := '3' + vCodBarra;
  RLBarcode2.Caption  := '3' + vCodBarra;
  RLBarcode2.Refresh;

  //Controle do corte
  RLLabel22.Caption   := '5' + vCodBarra;
  RLBarcode3.Caption  := '5' + vCodBarra;
  RLBarcode3.Refresh;

  //Imprime a foto
  RLImage1.Picture := Nil;
  if fTalaoAuxiliar.tTalaoAuxiliarlkImpFotoTalaoAux.AsBoolean then
  begin
    RLImage1.Picture := RLImage2.Picture;
  end;

  {if fTalaoAuxiliar.tTalaoAuxiliarlkImpFotoTalaoAux.AsBoolean then
  begin
    if fTalaoAuxiliar.tTalaoAuxiliarCodProduto.AsInteger <> DM1.tProduto
    DM1.tProduto.FindKey([DM1.tLoteLote.AsInteger,tProdutoSetorAuxCodSetor.AsInteger,fConsLoteExp.tTalaoItem.AsInteger,Talao]) then

    DM1.tProduto.IndexFieldNames := 'Codigo';
    DM1.tProduto.SetKey;
    DM1.tProdutoCodigo.AsInteger := fTalaoAuxiliar.tTalaoAuxiliarCodProduto.AsInteger;
    if DM1.tProduto.GotoKey then
      if not DM1.tProdutoFotoJpeg.IsNull then
        Le_Imagem_JPEG(DM1.tProdutoFotoJpeg,RLImage1);
  end;}

  for posicao := 1 to 24 do
    begin
      TRLLabel(FindComponent('Tam'+IntToStr(Posicao))).Visible := False;
      TRLLabel(FindComponent('MTam'+IntToStr(Posicao))).Visible := False;
      TRLLabel(FindComponent('Qtd'+IntToStr(Posicao))).Visible := False;
      TRLLabel(FindComponent('C'+IntToStr(Posicao))).Visible := False;
      TRLLabel(FindComponent('T'+IntToStr(Posicao))).Visible := False;
      TRLDraw(FindComponent('Shape'+IntToStr(Posicao))).Visible := False;
    end;

  fTalaoAuxiliar.tTalaoAuxiliarGrade.First;
  Posicao := 0;
  while not fTalaoAuxiliar.tTalaoAuxiliarGrade.EOF do
    begin
      Inc(Posicao);
      if Posicao <= 24 then
      begin
        TRLDraw(FindComponent('Shape'+IntToStr(Posicao))).Visible := True;
        TRLLabel(FindComponent('C' + IntToStr(Posicao))).Visible  := True;
        TRLLabel(FindComponent('T' + IntToStr(Posicao))).Visible  := True;
        TRLLabel(FindComponent('Tam' + IntToStr(Posicao))).Visible  := True;
        TRLLabel(FindComponent('Tam' + IntToStr(Posicao))).Caption  := fTalaoAuxiliar.tTalaoAuxiliarGradeTamanho.AsString;
        TRLLabel(FindComponent('MTam' + IntToStr(Posicao))).Visible := True;
        TRLLabel(FindComponent('MTam' + IntToStr(Posicao))).Caption := fTalaoAuxiliar.tTalaoAuxiliarGradelkMarcarTam.AsString;
        TRLLabel(FindComponent('Qtd' + IntToStr(Posicao))).Visible  := True;
        TRLLabel(FindComponent('Qtd' + IntToStr(Posicao))).Caption  := fTalaoAuxiliar.tTalaoAuxiliarGradeQtd.AsString;
      end;
      fTalaoAuxiliar.tTalaoAuxiliarGrade.Next;
    end;
  if posicao > 12 then
    RLBand1.Height := 286
  else
    RLBand1.Height := 225;
end;

procedure TfRelTalaoAuxiliarLote.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt := fTalaoAuxiliar.SMDBGrid2.SelectedRows.CurrentRowSelected;
  if not PrintIt then
    exit;
  PrintIt := fTalaoAuxiliar.SMDBGrid1.SelectedRows.CurrentRowSelected;
  if not PrintIt then
    exit;
  PrintIt := fTalaoAuxiliar.tTalaoAuxiliarlkImpTalao.AsBoolean;
end;

procedure TfRelTalaoAuxiliarLote.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLImage2.Picture := Nil;
  if DM1.tProduto.FindKey([DM1.tPedidoItemCodProduto.AsInteger]) then
  begin
    if FileExists(DM1.tProdutoEndFoto.AsString) then
      RLImage2.Picture.LoadFromFile(DM1.tProdutoEndFoto.AsString)
    else
    if not DM1.tProdutoFotoJpeg.IsNull then
      Le_Imagem_JPEG(DM1.tProdutoFotoJpeg,RLImage2);
  end;
end;

end.




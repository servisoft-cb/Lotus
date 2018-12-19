unit URelOrdemCompraMail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RLReport, RLRichText, RLHTMLFilter, RLRichFilter, RLFilters, RLPDFFilter,
  RLPreviewForm, RLDraftFilter, RLXLSFilter, jpeg, QuickRpt, Qrctrls;

type                    

  TfRelOrdemCompraMail = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLBand1: TRLBand;
    RLLabel3: TRLLabel;
    RLLabel5: TRLLabel;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLSubDetail2: TRLSubDetail;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLSubDetail3: TRLSubDetail;
    RLBand3: TRLBand;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLDBText15: TRLDBText;
    RLDBText16: TRLDBText;
    RLDBText17: TRLDBText;
    RLDBText18: TRLDBText;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    RLDraw3: TRLDraw;
    RLSubDetail4: TRLSubDetail;
    RLBand4: TRLBand;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLDBText19: TRLDBText;
    RLDBText20: TRLDBText;
    RLDBText21: TRLDBText;
    RLDBText22: TRLDBText;
    RLDBText23: TRLDBText;
    RLDBText24: TRLDBText;
    RLDraw4: TRLDraw;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel27: TRLLabel;
    RLLabel28: TRLLabel;
    RLLabel29: TRLLabel;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    RLDBText25: TRLDBText;
    RLDraw5: TRLDraw;
    RLSubDetail5: TRLSubDetail;
    RLBand5: TRLBand;
    RLDBText26: TRLDBText;
    RLDBText27: TRLDBText;
    RLDBText29: TRLDBText;
    RLDBText30: TRLDBText;
    RLDBText31: TRLDBText;
    RLDBText32: TRLDBText;
    RLDBText33: TRLDBText;
    RLDBText34: TRLDBText;
    RLBand6: TRLBand;
    RLLabel34: TRLLabel;
    RLDraw6: TRLDraw;
    RLLabel35: TRLLabel;
    RLLabel36: TRLLabel;
    RLLabel38: TRLLabel;
    RLDraw7: TRLDraw;
    RLLabel39: TRLLabel;
    RLDraw8: TRLDraw;
    RLLabel40: TRLLabel;
    RLDraw9: TRLDraw;
    RLMemo1: TRLMemo;
    RLLabel37: TRLLabel;
    RLLabel41: TRLLabel;
    RLLabel42: TRLLabel;
    RLLabel43: TRLLabel;
    RLLabel44: TRLLabel;
    RLLabel45: TRLLabel;
    RLLabel46: TRLLabel;
    RLLabel47: TRLLabel;
    RLLabel48: TRLLabel;
    RLLabel49: TRLLabel;
    RLLabel50: TRLLabel;
    RLLabel51: TRLLabel;
    RLLabel52: TRLLabel;
    RLLabel53: TRLLabel;
    RLDraw10: TRLDraw;
    RLDBText36: TRLDBText;
    RLDBText37: TRLDBText;
    RLLabel25: TRLLabel;
    RLDBText38: TRLDBText;
    RLSubDetail6: TRLSubDetail;
    RLBand7: TRLBand;
    RLLabel56: TRLLabel;
    RLDBText35: TRLDBText;
    RLLabel57: TRLLabel;
    RLDBText39: TRLDBText;
    RLLabel58: TRLLabel;
    RLDBText40: TRLDBText;
    RLBand8: TRLBand;
    RLDBText28: TRLDBText;
    RLLabel32: TRLLabel;
    Tam1: TRLLabel;
    Tam2: TRLLabel;
    Tam3: TRLLabel;
    Tam4: TRLLabel;
    Tam5: TRLLabel;
    Tam6: TRLLabel;
    Tam7: TRLLabel;
    Tam8: TRLLabel;
    Tam9: TRLLabel;
    Tam10: TRLLabel;
    Tam11: TRLLabel;
    Tam12: TRLLabel;
    Tam13: TRLLabel;
    Tam14: TRLLabel;
    Tam15: TRLLabel;
    RLLabel33: TRLLabel;
    Qtd1: TRLLabel;
    Qtd2: TRLLabel;
    Qtd3: TRLLabel;
    Qtd4: TRLLabel;
    Qtd5: TRLLabel;
    Qtd6: TRLLabel;
    Qtd7: TRLLabel;
    Qtd8: TRLLabel;
    Qtd9: TRLLabel;
    Qtd10: TRLLabel;
    Qtd11: TRLLabel;
    Qtd12: TRLLabel;
    Qtd13: TRLLabel;
    Qtd14: TRLLabel;
    Qtd15: TRLLabel;
    RLDraw11: TRLDraw;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLSubDetail1BeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure RLBand6BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand8BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelOrdemCompraMail: TfRelOrdemCompraMail;
  vTotal : Real;
  vTotalPesoTr : Real;

implementation

uses UDM1, UOrdemCompra;

{$R *.DFM}

procedure TfRelOrdemCompraMail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelOrdemCompraMail.RLSubDetail1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  vTotal := 0;
end;

procedure TfRelOrdemCompraMail.RLBand6BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel34.Caption := 'Observações:          (Referência: ' + DM1.tOrdemCompralkReferencia.AsString + ')';
  RLLabel36.Caption := FormatFloat('###,###,##0.00',vTotal);
  RLMemo1.Lines.Add(Dm1.tOrdemCompraObs.AsString);
end;

procedure TfRelOrdemCompraMail.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel37.Caption := Dm1.tEmpresaEmpresa.AsString;
  RLLabel42.Caption := Dm1.tEmpresaEndereco.AsString;
  RLLabel48.Caption := Dm1.tEmpresaTel.AsString;
  RLLabel49.Caption := Dm1.tEmpresaFax.AsString;
  RLLabel41.Caption := Dm1.tEmpresaCidade.AsString;
  RLLabel50.Caption := Dm1.tEmpresaEstado.AsString;
  RLLabel51.Caption := Dm1.tEmpresaCep.AsString;
  RLLabel52.Caption := Dm1.tEmpresaCgc.AsString;
  RLLabel53.Caption := Dm1.tEmpresaInscr.AsString;
end;

procedure TfRelOrdemCompraMail.RLBand8BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  i : Integer;
begin
  PrintIt := (DM1.tOrdemCompraItemGrade.RecordCount > 0);
  if not PrintIt then
    exit;
  if DM1.tOrdemCompraItemGrade.RecordCount > 0 then
  begin
    for i := 1 to 15 do
    begin
      TRLLabel(FindComponent('Tam'+IntToStr(i))).Caption   := ' ';
      TRLLabel(FindComponent('Qtd'+IntToStr(i))).Caption   := ' ';
    end;
    DM1.tOrdemCompraItemGrade.First;
    i := 0;
    while not DM1.tOrdemCompraItemGrade.Eof do
    begin
      DM1.tGrade.IndexFieldNames := 'Codigo';
      DM1.tGrade.FindKey([DM1.tOrdemCompraItemGradeCodGrade.AsInteger]);
      if DM1.tOrdemCompraItemGradeQtd.AsFloat > 0 then
      begin
        inc(i);
        if i > 15 then
          ShowMessage('Existe mais de 15 tamanhos, o sistema só vai imprimir até 15...favor verificar!')
        else
        begin
          DM1.tGradeItem.SetKey;
          DM1.tGradeItemCodGrade.AsInteger := DM1.tOrdemCompraItemGradeCodGrade.AsInteger;
          DM1.tGradeItemPosicao.AsInteger  := DM1.tOrdemCompraItemGradePosicao.AsInteger;
          if DM1.tGradeItem.GotoKey then
          begin
            TRLLabel(FindComponent('Tam'+IntToStr(i))).Caption := DM1.tGradeItemTamanho.AsString;
            TRLLabel(FindComponent('Qtd'+IntToStr(i))).Caption := DM1.tOrdemCompraItemGradeQtd.AsString;
          end;
        end;
      end;
      fOrdemCompra.tMaterialGradeNum.SetKey;
      fOrdemCompra.tMaterialGradeNumCodMaterial.AsInteger := DM1.tOrdemCompraItemCodMaterial.AsInteger;
      fOrdemCompra.tMaterialGradeNumCodGrade.AsInteger    := DM1.tOrdemCompraItemGradeCodGrade.AsInteger;
      fOrdemCompra.tMaterialGradeNumPosicao.AsInteger     := DM1.tOrdemCompraItemGradePosicao.AsInteger;
      if fOrdemCompra.tMaterialGradeNum.GotoKey then
        vTotalPesoTr := vTotalPesoTr + (fOrdemCompra.tMaterialGradeNumPeso.AsFloat * DM1.tOrdemCompraItemGradeQtd.AsInteger);
      DM1.tOrdemCompraItemGrade.Next;
    end;
  end;
end;

procedure TfRelOrdemCompraMail.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  vTotal := vTotal + Dm1.tOrdemCompraItemVlrTotal.AsFloat;
end;

end.

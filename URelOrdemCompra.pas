unit URelOrdemCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, quickrpt, Qrctrls;

type
  TfRelOrdemCompra = class(TForm)
    QuickRep1: TQuickRep;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
    QRDBText18: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape4: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText20: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel18: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel24: TQRLabel;
    QRLabel28: TQRLabel;
    QRDBText31: TQRDBText;
    QRExpr1: TQRExpr;
    QRShape5: TQRShape;
    QRSubDetail1: TQRSubDetail;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRBand1: TQRBand;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    ChildBand1: TQRChildBand;
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
    QRLabel31: TQRLabel;
    Preco1: TQRLabel;
    Preco2: TQRLabel;
    Preco3: TQRLabel;
    Preco4: TQRLabel;
    Preco5: TQRLabel;
    Preco6: TQRLabel;
    Preco7: TQRLabel;
    Preco8: TQRLabel;
    Preco9: TQRLabel;
    Preco10: TQRLabel;
    Preco11: TQRLabel;
    Preco12: TQRLabel;
    Preco13: TQRLabel;
    Preco14: TQRLabel;
    Preco15: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape8: TQRShape;
    QRLabel35: TQRLabel;
    QRShape9: TQRShape;
    QRLabel36: TQRLabel;
    QRSubDetail2: TQRSubDetail;
    QRDBText11: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText12: TQRDBText;
    QRShape10: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel41: TQRLabel;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRLabel40: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel42: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelOrdemCompra: TfRelOrdemCompra;
  vTotalPesoTr : Real;

implementation

uses UDM1, UOrdemCompra;

{$R *.DFM}

procedure TfRelOrdemCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelOrdemCompra.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
 i : Integer;
begin
  PrintBand := DM1.tOrdemCompraItemlkLancaGrade.AsBoolean;
  if DM1.tOrdemCompraItemlkLancaGrade.AsBoolean then
    begin
      for i := 1 to 15 do
        begin
          TQRLabel(FindComponent('Tam'+IntToStr(i))).Caption   := ' ';
          TQRLabel(FindComponent('Qtd'+IntToStr(i))).Caption   := ' ';
          TQRLabel(FindComponent('Preco'+IntToStr(i))).Caption := ' ';
        end;
      i := 0;
      DM1.tOrdemCompraItemGrade.First;
      if DM1.tOrdemCompraItemlkPrecoGrade.AsBoolean then
        ChildBand1.Height := 60
      else
        ChildBand1.Height := 42;
//      DM1.tMaterial.FindKey([DM1.tOrdemCompraItemCodMaterial.AsInteger]);
//      fOrdemCompra.tMaterialGradeNum.First;
      while not DM1.tOrdemCompraItemGrade.Eof do
        begin
          inc(i);
          DM1.tGrade.IndexFieldNames := 'Codigo';
          DM1.tGrade.FindKey([DM1.tOrdemCompraItemGradeCodGrade.AsInteger]);
          DM1.tGradeItem.SetKey;
          DM1.tGradeItemCodGrade.AsInteger := DM1.tOrdemCompraItemGradeCodGrade.AsInteger;
          DM1.tGradeItemPosicao.AsInteger  := DM1.tOrdemCompraItemGradePosicao.AsInteger;
          if DM1.tGradeItem.GotoKey then
            begin
              TQRLabel(FindComponent('Tam'+IntToStr(i))).Caption := DM1.tGradeItemTamanho.AsString;
              TQRLabel(FindComponent('Qtd'+IntToStr(i))).Caption := DM1.tOrdemCompraItemGradeQtd.AsString;
              TQRLabel(FindComponent('Preco'+IntToStr(i))).Caption := FormatFloat('##,##0.00',DM1.tOrdemCompraItemGradeVlrUnitario.AsFloat);
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

procedure TfRelOrdemCompra.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 if vTotalPesoTr > 0 then
   begin
     QRLabel32.Enabled := True;
     QRLabel33.Enabled := True;
     QRLabel33.Caption := FormatFloat('###,##0.000',vTotalPesoTr);
   end
 else
   begin
     QRLabel32.Enabled := False;
     QRLabel33.Enabled := False;
   end;
end;

procedure TfRelOrdemCompra.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  vTotalPesoTr := 0;
end;

end.

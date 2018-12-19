unit URelCPagar3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, DB;

type
  TfRelCPagar3 = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLDraw1: TRLDraw;
    RLLabel2: TRLLabel;
    RLDraw2: TRLDraw;
    RLLabel3: TRLLabel;
    RLDraw3: TRLDraw;
    RLLabel4: TRLLabel;
    RLDraw4: TRLDraw;
    RLLabel5: TRLLabel;
    RLDraw5: TRLDraw;
    RLLabel8: TRLLabel;
    RLDraw6: TRLDraw;
    RLLabel9: TRLLabel;
    RLDraw7: TRLDraw;
    RLLabel10: TRLLabel;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLLabel11: TRLLabel;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLDraw8: TRLDraw;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLBand3: TRLBand;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLDraw9: TRLDraw;
    RLBand4: TRLBand;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel27: TRLLabel;
    RLDraw10: TRLDraw;
    RLLabel29: TRLLabel;
    RLDBText7: TRLDBText;
    RLLabel28: TRLLabel;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    RLLabel32: TRLLabel;
    RLLabel33: TRLLabel;
    RLLabel34: TRLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    vTotalRestanteDia, vTotalRestanteMes, vTotalRestanteGeral : Real;
    vTotalDia, vTotalMes, vTotalGeral : Real;

  end;

var
  fRelCPagar3: TfRelCPagar3;

implementation

uses UDM1, UContasPagar2;

{$R *.dfm}

procedure TfRelCPagar3.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelCPagar3.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if (fContasPagar2.qParcelasNomeBancoForn.AsString <> '') or (fContasPagar2.qParcelasAgenciaForn.AsString <> '') or
     (fContasPagar2.qParcelasNumContaForn.AsString <> '') then
    begin
      RLBand2.Height := 34;
      RLLabel13.Caption := fContasPagar2.qParcelasNomeBancoForn.AsString + ' / ' +
                           fContasPagar2.qParcelasAgenciaForn.AsString + ' / ' +
                           fContasPagar2.qParcelasNumContaForn.AsString;
    end
  else
    RLBand2.Height := 17;
  if fContasPagar2.qParcelasTipoConta.AsString = 'I' then
    RLDBText6.Color := clSilver
  else
    RLDBText6.Color := clWhite;
  RLLabel11.Caption := fContasPagar2.qParcelasNroDuplicata.AsString + '  ' + fContasPagar2.qParcelasParcCPagar.AsString;
  if DM1.tCPagar.Locate('NumCPagar',fContasPagar2.qParcelasNumCPagar.AsInteger,[loCaseInsensitive]) then
    RLLabel11.Caption := RLLabel11.Caption + '/' + IntToStr(DM1.tCPagarParc.RecordCount);

  //vQtdTitulosDia      := vQtdTitulosDia + 1;
  //vQtdTitulosMes      := vQtdTitulosMes + 1;
  //vQtdTitulos         := vQtdTitulos + 1;
  if fContasPagar2.qParcelasTipoConta.AsString <> 'I' then
    begin
      vTotalRestanteDia   := vTotalRestanteDia + fContasPagar2.qParcelasRestParcela.AsFloat;
      vTotalRestanteMes   := vTotalRestanteMes + fContasPagar2.qParcelasRestParcela.AsFloat;
      vTotalRestanteGeral := vTotalRestanteGeral + fContasPagar2.qParcelasRestParcela.AsFloat;

      vTotalDia   := vTotalDia + fContasPagar2.qParcelasVlrParcCPagar.AsFloat;
      vTotalMes   := vTotalMes + fContasPagar2.qParcelasVlrParcCPagar.AsFloat;
      vTotalGeral := vTotalGeral + fContasPagar2.qParcelasVlrParcCPagar.AsFloat;

      vQtdTitulosDia      := vQtdTitulosDia + 1;
      vQtdTitulosMes      := vQtdTitulosMes + 1;
      vQtdTitulos         := vQtdTitulos + 1;

      RLDBText6.Color := clWhite;
    end
  else
    RLDBText6.Color := clSilver;
end;

procedure TfRelCPagar3.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel15.Caption := '';
  if fContasPagar2.RxDBLookupCombo1.Text <> '' then
    RLLabel15.Caption := 'Fornecedor : ' + fContasPagar2.RxDBLookupCombo1.Text;
  case fContasPagar2.ComboBox1.ItemIndex of
    0 : RLLabel15.Caption := RLLabel15.Caption + ' - Pendetes';
    1 : RLLabel15.Caption := RLLabel15.Caption + ' - Pagas';
    2 : RLLabel15.Caption := RLLabel15.Caption + ' - Todas';
  end;
  if fContasPagar2.DateEdit1.Date > 0 then
    RLLabel15.Caption := RLLabel15.Caption + ' - Vecto Inicial: ' + fContasPagar2.DateEdit1.Text;
  if fContasPagar2.DateEdit2.Date > 0 then
    RLLabel15.Caption := RLLabel15.Caption + ' - Vecto Final: ' + fContasPagar2.DateEdit2.Text;
end;

procedure TfRelCPagar3.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
 vData : TDateTime;
 i     : Integer;
 dia, mes, ano : word;
 dia2, mes2, ano2 : word;
begin
  //PrintIt := fContasPagar2.CheckBox2.Checked;
  //if PrintIt then
    //begin
      RLLabel17.Caption := FormatFloat('###,###,##0.00',vTotalRestanteDia);
      RLLabel19.Caption := FormatFloat('###,###,##0.00',vTotalRestanteMes);

      RLLabel32.Caption := FormatFloat('###,###,##0.00',vTotalDia);
      RLLabel30.Caption := FormatFloat('###,###,##0.00',vTotalMes);

      RLLabel23.Caption := IntToStr(vQtdTitulosDia);
      RLLabel24.Caption := IntToStr(vQtdTitulosMes);
      vData := fContasPagar2.qParcelasDtVencCPagar.AsDateTime;
      DecodeDate(vData, Ano, Mes, Dia);
      if (fContasPagar2.qParcelas.Eof) or (fContasPagar2.qParcelas.RecNo = fContasPagar2.qParcelas.RecordCount) then
        RLBand3.Height := 35
      else
        begin
          fContasPagar2.qParcelas.Next;
          DecodeDate(fContasPagar2.qParcelasDtVencCPagar.AsDateTime, Ano2, Mes2, Dia2);
          //if (fContasPagar.Query1.Eof) or (fContasPagar.Query1.RecNo = fContasPagar.Query1.RecordCount) then
          //  RLBand3.Height := 35
          //else
          if vData <> fContasPagar2.qParcelasDtVencCPagar.AsDateTime then
            begin
              if (mes <> mes2) or ((mes = mes2) and (ano <> ano2)) then
                RLBand3.Height := 35
              else
                RLBand3.Height := 20;
            end
          else
            PrintIt  := False;
          fContasPagar2.qParcelas.Prior;
        end;
      if PrintIt then
        begin
          vTotalRestanteDia := 0;
          vQtdTitulosDia    := 0;
          vTotalDia         := 0;
          if RLBand3.Height = 35 then
            begin
              vTotalRestanteMes := 0;
              vTotalMes         := 0;
              vQtdTitulosMes    := 0;
            end;
        end;
    //end;
end;

procedure TfRelCPagar3.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel26.Caption   := FormatFloat('###,###,##0.00',vTotalRestanteGeral);
  RLLabel27.Caption   := IntToStr(vQtdTitulos);

  RLLabel34.Caption   := FormatFloat('###,###,##0.00',vTotalGeral);

  vTotalRestanteGeral := 0;
  vTotalGeral         := 0;

  vQtdTitulos         := 0;
end;

end.

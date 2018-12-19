unit URelCPagar2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, DB;

type
  TfRelCPagar2 = class(TForm)
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
    RLLabel28: TRLLabel;
    RLDraw10: TRLDraw;
    RLLabel29: TRLLabel;
    RLDBText7: TRLDBText;
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
  end;

var
  fRelCPagar2: TfRelCPagar2;

implementation

uses UContasPagar, UDM1;

{$R *.dfm}

procedure TfRelCPagar2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelCPagar2.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if (fContasPagar.Query1NomeBancoForn.AsString <> '') or (fContasPagar.Query1AgenciaForn.AsString <> '') or
     (fContasPagar.Query1NumContaForn.AsString <> '') then
    begin
      RLBand2.Height := 34;
      RLLabel13.Caption := fContasPagar.Query1NomeBancoForn.AsString + ' / ' +
                           fContasPagar.Query1AgenciaForn.AsString + ' / ' +
                           fContasPagar.Query1NumContaForn.AsString;
    end
  else
    RLBand2.Height := 17;

  RLLabel11.Caption := fContasPagar.Query1Duplicata.AsString + '  ' + fContasPagar.Query1Parcela.AsString;
  if DM1.tCPagar.Locate('NumCPagar',fContasPagar.Query1NumCPagar.AsInteger,[loCaseInsensitive]) then
    RLLabel11.Caption := RLLabel11.Caption + '/' + IntToStr(DM1.tCPagarParc.RecordCount);

  //vQtdTitulosDia      := vQtdTitulosDia + 1;
  //vQtdTitulosMes      := vQtdTitulosMes + 1;
  //vQtdTitulos         := vQtdTitulos + 1;
  if fContasPagar.Query1lkTipoConta.AsString <> 'I' then
    begin
      vTotalRestanteDia   := vTotalRestanteDia + fContasPagar.Query1ValorRestante.AsFloat;
      vTotalRestanteMes   := vTotalRestanteMes + fContasPagar.Query1ValorRestante.AsFloat;
      vTotalRestanteGeral := vTotalRestanteGeral + fContasPagar.Query1ValorRestante.AsFloat;

      vQtdTitulosDia      := vQtdTitulosDia + 1;
      vQtdTitulosMes      := vQtdTitulosMes + 1;
      vQtdTitulos         := vQtdTitulos + 1;

      RLDBText6.Color := clWhite;
    end
  else
    RLDBText6.Color := clSilver;

end;

procedure TfRelCPagar2.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel15.Caption := '';
  if fContasPagar.RxDBLookupCombo1.Text <> '' then
    RLLabel15.Caption := 'Fornecedor : ' + fContasPagar.RxDBLookupCombo1.Text;
  case fContasPagar.RadioGroup1.ItemIndex of
    0 : RLLabel15.Caption := RLLabel15.Caption + '  -- Pendetes';
    1 : RLLabel15.Caption := RLLabel15.Caption + '  -- Pagas';
    2 : RLLabel15.Caption := RLLabel15.Caption + '  -- Todas';
  end;
  if fContasPagar.CheckBox1.Checked then
    RLLabel15.Caption := RLLabel15.Caption + '  -- Periodo: ' + fContasPagar.DateEdit1.Text + ' a ' + fContasPagar.DateEdit2.Text;
end;

procedure TfRelCPagar2.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
 vData : TDateTime;
 i     : Integer;
 dia, mes, ano : word;
 dia2, mes2, ano2 : word;
begin
  PrintIt := fContasPagar.CheckBox2.Checked;
  if PrintIt then
    begin
      RLLabel17.Caption := FormatFloat('###,###,##0.00',vTotalRestanteDia);
      RLLabel19.Caption := FormatFloat('###,###,##0.00',vTotalRestanteMes);
      RLLabel23.Caption := IntToStr(vQtdTitulosDia);
      RLLabel24.Caption := IntToStr(vQtdTitulosMes);
      vData := fContasPagar.Query1Data.AsDateTime;
      DecodeDate(vData, Ano, Mes, Dia);
      if (fContasPagar.Query1.Eof) or (fContasPagar.Query1.RecNo = fContasPagar.Query1.RecordCount) then
        RLBand3.Height := 35
      else
        begin
          fContasPagar.Query1.Next;
          DecodeDate(fContasPagar.Query1Data.AsDateTime, Ano2, Mes2, Dia2);
          //if (fContasPagar.Query1.Eof) or (fContasPagar.Query1.RecNo = fContasPagar.Query1.RecordCount) then
          //  RLBand3.Height := 35
          //else
          if vData <> fContasPagar.Query1Data.AsDateTime then
            begin
              if (mes <> mes2) or ((mes = mes2) and (ano <> ano2)) then
                RLBand3.Height := 35
              else
                RLBand3.Height := 20;
            end
          else
            PrintIt  := False;
          fContasPagar.Query1.Prior;
        end;
      if PrintIt then
        begin
          vTotalRestanteDia := 0;
          vQtdTitulosDia    := 0;
          if RLBand3.Height = 35 then
            begin
              vTotalRestanteMes := 0;
              vQtdTitulosMes    := 0;
            end;
        end;
    end;
end;

procedure TfRelCPagar2.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel26.Caption   := FormatFloat('###,###,##0.00',vTotalRestanteGeral);
  RLLabel27.Caption   := IntToStr(vQtdTitulos);
  vTotalRestanteGeral := 0;
  vQtdTitulos         := 0;
end;

end.

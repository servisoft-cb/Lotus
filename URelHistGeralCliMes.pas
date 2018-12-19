unit URelHistGeralCliMes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, DB, DBTables;

type
  TfRelHistGeralCliMes = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLDraw1: TRLDraw;
    RLLabel6: TRLLabel;
    RLDBText1: TRLDBText;
    RLDraw4: TRLDraw;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLD1: TRLDraw;
    Data1: TRLLabel;
    Fat1: TRLDBText;
    RLD2: TRLDraw;
    Data2: TRLLabel;
    RLD3: TRLDraw;
    Data3: TRLLabel;
    RLD4: TRLDraw;
    Data4: TRLLabel;
    RLD5: TRLDraw;
    Data5: TRLLabel;
    RLD6: TRLDraw;
    Data6: TRLLabel;
    RLD7: TRLDraw;
    Data7: TRLLabel;
    RLD8: TRLDraw;
    Data8: TRLLabel;
    RLD9: TRLDraw;
    Data9: TRLLabel;
    RLD10: TRLDraw;
    Data10: TRLLabel;
    RLD11: TRLDraw;
    Data11: TRLLabel;
    RLD12: TRLDraw;
    Data12: TRLLabel;
    RLD13: TRLDraw;
    Data13: TRLLabel;
    Fat2: TRLDBText;
    Fat3: TRLDBText;
    Fat4: TRLDBText;
    Fat5: TRLDBText;
    Fat6: TRLDBText;
    Fat7: TRLDBText;
    Fat8: TRLDBText;
    Fat9: TRLDBText;
    Fat10: TRLDBText;
    Fat11: TRLDBText;
    Fat12: TRLDBText;
    Fat13: TRLDBText;
    RLDBResult1: TRLDBResult;
    RLLabel11: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel12: TRLLabel;
    Qtd1: TRLDBText;
    QtdPedido1: TRLDBText;
    QtdRestante1: TRLDBText;
    Qtd2: TRLDBText;
    QtdPedido2: TRLDBText;
    QtdRestante2: TRLDBText;
    Qtd3: TRLDBText;
    QtdPedido3: TRLDBText;
    QtdRestante3: TRLDBText;
    Qtd4: TRLDBText;
    QtdPedido4: TRLDBText;
    QtdRestante4: TRLDBText;
    Qtd5: TRLDBText;
    QtdPedido5: TRLDBText;
    QtdRestante5: TRLDBText;
    Qtd6: TRLDBText;
    QtdPedido6: TRLDBText;
    QtdRestante6: TRLDBText;
    Qtd7: TRLDBText;
    QtdPedido7: TRLDBText;
    QtdRestante7: TRLDBText;
    Qtd8: TRLDBText;
    QtdPedido8: TRLDBText;
    QtdRestante8: TRLDBText;
    Qtd9: TRLDBText;
    QtdPedido9: TRLDBText;
    QtdRestante9: TRLDBText;
    Qtd10: TRLDBText;
    QtdPedido10: TRLDBText;
    QtdRestante10: TRLDBText;
    Qtd11: TRLDBText;
    QtdPedido11: TRLDBText;
    QtdRestante11: TRLDBText;
    Qtd12: TRLDBText;
    QtdPedido12: TRLDBText;
    QtdRestante12: TRLDBText;
    Qtd13: TRLDBText;
    QtdPedido13: TRLDBText;
    QtdRestante13: TRLDBText;
    RLLabel13: TRLLabel;
    Perc1: TRLDBText;
    Perc2: TRLDBText;
    Perc3: TRLDBText;
    Perc4: TRLDBText;
    Perc5: TRLDBText;
    Perc6: TRLDBText;
    Perc7: TRLDBText;
    Perc8: TRLDBText;
    Perc9: TRLDBText;
    Perc10: TRLDBText;
    Perc11: TRLDBText;
    Perc12: TRLDBText;
    Perc13: TRLDBText;
    RLLabel14: TRLLabel;
    QtdCancelada1: TRLDBText;
    QtdCancelada2: TRLDBText;
    QtdCancelada3: TRLDBText;
    QtdCancelada4: TRLDBText;
    QtdCancelada5: TRLDBText;
    QtdCancelada6: TRLDBText;
    QtdCancelada7: TRLDBText;
    QtdCancelada8: TRLDBText;
    QtdCancelada9: TRLDBText;
    QtdCancelada10: TRLDBText;
    QtdCancelada11: TRLDBText;
    QtdCancelada12: TRLDBText;
    QtdCancelada13: TRLDBText;
    FatMensal1: TRLLabel;
    FatMensal2: TRLLabel;
    FatMensal3: TRLLabel;
    FatMensal4: TRLLabel;
    FatMensal5: TRLLabel;
    FatMensal6: TRLLabel;
    FatMensal7: TRLLabel;
    FatMensal8: TRLLabel;
    FatMensal9: TRLLabel;
    FatMensal10: TRLLabel;
    FatMensal11: TRLLabel;
    FatMensal12: TRLLabel;
    FatMensal13: TRLLabel;
    RLSubDetail2: TRLSubDetail;
    RLBand4: TRLBand;
    RLDBText2: TRLDBText;
    ProdFat1: TRLDBText;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    ProdQtd1: TRLDBText;
    ProdQtdPedido1: TRLDBText;
    ProdQtdRestante1: TRLDBText;
    RLLabel18: TRLLabel;
    ProdPerc1: TRLDBText;
    RLLabel19: TRLLabel;
    ProdQtdCancelada1: TRLDBText;
    RLDBText51: TRLDBText;
    RLDraw2: TRLDraw;
    RLDraw3: TRLDraw;
    RLDraw5: TRLDraw;
    ProdFat2: TRLDBText;
    ProdQtd2: TRLDBText;
    ProdQtdPedido2: TRLDBText;
    ProdQtdRestante2: TRLDBText;
    ProdPerc2: TRLDBText;
    ProdQtdCancelada2: TRLDBText;
    ProdFat3: TRLDBText;
    ProdQtd3: TRLDBText;
    ProdQtdPedido3: TRLDBText;
    ProdQtdRestante3: TRLDBText;
    ProdPerc3: TRLDBText;
    ProdQtdCancelada3: TRLDBText;
    ProdFat4: TRLDBText;
    ProdQtd4: TRLDBText;
    ProdQtdPedido4: TRLDBText;
    ProdQtdRestante4: TRLDBText;
    ProdPerc4: TRLDBText;
    ProdQtdCancelada4: TRLDBText;
    ProdFat5: TRLDBText;
    ProdQtd5: TRLDBText;
    ProdQtdPedido5: TRLDBText;
    ProdQtdRestante5: TRLDBText;
    ProdPerc5: TRLDBText;
    ProdQtdCancelada5: TRLDBText;
    ProdFat6: TRLDBText;
    ProdQtd6: TRLDBText;
    ProdQtdPedido6: TRLDBText;
    ProdQtdRestante6: TRLDBText;
    ProdPerc6: TRLDBText;
    ProdQtdCancelada6: TRLDBText;
    ProdFat7: TRLDBText;
    ProdQtd7: TRLDBText;
    ProdQtdPedido7: TRLDBText;
    ProdQtdRestante7: TRLDBText;
    ProdPerc7: TRLDBText;
    ProdQtdCancelada7: TRLDBText;
    ProdFat8: TRLDBText;
    ProdQtd8: TRLDBText;
    ProdQtdPedido8: TRLDBText;
    ProdQtdRestante8: TRLDBText;
    ProdPerc8: TRLDBText;
    ProdQtdCancelada8: TRLDBText;
    ProdFat9: TRLDBText;
    ProdQtd9: TRLDBText;
    ProdQtdPedido9: TRLDBText;
    ProdQtdRestante9: TRLDBText;
    ProdPerc9: TRLDBText;
    ProdQtdCancelada9: TRLDBText;
    ProdFat10: TRLDBText;
    ProdQtd10: TRLDBText;
    ProdQtdPedido10: TRLDBText;
    ProdQtdRestante10: TRLDBText;
    ProdPerc10: TRLDBText;
    ProdQtdCancelada10: TRLDBText;
    ProdFat11: TRLDBText;
    ProdQtd11: TRLDBText;
    ProdQtdPedido11: TRLDBText;
    ProdQtdRestante11: TRLDBText;
    ProdPerc11: TRLDBText;
    ProdQtdCancelada11: TRLDBText;
    ProdFat12: TRLDBText;
    ProdQtd12: TRLDBText;
    ProdQtdPedido12: TRLDBText;
    ProdQtdRestante12: TRLDBText;
    ProdPerc12: TRLDBText;
    ProdQtdCancelada12: TRLDBText;
    ProdFat13: TRLDBText;
    ProdQtd13: TRLDBText;
    ProdQtdPedido13: TRLDBText;
    ProdQtdRestante13: TRLDBText;
    ProdPerc13: TRLDBText;
    ProdQtdCancelada13: TRLDBText;
    RLLabel20: TRLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelHistGeralCliMes: TfRelHistGeralCliMes;

implementation

uses UHistGeral, ToolEdit;

{$R *.dfm}

procedure TfRelHistGeralCliMes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelHistGeralCliMes.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  i : Integer;  
begin
  RLLabel1.Caption := 'Relatório de Faturamento Cliente Acumulado por Mês';
  if fHistGeral.DateEdit1.Date > 0 then
    RLLabel1.Caption := RLLabel1.Caption + ' - Inicio ' + fHistGeral.DateEdit1.Text;
  if fHistGeral.DateEdit2.Date > 0 then
    RLLabel1.Caption := RLLabel1.Caption + ' - Final ' + fHistGeral.DateEdit2.Text;
  RLLabel5.Caption := '';
  //if fHistGeral.RxDBLookupCombo2.Text <> '' then
  //  RLLabel5.Caption := 'Filial: ' + fHistGeral.RxDBLookupCombo2.Text;
  if fHistGeral.RxDBLookupCombo1.Text <> '' then
    RLLabel5.Caption := RLLabel5.Caption + ' - Cliente: ' + fHistGeral.RxDBLookupCombo1.Text;
  if fHistGeral.RxDBLookupCombo4.Text <> '' then
    RLLabel5.Caption := RLLabel5.Caption + ' - Vendedor: ' + fHistGeral.RxDBLookupCombo4.Text;
  if fHistGeral.RxDBLookupCombo3.Text <> '' then
    RLLabel5.Caption := RLLabel5.Caption + ' - Refer.: ' + fHistGeral.RxDBLookupCombo3.Text + ' ' + fHistGeral.Label4.Caption;

  for i := 1 to 13 do
    begin
      TRLDraw(FindComponent('RLD'+IntToStr(i))).Visible        := False;
      TRLLabel(FindComponent('Data'+IntToStr(i))).Visible      := False;
      TRLLabel(FindComponent('FatMensal'+IntToStr(i))).Visible := False;
    end;

  i := 0;
  fHistGeral.mDatas.First;
  while not fHistGeral.mDatas.Eof do
    begin
      inc(i);
      TRLDraw(FindComponent('RLD'+IntToStr(i))).Visible   := True;
      TRLLabel(FindComponent('Data'+IntToStr(i))).Visible := True;
      TRLLabel(FindComponent('Data'+IntToStr(i))).Caption := fHistGeral.mDatasData.AsString;
      if fHistGeral.mFatMensal.Locate('Data',fHistGeral.mDatasData.AsString,[loCaseInsensitive]) then
        begin
          TRLLabel(FindComponent('FatMensal'+IntToStr(i))).Visible := True;
          TRLLabel(FindComponent('FatMensal'+IntToStr(i))).Caption := FormatFloat('###,###,###,###,##0.00',fHistGeral.mFatMensalVlrFaturamento.AsFloat);
        end;
      fHistGeral.mDatas.Next;
    end;

  TRLLabel(FindComponent('FatMensal'+IntToStr(fHistGeral.vContadorMes + 1))).Visible := True;
end;

procedure TfRelHistGeralCliMes.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  vAux : Real;
begin
  RLLabel10.Caption := FormatFloat('###,###,##0.00',fHistGeral.CurrencyEdit1.Value);
  vAux := StrToFloat(FormatFloat('0.00',(RLDBResult1.Value / fHistGeral.CurrencyEdit1.Value) * 100));
  RLLabel20.Caption := '% ' + FormatFloat('0.00',vAux);
end;

procedure TfRelHistGeralCliMes.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  i : Integer;
begin
  if fHistGeral.mClienteMesCodAgrupado.AsString = 'T99999' then
    begin
      RLDBText1.Color      := clSilver;
      RLDBText1.Font.Style := [fsBold];
    end
  else
    begin
      RLDBText1.Color      := clWhite;
      RLDBText1.Font.Style := [];
    end;

  i := fHistGeral.vContadorMes + 1;
  while i < 13 do
    begin
      inc(i);
      TRLDBText(FindComponent('Fat'+IntToStr(i))).Visible          := False;
      TRLDBText(FindComponent('Perc'+IntToStr(i))).Visible         := False;
      TRLDBText(FindComponent('Qtd'+IntToStr(i))).Visible          := False;
      TRLDBText(FindComponent('QtdPedido'+IntToStr(i))).Visible    := False;
      TRLDBText(FindComponent('QtdRestante'+IntToStr(i))).Visible  := False;
      TRLDBText(FindComponent('QtdCancelada'+IntToStr(i))).Visible := False;
    end;
  if fHistGeral.CheckBox1.Checked then
    RLBand2.Height := 76
  else
    RLBand2.Height := 26;

  if fHistGeral.vComProduto then
    begin
      fHistGeral.mProdutoMes.Filtered := False;
      fHistGeral.mProdutoMes.Filter   := 'CodAgrupado = '''+fHistGeral.mClienteMesCodAgrupado.AsString+'''';
      fHistGeral.mProdutoMes.Filtered := True;
    end;
  RLDraw4.Visible := not(fHistGeral.vComProduto);
end;

procedure TfRelHistGeralCliMes.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  i : Integer;  
begin
  i := fHistGeral.vContadorMes + 1;
  while i < 13 do
    begin
      inc(i);
      TRLDBText(FindComponent('ProdFat'+IntToStr(i))).Visible          := False;
      TRLDBText(FindComponent('ProdPerc'+IntToStr(i))).Visible         := False;
      TRLDBText(FindComponent('ProdQtd'+IntToStr(i))).Visible          := False;
      TRLDBText(FindComponent('ProdQtdPedido'+IntToStr(i))).Visible    := False;
      TRLDBText(FindComponent('ProdQtdRestante'+IntToStr(i))).Visible  := False;
      TRLDBText(FindComponent('ProdQtdCancelada'+IntToStr(i))).Visible := False;
    end;

  if fHistGeral.CheckBox1.Checked then
    RLBand4.Height := 84
  else
    RLBand4.Height := 31;
end;

end.

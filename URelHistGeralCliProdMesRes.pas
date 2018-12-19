unit URelHistGeralCliProdMesRes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, DB, DBTables;

type
  TfRelHistGeralCliProdMesRes = class(TForm)
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
    RLDraw3: TRLDraw;
    RLDraw5: TRLDraw;
    RLLabel20: TRLLabel;
    RLDraw2: TRLDraw;
    RLLabel7: TRLLabel;
    RLDBText2: TRLDBText;
    RLDraw6: TRLDraw;
    RLLabel8: TRLLabel;
    RLDBText3: TRLDBText;
    RLDraw7: TRLDraw;
    RLLabel12: TRLLabel;
    RLDBText4: TRLDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelHistGeralCliProdMesRes: TfRelHistGeralCliProdMesRes;

implementation

uses UHistGeral, ToolEdit;

{$R *.dfm}

procedure TfRelHistGeralCliProdMesRes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelHistGeralCliProdMesRes.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  i : Integer;  
begin
  RLLabel1.Caption := 'Relatório de Faturamento Cliente por Produto';
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
  TRLLabel(FindComponent('FatMensal'+IntToStr(fHistGeral.vContadorMes + 1))).Caption := FormatFloat('###,###,###,###,##0.00',fHistGeral.CurrencyEdit1.Value);
end;

procedure TfRelHistGeralCliProdMesRes.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  vAux : Real;
begin
  RLLabel10.Caption := FormatFloat('###,###,###,###,##0.00',fHistGeral.CurrencyEdit1.Value);
  vAux := StrToFloat(FormatFloat('0.00',(RLDBResult1.Value / fHistGeral.CurrencyEdit1.Value) * 100));
  RLLabel20.Caption := '% ' + FormatFloat('0.00',vAux);
end;

procedure TfRelHistGeralCliProdMesRes.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  i : Integer;
begin
  if fHistGeral.mClienteProdMesResCodAgrupado.AsString = 'ZZZZZ' then
    begin
      RLBand2.Color        := clSilver;
      RLDBText1.Color      := clSilver;
      RLDBText2.Color      := clSilver;
      RLDBText3.Color      := clSilver;
      RLDBText4.Color      := clSilver;
      RLDBText2.Visible    := False;
      //RLDBText1.Font.Style := [fsBold];
    end
  else
    begin
      RLDBText1.Color      := clWhite;
      RLDBText2.Color      := clWhite;
      RLDBText3.Color      := clWhite;
      RLDBText4.Color      := clWhite;
      RLBand2.Color        := clWhite;
      RLDBText2.Visible    := True;
      //RLDBText1.Font.Style := [];
    end;

  i := fHistGeral.vContadorMes + 1;
  while i < 13 do
    begin
      inc(i);
      TRLDBText(FindComponent('Fat'+IntToStr(i))).Visible  := False;
    end;
end;

end.

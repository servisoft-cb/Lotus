unit URelHistGeralCliProdMes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, DB, DBTables;

type
  TfRelHistGeralCliProdMes = class(TForm)
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
    Fat2: TRLDBText;
    Fat3: TRLDBText;
    RLLabel11: TRLLabel;
    RLLabel7: TRLLabel;
    RLDraw2: TRLDraw;
    RLLabel8: TRLLabel;
    RLDraw3: TRLDraw;
    RLLabel12: TRLLabel;
    RLDBText2: TRLDBText;
    RLDraw4: TRLDraw;
    RLLabel13: TRLLabel;
    RLDBText3: TRLDBText;
    RLDraw5: TRLDraw;
    RLLabel14: TRLLabel;
    RLDBText4: TRLDBText;
    RLDraw6: TRLDraw;
    RLLabel15: TRLLabel;
    RLDraw7: TRLDraw;
    RLLabel16: TRLLabel;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDraw8: TRLDraw;
    RLBand4: TRLBand;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLBand5: TRLBand;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    vImprimir : Boolean;
  public
    { Public declarations }
    vCodCliente, vCodProduto, vAno, vMes : Integer;
    vTotalFatCli, vTotalFatData, vTotalGeral : Real;
  end;

var
  fRelHistGeralCliProdMes: TfRelHistGeralCliProdMes;

implementation

uses UHistGeral, ToolEdit;

{$R *.dfm}

procedure TfRelHistGeralCliProdMes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelHistGeralCliProdMes.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel1.Caption := 'Relatório de Faturamento Cliente Produto por Mês';
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
end;

procedure TfRelHistGeralCliProdMes.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel10.Caption := FormatFloat('###,###,###,###,##0.00',fHistGeral.CurrencyEdit1.Value);
  RLLabel19.Caption := FormatFloat('###,###,###,###,##0.00',vTotalGeral);
  vTotalGeral   := 0;
  vTotalFatCli  := 0;
  vTotalFatData := 0;
end;

procedure TfRelHistGeralCliProdMes.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel7.Caption := fHistGeral.mClienteProdMesMes.AsString + '/' + fHistGeral.mClienteProdMesAno.AsString;
  vTotalFatCli  := vTotalFatCli + fHistGeral.mClienteProdMesVlrFaturamento.AsFloat;
  vTotalFatData := vTotalFatData + fHistGeral.mClienteProdMesVlrFaturamento.AsFloat;
  vTotalGeral   := vTotalGeral + fHistGeral.mClienteProdMesVlrFaturamento.AsFloat;
end;

procedure TfRelHistGeralCliProdMes.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt     := False;
  if (fHistGeral.mClienteProdMes.IndexFieldNames = 'Ano;Mes;Referencia;NomeCliente') or
     (fHistGeral.mClienteProdMes.IndexFieldNames = 'Ano;Mes;NomeCliente;Referencia') then
    begin
      vAno        := fHistGeral.mClienteProdMesAno.AsInteger;
      vMes        := fHistGeral.mClienteProdMesMes.AsInteger;
      if (fHistGeral.mClienteProdMes.RecordCount = fHistGeral.mClienteProdMes.RecNo) or
         (fHistGeral.mClienteProdMes.Eof) then
        PrintIt := True
      else
        begin
          fHistGeral.mClienteProdMes.Next;
          if (vAno <> fHistGeral.mClienteProdMesAno.AsInteger) or (vMes <> fHistGeral.mClienteProdMesMes.AsInteger) then
            PrintIt := True;
          fHistGeral.mClienteProdMes.Prior;
        end;
      if PrintIt then
        begin
          RLLabel18.Caption := FormatFloat('###,###,##0.00',vTotalFatData);
          vTotalFatData     := 0;
        end;
    end;
end;

procedure TfRelHistGeralCliProdMes.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt     := False;
  if (fHistGeral.mClienteProdMes.IndexFieldNames = 'NomeCliente;Ano;Mes;Referencia') or
     (fHistGeral.mClienteProdMes.IndexFieldNames = 'NomeCliente;Referencia;Ano;Mes') then
    begin
      vCodCliente := fHistGeral.mClienteProdMesCodCliente.AsInteger;
      if (fHistGeral.mClienteProdMes.RecordCount = fHistGeral.mClienteProdMes.RecNo) or
         (fHistGeral.mClienteProdMes.Eof) then
        PrintIt := True
      else
        begin
          fHistGeral.mClienteProdMes.Next;
          if vCodCliente <> fHistGeral.mClienteProdMesCodCliente.AsInteger then
            PrintIt := True;
          fHistGeral.mClienteProdMes.Prior;
        end;
      if PrintIt then
        begin
          RLLabel21.Caption := FormatFloat('###,###,##0.00',vTotalFatCli);
          vTotalFatCli      := 0;
        end;
    end;

end;

end.

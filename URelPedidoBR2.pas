unit URelPedidoBR2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, QuickRpt, QRCtrls;

type
  TfRelPedidoBR2 = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLDraw1: TRLDraw;
    RLSubDetail1: TRLSubDetail;
    RLSubDetail2: TRLSubDetail;
    RLBand3: TRLBand;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLDetailGrid1: TRLDetailGrid;
    RLNota2: TRLLabel;
    RLItem2: TRLLabel;
    RLData2: TRLLabel;
    RLQtd2: TRLLabel;
    RLNota3: TRLLabel;
    RLItem3: TRLLabel;
    RLData3: TRLLabel;
    RLQtd3: TRLLabel;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLDraw4: TRLDraw;
    RLBand4: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText16: TRLDBText;
    RLLabel20: TRLLabel;
    RLDraw2: TRLDraw;
    RLBand2: TRLBand;
    RLLabel19: TRLLabel;
    RLDraw3: TRLDraw;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLBand5: TRLBand;
    RLLabel24: TRLLabel;
    RLDraw5: TRLDraw;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel27: TRLLabel;
    RLReport2: TRLReport;
    RLSubDetail3: TRLSubDetail;
    RLBand6: TRLBand;
    RLLabel28: TRLLabel;
    RLLabel31: TRLLabel;
    RLLabel32: TRLLabel;
    RLLabel33: TRLLabel;
    RLLabel34: TRLLabel;
    RLLabel36: TRLLabel;
    RLDraw6: TRLDraw;
    RLLabel41: TRLLabel;
    RLLabel42: TRLLabel;
    RLLabel43: TRLLabel;
    RLLabel44: TRLLabel;
    RLSystemInfo5: TRLSystemInfo;
    RLSystemInfo6: TRLSystemInfo;
    RLDraw7: TRLDraw;
    RLBand7: TRLBand;
    RLDBText15: TRLDBText;
    RLDBText17: TRLDBText;
    RLDBText18: TRLDBText;
    RLDBText20: TRLDBText;
    RLDBText21: TRLDBText;
    RLDBText22: TRLDBText;
    RLDraw8: TRLDraw;
    RLBand8: TRLBand;
    RLLabel29: TRLLabel;
    RLLabel30: TRLLabel;
    RLLabel37: TRLLabel;
    RLLabel38: TRLLabel;
    RLLabel39: TRLLabel;
    RLDBText23: TRLDBText;
    RLLabel40: TRLLabel;
    RLLabel8: TRLLabel;
    RLDBText4: TRLDBText;
    RLSubDetail4: TRLSubDetail;
    RLBand9: TRLBand;
    RLLabel35: TRLLabel;
    RLLabel45: TRLLabel;
    Tam1: TRLLabel;
    Qtd1: TRLLabel;
    Tam2: TRLLabel;
    Qtd2: TRLLabel;
    Tam3: TRLLabel;
    Qtd3: TRLLabel;
    Tam4: TRLLabel;
    Qtd4: TRLLabel;
    Tam5: TRLLabel;
    Qtd5: TRLLabel;
    Tam6: TRLLabel;
    Qtd6: TRLLabel;
    Tam7: TRLLabel;
    Qtd7: TRLLabel;
    Tam8: TRLLabel;
    Qtd8: TRLLabel;
    Tam9: TRLLabel;
    Qtd9: TRLLabel;
    Tam10: TRLLabel;
    Qtd10: TRLLabel;
    Tam11: TRLLabel;
    Qtd11: TRLLabel;
    Tam12: TRLLabel;
    Qtd12: TRLLabel;
    Tam13: TRLLabel;
    Qtd13: TRLLabel;
    Tam14: TRLLabel;
    Qtd14: TRLLabel;
    Tam15: TRLLabel;
    Qtd15: TRLLabel;
    Tam16: TRLLabel;
    Qtd16: TRLLabel;
    Tam17: TRLLabel;
    Qtd17: TRLLabel;
    Tam18: TRLLabel;
    Qtd18: TRLLabel;
    Tam19: TRLLabel;
    Qtd19: TRLLabel;
    Tam20: TRLLabel;
    Qtd20: TRLLabel;
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLReport2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand7BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand8BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand9BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    vQtd, vQtdFat, vQtdRest : Real;
    vQtdGer, vQtdFatGer, vQtdRestGer : Real;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelPedidoBR2: TfRelPedidoBR2;

implementation

uses UDM1, UConsPedidoBR, DB;

{$R *.dfm}

procedure TfRelPedidoBR2.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel2.Caption := '';
  case fConsPedidoBR.RadioGroup1.ItemIndex of
    0 : RLLabel2.Caption := 'Pendentes';
    1 : RLLabel2.Caption := 'Faturados';
  end;
  if fConsPedidoBR.RxDBLookupCombo1.Text <> '' then
    RLLabel2.Caption := RLLabel2.Caption + '    Cliente: ' + fConsPedidoBR.RxDBLookupCombo1.Text;
  if fConsPedidoBR.RxDBLookupCombo2.Text <> '' then
    RLLabel2.Caption := RLLabel2.Caption + '    Produto: ' + fConsPedidoBR.RxDBLookupCombo2.Text;
end;

procedure TfRelPedidoBR2.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if fConsPedidoBR.tPedidoNota.RecordCount < 1 then
    PrintIt := False
  else
    PrintIt := True;

  if fConsPedidoBR.tPedidoNota.RecordCount < 3 then
    begin

      RLNota3.Visible := False;
      RLItem3.Visible := False;
      RLData3.Visible := False;
      RLQtd3.Visible  := False;
      if fConsPedidoBR.tPedidoNota.RecordCount = 1 then
        begin
          RLNota2.Visible := False;
          RLItem2.Visible := False;
          RLData2.Visible := False;
          RLQtd2.Visible  := False;
        end;
    end
  else
    begin

      RLNota3.Visible := True;
      RLItem3.Visible := True;
      RLData3.Visible := True;
      RLQtd3.Visible  := True;
      RLNota2.Visible := True;
      RLItem2.Visible := True;
      RLData2.Visible := True;
      RLQtd2.Visible  := True;
    end;
end;

procedure TfRelPedidoBR2.FormCreate(Sender: TObject);
begin
  vQtd        := 0;
  vQtdFat     := 0;
  vQtdRest    := 0;
  vQtdGer     := 0;
  vQtdFatGer  := 0;
  vQtdRestGer := 0;
end;

procedure TfRelPedidoBR2.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  //vCodAux : Integer;
  vCodAux : String;
  vCodTab : String;
begin
  fConsPedidoBR.qConsulta.RecordCount;
  fConsPedidoBR.qConsulta.RecNo;
  if fConsPedidoBR.qConsulta.Eof then
    PrintIt := True
  else
    begin
      if fConsPedidoBR.qConsulta.RecordCount <= fConsPedidoBR.qConsulta.RecNo then
        PrintIt := True
      else
        begin
          case fConsPedidoBR.RadioGroup2.ItemIndex of
            0 : vCodAux := fConsPedidoBR.qConsultaDtEmissao.AsString;
            1 : vCodAux := fConsPedidoBR.qConsultaPedidoCliente.AsString;
            2 : vCodAux := fConsPedidoBR.qConsultaCodProduto.AsString;
          end;
          //vCodAux := fConsPedidoBR.qConsultaCodProduto.AsInteger;
          fConsPedidoBR.qConsulta.Next;
          PrintIt := False;
          if fConsPedidoBR.RadioGroup2.ItemIndex = 0 then
            if vCodAux <> fConsPedidoBR.qConsultaDtEmissao.AsString then
              PrintIt := True;
          if fConsPedidoBR.RadioGroup2.ItemIndex = 1 then
            if vCodAux <> fConsPedidoBR.qConsultaPedidoCliente.AsString then
              PrintIt := True;
          if fConsPedidoBR.RadioGroup2.ItemIndex = 2 then
            if vCodAux <> fConsPedidoBR.qConsultaCodProduto.AsString then
              PrintIt := True;
          {if vCodAux <> fConsPedidoBR.qConsultaCodProduto.AsInteger then
            PrintIt := True
          else
            PrintIt := False;}
          fConsPedidoBR.qConsulta.Prior;
        end;
    end;
  if PrintIt then
    begin
      case fConsPedidoBR.RadioGroup2.ItemIndex of
        0 : RLLabel19.Caption := 'Total da Dt.Entrega:';
        1 : RLLabel19.Caption := 'Total do Pedido:';
        2 : RLLabel19.Caption := 'Total da OS (Remessa):';
        3 : RLLabel19.Caption := 'Total do Produto:';
      end;
      RLLabel21.Caption := FloatToStr(vQtd);
      RLLabel22.Caption := FloatToStr(vQtdFat);
      RLLabel23.Caption := FloatToStr(vQtdRest);
      vQtd     := 0;
      vQtdFat  := 0;
      vQtdRest := 0;
    end;
end;

procedure TfRelPedidoBR2.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  vQtd     := vQtd + fConsPedidoBR.qConsultaQtdPares.AsFloat;
  vQtdFat  := vQtdFat + fConsPedidoBR.qConsultaQtdParesFat.AsFloat;
  vQtdRest := vQtdRest + fConsPedidoBR.qConsultaQtdParesRest.AsFloat;

  vQtdGer     := vQtdGer + fConsPedidoBR.qConsultaQtdPares.AsFloat;
  vQtdFatGer  := vQtdFatGer + fConsPedidoBR.qConsultaQtdParesFat.AsFloat;
  vQtdRestGer := vQtdRestGer + fConsPedidoBR.qConsultaQtdParesRest.AsFloat;
end;

procedure TfRelPedidoBR2.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel25.Caption := FloatToStr(vQtdGer);
  RLLabel26.Caption := FloatToStr(vQtdFatGer);
  RLLabel27.Caption := FloatToStr(vQtdRestGer);
  vQtdGer     := 0;
  vQtdFatGer  := 0;
  vQtdRestGer := 0;
end;

procedure TfRelPedidoBR2.RLReport2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  vQtdGer     := 0;
  vQtdFatGer  := 0;
  vQtdRestGer := 0;
end;

procedure TfRelPedidoBR2.RLBand7BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  vQtdGer     := vQtdGer + fConsPedidoBR.mResumoQtdTotal.AsFloat;
  vQtdFatGer  := vQtdFatGer + fConsPedidoBR.mResumoQtdFaturada.AsFloat;
  vQtdRestGer := vQtdRestGer + fConsPedidoBR.mResumoQtdRestante.AsFloat;
end;

procedure TfRelPedidoBR2.RLBand8BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  vAux : Real;  
begin
  RLLabel30.Caption := FormatFloat('0.###',vQtdGer);
  RLLabel37.Caption := FormatFloat('0.###',vQtdFatGer);
  RLLabel40.Caption := FormatFloat('0.###',vQtdRestGer);
  vAux              := StrToFloat(FormatFloat('0.00',(vQtdRestGer / vQtdGer) * 100));
  RLLabel38.Caption := FormatFloat('0.##',vAux);
end;

procedure TfRelPedidoBR2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelPedidoBR2.RLBand9BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  i : Integer;  
begin
  PrintIt := fConsPedidoBR.CheckBox1.Checked;
  if not PrintIt then
    exit;

  for i := 1 to 20 do
    begin
      TRLLabel(FindComponent('Tam'+IntToStr(i))).Visible  := False;
      TRLLabel(FindComponent('Qtd'+IntToStr(i))).Visible  := False;
    end;

  i := 0;
  fConsPedidoBR.tPedidoGrade.First;
  while not fConsPedidoBR.tPedidoGrade.Eof do
    begin
      if fConsPedidoBR.tPedidoGradeQtd.AsFloat > 0 then
        begin
          inc(i);
          if i > 20 then
            ShowMessage('Existe mais de 20 tamanhos!')
          else
            begin
              TRLLabel(FindComponent('Tam'+IntToStr(i))).Visible  := True;
              TRLLabel(FindComponent('Qtd'+IntToStr(i))).Visible  := True;

              TRLLabel(FindComponent('Tam'+IntToStr(i))).Caption  := fConsPedidoBR.tPedidoGradelkTamanho.AsString;
              TRLLabel(FindComponent('Qtd'+IntToStr(i))).Caption  := fConsPedidoBR.tPedidoGradeQtd.AsString;
            end;
        end;
      fConsPedidoBR.tPedidoGrade.Next;
    end;
end;

end.

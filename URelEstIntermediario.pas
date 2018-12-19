unit URelEstIntermediario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TfRelEstIntermediario = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBText7: TQRDBText;
    QRLabel13: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel14: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel15: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    Setor1: TQRDBText;
    QRDBText4: TQRDBText;
    Setor2: TQRDBText;
    Estoque1: TQRDBText;
    QRDBText8: TQRDBText;
    Setor3: TQRDBText;
    QRDBText10: TQRDBText;
    Setor4: TQRDBText;
    QRDBText12: TQRDBText;
    Setor5: TQRDBText;
    QRDBText14: TQRDBText;
    Setor6: TQRDBText;
    Estoque2: TQRDBText;
    Estoque3: TQRDBText;
    Estoque4: TQRDBText;
    Estoque5: TQRDBText;
    QRShape2: TQRShape;
    SummaryBand1: TQRBand;
    sSetor1: TQRLabel;
    sEstoque1: TQRLabel;
    sSetor2: TQRLabel;
    sEstoque2: TQRLabel;
    sSetor3: TQRLabel;
    sEstoque3: TQRLabel;
    sSetor4: TQRLabel;
    sSetor5: TQRLabel;
    sSetor6: TQRLabel;
    sEstoque4: TQRLabel;
    sEstoque5: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelEstIntermediario: TfRelEstIntermediario;
  vSetor1, vSetor2, vSetor3, vSetor4, vSetor5, vSetor6, vEstoque1, vEstoque2,
  vEstoque3, vEstoque4, vEstoque5, vEstoque6 : Real;

implementation

uses UDM1, UPrevEstIntermediario;

{$R *.DFM}

procedure TfRelEstIntermediario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelEstIntermediario.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  i : Integer;
begin
  for i  := 1 to 6 do
    begin
      if i < 6 then
        begin
          if fPrevEstIntermediario.mEstoque.FieldByName('Estoque'+IntToStr(i)).AsInteger > 0 then
            TQRDBText(FindComponent('Estoque'+IntToStr(i))).Enabled := True
          else
            TQRDBText(FindComponent('Estoque'+IntToStr(i))).Enabled := False;
        end;
      if fPrevEstIntermediario.mEstoque.FieldByName('Setor'+IntToStr(i)).AsInteger > 0 then
        TQRDBText(FindComponent('Setor'+IntToStr(i))).Enabled := True
      else
        TQRDBText(FindComponent('Setor'+IntToStr(i))).Enabled := False;
    end;
  if fPrevEstIntermediario.mEstoque.FieldByName('Setor1').AsInteger > 0 then
    vSetor1 := vSetor1 + fPrevEstIntermediario.mEstoque.FieldByName('Setor1').AsInteger;
  sSetor1.Caption := FloatToStr(vSetor1);
  if fPrevEstIntermediario.mEstoque.FieldByName('Setor2').AsInteger > 0 then
    vSetor2 := vSetor2 + fPrevEstIntermediario.mEstoque.FieldByName('Setor2').AsInteger;
  sSetor2.Caption := FloatToStr(vSetor2);
  if fPrevEstIntermediario.mEstoque.FieldByName('Setor3').AsInteger > 0 then
    vSetor3 := vSetor3 + fPrevEstIntermediario.mEstoque.FieldByName('Setor3').AsInteger;
  sSetor3.Caption := FloatToStr(vSetor3);
  if fPrevEstIntermediario.mEstoque.FieldByName('Setor4').AsInteger > 0 then
    vSetor4 := vSetor4 + fPrevEstIntermediario.mEstoque.FieldByName('Setor4').AsInteger;
  sSetor4.Caption := FloatToStr(vSetor4);
  if fPrevEstIntermediario.mEstoque.FieldByName('Setor5').AsInteger > 0 then
    vSetor5 := vSetor5 + fPrevEstIntermediario.mEstoque.FieldByName('Setor5').AsInteger;
  sSetor5.Caption := FloatToStr(vSetor5);
  if fPrevEstIntermediario.mEstoque.FieldByName('Setor6').AsInteger > 0 then
    vSetor6 := vSetor6 + fPrevEstIntermediario.mEstoque.FieldByName('Setor6').AsInteger;
  sSetor6.Caption := FloatToStr(vSetor6);
  if fPrevEstIntermediario.mEstoque.FieldByName('Estoque1').AsInteger > 0 then
    vEstoque1 := vEstoque1 + fPrevEstIntermediario.mEstoque.FieldByName('Estoque1').AsInteger;
  sEstoque1.Caption := FloatToStr(vEstoque1);
  if fPrevEstIntermediario.mEstoque.FieldByName('Estoque2').AsInteger > 0 then
    vEstoque2 := vEstoque2 + fPrevEstIntermediario.mEstoque.FieldByName('Estoque2').AsInteger;
  sEstoque2.Caption := FloatToStr(vEstoque2);
  if fPrevEstIntermediario.mEstoque.FieldByName('Estoque3').AsInteger > 0 then
    vEstoque3 := vEstoque3 + fPrevEstIntermediario.mEstoque.FieldByName('Estoque3').AsInteger;
  sEstoque3.Caption := FloatToStr(vEstoque3);
  if fPrevEstIntermediario.mEstoque.FieldByName('Estoque4').AsInteger > 0 then
    vEstoque4 := vEstoque4 + fPrevEstIntermediario.mEstoque.FieldByName('Estoque4').AsInteger;
  sEstoque4.Caption := FloatToStr(vEstoque4);
  if fPrevEstIntermediario.mEstoque.FieldByName('Estoque5').AsInteger > 0 then
    vEstoque5 := vEstoque5 + fPrevEstIntermediario.mEstoque.FieldByName('Estoque5').AsInteger;
  sEstoque5.Caption := FloatToStr(vEstoque5);
end;

procedure TfRelEstIntermediario.QuickRep1BeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  vSetor1 := 0;
  vSetor2 := 0;
  vSetor3 := 0;
  vSetor4 := 0;
  vSetor5 := 0;
  vSetor6 := 0;
  vEstoque1 := 0;
  vEstoque2 := 0;
  vEstoque3 := 0;
  vEstoque4 := 0;
  vEstoque5 := 0;
end;

procedure TfRelEstIntermediario.SummaryBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   sSetor1.Enabled := (vSetor1 > 0);
   sSetor2.Enabled := (vSetor2 > 0);
   sSetor3.Enabled := (vSetor3 > 0);
   sSetor4.Enabled := (vSetor4 > 0);
   sSetor5.Enabled := (vSetor5 > 0);
   sSetor6.Enabled := (vSetor6 > 0);
   sEstoque1.Enabled := (vEstoque1 > 0);
   sEstoque2.Enabled := (vEstoque2 > 0);
   sEstoque3.Enabled := (vEstoque3 > 0);
   sEstoque4.Enabled := (vEstoque4 > 0);
   sEstoque5.Enabled := (vEstoque5 > 0);
end;

end.

unit URelTalaoAmostra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TfRelTalaoAmostra = class(TForm)
    QuickRep1: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel43: TQRLabel;
    QRDBRichText1: TQRDBRichText;
    QRShape3: TQRShape;
    QRLabel44: TQRLabel;
    QRShape4: TQRShape;
    QRLabel45: TQRLabel;
    QRT1: TQRShape;
    Tam1: TQRLabel;
    QRT2: TQRShape;
    Tam2: TQRLabel;
    QRT3: TQRShape;
    Tam3: TQRLabel;
    QRT4: TQRShape;
    Tam4: TQRLabel;
    QRT5: TQRShape;
    Tam5: TQRLabel;
    QRT6: TQRShape;
    Tam6: TQRLabel;
    QRT7: TQRShape;
    Tam7: TQRLabel;
    QRT8: TQRShape;
    Tam8: TQRLabel;
    QRT9: TQRShape;
    Tam9: TQRLabel;
    QRT10: TQRShape;
    Tam10: TQRLabel;
    QRT11: TQRShape;
    Tam11: TQRLabel;
    QRT12: TQRShape;
    Tam12: TQRLabel;
    QRT13: TQRShape;
    Tam13: TQRLabel;
    QRT14: TQRShape;
    Tam14: TQRLabel;
    QRShape5: TQRShape;
    QRLabel46: TQRLabel;
    QRQ1: TQRShape;
    Qtd1: TQRLabel;
    QRQ2: TQRShape;
    Qtd2: TQRLabel;
    QRQ3: TQRShape;
    Qtd3: TQRLabel;
    QRQ4: TQRShape;
    Qtd4: TQRLabel;
    QRQ5: TQRShape;
    Qtd5: TQRLabel;
    QRQ6: TQRShape;
    Qtd6: TQRLabel;
    Qtd7: TQRLabel;
    QRQ7: TQRShape;
    QRQ8: TQRShape;
    Qtd8: TQRLabel;
    Qtd9: TQRLabel;
    QRQ9: TQRShape;
    QRQ10: TQRShape;
    Qtd10: TQRLabel;
    QRQ11: TQRShape;
    Qtd11: TQRLabel;
    Qtd12: TQRLabel;
    QRQ12: TQRShape;
    Qtd13: TQRLabel;
    QRQ13: TQRShape;
    Qtd14: TQRLabel;
    QRQ14: TQRShape;
    QRShape20: TQRShape;
    QRDBText6: TQRDBText;
    QRShape6: TQRShape;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelTalaoAmostra: TfRelTalaoAmostra;

implementation

uses UPrevTalaoAmostra, UDM1;

{$R *.DFM}

procedure TfRelTalaoAmostra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelTalaoAmostra.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  Materiais : Array [1..17] of String;
  i, Posicao : integer;
begin
  for i := 1 to 17 do
    Materiais[i] := ' ';
  DM1.tPedAmostraMat.First;
  for i := 1 to 17 do
    begin
      Materiais[i] := DM1.tPedAmostraMatlkPosicao.AsString + ' - ' + DM1.tPedAmostraMatMaterial.AsString + ' - ' + DM1.tPedAmostraMatCor.AsString;
      DM1.tPedAmostraMat.Next;
      if DM1.tPedAmostraMat.Eof then
        Break;
    end;
  QRLabel9.Caption  := Materiais[1];
  QRLabel10.Caption := Materiais[2];
  QRLabel11.Caption := Materiais[3];
  QRLabel12.Caption := Materiais[4];
  QRLabel13.Caption := Materiais[5];
  QRLabel14.Caption := Materiais[6];
  QRLabel15.Caption := Materiais[7];
  QRLabel16.Caption := Materiais[8];
  QRLabel17.Caption := Materiais[9];
  QRLabel18.Caption := Materiais[10];
  QRLabel19.Caption := Materiais[11];
  QRLabel20.Caption := Materiais[12];
  QRLabel21.Caption := Materiais[13];
  QRLabel22.Caption := Materiais[14];
  QRLabel23.Caption := Materiais[15];
  QRLabel24.Caption := Materiais[16];
  QRLabel25.Caption := Materiais[17];
  DM1.tPedAmostraMat.Filtered := False;
  for Posicao := 1 to 14 do
    begin
      TQRLabel(FindComponent('Tam'+IntToStr(Posicao))).Enabled := False;
      TQRLabel(FindComponent('Qtd'+IntToStr(Posicao))).Enabled := False;
      TQRShape(FindComponent('QRT'+IntToStr(Posicao))).Enabled := False;
      TQRShape(FindComponent('QRQ'+IntToStr(Posicao))).Enabled := False;
    end;
  DM1.tGrade.IndexFieldNames := 'Codigo';
  DM1.tGrade.FindKey([DM1.tPedAmostraItCodGrade.AsInteger]);
  DM1.tPedAmostraGrade.First;
  Posicao := 0;
  while not DM1.tPedAmostraGrade.EOF do
    begin
      Inc(Posicao);
      if DM1.tPedAmostraGradeQtd.AsFloat > 0 then
        begin
          TQRLabel(FindComponent('Tam' + IntToStr(Posicao))).Enabled := True;
          TQRLabel(FindComponent('Tam' + IntToStr(Posicao))).Caption := DM1.tPedAmostraGradelkTamanho.AsString;
          TQRShape(FindComponent('QRT'+IntToStr(Posicao))).Enabled   := True;
          TQRLabel(FindComponent('Qtd' + IntToStr(Posicao))).Enabled := True;
          TQRLabel(FindComponent('Qtd' + IntToStr(Posicao))).Caption := DM1.tPedAmostraGradeQtd.AsString;
          TQRShape(FindComponent('QRQ'+IntToStr(Posicao))).Enabled   := True;
        end;
      DM1.tPedAmostraGrade.Next;
    end;
end;

end.

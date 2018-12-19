unit URelOC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, DB;

type
  TfRelOC = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRDBText7: TQRDBText;
    QRLabel13: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel14: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel15: TQRLabel;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel9: TQRLabel;
    QRData1: TQRLabel;
    QRValor1: TQRLabel;
    QRData2: TQRLabel;
    QRValor2: TQRLabel;
    QRData3: TQRLabel;
    QRValor3: TQRLabel;
    QRData4: TQRLabel;
    QRValor4: TQRLabel;
    QRData5: TQRLabel;
    QRValor5: TQRLabel;
    QRData6: TQRLabel;
    QRValor6: TQRLabel;
    QRData7: TQRLabel;
    QRValor7: TQRLabel;
    QRData8: TQRLabel;
    QRValor8: TQRLabel;
    QRData9: TQRLabel;
    QRValor9: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QuickRep2: TQuickRep;
    DetailBand2: TQRBand;
    Data1: TQRLabel;
    Valor1: TQRLabel;
    Data2: TQRLabel;
    Valor2: TQRLabel;
    Data3: TQRLabel;
    Valor3: TQRLabel;
    Data4: TQRLabel;
    Valor4: TQRLabel;
    SummaryBand1: TQRBand;
    QRShape4: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelOC: TfRelOC;

implementation

uses UPrevRelOC;

{$R *.DFM}

procedure TfRelOC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelOC.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i : Integer;
  vContador : Integer;
begin
  for i := 1 to 9 do
    begin
      TQRLabel(FindComponent('QRData'+IntToStr(i))).Enabled  := False;
      TQRLabel(FindComponent('QRValor'+IntToStr(i))).Enabled := False;
    end;
  if fPrevRelOC.mOCParc.Locate('NumOC',fPrevRelOC.mOCNumOC.AsInteger,[loCaseInsensitive]) then
    begin
      vContador := 0;
      for i := 1 to 9 do
        begin
          if fPrevRelOC.mOCParc.FieldByName('Valor'+IntToStr(i)).AsFloat > 0 then
            begin
              inc(vContador);
              TQRLabel(FindComponent('QRData'+IntToStr(vContador))).Enabled   := True;
              TQRLabel(FindComponent('QRValor'+IntToStr(vContador))).Enabled  := True;
              TQRLabel(FindComponent('QRData'+IntToStr(vContador))).Caption   := fPrevRelOC.mOCParc.FieldByName('Data'+IntToStr(i)).AsString;
              TQRLabel(FindComponent('QRValor'+IntToStr(vContador))).Caption  := fPrevRelOC.mOCParc.FieldByName('Valor'+IntToStr(i)).AsString;
            end;
        end;
      if (vContador > 0) and (vContador < 5) then
        ChildBand1.Height := 18
      else
      if (vContador > 4) and (vContador < 9) then
        ChildBand1.Height := 34
      else
      if vContador > 8 then
        ChildBand1.Height := 52;
    end
  else
    PrintBand := False;
end;

procedure TfRelOC.DetailBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  Posicao : Integer;
begin
  for posicao := 1 to 4 do
    begin
      TQRLabel(FindComponent('Valor'+IntToStr(Posicao))).Enabled := False;
      TQRLabel(FindComponent('Data'+IntToStr(Posicao))).Enabled := False;
    end;

  Posicao   := 1;
  while not(fPrevRelOC.tAuxiliar.EOF) and (Posicao < 4) do
    begin
      TQRLabel(FindComponent('Data' + IntToStr(Posicao))).Enabled  := True;
      TQRLabel(FindComponent('Data' + IntToStr(Posicao))).Caption  := fPrevRelOC.tAuxiliarData.AsString;
      TQRLabel(FindComponent('Valor' + IntToStr(Posicao))).Enabled  := True;
      TQRLabel(FindComponent('Valor' + IntToStr(Posicao))).Caption  := FormatFloat('###,###,##0.00',fPrevRelOC.tAuxiliarVlrTot.AsFloat);
      Inc(Posicao);
      fPrevRelOC.tAuxiliar.Next;
    end;
end;

end.

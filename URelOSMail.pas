unit URelOSMail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RLReport, RLRichText, RLHTMLFilter, RLRichFilter, RLFilters, RLPDFFilter,
  RLPreviewForm, RLDraftFilter, RLXLSFilter, jpeg, QuickRpt, Qrctrls;

type

  TfRelOSMail = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLBand1: TRLBand;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    RLDraw3: TRLDraw;
    RLDraw4: TRLDraw;
    RLDraw5: TRLDraw;
    RLDraw6: TRLDraw;
    RLDraw7: TRLDraw;
    RLDraw8: TRLDraw;
    RLDraw9: TRLDraw;
    RLDraw10: TRLDraw;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLLabel11: TRLLabel;
    RLDBText10: TRLDBText;
    QST: TRLDraw;
    QST1: TRLDraw;
    QST2: TRLDraw;
    QST4: TRLDraw;
    QST3: TRLDraw;
    QST8: TRLDraw;
    QST7: TRLDraw;
    QST6: TRLDraw;
    QST5: TRLDraw;
    QST13: TRLDraw;
    QST12: TRLDraw;
    QST11: TRLDraw;
    QST10: TRLDraw;
    QST9: TRLDraw;
    QSQ: TRLDraw;
    QSQ1: TRLDraw;
    QSQ2: TRLDraw;
    QSQ4: TRLDraw;
    QSQ3: TRLDraw;
    QSQ8: TRLDraw;
    QSQ7: TRLDraw;
    QSQ6: TRLDraw;
    QSQ5: TRLDraw;
    QSQ13: TRLDraw;
    QSQ12: TRLDraw;
    QSQ11: TRLDraw;
    QSQ10: TRLDraw;
    QSQ9: TRLDraw;
    QSTB: TRLDraw;
    QST14: TRLDraw;
    QST15: TRLDraw;
    QST17: TRLDraw;
    QST16: TRLDraw;
    QST21: TRLDraw;
    QST20: TRLDraw;
    QST19: TRLDraw;
    QST18: TRLDraw;
    QST26: TRLDraw;
    QST25: TRLDraw;
    QST24: TRLDraw;
    QST23: TRLDraw;
    QST22: TRLDraw;
    QSQB: TRLDraw;
    QSQ14: TRLDraw;
    QSQ15: TRLDraw;
    QSQ17: TRLDraw;
    QSQ16: TRLDraw;
    QSQ21: TRLDraw;
    QSQ20: TRLDraw;
    QSQ19: TRLDraw;
    QSQ18: TRLDraw;
    QSQ26: TRLDraw;
    QSQ25: TRLDraw;
    QSQ24: TRLDraw;
    QSQ23: TRLDraw;
    QSQ22: TRLDraw;
    Tam: TRLLabel;
    Tam1: TRLLabel;
    Tam2: TRLLabel;
    Tam4: TRLLabel;
    Tam3: TRLLabel;
    Tam5: TRLLabel;
    Tam6: TRLLabel;
    Tam7: TRLLabel;
    Tam8: TRLLabel;
    Tam9: TRLLabel;
    Tam10: TRLLabel;
    Tam11: TRLLabel;
    Tam12: TRLLabel;
    Tam13: TRLLabel;
    TamB: TRLLabel;
    Tam14: TRLLabel;
    Tam15: TRLLabel;
    Tam16: TRLLabel;
    Tam17: TRLLabel;
    Tam18: TRLLabel;
    Tam19: TRLLabel;
    Tam20: TRLLabel;
    Tam21: TRLLabel;
    Tam22: TRLLabel;
    Tam23: TRLLabel;
    Tam24: TRLLabel;
    Tam25: TRLLabel;
    Tam26: TRLLabel;
    Qtd: TRLLabel;
    Qtd1: TRLLabel;
    Qtd2: TRLLabel;
    Qtd3: TRLLabel;
    Qtd4: TRLLabel;
    Qtd5: TRLLabel;
    Qtd6: TRLLabel;
    Qtd7: TRLLabel;
    Qtd8: TRLLabel;
    Qtd9: TRLLabel;
    Qtd10: TRLLabel;
    Qtd11: TRLLabel;
    Qtd12: TRLLabel;
    Qtd13: TRLLabel;
    QtdB: TRLLabel;
    Qtd14: TRLLabel;
    Qtd15: TRLLabel;
    Qtd16: TRLLabel;
    Qtd17: TRLLabel;
    Qtd18: TRLLabel;
    Qtd19: TRLLabel;
    Qtd20: TRLLabel;
    Qtd21: TRLLabel;
    Qtd22: TRLLabel;
    Qtd23: TRLLabel;
    Qtd24: TRLLabel;
    Qtd25: TRLLabel;
    Qtd26: TRLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLSubDetail1BeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelOSMail: TfRelOSMail;
  vTotal : Real;
  vTotalPesoTr : Real;

implementation

uses UDM1, UOrdemCompra;

{$R *.DFM}

procedure TfRelOSMail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelOSMail.RLSubDetail1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel1.Caption := Dm1.tEmpresaEmpresa.AsString;
end;

procedure TfRelOSMail.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  i : Integer;
begin
  QSTB.Visible := False;
  QSQB.Visible := False;
  TamB.Visible := False;
  QtdB.Visible := False;

  for i := 1 to 26 do
    begin
      TRLLabel(FindComponent('Tam'+IntToStr(i))).Visible := False;
      TRLLabel(FindComponent('Qtd'+IntToStr(i))).Visible := False;
      TRLDraw(FindComponent('QST'+IntToStr(i))).Visible := False;
      TRLDraw(FindComponent('QSQ'+IntToStr(i))).Visible := False;
    end;
  if DM1.tOSGrade.IsEmpty then
    begin
      QSQ.Visible := False;
      QST.Visible := False;
      Tam.Visible := False;
      Qtd.Visible := False;
    end
  else
    begin
      QSQ.Visible := True;
      QST.Visible := True;
      Tam.Visible := True;
      Qtd.Visible := True;
    end;
  i := 0;
  DM1.tOSGrade.First;
  while not DM1.tOSGrade.Eof do
    begin
      inc(i);
      TRLLabel(FindComponent('Tam'+IntToStr(i))).Visible := True;
      TRLLabel(FindComponent('Tam'+IntToStr(i))).Caption := DM1.tOSGradeTamanho.AsString;
      TRLLabel(FindComponent('Qtd'+IntToStr(i))).Visible := True;
      TRLLabel(FindComponent('Qtd'+IntToStr(i))).Caption := DM1.tOSGradeQtde.AsString;
      TRLDraw(FindComponent('QST'+IntToStr(i))).Visible := True;
      TRLDraw(FindComponent('QSQ'+IntToStr(i))).Visible := True;
      DM1.tOSGrade.Next;
    end;
  if i > 13 then
    begin
      QSQB.Visible := True;
      QSTB.Visible := True;
      TamB.Visible := True;
      QtdB.Visible := True;
    end;
end;

end.

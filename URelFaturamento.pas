unit URelFaturamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RLReport;

type
  TfRelFaturamento = class(TForm)
    RLReport2: TRLReport;
    RLBand3: TRLBand;
    RLDBText6: TRLDBText;
    RLLabel2: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLDraw4: TRLDraw;
    RLLabel21: TRLLabel;
    RLLabel23: TRLLabel;
    RLDraw5: TRLDraw;
    RLSubDetail2: TRLSubDetail;
    RLBand5: TRLBand;
    RLDBText7: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLBand6: TRLBand;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLDraw1: TRLDraw;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand6BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    vVlrTotal : Real;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelFaturamento: TfRelFaturamento;

implementation

uses UDM1, UPrevFaturamento;

{$R *.DFM}

procedure TfRelFaturamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelFaturamento.RLBand6BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel25.Caption := FormatFloat('###,###,##0.00',vVlrTotal);
  vVlrTotal         := 0;
end;

procedure TfRelFaturamento.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  vVlrTotal := vVlrTotal + fPrevFaturamento.qFaturamentoVlrTotalNota.AsFloat;
end;

procedure TfRelFaturamento.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel14.Caption := fPrevFaturamento.DateEdit1.Text + ' a ' + fPrevFaturamento.DateEdit2.Text;
end;

end.

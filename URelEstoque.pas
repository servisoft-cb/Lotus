unit URelEstoque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TfRelEstoque = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBText7: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRSysData4: TQRSysData;
    QRSysData3: TQRSysData;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape2: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape3: TQRShape;
    ChildBand1: TQRChildBand;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    Tam1: TQRLabel;
    Qtd1: TQRLabel;
    Tam2: TQRLabel;
    Qtd2: TQRLabel;
    Tam3: TQRLabel;
    Qtd3: TQRLabel;
    Tam4: TQRLabel;
    Qtd4: TQRLabel;
    Tam5: TQRLabel;
    Qtd5: TQRLabel;
    Tam6: TQRLabel;
    Qtd6: TQRLabel;
    Tam7: TQRLabel;
    Qtd7: TQRLabel;
    Tam8: TQRLabel;
    Qtd8: TQRLabel;
    Tam9: TQRLabel;
    Qtd9: TQRLabel;
    Tam10: TQRLabel;
    Qtd10: TQRLabel;
    Tam11: TQRLabel;
    Qtd11: TQRLabel;
    Tam12: TQRLabel;
    Qtd12: TQRLabel;
    Tam13: TQRLabel;
    Qtd13: TQRLabel;
    Tam14: TQRLabel;
    Qtd14: TQRLabel;
    Tam15: TQRLabel;
    Qtd15: TQRLabel;
    Tam16: TQRLabel;
    Qtd16: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    Tam17: TQRLabel;
    Qtd17: TQRLabel;
    Tam18: TQRLabel;
    Qtd18: TQRLabel;
    Tam19: TQRLabel;
    Qtd19: TQRLabel;
    Tam20: TQRLabel;
    Qtd20: TQRLabel;
    Tam21: TQRLabel;
    Qtd21: TQRLabel;
    Tam22: TQRLabel;
    Qtd22: TQRLabel;
    Tam23: TQRLabel;
    Qtd23: TQRLabel;
    Tam24: TQRLabel;
    Qtd24: TQRLabel;
    Tam25: TQRLabel;
    Qtd25: TQRLabel;
    Tam26: TQRLabel;
    Qtd26: TQRLabel;
    Tam27: TQRLabel;
    Qtd27: TQRLabel;
    Tam28: TQRLabel;
    Qtd28: TQRLabel;
    Tam29: TQRLabel;
    Qtd29: TQRLabel;
    Tam30: TQRLabel;
    Qtd30: TQRLabel;
    Tam31: TQRLabel;
    Qtd31: TQRLabel;
    Tam32: TQRLabel;
    Qtd32: TQRLabel;
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelEstoque: TfRelEstoque;

implementation

uses UConsEstoqueMat, UDM1;

{$R *.DFM}

procedure TfRelEstoque.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  case fConsEstoqueMat.RadioGroup2.ItemIndex of
    0 : QRLabel1.Caption := 'Relatório do Estoque - Com Saldo';
    1 : QRLabel1.Caption := 'Relatório do Estoque - Todos';
  end;
end;

procedure TfRelEstoque.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i : integer;
begin
  PrintBand := fConsEstoqueMat.CheckBox1.Checked;
  if not PrintBand then
    exit;
  if fConsEstoqueMat.qEstoqueGrade.RecordCount > 0 then
    begin
      PrintBand := True;
      for i := 1 to 32 do
        begin
          TQRLabel(FindComponent('Tam'+IntToStr(i))).Caption   := ' ';
          TQRLabel(FindComponent('Qtd'+IntToStr(i))).Caption   := ' ';
        end;
      i := 0;
      fConsEstoqueMat.qEstoqueGrade.First;
      while not fConsEstoqueMat.qEstoqueGrade.Eof do
        begin
          inc(i);
          TQRLabel(FindComponent('Tam'+IntToStr(i))).Caption := fConsEstoqueMat.qEstoqueGradeTamanho.AsString;
          TQRLabel(FindComponent('Qtd'+IntToStr(i))).Caption := fConsEstoqueMat.qEstoqueGradeQtd.AsString;
          fConsEstoqueMat.qEstoqueGrade.Next;
        end;
      if i > 16 then
        ChildBand1.Height := 76
      else
        ChildBand1.Height := 39;
    end
  else
    PrintBand := False;
end;

procedure TfRelEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

end.

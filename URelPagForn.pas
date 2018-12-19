unit URelPagForn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TfRelPagForn = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBText5: TQRDBText;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel19: TQRLabel;
    QRShape3: TQRShape;
    QRExpr4: TQRExpr;
    QRLabel5: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelPagForn: TfRelPagForn;

implementation

uses UPrevPagForn, UDM1;

{$R *.DFM}

procedure TfRelPagForn.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelPagForn.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if fPrevPagForn.RadioGroup2.ItemIndex = 0 then
    begin
      if fPrevPagForn.DateEdit2.Text = '  /  /    ' then
        begin
          QRLabel4.Caption := 'Até Dt.Entrada';
          QRLabel8.Enabled := False;
          QRLabel7.Enabled := False;
        end
      else
        begin
          QRLabel4.Caption := 'Dt.Entrada';
          QRLabel8.Enabled := True;
          QRLabel7.Enabled := True;
          QRLabel8.Caption := fPrevPagForn.DateEdit2.Text;
        end;
      QRLabel6.Enabled := True;
      QRLabel6.Caption := fPrevPagForn.DateEdit1.Text;
    end
  else
    begin
      Case fPrevPagForn.RadioGroup1.ItemIndex of
        0 : begin
              if fPrevPagForn.DateEdit2.Text = '  /  /    ' then
                begin
                  QRLabel4.Caption := 'A Vencer - Dt.Referência:';
                  QRLabel8.Enabled := False;
                  QRLabel7.Enabled := False;
                end
              else
                begin
                  QRLabel4.Caption := 'A Vencer';
                  QRLabel8.Enabled := True;
                  QRLabel7.Enabled := True;
                  QRLabel8.Caption := fPrevPagForn.DateEdit2.Text;
                end;
              QRLabel6.Enabled := True;
              QRLabel6.Caption := fPrevPagForn.DateEdit1.Text;
            end;
        1 : begin
              QRLabel4.Caption := 'Vencidas  até  ' + fPrevPagForn.DateEdit1.Text;
              QRLabel6.Enabled := False;
              QRLabel7.Enabled := False;
              QRLabel8.Enabled := False;
              //QRLabel8.Caption := fPrevPagForn.DateEdit1.Text;
            end;
      end;
    end;
  Case fPrevPagForn.RadioGroup3.ItemIndex of
    0 : QRLabel3.Caption := 'Relação de Ctas. a Pagar p/ Fornecedores';
    1 : QRLabel3.Caption := 'Relação de Ctas. a Pagar p/ Outros';
    2 : QRLabel3.Caption := 'Relação de Ctas. a Pagar p/ Fornecedores/Outros';
  end;
  if fPrevPagForn.RadioGroup1.ItemIndex = 0 then
    QRLabel5.Caption := 'A Vencer'
  else
    QRLabel5.Caption := 'Vencidas';
end;

procedure TfRelPagForn.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if StrToFloat(FormatFloat('0.00',fPrevPagForn.tMemo1Valor.AsFloat)) > 0 then
    PrintBand := True
  else
    PrintBand := False;
end;

end.

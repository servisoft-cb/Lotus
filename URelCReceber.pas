unit URelCReceber;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls;

type
  TfRelCReceber = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    SummaryBand1: TQRBand;
    QRShape4: TQRShape;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel17: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape26: TQRShape;
    QRLabel21: TQRLabel;
    QRExpr5: TQRExpr;
    QRLabel22: TQRLabel;
    QRExpr6: TQRExpr;
    QRLabel23: TQRLabel;
    QRExpr7: TQRExpr;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel19: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel15: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel11: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel12: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel14: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelCReceber: TfRelCReceber;

implementation

uses UDM1, UPrevRelCReceber;

{$R *.DFM}

procedure TfRelCReceber.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelCReceber.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  fPrevRelCReceber.tCReceberParc2.Filtered := False;
  fPrevRelCReceber.tCReceberParc2.Filter   := 'NumNota = '''+IntToStr(fPrevRelCReceber.Query1Nota.AsInteger)+''' AND NumCReceber = '''+IntToStr(fPrevRelCReceber.Query1NumCReceber.AsInteger)+'''';
  fPrevRelCReceber.tCReceberParc2.Filtered := True;
  fPrevRelCReceber.tCReceberParc2.Filtered := False;
end;

procedure TfRelCReceber.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if fPrevRelCReceber.RxDBLookupCombo1.Text <> '' then
  QRLabel16.Enabled := False;
  QRLabel18.Enabled := False;
  if fPrevRelCReceber.RxDBLookupCombo1.Text = '' then
    begin
      case fPrevRelCReceber.RadioGroup1.ItemIndex of
        0 : begin
              QRLabel17.Caption := '(Vencidas)';
              QRLabel13.Caption := 'Referência: ' + fPrevRelCReceber.DateEdit1.Text;
            end;
        1 : begin
              QRLabel17.Caption := '(Vcto.Período)';
              QRLabel13.Caption := 'Período ' + fPrevRelCReceber.DateEdit1.Text + ' à ' + fPrevRelCReceber.DateEdit2.Text;
            end;
        2 : begin
              QRLabel17.Caption := '(Pagas)';
              QRLabel13.Caption := 'Período ' + fPrevRelCReceber.DateEdit1.Text + ' à ' + fPrevRelCReceber.DateEdit2.Text;
            end;
        3 : begin
              QRLabel17.Caption := '(Todas)';
              QRLabel13.Caption := 'Período ' + fPrevRelCReceber.DateEdit1.Text + ' à ' + fPrevRelCReceber.DateEdit2.Text;
            end;
      end;
    end
  else
    begin
      case fPrevRelCReceber.RadioGroup1.ItemIndex of
        0 : begin
              QRLabel17.Caption := '(Vencidas)';
              QRLabel13.Caption := 'Vendedor: '+ fPrevRelCReceber.RxDBLookupCombo1.Text + ' Referência: ' + fPrevRelCReceber.DateEdit1.Text;
            end;
        1 : begin
              QRLabel17.Caption := '(Vcto.Período)';
              QRLabel13.Caption := 'Vendedor: '+ fPrevRelCReceber.RxDBLookupCombo1.Text + ' Período ' + fPrevRelCReceber.DateEdit1.Text + ' à ' + fPrevRelCReceber.DateEdit2.Text;
            end;
        2 : begin
              QRLabel17.Caption := '(Pagas)';
              QRLabel13.Caption := 'Vendedor: '+ fPrevRelCReceber.RxDBLookupCombo1.Text + ' Período ' + fPrevRelCReceber.DateEdit1.Text + ' à ' + fPrevRelCReceber.DateEdit2.Text;
            end;
        3 : begin
              QRLabel17.Caption := '(Todas)';
              QRLabel13.Caption := 'Vendedor: '+ fPrevRelCReceber.RxDBLookupCombo1.Text + ' Período ' + fPrevRelCReceber.DateEdit1.Text + ' à ' + fPrevRelCReceber.DateEdit2.Text;
            end;
      end;
    end;
  QRLabel17.Enabled := True;
end;

procedure TfRelCReceber.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  vData : TDateTime;  
begin
  if fPrevRelCReceber.CheckBox1.Checked = False then
    PrintBand := False
  else
    begin
      vData := fPrevRelCReceber.Query1Data.AsDateTime;
      if fPrevRelCReceber.Query1.Eof then
        PrintBand := True
      else
        begin
          fPrevRelCReceber.Query1.Next;
          if fPrevRelCReceber.Query1.Eof then
            PrintBand := True
          else
          if vData <> fPrevRelCReceber.Query1Data.AsDateTime then
            begin
              PrintBand := True;
              fPrevRelCReceber.Query1.Prior;
            end
          else
            begin
              PrintBand := False;
              fPrevRelCReceber.Query1.Prior;
            end;
        end;
    end;
end;

end.

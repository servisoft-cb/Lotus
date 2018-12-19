unit URelPre2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelPre2 = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
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
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLLabel10: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDraw1: TRLDraw;
    RLBand3: TRLBand;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLDraw2: TRLDraw;
    RLBand4: TRLBand;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLBand5: TRLBand;
    RLLabel15: TRLLabel;
    Pro1: TRLLabel;
    Pro2: TRLLabel;
    Pro3: TRLLabel;
    Pro4: TRLLabel;
    Pro5: TRLLabel;
    Pro6: TRLLabel;
    Pro7: TRLLabel;
    Pro8: TRLLabel;
    Pro9: TRLLabel;
    Pro10: TRLLabel;
    Pro11: TRLLabel;
    Pro12: TRLLabel;
    Pro13: TRLLabel;
    Pro14: TRLLabel;
    Pro15: TRLLabel;
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
    Qtd14: TRLLabel;
    Qtd15: TRLLabel;
    Mar1: TRLLabel;
    Mar2: TRLLabel;
    Mar3: TRLLabel;
    Mar4: TRLLabel;
    Mar5: TRLLabel;
    Mar6: TRLLabel;
    Mar7: TRLLabel;
    Mar8: TRLLabel;
    Mar9: TRLLabel;
    Mar10: TRLLabel;
    Mar11: TRLLabel;
    Mar12: TRLLabel;
    Mar13: TRLLabel;
    Mar14: TRLLabel;
    Mar15: TRLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    vMarcarExiste : Boolean;
  public
    { Public declarations }
    vQtdPar : Integer;
  end;

var
  fRelPre2: TfRelPre2;

implementation

uses UPrevPre2;

{$R *.dfm}

procedure TfRelPre2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelPre2.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  vTexto : String;
begin
  vTexto := 'Relatório Para o PRÉ';
  if fPrevPre2.RadioGroup1.ItemIndex = 0 then
    vTexto := vTexto + '  -  Lote Nº.: ' + fPrevPre2.Edit1.text
  else
    vTexto := vTexto + '  -  Lotes Nº.: ' + fPrevPre2.Edit1.Text + ' a ' + fPrevPre2.Edit2.Text;
  RLLabel1.Caption := vTexto;
end;

procedure TfRelPre2.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel10.Caption := fPrevPre2.mAuxPrelkMaterial.AsString + '/' + fPrevPre2.mAuxPrelkPosicao.AsString;
end;

procedure TfRelPre2.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel12.Caption := 'Total de Pares: ' + IntToStr(vQtdPar);
end;

procedure TfRelPre2.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  i : Integer;
begin
  vMarcarExiste := False;
  i := 0;
  fPrevPre2.mAuxPreGrade.First;
  while not fPrevPre2.mAuxPreGrade.Eof do
  begin
    if fPrevPre2.mAuxPreGradeQtdPar.AsInteger > 0 then
    begin
      i := i + 1;
      TRLLabel(FindComponent('Pro'+IntToStr(i))).Visible := True;
      TRLLabel(FindComponent('Qtd'+IntToStr(i))).Visible := True;
      TRLLabel(FindComponent('Mar'+IntToStr(i))).Visible := True;

      TRLLabel(FindComponent('Pro'+IntToStr(i))).Caption := fPrevPre2.mAuxPreGradeTamanho.AsString;
      TRLLabel(FindComponent('Qtd'+IntToStr(i))).Caption := fPrevPre2.mAuxPreGradeQtdPar.AsString;
      TRLLabel(FindComponent('Mar'+IntToStr(i))).Caption := fPrevPre2.mAuxPreGradeMarcarTam.AsString;
      if trim(fPrevPre2.mAuxPreGradeMarcarTam.AsString) <> '' then
        vMarcarExiste := True;
    end;
    fPrevPre2.mAuxPreGrade.Next;
  end;
  while i < 15 do
  begin
    i := i + 1;
    TRLLabel(FindComponent('Pro'+IntToStr(i))).Visible := False;
    TRLLabel(FindComponent('Qtd'+IntToStr(i))).Visible := False;
    TRLLabel(FindComponent('Mar'+IntToStr(i))).Visible := False;
  end;
end;

procedure TfRelPre2.FormCreate(Sender: TObject);
begin
  vMarcarExiste := False;
end;

procedure TfRelPre2.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt := vMarcarExiste;
end;

end.

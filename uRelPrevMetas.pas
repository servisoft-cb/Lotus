unit uRelPrevMetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelPrevMetas = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel6: TRLLabel;
    RLDBText1: TRLDBText;
    RLLabel2: TRLLabel;
    RLDraw1: TRLDraw;
    RLSubDetail2: TRLSubDetail;
    RLBand2: TRLBand;
    RLLabel3: TRLLabel;
    Meta1: TRLLabel;
    Meta2: TRLLabel;
    Meta6: TRLLabel;
    Meta5: TRLLabel;
    Meta4: TRLLabel;
    Meta3: TRLLabel;
    Meta7: TRLLabel;
    RLDraw2: TRLDraw;
    Set1: TRLLabel;
    RLBand3: TRLBand;
    Data1: TRLLabel;
    RLDraw3: TRLDraw;
    RLLabel50: TRLLabel;
    Tdif4: TRLLabel;
    Tdif5: TRLLabel;
    Tdif6: TRLLabel;
    Tdif7: TRLLabel;
    Tdif1: TRLLabel;
    Tdif3: TRLLabel;
    Tdif2: TRLLabel;
    Set4: TRLLabel;
    Set3: TRLLabel;
    Set2: TRLLabel;
    Set5: TRLLabel;
    Set6: TRLLabel;
    Set7: TRLLabel;
    Meta8: TRLLabel;
    Set8: TRLLabel;
    Prod1: TRLLabel;
    Prod2: TRLLabel;
    Prod3: TRLLabel;
    Prod4: TRLLabel;
    Prod5: TRLLabel;
    Prod6: TRLLabel;
    Prod7: TRLLabel;
    Dif7: TRLLabel;
    Dif6: TRLLabel;
    Dif5: TRLLabel;
    Dif4: TRLLabel;
    Dif3: TRLLabel;
    Dif2: TRLLabel;
    Dif1: TRLLabel;
    Prod8: TRLLabel;
    Dif8: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    Tdif8: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel27: TRLLabel;
    RLLabel28: TRLLabel;
    RLLabel29: TRLLabel;
    RLLabel30: TRLLabel;
    procedure RLSubDetail1BeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelPrevMetas: TfRelPrevMetas;
implementation

uses UPrevMetasProd, UDM1;

{$R *.dfm}

procedure TfRelPrevMetas.RLSubDetail1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
 fPrevMetasProd.qMetasProd.Active := False;
  RLDBText1.Text := 'Período: ' + fPrevMetasProd.DateEdit1.Text + ' a ' + fPrevMetasProd.DateEdit2.Text;

       Screen.Cursor := crHourglass;
        case fPrevMetasProd.RadioGroup1.ItemIndex of
        0: RLLabel5.Caption := ('Exportação');
        1: RLLabel5.Caption := ('Mercado interno');
        2: RLLabel5.Caption := ('Ambos');
        end;


 fPrevMetasProd.qMetasProd.Active := True;
end;


procedure TfRelPrevMetas.RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
var
  i: Word;
begin
  for i := 1 to 8 do
  begin
    TRLLabel(FindComponent('Set' + IntToStr(i))).Caption := fPrevMetasProd.vCabNomSetor[i];
    TRLLabel(FindComponent('Meta'+ IntToStr(i))).Caption := IntToStr(fPrevMetasProd.vCabMeta[i]);
    TRLLabel(FindComponent('Prod'+ IntToStr(i))).Caption := IntToStr(fPrevMetasProd.vDetProd[I]);

  end;
end;
procedure TfRelPrevMetas.RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
var
  i:Word;
begin
  for i := 1 to 8 do
  begin
    fPrevMetasProd.vTotalDif[i] := fPrevMetasProd.vTotalDif[i] + fPrevMetasProd.vDetDif[i];
    TRLLabel(FindComponent('Dif' + IntToStr(i))).Caption := IntToStr(fPrevMetasProd.vDetDif[i]);
    TRLLabel(FindComponent('Tdif'+ IntToStr(i))).Caption := IntToStr(fPrevMetasProd.vTotalDif[i]);
end;
    if fPrevMetasProd.vData > 01/01/1900 then
    Data1.Caption := DateToStr(fPrevMetasProd.vData);

  end;
end.



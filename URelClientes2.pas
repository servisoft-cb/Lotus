unit uRelClientes2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, RLReport,
  RLRichText;

type
  TfRelClientes2 = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel21: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel22: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel8: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText9: TRLDBText;
    RLBand3: TRLBand;
    RLLabel4: TRLLabel;
    RLDBText3: TRLDBText;
    RLDraw2: TRLDraw;
    RLDBText4: TRLDBText;
    RLLabel7: TRLLabel;
    RLDBText5: TRLDBText;
    RLLabel9: TRLLabel;
    RLDBText17: TRLDBText;
    RLDraw3: TRLDraw;
    RLBand8: TRLBand;
    RLDraw4: TRLDraw;
    RLLabel25: TRLLabel;
    RLDBText21: TRLDBText;
    RLDBText22: TRLDBText;
    RLLabel26: TRLLabel;
    RLDBText23: TRLDBText;
    RLDBText24: TRLDBText;
    RLLabel27: TRLLabel;
    RLDBText25: TRLDBText;
    RLDBText26: TRLDBText;
    RLLabel28: TRLLabel;
    RLLabel29: TRLLabel;
    RLLabel30: TRLLabel;
    RLDBText27: TRLDBText;
    RLLabel31: TRLLabel;
    RLLabel32: TRLLabel;
    RLLabel33: TRLLabel;
    RLDBText28: TRLDBText;
    RLLabel34: TRLLabel;
    RLDBText29: TRLDBText;
    RLLabel35: TRLLabel;
    RLDBText30: TRLDBText;
    RLLabel36: TRLLabel;
    RLDBText31: TRLDBText;
    RLLabel37: TRLLabel;
    RLDBText32: TRLDBText;
    RLLabel38: TRLLabel;
    RLDBText33: TRLDBText;
    RLLabel41: TRLLabel;
    RLDBText36: TRLDBText;
    RLLabel47: TRLLabel;
    RLDBText38: TRLDBText;
    RLBand9: TRLBand;
    RLLabel52: TRLLabel;
    RLLabel53: TRLLabel;
    RLLabel54: TRLLabel;
    RLDBText46: TRLDBText;
    RLLabel57: TRLLabel;
    RLDBText47: TRLDBText;
    RLLabel58: TRLLabel;
    RLDBText48: TRLDBText;
    RLLabel59: TRLLabel;
    RLDBText49: TRLDBText;
    RLLabel60: TRLLabel;
    RLDBText50: TRLDBText;
    RLLabel61: TRLLabel;
    RLDBText51: TRLDBText;
    RLLabel73: TRLLabel;
    RLBand10: TRLBand;
    RLLabel56: TRLLabel;
    RLLabel64: TRLLabel;
    RLDBText45: TRLDBText;
    RLLabel65: TRLLabel;
    RLDBText52: TRLDBText;
    RLLabel66: TRLLabel;
    RLDBText53: TRLDBText;
    RLLabel67: TRLLabel;
    RLDBText54: TRLDBText;
    RLLabel69: TRLLabel;
    RLDBText39: TRLDBText;
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand8BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand9BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand10BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelClientes2: TfRelClientes2;

implementation

uses UConsClientes, UDM1;

{$R *.dfm}

procedure TfRelClientes2.RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  PrintIt := not(fConsClientes.CheckBox2.Checked);
  if not PrintIt then
    exit;
  if  fConsClientes.ckImpEmail.Checked then
    RLBand2.Height := 30
  else
    RLBand2.Height := 17;
end;

procedure TfRelClientes2.RLBand8BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt := fConsClientes.CheckBox2.Checked;
  if not PrintIt then
    exit;

  RLLabel29.Caption := fConsClientes.qClientesEndereco.AsString + ', ' + fConsClientes.qClientesNumEnd.AsString;
  if fConsClientes.qClientesPessoa.AsString = 'J' then
  begin
    RLLabel30.Caption := 'CNPJ:';
    RLLabel31.Caption := 'I.Est:';
    RLLabel32.Caption := fConsClientes.qClientesInscrEst.AsString;
  end
  else
  begin
    RLLabel30.Caption := 'CPF:';
    RLLabel31.Caption := 'RG:';
    RLLabel32.Caption := fConsClientes.qClientesRg.AsString;
  end;
end;

procedure TfRelClientes2.RLBand9BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt := fConsClientes.CheckBox2.Checked;
  if not PrintIt then
    exit;

  PrintIt := (Trim(fConsClientes.qClientesEndEntrega.AsString) <> '');

  RLLabel53.Caption := fConsClientes.qClientesEndEntrega.AsString + ', ' + fConsClientes.qClientesNumEndEntrega.AsString;
end;

procedure TfRelClientes2.RLBand10BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt := fConsClientes.CheckBox2.Checked;
  if not PrintIt then
    exit;

  PrintIt := (Trim(fConsClientes.qClientesEndPgto.AsString) <> '');
end;

end.

unit UPrevICMS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ToolEdit, ExtCtrls;

type
  TfPrevICMS = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrevICMS: TfPrevICMS;

implementation

uses UDM1, URelICMS;

{$R *.DFM}

procedure TfPrevICMS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      Dm1.tNotaFiscal.Close;
      Dm1.tNotaFiscalItens.Close;
      DM1.tCliente.Close;
    end;
  Action := Cafree;
end;

procedure TfPrevICMS.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevICMS.BitBtn2Click(Sender: TObject);
begin
  DateEdit1.Clear;
  DateEdit2.Clear;
end;

procedure TfPrevICMS.BitBtn1Click(Sender: TObject);
begin
  if (DateEdit1.Text <> '  /  /    /') and (DateEdit2.Text <> '  /  /    ') then
    begin
      Dm1.tNotaFiscal.Filtered := False;
      Dm1.tNotaFiscal.Filter   := 'DtEmissao >= ''' +DateEdit1.Text+ ''' and DtEmissao <= ''' +DateEdit2.Text+ ''' and BaseIcms > ''0''';
      Dm1.tNotaFiscal.Filtered := True;
      fRelICMS := TfRelICMS.Create(Self);
      fRelICMS.QuickRep1.Preview;
      fRelICMS.QuickRep1.Free;
      Dm1.tNotaFiscal.Filtered := False;
    end
  else
    ShowMessage('Deve haver datas válidas para efetuar a impressão');  
end;

procedure TfPrevICMS.FormShow(Sender: TObject);
begin
  Dm1.tNotaFiscal.Open;
  Dm1.tNotaFiscalItens.Open;
  DM1.tCliente.Open;
end;

end.

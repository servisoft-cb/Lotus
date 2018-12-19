unit UNotaFiscalItensOutros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RxDBComb, Buttons;

type
  TfNotaFiscalItensOutros = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fNotaFiscalItensOutros: TfNotaFiscalItensOutros;

implementation

uses UDM1;

{$R *.dfm}

procedure TfNotaFiscalItensOutros.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfNotaFiscalItensOutros.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfNotaFiscalItensOutros.FormShow(Sender: TObject);
begin
  if DM1.tNotaFiscalItensMercado.AsString = '' then
    DM1.tNotaFiscalItensMercado.AsString := 'E';
end;

end.

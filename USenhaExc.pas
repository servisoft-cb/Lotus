unit USenhaExc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RXCtrls, Buttons;

type
  TfSenhaExc = class(TForm)
    RxLabel1: TRxLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSenhaExc: TfSenhaExc;

implementation

uses UDM1;

{$R *.dfm}

procedure TfSenhaExc.BitBtn2Click(Sender: TObject);
begin
  vSenhaExc := '';
  Edit1.Clear;
  Close;
end;

procedure TfSenhaExc.FormShow(Sender: TObject);
begin
  vSenhaExc := '';
end;

procedure TfSenhaExc.BitBtn1Click(Sender: TObject);
begin
  vSenhaExc := Edit1.Text;
  Close;
end;

end.

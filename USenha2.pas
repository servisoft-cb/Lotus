unit USenha2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TfSenha2 = class(TForm)
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Bevel2: TBevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSenha2: TfSenha2;

implementation

uses UDM1, UMenuP;

{$R *.DFM}

procedure TfSenha2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfSenha2.BitBtn1Click(Sender: TObject);
begin
  if Edit1.Text = Auto then
    begin
      fMenuP.tEmpresa.Edit;
      fMenuP.tEmpresaAutorizacao.AsString := Auto;
      fMenuP.tEmpresa.Post;
    end
  else
  if Edit1.Text = 'A4R8X9' then
    begin
      fMenuP.tEmpresa.Edit;
      fMenuP.tEmpresaAutorizacao.AsString := Edit1.Text;
      fMenuP.tEmpresa.Post;
    end
  else
    begin
      ShowMessage('Autorização incorreta!'+#13+#13+
                  'O programa será fechado!');
      Application.Terminate;
    end;
  Close;
end;

procedure TfSenha2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssALt]) and (Key = vk_F4) then
    Application.Terminate;
end;

end.

unit UOpcaoTalao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, CurrEdit, Buttons;

type
  TfOpcaoTalao = class(TForm)
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fOpcaoTalao: TfOpcaoTalao;
  vTalaoInicial, vTalaoFinal : Integer;
  vImprimeFolha1 : Boolean;

implementation

{$R *.DFM}

procedure TfOpcaoTalao.FormShow(Sender: TObject);
begin
  CurrencyEdit1.AsInteger := 0;
  CurrencyEdit2.AsInteger := 9999;
end;

procedure TfOpcaoTalao.BitBtn1Click(Sender: TObject);
begin
  if CurrencyEdit1.AsInteger > CurrencyEdit2.AsInteger then
    begin
      ShowMessage('Talão inicial não pode ser maior que final');
      CurrencyEdit1.SetFocus;
    end
  else
    begin
      vTalaoInicial  := CurrencyEdit1.AsInteger;
      vTalaoFinal    := CurrencyEdit2.AsInteger;
      vImprimeFolha1 := CheckBox1.Checked;
      Close;
    end;
end;

procedure TfOpcaoTalao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

end.

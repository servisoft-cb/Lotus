unit UQuant;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ToolEdit, CurrEdit;

type
  TfQuant = class(TForm)
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fQuant: TfQuant;
  vQuant: Integer;

implementation

uses UDM1;

{$R *.DFM}

procedure TfQuant.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfQuant.BitBtn1Click(Sender: TObject);
begin
  if CurrencyEdit1.Value <> 0 then
    begin
      vQuant := CurrencyEdit1.AsInteger;
      Close;
    end
  else
    begin
      ShowMessage('Deve haver no mínimo "1" na qtd. de cópias p/ a impressão!');
      CurrencyEdit1.SetFocus;
    end;
end;

end.

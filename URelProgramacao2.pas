unit URelProgramacao2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelProgramacao2 = class(TForm)
    RLReport1: TRLReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelProgramacao2: TfRelProgramacao2;

implementation

uses UPrevRelProgramacao;

{$R *.dfm}

procedure TfRelProgramacao2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

end.

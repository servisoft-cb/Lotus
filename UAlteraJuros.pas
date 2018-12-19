unit UAlteraJuros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons;

type
  TfAlteraJuros = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAlteraJuros: TfAlteraJuros;

implementation

uses UDM1;

{$R *.DFM}

procedure TfAlteraJuros.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfAlteraJuros.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfAlteraJuros.BitBtn1Click(Sender: TObject);
begin
  DM1.tCReceberParc.Post;
  Close;
end;

procedure TfAlteraJuros.FormShow(Sender: TObject);
begin
  DM1.tCReceberParc.Edit;
end;

end.

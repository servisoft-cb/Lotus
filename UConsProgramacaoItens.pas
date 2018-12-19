unit UConsProgramacaoItens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, SMDBGrid;

type
  TfConsProgramacaoItens = class(TForm)
    Panel1: TPanel;
    SMDBGrid1: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsProgramacaoItens: TfConsProgramacaoItens;

implementation

uses UPrevRelProgramacao;

{$R *.dfm}

procedure TfConsProgramacaoItens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Close;
end;

procedure TfConsProgramacaoItens.FormShow(Sender: TObject);
begin
  Top    := 0;
  Left   := 0;
  Width  := Screen.Width;
  Height := Screen.Height - 35;
end;

end.

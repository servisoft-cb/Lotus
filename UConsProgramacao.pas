unit UConsProgramacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl;

type
  TfConsProgramacao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    RxDBGrid2: TRxDBGrid;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    RxDBGrid1: TRxDBGrid;
    GroupBox3: TGroupBox;
    RxDBGrid3: TRxDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsProgramacao: TfConsProgramacao;

implementation

uses UDM1, UDM2, UPrevRelProgramacao;

{$R *.DFM}

procedure TfConsProgramacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfConsProgramacao.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

end.

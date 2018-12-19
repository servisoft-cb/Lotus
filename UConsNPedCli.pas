unit UConsNPedCli;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl;

type
  TfConsNPedCli = class(TForm)
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsNPedCli: TfConsNPedCli;

implementation

uses UPedido, UDM1, UAgendaTelef;

{$R *.DFM}

procedure TfConsNPedCli.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fPedido.tPedido2.Filtered := False;
  Action := Cafree;
end;

procedure TfConsNPedCli.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsNPedCli.FormShow(Sender: TObject);
begin
  fPedido.tPedido2.IndexFieldNames := 'CodCliente';
  fPedido.tPedido2.Filtered        := False;
  fPedido.tPedido2.Filter          := 'CodCliente = '''+DM1.tPedidoCodCliente.AsString+'''';
  fPedido.tPedido2.Filtered        := True;
end;

procedure TfConsNPedCli.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.

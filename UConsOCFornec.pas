unit UConsOCFornec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DBCtrls, Buttons, Grids, DBGrids, RXDBCtrl;

type
  TfConsOCFornec = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    DBText1: TDBText;
    BitBtn1: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    StaticText1: TStaticText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsOCFornec: TfConsOCFornec;

implementation

uses UDM1, UOS, UAgendaTelef;

{$R *.DFM}

procedure TfConsOCFornec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not DM1.tOrdemCompra.IsEmpty then
    DM1.tOSNumOC.AsInteger := DM1.tOrdemCompraCodigo.AsInteger;
  DM1.tOrdemCompra.Filtered := False;
  Action := Cafree;
end;

procedure TfConsOCFornec.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsOCFornec.RxDBGrid1DblClick(Sender: TObject);
begin
  Close;
end;

procedure TfConsOCFornec.FormCreate(Sender: TObject);
begin
  DM1.tOrdemCompra.Filtered := False;
  DM1.tOrdemCompra.Filter   := 'CodFornecedor = '''+IntToSTr(DM1.tOSCodFornecedor.AsInteger)+''' and Entregue <> True';
  DM1.tOrdemCompra.Filtered := True;
end;

procedure TfConsOCFornec.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.

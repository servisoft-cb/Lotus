unit UPendencias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables, Grids, DBGrids, RXDBCtrl;

type
  TfPendencias = class(TForm)
    RxDBGrid1: TRxDBGrid;
    qPendencia: TQuery;
    qsPendencia: TDataSource;
    BitBtn5: TBitBtn;
    qPendenciaNumNota: TIntegerField;
    qPendenciaDtEmissao: TDateField;
    qPendenciaDiasAtraso: TFloatField;
    qPendenciaDtVencCReceber: TDateField;
    qPendenciaRestParcela: TFloatField;
    qPendenciaVlrParcCReceber: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPendencias: TfPendencias;

implementation

uses UDevolucao, UAgendaTelef;

{$R *.DFM}

procedure TfPendencias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfPendencias.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfPendencias.FormCreate(Sender: TObject);
begin
  qPendencia.Close;
  qPendencia.Params[0].AsInteger := fDevolucao.RxDBLookupCombo1.KeyValue;
  qPendencia.Open;
end;

procedure TfPendencias.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  qPendencia.Close;
end;

procedure TfPendencias.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.

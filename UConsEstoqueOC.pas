unit UConsEstoqueOC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables, Grids, DBGrids, RXDBCtrl;

type
  TfConsEstoqueOC = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    RxDBGrid1: TRxDBGrid;
    qOCPendente: TQuery;
    BitBtn6: TBitBtn;
    qOCPendenteCodFornecedor: TIntegerField;
    qOCPendenteDtEmissao: TDateField;
    qOCPendenteCodMaterial: TIntegerField;
    qOCPendenteItem: TIntegerField;
    qOCPendenteCodigo: TIntegerField;
    qOCPendenteCodCor: TIntegerField;
    qOCPendenteQtd: TFloatField;
    qOCPendenteVlrUnitario: TFloatField;
    qOCPendenteDtEntrega: TDateField;
    qOCPendenteQtdEntregue: TFloatField;
    qOCPendenteQtdRestante: TFloatField;
    dsqOCPendente: TDataSource;
    qOCPendentelkNomeFornecedor: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsEstoqueOC: TfConsEstoqueOC;

implementation

uses UDM1;

{$R *.DFM}

procedure TfConsEstoqueOC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qOCPendente.Close;
  Action := Cafree;
end;

procedure TfConsEstoqueOC.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

end.

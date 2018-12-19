unit UConsConfirmacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, DBTables, ExtCtrls, Grids, DBGrids, SMDBGrid,
  Buttons;

type
  TfConsConfirmacao = class(TForm)
    SMDBGrid1: TSMDBGrid;
    Panel1: TPanel;
    qConsulta: TQuery;
    qConsultaCliente: TIntegerField;
    qConsultaId: TIntegerField;
    qConsultaModelo: TStringField;
    qConsultaCor: TIntegerField;
    qConsultaConfirmado: TBooleanField;
    qConsultaData: TDateField;
    qConsultaHora: TTimeField;
    qConsultaNomeCor: TStringField;
    qConsultaNomeCliente: TStringField;
    ComboBox1: TComboBox;
    Label1: TLabel;
    dsqConsulta: TDataSource;
    BitBtn1: TBitBtn;
    StaticText1: TStaticText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    vSQL : String;
  public
    { Public declarations }
  end;

var
  fConsConfirmacao: TfConsConfirmacao;

implementation

uses UDM1;

{$R *.dfm}

procedure TfConsConfirmacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfConsConfirmacao.FormShow(Sender: TObject);
begin
  vSQL := qConsulta.SQL.Text;

end;

procedure TfConsConfirmacao.BitBtn1Click(Sender: TObject);
begin
  qConsulta.Close;
  qConsulta.SQL.Clear;
  qConsulta.SQL.Text := vSQL;
  case ComboBox1.ItemIndex of
    0 : qConsulta.SQL.Add('ORDER BY dbCliente.Nome, dbConfirmacao.Modelo, dbCor.Nome, dbConfirmacao.Data');
    1 : qConsulta.SQL.Add('ORDER BY dbConfirmacao.Modelo, dbCor.Nome, dbConfirmacao.Data');
    2 : qConsulta.SQL.Add('ORDER BY dbCor.Nome, dbConfirmacao.Modelo, dbCor.Nome, dbConfirmacao.Data');
    3 : qConsulta.SQL.Add('ORDER BY dbConfirmacao.Data, dbConfirmacao.Modelo, dbCor.Nome');
    4 : qConsulta.SQL.Add('ORDER BY dbConfirmacao.ID');
  end;
  qConsulta.Open;
end;

procedure TfConsConfirmacao.SMDBGrid1DblClick(Sender: TObject);
begin
  DM1.tConfirmacao.Locate('ID', qConsultaId.AsInteger ,[loCaseInsensitive]);
  Close;
end;

end.

unit uConsLoteProdPend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBTables, Grids, DBGrids, SMDBGrid, DBClient,
  Buttons, ExtCtrls, ComCtrls;

type
  TfConsLoteProdPend = class(TForm)
    SMDBGrid1: TSMDBGrid;
    dsConsulta: TDataSource;
    qrConsulta: TQuery;
    mConsulta: TClientDataSet;
    mConsultaLote: TIntegerField;
    mConsultaReferencia: TStringField;
    mConsultaCor: TStringField;
    mConsultaQuantidade: TIntegerField;
    mConsultaQuantProduzida: TIntegerField;
    mConsultaQuantPendente: TIntegerField;
    qLote: TQuery;
    qLoteSetor: TIntegerField;
    qLoteQtdPar: TFloatField;
    Bevel1: TBevel;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    ProgressBar1: TProgressBar;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsLoteProdPend: TfConsLoteProdPend;

implementation

{$R *.dfm}

procedure TfConsLoteProdPend.BitBtn1Click(Sender: TObject);
begin
  screen.Cursor := crHourGlass;
  mConsulta.DisableControls;
  qrConsulta.Close;
  qrConsulta.SQL.Clear;
  qrConsulta.SQL.Add('Select distinct dbTalaoAuxiliar.Lote, dbProduto.Referencia, dbCor.Nome as Cor, dbTalaoAuxiliar.QtdPares, dbTalaoAuxiliar.Pedido, dbTalaoAuxiliar.ItemPedido ');
  qrConsulta.SQL.Add('from dbTalaoAuxiliar ');
  qrConsulta.SQL.Add(' left join dbProduto on (dbTalaoAuxiliar.CodProduto = dbProduto.Codigo) ');
  qrConsulta.SQL.Add(' left join dbCor on (dbTalaoAuxiliar.CodCor = dbCor.Codigo) ');
  qrConsulta.SQL.Add(' where dbTalaoAuxiliar.Lote between ' + Edit1.Text + ' and ' + Edit2.Text);
  qrConsulta.Open;
  mConsulta.EmptyDataSet;
  ProgressBar1.Max := qrConsulta.RecordCount;
  ProgressBar1.Position := 0;
  qrConsulta.First;
  while not(qrConsulta.Eof) do
  begin
    qLote.Close;
    qLote.ParamByName('Lote').AsInteger   := qrConsulta.FieldByName('Lote').AsInteger;
    qLote.ParamByName('Pedido').AsInteger := qrConsulta.FieldByName('Pedido').AsInteger;
    qLote.ParamByName('Item').AsInteger   := qrConsulta.FieldByName('ItemPedido').AsInteger;
    qLote.Open;
    mConsulta.Insert;
    ProgressBar1.Position := ProgressBar1.Position + 1;
    mConsultaLote.AsInteger := qrConsulta.FieldByName('Lote').AsInteger;
    mConsultaReferencia.AsString := qrConsulta.FieldByName('Referencia').AsString;
    mConsultaQuantidade.AsInteger := qrConsulta.FieldByName('QtdPares').AsInteger;
    mConsultaQuantProduzida.AsInteger := qLote.FieldByName('QtdPar').AsInteger;
    mConsultaQuantPendente.AsInteger := qrConsulta.FieldByName('QtdPares').AsInteger - qLote.FieldByName('QtdPar').AsInteger;;
    mConsulta.Post;
    qrConsulta.Next;
  end;
  screen.Cursor := crDefault;
  mConsulta.EnableControls;
end;

procedure TfConsLoteProdPend.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

end.

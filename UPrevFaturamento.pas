unit UPrevFaturamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, CurrEdit, Db, DBTables,
  MemTable, RXLookup, DBFilter, ComCtrls, Grids, DBGrids, Menus, RXCtrls,
  RXDBCtrl;

type
  TfPrevFaturamento = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;               
    BitBtn1: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;                                
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    qFaturamento: TQuery;
    Label5: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    BitBtn2: TBitBtn;
    qFaturamentoNumNota: TIntegerField;
    qFaturamentoDtEmissao: TDateField;
    qFaturamentoCodNatOper: TStringField;
    qFaturamentoCodCli: TIntegerField;
    qFaturamentoCodVendedor: TIntegerField;
    qFaturamentoVlrTotalNota: TFloatField;
    qFaturamentolkNomeCliente: TStringField;
    qFaturamentolkNomeVendedor: TStringField;
    dsqFaturamento: TDataSource;
    qFaturamentoPedidoCliente: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBLookupCombo1DropDown(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Monta_SQL;
  public
    { Public declarations }
  end;

var
  fPrevFaturamento: TfPrevFaturamento;

implementation

uses UDM1, UEscImpressora, URelFaturamento;

{$R *.DFM}

procedure TfPrevFaturamento.Monta_SQL;
begin
  qFaturamento.Close;
  qFaturamento.SQL.Clear;
  qFaturamento.SQL.Add('SELECT DISTINCT Dbnotafiscal.NumNota, Dbnotafiscal.DtEmissao, Dbnatoperacao.CodNatOper, ');
  qFaturamento.SQL.Add(' Dbnotafiscal.PedidoCliente, Dbnotafiscal.CodCli, Dbnotafiscal.CodVendedor, Dbnotafiscal.VlrTotalNota');
  qFaturamento.SQL.Add('FROM "DBNOTAFISCAL.DB" Dbnotafiscal');
  qFaturamento.SQL.Add('   INNER JOIN "dbNatOperacao.DB" Dbnatoperacao');
  qFaturamento.SQL.Add('   ON  (Dbnotafiscal.CodNatOper = Dbnatoperacao.Codigo)');
  qFaturamento.SQL.Add('WHERE  (Dbnotafiscal.CondPgto <> ''N'')');
  qFaturamento.SQL.Add('   AND (Dbnotafiscal.DtEmissao BETWEEN :Data1 and :Data2)');
  qFaturamento.ParamByName('Data1').AsDate := DateEdit1.Date;
  qFaturamento.ParamByName('Data2').AsDate := DateEdit2.Date;
  if RxDBLookupCombo1.Text <> '' then
    begin
      qFaturamento.SQL.Add('   AND (Dbnotafiscal.CodVendedor = :CodVendedor)');
      qFaturamento.ParamByName('CodVendedor').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if RxDBLookupCombo2.Text <> '' then
    begin
      qFaturamento.SQL.Add('   AND (Dbnotafiscal.CodCli = :CodCli)');
      qFaturamento.ParamByName('CodCli').AsInteger := RxDBLookupCombo2.KeyValue;
    end;
  qFaturamento.SQL.Add('ORDER BY Dbnotafiscal.NumNota');
  qFaturamento.Open;
  qFaturamento.First;
end;

procedure TfPrevFaturamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qFaturamento.Close;
  if Screen.FormCount < 3 then
    begin
      Dm1.tVendedor.Close;
      Dm1.tCliente.Close;
    end;
  Action := Cafree;
end;

procedure TfPrevFaturamento.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevFaturamento.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Nome';
end;

procedure TfPrevFaturamento.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Codigo';
end;

procedure TfPrevFaturamento.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

procedure TfPrevFaturamento.BitBtn2Click(Sender: TObject);
begin
  if (DateEdit1.Text = '') or (DateEdit2.Text = '') then
    ShowMessage('É obrigatório informar a data inicial e final!')
  else
  if DateEdit1.Date > DateEdit2.Date then
    ShowMessage('Data inicial maior que data final!')
  else
    begin
      Screen.Cursor  := crHourglass;
      Monta_SQL;
      Screen.Cursor  := crDefault;
      fRelFaturamento := TfRelFaturamento.Create(Self);
      fRelFaturamento.RLReport2.Preview;
      fRelFaturamento.RLReport2.Free;
    end;
end;

procedure TfPrevFaturamento.FormShow(Sender: TObject);
begin
  Dm1.tVendedor.Open;
  Dm1.tCliente.Open;
end;

end.

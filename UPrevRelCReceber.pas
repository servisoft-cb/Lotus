unit UPrevRelCReceber;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons, Menus, RXCtrls, Printers,
  Db, DBTables, Grids, DBGrids, RxLookup;

type
  TfPrevRelCReceber = class(TForm)
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    StaticText1: TStaticText;
    DateEdit1: TDateEdit;
    StaticText2: TStaticText;
    DateEdit2: TDateEdit;
    Panel2: TPanel;
    BitBtn4: TBitBtn;
    RxSpeedButton1: TRxSpeedButton;
    PopupMenu2: TPopupMenu;
    Imprimir1: TMenuItem;
    Visualizar1: TMenuItem;
    Bevel1: TBevel;
    Query1: TQuery;
    tCReceberParc2: TTable;
    Bevel2: TBevel;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    tCReceberParc2NumCReceber: TIntegerField;
    tCReceberParc2ParcCReceber: TIntegerField;
    tCReceberParc2VlrParcCReceber: TFloatField;
    tCReceberParc2DtVencCReceber: TDateField;
    tCReceberParc2QuitParcCReceber: TBooleanField;
    tCReceberParc2JurosParcCReceber: TFloatField;
    tCReceberParc2DtPagParcCReceber: TDateField;
    tCReceberParc2CodCli: TIntegerField;
    tCReceberParc2NumNota: TIntegerField;
    tCReceberParc2Desconto: TFloatField;
    tCReceberParc2PgtoParcial: TFloatField;
    tCReceberParc2RestParcela: TFloatField;
    tCReceberParc2ContaDupl: TSmallintField;
    tCReceberParc2Selecionado: TBooleanField;
    tCReceberParc2CodVendedor: TIntegerField;
    tCReceberParc2Baixada: TBooleanField;
    tCReceberParc2PercComissao: TFloatField;
    tCReceberParc2VlrComissao: TFloatField;
    tCReceberParc2PlanoContas: TIntegerField;
    tCReceberParc2Agencia: TStringField;
    tCReceberParc2TitPortador: TStringField;
    tCReceberParc2CodTipoCobranca: TIntegerField;
    tCReceberParc2Despesas: TFloatField;
    tCReceberParc2Abatimentos: TFloatField;
    tCReceberParc2CodConta: TIntegerField;
    tCReceberParc2PgCartorio: TBooleanField;
    tCReceberParc2DiasAtraso: TFloatField;
    tCReceberParc2LetraCambio: TBooleanField;
    tCReceberParc2NroLancExtComissao: TIntegerField;
    tCReceberParc2JurosPagos: TFloatField;
    Query1Nota: TIntegerField;
    Query1Parcela: TIntegerField;
    Query1Data: TDateField;
    Query1ValorParc: TFloatField;
    Query1ValorRestante: TFloatField;
    Query1CodConta: TIntegerField;
    Query1DtPgto: TDateField;
    Query1CodCli: TIntegerField;
    Query1NumCReceber: TIntegerField;
    Query1ValorPago: TFloatField;
    Query1JurosPagos: TFloatField;
    Query1Abatimentos: TFloatField;
    RadioGroup2: TRadioGroup;
    Label2: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Query1NomeCliente: TStringField;
    Query1Fantasia: TStringField;
    CheckBox2: TCheckBox;
    procedure RadioGroup1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Filtra_Calcula2;
    procedure Muda_DataSet;
  public
    { Public declarations }
  end;

var
  fPrevRelCReceber: TfPrevRelCReceber;

implementation

uses URelCReceber, UDM1;

{$R *.DFM}

procedure TfPrevRelCReceber.Filtra_Calcula2;
begin
  Query1.Active := False;
  Query1.SQL.Clear;
  Query1.SQL.Add('SELECT A.NumNota AS Nota, A.ParcCReceber AS Parcela, A.DtVencCReceber AS Data, A.VlrParcCReceber AS ValorParc, A.JurosPagos AS JurosPagos , A.PgtoParcial AS ValorPago, A.RestParcela AS ValorRestante, ');
  Query1.SQL.Add(' A.CodConta AS CodConta, A.DtPagParcCReceber AS DtPgto, A.CodCli, A.NumCReceber, A.Abatimentos As Abatimentos, dbVendedor.Nome, ');
  Query1.SQL.Add(' Dbcliente.Nome NomeCliente, DbCliente.Fantasia');
  Query1.SQL.Add('FROM dbCReceberParc A');
  Query1.SQL.Add('   LEFT JOIN "dbCliente.DB" Dbcliente');
  Query1.SQL.Add('   ON  (A.CodCli = Dbcliente.Codigo)');
  Query1.SQL.Add('   LEFT JOIN "dbVendedor.DB" Dbvendedor');
  Query1.SQL.Add('   ON  (A.CodVendedor = DbVendedor.Codigo)');
  Query1.SQL.Add('WHERE ((A.Cancelado = FALSE) OR (A.Cancelado IS NULL))');
  Query1.SQL.Add('  AND (A.Mercado = :M1)');
  if not CheckBox2.Checked then
    Query1.SQL.Add('  AND (A.ParcCReceber < 11)');
  Case RadioGroup2.ItemIndex of
    0 : Query1.ParamByName('M1').AsString := 'I';
    1 : Query1.ParamByName('M1').AsString := 'O';
  end;
  if RxDBLookupCombo1.Text <> '' then
    begin
      Query1.SQL.Add(' AND A.CodVendedor = :CodVendedor');
      Query1.ParamByName('CodVendedor').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if (RadioGroup1.ItemIndex = 0) or (RadioGroup1.ItemIndex = 1) then
    begin
      Query1.SQL.Add(' AND  (A.RestParcela > 0)');
      if RadioGroup1.ItemIndex = 0 then
        Query1.SQL.Add(' AND (A.DtVencCReceber <= :DataInicial)');
    end;
  if (DateEdit1.Date > 0) and (RadioGroup1.ItemIndex > 0) then
    Query1.SQL.Add('  AND (A.DtVencCReceber >= :DataInicial)');
  if (DateEdit2.Date > 0) and (RadioGroup1.ItemIndex > 0) then
    Query1.SQL.Add('  AND (A.DtVencCReceber <= :DataFinal)');
  if DateEdit1.Date > 0 then
    Query1.ParamByName('DataInicial').AsDate := DateEdit1.Date;
  if DateEdit2.Date > 0 then
    Query1.ParamByName('DataFinal').AsDate := DateEdit2.Date;
  Query1.SQL.Add('ORDER BY A.DtVencCReceber, A.NumNota');
  Query1.Active := True;
end;

procedure TfPrevRelCReceber.Muda_DataSet;
begin
  fRelCReceber.QuickRep1.DataSet := Query1;
  fRelCReceber.QRDBText1.DataSet := Query1;
  fRelCReceber.QRDBText2.DataSet := Query1;
  fRelCReceber.QRDBText3.DataSet := Query1;
  fRelCReceber.QRDBText4.DataSet := Query1;
  fRelCReceber.QRDBText5.DataSet := Query1;
  fRelCReceber.QRDBText6.DataSet := Query1;
  fRelCReceber.QRDBText7.DataSet := Query1;
  fRelCReceber.QRDBText8.DataSet := Query1;
  fRelCReceber.QRDBText9.DataSet := Query1;
end;

procedure TfPrevRelCReceber.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
    begin
      StaticText1.Caption := 'Data Referência:';
      StaticText2.Visible := False;
      DateEdit2.Visible   := False;
    end
  else
    begin
      StaticText1.Caption := 'Data Inicial:';
      StaticText2.Visible := True;
      DateEdit2.Visible   := True;
    end;
end;

procedure TfPrevRelCReceber.Imprimir1Click(Sender: TObject);
begin
  Filtra_Calcula2;
  Application.CreateForm(TfRelCReceber, fRelCReceber);
  Muda_DataSet;
  fRelCReceber.QuickRep1.Print;
  fRelCReceber.QuickRep1.Free;
end;

procedure TfPrevRelCReceber.Visualizar1Click(Sender: TObject);
begin
  if (RadioGroup1.ItemIndex = 0) and (DateEdit1.Date < 1) then
    DateEdit1.Date := Date;
  Filtra_Calcula2;
  Application.CreateForm(TfRelCReceber, fRelCReceber);
  Muda_DataSet;
  fRelCReceber.QuickRep1.Preview;
  fRelCReceber.QuickRep1.Free;
end;

procedure TfPrevRelCReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      DM1.tVendedor.Close;
      DM1.tCliente.Close;
    end;
  Action := caFree;
end;

procedure TfPrevRelCReceber.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevRelCReceber.RxDBLookupCombo1Enter(Sender: TObject);
begin
  Dm1.tVendedor.IndexFieldNames := 'Nome';
end;

procedure TfPrevRelCReceber.FormShow(Sender: TObject);
begin
  Dm1.tVendedor.Open;
  Dm1.tCliente.Open;
end;

procedure TfPrevRelCReceber.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 87) then
    begin
      CheckBox2.Visible := not(CheckBox2.Visible);
      if CheckBox2.Visible then
        CheckBox2.Checked := True
      else
        CheckBox2.Checked := False;
    end;
end;

end.

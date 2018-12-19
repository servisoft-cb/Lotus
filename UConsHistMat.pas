unit UConsHistMat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, RxLookup, Buttons, Grids, DBGrids, RXDBCtrl, Db,
  DBTables, Mask, ToolEdit, CurrEdit, DBCtrls, RzDBCmbo;

type
  TfConsHistMat = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    BitBtn2: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    qMaterial: TQuery;
    qsMaterial: TDataSource;
    qMaterialCodMaterial: TIntegerField;
    qMaterialNomeMaterial: TStringField;
    qMaterialNumMov: TIntegerField;
    qMaterialNomeCor: TStringField;
    qMaterialLargura: TStringField;
    qMaterialDtMov: TDateField;
    qMaterialES: TStringField;
    qMaterialTipoMov: TStringField;
    qMaterialNumNota: TIntegerField;
    qMaterialVlrUnitario: TFloatField;
    qMaterialQtd: TFloatField;
    qMaterialUnidade: TStringField;
    qMaterialCodCor: TIntegerField;
    Label2: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    qCor: TQuery;
    qsCor: TDataSource;
    qCorNome: TStringField;
    qCorCodigo: TIntegerField;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    qMaterialPercIcms: TFloatField;
    Label9: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    ComboBox1: TComboBox;
    Label10: TLabel;
    qMaterialMercado: TStringField;
    qMaterialCodCliForn: TIntegerField;
    qMaterialclNomeCliForn: TStringField;
    Label11: TLabel;
    BitBtn3: TBitBtn;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure qMaterialCalcFields(DataSet: TDataSet);
    procedure BitBtn3Click(Sender: TObject);
    procedure RzDBLookupComboBox1Enter(Sender: TObject);
    procedure RzDBLookupComboBox1Exit(Sender: TObject);
  private
    { Private declarations }
    procedure Gera_Totais;
    procedure Monta_SQLMat;
  public
    { Public declarations }
  end;

var
  fConsHistMat: TfConsHistMat;
  vEntrada, vSaida, vSaldo : Real;

implementation

uses UDM1, UAgendaTelef, UTrocaMercado;

{$R *.DFM}

procedure TfConsHistMat.Monta_SQLMat;
begin
  qMaterial.Close;
  qMaterial.SQL.Clear;
  qMaterial.SQL.Add('SELECT Dbestoquematmov.CodMaterial, Dbmaterial.Nome NomeMaterial, Dbestoquematmov.NumMov, Dbcor.Nome NomeCor, Dbestoquematmov.Largura, Dbestoquematmov.DtMov, ');
  qMaterial.SQL.Add(' Dbestoquematmov.ES, Dbestoquematmov.TipoMov, Dbestoquematmov.NumNota, Dbestoquematmov.VlrUnitario, Dbestoquematmov.Qtd, ');
  qMaterial.SQL.Add(' Dbestoquematmov.Unidade, Dbestoquematmov.CodCor, Dbestoquematmov.PercIcms, Dbestoquematmov.Mercado, Dbestoquematmov.CodCliForn');
  qMaterial.SQL.Add('FROM "dbMaterial.DB" Dbmaterial');
  qMaterial.SQL.Add('   INNER JOIN "dbEstoqueMatMov.DB" Dbestoquematmov');
  qMaterial.SQL.Add('   ON  (Dbestoquematmov.CodMaterial = Dbmaterial.Codigo)');
  qMaterial.SQL.Add('   FULL JOIN "Dbcor.db" Dbcor');
  qMaterial.SQL.Add('   ON  (Dbestoquematmov.CodCor = Dbcor.Codigo)');
  qMaterial.SQL.Add('WHERE   (Dbestoquematmov.CodMaterial = :CodMaterial)');
  qMaterial.SQL.Add('   AND  (Dbestoquematmov.CodCor = :CodCor)');
  if ComboBox1.ItemIndex < 2 then
    begin
      qMaterial.SQL.Add('   AND  (Dbestoquematmov.Mercado = :Mercado)');
      case ComboBox1.ItemIndex of
        0 : qMaterial.ParamByName('Mercado').AsString := 'E';
        1 : qMaterial.ParamByName('Mercado').AsString := 'I';
      end;
    end;
  qMaterial.ParamByName('CodMaterial').AsInteger := RzDBLookupComboBox1.KeyValue;
  if RxDBLookupCombo2.KeyValue > 0 then
    qMaterial.ParamByName('CodCor').AsInteger := RxDBLookupCombo2.KeyValue
  else
    qMaterial.ParamByName('CodCor').AsInteger := 0;
  qMaterial.SQL.Add('ORDER BY Dbestoquematmov.DtMov, Dbestoquematmov.ES, Dbmaterial.Nome');
  qMaterial.Open;
end;

procedure TfConsHistMat.Gera_Totais;
begin
  vSaldo   := 0;
  vEntrada := 0;
  vSaida   := 0;
  qMaterial.First;
  while not qMaterial.Eof do
    begin
      if qMaterialES.AsString = 'E' then
        vEntrada := vEntrada + qMaterialQtd.AsFloat
      else
      if qMaterialES.AsString = 'S' then
        vSaida := vSaida + qMaterialQtd.AsFloat;
      qMaterial.Next;
    end;
  vSaldo := vEntrada - vSaida;
  Label4.Caption := FormatFloat('#,###,###,###,##0.00000',vEntrada);
  Label6.Caption := FormatFloat('#,###,###,###,##0.00000',vSaida);
  Label8.Caption := FormatFloat('#,###,###,###,##0.00000',vSaldo);
end;

procedure TfConsHistMat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qMaterial.Close;
  qCor.Close;
  if Screen.FormCount < 3 then
    begin
      DM1.tMaterial.Close;
      DM1.tMaterialCor.Close;
      DM1.tCor.Close;
      DM1.tGrade.Close;
      DM1.tGradeItem.Close;
      DM1.tCliente.Close;
      DM1.tFornecedores.Close;
      DM1.tEstoqueMatMov.Close;
    end;
  Action           := Cafree;
end;

procedure TfConsHistMat.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tMaterial.IndexFieldNames := 'Nome';
end;

procedure TfConsHistMat.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsHistMat.BitBtn1Click(Sender: TObject);
begin
  if RzDBLookupComboBox1.Text <> '' then
    begin
      Screen.Cursor                 := crHourGlass;
      Monta_SQLMat;
      Gera_Totais;
      Screen.Cursor                 := crDefault;
    end
  else
    begin
      ShowMessage('Deve ser selecionado um material p/ executar esta consulta!');
      RzDBLookupComboBox1.SetFocus;
    end;
end;

procedure TfConsHistMat.SpeedButton1Click(Sender: TObject);
begin
  RzDBLookupComboBox1.ClearKeyValue;
  RxDBLookupCombo2.ClearValue;
  qMaterial.Active := False;
  qCor.Active      := False;
  RzDBLookupComboBox1.SetFocus;
  Label4.Caption := '0.00000';
  Label6.Caption := '0.00000';
  Label8.Caption := '0.00000';
end;

procedure TfConsHistMat.FormShow(Sender: TObject);
begin
  DM1.tMaterial.Open;
  DM1.tMaterialCor.Open;
  DM1.tCor.Open;
  DM1.tGrade.Open;
  DM1.tGradeItem.Open;
  DM1.tGradeItemlk.Open;
  DM1.tCliente.Open;
  DM1.tFornecedores.Open;
  DM1.tEstoqueMatMov.Open;
  qMaterial.Active := False;
end;

procedure TfConsHistMat.RxDBLookupCombo2Enter(Sender: TObject);
begin
  if RzDBLookupComboBox1.Text <> '' then
    begin
      qCor.Active := False;
      qCor.Params[0].AsInteger := RzDBLookupComboBox1.KeyValue;
      qCor.Active := True;
    end;
end;

procedure TfConsHistMat.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

procedure TfConsHistMat.CurrencyEdit1Exit(Sender: TObject);
begin
  if CurrencyEdit1.Value > 0 then
    begin
      Dm1.tMaterial.IndexFieldNames := 'Codigo';
      Dm1.tMaterial.SetKey;
      Dm1.tMaterialCodigo.AsInteger := CurrencyEdit1.AsInteger;
      if Dm1.tMaterial.GotoKey then
        RzDBLookupComboBox1.KeyValue := Dm1.tMaterialCodigo.AsInteger
      else
        ShowMessage('Material não encontrado!');
    end
end;

procedure TfConsHistMat.qMaterialCalcFields(DataSet: TDataSet);
begin
  if qMaterialTipoMov.AsString = 'NTE' then
    if DM1.tFornecedores.Locate('CodForn',qMaterialCodCliForn.AsInteger,[loCaseInsensitive]) then
      qMaterialclNomeCliForn.AsString := DM1.tFornecedoresNomeForn.AsString;
  if qMaterialTipoMov.AsString = 'NTS' then
    if DM1.tCliente.Locate('Codigo',qMaterialCodCliForn.AsInteger,[loCaseInsensitive]) then
      qMaterialclNomeCliForn.AsString := DM1.tClienteNome.AsString;
end;

procedure TfConsHistMat.BitBtn3Click(Sender: TObject);
begin
  if (DM1.tUsuarioTrocaMercado.AsBoolean) and (qMaterial.Active) and (qMaterial.RecordCount > 0) then
    begin
      fTrocaMercado := TfTrocaMercado.Create(Self);
      fTrocaMercado.mEstoque.EmptyTable;
      fConsHistMat.qMaterial.First;
      while not fConsHistMat.qMaterial.Eof do
        begin
          fTrocaMercado.mEstoque.Insert;
          fTrocaMercado.mEstoqueDtMovimento.AsDateTime := qMaterialDtMov.AsDateTime;
          fTrocaMercado.mEstoqueES.AsString            := qMaterialES.AsString;
          fTrocaMercado.mEstoqueMercado.AsString       := qMaterialMercado.AsString;
          fTrocaMercado.mEstoqueNomeCliForn.AsString   := qMaterialclNomeCliForn.AsString;
          fTrocaMercado.mEstoqueNumMov.AsInteger       := qMaterialNumMov.AsInteger;
          fTrocaMercado.mEstoqueNumNota.AsInteger      := qMaterialNumNota.AsInteger;
          fTrocaMercado.mEstoqueQuantidade.AsFloat     := qMaterialQtd.AsFloat;
          fTrocaMercado.mEstoqueTipo.AsString          := qMaterialTipoMov.AsString;
          fTrocaMercado.mEstoque.Post;
          qMaterial.Next;
        end;
      fTrocaMercado.ShowModal;
    end;
end;

procedure TfConsHistMat.RzDBLookupComboBox1Enter(Sender: TObject);
begin
  DM1.tMaterial.IndexFieldNames := 'Nome';
end;

procedure TfConsHistMat.RzDBLookupComboBox1Exit(Sender: TObject);
begin
   DM1.tMaterial.IndexFieldNames := 'Codigo';
  if RzDBLookupComboBox1.Text <> '' then
    begin
      CurrencyEdit1.AsInteger := Dm1.tMaterialCodigo.AsInteger;
      qCor.Active := False;
      qCor.Params[0].AsInteger := RzDBLookupComboBox1.KeyValue;
      qCor.Active := True;
    end;
end;

end.

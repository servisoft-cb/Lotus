unit UConsMaterialPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, RxLookup, CurrEdit, DB, DBTables,
  Grids, DBGrids, SMDBGrid, Buttons, DBClient, ComCtrls;

type
  TfConsMaterialPeriodo = class(TForm)
    Label1: TLabel;
    DateEdit1: TDateEdit;
    Label2: TLabel;
    DateEdit2: TDateEdit;
    SMDBGrid1: TSMDBGrid;
    BitBtn1: TBitBtn;
    qMovimento: TQuery;
    qMovimentoCodMaterial: TIntegerField;
    qMovimentoCodCor: TIntegerField;
    qMovimentoES: TStringField;
    qMovimentoTipoMov: TStringField;
    qMovimentoNumNota: TIntegerField;
    qMovimentoVlrUnitario: TFloatField;
    qMovimentoQtd: TFloatField;
    mEstoque: TClientDataSet;
    mEstoqueCodMaterial: TIntegerField;
    mEstoqueCodCor: TIntegerField;
    mEstoqueNomeMaterial: TStringField;
    mEstoqueNomeCor: TStringField;
    mEstoqueQtdSaida: TFloatField;
    mEstoqueSaldo: TFloatField;
    qMovimentolkNomeMaterial: TStringField;
    qMovimentolkNomeCor: TStringField;
    dsmEstoque: TDataSource;
    ProgressBar1: TProgressBar;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    qMovimentolkInativo: TBooleanField;
    mEstoqueVlrSaida: TFloatField;
    qMovimentoVlrDesconto: TFloatField;
    qMovimentoPercIcms: TFloatField;
    mEstoqueQtdEntrada: TFloatField;
    mEstoqueVlrEntrada: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure mEstoqueNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    procedure Monta_SQL;
    procedure Le_SQL;
  public
    { Public declarations }
  end;

var
  fConsMaterialPeriodo: TfConsMaterialPeriodo;

implementation

uses UDM1, UDM2, URelConsumoMat, URelMaterialPeriodo;

{$R *.dfm}

procedure TfConsMaterialPeriodo.Le_SQL;
var
  vVlrAux : Real;
  vVlrEntrada : Real;
begin
  ProgressBar1.Max      := qMovimento.RecordCount;
  ProgressBar1.Position := 0;

  mEstoque.EmptyDataSet;
  mEstoque.IndexFieldNames := 'CodMaterial;CodCor';
  qMovimento.First;
  while not qMovimento.Eof do
  begin
    ProgressBar1.Position := ProgressBar1.Position + 1;
    if not qMovimentolkInativo.AsBoolean then
    begin
      if StrToFloat(FormatFloat('0.000000',qMovimentoQtd.AsFloat)) > 0 then
      begin
        if mEstoque.FindKey([qMovimentoCodMaterial.AsInteger,qMovimentoCodCor.AsInteger]) then
          mEstoque.Edit
        else
        begin
          mEstoque.Insert;
          mEstoqueCodMaterial.AsInteger := qMovimentoCodMaterial.AsInteger;
          mEstoqueCodCor.AsInteger      := qMovimentoCodCor.AsInteger;
          mEstoqueNomeMaterial.AsString := qMovimentolkNomeMaterial.AsString;
          mEstoqueNomeCor.AsString      := qMovimentolkNomeCor.AsString;
        end;
        if qMovimentoES.AsString = 'S' then
        begin
          mEstoqueQtdSaida.AsFloat := mEstoqueQtdSaida.AsFloat + StrToFloat(FormatFloat('0.000000',qMovimentoQtd.AsFloat));
          mEstoqueVlrSaida.AsFloat := mEstoqueVlrSaida.AsFloat + StrToFloat(FormatFloat('0.0000',(qMovimentoQtd.AsFloat * (qMovimentoVlrUnitario.AsFloat - qMovimentoVlrDesconto.AsFloat))));
        end
        else
        if qMovimentoES.AsString = 'E' then
        begin
          mEstoqueQtdEntrada.AsFloat := mEstoqueQtdEntrada.AsFloat + StrToFloat(FormatFloat('0.000000',qMovimentoQtd.AsFloat));
          mEstoqueVlrEntrada.AsFloat := mEstoqueVlrEntrada.AsFloat + StrToFloat(FormatFloat('0.0000',(qMovimentoQtd.AsFloat * (qMovimentoVlrUnitario.AsFloat - qMovimentoVlrDesconto.AsFloat))));
        end;
        mEstoqueSaldo.AsFloat := StrToFloat(FormatFloat('0.000000',mEstoqueQtdEntrada.AsFloat - mEstoqueQtdSaida.AsFloat));
        mEstoque.Post;
      end;
    end;
    qMovimento.Next;
  end;
  mEstoque.IndexFieldNames := 'NomeMaterial;NomeCor';
  mEstoque.First;
end;

procedure TfConsMaterialPeriodo.Monta_SQL;
begin
  qMovimento.Close;
  qMovimento.ParamByName('DtInicial').AsDate := DateEdit1.Date;
  qMovimento.ParamByName('DtFinal').AsDate   := DateEdit2.Date;
  qMovimento.Open;
end;

procedure TfConsMaterialPeriodo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qMovimento.Close;
  Action := Cafree;
end;

procedure TfConsMaterialPeriodo.BitBtn1Click(Sender: TObject);
begin
  if (DateEdit1.Date <= 1) or (DateEdit2.Date <= 1) then
    begin
      ShowMessage('É obrigatório informar a data inicial e final!');
      exit;
    end;
  SMDBGrid1.DataSource := nil;
  Monta_SQL;
  Le_SQL;
  SMDBGrid1.DataSource := dsmEstoque;
end;

procedure TfConsMaterialPeriodo.mEstoqueNewRecord(DataSet: TDataSet);
begin
  mEstoqueQtdEntrada.AsFloat := 0;
  mEstoqueQtdSaida.AsFloat   := 0;
  mEstoqueVlrSaida.AsFloat   := 0;
  mEstoqueVlrEntrada.AsFloat := 0;
  mEstoqueSaldo.AsFloat      := 0;
end;

procedure TfConsMaterialPeriodo.FormShow(Sender: TObject);
begin
  DM1.tMaterial.Open;
  DM1.tMaterial2.Open;
  DM1.tCor2.Open;
end;

procedure TfConsMaterialPeriodo.BitBtn2Click(Sender: TObject);
begin
  SMDBGrid1.DisableScroll;
  fRelMaterialPeriodo := TfRelMaterialPeriodo.Create(Self);
  fRelMaterialPeriodo.RLReport1.Preview;
  fRelMaterialPeriodo.RLReport1.Free;
  SMDBGrid1.EnableScroll;
end;

procedure TfConsMaterialPeriodo.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

end.

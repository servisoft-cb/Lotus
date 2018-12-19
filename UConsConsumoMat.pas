unit UConsConsumoMat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, RxLookup, CurrEdit, DB, DBTables,
  Grids, DBGrids, SMDBGrid, Buttons, DBClient, ComCtrls;

type
  TfConsConsumoMat = class(TForm)
    Label1: TLabel;
    DateEdit1: TDateEdit;
    Label2: TLabel;
    DateEdit2: TDateEdit;
    SMDBGrid1: TSMDBGrid;
    qSaldoAnt: TQuery;
    BitBtn1: TBitBtn;
    qMovimento: TQuery;
    qSaldoAntCodMaterial: TIntegerField;
    qSaldoAntCodCor: TIntegerField;
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
    mEstoqueQtdAnt: TFloatField;
    mEstoqueQtdEntradaNota: TFloatField;
    mEstoqueQtdEntradaOutros: TFloatField;
    mEstoqueQtdSaida: TFloatField;
    mEstoqueSaldo: TFloatField;
    qSaldoAntlkNomeMaterial: TStringField;
    qSaldoAntlkNomeCor: TStringField;
    qMovimentolkNomeMaterial: TStringField;
    qMovimentolkNomeCor: TStringField;
    dsmEstoque: TDataSource;
    ProgressBar1: TProgressBar;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    qSaldoAntlkInativo: TBooleanField;
    qMovimentolkInativo: TBooleanField;
    mEstoqueVlrAnt: TFloatField;
    mEstoqueVlrEntradaNotas: TFloatField;
    mEstoqueVlrSaida: TFloatField;
    mEstoqueVlrSaldo: TFloatField;
    qSaldoAntVlrUnitario: TFloatField;
    qSaldoAntPercIcms: TFloatField;
    qSaldoAntVlrDesconto: TFloatField;
    qSaldoAntQtd: TFloatField;
    qSaldoAntES: TStringField;
    mEstoquePrecoCustoMedio: TFloatField;
    mEstoqueQtdEntradaAnt: TFloatField;
    mEstoqueQtdSaidaAnt: TFloatField;
    mEstoqueVlrAntEntrada: TFloatField;
    mEstoqueVlrEntradaTotal: TFloatField;
    qMovimentoVlrDesconto: TFloatField;
    qMovimentoPercIcms: TFloatField;
    mEstoqueVlrAntMedio: TFloatField;
    mEstoqueVlrMovimentoMedio: TFloatField;
    ProgressBar2: TProgressBar;
    CheckBox1: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure mEstoqueNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    procedure Monta_SQLs;
    procedure Le_SQLs;
    procedure Le_mEstoque;
  public
    { Public declarations }
  end;

var
  fConsConsumoMat: TfConsConsumoMat;

implementation

uses UDM1, UDM2, URelConsumoMat;

{$R *.dfm}

procedure TfConsConsumoMat.Le_mEstoque;
begin
  ProgressBar2.Max      := mEstoque.RecordCount;
  ProgressBar2.Position := 0;
  mEstoque.First;
  while not mEstoque.Eof do
  begin
    ProgressBar2.Position := ProgressBar2.Position + 1;
    if StrToFloat(FormatFloat('0.000000',mEstoqueSaldo.AsFloat)) <= 0 then
      mEstoque.Delete
    else
    begin
      if (CheckBox1.Checked) and (StrToFloat(FormatFloat('0.000000',mEstoqueQtdEntradaNota.AsFloat)) = 0) and
         (StrToFloat(FormatFloat('0.000000',mEstoqueQtdEntradaOutros.AsFloat)) = 0) and
         (StrToFloat(FormatFloat('0.000000',mEstoqueQtdSaida.AsFloat)) = 0) then
        mEstoque.Delete
      else
      begin
        mEstoque.Edit;
        mEstoqueVlrAntMedio.AsFloat     := StrToFloat(FormatFloat('0.00',mEstoqueQtdAnt.AsFloat * mEstoquePrecoCustoMedio.AsFloat));
        mEstoqueVlrSaldo.AsFloat        := StrToFloat(FormatFloat('0.00',mEstoqueSaldo.AsFloat * mEstoquePrecoCustoMedio.AsFloat));
        mEstoqueVlrEntradaNotas.AsFloat := StrToFloat(FormatFloat('0.00',(mEstoqueQtdEntradaNota.AsFloat + mEstoqueQtdEntradaOutros.AsFloat) * mEstoquePrecoCustoMedio.AsFloat));
        mEstoqueVlrSaida.AsFloat        := StrToFloat(FormatFloat('0.00',mEstoqueQtdSaida.AsFloat * mEstoquePrecoCustoMedio.AsFloat));
        mEstoque.Post;
        mEstoque.Next;
      end;
    end;
  end;
end;

procedure TfConsConsumoMat.Le_SQLs;
var
  vPrecoMedio, vVlrAux : Real;
  vVlrEntrada : Real;
begin
  ProgressBar1.Max      := qSaldoAnt.RecordCount + qMovimento.RecordCount;
  ProgressBar1.Position := 0;

  mEstoque.EmptyDataSet;
  mEstoque.IndexFieldNames := 'CodMaterial;CodCor';
  //Lê saldo anterior
  qSaldoAnt.First;
  while not qSaldoAnt.Eof do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;
      //if not(qSaldoAntlkInativo.AsBoolean) and (StrToFloat(FormatFloat('0.000000',qSaldoAntQtd2.AsFloat)) > 0) then
      if not qSaldoAntlkInativo.AsBoolean then
        begin
          if mEstoque.FindKey([qSaldoAntCodMaterial.AsInteger,qSaldoAntCodCor.AsInteger]) then
            mEstoque.Edit
          else
            begin
              mEstoque.Insert;
              mEstoqueCodMaterial.AsInteger := qSaldoAntCodMaterial.AsInteger;
              mEstoqueCodCor.AsInteger      := qSaldoAntCodCor.AsInteger;
              mEstoqueNomeMaterial.AsString := qSaldoAntlkNomeMaterial.AsString;
              mEstoqueNomeCor.AsString      := qSaldoAntlkNomeCor.AsString;
            end;
          if qSaldoAntES.AsString = 'E' then
            begin
              mEstoqueQtdEntradaAnt.AsFloat := mEstoqueQtdEntradaAnt.AsFloat + qSaldoAntQtd.AsFloat;
              //mEstoqueVlrAntEntrada.AsFloat := StrToFloat(FormatFloat('0.00',mEstoqueVlrAntEntrada.AsFloat + (qSaldoAntVlrUnitario.AsFloat - qSaldoAntVlrDesconto.AsFloat)));
              vVlrEntrada                   := StrToFloat(FormatFloat('0.00',(qSaldoAntVlrUnitario.AsFloat - qSaldoAntVlrDesconto.AsFloat)));
              vVlrAux := 0;
              //if qSaldoAntPercIcms.AsFloat > 0 then
              //  vVlrAux := StrToFloat(FormatFloat('0.00',qSaldoAntVlrUnitario.AsFloat * qSaldoAntPercIcms.AsFloat / 100));
              vVlrEntrada                   := StrToFloat(FormatFloat('0.00',(vVlrEntrada + vVlrAux) * qSaldoAntQtd.AsFloat));
              mEstoqueVlrAntEntrada.AsFloat   := mEstoqueVlrAntEntrada.AsFloat + vVlrEntrada;
              mEstoquePrecoCustoMedio.AsFloat := StrToFloat(FormatFloat('0.00',mEstoqueVlrAntEntrada.AsFloat / mEstoqueQtdEntradaAnt.AsFloat));
            end
          else
            mEstoqueQtdSaidaAnt.AsFloat := mEstoqueQtdSaidaAnt.AsFloat + qSaldoAntQtd.AsFloat;

          mEstoqueQtdAnt.AsFloat   := mEstoqueQtdEntradaAnt.AsFloat - mEstoqueQtdSaidaAnt.AsFloat;
          mEstoqueSaldo.AsFloat    := mEstoqueQtdEntradaAnt.AsFloat - mEstoqueQtdSaidaAnt.AsFloat;
          mEstoqueVlrAnt.AsFloat   := StrToFloat(FormatFloat('0.00',mEstoquePrecoCustoMedio.AsFloat * mEstoqueQtdAnt.AsFloat));

          mEstoque.Post;
        end;
      qSaldoAnt.Next;
    end;

  //Lê movimento do período
  qMovimento.First;
  while not qMovimento.Eof do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;
      if not qMovimentolkInativo.AsBoolean then
        begin
          //if (not(CheckBox1.Checked) and (StrToFloat(FormatFloat('0.000000',qMovimentoQtd.AsFloat)) > 0)) or
          //  (CheckBox1.Checked) then
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
                mEstoqueQtdSaida.AsFloat := mEstoqueQtdSaida.AsFloat + StrToFloat(FormatFloat('0.000000',qMovimentoQtd.AsFloat))
              else
              if (qMovimentoES.AsString = 'E') and (qMovimentoTipoMov.AsString = 'NTE') then
                mEstoqueQtdEntradaNota.AsFloat := mEstoqueQtdEntradaNota.AsFloat + StrToFloat(FormatFloat('0.000000',qMovimentoQtd.AsFloat))
              else
              if qMovimentoES.AsString = 'E' then
                mEstoqueQtdEntradaOutros.AsFloat := mEstoqueQtdEntradaOutros.AsFloat + StrToFloat(FormatFloat('0.000000',qMovimentoQtd.AsFloat));
              if qMovimentoES.AsString = 'E' then
                begin
                  vVlrEntrada := StrToFloat(FormatFloat('0.00',(qMovimentoVlrUnitario.AsFloat - qMovimentoVlrDesconto.AsFloat)));
                  vVlrAux := 0;
                  //if qMovimentoPercIcms.AsFloat > 0 then
                  //  vVlrAux := StrToFloat(FormatFloat('0.00',qMovimentoVlrUnitario.AsFloat * qMovimentoPercIcms.AsFloat / 100));
                  vVlrEntrada                     := StrToFloat(FormatFloat('0.00',(vVlrEntrada + vVlrAux) * qMovimentoQtd.AsFloat));
                  mEstoqueVlrEntradaNotas.AsFloat := mEstoqueVlrEntradaNotas.AsFloat + vVlrEntrada;
                  vVlrAux                         := mEstoqueVlrEntradaNotas.AsFloat + mEstoqueVlrAntEntrada.AsFloat;
                  mEstoquePrecoCustoMedio.AsFloat := StrToFloat(FormatFloat('0.00',vVlrAux / (mEstoqueQtdEntradaAnt.AsFloat + mEstoqueQtdEntradaNota.AsFloat + mEstoqueQtdEntradaOutros.AsFloat)));
                end;
              mEstoqueSaldo.AsFloat := StrToFloat(FormatFloat('0.000000',mEstoqueQtdAnt.AsFloat + mEstoqueQtdEntradaNota.AsFloat +
                                       mEstoqueQtdEntradaOutros.AsFloat - mEstoqueQtdSaida.AsFloat));
              mEstoque.Post;
            end;
        end;
      qMovimento.Next;
    end;

  mEstoque.IndexFieldNames := 'NomeMaterial;NomeCor';
  mEstoque.First;
end;

procedure TfConsConsumoMat.Monta_SQLs;
begin
  qSaldoAnt.Close;
  qSaldoAnt.ParamByName('DtMov').AsDate := DateEdit1.Date;
  qSaldoAnt.Open;

  qMovimento.Close;
  qMovimento.ParamByName('DtInicial').AsDate := DateEdit1.Date;
  qMovimento.ParamByName('DtFinal').AsDate   := DateEdit2.Date;
  qMovimento.Open;
end;

procedure TfConsConsumoMat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qSaldoAnt.Close;
  qMovimento.Close;
  Action := Cafree;
end;

procedure TfConsConsumoMat.BitBtn1Click(Sender: TObject);
begin
  if (DateEdit1.Date <= 1) or (DateEdit2.Date <= 1) then
    begin
      ShowMessage('É obrigatório informar a data inicial e final!');
      exit;
    end;
  SMDBGrid1.DataSource := nil;
  Monta_SQLs;
  Le_SQLs;
  Le_mEstoque;
  SMDBGrid1.DataSource := dsmEstoque;
end;

procedure TfConsConsumoMat.mEstoqueNewRecord(DataSet: TDataSet);
begin
  mEstoqueQtdAnt.AsFloat           := 0;
  mEstoqueQtdEntradaNota.AsFloat   := 0;
  mEstoqueQtdEntradaOutros.AsFloat := 0;
  mEstoqueQtdSaida.AsFloat         := 0;
  mEstoqueSaldo.AsFloat            := 0;
end;

procedure TfConsConsumoMat.FormShow(Sender: TObject);
begin
  DM1.tMaterial.Open;
  DM1.tMaterial2.Open;
  DM1.tCor2.Open;
end;

procedure TfConsConsumoMat.BitBtn2Click(Sender: TObject);
begin
  SMDBGrid1.DisableScroll;
  fRelConsumoMat := TfRelConsumoMat.Create(Self);
  fRelConsumoMat.RLReport1.Preview;
  fRelConsumoMat.RLReport1.Free;
  SMDBGrid1.EnableScroll;
end;

procedure TfConsConsumoMat.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

end.

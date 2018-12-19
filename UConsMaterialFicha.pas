unit UConsMaterialFicha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit, RxLookup, Buttons, DBFilter,
  DB, DBTables, Grids, DBGrids, SMDBGrid, ExtCtrls;

type
  TfConsMaterialFicha = class(TForm)
    RxDBFilter1: TRxDBFilter;
    qCor: TQuery;
    dsqCor: TDataSource;
    SMDBGrid1: TSMDBGrid;
    dsqConsulta: TDataSource;
    qCorNome: TStringField;
    qCorCodCor: TIntegerField;
    qConsulta: TQuery;
    qConsultaCodProduto: TIntegerField;
    qConsultaReferencia: TStringField;
    qConsultaCodMaterial: TIntegerField;
    qConsultaNomeProduto: TStringField;
    qConsultaCodCorProd: TIntegerField;
    qConsultaNomeCorProduto: TStringField;
    qConsultaQtd: TFloatField;
    qConsultaCodCorMaterial: TIntegerField;
    qConsultalkNomeCorMat: TStringField;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    CurrencyEdit1: TCurrencyEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RxDBLookupCombo2: TRxDBLookupCombo;
    CheckBox1: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    vSQL : String;
    procedure Monta_SQL;
  public
    { Public declarations }
  end;

var
  fConsMaterialFicha: TfConsMaterialFicha;

implementation

uses UDM1, UProduto, UDM2;

{$R *.dfm}

procedure TfConsMaterialFicha.Monta_SQL;
begin
  qConsulta.Close;
  qConsulta.SQL.Clear;
  qConsulta.SQL.Text := vSQL;
  qConsulta.SQL.Add(' WHERE  (Dbprodutomat.CodMaterial = :CodMaterial) ');
  if RxDBLookupCombo2.Text <> '' then
    begin
      qConsulta.SQL.Add(' AND (Dbprodutomat.CodCor = :CodCor) ');
      qConsulta.ParamByName('CodCor').AsInteger := RxDBLookupCombo2.KeyValue;
    end;
  qConsulta.ParamByName('CodMaterial').AsInteger := RxDBLookupCombo1.KeyValue;
  qConsulta.SQL.Add(' ORDER BY Dbproduto.Referencia, NomeCorProduto');
  qConsulta.Open;
end;

procedure TfConsMaterialFicha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qCor.Close;
  qConsulta.Close;
  if Screen.FormCount < 3 then
    begin
      DM1.tMaterialCor.Close;
      DM1.tMaterial.Close;
      DM1.tCor.Close;
    end;
  RxDBFilter1.Active := False;
  Action := Cafree;
end;

procedure TfConsMaterialFicha.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsMaterialFicha.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tMaterial.IndexFieldNames := 'Nome';
end;

procedure TfConsMaterialFicha.FormShow(Sender: TObject);
begin
  Top    := 0;
  Left   := 0;
  Width  := Screen.Width;
  Height := Screen.Height - 35;

  vSQL := qConsulta.SQL.Text;
  DM1.tMaterial.Open;
  DM1.tMaterialCor.Open;
  DM1.tCor.Open;
  RxDBFilter1.Active := True;
end;

procedure TfConsMaterialFicha.CurrencyEdit1Exit(Sender: TObject);
begin
  if CurrencyEdit1.AsInteger > 0 then
    RxDBLookupCombo1.KeyValue := CurrencyEdit1.AsInteger;
end;

procedure TfConsMaterialFicha.RxDBLookupCombo1Exit(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
    CurrencyEdit1.AsInteger := RxDBLookupCombo1.KeyValue;
end;

procedure TfConsMaterialFicha.RxDBLookupCombo2Enter(Sender: TObject);
begin
  qCor.Close;
  if CurrencyEdit1.AsInteger > 0 then
    begin
      qCor.Params[0].AsInteger := CurrencyEdit1.AsInteger;
      qCor.Open;
    end;
end;

procedure TfConsMaterialFicha.BitBtn1Click(Sender: TObject);
begin
  if CurrencyEdit1.AsInteger > 0 then
    Monta_SQL
  else
    ShowMessage('Não foi informado o material!');
  CurrencyEdit1.SetFocus;
end;

procedure TfConsMaterialFicha.SMDBGrid1DblClick(Sender: TObject);
begin
  RxDBFilter1.Active := False;
  fProduto := TfProduto.Create(Self);
  if (qConsulta.Active) and (qConsultaCodProduto.AsInteger > 0) then
    DM1.tProduto.Locate('Codigo',qConsultaCodProduto.AsInteger,[loCaseInsensitive]);
  fProduto.ShowModal;
  RxDBFilter1.Active := True;
end;

procedure TfConsMaterialFicha.CheckBox1Click(Sender: TObject);
begin
  RxDBFilter1.Active := not(CheckBox1.Checked);
end;

end.

unit UBuscaOC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, DBCtrls, StdCtrls, Buttons, RXLookup, Grids,
  DBGrids, RXDBCtrl, Db, DbTables, Mask, ToolEdit, CurrEdit,
  DBFilter, ALed, DBVGrids;

type
  TfBuscaOC = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    Label3: TLabel;
    tOrdemCompraItemGrade: TTable;
    dsOrdemCompraItemGrade: TDataSource;
    tOrdemCompraItemGradeCodigo: TIntegerField;
    tOrdemCompraItemGradeItem: TIntegerField;
    tOrdemCompraItemGradeCodGrade: TIntegerField;
    tOrdemCompraItemGradePosicao: TIntegerField;
    tOrdemCompraItemGradeQtd: TFloatField;
    tOrdemCompraItemGradeVlrUnitario: TFloatField;
    tOrdemCompraItemGradeVlrTotal: TFloatField;
    tGradeItem: TTable;
    tGradeItemCodGrade: TIntegerField;
    tGradeItemPosicao: TIntegerField;
    tGradeItemTamanho: TStringField;
    tOrdemCompraItemGradelkTamanho: TStringField;
    VDBGrid1: TVDBGrid;
    tOrdemCompraItemGradeQtdEntregue: TFloatField;
    tOrdemCompraItemGradeQtdRestante: TFloatField;
    tAuxCopiaOC: TTable;
    dsAuxCopiaOC: TDataSource;
    tAuxCopiaOCNroOrdem: TIntegerField;
    tAuxCopiaOCItem: TIntegerField;
    tAuxCopiaOCCodGrade: TIntegerField;
    tAuxCopiaOCPosicao: TIntegerField;
    tAuxCopiaOClkTamanho: TStringField;
    tAuxCopiaOCQtd: TFloatField;
    tAuxCopiaOCQtdRestante: TFloatField;
    tOrdemCompraItemGradeFilial: TIntegerField;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    RxDBFilter1: TRxDBFilter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure tAuxCopiaOCAfterInsert(DataSet: TDataSet);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure CurrencyEdit2Exit(Sender: TObject);
  private
    { Private declarations }
    procedure Monta_Grade;
    procedure Apaga_AuxCopiaOC;
  public
    { Public declarations }
  end;

var
  fBuscaOC: TfBuscaOC;
  vSelecionado : Boolean;
  vPedido : integer;

implementation

uses UDM1, UEmissaoNotaFiscal, UNotaEntrada, UAgendaTelef;

{$R *.DFM}

procedure TfBuscaOC.Monta_Grade;
begin
  Apaga_AuxCopiaOC;
  tOrdemCompraItemGrade.First;
  while not tOrdemCompraItemGrade.Eof do
    begin
      if tOrdemCompraItemGradeQtdRestante.AsFloat > 0 then
        begin
          tAuxCopiaOC.Insert;
          tAuxCopiaOCNroOrdem.AsInteger  := CurrencyEdit2.AsInteger;
          tAuxCopiaOCItem.AsInteger      := CurrencyEdit1.AsInteger;
          tAuxCopiaOCCodGrade.AsInteger  := tOrdemCompraItemGradeCodGrade.AsInteger;
          tAuxCopiaOCPosicao.AsInteger   := tOrdemCompraItemGradePosicao.AsInteger;
          tAuxCopiaOCQtd.AsFloat         := tOrdemCompraItemGradeQtdRestante.AsFloat;
          tAuxCopiaOCQtdRestante.AsFloat := tOrdemCompraItemGradeQtdRestante.AsFloat;
          tAuxCopiaOC.Post;
        end;
      tOrdemCompraItemGrade.Next;
    end;
end;

procedure TfBuscaOC.Apaga_AuxCopiaOC;
begin
  tAuxCopiaOC.First;
  while not tAuxCopiaOC.Eof do
    tAuxCopiaOC.Delete;
end;

procedure TfBuscaOC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  RxDBFilter1.Active := False;
  fNotaEntrada.CurrencyEdit11.AsInteger := CurrencyEdit2.AsInteger;
  fNotaEntrada.CurrencyEdit12.AsInteger := CurrencyEdit1.AsInteger;
  DM1.tFornecedores.IndexFieldNames := 'CodForn';
  DM1.tOrdemCompra.IndexFieldNames  := 'Filial;Codigo';
  Action := CaFree;
end;

procedure TfBuscaOC.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfBuscaOC.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tFornecedores.IndexFieldNames := 'NomeForn';
  DM1.tOrdemCompra.IndexFieldNames  := 'CodFornecedor';
end;

procedure TfBuscaOC.RxDBLookupCombo1Change(Sender: TObject);
begin
  DM1.tOrdemCompra.FindNearest([DM1.tFornecedoresCodForn.AsInteger]);
end;

procedure TfBuscaOC.RxDBGrid1DblClick(Sender: TObject);
begin
  CurrencyEdit2.AsInteger := DM1.tOrdemCompraCodigo.AsInteger;
  CurrencyEdit1.AsInteger := DM1.tOrdemCompraItemItem.AsInteger;
  if CurrencyEdit2.AsInteger > 0 then
    Monta_Grade
  else
    Apaga_AuxCopiaOc;
end;

procedure TfBuscaOC.FormShow(Sender: TObject);
begin
  RxDBFilter1.Active := True;
  DM1.tOrdemCompra.IndexFieldNames  := 'CodFornecedor';
  RxDBLookupCombo1.KeyValue         := fNotaEntrada.RxDBLookupCombo1.KeyValue;
  vSelecionado       := False;
  DM1.tOrdemCompra.Refresh;
  Apaga_AuxCopiaOC;
end;

procedure TfBuscaOC.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if vSelecionado then
  begin
    ShowMessage('Esta janela não pode ser fechada se há um item selecionado!');
    CanClose := False;
  end
  else
    CanClose := True;
end;

procedure TfBuscaOC.RxDBGrid2DblClick(Sender: TObject);
begin
  CurrencyEdit2.AsInteger := DM1.tOrdemCompraCodigo.AsInteger;
end;

procedure TfBuscaOC.tAuxCopiaOCAfterInsert(DataSet: TDataSet);
begin
  if tAuxCopiaOC.RecordCount > tOrdemCompraItemGrade.RecordCount then
    begin
      tAuxCopiaOC.Delete;
      tAuxCopiaOc.RecNo := tOrdemCompraItemGrade.RecordCount;
    end;
end;

procedure TfBuscaOC.RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if Dm1.tOrdemCompraEntregue.AsBoolean then
    Background := clRed;
end;

procedure TfBuscaOC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
  begin
    fAgendaTelef := TfAgendaTelef.Create(Self);
    fAgendaTelef.ShowModal;
  end;
end;

procedure TfBuscaOC.CurrencyEdit1Exit(Sender: TObject);
begin
  if CurrencyEdit1.AsInteger > 0 then
  begin
    DM1.tOrdemCompraItem.SetKey;
    DM1.tOrdemCompraItemFilial.AsInteger := 1;
    DM1.tOrdemCompraItemCodigo.AsInteger := CurrencyEdit2.AsInteger;
    DM1.tOrdemCompraItemItem.AsInteger   := CurrencyEdit1.AsInteger;
    if DM1.tOrdemCompraItem.GotoKey then
      Monta_Grade
    else
    begin
      ShowMessage('Item não cadastrado!');
      CurrencyEdit1.SetFocus;
      Apaga_AuxCopiaOC;
    end;
  end;
end;

procedure TfBuscaOC.CurrencyEdit2Exit(Sender: TObject);
begin
  if CurrencyEdit2.AsInteger > 0 then
  begin
    DM1.tOrdemCompra.IndexFieldNames := 'Filial;Codigo';
    DM1.tOrdemCompra.FindNearest([1,CurrencyEdit2.AsInteger]);
  end;
end;

end.

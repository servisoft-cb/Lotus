unit UProdutoGrade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, ToolEdit, CurrEdit, Buttons, Db,
  DBTables, MemTable, Grids, DBVGrids, DBGrids;

type
  TfProdutoGrade = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    BitBtn6: TBitBtn;
    VDBGrid1: TVDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VDBGrid1Enter(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure MontaGrade;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fProdutoGrade: TfProdutoGrade;

implementation

uses UProduto, UDM1, UAgendaTelef, UProdutoMat, UProdutoComb;

{$R *.DFM}

procedure TfProdutoGrade.MontaGrade;
begin
  if fProdutoComb.BitBtn15.Tag = 0 then
    begin
      fProdutoComb.tAuxProdutoGrade.First;
      while not fProdutoComb.tAuxProdutoGrade.Eof do
        fProdutoComb.tAuxProdutoGrade.delete;
      DM1.tGrade.IndexFieldNames := 'codigo';
      DM1.tGrade.SetKey;
      DM1.tGradeCodigo.AsInteger :=  fProduto.RxDBLookupCombo10.KeyValue;
      if DM1.tGrade.GotoKey then
        begin
          DM1.tGradeItem.First;
          while not DM1.tGradeItem.Eof do
            begin
              fProdutoComb.tAuxProdutoGrade.Insert;
              fProdutoComb.tAuxProdutoGradeCodGrade.AsInteger  := DM1.tGradeItemCodGrade.AsInteger;
              fProdutoComb.tAuxProdutoGradePosicao.AsInteger   := DM1.tGradeItemPosicao.AsInteger;
              fProdutoComb.tAuxProdutoGradeTamanho.AsString    := DM1.tGradeItemTamanho.AsString;
              fProdutoComb.tAuxProdutoGradeQtd.AsFloat         := 0;
              fProdutoComb.tAuxProdutoGradeVlrUnitario.AsFloat := 0;
              fProdutoComb.tAuxProdutoGradeVlrTotal.AsFloat    := 0;
              fProdutoComb.tAuxProdutoGrade.Post;
              DM1.tGradeItem.Next;
            end;
        end;
    end;
  fProdutoComb.tAuxProdutoGrade.First;
end;

procedure TfProdutoGrade.FormShow(Sender: TObject);
begin
  DM1.tMaterial.IndexFieldNames := 'Codigo';
  DM1.tMaterial.FindKey([fProdutoMat.RxDBLookupCombo1.KeyValue]);
  if DM1.tMaterialPrecoGrade.AsBoolean = false then
    vDBGrid1.Columns[2].Destroy;
  MontaGrade;
end;

procedure TfProdutoGrade.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
 vQtd, vVlrTotal : Currency;
begin
  vQtd := 0;
  vVlrTotal := 0;
  fProdutoComb.tAuxProdutoGrade.First;
  while not fProdutoComb.tAuxProdutoGrade.Eof do
    begin
      vQtd := vQtd + fProdutoComb.tAuxProdutoGradeQtd.AsCurrency;
      vVlrTotal := vVlrTotal + (fProdutoComb.tAuxProdutoGradeQtd.AsCurrency * fProdutoComb.tAuxProdutoGradeVlrUnitario.AsCurrency);
      fProdutoComb.tAuxProdutoGrade.Next;
    end;
  fProdutoMat.CurrencyEdit1.Value := vQtd;
  DM1.tMaterialGradeNum.Filtered  := False;
  Action := Cafree;
end;

procedure TfProdutoGrade.VDBGrid1Enter(Sender: TObject);
begin
 if vDBGrid1.SelectedIndex = 0 then
   vDBGrid1.SelectedIndex := 2;
end;

procedure TfProdutoGrade.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfProdutoGrade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.

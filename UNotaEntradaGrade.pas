unit UNotaEntradaGrade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, ToolEdit, CurrEdit, Buttons, Db,
  DBTables, MemTable, Grids, DBVGrids, DBGrids, RxLookup;

type
  TfNotaEntradaGrade = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    VDBGrid1: TVDBGrid;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label2: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    Edit2: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VDBGrid1Enter(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure RxDBLookupCombo1DropDown(Sender: TObject);
    procedure RxDBLookupCombo1CloseUp(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure MontaGrade;
    function Verifica_OrdemCompra: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fNotaEntradaGrade: TfNotaEntradaGrade;
  flag : String[1];
  Tam: String;

implementation

uses UNotaEntrada, UDM1, UAgendaTelef;

{$R *.DFM}

function TfNotaEntradaGrade.Verifica_OrdemCompra: Boolean;
begin
  Result := False;
  Dm1.tOrdemCompra.IndexFieldNames     := 'Filial;Codigo';
  Dm1.tOrdemCompra.FindKey([1,fNotaEntrada.CurrencyEdit11.Value]);
  Dm1.tOrdemCompraItem.IndexFieldNames := 'Filial;Codigo;Item';
  Dm1.tOrdemCompraItem.FindKey([DM1.tOrdemCompraFilial.AsInteger,fNotaEntrada.CurrencyEdit11.Value,fNotaEntrada.CurrencyEdit12.Value]);
  fNotaEntrada.tAuxNEntradaGrade.First;
  while not fNotaEntrada.tAuxNEntradaGrade.EOF do
    begin
      Dm1.tOrdemCompraItemGrade.IndexFieldNames := 'Filial;Codigo;Item;CodGrade;Posicao';
      Dm1.tOrdemCompraItemGrade.SetKey;
      Dm1.tOrdemCompraItemGradeFilial.AsInteger   := 1;
      Dm1.tOrdemCompraItemGradeCodigo.AsInteger   := fNotaEntrada.CurrencyEdit11.AsInteger;
      Dm1.tOrdemCompraItemGradeItem.AsInteger     := fNotaEntrada.CurrencyEdit12.AsInteger;
      Dm1.tOrdemCompraItemGradeCodGrade.AsInteger := fNotaEntrada.tAuxNEntradaGradeCodGrade.AsInteger;
      Dm1.tOrdemCompraItemGradePosicao.AsInteger  := fNotaEntrada.tAuxNEntradaGradePosicao.AsInteger;
      if Dm1.tOrdemCompraItemGrade.GotoKey then
        begin
          if Dm1.tOrdemCompraItemGradeQtdRestante.AsFloat < fNotaEntrada.tAuxNEntradaGradeQtd.AsFloat then
            begin
              Tam := Dm1.tOrdemCompraItemGradelkTamanho.AsString;
              Result := True;
              Break;
            end
          else
            fNotaEntrada.tAuxNEntradaGrade.Next;
        end
      else
        begin
          Tam := Dm1.tOrdemCompraItemGradelkTamanho.AsString;
          Result := True;
          Break;
        end;
    end;
end;

procedure TfNotaEntradaGrade.MontaGrade;
begin
  Edit1.Text := DM1.tGradeCodLetra.AsString;
  Edit2.Text := DM1.tGradeLargura.AsString;
  if (vEdit = 'N') and (fNotaEntrada.CurrencyEdit12.AsInteger < 1) then
    begin
      fNotaEntrada.tNEntradaItensIns.Refresh;
      fNotaEntrada.tNEntradaItensIns.Last;
      fNotaEntrada.tAuxNEntradaGrade.First;
      while not fNotaEntrada.tAuxNEntradaGrade.Eof do
        fNotaEntrada.tAuxNEntradaGrade.delete;
      DM1.tGradeItem.First;
      while not DM1.tGradeItem.Eof do
        begin
          fNotaEntrada.tAuxNEntradaGrade.Insert;
          fNotaEntrada.tAuxNEntradaGradeCodGrade.AsInteger    := DM1.tGradeItemCodGrade.AsInteger;
          fNotaEntrada.tAuxNEntradaGradePosicao.AsInteger     := DM1.tGradeItemPosicao.AsInteger;
          fNotaEntrada.tAuxNEntradaGradeQtd.AsString          := '';
          fNotaEntrada.tAuxNEntradaGradeVlrUnitario.AsString  := '';
          fNotaEntrada.tAuxNEntradaGradeVlrTotal.AsString     := '';
          fNotaEntrada.tAuxNEntradaGrade.Post;
          DM1.tGradeItem.Next;
        end;
    end;
  fNotaEntrada.tAuxNEntradaGrade.First;
end;

procedure TfNotaEntradaGrade.FormShow(Sender: TObject);
begin
  if DM1.tMaterialPrecoGrade.AsBoolean = false then
    vDBGrid1.Columns[2].Destroy;
  if fNotaEntrada.CurrencyEdit12.AsInteger > 0 then
    RxDBLookupCombo1.KeyValue := DM1.tGradeCodigo.AsInteger
  else
    begin
      RxDBLookupCombo1.KeyValue := DM1.tMaterialCodGrade.AsInteger;
      DM1.tGrade.IndexFieldNames := 'Codigo';
      DM1.tGrade.FindKey([DM1.tMaterialCodGrade.AsInteger]);
      RxDBLookupCombo1.KeyValue := DM1.tGradeCodigo.AsInteger;
    end;
  MontaGrade;
  if (vEdit = 'S') or (fNotaEntrada.CurrencyEdit12.AsInteger > 0) then
    CurrencyEdit1.Value := fNotaEntrada.CurrencyEdit3.Value;
end;

procedure TfNotaEntradaGrade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfNotaEntradaGrade.VDBGrid1Enter(Sender: TObject);
begin
 if CurrencyEdit1.Value = 0 then
   begin
     ShowMessage('É obrigatório informar a quantidade total!');
     CurrencyEdit1.SetFocus;
   end
 else
 if vDBGrid1.SelectedIndex = 0 then
   vDBGrid1.SelectedIndex := 1;
end;

procedure TfNotaEntradaGrade.BitBtn6Click(Sender: TObject);
begin
  flag := '';
  BitBtn5Click(Sender);
  if flag = '' then
    Close;
end;

procedure TfNotaEntradaGrade.BitBtn5Click(Sender: TObject);
var
  vQtd, vVlrTotal : Real;
begin
  vQtd      := 0;
  vVlrTotal := 0;
  fNotaEntrada.tAuxNEntradaGrade.First;
  while not fNotaEntrada.tAuxNEntradaGrade.Eof do
    begin
      vQtd := vQtd + fNotaEntrada.tAuxNEntradaGradeQtd.asFloat;
      vVlrTotal := vVlrTotal + (fNotaEntrada.tAuxNEntradaGradeQtd.AsFloat * fNotaEntrada.tAuxNEntradaGradeVlrUnitario.AsFloat);
      fNotaEntrada.tAuxNEntradaGrade.Next;
    end;
  if vQtd <> CurrencyEdit1.Value then
    begin
      ShowMessage('Quantidade da grade diferente da quantidade total!');
      flag := 'X';
      CurrencyEdit1.SetFocus;
    end
  else
    begin
      if fNotaEntrada.CurrencyEdit12.AsInteger > 0 then
        if Verifica_OrdemCompra then
          begin
            ShowMessage('Quantidade do tamanho ' + Tam +
            ' maior que a' + #13 + 'restante ou não encontrado na ordem de compra!');
            flag := 'X';
            Abort;
          end;
      fNotaEntrada.CurrencyEdit3.Value := vQtd;
      if vVlrTotal > 0 then
        fNotaEntrada.CurrencyEdit8.Value := vVlrTotal;
      Close;
    end;
end;

procedure TfNotaEntradaGrade.RxDBLookupCombo1Exit(Sender: TObject);
begin
  MontaGrade;
end;

procedure TfNotaEntradaGrade.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tGrade.IndexFieldNames := 'Nome';
end;

procedure TfNotaEntradaGrade.RxDBLookupCombo1CloseUp(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
    begin
      Edit1.Text := DM1.tGradeCodLetra.AsString;
      Edit2.Text := DM1.tGradeLargura.AsString;
    end;
  DM1.tGrade.IndexFieldNames := 'Codigo';
end;

procedure TfNotaEntradaGrade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.

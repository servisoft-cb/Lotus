unit UProdutoMat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit, CurrEdit, RxLookup,
  DB, DBTables, DBCtrls, RzDBCmbo;

type
  TfProdutoMat = class(TForm)
    CurrencyEdit2: TCurrencyEdit;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    ComboBox2: TComboBox;
    Panel1: TPanel;
    CurrencyEdit4: TCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    Query1: TQuery;
    Query1Nome: TStringField;
    Query1Codigo: TIntegerField;
    dsQuery1: TDataSource;
    BitBtn1: TBitBtn;
    Label10: TLabel;
    SpeedButton1: TSpeedButton;
    RxDBLookupCombo15: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    RxDBLookupCombo17: TRxDBLookupCombo;
    CurrencyEdit1: TCurrencyEdit;
    qMaterialUM: TQuery;
    qMaterialUMUnidade: TStringField;
    dsqMaterialUM: TDataSource;
    SpeedButton8: TSpeedButton;
    RxDBLookupCombo1_Ant: TRxDBLookupCombo;
    RxDBLookupCombo1: TRxDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CurrencyEdit4Exit(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure RxDBLookupCombo17Enter(Sender: TObject);
    procedure Panel1Exit(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo15Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vItemMat : Integer;

    procedure Monta_Query1;
  end;

var
  fProdutoMat: TfProdutoMat;

implementation

uses UDM1, UProduto, UDM2, USetor,
  UPosicao, Math, UProdutoGrade, UProdutoComb, UMaterial,
  UConsMaterialParaFicha;

{$R *.dfm}

procedure TfProdutoMat.Monta_Query1;
begin
  Query1.Close;
  Query1.SQL.Clear;         
  Query1.SQL.Add('SELECT Nome, dbCor.Codigo');
  Query1.SQL.Add('FROM dbCor, dbMaterialCor');
  Query1.SQL.Add('WHERE dbCor.Codigo = CodCor');
  Query1.SQL.Add('AND CodMaterial = :x0');
  Query1.SQL.Add('ORDER BY Nome');
  Query1.Params[0].AsInteger :=  RxDBLookupCombo1.KeyValue;
  Query1.Open;
end;

procedure TfProdutoMat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Query1.Close;
  Action := Cafree;
end;

procedure TfProdutoMat.CurrencyEdit4Exit(Sender: TObject);
begin
  if CurrencyEdit4.Value > 0 then
  begin
    DM1.tMaterial.IndexFieldNames := 'Codigo';
    if DM1.tMaterial.FindKey([CurrencyEdit4.Value]) then
    begin
      RxDBLookupCombo1.KeyValue := DM1.tMaterialCodigo.AsInteger;
      RxDBLookupCombo1.SetFocus;
    end
    else
    begin
      ShowMessage('Material não cadastrado!');
      CurrencyEdit4.SetFocus;
      CurrencyEdit4.Clear;
    end;
  end;
end;

procedure TfProdutoMat.BitBtn11Click(Sender: TObject);
begin
  Close;
end;

procedure TfProdutoMat.BitBtn10Click(Sender: TObject);
begin
  if (DM1.tMaterialLancaCor.AsBoolean) and (RxDBLookupCombo3.Text = '') and
     (RxDBLookupCombo1.keyValue <> '') then
    begin
      ShowMessage('Este material é obrigado a informar a cor');
      RxDBLookupCombo3.SetFocus;
    end
  else
  if (RxDBLookupCombo1.Text <> '') and (CurrencyEdit1.Value > 0) then
    begin
      //Grava os materiais do produto
      if fProdutoComb.BitBtn15.Tag = 1  then
        DM1.tProdutoMat.Edit
      else
        begin
          DM1.tProdutoMat.Refresh;
          fProdutoComb.tProdutoMatIns.Refresh;
          fProdutoComb.tProdutoMatIns.Last;
          DM1.tProdutoMat.Insert;
          DM1.tProdutoMatCodProduto.AsInteger   := DM1.tProdutoCodigo.AsInteger;
          DM1.tProdutoMatCodCorProd.AsInteger   := DM1.tProdutoCorCodCor.AsInteger;
          if fProdutoComb.BitBtn15.Tag = 1  then
            DM1.tProdutoMatItem.AsInteger       := vItemMat
          else
            DM1.tProdutoMatItem.AsInteger       := fProdutoComb.tProdutoMatInsItem.AsInteger + 1;
        end;
      if RxDBLookupCombo1.Text <> '' then
        DM1.tProdutoMatCodMaterial.AsInteger := RxDBLookupCombo1.KeyValue;
      DM1.tProdutoMatCodGrade.AsInteger     := DM1.tMaterialCodGrade.AsInteger;
      if RxDBLookupCombo15.Text <> '' then
        DM1.tProdutoMatCodPosicao.AsInteger := RxDBLookupCombo15.KeyValue;
      Case ComboBox2.ItemIndex of
        0 : DM1.tProdutoMatImpTalao.AsString := 'S';
        1 : DM1.tProdutoMatImpTalao.AsString := 'N';
      end;
      if RxDBLookupCombo3.Text <> '' then
        DM1.tProdutoMatCodCor.AsInteger := RxDBLookupCombo3.KeyValue
      else
        DM1.tProdutoMatCodCor.AsInteger := 0;
      DM1.tProdutoMatQtd.AsFloat            := CurrencyEdit1.Value;
      DM1.tProdutoMatVlrUnitario.AsCurrency := CurrencyEdit2.Value;
      DM1.tProdutoMatVlrTotal.AsCurrency    := CurrencyEdit2.Value * CurrencyEdit1.Value;
      DM1.tProdutoMatUnidade.AsString       := RxDBLookupCombo17.Value;
      DM1.tProdutoMat.Post;
// Grava a quantidade por tamanho dos materiais
      DM1.tProdutoMatTam.First;
      while not DM1.tProdutoMatTam.Eof do
        DM1.tProdutoMatTam.Delete;
      if DM1.tMaterialCodGrade.AsInteger < 1 then
        begin
          fProdutoComb.tAuxProdutoGrade.First;
          while not fProdutoComb.tAuxProdutoGrade.Eof do
            begin
              fProdutoComb.tProdutoMatTamIns.Refresh;
              fProdutoComb.tProdutoMatTamIns.Last;
              DM1.tProdutoMatTam.Insert;
              DM1.tProdutoMatTamCodProduto.AsInteger   := DM1.tProdutoCodigo.AsInteger;
              DM1.tProdutoMatTamCodCorProd.AsInteger   := DM1.tProdutoMatCodCorProd.AsInteger;
              DM1.tProdutoMatTamItemMat.AsInteger      := DM1.tProdutoMatItem.AsInteger;
              DM1.tProdutoMatTamItem.AsInteger         := fProdutoComb.tProdutoMatTamInsItem.AsInteger + 1;
              DM1.tProdutoMatTamCodGrade.AsInteger     := fProdutoComb.tAuxProdutoGradeCodGrade.AsInteger;
              DM1.tProdutoMatTamPosicao.AsInteger      := fProdutoComb.tAuxProdutoGradePosicao.AsInteger;
              DM1.tProdutoMatTamQtd.AsCurrency         := fProdutoComb.tAuxProdutoGradeQtd.AsCurrency;
              DM1.tProdutoMatTamVlrUnitario.AsCurrency := fProdutoComb.tAuxProdutoGradeVlrUnitario.AsCurrency;
              DM1.tProdutoMatTamVlrTotal.AsCurrency    := fProdutoComb.tAuxProdutoGradeVlrTotal.AsCurrency;
              DM1.tProdutoMatTam.Post;
              fProdutoComb.tAuxProdutoGrade.Next;
            end;
        end;
      fProdutoComb.tAuxProdutoGrade.First;
      while not fProdutoComb.tAuxProdutoGrade.Eof do
        fProdutoComb.tAuxProdutoGrade.Delete;
      BitBtn11Click(Sender);
    end;
end;

procedure TfProdutoMat.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_F2 then
    BitBtn1.Click;
end;

procedure TfProdutoMat.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioPosicao.AsBoolean then
  begin
    if RxDBLookupCombo15.Text <> '' then
      DM1.tPosicao.Locate('Codigo',RxDBLookupCombo15.KeyValue,[loCaseInsensitive]);
    fPosicao := TfPosicao.Create(Self);
    fPosicao.ShowModal;
    DM1.tPosicao.IndexFieldNames := 'Nome';
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfProdutoMat.RxDBLookupCombo17Enter(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
  begin
    qMaterialUM.Active := False;
    qMaterialUM.SQL.Clear;
    qMaterialUM.SQL.Add('SELECT Unidade');
    qMaterialUM.SQL.Add('FROM "dbMaterial.DB" Dbmaterial');
    qMaterialUM.SQL.Add('WHERE Codigo = :Codigo');
    qMaterialUM.ParamByName('Codigo').AsInteger := RxDBLookupCombo1.KeyValue;
    qMaterialUM.SQL.Add('UNION ALL');
    qMaterialUM.SQL.Add('SELECT Unidade');
    qMaterialUM.SQL.Add('FROM "dbMaterialUM.DB" Dbmaterial');
    qMaterialUM.SQL.Add('WHERE CodMaterial = :CodMaterial');
    qMaterialUM.ParamByName('CodMaterial').AsInteger := RxDBLookupCombo1.KeyValue;
    qMaterialUM.SQL.Add('ORDER BY Unidade');
    qMaterialUM.Active := True;
  end;
end;

procedure TfProdutoMat.Panel1Exit(Sender: TObject);
begin
  if (RxDBLookupCombo1.Text <> '') and (RxDBLookupCombo1.KeyValue <> DM1.tMaterialCodigo.AsInteger) then
  begin
    if DM1.tMaterial.IndexFieldNames <> 'Codigo' then
      DM1.tMaterial.IndexFieldNames := 'Codigo';
    DM1.tMaterial.FindKey([RxDBLookupCombo1.KeyValue]);
  end;
  CurrencyEdit1.Enabled := True;
  CurrencyEdit2.Enabled := True;
  if (RxDBLookupCombo1.text <> '') then
  begin
    if DM1.tProdutoConsumo.AsString = '1' then
    begin
      fProdutoGrade := TfProdutoGrade.Create(Self);
      fProdutoGrade.ShowModal;
    end;
  end;
  if fProdutoComb.BitBtn15.Tag = 0 then
    CurrencyEdit2.Value := DM1.tMaterialPrCusto.AsCurrency;

  if RxDBLookupCombo1.Text <> '' then
  begin
    Monta_Query1;
    CurrencyEdit4.Value := RxDBLookupCombo1.KeyValue;
  end
  else
    Query1.Close;
end;

procedure TfProdutoMat.SpeedButton8Click(Sender: TObject);
begin
  if DM1.tUsuarioMaterial.AsBoolean then
  begin
    fProdutoComb.RxDBFilter1.Active := False;
    if RxDBLookupCombo1.Text <> '' then
    begin
      if DM1.tMaterial.IndexFieldNames <> 'Codigo' then
        DM1.tMaterial.IndexFieldNames := 'Codigo';
      DM1.tMaterial.FindKey([RxDBLookupCombo1.KeyValue]);
    end;
    fMaterial := TfMaterial.Create(Self);
    fMaterial.ShowModal;
    fProdutoComb.RxDBFilter1.Active := True;
    DM1.tMaterial.Refresh;
    DM1.tMaterial.IndexFieldNames := 'Codigo';
    fProdutoComb.cdsMaterialFB.Close;
    fProdutoComb.cdsMaterialFB.Open;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfProdutoMat.FormShow(Sender: TObject);
begin
  if Tag = 0  then
    if fProdutoComb.BitBtn15.Tag = 1 then
      Panel1Exit(Sender);
  fProdutoComb.cdsMaterialFB.Next;
  fProdutoComb.cdsMaterialFB.First;
  DM1.tMaterial.IndexFieldNames := 'Codigo';
end;

procedure TfProdutoMat.RxDBLookupCombo15Enter(Sender: TObject);
begin
  DM1.tPosicao.IndexFieldNames := 'Nome';
end;

procedure TfProdutoMat.BitBtn1Click(Sender: TObject);
begin
  fConsMaterialParaFicha := TfConsMaterialParaFicha.Create(Self);
  fConsMaterialParaFicha.Tag := 0;
  fConsMaterialParaFicha.ShowModal;
  CurrencyEdit4.SetFocus;
  DM1.tMaterial.IndexFieldNames := 'Nome';
end;

end.

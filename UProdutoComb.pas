unit UProdutoComb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, SMDBGrid, DBCtrls, ExtCtrls,
  DB, DBTables, RxLookup, DBClient, DBFilter, FMTBcd, Provider, SqlExpr;

type
  TfProdutoComb = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    DBText2: TDBText;
    Panel2: TPanel;
    SMDBGrid2: TSMDBGrid;
    Panel4: TPanel;
    BitBtn12: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn14: TBitBtn;
    RxDBLookupCombo12: TRxDBLookupCombo;
    BitBtn23: TBitBtn;
    tProdutoCorCop: TTable;
    tProdutoCorCopCodProduto: TIntegerField;
    tProdutoCorCopCodCor: TIntegerField;
    tProdutoCorCoplkNomeCor: TStringField;
    dsProdutoCorCop: TDataSource;
    tAuxProdutoGrade: TClientDataSet;
    tAuxProdutoGradeCodGrade: TIntegerField;
    tAuxProdutoGradePosicao: TIntegerField;
    tAuxProdutoGradeTamanho: TStringField;
    tAuxProdutoGradeQtd: TFloatField;
    tAuxProdutoGradeVlrUnitario: TFloatField;
    tAuxProdutoGradeVlrTotal: TFloatField;
    dsProdutoMatTamCop: TDataSource;
    tProdutoMatTamCop: TTable;
    tProdutoMatTamCopCodProduto: TIntegerField;
    tProdutoMatTamCopCodCorProd: TIntegerField;
    tProdutoMatTamCopItemMat: TIntegerField;
    tProdutoMatTamCopItem: TIntegerField;
    tProdutoMatTamCopCodGrade: TIntegerField;
    tProdutoMatTamCopPosicao: TIntegerField;
    tProdutoMatTamCopQtd: TFloatField;
    tProdutoMatTamCopVlrUnitario: TFloatField;
    tProdutoMatTamCopVlrTotal: TFloatField;
    dsProdutoMatCop: TDataSource;
    tProdutoMatCop: TTable;
    tProdutoMatCopCodProduto: TIntegerField;
    tProdutoMatCopCodCorProd: TIntegerField;
    tProdutoMatCopItem: TIntegerField;
    tProdutoMatCopCodMaterial: TIntegerField;
    tProdutoMatCopCodGrade: TIntegerField;
    tProdutoMatCopCodCor: TIntegerField;
    tProdutoMatCopQtd: TFloatField;
    tProdutoMatCopVlrUnitario: TFloatField;
    tProdutoMatCopVlrTotal: TFloatField;
    tProdutoMatCopCodPosicao: TIntegerField;
    tProdutoMatCopImpTalao: TStringField;
    tProdutoMatTamIns: TTable;
    tProdutoMatTamInsCodProduto: TIntegerField;
    tProdutoMatTamInsCodCorProd: TIntegerField;
    tProdutoMatTamInsItemMat: TIntegerField;
    tProdutoMatTamInsItem: TIntegerField;
    tProdutoMatTamInsCodGrade: TIntegerField;
    tProdutoMatTamInsPosicao: TIntegerField;
    tProdutoMatTamInsQtd: TFloatField;
    tProdutoMatTamInsVlrUnitario: TFloatField;
    tProdutoMatTamInsVlrTotal: TFloatField;
    tProdutoMatIns: TTable;
    tProdutoMatInsCodProduto: TIntegerField;
    tProdutoMatInsCodCorProd: TIntegerField;
    tProdutoMatInsItem: TIntegerField;
    tProdutoMatInsCodMaterial: TIntegerField;
    tProdutoMatInsCodGrade: TIntegerField;
    tProdutoMatInsCodCor: TIntegerField;
    tProdutoMatInsQtd: TFloatField;
    tProdutoMatInsVlrUnitario: TFloatField;
    tProdutoMatInsVlrTotal: TFloatField;
    dsAuxProdutoGrade: TDataSource;
    RxDBFilter1: TRxDBFilter;
    BitBtn4: TBitBtn;
    tProdutoMatCopUnidade: TStringField;
    sdsMaterialFB: TSQLDataSet;
    dspMaterialFB: TDataSetProvider;
    cdsMaterialFB: TClientDataSet;
    dsMaterialFB: TDataSource;
    sdsMaterialFBCODIGO: TIntegerField;
    sdsMaterialFBNOME: TStringField;
    sdsMaterialFBNOMESEMACENTO: TStringField;
    cdsMaterialFBCODIGO: TIntegerField;
    cdsMaterialFBNOME: TStringField;
    cdsMaterialFBNOMESEMACENTO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure SMDBGrid2DblClick(Sender: TObject);
  private
    { Private declarations }
    vItemComb : Integer;
    procedure Le_tConstrucaoMat;

  public
    { Public declarations }
  end;

var
  fProdutoComb: TfProdutoComb;

implementation

uses UDM1, UProdutoMat, UMaterial, DmdDatabase;

{$R *.dfm}

procedure TfProdutoComb.Le_tConstrucaoMat;
var
  vItemAux : Integer;
begin
  DM1.tProdutoMat.Refresh;
  DM1.tProdutoMat.Last;
  vItemAux := DM1.tProdutoMatItem.AsInteger;
  DM1.tConstrucaoMat.First;
  while not DM1.tConstrucaoMat.Eof do
  begin
    if not DM1.tProdutoMat.Locate('CodProduto;CodCorProd;CodMaterial;CodPosicao',VarArrayOf([DM1.tProdutoCodigo.AsInteger,DM1.tProdutoCorCodCor.AsInteger,DM1.tConstrucaoMatCodMaterial.AsInteger,DM1.tConstrucaoMatCodPosicao.AsInteger]),[locaseinsensitive]) then
    begin
      inc(vItemAux);
      DM1.tProdutoMat.Insert;
      DM1.tProdutoMatCodProduto.AsInteger   := DM1.tProdutoCodigo.AsInteger;
      DM1.tProdutoMatCodCorProd.AsInteger   := DM1.tProdutoCorCodCor.AsInteger;
      DM1.tProdutoMatItem.AsInteger         := vItemAux;
      DM1.tProdutoMatCodMaterial.AsInteger  := DM1.tConstrucaoMatCodMaterial.AsInteger;
      DM1.tProdutoMatCodGrade.AsInteger     := DM1.tConstrucaoMatCodGrade.AsInteger;
      DM1.tProdutoMatCodPosicao.AsInteger   := DM1.tConstrucaoMatCodPosicao.AsInteger;
      DM1.tProdutoMatImpTalao.AsString      := DM1.tConstrucaoMatImpTalao.AsString;
      DM1.tProdutoMatCodCor.AsInteger       := DM1.tConstrucaoMatCodCor.AsInteger;
      DM1.tProdutoMatQtd.AsFloat            := DM1.tConstrucaoMatQtd.AsFloat;
      DM1.tProdutoMatVlrUnitario.AsCurrency := DM1.tConstrucaoMatVlrUnitario.AsFloat;
      DM1.tProdutoMatVlrTotal.AsCurrency    := DM1.tConstrucaoMatVlrTotal.AsFloat;
      DM1.tProdutoMatUnidade.AsString       := DM1.tConstrucaoMatUnidade.AsString;
      DM1.tProdutoMat.Post;
    end;
    DM1.tConstrucaoMat.Next;
  end;
  DM1.tProdutoMat.Refresh;
end;

procedure TfProdutoComb.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfProdutoComb.BitBtn10Click(Sender: TObject);
begin
  BitBtn15.Tag    := 0;
  fProdutoMat     := TfProdutoMat.Create(Self);
  fProdutoMat.Tag := 0;
  fProdutoMat.ShowModal;
end;

procedure TfProdutoComb.BitBtn15Click(Sender: TObject);
begin
  if not DM1.tProdutoMat.IsEmpty then
  begin
    fProdutoMat     := TfProdutoMat.Create(Self);
    fProdutoMat.Tag := 0;
    BitBtn15.Tag    := 1;
    fProdutoMat.CurrencyEdit4.AsInteger := DM1.tProdutoMatCodMaterial.AsInteger;
    if DM1.tProdutoMatCodMaterial.AsInteger > 0 then
      fProdutoMat.RxDBLookupCombo1.KeyValue := DM1.tProdutoMatCodMaterial.AsInteger;
    if DM1.tProdutoMatCodCor.AsInteger > 0 then
      fProdutoMat.RxDBLookupCombo3.KeyValue := DM1.tProdutoMatCodCor.AsInteger;
    if DM1.tProdutoMatCodPosicao.AsInteger > 0 then
      fProdutoMat.RxDBLookupCombo15.KeyValue := DM1.tProdutoMatCodPosicao.AsInteger;
    if DM1.tProdutoMatImpTalao.AsString = 'S' then
      fProdutoMat.ComboBox2.ItemIndex := 0
    else
      fProdutoMat.ComboBox2.ItemIndex := 1;
    fProdutoMat.RxDBLookupCombo17Enter(fProdutoMat);
    fProdutoMat.RxDBLookupCombo17.Value   := DM1.tProdutoMatUnidade.AsString;
    fProdutoMat.CurrencyEdit1.Value       := DM1.tProdutoMatQtd.AsCurrency;
    fProdutoMat.CurrencyEdit2.Value       := DM1.tProdutoMatVlrUnitario.AsCurrency;
    fProdutoMat.vItemMat                  := DM1.tProdutoMatItem.AsInteger;
    DM1.tProdutoMatTam.First;
    while not DM1.tProdutoMatTam.Eof do
    begin
      DM1.tGradeItem.SetKey;
      DM1.tGradeItemCodGrade.AsInteger := DM1.tProdutoMatTamCodGrade.AsInteger;
      DM1.tGradeItemPosicao.AsInteger  := DM1.tProdutoMatTamPosicao.AsInteger;
      if DM1.tGradeItem.GotoKey then
      begin
        tAuxProdutoGrade.Insert;
        tAuxProdutoGradeCodGrade.AsInteger  := DM1.tGradeItemCodGrade.AsInteger;
        tAuxProdutoGradePosicao.AsInteger   := DM1.tGradeItemPosicao.AsInteger;
        tAuxProdutoGradeTamanho.AsString    := DM1.tGradeItemTamanho.AsString;
        tAuxProdutoGradeQtd.AsFloat         := DM1.tProdutoMatTamQtd.AsFloat;
        tAuxProdutoGradeVlrUnitario.AsFloat := DM1.tProdutoMatTamVlrUnitario.AsFloat;
        tAuxProdutoGradeVlrTotal.AsFloat    := DM1.tProdutoMatTamVlrTotal.AsFloat;
        tAuxProdutoGrade.Post;
      end;
      //DM1.tProdutoMatTam.Delete;
      DM1.tProdutoMatTam.Next;
    end;
    //DM1.tProdutoMat.Delete;
    fProdutoMat.ShowModal;
  end
  else
    ShowMessage('Não há registro p/ ser alterado!');
end;

procedure TfProdutoComb.BitBtn12Click(Sender: TObject);
begin
  if not DM1.tProdutoMat.IsEmpty then
    begin
      if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        begin
          DM1.tProdutoMatTam.First;
          while not DM1.tProdutoMatTam.EOF do
            DM1.tProdutoMatTam.Delete;
          DM1.tProdutoMat.Delete;
        end;
    end
  else
    ShowMessage('Não há registro p/ ser excluído!');
end;

procedure TfProdutoComb.FormShow(Sender: TObject);
begin
  Top   := 0;
  Left  := 0;
  Width := Screen.Width;
  Height := Screen.Height - 35;

  BitBtn10.Enabled := (DM1.tProduto.State in [dsEdit,dsInsert]);
  BitBtn15.Enabled := (DM1.tProduto.State in [dsEdit,dsInsert]);
  BitBtn12.Enabled := (DM1.tProduto.State in [dsEdit,dsInsert]);
  Panel1.Enabled   := (DM1.tProduto.State in [dsEdit,dsInsert]);

  DM1.tPosicao.Open;

  cdsMaterialFB.Close;
  cdsMaterialFB.IndexFieldNames := 'NOMESEMACENTO';
  cdsMaterialFB.Open;
end;

procedure TfProdutoComb.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfProdutoComb.BitBtn14Click(Sender: TObject);
begin
  if (RxDBLookupCombo12.Text <> '') and (DM1.tProdutoMat.RecordCount < 1) then
    begin
   // Grava os materiais do produto
      tProdutoMatCop.First;
      while not tProdutoMatCop.EOF do
        begin
          DM1.tProdutoMat.Insert;
          DM1.tProdutoMatCodProduto.AsInteger   := DM1.tProdutoCodigo.AsInteger;
          DM1.tProdutoMatCodCorProd.AsInteger   := DM1.tProdutoCorCodCor.AsInteger;
          DM1.tProdutoMatItem.AsInteger         := tProdutoMatCopItem.AsInteger;
          DM1.tProdutoMatCodMaterial.AsInteger  := tProdutoMatCopCodMaterial.AsInteger;
          DM1.tProdutoMatCodPosicao.AsInteger   := tProdutoMatCopCodPosicao.AsInteger;
          DM1.tProdutoMatImpTalao.AsString      := tProdutoMatCopImpTalao.AsString;
          DM1.tProdutoMatCodGrade.AsInteger     := tProdutoMatCopCodGrade.AsInteger;
          DM1.tProdutoMatCodCor.AsInteger       := tProdutoMatCopCodCor.AsInteger;
          DM1.tProdutoMatQtd.AsCurrency         := tProdutoMatCopQtd.AsCurrency;
          DM1.tProdutoMatVlrUnitario.AsCurrency := tProdutoMatCopVlrUnitario.AsCurrency;
          DM1.tProdutoMatVlrTotal.AsCurrency    := tProdutoMatCopVlrTotal.AsCurrency;
          DM1.tProdutoMatUnidade.AsString       := tProdutoMatCopUnidade.AsString;
          DM1.tProdutoMat.Post;

// Grava a quantidade por tamanho dos materiais
          tProdutoMatTamCop.First;
          while not tProdutoMatTamCop.Eof do
            begin
              DM1.tProdutoMatTam.Insert;
              DM1.tProdutoMatTamCodProduto.AsInteger   := DM1.tProdutoCodigo.AsInteger;
              DM1.tProdutoMatTamItemMat.AsInteger      := tProdutoMatCopItem.AsInteger;
              DM1.tProdutoMatTamItemMat.AsInteger      := DM1.tProdutoCorCodCor.AsInteger;
              DM1.tProdutoMatTamItem.AsInteger         := tProdutoMatTamCopItem.AsInteger;
              DM1.tProdutoMatTamCodGrade.AsInteger     := tProdutoMatTamCopCodGrade.AsInteger;
              DM1.tProdutoMatTamPosicao.AsInteger      := tProdutoMatTamCopPosicao.AsInteger;
              DM1.tProdutoMatTamQtd.AsCurrency         := tProdutoMatTamCopQtd.AsCurrency;
              DM1.tProdutoMatTamVlrUnitario.AsCurrency := tProdutoMatTamCopVlrUnitario.AsCurrency;
              DM1.tProdutoMatTamVlrTotal.AsCurrency    := tProdutoMatTamCopVlrTotal.AsCurrency;
              DM1.tProdutoMatTam.Post;
              tProdutoMatTamCop.Next;
            end;
          tProdutoMatCop.Next;
        end;
    end;
  RxDBLookupCombo12.ClearValue;

end;

procedure TfProdutoComb.BitBtn23Click(Sender: TObject);
begin
  if DM1.tProdutoCodConstrucao.AsInteger <= 0 then
  begin
    ShowMessage('Produto sem construção!');
    exit;
  end;
  if MessageDlg('Deseja copiar os materiais da construção para esta cor?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
  begin
    if DM1.tConstrucao.Locate('Codigo',DM1.tProdutoCodConstrucao.AsInteger,[loCaseInsensitive]) then
    begin
      DM1.tConstrucaoMat.Filtered := False;
      if DM1.tProdutoCodConstrucaoGrupo.AsInteger > 0 then
        DM1.tConstrucaoMat.Filter   := 'CodConstrucaoGrupo = '''+DM1.tProdutoCodConstrucaoGrupo.AsString+''''
      else
        DM1.tConstrucaoMat.Filter   := 'CodConstrucaoGrupo = '''+'0'+'''';
      DM1.tConstrucaoMat.Filtered := True;
      Le_tConstrucaoMat;
      DM1.tConstrucaoMat.Filtered := False;
    end;
  end;
end;

procedure TfProdutoComb.SMDBGrid2DblClick(Sender: TObject);
begin
  if DM1.tUsuarioMaterial.AsBoolean then
    begin
      if DM1.tProdutoMatItem .AsInteger > 0 then
        DM1.tMaterial.Locate('Codigo',dm1.tProdutoMatCodMaterial.AsInteger,[loCaseInsensitive]);
      fMaterial := TfMaterial.Create(Self);
      fMaterial.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de Material!');
end;

end.

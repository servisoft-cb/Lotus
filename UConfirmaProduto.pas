unit UConfirmaProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, DB, DBTables,
  DBClient, Grids, DBGrids, SMDBGrid;

type
  TfConfirmaProduto = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    BitBtn1: TBitBtn;
    qPedidoItem: TQuery;
    qPedidoItemPedido: TIntegerField;
    qPedidoItemItem: TIntegerField;
    qPedidoItemCodProduto: TIntegerField;
    qPedidoItemCodCor: TIntegerField;
    mPedidoAlterado: TClientDataSet;
    mPedidoAlteradoPedido: TIntegerField;
    mPedidoAlteradoItem: TIntegerField;
    mPedidoAlteradoCodProduto: TIntegerField;
    mPedidoAlteradoCodCor: TIntegerField;
    dsmPedidoAlterado: TDataSource;
    mPedidoAlteradolkNomeCor: TStringField;
    SMDBGrid1: TSMDBGrid;
    BitBtn2: TBitBtn;
    qTalao: TQuery;
    qTalaoMI: TQuery;
    qTalaoCodProduto: TIntegerField;
    qTalaoItem: TIntegerField;
    qTalaoLote: TIntegerField;
    qTalaoCodCor: TIntegerField;
    qTalaoMILote: TIntegerField;
    qTalaoMICodProduto: TIntegerField;
    qTalaoMIItem: TIntegerField;
    qTalaoMICodCor: TIntegerField;
    mPedidoAlteradoTipo: TStringField;
    mPedidoAlteradoLote: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Monta_SQLqPedidoItem;
    procedure Le_tProduto;
    procedure Le_tProdutoTalao;
    procedure Le_tProdutoTalaoMI;
    procedure Monta_SQLqTalao;
    procedure Monta_SQLqTalaoMI;
    procedure AjustaMaterial_Talao;
    procedure AjustaMaterial_TalaoMI;

  public
    { Public declarations }
  end;

var
  fConfirmaProduto: TfConfirmaProduto;

implementation

uses UDM1, uIntegracao;

{$R *.dfm}

procedure TfConfirmaProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tPedido.Close;
  DM1.tPedidoItem.Close;
  DM1.tPedidoMaterial.Close;
  DM1.tPosicao.Close;
  DM1.tLote.Close;
  DM1.tLoteMI.Close;
  DM1.tTalao.Close;
  DM1.tTalaoMI.Close;

  Action := Cafree;
end;

procedure TfConfirmaProduto.BitBtn1Click(Sender: TObject);
begin
  try
    BitBtn1.Enabled := False;

    Monta_SQLqPedidoItem;
    Monta_SQLqTalao;
    Monta_SQLqTalaoMI;

    DM1.tProduto.Edit;
    DM1.tProdutoCadastroCompleto.AsBoolean := True;
    DM1.tProduto.Post;
    Prc_Gravar_Produto_FB(DM1.tProdutoCodigo.AsInteger);

    BitBtn2.SetFocus;

  except
    on E: Exception do
      ShowMessage('Erro ==> ' + E.Message);
  end;

end;

procedure TfConfirmaProduto.Monta_SQLqPedidoItem;
begin
  qPedidoItem.Close;
  qPedidoItem.ParamByName('CodProduto').AsInteger := DM1.tProdutoCodigo.AsInteger;
  qPedidoItem.Open;

  DM1.tProdutoCor.IndexFieldNames := 'CodProduto;CodCor';
  DM1.tPedido.IndexFieldNames     := 'Pedido';
  DM1.tPedidoItem.IndexFieldNames := 'Pedido;Item';

  mPedidoAlterado.EmptyDataSet;

  qPedidoItem.First;
  while not qPedidoItem.Eof do
  begin
    if DM1.tPedido.FindKey([qPedidoItemPedido.AsInteger]) then
      if DM1.tPedidoItem.FindKey([qPedidoItemPedido.AsInteger,qPedidoItemItem.AsInteger]) then
        Le_tProduto;
    qPedidoItem.Next;
  end;
end;

procedure TfConfirmaProduto.Le_tProduto;
begin
  if not DM1.tProdutoCor.FindKey([qPedidoItemCodProduto.AsInteger,qPedidoItemCodCor.AsInteger]) then
    exit;
    
  DM1.tPedidoMaterial.First;
  while not DM1.tPedidoMaterial.Eof do
    DM1.tPedidoMaterial.Delete;
    
  DM1.tProdutoMat.First;
  while not DM1.tProdutoMat.Eof do
  begin
    DM1.Grava_PedidoMaterial;
    DM1.tProdutoMat.Next;
  end;

  DM1.tPedidoMaterial.First;
  while not DM1.tPedidoMaterial.Eof do
  begin
    DM1.tPosicao.FindKey([DM1.tPedidoMaterialCodPosicao.AsInteger]);
    if (DM1.tPedidoMateriallkTipo.AsString = 'S') or (DM1.tPedidoMateriallkTipo.AsString = 'C') or
       (DM1.tPedidoMateriallkTipo.AsString = 'F') or (DM1.tPedidoMateriallkTipo.AsString = 'T') or
       (DM1.tPedidoMateriallkTipo.AsString = 'P') or (DM1.tPedidoMateriallkTipo.AsString = 'E') or
       (DM1.tPedidoMateriallkTipo.AsString = '1') then
      DM1.AjustaMaterial_PedidoItem;
    DM1.tPedidoMaterial.Next;
  end;

  mPedidoAlterado.Insert;
  mPedidoAlteradoPedido.AsInteger     := DM1.tPedidoItemPedido.AsInteger;
  mPedidoAlteradoItem.AsInteger       := DM1.tPedidoItemItem.AsInteger;
  mPedidoAlteradoCodProduto.AsInteger := DM1.tPedidoItemCodProduto.AsInteger;
  mPedidoAlteradoCodCor.AsInteger     := DM1.tPedidoItemCodCor.AsInteger;
  mPedidoAlterado.Post;
end;

procedure TfConfirmaProduto.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfConfirmaProduto.Monta_SQLqTalao;
begin
  qTalao.Close;
  qTalao.ParamByName('CodProduto').AsInteger := DM1.tProdutoCodigo.AsInteger;
  qTalao.Open;

  DM1.tProdutoCor.IndexFieldNames := 'CodProduto;CodCor';
  DM1.tLote.IndexFieldNames       := 'Lote';
  DM1.tTalao.IndexFieldNames      := 'Lote;Item';

  qTalao.First;
  while not qTalao.Eof do
  begin
    if DM1.tLote.FindKey([qTalaoLote.AsInteger]) then
      if DM1.tTalao.FindKey([qTalaoLote.AsInteger,qTalaoItem.AsInteger]) then
        Le_tProdutoTalao;
    qTalao.Next;
  end;
end;

procedure TfConfirmaProduto.Monta_SQLqTalaoMI;
begin
  qTalaoMI.Close;
  qTalaoMI.ParamByName('CodProduto').AsInteger := DM1.tProdutoCodigo.AsInteger;
  qTalaoMI.Open;

  DM1.tProdutoCor.IndexFieldNames := 'CodProduto;CodCor';
  DM1.tLoteMI.IndexFieldNames     := 'Lote';
  DM1.tTalaoMI.IndexFieldNames    := 'Lote;Item';

  qTalaoMI.First;
  while not qTalaoMI.Eof do
    begin
      if DM1.tLoteMI.FindKey([qTalaoMILote.AsInteger]) then
        if DM1.tTalaoMI.FindKey([qTalaoMILote.AsInteger,qTalaoMIItem.AsInteger]) then
          Le_tProdutoTalaoMI;
      qTalaoMI.Next;
    end;
end;

procedure TfConfirmaProduto.Le_tProdutoTalao;
begin
  if not DM1.tProdutoCor.FindKey([qTalaoCodProduto.AsInteger,qTalaoCodCor.AsInteger]) then
    exit;

  DM1.tProdutoMat.First;
  while not DM1.tProdutoMat.Eof do
  begin
    if DM1.tPosicao.FindKey([DM1.tProdutoMatCodPosicao.AsInteger]) then
    begin
      if (DM1.tPosicaoTipo.AsString = 'S') or (DM1.tPosicaoTipo.AsString = 'C') or
         (DM1.tPosicaoTipo.AsString = 'F') or (DM1.tPosicaoTipo.AsString = 'T') or
         (DM1.tPosicaoTipo.AsString = 'P') or (DM1.tPosicaoTipo.AsString = 'E') or
         (DM1.tPosicaoTipo.AsString = '1') then
        AjustaMaterial_Talao;
    end;

    DM1.tProdutoMat.Next;
  end;

  mPedidoAlterado.Insert;
  mPedidoAlteradoPedido.AsInteger     := 0;
  mPedidoAlteradoItem.AsInteger       := 0;
  mPedidoAlteradoCodProduto.AsInteger := qTalaoCodProduto.AsInteger;
  mPedidoAlteradoCodCor.AsInteger     := qTalaoCodCor.AsInteger;
  mPedidoAlteradoTipo.AsString        := 'Exportação';
  mPedidoAlteradoLote.AsInteger       := qTalaoLote.AsInteger;
  mPedidoAlterado.Post;
end;

procedure TfConfirmaProduto.Le_tProdutoTalaoMI;
begin
  if not DM1.tProdutoCor.FindKey([qTalaoMICodProduto.AsInteger,qTalaoMICodCor.AsInteger]) then
    exit;

  DM1.tProdutoMat.First;
  while not DM1.tProdutoMat.Eof do
  begin
    if DM1.tPosicao.FindKey([DM1.tProdutoMatCodPosicao.AsInteger]) then
    begin
      if (DM1.tPosicaoTipo.AsString = 'S') or (DM1.tPosicaoTipo.AsString = 'C') or
         (DM1.tPosicaoTipo.AsString = 'F') or (DM1.tPosicaoTipo.AsString = 'T') or
         (DM1.tPosicaoTipo.AsString = 'P') or (DM1.tPosicaoTipo.AsString = 'E') or
         (DM1.tPosicaoTipo.AsString = '1') then
        AjustaMaterial_TalaoMI;
    end;

    DM1.tProdutoMat.Next;
  end;

  mPedidoAlterado.Insert;
  mPedidoAlteradoPedido.AsInteger     := 0;
  mPedidoAlteradoItem.AsInteger       := 0;
  mPedidoAlteradoCodProduto.AsInteger := qTalaoMICodProduto.AsInteger;
  mPedidoAlteradoCodCor.AsInteger     := qTalaoMICodCor.AsInteger;
  mPedidoAlteradoTipo.AsString        := 'Interno';
  mPedidoAlteradoLote.AsInteger       := qTalaoMILote.AsInteger;
  mPedidoAlterado.Post;
end;

procedure TfConfirmaProduto.AjustaMaterial_Talao;
begin
  DM1.tTalao.Edit;
  if DM1.tPosicaoTipo.AsString = 'S' then
  begin
    DM1.tTalaoCodCorSolado.AsInteger := DM1.tProdutoMatCodCor.AsInteger;
    DM1.tTalaoCodSolado.AsInteger    := DM1.tProdutoMatCodMaterial.AsInteger;
  end
  else
  if DM1.tPosicaoTipo.AsString = 'C' then
  begin
    if DM1.tTalaoCodCabedal1.AsInteger = 0 then
      DM1.tTalaoCodCabedal1.AsInteger := DM1.tProdutoMatCodMaterial.AsInteger
    else
      DM1.tTalaoCodCabedal2.AsInteger := DM1.tProdutoMatCodMaterial.AsInteger;
  end
  else
  if DM1.tPosicaoTipo.AsString = 'F' then
  begin
    DM1.tTalaoCodCorForro.AsInteger := DM1.tProdutoMatCodCor.AsInteger;
    DM1.tTalaoCodForro.AsInteger    := DM1.tProdutoMatCodMaterial.AsInteger;
  end
  else
  if DM1.tPosicaoTipo.AsString = 'T' then
  begin
    DM1.tTalaoCodCorTaloneira.AsInteger := DM1.tProdutoMatCodCor.AsInteger;
    DM1.tTalaoCodTaloneira.AsInteger    := DM1.tProdutoMatCodMaterial.AsInteger;
  end
  else
  if DM1.tPosicaoTipo.AsString = 'P' then
  begin
    DM1.tTalaoCodPalmilha.AsInteger    := DM1.tProdutoMatCodMaterial.AsInteger;
    DM1.tTalaoCodCorPalmilha.AsInteger := DM1.tProdutoMatCodCor.AsInteger;
  end
  else
  if DM1.tPosicaoTipo.AsString = 'E' then
    DM1.tTalaoCodEtiqueta.AsInteger := DM1.tProdutoMatCodMaterial.AsInteger
  else
  if DM1.tPosicaoTipo.AsString = '1' then
    DM1.tTalaoCodForma.AsInteger := DM1.tProdutoMatCodMaterial.AsInteger;
  DM1.tTalao.Post;
  Prc_Gravar_Talao_FB(DM1.tTalaoLote.AsInteger,DM1.tTalaoItem.AsInteger);
end;

procedure TfConfirmaProduto.AjustaMaterial_TalaoMI;
begin
  DM1.tTalaoMI.Edit;
  if DM1.tPosicaoTipo.AsString = 'S' then
  begin
    DM1.tTalaoMICodCorSolado.AsInteger := DM1.tProdutoMatCodCor.AsInteger;
    DM1.tTalaoMICodSolado.AsInteger    := DM1.tProdutoMatCodMaterial.AsInteger;
  end
  else
  if DM1.tPosicaoTipo.AsString = 'C' then
  begin
    if DM1.tTalaoMICodCabedal1.AsInteger = 0 then
      DM1.tTalaoMICodCabedal1.AsInteger := DM1.tProdutoMatCodMaterial.AsInteger
    else
      DM1.tTalaoMICodCabedal2.AsInteger := DM1.tProdutoMatCodMaterial.AsInteger;
  end
  else
  if DM1.tPosicaoTipo.AsString = 'F' then
  begin
    DM1.tTalaoMICodCorForro.AsInteger := DM1.tProdutoMatCodCor.AsInteger;
    DM1.tTalaoMICodForro.AsInteger    := DM1.tProdutoMatCodMaterial.AsInteger;
  end
  else
  if DM1.tPosicaoTipo.AsString = 'T' then
  begin
    DM1.tTalaoMICodCorTaloneira.AsInteger := DM1.tProdutoMatCodCor.AsInteger;
    DM1.tTalaoMICodTaloneira.AsInteger    := DM1.tProdutoMatCodMaterial.AsInteger;
  end
  else
  if DM1.tPosicaoTipo.AsString = 'P' then
  begin
    DM1.tTalaoMICodPalmilha.AsInteger    := DM1.tProdutoMatCodMaterial.AsInteger;
    DM1.tTalaoMICodCorPalmilha.AsInteger := DM1.tProdutoMatCodCor.AsInteger;
  end
  else
  if DM1.tPosicaoTipo.AsString = 'E' then
    DM1.tTalaoMICodEtiqueta.AsInteger := DM1.tProdutoMatCodMaterial.AsInteger
  else
  if DM1.tPosicaoTipo.AsString = '1' then
    DM1.tTalaoMICodForma.AsInteger := DM1.tProdutoMatCodMaterial.AsInteger;
  DM1.tTalaoMI.Post;
end;

procedure TfConfirmaProduto.FormShow(Sender: TObject);
begin
  DM1.tPedido.Open;
  DM1.tPedidoItem.Open;
  DM1.tPedidoMaterial.Open;
  DM1.tPosicao.Open;
  DM1.tLote.Open;
  DM1.tLoteMI.Open;
  DM1.tTalao.Open;
  DM1.tTalaoMI.Open;
end;

end.

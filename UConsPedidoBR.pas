unit UConsPedidoBR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, RxLookup, StdCtrls, Grids, DBGrids,
  RXDBCtrl, Mask, ToolEdit, CurrEdit, DB, DBTables, Buttons, ExtCtrls, DBVGrids, DBClient, SMDBGrid;

type
  TfConsPedidoBR = class(TForm)
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    qConsulta: TQuery;
    Label5: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label6: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    dsqConsulta: TDataSource;
    Label7: TLabel;
    RxDBGrid2: TRxDBGrid;
    tPedidoNota: TTable;
    dsPedidoNota: TDataSource;
    RadioGroup1: TRadioGroup;
    VDBGrid1: TVDBGrid;
    tPedidoGrade: TTable;
    dsPedidoGrade: TDataSource;
    RxDBLookupCombo4: TRxDBLookupCombo;
    mResumo: TClientDataSet;
    mResumoCodProduto: TIntegerField;
    mResumoReferencia: TStringField;
    mResumoNomeProduto: TStringField;
    mResumoNumOS: TStringField;
    mResumoQtdTotal: TFloatField;
    mResumoQtdFaturada: TFloatField;
    mResumoPercRestante: TFloatField;
    mResumoQtdRestante: TFloatField;
    dsmResumo: TDataSource;
    RadioGroup2: TRadioGroup;
    mResumoNomeCor: TStringField;
    mResumoCodCor: TIntegerField;
    SMDBGrid1: TSMDBGrid;
    Shape1: TShape;
    Label9: TLabel;
    Shape2: TShape;
    Label10: TLabel;
    Shape3: TShape;
    Label11: TLabel;
    Shape4: TShape;
    Label12: TLabel;
    CheckBox1: TCheckBox;
    Label13: TLabel;
    qConsultaPedido: TIntegerField;
    qConsultaPedidoCliente: TIntegerField;
    qConsultaCodCliente: TIntegerField;
    qConsultaNomeCliente: TStringField;
    qConsultaItem: TIntegerField;
    qConsultaCodProduto: TIntegerField;
    qConsultaCodCor: TIntegerField;
    qConsultaQtdPares: TFloatField;
    qConsultaQtdParesFat: TFloatField;
    qConsultaQtdParesRest: TFloatField;
    qConsultaQtdParesCanc: TFloatField;
    qConsultaCodGrade: TIntegerField;
    qConsultaDtEmissao: TDateField;
    qConsultaFantasia: TStringField;
    qConsultaReferencia: TStringField;
    qConsultaNomeProduto: TStringField;
    qConsultaDescMaterial: TStringField;
    qConsultaLoteGer: TBooleanField;
    qConsultalkNomeCor: TStringField;
    tPedidoGradePedido: TIntegerField;
    tPedidoGradeItemPed: TIntegerField;
    tPedidoGradeCodGrade: TIntegerField;
    tPedidoGradePosicao: TIntegerField;
    tPedidoGradeQtd: TFloatField;
    tPedidoGradelkTamanho: TStringField;
    tPedidoNotaPedido: TIntegerField;
    tPedidoNotaItem: TIntegerField;
    tPedidoNotaNumSeqNota: TIntegerField;
    tPedidoNotaItemNota: TIntegerField;
    tPedidoNotaDtNota: TDateField;
    tPedidoNotaQtdPares: TIntegerField;
    tPedidoNotaNroLancExtComissao: TIntegerField;
    tPedidoNotaNroLancExtComissaoMod: TIntegerField;
    tPedidoNotaNumNota: TIntegerField;
    qConsultaDtIniEmbarque: TDateField;
    qConsultaDtFinEmbarque: TDateField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure RxDBLookupCombo2Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure VDBGrid1CellClick(Column: TColumn);
    procedure VDBGrid1ColEnter(Sender: TObject);
    procedure RxDBLookupCombo4Change(Sender: TObject);
    procedure RxDBLookupCombo4Enter(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Monta_SQL;
    procedure Monta_Resumo;
  public
    { Public declarations }
    vOpcao : String;
    vDtEntregaIni, vDtEntregaFim : TDateTime;
    vDtEmissaoIni, vDtEmissaoFim : TDateTime;
    vCodVendedor : Integer;
    vCodCor, vCodGrade, vPosicao  : Integer;
    vTamanho : String;
    vOpcaoOS : String; // N= Não Possui OS  S= Possui OS  A= Ambos
  end;

var
  fConsPedidoBR: TfConsPedidoBR;

implementation

uses UDM1, URelPedidoBR2, UPedido;

{$R *.dfm}

procedure TfConsPedidoBR.Monta_Resumo;
begin
  mResumo.EmptyDataSet;
  qConsulta.First;
  while not qConsulta.Eof do
    begin
      if mResumo.Locate('CodProduto;CodCor',VarArrayOf([qConsultaCodProduto.AsInteger,qConsultaCodCor.AsInteger]),[locaseinsensitive]) then
        mResumo.Edit
      else
        begin
          mResumo.Insert;
          mResumoCodProduto.AsInteger := qConsultaCodProduto.AsInteger;
          mResumoReferencia.AsString  := qConsultaReferencia.AsString;
          mResumoNomeProduto.AsString := qConsultaNomeProduto.AsString;
          mResumoCodCor.AsInteger     := qConsultaCodCor.AsInteger;
          mResumoNomeCor.AsString     := qConsultalkNomeCor.AsString;
        end;
      mResumoQtdTotal.AsFloat     := mResumoQtdTotal.AsFloat + qConsultaQtdPares.AsFloat;
      mResumoQtdFaturada.AsFloat  := mResumoQtdFaturada.AsFloat + qConsultaQtdParesFat.AsFloat;
      mResumoQtdRestante.AsFloat  := mResumoQtdRestante.AsFloat + qConsultaQtdParesRest.AsFloat;
      mResumoPercRestante.AsFloat := StrToFloat(FormatFloat('0.00',(mResumoQtdRestante.AsFloat / mResumoQtdTotal.AsFloat) * 100));
      mResumo.Post;
      qConsulta.Next;
    end;
end;

procedure TfConsPedidoBR.Monta_SQL;
var
  vSeparador : String;
begin
  qConsulta.Close;
  qConsulta.SQL.Clear;
  qConsulta.SQL.Add('SELECT Dbpedido.Pedido, Dbpedido.PedidoCliente, Dbpedido.CodCliente, Dbcliente.Nome NomeCliente, Dbpedidoitem.Item, ');
  qConsulta.SQL.Add(' Dbpedidoitem.CodProduto, Dbpedidoitem.CodCor, Dbpedidoitem.QtdPares, Dbpedidoitem.QtdParesFat, Dbpedidoitem.QtdParesRest, ');
  qConsulta.SQL.Add(' Dbpedidoitem.QtdParesCanc, Dbpedidoitem.CodGrade, Dbpedido.DtEmissao, Dbcliente.Fantasia, Dbproduto.Referencia, ');
  qConsulta.SQL.Add(' Dbproduto.Nome NomeProduto, Dbproduto.DescMaterial, Dbpedidoitem.LoteGer, Dbpedido.DtIniEmbarque, Dbpedido.DtFinEmbarque');
  qConsulta.SQL.Add('FROM "dbPedido.DB" Dbpedido');
  qConsulta.SQL.Add('   INNER JOIN "dbPedidoItem.DB" Dbpedidoitem');
  qConsulta.SQL.Add('   ON  (Dbpedido.Pedido = Dbpedidoitem.Pedido)');
  qConsulta.SQL.Add('   INNER JOIN "dbCliente.DB" Dbcliente');
  qConsulta.SQL.Add('   ON  (Dbpedido.CodCliente = Dbcliente.Codigo)');
  qConsulta.SQL.Add('   INNER JOIN "dbProduto.DB" Dbproduto');
  qConsulta.SQL.Add('   ON  (Dbpedidoitem.CodProduto = Dbproduto.Codigo)');
  qConsulta.SQL.Add('WHERE (0=0)' );
  if RadioGroup1.ItemIndex = 0 then
    qConsulta.SQL.Add(' AND (dbPedidoItem.QtdParesRest > 0)');
  if RadioGroup1.ItemIndex = 1 then
    qConsulta.SQL.Add(' AND (dbPedidoItem.QtdParesFat > 0)');
  if Edit1.Text <> '' then
    qConsulta.SQL.Add(' AND (dbCliente.Nome LIKE ''%' + Edit1.Text + '%'')');
  if Edit2.Text <> '' then
    begin
      qConsulta.SQL.Add(' AND (dbPedido.PedidoCliente = :PedidoCliente)');
      qConsulta.ParamByName('PedidoCliente').AsInteger := StrToInt(Edit2.Text);
    end;
  if RxDBLookupCombo1.Text <> '' then
    begin
      qConsulta.SQL.Add(' AND (dbPedido.CodCliente = :CodCliente)');
      qConsulta.ParamByName('CodCliente').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if RxDBLookupCombo4.Text <> '' then
    begin
      qConsulta.SQL.Add(' AND (dbPedidoItem.CodProduto = :CodProduto)');
      qConsulta.ParamByName('CodProduto').AsInteger := RxDBLookupCombo4.KeyValue;
    end;
  if vDtEntregaIni > 0 then
    begin
      qConsulta.SQL.Add(' AND (dbPedido.DtIniEmbarque >= :DtIniEmbarque)');
      qConsulta.ParamByName('DtIniEmbarque').AsDate := vDtEntregaIni;
    end;
  if vDtEntregaFim > 0 then
    begin
      qConsulta.SQL.Add(' AND (dbPedido.DtFinEmbarque <= :DtFinEmbarque)');
      qConsulta.ParamByName('DtFinEmbarque').AsDate := vDtEntregaFim;
    end;
  if vDtEmissaoIni > 0 then
    begin
      qConsulta.SQL.Add(' AND (dbPedido.DtEmissao >= :DtEmissaoIni)');
      qConsulta.ParamByName('DtEmissaoIni').AsDate := vDtEmissaoIni;
    end;
  if vDtEmissaoFim > 0 then
    begin
      qConsulta.SQL.Add(' AND (dbPedido.DtEmissao <= :DtEmissaoFim)');
      qConsulta.ParamByName('DtEmissaoFim').AsDate := vDtEmissaoFim;
    end;
  if vCodVendedor > 0 then
    begin
      qConsulta.SQL.Add(' AND (dbPedido.CodVendedor = :CodVendedor)');
      qConsulta.ParamByName('CodVendedor').AsInteger := vCodVendedor;
    end;
  if vCodCor > 0 then
    begin
      qConsulta.SQL.Add(' AND (dbPedidoItem.CodCor = :CodCor)');
      qConsulta.ParamByName('CodCor').AsInteger := vCodCor;
    end;
  if vCodGrade > 0 then
    begin
      qConsulta.SQL.Add(' AND (dbPedidoItem.CodGrade = :CodGrade)');
      qConsulta.ParamByName('CodGrade').AsInteger := vCodGrade;
    end;
  {if vTamanho <> '' then
    begin
      qConsulta.SQL.Add(' AND (dbPedidoItem.Tamanho = :Tamanho)');
      qConsulta.ParamByName('Tamanho').AsString := vTamanho;
    end;}
  if vOpcaoOS = 'N' then
    qConsulta.SQL.Add(' AND (dbPedidoItem.LoteGer = False)')
  else
  if vOpcaoOS = 'S' then
    qConsulta.SQL.Add(' AND (dbPedidoItem.LoteGer = True)');

  case RadioGroup2.ItemIndex of
    0 : qConsulta.SQL.Add('ORDER BY dbPedido.DtEmissao, dbPedidoItem.CodProduto, dbPedidoItem.CodCor');
    1 : qConsulta.SQL.Add('ORDER BY dbPedido.PedidoCliente, dbPedidoItem.CodProduto, dbPedidoItem.CodCor');
    2 : qConsulta.SQL.Add('ORDER BY dbPedidoItem.CodProduto, dbPedido.PedidoCliente, dbPedidoItem.CodProduto,dbPedidoItem.CodCor');
  end;
  qConsulta.Open;
end;

procedure TfConsPedidoBR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  dm1.GravaGrid(SMDBGrid1,Name);
  DM1.tCliente.Close;
  DM1.tProduto.Close;
  DM1.tProdutoMat.Close;
  DM1.tProdutoCor.Close;
  DM1.tPedidoItem.Close;
  DM1.tProdutoTam.Close;
  DM1.tMaterialGradeNum.Close;
  DM1.tCor.Close;
  qConsulta.Close;
  Action := Cafree;
end;

procedure TfConsPedidoBR.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

procedure TfConsPedidoBR.BitBtn1Click(Sender: TObject);
begin
  Monta_SQL;
  RxDBGrid2.DataSource := dsPedidoNota;
  VDBGrid1.DataSource  := dsPedidoGrade;
end;

procedure TfConsPedidoBR.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tProduto.IndexFieldNames := 'Nome';
end;

procedure TfConsPedidoBR.RxDBLookupCombo2Change(Sender: TObject);
begin
  if RxDBLookupCombo2.Text <> '' then
    RxDBLookupCombo4.KeyValue := RxDBLookupCombo2.KeyValue
  else
    RxDBLookupCombo4.ClearValue;
end;

procedure TfConsPedidoBR.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsPedidoBR.BitBtn2Click(Sender: TObject);
begin
  if qConsulta.RecordCount > 0 then
    begin
      SMDBGrid1.DisableScroll;
      fRelPedidoBR2 := TfRelPedidoBR2.Create(Self);
      fRelPedidoBR2.RLReport1.PreviewModal;
      fRelPedidoBR2.RLReport1.Free;
      if MessageDlg('Imprimir o resumo?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        begin
          Monta_Resumo;
          mResumo.First;
          fRelPedidoBR2 := TfRelPedidoBR2.Create(Self);
          fRelPedidoBR2.RLReport2.Preview;
          fRelPedidoBR2.RLReport2.Free;
        end;
      SMDBGrid1.EnableScroll;

    end
  else
    ShowMessage('Não existe registro para impressão!');
end;

procedure TfConsPedidoBR.FormShow(Sender: TObject);
begin
  DM1.tCliente.Open;
  DM1.tProduto.Open;
  DM1.tProdutoMat.Open;
  DM1.tProdutoCor.Open;
  DM1.tPedidoItem.Open;
  DM1.tProdutoTam.Open;
  DM1.tCor.Open;
end;

procedure TfConsPedidoBR.VDBGrid1CellClick(Column: TColumn);
begin
 if vDBGrid1.SelectedIndex = 0 then
   vDBGrid1.SelectedIndex := 1;
end;

procedure TfConsPedidoBR.VDBGrid1ColEnter(Sender: TObject);
begin
 if vDBGrid1.SelectedIndex = 0 then
   vDBGrid1.SelectedIndex := 1;
end;

procedure TfConsPedidoBR.RxDBLookupCombo4Change(Sender: TObject);
begin
  if RxDBLookupCombo4.Text <> '' then
    RxDBLookupCombo2.KeyValue := RxDBLookupCombo4.KeyValue
  else
    RxDBLookupCombo2.ClearValue;
end;

procedure TfConsPedidoBR.RxDBLookupCombo4Enter(Sender: TObject);
begin
  DM1.tProduto.IndexFieldNames := 'Referencia';
end;

procedure TfConsPedidoBR.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (qConsultaItem.AsInteger > 0) then
    begin
      if (qConsultaQtdParesRest.AsFloat <= 0) and (qConsultaQtdParesFat.AsFloat > 0) then
        begin
          Background  := clTeal;
          AFont.Color := clWhite;
        end
      else
      if (qConsultaQtdParesRest.AsFloat <= 0) and (qConsultaQtdParesCanc.AsFloat > 0) then
        begin
          Background  := clRed;
          AFont.Color := clWhite;
        end
      else
      if qConsultaLoteGer.AsBoolean then
        Background  := clAqua;
    end;
end;

procedure TfConsPedidoBR.FormCreate(Sender: TObject);
begin
  //dm1.leGrid(SMDBGrid1,Name);
end;

end.


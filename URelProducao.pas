unit URelProducao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, ToolEdit, DB,
  DBTables, Grids, DBGrids, DBClient, DBVGrids, RxLookup, RLReport, ExtCtrls, Buttons;

type
  TfRelProducao = class(TForm)
    qrRelProducao: TQuery;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    cdsRelProducao: TClientDataSet;
    DataSource2: TDataSource;
    cdsRelProducaoCodFabrica: TIntegerField;
    cdsRelProducaoData: TDateField;
    cdsRelProducaoReferencia: TStringField;
    cdsRelProducaolkFabrica: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    cdsRelProducaoCodSetor1: TIntegerField;
    cdsRelProducaoCodSetor2: TIntegerField;
    cdsRelProducaoCodSetor3: TIntegerField;
    cdsRelProducaoCodSetor4: TIntegerField;
    cdsRelProducaoCodSetor5: TIntegerField;
    cdsRelProducaoCodSetor6: TIntegerField;
    cdsRelProducaoCodSetor7: TIntegerField;
    cdsRelProducaoQtdPares1: TIntegerField;
    cdsRelProducaoQtdPares2: TIntegerField;
    cdsRelProducaoQtdPares3: TIntegerField;
    cdsRelProducaoQtdPares4: TIntegerField;
    cdsRelProducaoQtdPares5: TIntegerField;
    cdsRelProducaoQtdPares6: TIntegerField;
    cdsRelProducaoQtdPares7: TIntegerField;
    cdsSetor: TClientDataSet;
    cdsSetorIndice: TIntegerField;
    cdsSetorCodSetor: TIntegerField;
    cdsSetorNome: TStringField;
    RLGroup1: TRLGroup;
    RLGroup2: TRLGroup;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLBand1: TRLBand;
    RLDBText4: TRLDBText;
    Setor1: TRLLabel;
    Setor2: TRLLabel;
    Setor3: TRLLabel;
    Setor4: TRLLabel;
    Setor5: TRLLabel;
    Setor6: TRLLabel;
    Setor7: TRLLabel;
    RLBand3: TRLBand;
    RLDBText3: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLBand4: TRLBand;
    ResultData1: TRLDBResult;
    ResultData2: TRLDBResult;
    ResultData3: TRLDBResult;
    ResultData4: TRLDBResult;
    ResultData5: TRLDBResult;
    ResultData6: TRLDBResult;
    ResultData7: TRLDBResult;
    RLBand5: TRLBand;
    ResultTotal1: TRLDBResult;
    ResultTotal2: TRLDBResult;
    ResultTotal3: TRLDBResult;
    ResultTotal4: TRLDBResult;
    ResultTotal5: TRLDBResult;
    ResultTotal6: TRLDBResult;
    ResultTotal7: TRLDBResult;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelProducao: TfRelProducao;

implementation

uses UDM1;

{$R *.dfm}

procedure TfRelProducao.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  Posicao : Integer;
begin
  cdsSetor.First;
  Posicao := 0;
  while not cdsSetor.EOF do
    begin
      Inc(Posicao);
      if Posicao <= 7 then
      begin
        TRLLabel(FindComponent('Setor' + IntToStr(Posicao))).Visible  := True;
        TRLDBResult(FindComponent('ResultData' + IntToStr(Posicao))).Visible  := True;
        TRLDBResult(FindComponent('ResultTotal' + IntToStr(Posicao))).Visible  := True;
        TRLLabel(FindComponent('Setor' + IntToStr(Posicao))).Caption  := cdsSetorNome.AsString;
      end;
      cdsSetor.Next;
    end;
end;

procedure TfRelProducao.BitBtn1Click(Sender: TObject);
var indice, indSetor : integer;
begin
  DM1.tSetor.IndexFieldNames := 'Codigo';
  DM1.tSetor.Filtered := False;
  DM1.tSetor.Filter   := 'ImpRelProducao = True';
  DM1.tSetor.Filtered := True;
  cdsSetor.EmptyDataSet;
  indice := 0;
  DM1.tSetor.First;
  while not DM1.tSetor.Eof do
  begin
    inc(indice);
    cdsSetor.Insert;
    cdsSetorIndice.AsInteger := indice;
    cdsSetorCodSetor.AsInteger := DM1.tSetorCodigo.AsInteger;
    cdsSetorNome.AsString := DM1.tSetorNome.AsString;
    cdsSetor.Post;
    DM1.tSetor.Next;
  end;
  qrRelProducao.Close;
  qrRelProducao.SQL.Clear;
  qrRelProducao.SQL.Add('select dbTalaoMov.CodSetor Setor, dbLote.CodFabrica, dbTalaoMov.DtSaida DataSaida, dbPedidoItem.CodProduto, ');
  qrRelProducao.SQL.Add('dbProduto.Referencia, dbPedidoItem.QtdPares ');
  qrRelProducao.SQL.Add('From "dbTalaoAuxiliar.db" dbTalaoMov ');
  qrRelProducao.SQL.Add('left join "dbLote.db" dbLote on (dbLote.Lote = dbTalaoMov.Lote) ');
  qrRelProducao.SQL.Add('left join "dbPedidoItem.db" dbPedidoItem on (dbPedidoItem.Pedido = dbLote.NroPedido and dbPedidoItem.Item = dbLote.ItemPed) ');
  qrRelProducao.SQL.Add('left join "dbProduto.db" dbProduto on (dbProduto.Codigo = dbPedidoItem.CodProduto) ');
  qrRelProducao.SQL.Add('left join "dbSetor.db" dbSetor on (dbSetor.Codigo = dbTalaoMov.CodSetor) ');
  qrRelProducao.SQL.Add('where DtSaida is not null ');
  qrRelProducao.SQL.Add(' and dbSetor.ImpRelProducao = True ');
  if RxDBLookupCombo1.KeyValue > 0 then
    qrRelProducao.SQL.Add(' and dbLote.CodFabrica = ' + IntToStr(RxDBLookupCombo1.KeyValue));
  qrRelProducao.SQL.Add(' and DtSaida between ' + QuotedStr(Copy(Dateedit1.Text,4,2)
                                  + '/' + Copy(Dateedit1.Text,1,2) + '/' + Copy(Dateedit1.Text,7,4)) + ' and '
                                  + QuotedStr(Copy(Dateedit2.Text,4,2)
                                  + '/' + Copy(Dateedit2.Text,1,2) + '/' + Copy(Dateedit2.Text,7,4)));
  qrRelProducao.SQL.Add('union ');
  qrRelProducao.SQL.Add('select dbTalaoMov.Setor, dbLote.CodFabrica, dbTalaoMov.DataSaida, dbPedidoItem.CodProduto, ');
  qrRelProducao.SQL.Add('dbProduto.Referencia, dbPedidoItem.QtdPares ');
  qrRelProducao.SQL.Add('From "dbTalaoMov.db" dbTalaoMov ');
  qrRelProducao.SQL.Add('left join "dbLote.db" dbLote on (dbLote.Lote = dbTalaoMov.Lote) ');
  qrRelProducao.SQL.Add('left join "dbPedidoItem.db" dbPedidoItem on (dbPedidoItem.Pedido = dbLote.NroPedido and dbPedidoItem.Item = dbLote.ItemPed) ');
  qrRelProducao.SQL.Add('left join "dbProduto.db" dbProduto on (dbProduto.Codigo = dbPedidoItem.CodProduto) ');
  qrRelProducao.SQL.Add('left join "dbSetor.db" dbSetor on (dbSetor.Codigo = dbTalaoMov.Setor) ');
  qrRelProducao.SQL.Add('where DataSaida is not null ');
  qrRelProducao.SQL.Add(' and dbSetor.ImpRelProducao = True ');
  if RxDBLookupCombo1.KeyValue > 0 then
    qrRelProducao.SQL.Add(' and dbLote.CodFabrica = ' + IntToStr(RxDBLookupCombo1.KeyValue));
  qrRelProducao.SQL.Add(' and DataSaida between ' + QuotedStr(Copy(Dateedit1.Text,4,2)
                                  + '/' + Copy(Dateedit1.Text,1,2) + '/' + Copy(Dateedit1.Text,7,4)) + ' and '
                                  + QuotedStr(Copy(Dateedit2.Text,4,2)
                                  + '/' + Copy(Dateedit2.Text,1,2) + '/' + Copy(Dateedit2.Text,7,4)));
  qrRelProducao.SQL.Add('Order By CodFabrica, DataSaida, Setor, Referencia');
  cdsRelProducao.EmptyDataSet;
  qrRelProducao.Open;
  qrRelProducao.First;
  while not (qrRelProducao.eof) do
  begin
    indSetor := 0;
    if cdsSetor.Locate('CodSetor',qrRelProducao.FieldByName('Setor').AsInteger,[locaseinsensitive]) then
      indSetor := cdsSetorIndice.AsInteger;
    if cdsRelProducao.Locate('CodFabrica;Data;Referencia',VarArrayOf([
                             qrRelProducao.FieldByName('CodFabrica').AsInteger,qrRelProducao.FieldByName('DataSaida').AsDateTime,
                             qrRelProducao.FieldByName('Referencia').AsString]),[locaseinsensitive]) then
      cdsRelProducao.Edit
    else
    begin
      cdsRelProducao.Insert;
      cdsRelProducaoCodFabrica.AsInteger := qrRelProducao.FieldByName('CodFabrica').AsInteger;
      cdsRelProducaoData.AsDateTime := qrRelProducao.FieldByName('DataSaida').AsDateTime;
      cdsRelProducaoReferencia.AsString := qrRelProducao.FieldByName('Referencia').AsString;
    end;
    cdsRelProducao.FieldByName('CodSetor' + IntToStr(indSetor)).AsInteger := cdsSetorCodSetor.AsInteger;
    cdsRelProducao.FieldByName('QtdPares' + IntToStr(indSetor)).AsInteger := cdsRelProducao.FieldByName('QtdPares' + IntToStr(indSetor)).AsInteger + qrRelProducao.FieldByName('QtdPares').AsInteger;
    cdsRelProducao.Post;
    qrRelProducao.Next;
  end;
  RLReport1.Preview;
  DM1.tSetor.Filtered := False;
end;

procedure TfRelProducao.BitBtn2Click(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
  DateEdit1.Clear;
  DateEdit2.Clear;
  RxDBLookupCombo1.SetFocus;  
end;

procedure TfRelProducao.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfRelProducao.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tFabrica.IndexFieldNames := 'Nome';
end;

procedure TfRelProducao.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tFabrica.IndexFieldNames := 'Codigo';
end;

end.

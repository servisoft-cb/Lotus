unit UConsMovSetor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, DB, Grids, DBGrids, SMDBGrid,
  DBTables, StdCtrls, Buttons, RxLookup, Mask, ToolEdit, ExtCtrls, DBClient, ComCtrls, RzTabs;

type
  TfConsMovSetor = class(TForm)
    qTalao: TQuery;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label3: TLabel;
    BitBtn3: TBitBtn;
    Bevel1: TBevel;
    qTalaoMI: TQuery;
    qTalaoCodProduto: TIntegerField;
    qTalaoSetor: TIntegerField;
    qTalaoQtdPar: TFloatField;
    qTalaoMICodProduto: TIntegerField;
    qTalaoMIQtdPar: TFloatField;
    qTalaoMISetor: TIntegerField;
    mConsulta: TClientDataSet;
    mConsultaCodSetor: TIntegerField;
    mConsultaNomeSetor: TStringField;
    mConsultaCodProduto: TIntegerField;
    mConsultaReferencia: TStringField;
    mConsultaNomeProduto: TStringField;
    mConsultaQtd: TFloatField;
    dsmConsulta: TDataSource;
    ProgressBar1: TProgressBar;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    TabSheet2: TRzTabSheet;
    qTalaoDet: TQuery;
    qTalaoMIDet: TQuery;
    qTalaoDetCodProduto: TIntegerField;
    qTalaoDetSetor: TIntegerField;
    qTalaoDetLote: TIntegerField;
    qTalaoDetTalao: TIntegerField;
    qTalaoDetDataEnt: TDateField;
    qTalaoDetHoraEnt: TTimeField;
    qTalaoDetDataSaida: TDateField;
    qTalaoDetHoraSaida: TTimeField;
    qTalaoDetQtdPar: TIntegerField;
    qTalaoDetCodCor: TIntegerField;
    qTalaoMIDetCodProduto: TIntegerField;
    qTalaoMIDetSetor: TIntegerField;
    qTalaoMIDetLote: TIntegerField;
    qTalaoMIDetTalao: TIntegerField;
    qTalaoMIDetDataEnt: TDateField;
    qTalaoMIDetHoraEnt: TTimeField;
    qTalaoMIDetDataSaida: TDateField;
    qTalaoMIDetHoraSaida: TTimeField;
    qTalaoMIDetCodCor: TIntegerField;
    qTalaoMIDetQtdPar: TIntegerField;
    SMDBGrid2: TSMDBGrid;
    mDetalhado: TClientDataSet;
    mDetalhadoLote: TIntegerField;
    mDetalhadoTalao: TIntegerField;
    mDetalhadoCodProduto: TIntegerField;
    mDetalhadoReferencia: TStringField;
    mDetalhadoNomeProduto: TStringField;
    mDetalhadoDataEntrada: TDateField;
    mDetalhadoHoraEntrada: TTimeField;
    mDetalhadoDataSaida: TDateField;
    mDetalhadoHoraSaida: TTimeField;
    mDetalhadoQtd: TFloatField;
    mDetalhadoTipo: TStringField;
    dsmDetalhado: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure mConsultaNewRecord(DataSet: TDataSet);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    procedure Monta_SQL;
    procedure Le_SQL;
    procedure Monta_SQLDet;
    procedure Le_SQLDet;
    procedure Grava_mConsulta(CodProduto,CodSetor, Qtd : Integer);
    procedure Grava_mDetalhado(Tipo : String);
  public
    { Public declarations }
  end;

var
  fConsMovSetor: TfConsMovSetor;

implementation

uses UDM1, URelMovSetor, StrUtils, URelMovSetorDet;

{$R *.dfm}

procedure TfConsMovSetor.Grava_mDetalhado(Tipo : String);
begin
  mDetalhado.Insert;
  if Tipo = 'I' then
    begin
      mDetalhadoLote.AsInteger       := qTalaoMIDetLote.AsInteger;
      mDetalhadoTalao.AsInteger      := qTalaoMIDetTalao.AsInteger;
      mDetalhadoCodProduto.AsInteger := qTalaoMIDetCodProduto.AsInteger;
      if DM1.tProduto.Locate('Codigo',qTalaoMIDetCodProduto.AsInteger,[loCaseInsensitive]) then
        begin
          mDetalhadoNomeProduto.AsString := DM1.tProdutoNome.AsString;
          mDetalhadoReferencia.AsString  := DM1.tProdutoReferencia.AsString;
        end;
      mDetalhadoDataEntrada.AsDateTime := qTalaoMIDetDataEnt.AsDateTime;
      mDetalhadoHoraEntrada.AsDateTime := qTalaoMIDetHoraEnt.AsDateTime;
      mDetalhadoDataSaida.AsDateTime   := qTalaoMIDetDataSaida.AsDateTime;
      mDetalhadoHoraEntrada.AsDateTime := qTalaoMIDetHoraEnt.AsDateTime;
      mDetalhadoQtd.AsFloat            := qTalaoMIDetQtdPar.AsFloat;
      mDetalhadoTipo.AsString          := 'Interno';
    end;

  if Tipo = 'E' then
    begin
      mDetalhadoLote.AsInteger       := qTalaoDetLote.AsInteger;
      mDetalhadoTalao.AsInteger      := qTalaoDetTalao.AsInteger;
      mDetalhadoCodProduto.AsInteger := qTalaoDetCodProduto.AsInteger;
      if DM1.tProduto.Locate('Codigo',qTalaoDetCodProduto.AsInteger,[loCaseInsensitive]) then
        begin
          mDetalhadoNomeProduto.AsString := DM1.tProdutoNome.AsString;
          mDetalhadoReferencia.AsString  := DM1.tProdutoReferencia.AsString;
        end;
      mDetalhadoDataEntrada.AsDateTime := qTalaoDetDataEnt.AsDateTime;
      mDetalhadoHoraEntrada.AsDateTime := qTalaoDetHoraEnt.AsDateTime;
      mDetalhadoDataSaida.AsDateTime   := qTalaoDetDataSaida.AsDateTime;
      mDetalhadoHoraEntrada.AsDateTime := qTalaoDetHoraEnt.AsDateTime;
      mDetalhadoQtd.AsFloat            := qTalaoDetQtdPar.AsFloat;
      mDetalhadoTipo.AsString          := 'Exportação';
    end;
  mDetalhado.Post;

end;

procedure TfConsMovSetor.Le_SQLDet;
begin
  mDetalhado.EmptyDataSet;
  ProgressBar1.Max      := qTalaoDet.RecordCount + qTalaoMIDet.RecordCount;
  ProgressBar1.Position := 0;

  qTalaoDet.First;
  while not qTalaoDet.Eof do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;
      Grava_mDetalhado('E');
      qTalaoDet.Next;
    end;

  qTalaoMIDet.First;
  while not qTalaoMIDet.Eof do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;
      Grava_mDetalhado('I');
      qTalaoMIDet.Next;
    end;

end;

procedure TfConsMovSetor.Monta_SQLDet;
begin
  qTalaoDet.Close;
  qTalaoDet.ParamByName('Setor').AsInteger := RxDBLookupCombo1.KeyValue;
  qTalaoDet.ParamByName('Data1').AsDate    := DateEdit1.Date;
  qTalaoDet.ParamByName('Data2').AsDate    := DateEdit2.Date;
  qTalaoDet.Open;

  qTalaoMIDet.Close;
  qTalaoMIDet.ParamByName('Setor').AsInteger := RxDBLookupCombo1.KeyValue;
  qTalaoMIDet.ParamByName('Data1').AsDate    := DateEdit1.Date;
  qTalaoMIDet.ParamByName('Data2').AsDate    := DateEdit2.Date;
  qTalaoMIDet.Open;
end;

procedure TfConsMovSetor.Grava_mConsulta(CodProduto,CodSetor, Qtd : Integer);
var
  vRef, vNome : String;
begin
  //*** Foi alterado para o bloco abaixo no dia 06/08/2008
  {if mConsulta.Locate('CodProduto;CodSetor',VarArrayOf([CodProduto,CodSetor]),[locaseinsensitive]) then
    mConsulta.Edit
  else
    begin
      mConsulta.Insert;
      mConsultaCodProduto.AsInteger := CodProduto;
      mConsultaCodSetor.AsInteger   := CodSetor;
      if DM1.tProduto.Locate('Codigo',CodProduto,[loCaseInsensitive]) then
        begin
          mConsultaNomeProduto.AsString := DM1.tProdutoNome.AsString;
          mConsultaReferencia.AsString  := DM1.tProdutoReferencia.AsString;
        end;
      if RxDBLookupCombo1.Text <> '' then
        mConsultaNomeSetor.AsString := RxDBLookupCombo1.Text
      else
      if DM1.tSetor.Locate('Codigo',CodSetor,[loCaseInsensitive]) then
        mConsultaNomeSetor.AsString := DM1.tSetorNome.AsString;
    end;
  mConsultaQtd.AsInteger := mConsultaQtd.AsInteger + Qtd;
  mConsulta.Post;}

  vRef  := '';
  vNome := '';
  if DM1.tProduto.Locate('Codigo',CodProduto,[loCaseInsensitive]) then
    begin
      vRef  := DM1.tProdutoReferencia.AsString;
      vNome := DM1.tProdutoNome.AsString;
    end;

  if mConsulta.Locate('Referencia;CodSetor',VarArrayOf([vRef,CodSetor]),[locaseinsensitive]) then
    mConsulta.Edit
  else
    begin
      mConsulta.Insert;
      mConsultaReferencia.AsString  := DM1.tProdutoReferencia.AsString;
      mConsultaNomeProduto.AsString := DM1.tProdutoNome.AsString;
      mConsultaCodSetor.AsInteger   := CodSetor;
      if RxDBLookupCombo1.Text <> '' then
        mConsultaNomeSetor.AsString := RxDBLookupCombo1.Text
      else
      if DM1.tSetor.Locate('Codigo',CodSetor,[loCaseInsensitive]) then
        mConsultaNomeSetor.AsString := DM1.tSetorNome.AsString;
    end;
  mConsultaQtd.AsInteger := mConsultaQtd.AsInteger + Qtd;
  mConsulta.Post;
end;

procedure TfConsMovSetor.Le_SQL;
begin
  mConsulta.EmptyDataSet;

  ProgressBar1.Max      := qTalao.RecordCount + qTalaoMI.RecordCount;
  ProgressBar1.Position := 0;

  qTalao.First;
  while not qTalao.Eof do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;
      Grava_mConsulta(qTalaoCodProduto.AsInteger,qTalaoSetor.AsInteger,qTalaoQtdPar.AsInteger);
      qTalao.Next;
    end;

  qTalaoMI.First;
  while not qTalaoMI.Eof do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;
      Grava_mConsulta(qTalaoMICodProduto.AsInteger,qTalaoMISetor.AsInteger,qTalaoMIQtdPar.AsInteger);
      qTalaoMI.Next;
    end;
end;

procedure TfConsMovSetor.Monta_SQL;
begin
  qTalao.Close;
  qTalao.ParamByName('Setor').AsInteger := RxDBLookupCombo1.KeyValue;
  qTalao.ParamByName('Data1').AsDate    := DateEdit1.Date;
  qTalao.ParamByName('Data2').AsDate    := DateEdit2.Date;
  qTalao.Open;

  qTalaoMI.Close;
  qTalaoMI.ParamByName('Setor').AsInteger := RxDBLookupCombo1.KeyValue;
  qTalaoMI.ParamByName('Data1').AsDate    := DateEdit1.Date;
  qTalaoMI.ParamByName('Data2').AsDate    := DateEdit2.Date;
  qTalaoMI.Open;                
end;

procedure TfConsMovSetor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tSetor.Close;
  DM1.tProduto.Close;
  qTalao.Close;
  qTalaoMI.Close;
  Action := Cafree;
end;

procedure TfConsMovSetor.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsMovSetor.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tSetor.IndexFieldNames := 'Nome';
end;

procedure TfConsMovSetor.FormShow(Sender: TObject);
begin
  DM1.tSetor.Open;
  DM1.tProduto.Open;
  RxDBLookupCombo1.KeyValue := 3;
end;

procedure TfConsMovSetor.BitBtn1Click(Sender: TObject);
begin
  if RxDBLookupCombo1.Text = '' then
    Raise Exception.Create('É obrigatório informar o setor!');
  if (DateEdit1.Date < 1) or (DateEdit2.Date < 1) then
    Raise Exception.Create('É obrigatório informar a data inicial e final!');

  if RzPageControl1.ActivePageIndex = 0 then
    begin
      Monta_SQL;
      Le_SQL;
    end
  else
    begin
      Monta_SQLDet;
      Le_SQLDet;
    end;
end;

procedure TfConsMovSetor.mConsultaNewRecord(DataSet: TDataSet);
begin
  mConsultaQtd.AsFloat := 0;
end;

procedure TfConsMovSetor.BitBtn3Click(Sender: TObject);
begin
  if RzPageControl1.ActivePageIndex = 0 then
    begin
      SMDBGrid1.DisableScroll;
      fRelMovSetor := TfRelMovSetor.Create(Self);
      fRelMovSetor.RLReport1.Preview;
      fRelMovSetor.RLReport1.Free;
      FreeAndNil(fRelMovSetor);
      SMDBGrid1.EnableScroll;
    end
  else
    begin
      SMDBGrid2.DisableScroll;
      fRelMovSetorDet := TfRelMovSetorDet.Create(Self);
      fRelMovSetorDet.RLReport1.Preview;
      fRelMovSetorDet.RLReport1.Free;
      FreeAndNil(fRelMovSetorDet);
      SMDBGrid2.EnableScroll;
    end;
end;

end.

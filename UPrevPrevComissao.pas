unit UPrevPrevComissao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Menus, DBTables, StdCtrls, Buttons, RxLookup, Mask, ToolEdit,
  RXCtrls, ExtCtrls, DBFilter;

type
  TfPrevPrevComissao = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    BitBtn2: TBitBtn;
    RxDBFilter1: TRxDBFilter;
    tCReceberParc: TTable;
    dsCReceberParc: TDataSource;
    tCReceberParcNumCReceber: TIntegerField;
    tCReceberParcParcCReceber: TIntegerField;
    tCReceberParcVlrParcCReceber: TFloatField;
    tCReceberParcDtVencCReceber: TDateField;
    tCReceberParcQuitParcCReceber: TBooleanField;
    tCReceberParcJurosParcCReceber: TFloatField;
    tCReceberParcDtPagParcCReceber: TDateField;
    tCReceberParcCodCli: TIntegerField;
    tCReceberParcNumNota: TIntegerField;
    tCReceberParcDesconto: TFloatField;
    tCReceberParcPgtoParcial: TFloatField;
    tCReceberParcRestParcela: TFloatField;
    tCReceberParcContaDupl: TSmallintField;
    tCReceberParcSelecionado: TBooleanField;
    tCReceberParcCodVendedor: TIntegerField;
    tCReceberParcBaixada: TBooleanField;
    tCReceberParcPercComissao: TFloatField;
    tCReceberParcVlrComissao: TFloatField;
    tCReceberParcPlanoContas: TIntegerField;
    tCReceberParcAgencia: TStringField;
    tCReceberParcTitPortador: TStringField;
    tCReceberParcCodTipoCobranca: TIntegerField;
    tCReceberParcDespesas: TFloatField;
    tCReceberParcAbatimentos: TFloatField;
    tCReceberParcCodConta: TIntegerField;
    tCReceberParcPgCartorio: TBooleanField;
    tCReceberParcDiasAtraso: TFloatField;
    tCReceberParcLetraCambio: TBooleanField;
    tCReceberParcNroLancExtComissao: TIntegerField;
    tCReceberParcJurosPagos: TFloatField;
    tCReceberParcCancelado: TBooleanField;
    tCReceberParcTitProtestado: TBooleanField;
    tCReceberParcDtGerado: TDateField;
    tCReceberParcTipoDoc: TStringField;
    tCReceberParcVlrDevolucao: TFloatField;
    tCReceberParcDuplicataImp: TBooleanField;
    tCReceberParclkCliente: TStringField;
    BitBtn1: TBitBtn;
    tCReceberParcPagarParteNaNota: TBooleanField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrevPrevComissao: TfPrevPrevComissao;

implementation

uses UDM1, URelPrevComissao;

{$R *.DFM}

procedure TfPrevPrevComissao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  RxDBFilter1.Active := False;
  DM1.tVendedor.Close;
  Dm1.tCReceber.Close;
  DM1.tCliente.Close;
  Action := Cafree;
end;

procedure TfPrevPrevComissao.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevPrevComissao.FormShow(Sender: TObject);
begin
  Dm1.tCReceber.Open;
  DM1.tVendedor.Open;
  DM1.tCliente.Open;
  RxDBFilter1.Active := True;
end;

procedure TfPrevPrevComissao.RxDBLookupCombo1Enter(Sender: TObject);
begin
  Dm1.tVendedor.IndexFieldNames := 'Nome';
end;

procedure TfPrevPrevComissao.BitBtn1Click(Sender: TObject);
begin
  if ((DateEdit1.Text <> '  /  /    ') and (DateEdit2.Text <> '  /  /    ')) and (DateEdit1.Date <= DateEdit2.Date) and (RxDBLookupCombo1.Text <> '')then
    begin
      tCReceberParc.Filtered := False;
      tCReceberParc.Filter   := 'CodVendedor = ''' +IntToStr(RxDBLookupCombo1.KeyValue)+ ''' and DtVencCReceber >= ''' +DateEdit1.Text+ ''' and DtVencCReceber <= ''' +DateEdit2.Text+''' and RestParcela > 0 and Cancelado = False';
      tCReceberParc.Filtered := True;
      fRelPrevComissao := TfRelPrevComissao.Create(self);
      fRelPrevComissao.RLReport1.Preview;
      fRelPrevComissao.RLReport1.Free;
    end
  else
    ShowMessage('Todos os campos devem estar preenchidos!');
end;

end.

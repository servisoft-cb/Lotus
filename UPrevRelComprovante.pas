unit UPrevRelComprovante;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, ToolEdit, Buttons, Grids, DBGrids,
  RXDBCtrl, Db, DBTables, DBFilter, RXCtrls, Menus, Printers, RxLookup;

type
  TfPrevRelComprovante = class(TForm)
    Panel1: TPanel;
    DateEdit2: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Bevel1: TBevel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DateEdit1: TDateEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    RxDBGrid1: TRxDBGrid;
    PopupMenu1: TPopupMenu;
    RxSpeedButton1: TRxSpeedButton;
    Imprimir1: TMenuItem;
    Visualisar1: TMenuItem;
    tNotaFiscal: TTable;
    dsNotaFiscal: TDataSource;
    tItensNotaFiscal: TTable;
    Label4: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    Edit2: TEdit;
    tNotaFiscalNumNota: TIntegerField;
    tNotaFiscalDtEmissao: TDateField;
    tNotaFiscalCodNatOper: TSmallintField;
    tNotaFiscalCodNatOper2: TSmallintField;
    tNotaFiscalCodNatOper3: TSmallintField;
    tNotaFiscalCodCli: TIntegerField;
    tNotaFiscalCondPgto: TStringField;
    tNotaFiscalCodVendedor: TIntegerField;
    tNotaFiscalCodVenda: TSmallintField;
    tNotaFiscalNumPedido: TIntegerField;
    tNotaFiscalBaseIcms: TFloatField;
    tNotaFiscalVlrIcms: TFloatField;
    tNotaFiscalVlrIpi: TFloatField;
    tNotaFiscalVlrTotalNota: TFloatField;
    tNotaFiscalVlrTotalItens: TFloatField;
    tNotaFiscalPercDesc: TFloatField;
    tNotaFiscalVlrTotalDesc: TFloatField;
    tNotaFiscalVlrFrete: TFloatField;
    tNotaFiscalVlrSeguro: TFloatField;
    tNotaFiscalOutrasDesp: TFloatField;
    tNotaFiscalQtd: TIntegerField;
    tNotaFiscalEspecie: TStringField;
    tNotaFiscalMarca: TStringField;
    tNotaFiscalNumero: TStringField;
    tNotaFiscalPesoBruto: TFloatField;
    tNotaFiscalPesoLiquido: TFloatField;
    tNotaFiscalPlaca: TStringField;
    tNotaFiscalUFPlaca: TStringField;
    tNotaFiscalEmitDest: TStringField;
    tNotaFiscalCodTransp: TIntegerField;
    tNotaFiscalObs: TMemoField;
    tNotaFiscalSaidaEntrada: TStringField;
    tNotaFiscalDuplImp: TBooleanField;
    tNotaFiscalCancelada: TBooleanField;
    tNotaFiscalDtSaidaEnt: TDateField;
    tNotaFiscalHoraSaida: TTimeField;
    tNotaFiscalTipoCobr: TStringField;
    tNotaFiscalBcoCobr: TIntegerField;
    tNotaFiscalImpressa: TBooleanField;
    tNotaFiscalLocalEntrega: TBooleanField;
    tNotaFiscalInss: TBooleanField;
    tNotaFiscalIrf: TBooleanField;
    tNotaFiscalVlrInss: TFloatField;
    tNotaFiscalVlrIrf: TFloatField;
    tNotaFiscalCustoPerc: TFloatField;
    tNotaFiscalCustoFinanc: TFloatField;
    tNotaFiscalPrazoPgto: TIntegerField;
    tNotaFiscalEntrada: TFloatField;
    tNotaFiscalPercComissao: TFloatField;
    tNotaFiscalDtEntr: TDateField;
    tNotaFiscalIcmsIpi: TBooleanField;
    tNotaFiscalPlanoContas: TIntegerField;
    tNotaFiscalSituacao: TIntegerField;
    tNotaFiscalDescDupl: TFloatField;
    tNotaFiscalNumNotaOrigem: TIntegerField;
    tNotaFiscalNumNotaDevol: TIntegerField;
    tNotaFiscalNroLancExtComissao: TIntegerField;
    tNotaFiscalTipoNota: TStringField;
    tNotaFiscalDescricaoDesc: TStringField;
    tNotaFiscalSuspensa: TBooleanField;
    tNotaFiscalExtComDif: TIntegerField;
    tNotaFiscalDescTransf: TMemoField;
    tNotaFiscalExportacao: TBooleanField;
    tNotaFiscalObsAux: TMemoField;
    tNotaFiscalPercIssqn: TFloatField;
    tNotaFiscalVlrMObra: TFloatField;
    tNotaFiscalVlrIssqn: TFloatField;
    tNotaFiscalNumNotaDevFor: TIntegerField;
    tNotaFiscalCodForn: TIntegerField;
    tNotaFiscallkCliente: TStringField;
    tItensNotaFiscalNumNota: TIntegerField;
    tItensNotaFiscalItem: TSmallintField;
    tItensNotaFiscalCodProduto: TIntegerField;
    tItensNotaFiscalCodCor: TIntegerField;
    tNotaFiscallkTransp: TStringField;
    tNotaFiscalNumSeq: TIntegerField;
    tNotaFiscalFilial: TIntegerField;
    tNotaFiscalPedidoCliente: TStringField;
    tNotaFiscalPercBaseComissao: TFloatField;
    tNotaFiscalPedidoRepresentante: TStringField;
    tItensNotaFiscalNumSeq: TIntegerField;
    tItensNotaFiscalFilial: TIntegerField;
    tItensNotaFiscalQtd: TFloatField;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBLookupComboBox1DropDown(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure Visualisar1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrevRelComprovante: TfPrevRelComprovante;

implementation

Uses UDM1, URelComprovante, URelComprovante2;

{$R *.DFM}

procedure TfPrevRelComprovante.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevRelComprovante.BitBtn2Click(Sender: TObject);
begin
  DateEdit1.Clear;
  DateEdit2.Clear;
  DBLookupComboBox1.KeyValue := 0;
  Edit1.Clear;
  Edit2.Clear;
  tNotaFiscal.Filtered := False;
end;

procedure TfPrevRelComprovante.DBLookupComboBox1DropDown(Sender: TObject);
begin
  DM1.tTransp.IndexFieldNames := 'Nome';
end;

procedure TfPrevRelComprovante.SpeedButton1Click(Sender: TObject);
begin
//  try
    if (DateEdit1.Text <> '  /  /    ') and (DateEdit2.Text <> '  /  /    ') and (DBLookupComboBox1.Text <> '') and (Edit1.Text = '') and (Edit2.Text = '') then
      begin
        tNotaFiscal.Filtered := False;
        tNotaFiscal.Filter   := 'DtEmissao >= '''+DateEdit1.Text+''' and DtEmissao <= '''+DateEdit2.Text+''' and CodTransp = '''+IntToStr(DBLookupComboBox1.KeyValue)+'''';
        tNotaFiscal.Filtered := True;
      end
    else
    if (DateEdit1.Text <> '  /  /    ') and (DateEdit2.Text <> '  /  /    ') and (DBLookupComboBox1.Text = '') and (Edit1.Text = '') and (Edit2.Text = '') then
      begin
        tNotaFiscal.Filtered := False;
        tNotaFiscal.Filter   := 'DtEmissao >= '''+DateEdit1.Text+''' and DtEmissao <= '''+DateEdit2.Text+'''';
        tNotaFiscal.Filtered := True;
      end
    else
    if (DateEdit1.Text <> '  /  /    ') and (DateEdit2.Text <> '  /  /    ') and (DBLookupComboBox1.Text <> '') and (Edit1.Text <> '') and (Edit2.Text <> '') then
      begin
        tNotaFiscal.Filtered := False;
        tNotaFiscal.Filter   := 'DtEmissao >= '''+DateEdit1.Text+''' and DtEmissao <= '''+DateEdit2.Text+''' and CodTransp = '''+IntToStr(DBLookupComboBox1.KeyValue)+''' and NumNota >= '''+Edit1.Text+''' and NumNota <= '''+Edit2.Text+'''';
        tNotaFiscal.Filtered := True;
      end
    else
    if (DateEdit1.Text <> '  /  /    ') and (DateEdit2.Text <> '  /  /    ') and (DBLookupComboBox1.Text = '') and (Edit1.Text <> '') and (Edit2.Text <> '') then
      begin
        tNotaFiscal.Filtered := False;
        tNotaFiscal.Filter   := 'DtEmissao >= '''+DateEdit1.Text+''' and DtEmissao <= '''+DateEdit2.Text+''' and NumNota >= '''+Edit1.Text+''' and NumNota <= '''+Edit2.Text+'''';
        tNotaFiscal.Filtered := True;
      end
    else
    if (DateEdit1.Text = '  /  /    ') and (DateEdit2.Text = '  /  /    ') and (DBLookupComboBox1.Text <> '') and (Edit1.Text <> '') and (Edit2.Text <> '') then
      begin
        tNotaFiscal.Filtered := False;
        tNotaFiscal.Filter   := 'CodTransp = '''+IntToStr(DBLookupComboBox1.KeyValue)+''' and NumNota >= '''+Edit1.Text+''' and NumNota <= '''+Edit2.Text+'''';
        tNotaFiscal.Filtered := True;
      end
    else
    if (DateEdit1.Text = '  /  /    ') and (DateEdit2.Text = '  /  /    ') and (DBLookupComboBox1.Text = '') and (Edit1.Text <> '') and (Edit2.Text <> '') then
      begin
        tNotaFiscal.Filtered := False;
        tNotaFiscal.Filter   := 'NumNota >= '''+Edit1.Text+''' and NumNota <= '''+Edit2.Text+'''';
        tNotaFiscal.Filtered := True;
      end
    else
    if (DateEdit1.Text = '  /  /    ') and (DateEdit2.Text = '  /  /    ') and (DBLookupComboBox1.Text <> '') and (Edit1.Text = '') and (Edit2.Text = '') then
      begin
        tNotaFiscal.Filtered := False;
        tNotaFiscal.Filter   := 'CodTransp = '''+IntToStr(DBLookupComboBox1.KeyValue)+'''';
        tNotaFiscal.Filtered := True;
      end
    else
      begin
        ShowMessage('Devem ser escolhidos "Datas" e/ou "Nºs. Notas Fiscais" e/ou "Transportadora" p/ executar esta consulta!');
        DateEdit1.SetFocus;
      end;
end;

procedure TfPrevRelComprovante.SpeedButton2Click(Sender: TObject);
begin
  tNotaFiscal.Filtered := False;
end;

procedure TfPrevRelComprovante.Imprimir1Click(Sender: TObject);
begin
  try
    {fRelComprovante := TfRelComprovante.Create(Self);
    fRelComprovante.QuickRep1.Print;
    fRelComprovante.QuickRep1.Free;}
    fRelComprovante2 := TfRelComprovante2.Create(Self);
    fRelComprovante2.RLReport1.Print;
    fRelComprovante2.RLReport1.Free;
    tNotaFiscal.Filtered := False;
  except
    ShowMessage('Deve haver um Período e uma Transportadora selecionada!');
  end;
end;

procedure TfPrevRelComprovante.Visualisar1Click(Sender: TObject);
begin
  try
    {fRelComprovante := TfRelComprovante.Create(Self);
    fRelComprovante.QuickRep1.Preview;
    fRelComprovante.QuickRep1.Free;}
    fRelComprovante2 := TfRelComprovante2.Create(Self);
    fRelComprovante2.RLReport1.Preview;
    fRelComprovante2.RLReport1.Free;
    tNotaFiscal.Filtered := False;
  except
    ShowMessage('Deve haver um Período e uma Transportadora selecionada!');
  end;
end;

procedure TfPrevRelComprovante.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

end.

unit UComissaoVend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, db,
  Grids, DBGrids, ExtCtrls, StdCtrls, ALed, RXDBCtrl, RXLookup, CurrEdit,
  Mask, ToolEdit, Buttons, DBTables;

type
  TfComissaoVend = class(TForm)
    tExtComissaoIns: TTable;
    tExtComissaoInsNroLancamento: TIntegerField;
    tExtComissaoInsCodVendedor: TIntegerField;
    tExtComissaoInsDtReferencia: TDateField;
    tExtComissaoInsNroDoc: TIntegerField;
    tExtComissaoInsParcDoc: TIntegerField;
    tExtComissaoInsCodCliente: TIntegerField;
    tExtComissaoInsFuncao: TStringField;
    tExtComissaoInsVlrBase: TFloatField;
    tExtComissaoInsPercDescDupl: TFloatField;
    tExtComissaoInsPercComissao: TFloatField;
    tExtComissaoInsVlrComissao: TFloatField;
    tExtComissaoInsTipo: TStringField;
    tExtComissaoInsSuspensa: TBooleanField;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    DateEdit1: TDateEdit;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    CurrencyEdit6: TCurrencyEdit;
    BitBtn2: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    BitBtn1: TBitBtn;
    ComboBox1: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure CurrencyEdit5Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vNumLancComissao : Integer;
    vTipoComissao    : String;
  end;

var
  fComissaoVend: TfComissaoVend;

implementation

uses UDM1;

{$R *.DFM}

procedure TfComissaoVend.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      DM1.tExtComissao.Close;
      DM1.tVendedor.Close;
      DM1.tCliente.Close;
    end;
  Action := caFree;
end;

procedure TfComissaoVend.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

procedure TfComissaoVend.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfComissaoVend.BitBtn2Click(Sender: TObject);
begin
  if ComboBox1.ItemIndex < 0 then
  begin
    ShowMessage('Função não foi informada!');
    exit;
  end;
  if DateEdit1.Date < 10 then
  begin
    ShowMessage('Data da comissão não foi informada!');
    exit;
  end;
  if CurrencyEdit6.Value <= 0 then
  begin
    ShowMessage('Valor da comissão não foi informado!');
    exit;
  end;
  if RxDBLookupCombo1.Text = '' then
  begin
    ShowMessage('Vendedor não foi informado!');
    exit;
  end;

  DM1.tVendedor.Locate('Codigo',RxDBLookupCombo1.KeyValue,[loCaseInsensitive]);
  if DM1.tVendedorDtEncerramentoCom.AsDateTime >= DateEdit1.Date then
  begin
    ShowMessage('Comissão encerrada na data ' + DM1.tVendedorDtEncerramentoCom.AsString + '!');
    exit;
  end;

  if vNumLancComissao > 0 then
  begin
    DM1.tExtComissao.IndexFieldNames := 'NroLancamento';
    if not DM1.tExtComissao.FindKey([vNumLancComissao]) then
    begin
      ShowMessage('Comissão não encontrada!');
      exit;
    end
    else
      DM1.tExtComissao.Edit;
  end
  else
  begin
    tExtComissaoIns.Refresh;
    tExtComissaoIns.Last;
    DM1.tExtComissao.Insert;
    DM1.tExtComissaoNroLancamento.AsInteger := tExtComissaoInsNroLancamento.AsInteger + 1;
    DM1.tExtComissaoCodVendedor.AsInteger   := RxDBLookupCombo1.KeyValue;
  end;


  if RxDBLookupCombo2.Text <> '' then
    DM1.tExtComissaoCodCliente.AsInteger    := RxDBLookupCombo2.KeyValue;
  DM1.tExtComissaoDtReferencia.AsString   := DateEdit1.Text;
  if CurrencyEdit1.Text = '' then
    DM1.tExtComissaoNroDoc.AsInteger      :=  0
  else
    DM1.tExtComissaoNroDoc.AsInteger      := StrToInt(CurrencyEdit1.Text);
  if CurrencyEdit2.Text = '' then
    DM1.tExtComissaoParcDoc.AsInteger     :=  0
  else
    DM1.tExtComissaoParcDoc.AsInteger     :=  StrToInt(CurrencyEdit2.Text);
  case ComboBox1.ItemIndex of
    0 : DM1.tExtComissaoFuncao.AsString   :=  'E';
    1 : DM1.tExtComissaoFuncao.AsString   :=  'S';
    2 : DM1.tExtComissaoFuncao.AsString   :=  'D';
  end;
  DM1.tExtComissaoPercComissao.AsFloat  :=  CurrencyEdit4.Value;
  DM1.tExtComissaoVlrBase.AsFloat       :=  CurrencyEdit5.Value;
  DM1.tExtComissaoVlrComissao.AsFloat   :=  CurrencyEdit6.Value;
  if vTipoComissao <> '' then
    DM1.tExtComissaoTipo.AsString         :=  vTipoComissao
  else
    DM1.tExtComissaoTipo.AsString         :=  'M';
  DM1.tExtComissao.Post;
  DM1.tExtComissao.Refresh;
  Close;
end;

procedure TfComissaoVend.CurrencyEdit5Exit(Sender: TObject);
var
vValorBase, vValorCom : Currency;
begin
  if CurrencyEdit4.Value > 0 then
    begin
      vValorBase := CurrencyEdit5.Value;
      vValorCom  := (vValorBase * CurrencyEdit4.Value) / 100;
      CurrencyEdit6.Value := vValorCom;
    end;
end;

procedure TfComissaoVend.FormShow(Sender: TObject);
begin
  DM1.tExtComissao.Open;
  DM1.tVendedor.Open;
  DM1.tCliente.Open;
  DM1.tExtComissao.IndexFieldNames := 'NroLancamento';
  vTipoComissao := '';
end;

procedure TfComissaoVend.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Nome';
end;

end.

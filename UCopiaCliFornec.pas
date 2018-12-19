unit UCopiaCliFornec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, RxLookup, StdCtrls, Buttons, DB;

type
  TfCopiaCliFornec = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCopiaCliFornec: TfCopiaCliFornec;

implementation

uses UDM1, UDM2, UFornecedores;

{$R *.DFM}

procedure TfCopiaCliFornec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM1.tCliente.Close;
  Action := Cafree;
end;

procedure TfCopiaCliFornec.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

procedure TfCopiaCliFornec.RxDBLookupCombo1Exit(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
    RxDBLookupCombo2.KeyValue := RxDBLookupCombo1.KeyValue;
end;

procedure TfCopiaCliFornec.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Fantasia';
end;

procedure TfCopiaCliFornec.RxDBLookupCombo2Exit(Sender: TObject);
begin
  if RxDBLookupCombo2.Text <> '' then
    RxDBLookupCombo1.KeyValue := RxDBLookupCombo2.KeyValue;
end;

procedure TfCopiaCliFornec.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfCopiaCliFornec.BitBtn1Click(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
  begin
   if (fFornecedores.tFornecedoresIns.Locate('CGC',DM1.tClienteCgcCpf.AsString,[loCaseInsensitive])) then
   begin
     ShowMessage('CNPJ/CPF já cadastro no fornecedor ' + fFornecedores.tFornecedoresInsNomeForn.AsString);
     exit;
   end;

    Screen.Cursor              := crHourGlass;
    DM1.tCliente.Filtered      := False;
    DM1.tCliente.Filter        := 'Codigo = '''+IntToStr(RxDBLookupCombo1.KeyValue)+'''';
    DM1.tCliente.Filtered      := True;
    DM1.tFornecedoresNomeForn.AsString := DM1.tClienteNome.AsString;
    DM1.tFornecedoresFantasia.AsString := DM1.tClienteFantasia.AsString;
    DM1.tFornecedoresEndForn.AsString  := DM1.tClienteEndereco.AsString;
    DM1.tFornecedoresNumEnd.AsString   := DM1.tClienteNumEnd.AsString;
    DM1.tFornecedoresBairroForn.AsString  := DM1.tClienteBairro.AsString;
    DM1.tFornecedoresCEPForn.AsString     := DM1.tClienteCep.AsString;
    DM1.tFornecedoresCodCidade.AsInteger  := DM1.tClienteCodCidade.AsInteger;
    DM1.tFornecedoresEstadoForn.AsString  := DM1.tClienteUf.AsString;
    DM1.tFornecedoresTel1Forn.AsString    := DM1.tClienteTelefone.AsString;
    DM1.tFornecedoresTel2Forn.AsString    := DM1.tClienteTelefone2.AsString;
    DM1.tFornecedoresFaxForn.AsString     := DM1.tClienteFax.AsString;
    DM1.tFornecedoresContatoForn.AsString := DM1.tClienteContato.AsString;
    DM1.tFornecedoresFornecedorOutros.AsString := 'F';
    DM1.tFornecedoresCGC.AsString         := DM1.tClienteCgcCpf.AsString;
    DM1.tFornecedoresInsc.AsString        := DM1.tClienteInscrEst.AsString;
    DM1.tFornecedoresPessoa.AsString      := DM1.tClientePessoa.AsString;
    DM1.tFornecedoresObsForn.AsString     := DM1.tClienteObs.AsString;
    DM1.tFornecedoresCliente.AsBoolean    := True;
    //3.10   21/03/2015
    DM1.tFornecedoresTIPO_CONSUMIDOR.AsInteger   := DM1.tClienteTipo_Consumidor.AsInteger;
    DM1.tFornecedoresTIPO_CONTRIBUINTE.AsInteger := DM1.tClienteTIPO_CONTRIBUINTE.AsInteger;
    DM1.tCliente.Filtered                        := False;
    Screen.Cursor                                := crDefault;
    Close;
  end
  else
  begin
    ShowMessage('Deve ser selecionado um Cliente p/ poder efetuar a cópia!');
    RxDBLookupCombo1.SetFocus;
  end;
end;

procedure TfCopiaCliFornec.FormShow(Sender: TObject);
begin
  DM1.tCliente.Open;
end;

end.

unit UCopiaFornec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, RxLookup, StdCtrls, Buttons;

type
  TfCopiaFornec = class(TForm)
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
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCopiaFornec: TfCopiaFornec;

implementation

uses UDM1, UDM2, UAgendaTelef;

{$R *.DFM}

procedure TfCopiaFornec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfCopiaFornec.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tFornecedores.IndexFieldNames := 'NomeForn';
end;

procedure TfCopiaFornec.RxDBLookupCombo1Exit(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
    RxDBLookupCombo2.KeyValue := RxDBLookupCombo1.KeyValue;
end;

procedure TfCopiaFornec.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tFornecedores.IndexFieldNames := 'Fantasia';
end;

procedure TfCopiaFornec.RxDBLookupCombo2Exit(Sender: TObject);
begin
  if RxDBLookupCombo2.Text <> '' then
    RxDBLookupCombo1.KeyValue := RxDBLookupCombo2.KeyValue;
end;

procedure TfCopiaFornec.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfCopiaFornec.BitBtn1Click(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
  begin
    Screen.Cursor                   := crHourGlass;
    DM1.tFornecedores.Filtered      := False;
    DM1.tFornecedores.Filter        := 'CodForn = '''+IntToStr(RxDBLookupCombo1.KeyValue)+'''';
    DM1.tFornecedores.Filtered      := True;
    DM1.tClienteNome.AsString       := DM1.tFornecedoresNomeForn.AsString;
    DM1.tClienteFantasia.AsString   := DM1.tFornecedoresFantasia.AsString;
    DM1.tClienteEndereco.AsString   := DM1.tFornecedoresEndForn.AsString;
    DM1.tClienteBairro.AsString     := DM1.tFornecedoresBairroForn.AsString;
    DM1.tClienteCep.AsString        := DM1.tFornecedoresCEPForn.AsString;
    DM1.tClienteCodCidade.AsInteger := DM1.tFornecedoresCodCidade.AsInteger;
    DM1.tClienteUf.AsString         := DM1.tFornecedoresEstadoForn.AsString;
    DM1.tClienteTelefone.AsString   := DM1.tFornecedoresTel1Forn.AsString;
    DM1.tClienteTelefone2.AsString  := DM1.tFornecedoresTel2Forn.AsString;
    DM1.tClienteFax.AsString        := DM1.tFornecedoresFaxForn.AsString;
    DM1.tClienteContato.AsString    := DM1.tFornecedoresContatoForn.AsString;
    DM1.tClientePessoa.AsString     := 'J';
    DM1.tClienteCgcCpf.AsString     := DM1.tFornecedoresCGC.AsString;
    DM1.tClienteInscrEst.AsString   := DM1.tFornecedoresInsc.AsString;
    DM1.tClienteObs.AsString        := DM1.tFornecedoresObsForn.AsString;
    DM1.tClienteIDPais.AsInteger    := DM1.tFornecedoresIDPais.AsInteger;
    //3.10   21/03/2015
    DM1.tClienteTipo_Consumidor.AsInteger   := DM1.tFornecedoresTIPO_CONSUMIDOR.AsInteger;
    DM1.tClienteTIPO_CONTRIBUINTE.AsInteger := DM1.tFornecedoresTIPO_CONTRIBUINTE.AsInteger;
    DM1.tFornecedores.Filtered              := False;
    Screen.Cursor                           := crDefault;
    Close;
  end
  else
    begin
      ShowMessage('Deve ser selecionado um fornecedor p/ poder efetuar a cópia!');
      RxDBLookupCombo1.SetFocus;
    end;
end;

procedure TfCopiaFornec.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

procedure TfCopiaFornec.FormShow(Sender: TObject);
begin
  if not DM1.tFornecedores.Active then
    dm1.tFornecedores.Open;
end;

end.

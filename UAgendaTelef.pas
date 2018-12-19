unit UAgendaTelef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, ComCtrls, RxLookup, Db, DBTables, DBCtrls,
  DBClient;

type
  TfAgendaTelef = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    qCliente: TQuery;
    qsCliente: TDataSource;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    Label10: TLabel;
    SpeedButton2: TSpeedButton;
    Bevel2: TBevel;
    Label11: TLabel;
    DBText9: TDBText;
    Label12: TLabel;
    DBText10: TDBText;
    Label13: TLabel;
    DBText11: TDBText;
    Label14: TLabel;
    DBText12: TDBText;
    Label15: TLabel;
    DBText13: TDBText;
    Label16: TLabel;
    DBText14: TDBText;
    RxDBLookupCombo2: TRxDBLookupCombo;
    qFornecedores: TQuery;
    qsFornecedores: TDataSource;
    Label20: TLabel;
    DBText18: TDBText;
    TabSheet3: TTabSheet;
    Panel4: TPanel;
    Label21: TLabel;
    SpeedButton3: TSpeedButton;
    Bevel3: TBevel;
    Label22: TLabel;
    DBText19: TDBText;
    Label23: TLabel;
    DBText20: TDBText;
    Label24: TLabel;
    DBText21: TDBText;
    Label25: TLabel;
    DBText22: TDBText;
    Label30: TLabel;
    DBText27: TDBText;
    RxDBLookupCombo3: TRxDBLookupCombo;
    qTransp: TQuery;
    Panel2: TPanel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Bevel1: TBevel;
    Label2: TLabel;
    DBText1: TDBText;
    Label3: TLabel;
    DBText2: TDBText;
    Label4: TLabel;
    DBText3: TDBText;
    Label5: TLabel;
    DBText4: TDBText;
    Label6: TLabel;
    DBText5: TDBText;
    Label7: TLabel;
    DBText6: TDBText;
    Label8: TLabel;
    DBText7: TDBText;
    RxDBLookupCombo1: TRxDBLookupCombo;
    qClienteCodigo: TIntegerField;
    qClienteNome: TStringField;
    qClienteTelefone: TStringField;
    qClienteTelefone2: TStringField;
    qClienteFax: TStringField;
    qClienteContato: TStringField;
    qClienteFantasia: TStringField;
    qFornecedoresCodForn: TIntegerField;
    qFornecedoresNomeForn: TStringField;
    qFornecedoresTel1Forn: TStringField;
    qFornecedoresTel2Forn: TStringField;
    qFornecedoresFaxForn: TStringField;
    qFornecedoresContatoForn: TStringField;
    qFornecedoresFantasia: TStringField;
    qTranspNome: TStringField;
    qTranspCodigo: TIntegerField;
    qTranspFone: TStringField;
    qTranspFax: TStringField;
    qTranspContato: TStringField;
    qsTransp: TDataSource;
    TabSheet4: TTabSheet;
    qVendedores: TQuery;
    Panel5: TPanel;
    Label9: TLabel;
    SpeedButton4: TSpeedButton;
    Bevel4: TBevel;
    Label17: TLabel;
    DBText8: TDBText;
    Label18: TLabel;
    DBText15: TDBText;
    Label19: TLabel;
    DBText16: TDBText;
    Label26: TLabel;
    DBText17: TDBText;
    Label27: TLabel;
    DBText23: TDBText;
    RxDBLookupCombo4: TRxDBLookupCombo;
    qsVendedores: TDataSource;
    qVendedoresCodigo: TIntegerField;
    qVendedoresNome: TStringField;
    qVendedoresFone: TStringField;
    qVendedoresFax: TStringField;
    qVendedoresContato: TStringField;
    Label28: TLabel;
    DBText24: TDBText;
    qFornecedoresEmail: TStringField;
    TabSheet5: TTabSheet;
    Panel6: TPanel;
    Label29: TLabel;
    SpeedButton5: TSpeedButton;
    Bevel5: TBevel;
    Label31: TLabel;
    DBText25: TDBText;
    Label32: TLabel;
    DBText26: TDBText;
    Label33: TLabel;
    DBText28: TDBText;
    Label34: TLabel;
    DBText29: TDBText;
    Label35: TLabel;
    DBText30: TDBText;
    Label36: TLabel;
    DBText31: TDBText;
    Label38: TLabel;
    DBText33: TDBText;
    RxDBLookupCombo5: TRxDBLookupCombo;
    qOutros: TQuery;
    qsOutros: TDataSource;
    Label37: TLabel;
    DBText32: TDBText;
    Label39: TLabel;
    DBText34: TDBText;
    qOutrosCodigo: TIntegerField;
    qOutrosNome: TStringField;
    qOutrosContato: TStringField;
    qOutrosTelefone1: TStringField;
    qOutrosTelefone2: TStringField;
    qOutrosFax: TStringField;
    qOutrosEmail: TStringField;
    qOutrosContato2: TStringField;
    qOutrosContato3: TStringField;
    Panel7: TPanel;
    BitBtn1: TBitBtn;
    Button1: TButton;
    GroupBox1: TGroupBox;
    ckCliente: TCheckBox;
    ckFornecedor: TCheckBox;
    ckTransportadora: TCheckBox;
    ckVendedor: TCheckBox;
    ckOutros: TCheckBox;
    RadioGroup1: TRadioGroup;
    mAgenda: TClientDataSet;
    mAgendaCodigo: TIntegerField;
    mAgendaNome: TStringField;
    mAgendaFax: TStringField;
    dsmAgenda: TDataSource;
    mAgendaControle: TIntegerField;
    mAgendaFone: TStringField;
    mAgendaContato: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure Gravar_Cliente;
    procedure Gravar_Fornecedor;
    procedure Gravar_Transportadora;
    procedure Gravar_Vendedor;
    procedure Gravar_Outros;

    function Existe_Registro(Nome : String) : Boolean;

  public
    { Public declarations }
  end;

var
  fAgendaTelef: TfAgendaTelef;

implementation

uses UDM1, UCliente, UFornecedores, UTransp, UVendedor, UOutros,
  URelAgendaTelef;

{$R *.DFM}

procedure TfAgendaTelef.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      DM1.tOutros.Close;
      DM1.tCliente.Close;
      DM1.tFornecedores.Close;
      DM1.tTransp.Close;
      DM1.tVendedor.Close;
    end;
  Action := Cafree;
end;

procedure TfAgendaTelef.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfAgendaTelef.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioClientes.AsBoolean then
    begin
      DM1.tCliente.IndexFieldNames := 'Codigo';
      DM1.tCliente.FindKey([qClienteCodigo.AsInteger]);
      fCliente := TfCliente.Create(Self);
      fCliente.ShowModal;
      qCliente.Active := False;
      qCliente.Active := True;
      qCliente.Locate('Codigo',DM1.tClienteCodigo.AsInteger,[loCaseInsensitive]);
    end
  else
    ShowMessage('Usuário '+ DM1.tUsuarioUsuario.AsString+ ' não está autorizado a abrir este formulário!');
end;

procedure TfAgendaTelef.SpeedButton2Click(Sender: TObject);
var
  vNumero : Integer;
begin
  if DM1.tUsuarioFornecedores.AsBoolean then
    begin
      DM1.tFornecedores.IndexFieldNames := 'CodForn';
      DM1.tFornecedores.FindKey([qFornecedoresCodForn.AsInteger]);
      vNumero       := qFornecedoresCodForn.AsInteger;
      fFornecedores := TfFornecedores.Create(Self);
      fFornecedores.ShowModal;
      qFornecedores.Active := False;
      qFornecedores.Active := True;
      qFornecedores.Locate('CodForn',vNumero,[loCaseInsensitive]);
    end
  else
    ShowMessage('Usuário '+ DM1.tUsuarioUsuario.AsString+ ' não está autorizado a abrir este formulário!');
end;

procedure TfAgendaTelef.SpeedButton3Click(Sender: TObject);
var
  vNumero : Integer;
begin
  if DM1.tUsuarioTransp.AsBoolean then
    begin
      DM1.tTransp.IndexFieldNames := 'Codigo';
      DM1.tTransp.FindKey([qTranspCodigo.AsInteger]);
      vNumero := qTranspCodigo.AsInteger;
      fTransp := TfTransp.Create(Self);
      fTransp.ShowModal;
      qTransp.Active := False;
      qTransp.Active := True;
      qTransp.Locate('Codigo',vNumero,[loCaseInsensitive]);
    end
  else
    ShowMessage('Usuário '+ DM1.tUsuarioUsuario.AsString+ ' não está autorizado a abrir este formulário!');
end;

procedure TfAgendaTelef.SpeedButton4Click(Sender: TObject);
var
  vNumero : Integer;
begin
  if DM1.tUsuarioVendedor.AsBoolean then
    begin
      DM1.tVendedor.IndexFieldNames := 'Codigo';
      DM1.tVendedor.FindKey([qVendedoresCodigo.AsInteger]);
      vNumero   := qVendedoresCodigo.AsInteger;
      fVendedor := TfVendedor.Create(Self);
      fVendedor.ShowModal;
      qVendedores.Active := False;
      qVendedores.Active := True;
      qVendedores.Locate('Codigo',vNumero,[loCaseInsensitive]);
    end
  else
    ShowMessage('Usuário '+ DM1.tUsuarioUsuario.AsString+ ' não está autorizado a abrir este formulário!');
end;

procedure TfAgendaTelef.SpeedButton5Click(Sender: TObject);
var
  vNumero : Integer;
begin
  DM1.tOutros.IndexFieldNames := 'Codigo';
  DM1.tOutros.FindKey([qOutrosCodigo.AsInteger]);
  vNumero := qOutrosCodigo.AsInteger;
  fOutros := TfOutros.Create(Self);
  fOutros.ShowModal;
  qOutros.Active := False;
  qOutros.Active := True;
  qOutros.Locate('Codigo',vNumero,[loCaseInsensitive]);
end;

procedure TfAgendaTelef.TabSheet1Show(Sender: TObject);
begin
  qTransp.Close;
  qFornecedores.Close;
  qVendedores.Close;
  qOutros.Close;
  qCliente.Open;
end;

procedure TfAgendaTelef.TabSheet2Show(Sender: TObject);
begin
  qTransp.Close;
  qFornecedores.Open;
  qVendedores.Close;
  qOutros.Close;
  qCliente.Close;
end;

procedure TfAgendaTelef.TabSheet3Show(Sender: TObject);
begin
  qTransp.Open;
  qFornecedores.Close;
  qVendedores.Close;
  qOutros.Close;
  qCliente.Close;
end;

procedure TfAgendaTelef.TabSheet4Show(Sender: TObject);
begin
  qTransp.Close;
  qFornecedores.Close;
  qVendedores.Open;
  qOutros.Close;
  qCliente.Close;
end;

procedure TfAgendaTelef.TabSheet5Show(Sender: TObject);
begin
  qTransp.Close;
  qFornecedores.Close;
  qVendedores.Close;
  qOutros.Open;
  qCliente.Close;
end;

procedure TfAgendaTelef.FormShow(Sender: TObject);
begin
  DM1.tOutros.Open;
  DM1.tCliente.Open;
  DM1.tFornecedores.Open;
  DM1.tTransp.Open;
  DM1.tVendedor.Open;
end;

procedure TfAgendaTelef.Button1Click(Sender: TObject);
begin
  mAgenda.EmptyDataSet;
  if ckFornecedor.Checked then
    Gravar_Fornecedor;
  if ckCliente.Checked then
    Gravar_Cliente;
  if ckTransportadora.Checked then
    Gravar_Transportadora;
  if ckVendedor.Checked then
    Gravar_Vendedor;
  if ckOutros.Checked then
    Gravar_Outros;

  fRelAgendaTelef := TfRelAgendaTelef.Create(Self);
  fRelAgendaTelef.RLReport1.Preview;
  FreeAndNil(fRelAgendaTelef);
end;

procedure TfAgendaTelef.Gravar_Cliente;
begin
  qCliente.Open;
  qCliente.First;
  while not qCliente.Eof do
  begin
    if not Existe_Registro(qClienteNome.AsString) then
    begin
      mAgenda.Insert;
      mAgendaControle.AsInteger := 1;
      mAgendaNome.AsString      := qClienteNome.AsString;
      mAgendaContato.AsString   := qClienteContato.AsString;
      mAgendaFax.AsString       := qClienteFax.AsString;
      if qClienteTelefone.AsString <> '' then
        mAgendaFone.AsString := qClienteTelefone.AsString;
      if qClienteTelefone2.AsString <> '' then
        mAgendaFone.AsString := mAgendaFone.AsString + ' / ' + qClienteTelefone.AsString;
      mAgenda.Post;
    end;
    qCliente.Next;
  end;
end;

procedure TfAgendaTelef.Gravar_Fornecedor;
begin
  qFornecedores.Open;
  qFornecedores.First;
  while not qFornecedores.Eof do
  begin
    if (Trim(qFornecedoresNomeForn.AsString) <> '') and not(Existe_Registro(qFornecedoresNomeForn.AsString)) then
    begin
      mAgenda.Insert;
      mAgendaControle.AsInteger := 2;
      mAgendaNome.AsString      := qFornecedoresNomeForn.AsString;
      mAgendaContato.AsString   := qFornecedoresContatoForn.AsString;
      mAgendaFax.AsString       := qFornecedoresFaxForn.AsString;
      if qFornecedoresTel1Forn.AsString <> '' then
        mAgendaFone.AsString := qFornecedoresTel1Forn.AsString;
      if qFornecedoresTel2Forn.AsString <> '' then
        mAgendaFone.AsString := mAgendaFone.AsString + ' / ' + qFornecedoresTel2Forn.AsString;
      mAgenda.Post;
    end;
    qFornecedores.Next;
  end;
end;

procedure TfAgendaTelef.Gravar_Transportadora;
begin
  qTransp.Open;
  qTransp.First;
  while not qTransp.Eof do
  begin
    if (Trim(qTranspNome.AsString) <> '') and not(Existe_Registro(qTranspNome.AsString)) then
    begin
      mAgenda.Insert;
      mAgendaControle.AsInteger := 3;
      mAgendaNome.AsString      := qTranspNome.AsString;
      mAgendaContato.AsString   := qTranspContato.AsString;
      mAgendaFax.AsString       := qTranspFax.AsString;
      mAgendaFone.AsString      := qTranspFone.AsString;
      mAgenda.Post;
    end;
    qTransp.Next;
  end;
end;

procedure TfAgendaTelef.Gravar_Vendedor;
begin
  qVendedores.Open;
  qVendedores.First;
  while not qVendedores.Eof do
  begin
    if (Trim(qVendedoresNome.AsString) <> '') and not(Existe_Registro(qVendedoresNome.AsString)) then
    begin
      mAgenda.Insert;
      mAgendaControle.AsInteger := 4;
      mAgendaNome.AsString      := qVendedoresNome.AsString;
      mAgendaContato.AsString   := qVendedoresContato.AsString;
      mAgendaFax.AsString       := qVendedoresFax.AsString;
      mAgendaFone.AsString      := qVendedoresFone.AsString;
      mAgenda.Post;
    end;
    qVendedores.Next;
  end;
end;

procedure TfAgendaTelef.Gravar_Outros;
begin
  qOutros.Open;
  qOutros.First;
  while not qOutros.Eof do
  begin
    if (Trim(qOutrosNome.AsString) <> '') and not(Existe_Registro(qOutrosNome.AsString)) then
    begin
      mAgenda.Insert;
      mAgendaControle.AsInteger := 5;
      mAgendaNome.AsString      := qOutrosNome.AsString;
      mAgendaContato.AsString   := qOutrosContato.AsString;
      if Trim(qOutrosContato2.AsString) <> '' then
        mAgendaContato.AsString := mAgendaContato.AsString + '/' + qOutrosContato2.AsString;
      if Trim(qOutrosContato3.AsString) <> '' then
        mAgendaContato.AsString := mAgendaContato.AsString + '/' + qOutrosContato3.AsString;
      mAgendaFax.AsString       := qOutrosFax.AsString;
      mAgendaFone.AsString      := qOutrosTelefone1.AsString;
      if qOutrosTelefone2.AsString <> '' then
        mAgendaFone.AsString    := mAgendaFone.AsString + '/' + qOutrosTelefone2.AsString;
      mAgenda.Post;
    end;
    qOutros.Next;
  end;

end;

function TfAgendaTelef.Existe_Registro(Nome: String): Boolean;
begin
  Result := False;
  try
    if mAgenda.Locate('Nome',Nome,[loCaseInsensitive]) then
      Result := True;
  except
    on E: Exception do
      ShowMessage('Erro na leitura do registro, ' + qOutrosCodigo.AsString + ' ' + E.Message);
  end;
end;

end.

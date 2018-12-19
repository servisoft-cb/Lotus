unit UCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, RXLookup, DBCtrls, StdCtrls, Mask, Buttons, ExtCtrls, Db, DBTables,
  ComCtrls, ToolEdit, RXDBCtrl, VerificaCPF, VerificaCGC, RxDBComb;

type
  TfCliente = class(TForm)
    tClienteIns: TTable;
    tClienteInsCodigo: TIntegerField;
    tClienteInsNome: TStringField;
    tClienteInsEndereco: TStringField;
    tClienteInsBairro: TStringField;
    tClienteInsCidade: TStringField;
    tClienteInsUf: TStringField;
    tClienteInsTelefone: TStringField;
    tClienteInsTelefone2: TStringField;
    tClienteInsFax: TStringField;
    tClienteInsPessoa: TStringField;
    tClienteInsCgcCpf: TStringField;
    tClienteInsInscrEst: TStringField;
    tClienteInsContato: TStringField;
    tClienteIndex: TTable;
    dsCliente: TDataSource;
    tClienteIndexCodigo: TIntegerField;
    tClienteIndexNome: TStringField;
    tClienteIndexEndereco: TStringField;
    tClienteIndexBairro: TStringField;
    tClienteIndexCidade: TStringField;
    tClienteIndexUf: TStringField;
    tClienteIndexTelefone: TStringField;
    tClienteIndexTelefone2: TStringField;
    tClienteIndexFax: TStringField;
    tClienteIndexPessoa: TStringField;
    tClienteIndexCgcCpf: TStringField;
    tClienteIndexInscrEst: TStringField;
    tClienteIndexContato: TStringField;
    tClienteInsObs: TMemoField;
    tClienteInsAprovCredito: TStringField;
    tClienteInsTipoAprov: TStringField;
    tClienteIndexObs: TMemoField;
    tClienteIndexAprovCredito: TStringField;
    tClienteIndexTipoAprov: TStringField;
    tClienteInsEndEntrega: TStringField;
    tClienteInsBairroEntrega: TStringField;
    tClienteInsCidEntrega: TStringField;
    tClienteInsUfEntrega: TStringField;
    tClienteInsCgcCpfEntrega: TStringField;
    tClienteInsInscEntrega: TStringField;
    tClienteIndexEndEntrega: TStringField;
    tClienteIndexBairroEntrega: TStringField;
    tClienteIndexCidEntrega: TStringField;
    tClienteIndexUfEntrega: TStringField;
    tClienteIndexCgcCpfEntrega: TStringField;
    tClienteIndexInscEntrega: TStringField;
    tClienteIndexEndPgto: TStringField;
    tClienteIndexBairroPgto: TStringField;
    tClienteIndexCidPgto: TStringField;
    tClienteInsEndPgto: TStringField;
    tClienteInsBairroPgto: TStringField;
    tClienteInsCidPgto: TStringField;
    tClienteInsUfPgto: TStringField;
    dsClienteIns: TDataSource;
    tClienteInsFantasia: TStringField;
    tClienteInsDtCadastro: TDateField;
    tClienteIndexFantasia: TStringField;
    tClienteIndexDtCadastro: TDateField;
    tClienteIndexCodVendedor: TIntegerField;
    tClienteInsCodVendedor: TIntegerField;
    tClienteInsObsCtas: TMemoField;
    tClienteIndexObsCtas: TMemoField;
    tClienteInsLojas: TIntegerField;
    tClienteIndexLojas: TIntegerField;
    tClienteInsSelecionado: TBooleanField;
    tClienteIndexSelecionado: TBooleanField;
    VerificaCGC1: TVerificaCGC;
    VerificaCPF1: TVerificaCPF;
    tClienteInsCep: TStringField;
    tClienteInsCaixaPostal: TStringField;
    tClienteInsRg: TStringField;
    tClienteInsCepEntrega: TStringField;
    tClienteInsCepPgto: TStringField;
    tClienteIndexCaixaPostal: TStringField;
    tClienteIndexRg: TStringField;
    tClienteIndexCep: TStringField;
    tClienteIndexCepEntrega: TStringField;
    tClienteIndexCepPgto: TStringField;
    tClienteIndexUfPgto: TStringField;
    Panel5: TPanel;
    Label1: TLabel;
    Label31: TLabel;
    Label33: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Edit1: TEdit;
    RxDBLookupCombo5: TRxDBLookupCombo;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label29: TLabel;
    Label16: TLabel;
    SpeedButton1: TSpeedButton;
    Label32: TLabel;
    SpeedButton2: TSpeedButton;
    Label34: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label36: TLabel;
    Label37: TLabel;
    Panel4: TPanel;
    DBText1: TDBText;
    Label7: TLabel;
    BitBtn6: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit22: TDBEdit;
    RxDBLookupCombo3: TRxDBLookupCombo;
    RxDBLookupCombo4: TRxDBLookupCombo;
    RxDBLookupCombo6: TRxDBLookupCombo;
    DBEdit23: TDBEdit;
    RxDBLookupCombo8: TRxDBLookupCombo;
    DBRadioGroup4: TDBRadioGroup;
    DBEdit14: TDBEdit;
    DBEdit21: TDBEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label39: TLabel;
    DBMemo1: TDBMemo;
    DBEdit25: TDBEdit;
    TabSheet2: TTabSheet;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label38: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    RxDBLookupCombo9: TRxDBLookupCombo;
    RxDBLookupCombo10: TRxDBLookupCombo;
    DBEdit24: TDBEdit;
    TabSheet3: TTabSheet;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    Panel6: TPanel;
    BitBtn7: TBitBtn;
    RxDBLookupCombo7: TRxDBLookupCombo;
    RxDBLookupCombo11: TRxDBLookupCombo;
    RxDBLookupCombo12: TRxDBLookupCombo;
    TabSheet4: TTabSheet;
    DBMemo2: TDBMemo;
    TabSheet5: TTabSheet;
    Panel7: TPanel;
    DBRadioGroup2: TDBRadioGroup;
    BitBtn9: TBitBtn;
    DBRadioGroup3: TDBRadioGroup;
    BitBtn10: TBitBtn;
    Label30: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label15: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    Label40: TLabel;
    DBEdit29: TDBEdit;
    Label41: TLabel;
    RxDBLookupCombo13: TRxDBLookupCombo;
    SpeedButton6: TSpeedButton;
    Label35: TLabel;
    DBEdit4: TDBEdit;
    Label42: TLabel;
    DBEdit30: TDBEdit;
    Label43: TLabel;
    RxDBComboBox2: TRxDBComboBox;
    Label89: TLabel;
    RxDBComboBox8: TRxDBComboBox;
    DBRadioGroup1: TDBRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1DropDown(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure DBEdit9Enter(Sender: TObject);
    procedure DBRadioGroup2Exit(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure RxDBLookupCombo3Exit(Sender: TObject);
    procedure RxDBLookupCombo2Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure RxDBLookupCombo5DropDown(Sender: TObject);
    procedure RxDBLookupCombo5Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBLookupCombo7Exit(Sender: TObject);
    procedure RxDBLookupCombo7Enter(Sender: TObject);
    procedure RxDBLookupCombo4Exit(Sender: TObject);
    procedure RxDBLookupCombo4Enter(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure RxDBLookupCombo8Enter(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure RxDBLookupCombo8Exit(Sender: TObject);
    procedure RxDBLookupCombo9Exit(Sender: TObject);
    procedure RxDBLookupCombo11Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBComboBox1Exit(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBEdit16Enter(Sender: TObject);
    procedure RxDBComboBox8Exit(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita;
    procedure Checa_Duplicidade;
  public
    { Public declarations }
  end;

var
  fCliente: TfCliente;

implementation

uses UDM1, UVendedor, ULojas, UCopiaFornec, UUf, UCidade,
  UAgendaTelef, UDM2, UPais, UConsClientes, uIntegracao, uUtilPadrao;

{$R *.DFM}

procedure TfCliente.Habilita;
begin
  Panel7.Enabled            := not(Panel7.Enabled);
  Panel5.Enabled            := not(Panel5.Enabled);
  Panel3.Enabled            := not(Panel3.Enabled);
  Bitbtn1.Enabled           := not(Bitbtn1.Enabled);
  Bitbtn2.Enabled           := not(Bitbtn2.Enabled);
  Bitbtn3.Enabled           := not(Bitbtn3.Enabled);
  Bitbtn4.Enabled           := not(Bitbtn4.Enabled);
  Bitbtn5.Enabled           := not(Bitbtn5.Enabled);
  Bitbtn6.Enabled           := not(Bitbtn6.Enabled);
  BitBtn7.Enabled           := not(BitBtn7.Enabled);
  DBNavigator1.Enabled      := not(DBNavigator1.Enabled);
  RxDBLookupCombo7.Enabled  := not(RxDBLookupCombo7.Enabled);
  DBEdit18.Enabled          := not(DBEdit18.Enabled);
  DBEdit19.Enabled          := not(DBEdit19.Enabled);
  DBEdit20.Enabled          := not(DBEdit20.Enabled);
  RxDBLookupCombo10.Enabled := not(RxDBLookupCombo10.Enabled);
  RxDBLookupCombo11.Enabled := not(RxDBLookupCombo11.Enabled);
  RxDBLookupCombo12.Enabled := not(RxDBLookupCombo12.Enabled);
  DBEdit4.Enabled           := not(DBEdit4.Enabled);
  DBEdit17.Enabled          := not(DBEdit17.Enabled);
  DBEdit12.Enabled          := not(DBEdit12.Enabled);
  DBEdit15.Enabled          := not(DBEdit15.Enabled);
  DBEdit13.Enabled          := not(DBEdit13.Enabled);
  DBEdit30.Enabled          := not(DBEdit30.Enabled);
  RxDBLookupCombo9.Enabled  := not(RxDBLookupCombo9.Enabled);
  DBEdit16.Enabled          := not(DBEdit16.Enabled);
  DBMemo1.Enabled           := not(DBMemo1.Enabled);
  DBMemo2.Enabled           := not(DBMemo2.Enabled);
end;

procedure TfCliente.Checa_Duplicidade;
begin
  tClienteIns.IndexFieldNames := 'CgcCpf';
  tClienteIns.SetKey;
  tClienteInsCgcCpf.AsString := DBEdit9.Text;
  if (tClienteIns.GotoKey) and (tClienteInsCodigo.AsString <> DM1.tClienteCodigo.AsString) then
    begin
      case MessageDlg('O cliente ' + tClienteInsNome.AsString + ', já está cadastrado com o CNPJ digitado! Deseja continuar assim mesmo?',
           mtInformation,mbYesNoCancel,0) of
        mrNo     : DBEdit9.SetFocus;
        mrCancel : BitBtn5.Click;
      end;
    end;
  tClienteIns.IndexFieldNames := 'Codigo';  
end;

procedure TfCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      DM1.tCliente.Close;
      DM1.tVendedor.Close;
      DM1.tCidade.Close;
      DM1.tUF.Close;
      DM1.tLojas.Close;
    end;
  DM2.qPais.Close;
  Action := Cafree;
end;

procedure TfCliente.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tCliente.Refresh;
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

procedure TfCliente.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  DM1.tCliente.IndexFieldNames := 'Codigo';
end;

procedure TfCliente.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsClientes.AsBoolean then
    begin
      DM1.tCliente.Refresh;
      DM1.tCliente.IndexFieldNames := 'Codigo';
      tClienteIns.IndexFieldNames  := 'Codigo';
      tClienteIns.Refresh;
      tClienteIns.Last;
      DM1.tCliente.Insert;
      DM1.tClienteCodigo.AsInteger := tClienteInsCodigo.AsInteger + 1;
      DBDateEdit1.Date := Date();
      DM1.tClienteMercado.AsString := 'I';
      DM1.tCliente.Post;
      DM1.tCliente.Edit;
      Habilita;
      DBEdit1.SetFocus;
      RxDBComboBox1.ItemIndex := 0;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfCliente.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltClientes.AsBoolean then
    begin
      DM1.tCliente.IndexFieldNames := 'Codigo';
      DM1.tCliente.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfCliente.BitBtn3Click(Sender: TObject);
var
  vCodAux : Integer;
begin
  if DM1.tUsuarioExcClientes.AsBoolean then
  begin
    if MessageDlg('Deseja realmente excluir o cliente?',mtconfirmation,[mbok,mbno],0)=mrok then
    begin
      vCodAux := DM1.tClienteCodigo.AsInteger;
      DM1.tCliente.Delete;
      Prc_Excluir_Cliente_FB(vCodAux);
    end;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfCliente.BitBtn5Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tCliente.Delete
  else
  if BitBtn2.Tag = 1 then
    DM1.tCliente.Cancel;
  Habilita;
  BitBtn2.Tag := 0;
  BitBtn1.SetFocus;
end;

procedure TfCliente.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfCliente.BitBtn6Click(Sender: TObject);
begin
  if DbEdit5.Text = '     -   ' then
  begin
    ShowMessage('Cliente sem CEP');
    DbEdit5.SetFocus;
  end
  else
  begin
    if (DM1.tClienteAprovCredito.AsString <> 'S') and (DM1.tClienteAprovCredito.AsString <> 'C') then
      DM1.tClienteTipoAprov.AsString := '';
    DM1.tClienteNomeSemAcento.AsString := TirarAcento(DM1.tClienteNome.AsString);
    DM1.tCliente.Post;
    Prc_Gravar_Cliente_FB(DM1.tClienteCodigo.AsInteger);
    tClienteIndex.Refresh;
    Habilita;
    BitBtn2.Tag := 0;
    BitBtn1.SetFocus;
  end;
end;

procedure TfCliente.DBEdit9Exit(Sender: TObject);
begin
 if (DM1.tClientePessoa.AsString = 'F') and (DBEdit9.Text <> '   .   .   -  ') then
   begin
     VerificaCPF1.Entrada := DBEdit9.Text;
   if not VerificaCPF1.Resultado then
    begin
     ShowMessage('Número de CPF inválido!');
     DBEdit9.SetFocus;
    end;
  end
 else
 if (DM1.tClientePessoa.AsString = 'J') and (DBEdit9.Text <> '  .   .   /    -  ') then
  begin
     VerificaCGC1.Entrada := DBEdit9.Text;
   if not VerificaCGC1.Resultado then
    begin
     ShowMessage('Número de CNPJ inválido!');
     DBEdit9.SetFocus;
    end;
  end;
  Checa_Duplicidade;
end;

procedure TfCliente.DBEdit9Enter(Sender: TObject);
begin
 if DM1.tClientePessoa.AsString  = 'F' then
  begin
   fCliente.tClienteInsCgcCpf.EditMask:='999.999.999-99';
   DBEdit10.TabStop := False;
  end
 else
 if DM1.tClientePessoa.AsString = 'J' then
  begin
   fCliente.tClienteInsCgcCpf.EditMask:='99.999.999/9999-99';
   DBEdit10.TabStop := True;
  end
 else
 if DM1.tClientePessoa.AsString = 'E' then
  begin
   fCliente.tClienteInsCgcCpf.EditMask:='';
   DBEdit10.TabStop := True;
  end;
end;

procedure TfCliente.DBRadioGroup2Exit(Sender: TObject);
begin
  if (DM1.tClienteAprovCredito.AsString = 'N') then
    begin
      DM1.tClienteTipoAprov.AsString := '';
      DBRadioGroup3.TabStop          := False;
    end
  else
    if (DM1.tClienteAprovCredito.AsString = 'S') or (DM1.tClienteAprovCredito.AsString = 'C') then
      DBRadioGroup3.TabStop          := True;
end;

procedure TfCliente.BitBtn7Click(Sender: TObject);
begin
  if RxDBLookupCombo7.Text <> '' then
    begin
      DM1.tClienteEndPgto.AsString    := tClienteInsEndPgto.AsString;
      DM1.tClienteBairroPgto.AsString := tClienteInsBairroPgto.AsString;
      DM1.tClienteCidPgto.AsString    := tClienteInsCidPgto.AsString;
      DM1.tClienteCepPgto.AsString    := tClienteInsCepPgto.AsString;
      DM1.tClienteUfPgto.AsString     := tClienteInsUfPgto.AsString;
    end;
end;

procedure TfCliente.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tCliente.Refresh;
  DM1.tCliente.IndexFieldNames := 'CgcCpf';
  Edit1.Text := RxDBLookupCombo2.Text;
end;

procedure TfCliente.RxDBLookupCombo2Exit(Sender: TObject);
begin
  DM1.tCliente.Refresh;
  DM1.tCliente.IndexFieldNames := 'Codigo';
  Edit1.Text := RxDBLookupCombo2.Text;
end;

procedure TfCliente.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tCliente.Refresh;
  DM1.tCliente.IndexFieldNames := 'Codigo';
end;

procedure TfCliente.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioVendedor.AsBoolean then
    begin
      fVendedor := TfVendedor.Create(Self);
      fVendedor.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfCliente.RxDBLookupCombo3Enter(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Nome';
end;

procedure TfCliente.RxDBLookupCombo3Exit(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Codigo';
end;

procedure TfCliente.RxDBLookupCombo2Change(Sender: TObject);
begin
  Edit1.Text := RxDBLookupCombo2.Text;
end;

procedure TfCliente.Edit1Change(Sender: TObject);
begin
  try
    DM1.tCliente.IndexFieldNames := 'CgcCpf';
    DM1.tCliente.FindNearest([Edit1.Text]);
  except
    ShowMessage('Digite apenas números aqui!');
  end;
end;

procedure TfCliente.SpeedButton2Click(Sender: TObject);
begin
  if DM1.tUsuarioLojas.AsBoolean then
    begin
      fLojas := TfLojas.Create(Self);
      fLojas.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfCliente.RxDBLookupCombo5DropDown(Sender: TObject);
begin
  DM1.tCliente.Refresh;
  DM1.tCliente.IndexFieldNames := 'Fantasia';
end;

procedure TfCliente.RxDBLookupCombo5Exit(Sender: TObject);
begin
  DM1.tCliente.Refresh;
  DM1.tCliente.IndexFieldNames := 'Codigo';
end;

procedure TfCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
  begin
    fAgendaTelef := TfAgendaTelef.Create(Self);
    fAgendaTelef.ShowModal;
  end
  else
  if (Key = Vk_F2) and (DM1.tCliente.State in [dsBrowse]) then
  begin
    fConsClientes := TfConsClientes.Create(Self);
    fConsClientes.ShowModal;
  end;
end;

procedure TfCliente.BitBtn9Click(Sender: TObject);
begin
  if DM1.tCliente.State in [dsEdit, dsInsert] then
    DM1.tClienteAprovCredito.Clear;
end;

procedure TfCliente.BitBtn10Click(Sender: TObject);
begin
  if DM1.tCliente.State in [dsEdit, dsInsert] then
    DM1.tClienteTipoAprov.Clear;
end;

procedure TfCliente.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tCliente.State in [dsEdit,dsInsert] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar o cliente antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfCliente.RxDBLookupCombo7Exit(Sender: TObject);
begin
  if RxDBLookupCombo7.Text <> '' then
    BitBtn7.SetFocus;
  tClienteIns.IndexFieldNames := 'Codigo';
end;

procedure TfCliente.RxDBLookupCombo7Enter(Sender: TObject);
begin
  tClienteIns.IndexFieldNames := 'Fantasia'
end;

procedure TfCliente.RxDBLookupCombo4Exit(Sender: TObject);
begin
  DM1.tLojas.IndexFieldNames := 'Codigo'
end;

procedure TfCliente.RxDBLookupCombo4Enter(Sender: TObject);
begin
  DM1.tLojas.IndexFieldNames := 'Nome';
end;

procedure TfCliente.SpeedButton3Click(Sender: TObject);
begin
  fCopiaFornec := TfCopiaFornec.Create(Self);
  fCopiaFornec.ShowModal;
end;

procedure TfCliente.SpeedButton4Click(Sender: TObject);
begin
  if DM1.tUsuarioUf.AsBoolean then
    begin
      fUf := TfUf.Create(Self);
      fUf.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfCliente.RxDBLookupCombo8Enter(Sender: TObject);
begin
  DM1.tCidade.IndexFieldNames := 'Nome';
end;

procedure TfCliente.SpeedButton5Click(Sender: TObject);
begin
  if DM1.tUsuarioCidade.AsBoolean then
    begin
      fCidade := TfCidade.Create(Self);
      fCidade.ShowModal;
      DM1.tCidade.Refresh;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfCliente.RxDBLookupCombo8Exit(Sender: TObject);
begin
  if (RxDBLookupCombo6.Text = '') and (RxDBLookupCombo8.Text <> '') then
    begin
      DM1.tCidade.IndexFieldNames := 'Codigo';
      DM1.tCidade.SetKey;
      DM1.tCidadeCodigo.AsInteger := RxDBLookupCombo8.KeyValue;
      if DM1.tCidade.GotoKey then
        begin
          if DM1.tCidadeEstado.AsString <> '' then
            DM1.tClienteUf.AsString := DM1.tCidadeEstado.AsString;
          if (DBEdit5.Text = '') and (DM1.tCidadeCep.AsString <> '') then
            DM1.tClienteCep.AsString := DM1.tCidadeCep.AsString;
        end;
    end;
end;

procedure TfCliente.RxDBLookupCombo9Exit(Sender: TObject);
begin
  if (RxDBLookupCombo10.Text = '') and (RxDBLookupCombo9.Text <> '') then
    begin
      DM1.tCidade.IndexFieldNames := 'Codigo';
      DM1.tCidade.SetKey;
      DM1.tCidadeCodigo.AsInteger := RxDBLookupCombo9.KeyValue;
      if DM1.tCidade.GotoKey then
        begin
          if DM1.tCidadeEstado.AsString <> '' then
            DM1.tClienteUfEntrega.AsString := DM1.tCidadeEstado.AsString;
        end;
    end;
end;

procedure TfCliente.RxDBLookupCombo11Exit(Sender: TObject);
begin
  if (RxDBLookupCombo12.Text = '') and (RxDBLookupCombo11.Text <> '') then
    begin
      DM1.tCidade.IndexFieldNames := 'Codigo';
      DM1.tCidade.SetKey;
      DM1.tCidadeCodigo.AsInteger := RxDBLookupCombo11.KeyValue;
      if DM1.tCidade.GotoKey then
        begin
          if DM1.tCidadeEstado.AsString <> '' then
            DM1.tClienteUfEntrega.AsString := DM1.tCidadeEstado.AsString;
        end;
    end;
end;

procedure TfCliente.FormShow(Sender: TObject);
begin
  DM1.tCliente.Open;
  DM1.tVendedor.Open;
  DM1.tCidade.Open;
  DM1.tUF.Open;
  DM1.tLojas.Open;
  DM2.qPais.Open;
end;

procedure TfCliente.RxDBComboBox1Exit(Sender: TObject);
begin
 if RxDBComboBox1.ItemIndex = 1 then
  begin
   DM1.tClientePessoa.AsString := 'F';
   DM1.tClienteCgcCpf.EditMask:='999.999.999-99';
   DBEdit10.TabStop := False;
  end
 else
 if RxDBComboBox1.ItemIndex = 0 then
  begin
   DM1.tClientePessoa.AsString := 'J';
   DM1.tClienteCgcCpf.EditMask:='99.999.999/9999-99';
   DBEdit10.TabStop := True;
  end
  else
  begin
   DM1.tClientePessoa.AsString := 'E';
   DM1.tClienteCgcCpf.EditMask:='';
   DBEdit10.TabStop := True;
  end;
end;

procedure TfCliente.SpeedButton6Click(Sender: TObject);
begin
  if DM1.tUsuarioUf.AsBoolean then
    begin
      fPais := TfPais.Create(Self);
      fPais.ShowModal;
      DM2.qPais.Close;
      DM2.qPais.Open;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfCliente.DBEdit16Enter(Sender: TObject);
begin
  //3.10   21/03/2015
 if DM1.tClientePessoaEntrega.AsString  = 'F' then
  begin
   fCliente.tClienteInsCgcCpfEntrega.EditMask:='999.999.999-99';
  end
 else
 if DM1.tClientePessoaEntrega.AsString = 'J' then
  begin
   fCliente.tClienteInsCgcCpfEntrega.EditMask:='99.999.999/9999-99';
  end;
end;

procedure TfCliente.RxDBComboBox8Exit(Sender: TObject);
begin
  //3.10  21/03/2015
  if DM1.tClienteTIPO_CONTRIBUINTE.AsInteger = 2 then
    DM1.tClienteInscrEst.AsString := 'ISENTO'
  else
  if DM1.tClienteTIPO_CONTRIBUINTE.AsInteger = 9 then
    DM1.tClienteInscrEst.AsString := '';
end;

end.

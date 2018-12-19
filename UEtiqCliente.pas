unit UEtiqCliente;

interface
                          
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXLookup, StdCtrls, Grids, DBGrids, RXDBCtrl, Db, DBTables, ExtCtrls,
  Buttons, ALed, DBFilter;

type
  TfEtiqCliente = class(TForm)
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Edit1: TEdit;
    Label3: TLabel;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Bevel2: TBevel;
    tCliente: TTable;
    dsClinte: TDataSource;
    tClienteCodigo: TIntegerField;
    tClienteNome: TStringField;
    tClienteEndereco: TStringField;
    tClienteBairro: TStringField;
    tClienteCidade: TStringField;
    tClienteUf: TStringField;
    tClienteTelefone: TStringField;
    tClienteTelefone2: TStringField;
    tClienteFax: TStringField;
    tClientePessoa: TStringField;
    tClienteCgcCpf: TStringField;
    tClienteInscrEst: TStringField;
    tClienteContato: TStringField;
    tClienteObs: TMemoField;
    tClienteAprovCredito: TStringField;
    tClienteTipoAprov: TStringField;
    tClienteEndEntrega: TStringField;
    tClienteBairroEntrega: TStringField;
    tClienteCidEntrega: TStringField;
    tClienteUfEntrega: TStringField;
    tClienteCgcCpfEntrega: TStringField;
    tClienteInscEntrega: TStringField;
    tClienteEndPgto: TStringField;
    tClienteBairroPgto: TStringField;
    tClienteCidPgto: TStringField;
    tClienteUfPgto: TStringField;
    tClienteFantasia: TStringField;
    tClienteDtCadastro: TDateField;
    tClienteCodVendedor: TIntegerField;
    tClienteObsCtas: TMemoField;
    tClienteLojas: TIntegerField;
    tClienteSelecionado: TBooleanField;
    Bevel1: TBevel;
    RxDBGrid2: TRxDBGrid;
    Label4: TLabel;
    tAuxEtiqueta: TTable;
    dsAuxEtiqueta: TDataSource;
    tAuxEtiquetaCodigo: TIntegerField;
    tAuxEtiquetalkNome: TStringField;
    tAuxEtiquetalkFantasia: TStringField;
    tAuxEtiquetalkEndereco: TStringField;
    tAuxEtiquetalkBairro: TStringField;
    tAuxEtiquetalkUf: TStringField;
    tAuxEtiquetalkTelefone: TStringField;
    tAuxEtiquetalkTelefone2: TStringField;
    tAuxEtiquetalkFax: TStringField;
    tAuxEtiquetalkPessoa: TStringField;
    tAuxEtiquetalkCgc: TStringField;
    tAuxEtiquetalkInscrEst: TStringField;
    tAuxEtiquetalkContato: TStringField;
    tAuxEtiquetalkDtCadastro: TStringField;
    tClienteCaixaPostal: TStringField;
    tAuxEtiquetalkCaixaPostal: TStringField;
    Label5: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    tClienteCep: TStringField;
    tClienteCepEntrega: TStringField;
    tClienteCepPgto: TStringField;
    tClienteRg: TStringField;
    tAuxEtiquetalkCep: TStringField;
    tClienteCodCidade: TIntegerField;
    tClienteCodCidadeE: TIntegerField;
    tClienteCodCidadeP: TIntegerField;
    tClientelkCidade: TStringField;
    tAuxEtiquetalkCidade: TStringField;
    tClienteNumEnd: TStringField;
    tClienteNumEndEntrega: TStringField;
    tClienteComplEndereco: TStringField;
    tCReceberParclkNumEndEntrega: TStringField;
    tCReceberParclkNumEnd: TStringField;
    tCReceberParclkComplEndereco: TStringField;
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure RxDBLookupCombo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
    procedure RxDBLookupCombo2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure RxDBLookupCombo3Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Imprimir;
  public
    { Public declarations }
  end;

var
  fEtiqCliente: TfEtiqCliente;
  F: TextFile;

implementation

uses UDM1, UEscImpressora, UQuant, UCliente, UAgendaTelef;

{$R *.DFM}

procedure TfEtiqCliente.Imprimir;
begin
  if tAuxEtiquetalkBairro.AsString <> '' then
    begin
      writeln(F);
      writeln(F,tAuxEtiquetalkNome.AsString);
      writeln(F,tAuxEtiquetalkEndereco.AsString);
      writeln(F,tAuxEtiquetalkBairro.AsString);
      writeln(F,tAuxEtiquetalkCidade.AsString + ' - ' + tAuxEtiquetalkUf.AsString);
      writeln(F,'CEP: ' + tAuxEtiquetalkCep.AsString);
      if tAuxEtiquetalkCaixaPostal.AsString = '' then
        writeln(F)
      else
        writeln(F,'Caixa Postal: ' + tAuxEtiquetalkCaixaPostal.AsString);
      writeln(F);
    end
  else
    begin
      writeln(F);
      writeln(F,tAuxEtiquetalkNome.AsString);
      writeln(F,tAuxEtiquetalkEndereco.AsString);
      writeln(F,tAuxEtiquetalkCidade.AsString + ' - ' + tAuxEtiquetalkUf.AsString);
      writeln(F,'CEP: ' + tAuxEtiquetalkCep.AsString);
      if tAuxEtiquetalkCaixaPostal.AsString = '' then
        writeln(F)
      else
        writeln(F,'Caixa Postal: ' + tAuxEtiquetalkCaixaPostal.AsString);
      writeln(F);
      writeln(F);
    end;
end;

procedure TfEtiqCliente.Edit1Change(Sender: TObject);
begin
  try
    tCliente.IndexFieldNames := 'Codigo';
    tCliente.FindKey([Edit1.Text]);
  except
    ShowMessage('Digite só números aqui!');
  end;
end;

procedure TfEtiqCliente.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) then
    begin
      tAuxEtiqueta.SetKey;
      tAuxEtiquetaCodigo.AsInteger := tClienteCodigo.AsInteger;
      if tAuxEtiqueta.GotoKey then
        begin
          tAuxEtiqueta.Edit;
          tAuxEtiquetaCodigo.AsInteger := tClienteCodigo.AsInteger;
          tAuxEtiqueta.Post;
          tAuxEtiqueta.Refresh;
          Edit1.SelectAll;
        end
      else
        begin
          tAuxEtiqueta.Insert;
          tAuxEtiquetaCodigo.AsInteger := tClienteCodigo.AsInteger;
          tAuxEtiqueta.Post;
          tAuxEtiqueta.Refresh;
          Edit1.SelectAll;
        end;
    end;
end;

procedure TfEtiqCliente.RxDBLookupCombo1Enter(Sender: TObject);
begin
  tCliente.IndexFieldNames := 'Nome';
end;

procedure TfEtiqCliente.RxDBLookupCombo1Exit(Sender: TObject);
begin
  tCliente.IndexFieldNames := 'Codigo';
end;

procedure TfEtiqCliente.RxDBLookupCombo1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) then
    begin
      tAuxEtiqueta.SetKey;
      tAuxEtiquetaCodigo.AsInteger := tClienteCodigo.AsInteger;
      if tAuxEtiqueta.GotoKey then
        begin
          tAuxEtiqueta.Edit;
          tAuxEtiquetaCodigo.AsInteger := tClienteCodigo.AsInteger;
          tAuxEtiqueta.Post;
          tAuxEtiqueta.Refresh;
        end
      else
        begin
          tAuxEtiqueta.Insert;
          tAuxEtiquetaCodigo.AsInteger := tClienteCodigo.AsInteger;
          tAuxEtiqueta.Post;
          tAuxEtiqueta.Refresh;
        end;
    end;
end;

procedure TfEtiqCliente.RxDBLookupCombo2Enter(Sender: TObject);
begin
  tCliente.IndexFieldNames := 'Fantasia';
end;

procedure TfEtiqCliente.RxDBLookupCombo2Exit(Sender: TObject);
begin
  tCliente.IndexFieldNames := 'Codigo';
end;

procedure TfEtiqCliente.RxDBLookupCombo2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) then
    begin
      tAuxEtiqueta.SetKey;
      tAuxEtiquetaCodigo.AsInteger := tClienteCodigo.AsInteger;
      if tAuxEtiqueta.GotoKey then
        begin
          tAuxEtiqueta.Edit;
          tAuxEtiquetaCodigo.AsInteger := tClienteCodigo.AsInteger;
          tAuxEtiqueta.Post;
          tAuxEtiqueta.Refresh;
        end
      else
        begin
          tAuxEtiqueta.Insert;
          tAuxEtiquetaCodigo.AsInteger := tClienteCodigo.AsInteger;
          tAuxEtiqueta.Post;
          tAuxEtiqueta.Refresh;
        end;
    end;
end;

procedure TfEtiqCliente.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfEtiqCliente.BitBtn2Click(Sender: TObject);
begin
  tAuxEtiqueta.First;
  while not tAuxEtiqueta.EOF do
    tAuxEtiqueta.Delete;
  RxDBLookupCombo1.ClearValue;
  RxDBLookupCombo2.ClearValue;
  RxDBLookupCombo3.ClearValue;
  Edit1.Clear;
  tCliente.First;
end;

procedure TfEtiqCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tAuxEtiqueta.First;
  while not tAuxEtiqueta.EOF do
    tAuxEtiqueta.Delete;
  RxDBLookupCombo1.ClearValue;
  RxDBLookupCombo2.ClearValue;
  Edit1.Clear;
  DM1.tCliente.Close;
  DM1.tVendedor.Close;
  Action := Cafree;
end;

procedure TfEtiqCliente.RxDBGrid1DblClick(Sender: TObject);
begin
  tAuxEtiqueta.SetKey;
  tAuxEtiquetaCodigo.AsInteger := tClienteCodigo.AsInteger;
  if tAuxEtiqueta.GotoKey then
    begin
      tAuxEtiqueta.Edit;
      tAuxEtiquetaCodigo.AsInteger := tClienteCodigo.AsInteger;
      tAuxEtiqueta.Post;
      tAuxEtiqueta.Refresh;
    end
  else
    begin
      tAuxEtiqueta.Insert;
      tAuxEtiquetaCodigo.AsInteger := tClienteCodigo.AsInteger;
      tAuxEtiqueta.Post;
      tAuxEtiqueta.Refresh;
    end;
end;

procedure TfEtiqCliente.FormShow(Sender: TObject);
begin
  DM1.tCliente.Open;
  DM1.tVendedor.Open;
  tAuxEtiqueta.First;
  while not tAuxEtiqueta.EOF do
    tAuxEtiqueta.Delete;
  RxDBLookupCombo1.ClearValue;
  RxDBLookupCombo2.ClearValue;
  Edit1.Clear;
end;

procedure TfEtiqCliente.BitBtn1Click(Sender: TObject);
var
 i : Integer;
begin
  if tAuxEtiqueta.IsEmpty then
    begin
      ShowMessage('Não tem registro para imprimir!')
    end
  else
    begin
      fEscImpressora := TfEscImpressora.Create(Self);
      fEscImpressora.ShowModal;
      AssignFile(F,DM1.tImpressoraEndereco.AsString);
      ReWrite(F);
      Write(F,'0'#15);
      fQuant := TfQuant.Create(Self);
      fQuant.CurrencyEdit1.Value := 1;
      fQuant.ShowModal;
      for i := 1 to vQuant do
        begin
          tAuxEtiqueta.Refresh;
          tAuxEtiqueta.First;
          while not tAuxEtiqueta.Eof do
            begin
              Imprimir;
              tAuxEtiqueta.Next;
            end;
        end;
      CloseFile(F);
    end;
end;

procedure TfEtiqCliente.RxDBGrid2DblClick(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar a seleção!',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    tAuxEtiqueta.Delete;
end;

procedure TfEtiqCliente.RxDBLookupCombo3Enter(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Nome';
end;

procedure TfEtiqCliente.RxDBLookupCombo3Exit(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Codigo';
end;

procedure TfEtiqCliente.SpeedButton1Click(Sender: TObject);
begin
  if RxDBLookupCombo3.Text <> '' then
    begin
      tCliente.Filtered := False;
      tCliente.Filter   := 'CodVendedor = '''+IntToStr(RxDBLookupCombo3.KeyValue)+'''';
      tCliente.Filtered := True;
      tCliente.First;
      while not tCliente.Eof do
        begin
          tAuxEtiqueta.SetKey;
          tAuxEtiquetaCodigo.AsInteger := tClienteCodigo.AsInteger;
          if tAuxEtiqueta.GotoKey then
            begin
              tAuxEtiqueta.Edit;
              tAuxEtiquetaCodigo.AsInteger := tClienteCodigo.AsInteger;
              tAuxEtiqueta.Post;
              tAuxEtiqueta.Refresh;
            end
          else
            begin
              tAuxEtiqueta.Insert;
              tAuxEtiquetaCodigo.AsInteger := tClienteCodigo.AsInteger;
              tAuxEtiqueta.Post;
              tAuxEtiqueta.Refresh;
            end;
          tCliente.Next;
        end;
      tCliente.Filtered := False;
    end
  else
    begin
      ShowMessage('Deve ser escolhido um "Representante" p/ executar esta opção!');
      RxDBLookupCombo3.SetFocus;
    end;
end;

procedure TfEtiqCliente.SpeedButton2Click(Sender: TObject);
begin
  if DM1.tUsuarioClientes.AsBoolean then
    begin
      fCliente := TfCliente.Create(Self);
      fCliente.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfEtiqCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.

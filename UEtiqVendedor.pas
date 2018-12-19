unit UEtiqVendedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, RXLookup, ExtCtrls, Db,
  DBTables;

type
  TfEtiqVendedor = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label3: TLabel;
    Edit1: TEdit;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    Label4: TLabel;
    Bevel2: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    tVendedor: TTable;
    tVendedorCodigo: TIntegerField;
    tVendedorNome: TStringField;
    tVendedorPercComissao: TFloatField;
    tVendedorEndereco: TStringField;
    tVendedorBairro: TStringField;
    tVendedorCidade: TStringField;
    tVendedorEstado: TStringField;
    tVendedorCep: TStringField;
    tVendedorFone: TStringField;
    tVendedorFax: TStringField;
    tVendedorPessoa: TStringField;
    tVendedorCgcCpf: TStringField;
    tVendedorInscEst: TStringField;
    tVendedorRegioes: TIntegerField;
    tVendedorTipoComissao: TStringField;
    tVendedorPercImpRenda: TFloatField;
    tVendedorSelecionado: TBooleanField;
    dsVendedor: TDataSource;
    tAuxEtiqueta: TTable;
    dsAuxEtiqueta: TDataSource;
    tAuxEtiquetaCodigo: TIntegerField;
    tAuxEtiquetalkEndereco: TStringField;
    tAuxEtiquetalkNome: TStringField;
    tAuxEtiquetalkBairro: TStringField;
    tAuxEtiquetalkCidade: TStringField;
    tAuxEtiquetalkUf: TStringField;
    tAuxEtiquetalkCep: TStringField;
    tAuxEtiquetalkTelefone: TStringField;
    tAuxEtiquetalkFax: TStringField;
    tAuxEtiquetalkPessoa: TStringField;
    tAuxEtiquetalkCgc: TStringField;
    tAuxEtiquetalkInscrEst: TStringField;
    tVendedorContato: TStringField;
    tVendedorCaixaPostal: TStringField;
    tAuxEtiquetalkCaixaPostal: TStringField;
    SpeedButton1: TSpeedButton;
    BitBtn4: TBitBtn;
    tVendedorEmail: TStringField;
    tVendedorPagarParteNaNota: TBooleanField;
    tVendedorEndCorrespondencia: TStringField;
    tVendedorBaiCorrespondencia: TStringField;
    tVendedorCidCorrespondencia: TStringField;
    tVendedorUFCorrespondencia: TStringField;
    tVendedorCepCorrespondencia: TStringField;
    tAuxEtiquetalkEndCorrespondencia: TStringField;
    tAuxEtiquetalkBaiCorrespondencia: TStringField;
    tAuxEtiquetalkCidCorrespondencia: TStringField;
    tAuxEtiquetalkUFCorrespondencia: TStringField;
    tAuxEtiquetalkCepCorrespondencia: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure RxDBLookupCombo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    procedure Imprimir;
  public
    { Public declarations }
  end;

var
  fEtiqVendedor: TfEtiqVendedor;
  F: TextFile;

implementation

uses UDM1, UEscImpressora, UQuant, UVendedor, UAgendaTelef,
  URelEtiqVendedor;

{$R *.DFM}

procedure TfEtiqVendedor.Imprimir;
begin
  if tAuxEtiquetalkBairro.AsString <> '' then
    begin
      if (tAuxEtiquetaCodigo.AsInteger = 52) or (tAuxEtiquetaCodigo.AsInteger = 12) then
        writeln(F,'R E M E T E N T E: ');
      writeln(F,tAuxEtiquetalkNome.AsString);
      writeln(F,tAuxEtiquetalkEndCorrespondencia.AsString);
      writeln(F,tAuxEtiquetalkBaiCorrespondencia.AsString);
      writeln(F,tAuxEtiquetalkCidCorrespondencia.AsString + ' - ' + tAuxEtiquetalkUfCorrespondencia.AsString);
      writeln(F,'CEP: ' + tAuxEtiquetalkCepCorrespondencia.AsString);
      if tAuxEtiquetalkCaixaPostal.AsString = '' then
        writeln(F)
      else
        writeln(F,'Caixa Postal: ' + tAuxEtiquetalkCaixaPostal.AsString);
      writeln(F);
      writeln(F);
      if (tAuxEtiquetaCodigo.AsInteger <> 52) and (tAuxEtiquetaCodigo.AsInteger <> 12) then
        writeln(F);
    end
  else
    begin
      if (tAuxEtiquetaCodigo.AsInteger = 52) or (tAuxEtiquetaCodigo.AsInteger = 12) then
        writeln(F,'R E M E T E N T E: ');
      writeln(F,tAuxEtiquetalkNome.AsString);
      writeln(F,tAuxEtiquetalkEndCorrespondencia.AsString);
      writeln(F,tAuxEtiquetalkCidCorrespondencia.AsString + ' - ' + tAuxEtiquetalkUfCorrespondencia.AsString);
      writeln(F,'CEP: ' + tAuxEtiquetalkCepCorrespondencia.AsString);
      if tAuxEtiquetalkCaixaPostal.AsString = '' then
        writeln(F)
      else
        writeln(F,'Caixa Postal: ' + tAuxEtiquetalkCaixaPostal.AsString);
      writeln(F);
      writeln(F);
      writeln(F);
      if (tAuxEtiquetaCodigo.AsInteger <> 52) and (tAuxEtiquetaCodigo.AsInteger <> 12) then
        writeln(F);
    end;
  //Endereço Normal
  {if tAuxEtiquetalkBairro.AsString <> '' then
    begin
      if (tAuxEtiquetaCodigo.AsInteger = 52) or (tAuxEtiquetaCodigo.AsInteger = 12) then
        writeln(F,'R E M E T E N T E: ');
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
      writeln(F);
      if (tAuxEtiquetaCodigo.AsInteger <> 52) and (tAuxEtiquetaCodigo.AsInteger <> 12) then
        writeln(F);
    end
  else
    begin
      if (tAuxEtiquetaCodigo.AsInteger = 52) or (tAuxEtiquetaCodigo.AsInteger = 12) then
        writeln(F,'R E M E T E N T E: ');
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
      writeln(F);
      if (tAuxEtiquetaCodigo.AsInteger <> 52) and (tAuxEtiquetaCodigo.AsInteger <> 12) then
        writeln(F);
    end;}

end;

procedure TfEtiqVendedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM1.tVendedor.Close;
  tAuxEtiqueta.First;
  while not tAuxEtiqueta.EOF do
    tAuxEtiqueta.Delete;
  RxDBLookupCombo1.ClearValue;
  Edit1.Clear;
  Action := Cafree;
end;

procedure TfEtiqVendedor.RxDBLookupCombo1Enter(Sender: TObject);
begin
  tVendedor.IndexFieldNames := 'Nome';
end;

procedure TfEtiqVendedor.RxDBLookupCombo1Exit(Sender: TObject);
begin
  tVendedor.IndexFieldNames := 'Codigo';
end;

procedure TfEtiqVendedor.RxDBLookupCombo1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) then
    begin
      tAuxEtiqueta.SetKey;
      tAuxEtiquetaCodigo.AsInteger := tVendedorCodigo.AsInteger;
      if tAuxEtiqueta.GotoKey then
        begin
          tAuxEtiqueta.Edit;
          tAuxEtiquetaCodigo.AsInteger := tVendedorCodigo.AsInteger;
          tAuxEtiqueta.Post;
          tAuxEtiqueta.Refresh;
        end
      else
        begin
          tAuxEtiqueta.Insert;
          tAuxEtiquetaCodigo.AsInteger := tVendedorCodigo.AsInteger;
          tAuxEtiqueta.Post;
          tAuxEtiqueta.Refresh;
        end;
    end;
end;

procedure TfEtiqVendedor.Edit1Change(Sender: TObject);
begin
  try
    tVendedor.IndexFieldNames := 'Codigo';
    tVendedor.FindKey([Edit1.Text]);
  except
    ShowMessage('Digite só números aqui!');
  end;
end;

procedure TfEtiqVendedor.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) then
    begin
      tAuxEtiqueta.SetKey;
      tAuxEtiquetaCodigo.AsInteger := tVendedorCodigo.AsInteger;
      if tAuxEtiqueta.GotoKey then
        begin
          tAuxEtiqueta.Edit;
          tAuxEtiquetaCodigo.AsInteger := tVendedorCodigo.AsInteger;
          tAuxEtiqueta.Post;
          tAuxEtiqueta.Refresh;
          Edit1.SelectAll;
        end
      else
        begin
          tAuxEtiqueta.Insert;
          tAuxEtiquetaCodigo.AsInteger := tVendedorCodigo.AsInteger;
          tAuxEtiqueta.Post;
          tAuxEtiqueta.Refresh;
          Edit1.SelectAll;
        end;
    end;
end;

procedure TfEtiqVendedor.RxDBGrid1DblClick(Sender: TObject);
begin
  tAuxEtiqueta.SetKey;
  tAuxEtiquetaCodigo.AsInteger := tVendedorCodigo.AsInteger;
  if tAuxEtiqueta.GotoKey then
    begin
      tAuxEtiqueta.Edit;
      tAuxEtiquetaCodigo.AsInteger := tVendedorCodigo.AsInteger;
      tAuxEtiqueta.Post;
      tAuxEtiqueta.Refresh;
    end
  else
    begin
      tAuxEtiqueta.Insert;
      tAuxEtiquetaCodigo.AsInteger := tVendedorCodigo.AsInteger;
      tAuxEtiqueta.Post;
      tAuxEtiqueta.Refresh;
    end;
end;

procedure TfEtiqVendedor.BitBtn2Click(Sender: TObject);
begin
  tAuxEtiqueta.First;
  while not tAuxEtiqueta.EOF do
    tAuxEtiqueta.Delete;
  RxDBLookupCombo1.ClearValue;
  Edit1.Clear;
  tVendedor.First;
end;

procedure TfEtiqVendedor.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfEtiqVendedor.FormShow(Sender: TObject);
begin
  DM1.tVendedor.Open;
  tAuxEtiqueta.First;
  while not tAuxEtiqueta.EOF do
    tAuxEtiqueta.Delete;
  RxDBLookupCombo1.ClearValue;
  Edit1.Clear;
end;

procedure TfEtiqVendedor.BitBtn1Click(Sender: TObject);
var
 i : Integer;
begin
  if tAuxEtiqueta.IsEmpty then
    ShowMessage('Não tem registro para imprimir!')
  else
    begin
      fEscImpressora := TfEscImpressora.Create(Self);
      fEscImpressora.ShowModal;
      AssignFile(F,DM1.tImpressoraEndereco.AsString);
      ReWrite(F);
      Write(F,#15);
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

procedure TfEtiqVendedor.RxDBGrid2DblClick(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar essa seleção!',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    tAuxEtiqueta.Delete;
end;

procedure TfEtiqVendedor.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioVendedor.AsBoolean then
    begin
      fVendedor := TfVendedor.Create(Self);
      fVendedor.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfEtiqVendedor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

procedure TfEtiqVendedor.BitBtn4Click(Sender: TObject);
begin
  if tAuxEtiqueta.IsEmpty then
    ShowMessage('Não tem registro para imprimir!')
  else
    begin
      tAuxEtiqueta.First;
      fRelEtiqVendedor := TfRelEtiqVendedor.Create(Self);
      fRelEtiqVendedor.QuickRep1.Print;
      fRelEtiqVendedor.QuickRep1.Free;
    end;
end;

end.

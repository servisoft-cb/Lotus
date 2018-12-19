unit UEtiqFornecedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, RxLookup, ExtCtrls, Db,
  DBTables, Variants;

type
  TfEtiqFornecedor = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label3: TLabel;
    Edit1: TEdit;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    Label4: TLabel;
    Bevel2: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    tFornecedores: TTable;
    tFornecedoresCodForn: TIntegerField;
    tFornecedoresNomeForn: TStringField;
    tFornecedoresEndForn: TStringField;
    tFornecedoresBairroForn: TStringField;
    tFornecedoresCidadeForn: TStringField;
    tFornecedoresCEPForn: TStringField;
    tFornecedoresEstadoForn: TStringField;
    tFornecedoresTel1Forn: TStringField;
    tFornecedoresTel2Forn: TStringField;
    tFornecedoresFaxForn: TStringField;
    tFornecedoresCGC: TStringField;
    tFornecedoresInsc: TStringField;
    tFornecedoresContatoForn: TStringField;
    tFornecedoresDataCadastroForn: TDateField;
    tFornecedoresObsForn: TMemoField;
    tFornecedoresRamal: TStringField;
    tFornecedoresEmail: TStringField;
    tFornecedoresHomePage: TStringField;
    tFornecedoresCodCondPgto: TIntegerField;
    tFornecedoresFantasia: TStringField;
    tFornecedoresFornecedorOutros: TStringField;
    dsFornecedores: TDataSource;
    tAuxEtiqueta: TTable;
    tAuxEtiquetaCodigo: TIntegerField;
    dsAuxEtiqueta: TDataSource;
    tAuxEtiquetalkNome: TStringField;
    tAuxEtiquetalkFantasia: TStringField;
    tAuxEtiquetalkEndereco: TStringField;
    tAuxEtiquetalkBairro: TStringField;
    tAuxEtiquetalkUf: TStringField;
    tAuxEtiquetalkCep: TStringField;
    tAuxEtiquetalkTelefone: TStringField;
    tAuxEtiquetalkTelefone2: TStringField;
    tAuxEtiquetalkFax: TStringField;
    tAuxEtiquetalkCgc: TStringField;
    tAuxEtiquetalkInscrEst: TStringField;
    tAuxEtiquetalkContato: TStringField;
    tAuxEtiquetalkDtCadastro: TStringField;
    SpeedButton1: TSpeedButton;
    tFornecedoresCodCidade: TIntegerField;
    tFornecedoreslkCidade: TStringField;
    tAuxEtiquetalkCidade: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure RxDBLookupCombo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Imprimir;
  public
    { Public declarations }
  end;

var
  fEtiqFornecedor: TfEtiqFornecedor;
  F: TextFile;

implementation

uses UDM1, UEscImpressora, UQuant, UFornecedores, UAgendaTelef;

{$R *.DFM}

procedure TfEtiqFornecedor.Imprimir;
begin
  if tAuxEtiquetalkBairro.AsString <> '' then
    begin
      writeln(F);
      writeln(F,tAuxEtiquetalkNome.AsString);
      writeln(F,tAuxEtiquetalkEndereco.AsString);
      writeln(F,tAuxEtiquetalkBairro.AsString);
      writeln(F,tAuxEtiquetalkCidade.AsString + ' - ' + tAuxEtiquetalkUf.AsString);
      writeln(F,'CEP: ' + tAuxEtiquetalkCep.AsString);
      writeln(F);
      writeln(F);
    end
  else
    begin
      writeln(F);
      writeln(F,tAuxEtiquetalkNome.AsString);
      writeln(F,tAuxEtiquetalkEndereco.AsString);
      writeln(F,tAuxEtiquetalkCidade.AsString + ' - ' + tAuxEtiquetalkUf.AsString);
      writeln(F,'CEP: ' + tAuxEtiquetalkCep.AsString);
      writeln(F);
      writeln(F);
      writeln(F);
    end;
end;

procedure TfEtiqFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tAuxEtiqueta.First;
  while not tAuxEtiqueta.EOF do
    tAuxEtiqueta.Delete;
  RxDBLookupCombo1.ClearValue;
  RxDBLookupCombo2.ClearValue;
  Edit1.Clear;
  DM1.tFornecedores.Close;
  Action := Cafree;
end;

procedure TfEtiqFornecedor.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfEtiqFornecedor.RxDBLookupCombo1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) then
    begin
      tAuxEtiqueta.SetKey;
      tAuxEtiquetaCodigo.AsInteger := tFornecedoresCodForn.AsInteger;
      if tAuxEtiqueta.GotoKey then
        begin
          tAuxEtiqueta.Edit;
          tAuxEtiquetaCodigo.AsInteger := tFornecedoresCodForn.AsInteger;
          tAuxEtiqueta.Post;
          tAuxEtiqueta.Refresh;
        end
      else
        begin
          tAuxEtiqueta.Insert;
          tAuxEtiquetaCodigo.AsInteger := tFornecedoresCodForn.AsInteger;
          tAuxEtiqueta.Post;
          tAuxEtiqueta.Refresh;
        end;
    end;
end;

procedure TfEtiqFornecedor.RxDBLookupCombo1Enter(Sender: TObject);
begin
  tFornecedores.IndexFieldNames := 'NomeForn';
end;

procedure TfEtiqFornecedor.RxDBLookupCombo1Exit(Sender: TObject);
begin
  tFornecedores.IndexFieldNames := 'CodForn';
end;

procedure TfEtiqFornecedor.FormShow(Sender: TObject);
begin
  DM1.tFornecedores.Open;
  tAuxEtiqueta.First;
  while not tAuxEtiqueta.EOF do
    tAuxEtiqueta.Delete;
  RxDBLookupCombo1.ClearValue;
  RxDBLookupCombo2.ClearValue;
  Edit1.Clear;
end;

procedure TfEtiqFornecedor.RxDBLookupCombo2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) then
    begin
      tAuxEtiqueta.SetKey;
      tAuxEtiquetaCodigo.AsInteger := tFornecedoresCodForn.AsInteger;
      if tAuxEtiqueta.GotoKey then
        begin
          tAuxEtiqueta.Edit;
          tAuxEtiquetaCodigo.AsInteger := tFornecedoresCodForn.AsInteger;
          tAuxEtiqueta.Post;
          tAuxEtiqueta.Refresh;
        end
      else
        begin
          tAuxEtiqueta.Insert;
          tAuxEtiquetaCodigo.AsInteger := tFornecedoresCodForn.AsInteger;
          tAuxEtiqueta.Post;
          tAuxEtiqueta.Refresh;
        end;
    end;
end;

procedure TfEtiqFornecedor.RxDBLookupCombo2Exit(Sender: TObject);
begin
  tFornecedores.IndexFieldNames := 'CodForn';
end;

procedure TfEtiqFornecedor.RxDBLookupCombo2Enter(Sender: TObject);
begin
  tFornecedores.IndexFieldNames := 'Fantasia';
end;

procedure TfEtiqFornecedor.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) then
    begin
      tAuxEtiqueta.SetKey;
      tAuxEtiquetaCodigo.AsInteger := tFornecedoresCodForn.AsInteger;
      if tAuxEtiqueta.GotoKey then
        begin
          tAuxEtiqueta.Edit;
          tAuxEtiquetaCodigo.AsInteger := tFornecedoresCodForn.AsInteger;
          tAuxEtiqueta.Post;
          tAuxEtiqueta.Refresh;
          Edit1.SelectAll;
        end
      else
        begin
          tAuxEtiqueta.Insert;
          tAuxEtiquetaCodigo.AsInteger := tFornecedoresCodForn.AsInteger;
          tAuxEtiqueta.Post;
          tAuxEtiqueta.Refresh;
          Edit1.SelectAll;
        end;
    end;
end;

procedure TfEtiqFornecedor.Edit1Change(Sender: TObject);
begin
  try
    tFornecedores.IndexFieldNames := 'CodForn';
    tFornecedores.FindKey([Edit1.Text]);
  except
    ShowMessage('Digite só números aqui!');
  end;
end;

procedure TfEtiqFornecedor.RxDBGrid1DblClick(Sender: TObject);
begin
  tAuxEtiqueta.SetKey;
  tAuxEtiquetaCodigo.AsInteger := tFornecedoresCodForn.AsInteger;
  if tAuxEtiqueta.GotoKey then
    begin
      tAuxEtiqueta.Edit;
      tAuxEtiquetaCodigo.AsInteger := tFornecedoresCodForn.AsInteger;
      tAuxEtiqueta.Post;
      tAuxEtiqueta.Refresh;
    end
  else
    begin
      tAuxEtiqueta.Insert;
      tAuxEtiquetaCodigo.AsInteger := tFornecedoresCodForn.AsInteger;
      tAuxEtiqueta.Post;
      tAuxEtiqueta.Refresh;
    end;
end;

procedure TfEtiqFornecedor.RxDBGrid2DblClick(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar a seleção!',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    tAuxEtiqueta.Delete;
end;

procedure TfEtiqFornecedor.BitBtn2Click(Sender: TObject);
begin
  tAuxEtiqueta.First;
  while not tAuxEtiqueta.EOF do
    tAuxEtiqueta.Delete;
  RxDBLookupCombo1.ClearValue;
  RxDBLookupCombo2.ClearValue;
  Edit1.Clear;
  tFornecedores.First;
end;

procedure TfEtiqFornecedor.BitBtn1Click(Sender: TObject);
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

procedure TfEtiqFornecedor.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioFornecedores.AsBoolean then
    begin
      fFornecedores := TfFornecedores.Create(Self);
      fFornecedores.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfEtiqFornecedor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.

unit UConsClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, DB, DBTables, Grids, DBGrids, SMDBGrid,
  StdCtrls, Buttons, RxLookup, ExtCtrls, RzCmboBx, RzDBCmbo;

type
  TfConsClientes = class(TForm)
    StaticText1: TStaticText;
    qClientes: TQuery;
    dsqClientes: TDataSource;
    SMDBGrid1: TSMDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel2: TBevel;
    Label5: TLabel;
    Edit1: TEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label6: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label7: TLabel;
    RxDBLookupCombo5: TRxDBLookupCombo;
    Label8: TLabel;
    Label9: TLabel;
    ComboBox2: TComboBox;
    ComboBox1: TComboBox;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    CheckBox2: TCheckBox;
    tCidade2: TTable;
    tCidade2Codigo: TIntegerField;
    tCidade2Nome: TStringField;
    tCidade2Estado: TStringField;
    tCidade2Prefixo: TStringField;
    tCidade2Cep: TStringField;
    tCidade2CodMunicipio: TStringField;
    qClientesCodigo: TIntegerField;
    qClientesNome: TStringField;
    qClientesTelefone: TStringField;
    qClientesFax: TStringField;
    qClientesUf: TStringField;
    qClientesCgcCpf: TStringField;
    qClientesLojas: TIntegerField;
    qClientesNomeLoja: TStringField;
    qClientesNomeCidade: TStringField;
    qClientesMercado: TStringField;
    qClientesCodVendedor: TIntegerField;
    qClientesNomeVendedor: TStringField;
    qClientesEndEntrega: TStringField;
    qClientesBairroEntrega: TStringField;
    qClientesCepEntrega: TStringField;
    qClientesUfEntrega: TStringField;
    qClientesEndPgto: TStringField;
    qClientesBairroPgto: TStringField;
    qClientesCepPgto: TStringField;
    qClientesUfPgto: TStringField;
    qClientesEndereco: TStringField;
    qClientesBairro: TStringField;
    qClientesCep: TStringField;
    qClientesObs: TMemoField;
    qClientesCaixaPostal: TStringField;
    qClientesEmail: TStringField;
    qClientesCodCidadeE: TIntegerField;
    qClientesCodCidadeP: TIntegerField;
    qClientesInscrEst: TStringField;
    qClientesPessoa: TStringField;
    qClientesFantasia: TStringField;
    qClientesDtCadastro: TDateField;
    qClientesTelefone2: TStringField;
    qClientesContato: TStringField;
    qClientesDDDFone1: TIntegerField;
    qClientesDDDFone2: TIntegerField;
    qClientesDDDFax: TIntegerField;
    qClientesHomePage: TStringField;
    qClientesCgcCpfEntrega: TStringField;
    qClientesInscEntrega: TStringField;
    qClientesCidade: TStringField;
    qClientesAprovCredito: TStringField;
    qClientesTipoAprov: TStringField;
    qClientesCidEntrega: TStringField;
    qClientesCidPgto: TStringField;
    qClientesObsCtas: TMemoField;
    qClientesSelecionado: TBooleanField;
    qClientesRg: TStringField;
    qClientesCodCidade: TIntegerField;
    qClientesNumEnd: TStringField;
    qClientesComplEndereco: TStringField;
    qClientesEmailNFe: TStringField;
    qClientesNumEndEntrega: TStringField;
    qClientesComplEnderecoEntrega: TStringField;
    ckImpEmail: TCheckBox;
    qClienteslkCidEntrega: TStringField;
    qClienteslkCidPgto: TStringField;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure SMDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure RxDBLookupCombo5Enter(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
  private
    { Private declarations }
    procedure Consulta(Tipo : Integer); //0 Pelo nome  1= Pela cidade ou estado

  public
    { Public declarations }
  end;

var
  fConsClientes: TfConsClientes;

implementation

uses URelClientes2, UDM1, UDM2;

{$R *.dfm}

procedure TfConsClientes.Consulta(Tipo : Integer);
begin
  qClientes.Close;
  qClientes.SQL.Clear;
  qClientes.SQL.Add('SELECT C.Codigo, C.Nome, C.Telefone, C.Fax, C.Uf, C.CgcCpf, C.Lojas, Dblojas.Nome NomeLoja, Dbcidade.Nome NomeCidade,');
  qClientes.SQL.Add('C.Mercado, C.CodVendedor, Dbvendedor.Nome NomeVendedor, C.EndEntrega, C.BairroEntrega, C.CepEntrega,');
  qClientes.SQL.Add('C.UfEntrega, C.EndPgto, C.BairroPgto, C.CepPgto, C.UfPgto, C.Endereco, C.Bairro, C.Cep, C.Obs, C.CaixaPostal, C.Email, C.CodCidadeE,');
  qClientes.SQL.Add('C.CodCidadeP, C.InscrEst, C.Pessoa, C.Fantasia, C.DtCadastro, C.Telefone2, C.Contato, C.DDDFone1, C.DDDFone2, C.DDDFax,');
  qClientes.SQL.Add('C.HomePage, C.CgcCpfEntrega, C.InscEntrega,');
  qClientes.SQL.Add('C.Cidade, C.AprovCredito, C.TipoAprov, C.CidEntrega, C.CidPgto, C.ObsCtas, C.Selecionado, C.Rg, C.CodCidade,');
  qClientes.SQL.Add('C.NumEnd, C.ComplEndereco, C.EmailNFe, C.NumEndEntrega, C.ComplEnderecoEntrega');
  qClientes.SQL.Add('FROM "dbcliente.DB" C');
  qClientes.SQL.Add(' LEFT JOIN "DBCIDADE.DB" Dbcidade ON (C.CodCidade = Dbcidade.Codigo)');
  qClientes.SQL.Add(' LEFT JOIN "DBLOJAS.DB" Dblojas ON (C.Lojas = Dblojas.Codigo)');
  qClientes.SQL.Add(' LEFT JOIN "DBVENDEDOR.DB" Dbvendedor ON (C.CodVendedor = Dbvendedor.Codigo)');
  qClientes.SQL.Add('WHERE (0=0)');
  if (Edit1.Text <> '') then
  begin
    qClientes.SQL.Add(' AND ((C.Nome LIKE ''%' + Edit1.Text + '%'')');
    qClientes.SQL.Add(' OR (C.Fantasia LIKE ''%' + Edit1.Text + '%''))');
  end;

  if Tipo = 1 then
  begin
    if RxDBLookupCombo3.Text <> '' then
    begin
      qClientes.SQL.Add(' AND (C.Lojas = :Lojas)');
      qClientes.ParamByName('Lojas').AsInteger := RxDBLookupCombo3.KeyValue;
    end;
    if RxDBLookupCombo1.Text <> '' then
    begin
      qClientes.SQL.Add(' AND (C.CodCidade = :CodCidade)');
      qClientes.ParamByName('CodCidade').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
    if ComboBox1.Text <> '' then
    begin
      qClientes.SQL.Add(' AND (C.Mercado = :Mercado)');
      Case ComboBox1.ItemIndex of
        0 : qClientes.ParamByName('Mercado').AsString := 'O';
        1 : qClientes.ParamByName('Mercado').AsString := 'I';
      end;
    end;
    if RxDBLookupCombo5.Text <> '' then
    begin
      qClientes.SQL.Add(' AND (C.CodVendedor = :CodVendedor)');
      qClientes.ParamByName('CodVendedor').AsInteger := RxDBLookupCombo5.KeyValue;
    end;
    if RxDBLookupCombo4.Text <> '' then
    begin
      qClientes.SQL.Add(' AND (C.Uf = :Uf)');
      qClientes.ParamByName('Uf').AsString := RxDBLookupCombo4.KeyValue;
    end;
  end;
  Case ComboBox2.ItemIndex of
    0 : qClientes.SQL.Add('ORDER BY dbLojas.Nome, C.Nome');
    1 : qClientes.SQL.Add('ORDER BY dbLojas.Nome, C.Codigo');
    2 : qClientes.SQL.Add('ORDER BY dbLojas.Nome, dbCidade.Nome, C.Nome');
    3 : qClientes.SQL.Add('ORDER BY dbLojas.Nome, C.Uf, C.Nome');
    4 : qClientes.SQL.Add('ORDER BY dbLojas.Nome, C.Nome, C.Codigo');
  end;
  qClientes.Open;
end;

procedure TfConsClientes.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Consulta(0);
end;

procedure TfConsClientes.BitBtn1Click(Sender: TObject);
begin
  Consulta(1);
end;

procedure TfConsClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qClientes.Close;
   Action := Cafree;
end;

procedure TfConsClientes.BitBtn3Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  SMDBGrid1.DisableScroll;
  Screen.Cursor := crDefault;
  fRelClientes2 := TfRelClientes2.Create(Self);
  fRelClientes2.RLReport1.Preview;
  fRelClientes2.RLReport1.Free;
  FreeAndNil(fRelClientes2);
  SMDBGrid1.EnableScroll;
end;

procedure TfConsClientes.FormShow(Sender: TObject);
begin
  Top    := 0;
  Left   := 0;
  Width  := Screen.Width;
  Height := Screen.Height - 35;
  Edit1.SetFocus;
end;

procedure TfConsClientes.ComboBox1Exit(Sender: TObject);
begin
  {Case ComboBox1.ItemIndex of
    0 : qClientesMercado.AsString := 'I';
    1 : qClientesMercado.AsString := 'E';
  end;}
end;

procedure TfConsClientes.SMDBGrid1DblClick(Sender: TObject);
begin
  if qClientesCodigo.AsInteger > 0 then
    DM1.tCliente.Locate('Codigo',qClientesCodigo.AsInteger,[loCaseInsensitive]);
  Close;
end;

procedure TfConsClientes.SMDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      if qClientesCodigo.AsInteger > 0 then
      DM1.tCliente.Locate('Codigo',qClientesCodigo.AsInteger,[loCaseInsensitive]);
      Key := #0;
    Close;
    end;
end;

procedure TfConsClientes.RxDBLookupCombo5Enter(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Nome';
end;

procedure TfConsClientes.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tCidade.IndexFieldNames := 'Nome';
end;

end.

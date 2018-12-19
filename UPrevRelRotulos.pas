unit UPrevRelRotulos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, CurrEdit, Buttons, ExtCtrls, Db, DBTables,
  DBFilter, MemTable;

type
  TfPrevRelRotulos = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    BitBtn6: TBitBtn;
    BitBtn1: TBitBtn;
    CurrencyEdit1: TCurrencyEdit;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    CurrencyEdit4: TCurrencyEdit;
    Bevel2: TBevel;
    qRotulos: TQuery;
    qPedidoNota: TQuery;
    qPedidoNotaPedido: TIntegerField;
    qPedidoNotaNumNota: TIntegerField;
    qRotulosNumNota: TIntegerField;
    qRotulosNome: TStringField;
    qRotulosEndereco: TStringField;
    qRotulosBairro: TStringField;
    qRotulosUf: TStringField;
    qRotulosCep: TStringField;
    qRotulosQtd: TIntegerField;
    qRotulosNome_1: TStringField;
    mRotulos: TMemoryTable;
    mRotulosCliente: TStringField;
    mRotulosEndereco: TStringField;
    mRotulosCep: TStringField;
    mRotulosCidade: TStringField;
    mRotulosUF: TStringField;
    mRotulosNotaFiscal: TStringField;
    msRotulos: TDataSource;
    mRotulosPedido: TIntegerField;
    mRotulosPedidoCliente: TStringField;
    mRotulosPedidoRepresentante: TStringField;
    StaticText3: TStaticText;
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
//    procedure Imprime_Rotulo;
  public
    { Public declarations }
  end;

var
  fPrevRelRotulos: TfPrevRelRotulos;
  Linha, Pagina : Integer;
  F: TextFile;
  textoNota1, textoNota2 : String;

implementation

uses UDM1, UEscImpressora, URelRotulos;

{$R *.DFM}

{procedure TfPrevRelRotulos.Imprime_Rotulo;
var
 i : Integer;
 texto1, texto2 : String;
begin
  if linha > 60 then
    begin
      while linha < 66 do
        begin
          Linha := Linha + 1;
          Writeln(F);
        end;
      linha := 0;
    end;

  texto1 := DM1.tEmpresaEmpresa.AsString;
  Writeln(F,Texto1);
  Writeln(F);

  texto1 := 'Cliente.......: ' + qRotulos.FieldByName('Nome').AsString;
  Writeln(F,Texto1);

  texto1 := 'Endereco......: ' + qRotulos.FieldByName('Endereco').AsString;
  Writeln(F,Texto1);

  texto1 := 'Cep...........: ' + qRotulos.FieldByName('Cep').AsString;
  for i := 1 to 25 - Length(texto1) do
    texto1 := texto1 + ' ';
  texto2 := qRotulos.FieldByName('Cidade').AsString;
  for i := 1 to 26 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + '         Cidade: ' + texto2 + 'Uf: ' + qRotulos.FieldByName('Uf').AsString;
  Writeln(F,Texto1);

  Writeln(F,TextoNota1);
  Writeln(F,TextoNota2);
  Writeln(F);
  Writeln(F,'===============================================================================');

  linha := linha + 9;
end;}

procedure TfPrevRelRotulos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Dm1.tPedido.Close;
  Dm1.tNotaFiscal.Close;
  DM1.tCliente.Close;
  DM1.tUF.Close;
  Action := Cafree;
end;

procedure TfPrevRelRotulos.BitBtn6Click(Sender: TObject);
var
  i : Integer;
  vQtdAux : Integer;
begin
  Edit1.Text := Trim(Edit1.Text);
  if (RadioGroup1.ItemIndex = 0) and (Edit1.Text = '') then
  begin
    ShowMessage('Série não informada!');
    exit;
  end;

  if (CurrencyEdit1.Text <> '') and (CurrencyEdit4.Text <> '') then
  begin
    mRotulos.EmptyTable;
    Case RadioGroup1.ItemIndex of
      0 : begin
            DM1.tCliente.IndexFieldNames := 'Codigo';
            DM1.tNotaFiscal.IndexFieldNames := 'NumNota';
            DM1.tNotaFiscal.Filtered := False;
            DM1.tNotaFiscal.Filter   := 'NumNota >= '''+CurrencyEdit1.Text+''' and NumNota <= '''+CurrencyEdit4.Text+''' and Serie = '''+Edit1.Text +''' and Cancelada <> True and SaidaEntrada = ''S''';
            DM1.tNotaFiscal.Filtered := True;
            DM1.tNotaFiscal.First;
            while not DM1.tNotaFiscal.Eof do
            begin
              DM1.tCliente.FindKey([Dm1.tNotaFiscalCodCli.AsInteger]);
              if DM1.tNotaFiscalQtd.AsInteger > 0 then
                vQtdAux := DM1.tNotaFiscalQtd.AsInteger
              else
                vQtdAux := 1;
              for i := 1 to vQtdAux do
              begin
                mRotulos.Insert;
                if Dm1.tClienteEndEntrega.AsString <> '' then
                begin
                  mRotulosCep.AsString      := DM1.tClienteCepEntrega.AsString;
                  mRotulosCidade.AsString   := DM1.tClientelkCidadeE.AsString;
                  mRotulosEndereco.AsString := DM1.tClienteEndEntrega.AsString;
                end
                else
                begin
                  mRotulosCep.AsString      := DM1.tNotaFiscallkCepCli.AsString;
                  mRotulosCidade.AsString   := DM1.tNotaFiscallkCidade.AsString;
                  mRotulosEndereco.AsString := DM1.tNotaFiscallkEndCli.AsString + ', ' + DM1.tNotaFiscallkNumEnd.AsString + ' - ' + DM1.tNotaFiscallkComplEndereco.AsString;
                end;
                mRotulosCliente.AsString    := DM1.tNotaFiscallkNomeCli.AsString;
                mRotulosNotaFiscal.AsString := DM1.tNotaFiscalNumNota.AsString;
                mRotulosUF.AsString         := DM1.tNotaFiscallkUf.AsString;
                mRotulosPedidoCliente.AsString := DM1.tNotaFiscalPedidoCliente.AsString;
                mRotulosPedidoRepresentante.AsString := DM1.tNotaFiscalPedidoRepresentante.AsString;
                mRotulos.Post;
              end;
              DM1.tNotaFiscal.Next;
            end;
          end;
      1 : begin
            DM1.tPedido.IndexFieldNames := 'Pedido';
            DM1.tPedido.Filtered := False;
            DM1.tPedido.Filter   := 'Pedido >= '''+CurrencyEdit1.Text+''' and Pedido <= '''+CurrencyEdit4.Text+''' and Cancelado <> True and Suspenso <> True';
            DM1.tPedido.Filtered := True;
            DM1.tPedido.First;
            while not DM1.tPedido.Eof do
            begin
              Dm1.tCliente.IndexFieldNames := 'Codigo';
              Dm1.tCliente.SetKey;
              Dm1.tClienteCodigo.AsInteger := Dm1.tPedidoCodCliente.AsInteger;
              Dm1.tCliente.GotoKey;
              for i := 1 to CurrencyEdit2.AsInteger do
              begin
                mRotulos.Insert;
                if Dm1.tClienteEndEntrega.AsString <> '' then
                begin
                  mRotulosCep.AsString        := DM1.tClienteCepEntrega.AsString;
                  mRotulosCidade.AsString     := DM1.tClientelkCidadeE.AsString;
                  mRotulosEndereco.AsString   := DM1.tClienteEndEntrega.AsString + ', ' + dm1.tClienteNumEndEntrega.AsString;
                end
                else
                begin
                  mRotulosCep.AsString        := DM1.tPedidolkCep.AsString;
                  mRotulosCidade.AsString     := DM1.tPedidolkCidade.AsString;
                  mRotulosEndereco.AsString   := DM1.tPedidolkEndereco.AsString + ', ' + dm1.tPedidolkNumEnd.AsString + ' - ' + dm1.tPedidolkComplEndereco.AsString;
                end;
                mRotulosCliente.AsString    := DM1.tPedidolkNomeCliente.AsString;
                mRotulosNotaFiscal.AsString := '0';
                mRotulosPedido.AsInteger    := DM1.tPedidoPedido.AsInteger;
                mRotulosUF.AsString         := DM1.tPedidolkUf.AsString;
              end;
              DM1.tPedido.Next;
            end;
          end;
    end;
    fRelRotulos              := TfRelRotulos.Create(Self);
    fRelRotulos.QuickRep1.Preview;
    fRelRotulos.QuickRep1.Free;
    DM1.tNotaFiscal.Filtered := False;
    DM1.tPedido.Filtered     := False;
  end
else
  begin
    ShowMessage('Você deve informar Nº "Inicial" e "Final" p/ gerar a impressão!');
    CurrencyEdit1.SetFocus;
  end;
end;

procedure TfPrevRelRotulos.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevRelRotulos.RadioGroup1Click(Sender: TObject);
begin
  Case RadioGroup1.ItemIndex of
    0: CurrencyEdit2.ReadOnly := True;
    1: CurrencyEdit2.ReadOnly := False;
  end;
end;

procedure TfPrevRelRotulos.FormShow(Sender: TObject);
begin
  Dm1.tPedido.Open;
  Dm1.tNotaFiscal.Open;
  DM1.tCliente.Open;
  DM1.tUF.Open;
end;

end.

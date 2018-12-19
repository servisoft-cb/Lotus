unit USobre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, RXCtrls, Db, DBTables, DBIProcs,
  DBFilter, Grids, DBGrids, MemTable, jpeg, ComCtrls, variants;

type
  TfSobre = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBText1: TDBText;
    RxLabel1: TRxLabel;
    Label9: TLabel;
    BitBtn3: TBitBtn;
    Label7: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    ProgressBar1: TProgressBar;
    Image1: TImage;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    procedure PreparaNFE;
    procedure Ajustar_CPagar;

  public

    { Public declarations }
  end;

var
  fSobre: TfSobre;
  vLargura : String[1];
  vVlrUnitario : Real;

implementation

uses UEmpresa, UDM1, UDM2, StrUtils, uUtilPadrao, uIntegracao;

{$R *.DFM}

procedure TfSobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfSobre.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfSobre.BitBtn2Click(Sender: TObject);
begin
  fEmpresa := TfEmpresa.Create(Self);
  fEmpresa.ShowModal;
end;

procedure TfSobre.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 82) then
  begin
    BitBtn2.Enabled   := not BitBtn2.Enabled;
    BitBtn3.Enabled   := not BitBtn3.Enabled;
    CheckBox1.Visible := not(CheckBox1.Visible);
    CheckBox2.Visible := not(CheckBox2.Visible);
  end;
end;

procedure TfSobre.BitBtn3Click(Sender: TObject);
var
  vCodNatOper : String;
  vTexto : String;
begin
  Screen.Cursor := crHourGlass;
  if CheckBox1.Checked then
  begin
    DM1.tMaterial.Open;
    ProgressBar1.Max      := DM1.tMaterial.RecordCount;
    ProgressBar1.Position := 0;
    DM1.tMaterial.First;
    while not DM1.tMaterial.Eof do
    begin
      DM1.tMaterial.Edit;
      DM1.tMaterialNomeSemAcento.AsString := TirarAcento(DM1.tMaterialNome.AsString);
      DM1.tMaterial.Post;
      Prc_Gravar_Material_FB(DM1.tMaterialCodigo.AsInteger);
      DM1.tMaterial.Next;
    end;
  end;

  if CheckBox2.Checked then
  begin
    DM1.tCliente.Open;
    ProgressBar1.Max      := DM1.tCliente.RecordCount;
    ProgressBar1.Position := 0;
    DM1.tCliente.First;
    while not DM1.tCliente.Eof do
    begin
      DM1.tCliente.Edit;
      DM1.tClienteNomeSemAcento.AsString := TirarAcento(DM1.tClienteNome.AsString);
      DM1.tCliente.Post;
      Prc_Gravar_Cliente_FB(DM1.tClienteCodigo.AsInteger);
      DM1.tCliente.Next;
    end;
  end;

  {DM1.tProduto.First;
  while not DM1.tProduto.Eof do
  begin
    ProgressBar1.Position := ProgressBar1.Position + 1;
    if (trim(DM1.tProdutoEndFoto.AsString) <> '') and not(DM1.tProdutoEndFoto.IsNull) then
    begin
      vTexto := DM1.tProdutoEndFoto.AsString;
      if copy(vTexto,1,8) = '\\pcp\D\' then
      begin
        vTexto := copy(vTexto,9,Length(vTexto) - 8);
        vTexto := '\\Server2012\sistema\' + vTexto;
        DM1.tProduto.Edit;
        DM1.tProdutoEndFoto.AsString := vTexto;
        DM1.tProduto.Post;
      end;
    end;
    DM1.tProduto.Next;
  end;}

  Screen.Cursor   := crDefault;
  ShowMessage('Conversão gerada com sucesso!');
  BitBtn2.Enabled := not BitBtn2.Enabled;
  BitBtn3.Enabled := not BitBtn3.Enabled;
end;

procedure TfSobre.PreparaNFE;
begin

end;

procedure TfSobre.Ajustar_CPagar;
begin
  if not DM1.tCPagar.Locate('NumSeqNEntrada;CodForn',VarArrayOf([DM1.tNEntradaNumSeq.AsInteger,DM1.tNEntradaCodForn.AsInteger]),[loCaseInsensitive]) then
    exit;

  DM1.tCPagarParc.First;
  while not DM1.tCPagarParc.Eof do
  begin
    DM1.tCPagarParc.Edit;
    DM1.tCPagarParcDtEmissaoNota.AsDateTime := DM1.tNEntradaDtEmissaoNEntr.AsDateTime;
    DM1.tCPagarParc.Post;
    DM1.tCPagarParc.Next;
  end;

  DM1.tCPagar.Edit;
  DM1.tCPagarDtEmissaoNota.AsDateTime := DM1.tNEntradaDtEmissaoNEntr.AsDateTime;
  DM1.tCPagar.Post;
  DM1.tCPagar.Next;
end;

end.

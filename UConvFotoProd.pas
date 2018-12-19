unit UConvFotoProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDM1, StdCtrls, Buttons, ExtCtrls, JPEG, Db, DBTables, Mask,
  ToolEdit;

type
  TfConvFotoProd = class(TForm)
    BitBtn1: TBitBtn;
    Image2: TImage;
    DirectoryEdit1: TDirectoryEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure Le_Imagem_JPEG(Campo:TBlobField;Foto:TImage);
    Function  Monta_Texto(Campo : String ; Tamanho : Integer) : String;

  public
    { Public declarations }
  end;

var
  fConvFotoProd: TfConvFotoProd;

implementation

{$R *.dfm}

procedure TfConvFotoProd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfConvFotoProd.BitBtn1Click(Sender: TObject);
var
  vTexto : String;
  vPasta : String;
  vLidos : Integer;
  i : Integer;
begin
  vPasta := DirectoryEdit1.Text;
  if copy(vPasta,Length(vPasta),1) <> '\' then
    vPasta := vPasta + '\';

  Label5.Caption := FormatFloat('0',DM1.tProduto.RecordCount);
  vLidos := 0;
  DM1.tProduto.Open;
  DM1.tProduto.First;
  while not DM1.tProduto.Eof do
  begin
    vLidos         := vLidos + 1;
    Label4.Caption := FormatFloat('0',vLidos);
    Label4.Refresh;
    fConvFotoProd.Refresh;
    if not DM1.tProdutoFotoJpeg.IsNull then
    begin
      vTexto := DM1.tProdutoReferencia.AsString;
      if trim(DM1.tProdutoDescMaterial.AsString) <> '' then
        vTexto := vTexto + '_' + DM1.tProdutoDescMaterial.AsString;
      vTexto := Monta_Texto(vTexto,0);
      vTexto := vPasta + vTexto + '.jpg';
      Le_Imagem_JPEG(DM1.tProdutoFotoJpeg,Image2);
      //Image2.Picture.SaveToFile('C:\A\Foto.jpg');
      Image2.Picture.SaveToFile(vTexto);
      DM1.tProduto.Edit;
      DM1.tProdutoEndFoto.AsString := vTexto;
      DM1.tProduto.Post;
    end
    else
    begin
      vTexto := DM1.tProdutoReferencia.AsString;
      if trim(DM1.tProdutoDescMaterial.AsString) <> '' then
        vTexto := vTexto + '_' + DM1.tProdutoDescMaterial.AsString;
      vTexto := Monta_Texto(vTexto,0);
      vTexto := vPasta + vTexto + '.jpg';
      if FileExists(vTexto) then
      begin
        DM1.tProduto.Edit;
        DM1.tProdutoEndFoto.AsString := vTexto;
        DM1.tProduto.Post;
      end;
    end;

    DM1.tProduto.Next;
  end;
  ShowMessage('*** Conversor concluído!');
end;

procedure TfConvFotoProd.Le_Imagem_JPEG(Campo: TBlobField; Foto: TImage);
var
  BS : TBlobStream;
  MinhaImagem : TJPEGImage;
begin
  if Campo.AsString <> '' then
  begin
    BS := TBlobStream.Create((Campo as TBlobField), BMRead);
    MinhaImagem := TJPEGImage.Create;
    MinhaImagem.LoadFromStream(BS);
    Foto.Picture.Assign(MinhaImagem);
    BS.Free;
    MinhaImagem.Free;
  end;
end;

function TfConvFotoProd.Monta_Texto(Campo: String;
  Tamanho: Integer): String;
var
  texto2 : String;
  i : Integer;
begin
  texto2 := '';
  for i := 1 to Length(Campo) do
  begin
    if not(Campo[i] in ['/','\','&','*']) then
      Texto2 := Texto2 + Copy(Campo,i,1)
    else
      Texto2 := Texto2 + '.';
  end;
  Result := texto2;
end;

end.

unit UPrevProdColecao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RxLookup, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, RXDBCtrl, Db,
  DBTables, RXCtrls, Menus;

type
  TfPrevProdColecao = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    tProduto: TTable;
    dsProduto: TDataSource;
    tProdutoCodigo: TIntegerField;
    tProdutoCodGrupo: TIntegerField;
    tProdutoReferencia: TStringField;
    tProdutoNome: TStringField;
    tProdutoDescMaterial: TStringField;
    tProdutoConstrucao: TStringField;
    tProdutoNomeExp: TStringField;
    Panel2: TPanel;
    RxSpeedButton1: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    Imprimir1: TMenuItem;
    Visualizar1: TMenuItem;
    BitBtn3: TBitBtn;
    tProdutoMercado: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita;
  public
    { Public declarations }
  end;

var
  fPrevProdColecao: TfPrevProdColecao;

implementation

uses UDM1, URelProdColecao;

{$R *.DFM}

procedure TfPrevProdColecao.Habilita;
begin
  BitBtn1.Enabled := not(BitBtn1.Enabled);
  BitBtn2.Enabled := not(BitBtn2.Enabled);
end;

procedure TfPrevProdColecao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tProduto.Filtered := False;
  Dm1.tGrupo.Close;
  DM1.tConstrucao.Close;
  DM1.tProduto.Close;
  DM1.tSubGrupo.Close;
  Action := Cafree;
end;

procedure TfPrevProdColecao.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tGrupo.IndexFieldNames := 'Nome';
end;

procedure TfPrevProdColecao.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tGrupo.IndexFieldNames := 'Codigo';
end;

procedure TfPrevProdColecao.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevProdColecao.BitBtn1Click(Sender: TObject);
begin
  Habilita;
  Case RadioGroup1.ItemIndex of
    0 : begin
          tProduto.Filtered := False;
          if RxDBLookupCombo1.Text <> '' then
            tProduto.Filter := 'CodGrupo = '''+IntToStr(RxDBLookupCombo1.KeyValue)+''' and Mercado = ''I'''
          else
            tProduto.Filter := 'Mercado = ''I''';
          tProduto.Filtered := True;
          tProduto.First;
        end;
    1 : begin
          tProduto.Filtered := False;
          if RxDBLookupCombo1.Text <> '' then
            tProduto.Filter := 'CodGrupo = '''+IntToStr(RxDBLookupCombo1.KeyValue)+''' and Mercado = ''E'''
          else
            tProduto.Filter := 'Mercado = ''E''';
          tProduto.Filtered := True;
          tProduto.First;
        end;
  end;
end;

procedure TfPrevProdColecao.BitBtn2Click(Sender: TObject);
begin
  tProduto.Filtered := False;
  Habilita;
end;

procedure TfPrevProdColecao.Imprimir1Click(Sender: TObject);
begin
  fRelProdColecao := TfRelProdColecao.Create(Self);
  fRelProdColecao.QuickRep1.Print;
  fRelProdColecao.QuickRep1.Free;
end;

procedure TfPrevProdColecao.Visualizar1Click(Sender: TObject);
begin
  fRelProdColecao := TfRelProdColecao.Create(Self);
  fRelProdColecao.QuickRep1.Preview;
  fRelProdColecao.QuickRep1.Free;
end;

procedure TfPrevProdColecao.FormShow(Sender: TObject);
begin
  Dm1.tGrupo.Open;
  DM1.tConstrucao.Open;
  DM1.tProduto.Open;
  DM1.tSubGrupo.Open;
end;

end.

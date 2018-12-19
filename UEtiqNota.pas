unit UEtiqNota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DbTables, Mask,
  CurrEdit, DBClient, ToolEdit, DB;

type
  TfEtiqNota = class(TForm)
    Panel1: TPanel;
    Panel5: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    msEtiqueta: TDataSource;
    Panel2: TPanel;
    Label5: TLabel;
    Edit1: TEdit;
    CurrencyEdit1: TCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    qNota: TQuery;
    qNotaSerie: TStringField;
    qNotaNumNota: TIntegerField;
    qNotaQtd: TIntegerField;
    mEtiqueta: TClientDataSet;
    mEtiquetaNumNota: TIntegerField;
    mEtiquetaSerie: TStringField;
    mEtiquetaNumEtiqueta: TIntegerField;
    mEtiquetaQtdTotal: TIntegerField;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Panel2Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    procedure prc_Imprimir(Tipo : String);
    procedure Gravar_mEtiqueta;
  public
    { Public declarations }
  end;

var
  fEtiqNota: TfEtiqNota;

implementation

uses UDM1, URelEtiqNota;

{$R *.DFM}


procedure TfEtiqNota.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfEtiqNota.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfEtiqNota.BitBtn1Click(Sender: TObject);
begin
  prc_Imprimir('I');
end;

procedure TfEtiqNota.FormShow(Sender: TObject);
begin
  mEtiqueta.Open;
end;

procedure TfEtiqNota.Gravar_mEtiqueta;
var
  i : Integer;
begin
  for i := 1 to CurrencyEdit2.AsInteger do
  begin
    mEtiqueta.Insert;
    mEtiquetaNumNota.AsInteger := CurrencyEdit1.AsInteger;
    mEtiquetaSerie.AsString    := Edit1.Text;
    mEtiquetaNumEtiqueta.AsInteger := i;
    mEtiquetaQtdTotal.AsInteger    := CurrencyEdit2.AsInteger;
    mEtiqueta.Post;
  end;
end;

procedure TfEtiqNota.Panel2Exit(Sender: TObject);
begin
  CurrencyEdit2.Clear;
  if CurrencyEdit1.AsInteger > 0 then
  begin
    qNota.Close;
    qNota.ParamByName('Serie').AsString    := Edit1.Text;
    qNota.ParamByName('NumNota').AsInteger := CurrencyEdit1.AsInteger;
    qNota.Open;
    if qNota.IsEmpty then
    begin
      ShowMessage('Nota não encontrada!');
      CurrencyEdit1.Clear;
      Edit1.Text := '1';
      CurrencyEdit1.SetFocus;
    end
    else
      CurrencyEdit2.AsInteger := qNotaQtd.AsInteger;
  end;
end;

procedure TfEtiqNota.prc_Imprimir(Tipo: String);
begin
  mEtiqueta.EmptyDataSet;
  Gravar_mEtiqueta;

  fRelEtiqNota := TfRelEtiqNota.Create(Self);
  if Tipo = 'I' then
    fRelEtiqNota.QuickRep1.Print
  else
    fRelEtiqNota.QuickRep1.Preview;
  fRelEtiqNota.QuickRep1.Free;
  FreeAndNil(fRelEtiqNota);
  DM1.tLoteMI.Filtered     := False;
  DM1.tLote.Filtered       := False;
  DM1.tPedido.Filtered     := False;
  DM1.tPedidoItem.Filtered := False;
end;

procedure TfEtiqNota.BitBtn2Click(Sender: TObject);
begin
  prc_Imprimir('V');
end;

end.

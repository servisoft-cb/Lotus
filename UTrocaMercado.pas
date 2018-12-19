unit UTrocaMercado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, DB, DBTables,
  MemTable;

type
  TfTrocaMercado = class(TForm)
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    mEstoque: TMemoryTable;
    mEstoqueNumMov: TIntegerField;
    mEstoqueNumNota: TIntegerField;
    mEstoqueNomeCliForn: TStringField;
    mEstoqueES: TStringField;
    mEstoqueTipo: TStringField;
    mEstoqueQuantidade: TFloatField;
    mEstoqueMercado: TStringField;
    mEstoqueDtMovimento: TDateField;
    dsmEstoque: TDataSource;
    BitBtn3: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTrocaMercado: TfTrocaMercado;

implementation

uses UConsHistMat, UDM1;

{$R *.dfm}

procedure TfTrocaMercado.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfTrocaMercado.RxDBGrid1DblClick(Sender: TObject);
begin
  if mEstoqueNumMov.AsInteger > 0 then
    begin
      mEstoque.Edit;
      if mEstoqueMercado.AsString = 'E' then
        mEstoqueMercado.AsString := 'I'
      else
        mEstoqueMercado.AsString := 'E';
      mEstoque.Post;
    end;
end;

procedure TfTrocaMercado.BitBtn3Click(Sender: TObject);
begin
  DM1.tEstoqueMatMov.IndexFieldNames := 'NumMov';
  mEstoque.First;
  while not mEstoque.Eof do
    begin
      DM1.tEstoqueMatMov.SetKey;
      DM1.tEstoqueMatMovNumMov.AsInteger := mEstoqueNumMov.AsInteger;
      if DM1.tEstoqueMatMov.GotoKey then
        begin
          DM1.tEstoqueMatMov.Edit;
          DM1.tEstoqueMatMovMercado.AsString := mEstoqueMercado.AsString;
          DM1.tEstoqueMatMov.Post;
        end;
      mEstoque.Next;
    end;
  Close;
end;

procedure TfTrocaMercado.BitBtn1Click(Sender: TObject);
begin
  DM1.tEstoqueMatMov.IndexFieldNames := 'NumMov';
  mEstoque.First;
  while not mEstoque.Eof do
    begin
      DM1.tEstoqueMatMov.SetKey;
      DM1.tEstoqueMatMovNumMov.AsInteger := mEstoqueNumMov.AsInteger;
      if DM1.tEstoqueMatMov.GotoKey then
        begin
          DM1.tEstoqueMatMov.Edit;
          if mEstoqueMercado.AsString = 'E' then
            DM1.tEstoqueMatMovMercado.AsString := 'I'
          else
            DM1.tEstoqueMatMovMercado.AsString := 'E';
          DM1.tEstoqueMatMov.Post;
        end;
      mEstoque.Next;
    end;
end;

end.

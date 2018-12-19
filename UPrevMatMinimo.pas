unit UPrevMatMinimo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, RXCtrls, Menus, StdCtrls, Buttons, Db, DBTables, MemTable;

type
  TfPrevMatMinimo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    RxSpeedButton1: TRxSpeedButton;
    BitBtn1: TBitBtn;
    qEstoque: TQuery;
    qEstoqueCodMaterial: TIntegerField;
    qEstoqueCodCor: TIntegerField;
    qEstoqueEstMinimo: TFloatField;
    qEstoqueNomeMaterial: TStringField;
    qEstoqueNomeCor: TStringField;
    qEstoqueSaldo: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrevMatMinimo: TfPrevMatMinimo;

implementation

uses UDM1, URelMatMinimo;

{$R *.DFM}

procedure TfPrevMatMinimo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qEstoque.Close;
  Action := Cafree;
end;

procedure TfPrevMatMinimo.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevMatMinimo.RxSpeedButton1Click(Sender: TObject);
begin
  Screen.Cursor   := crHourGlass;
  qEstoque.Open;
  Screen.Cursor   := crDefault;
  fRelMatMinimo := TfRelMatMinimo.Create(Self);
  fRelMatMinimo.QuickRep1.Preview;
  fRelMatMinimo.QuickRep1.Free;
  qEstoque.Close;
end;

end.

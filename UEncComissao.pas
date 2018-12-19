unit UEncComissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, DBFilter, ExtCtrls, StdCtrls, Mask,
  ToolEdit, DBCtrls, Buttons;

type
  TfEncComissao = class(TForm)
    RxDBGrid1: TRxDBGrid;
    RxDBFilter1: TRxDBFilter;
    Panel1: TPanel;
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEncComissao: TfEncComissao;

implementation

uses UDM1;

{$R *.dfm}

procedure TfEncComissao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  RxDBFilter1.Active := False;
  Action := Cafree;
end;

procedure TfEncComissao.FormShow(Sender: TObject);
begin
  RxDBFilter1.Active := True;
end;

procedure TfEncComissao.BitBtn1Click(Sender: TObject);
begin
  if DateEdit1.Date < DM1.tVendedorDtEncerramentoCom.AsDateTime then
    ShowMessage('Dt.Encerramento é menor que a última data!')
  else
    begin
      DM1.tVendedor.Edit;
      DM1.tVendedorDtEncerramentoCom.AsDateTime := DateEdit1.Date;
      DM1.tVendedor.Post;
    end;
end;

procedure TfEncComissao.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.

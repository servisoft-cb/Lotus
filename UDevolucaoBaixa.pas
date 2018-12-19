unit UDevolucaoBaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, ToolEdit, CurrEdit, Buttons;

type
  TfDevolucaoBaixa = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label3: TLabel;
    DateEdit1: TDateEdit;
    Label4: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    Label5: TLabel;
    DateEdit2: TDateEdit;
    Label6: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    Label7: TLabel;
    DateEdit3: TDateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label8: TLabel;
    Edit1: TEdit;
    Label9: TLabel;
    Edit2: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fDevolucaoBaixa: TfDevolucaoBaixa;

implementation

uses UDM1, UDM2, UDevolucao, UAgendaTelef;

{$R *.DFM}

procedure TfDevolucaoBaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfDevolucaoBaixa.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfDevolucaoBaixa.BitBtn1Click(Sender: TObject);
begin
  if (CurrencyEdit1.Value + CurrencyEdit2.Value + CurrencyEdit3.Value) <= DM1.tDevolucaoProdQtdPares.AsFloat then
    begin
      DM1.tDevolucaoProd.Edit;
      if CurrencyEdit1.Value > 0 then
        DM1.tDevolucaoProdQtdParesInd.AsFloat := CurrencyEdit1.Value;
      if DateEdit1.Date > 1 then
        DM1.tDevolucaoProdDtIndenizado.AsDateTime := DateEdit1.Date;
      if CurrencyEdit2.Value > 0 then
        DM1.tDevolucaoProdQtdParesCons.AsFloat := CurrencyEdit2.Value;
      if DateEdit2.Date > 1 then
        DM1.tDevolucaoProdDtConserto.AsDateTime := DateEdit2.Date;
      if CurrencyEdit3.Value > 0 then
        DM1.tDevolucaoProdQtdParesSub.AsFloat := CurrencyEdit3.Value;
      if DateEdit3.Date > 1 then
        DM1.tDevolucaoProdDtSubstituicao.AsDateTime := DateEdit3.Date;
      DM1.tDevolucaoProdBanco.AsString := Edit1.Text;
      DM1.tDevolucaoProdPgto.AsString  := Edit2.Text;  
      DM1.tDevolucaoProd.Post;
      Close;
    end
  else
    begin
      ShowMessage('Quantidade de pares é menor que a soma de "indenizados", "consertos" e "substituição"!');
      CurrencyEdit1.SetFocus;
    end;
end;

procedure TfDevolucaoBaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.

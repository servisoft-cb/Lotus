unit UEntrExtOC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ToolEdit, CurrEdit, ExtCtrls;

type
  TfEntrExtOC = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    Label2: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEntrExtOC: TfEntrExtOC;

implementation

uses UDM1, UBaixaItOC, UAgendaTelef;

{$R *.DFM}

procedure TfEntrExtOC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfEntrExtOC.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfEntrExtOC.BitBtn1Click(Sender: TObject);
begin
  fBaixaItOC.tOrdemCompraItemGrade.Edit;
  fBaixaItOC.tOrdemCompraItemGradeQtdEntregue.AsFloat := StrToFloat(FormatFloat('0.00000',fBaixaItOC.tOrdemCompraItemGradeQtdEntregue.AsFloat + CurrencyEdit1.Value));
  fBaixaItOC.tOrdemCompraItemGradeQtdRestante.AsFloat := StrToFloat(FormatFloat('0.00000',fBaixaItOC.tOrdemCompraItemGradeQtdRestante.AsFloat - CurrencyEdit1.Value));
  if StrToFloat(FormatFloat('0.00000',fBaixaItOC.tOrdemCompraItemGradeQtdRestante.AsFloat)) < 0 then
    fBaixaItOC.tOrdemCompraItemGradeQtdRestante.AsFloat := 0;
  fBaixaItOC.tOrdemCompraItemGrade.Post;
  fBaixaItOC.tOrdemCompraItemGrade.Refresh;
  DM1.tOrdemCompraItem.Edit;
  DM1.tOrdemCompraItemQtdEntregue.AsFloat := StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtdEntregue.AsFloat + CurrencyEdit1.Value));
  DM1.tOrdemCompraItemQtdRestante.AsFloat := StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtdRestante.AsFloat - CurrencyEdit1.Value));
  if StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtdRestante.AsFloat)) < 0 then
    DM1.tOrdemCompraItemQtdRestante.AsFloat := 0;
  DM1.tOrdemCompraItem.Post;
  fBaixaItOC.tOrdemCompraItem.Refresh;
  CurrencyEdit1.Clear;
  Close;
end;

procedure TfEntrExtOC.BitBtn2Click(Sender: TObject);
begin
  if StrToFloat(FormatFloat('0.00000',CurrencyEdit2.Value)) <= StrToFloat(FormatFloat('0.00000',fBaixaItOC.tOrdemCompraItemQtdEntregue.AsFloat)) then
    begin
      fBaixaItOC.tOrdemCompraItemGrade.Edit;
      fBaixaItOC.tOrdemCompraItemGradeQtdEntregue.AsFloat := StrToFloat(FormatFloat('0.00000',fBaixaItOC.tOrdemCompraItemGradeQtdEntregue.AsFloat - CurrencyEdit2.Value));
      fBaixaItOC.tOrdemCompraItemGradeQtdRestante.AsFloat := StrToFloat(FormatFloat('0.00000',fBaixaItOC.tOrdemCompraItemGradeQtdRestante.AsFloat + CurrencyEdit2.Value));
      if StrToFloat(FormatFloat('0.00000',fBaixaItOC.tOrdemCompraItemGradeQtdRestante.AsFloat)) > StrToFloat(FormatFloat('0.00000',fBaixaItOC.tOrdemCompraItemGradeQtd.AsFloat)) then
        fBaixaItOC.tOrdemCompraItemGradeQtdRestante.AsFloat := StrToFloat(FormatFloat('0.00000',fBaixaItOC.tOrdemCompraItemGradeQtd.AsFloat));
      fBaixaItOC.tOrdemCompraItemGrade.Post;
      fBaixaItOC.tOrdemCompraItem.Refresh;
      DM1.tOrdemCompraItem.Edit;
      DM1.tOrdemCompraItemQtdEntregue.AsFloat := StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtdEntregue.AsFloat - CurrencyEdit2.Value));
      DM1.tOrdemCompraItemQtdRestante.AsFloat := StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtdRestante.AsFloat + CurrencyEdit2.Value));
      if StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtdRestante.AsFloat)) > StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtd.AsFloat)) then
        DM1.tOrdemCompraItemQtdRestante.AsFloat := StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtd.AsFloat));
      DM1.tOrdemCompraItem.Post;
      fBaixaItOC.tOrdemCompraItem.Refresh;
      CurrencyEdit2.Clear;
      Close;
    end
  else
    begin
      ShowMessage('A Qtd. de Extorno não pode ser maior que a Qtd. Entregue!');
      CurrencyEdit2.SetFocus;
    end;
end;

procedure TfEntrExtOC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.

unit UBaixaPedAmostra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons;

type
  TfBaixaPedAmostra = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    DateEdit1: TDateEdit;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Verifica_Baixa;
  public
    { Public declarations }
  end;

var
  fBaixaPedAmostra: TfBaixaPedAmostra;

implementation

uses UDM1, UAgendaTelef;

{$R *.DFM}

procedure TfBaixaPedAmostra.Verifica_Baixa;
var
  vBaixado : Boolean;
begin
  vBaixado := True;
  DM1.tPedAmostraIt.First;
  while not DM1.tPedAmostraIt.Eof do
    begin
      if not DM1.tPedAmostraItBaixado.AsBoolean then
        vBaixado := False;
      DM1.tPedAmostraIt.Next;
    end;
  DM1.tPedAmostra.Edit;
  DM1.tPedAmostraBaixado.AsBoolean := vBaixado;
  DM1.tPedAmostra.Post;
end;

procedure TfBaixaPedAmostra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfBaixaPedAmostra.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfBaixaPedAmostra.BitBtn1Click(Sender: TObject);
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') and (DateEdit1.Text <> '  /  /    ') then
    begin
      DM1.tPedAmostra.IndexFieldNames := 'Pedido';
      DM1.tPedAmostra.SetKey;
      DM1.tPedAmostraPedido.AsInteger := StrToInt(Edit1.Text);
      if DM1.tPedAmostra.GotoKey then
        begin
          DM1.tPedAmostraIt.SetKey;
          DM1.tPedAmostraItPedido.AsInteger := StrToInt(Edit1.Text);
          DM1.tPedAmostraItItem.AsInteger   := StrToInt(Edit2.Text);
          if DM1.tPedAmostraIt.GotoKey then
            begin
              if DM1.tPedAmostraItBaixado.AsBoolean then
                begin
                  if MessageDlg('Já foi dado baixa neste item, deseja substituir data de baixa p/ data atual?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
                    begin
                      DM1.tPedAmostraIt.Edit;
                      DM1.tPedAmostraItDtBaixa.AsDateTime := DateEdit1.Date;
                      DM1.tPedAmostraIt.Post;
                    end;
                end
              else
                begin
                  if MessageDlg('Deseja realmente dar baixa neste item?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
                    begin
                      DM1.tPedAmostraIt.Edit;
                      DM1.tPedAmostraItBaixado.AsBoolean  := True;
                      DM1.tPedAmostraItDtBaixa.AsDateTime := DateEdit1.Date;
                      DM1.tPedAmostraIt.Post;
                    end;
                end;
            end
          else
            ShowMessage('Não foi encontrado o item informado neste pedido!');
        end
      else
        ShowMessage('Não foi encontrado o pedido informado!');
    end
  else
  if (Edit1.Text <> '') and (Edit2.Text = '') and (DateEdit1.Text <> '  /  /    ') then
    begin
      DM1.tPedAmostra.IndexFieldNames := 'Pedido';
      DM1.tPedAmostra.SetKey;
      DM1.tPedAmostraPedido.AsInteger := StrToInt(Edit1.Text);
      if DM1.tPedAmostra.GotoKey then
        begin
          if DM1.tPedAmostraBaixado.AsBoolean then
            begin
              if MessageDlg('Já foi dado baixa neste pedido, deseja substituir as datas das baixas p/ data atual?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
                begin
                  DM1.tPedAmostra.Edit;
                  DM1.tPedAmostraIt.First;
                  while not DM1.tPedAmostraIt.Eof do
                    begin
                      DM1.tPedAmostraIt.Edit;
                      DM1.tPedAmostraItDtBaixa.AsDateTime := DateEdit1.Date;
                      DM1.tPedAmostraItBaixado.AsBoolean  := True;
                      DM1.tPedAmostraIt.Next;
                    end;
                  DM1.tPedAmostraBaixado.AsBoolean := True;
                  DM1.tPedAmostra.Post;
                end;
            end
          else
            begin
              if MessageDlg('Deseja dar baixa em todo o pedido com esta data atual?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
                begin
                  DM1.tPedAmostra.Edit;
                  DM1.tPedAmostraIt.First;
                  while not DM1.tPedAmostraIt.Eof do
                    begin
                      DM1.tPedAmostraIt.Edit;
                      DM1.tPedAmostraItDtBaixa.AsDateTime := DateEdit1.Date;
                      DM1.tPedAmostraItBaixado.AsBoolean  := True;
                      DM1.tPedAmostraIt.Next;
                    end;
                  DM1.tPedAmostraBaixado.AsBoolean := True;
                  DM1.tPedAmostra.Post;
                end;
            end;
        end
      else
        ShowMessage('Não foi encontrado o pedido informado!');
    end
  else
    ShowMessage('Você deve informar um "Pedido" e uma "Data" p/ fazer a baixa!');
  Verifica_Baixa;
  Edit1.SetFocus;
end;

procedure TfBaixaPedAmostra.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.

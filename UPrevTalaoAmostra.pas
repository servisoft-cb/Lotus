unit UPrevTalaoAmostra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, RXCtrls, Menus, Buttons;

type
  TfPrevTalaoAmostra = class(TForm)
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    Label2: TLabel;
    DateEdit2: TDateEdit;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    Edit2: TEdit;
    Panel2: TPanel;
    RxSpeedButton1: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    Imprimir1: TMenuItem;
    Visualizar1: TMenuItem;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrevTalaoAmostra: TfPrevTalaoAmostra;

implementation

uses UDM1, URelTalaoAmostra;

{$R *.DFM}

procedure TfPrevTalaoAmostra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tPedAmostra.Close;
  DM1.tPedAmostraIt.Close;
  DM1.tPedAmostraMat.Close;
  DM1.tPedAmostraGrade.Close;
  DM1.tPosicao.Close;
  DM1.tGrade.Close;
  DM1.tGradeItem.Close;
  Action := Cafree;
end;

procedure TfPrevTalaoAmostra.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevTalaoAmostra.RadioGroup1Click(Sender: TObject);
begin
  Case RadioGroup1.ItemIndex of
    0 : begin
          DateEdit1.Enabled := True;
          DateEdit2.Enabled := True;
          Edit1.Enabled     := False;
          Edit2.Enabled     := False;
        end;
    1 : begin
          DateEdit1.Enabled := False;
          DateEdit2.Enabled := False;
          Edit1.Enabled     := True;
          Edit2.Enabled     := True;
        end;
  end;
end;

procedure TfPrevTalaoAmostra.BitBtn1Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 0;
  DateEdit1.Clear;
  DateEdit2.Clear;
  Edit1.Clear;
  Edit2.Clear;
  RadioGroup1Click(Sender);
  RadioGroup1.SetFocus;
end;

procedure TfPrevTalaoAmostra.Imprimir1Click(Sender: TObject);
begin
  Case RadioGroup1.ItemIndex of
    0 : begin
          if (DateEdit1.Text <> '  /  /    ') and (DateEdit2.Text <> '  /  /    ') then
            begin
              DM1.tPedAmostra.Filtered := False;
              DM1.tPedAmostra.Filter   := 'Data >= '''+DateEdit1.Text+''' and Data <= '''+DateEdit2.Text+'''';
              DM1.tPedAmostra.Filtered := True;
              DM1.tPedAmostra.First;
              DM1.tPedAmostraIt.First;
              fRelTalaoAmostra         := TfRelTalaoAmostra.Create(Self);
              fRelTalaoAmostra.QuickRep1.Print;
              fRelTalaoAmostra.QuickRep1.Free;
              DM1.tPedAmostra.Filtered := False;
            end
          else
            begin
              ShowMessage('Você deve informar datas "Inicial" e "Final" p/ gerar o relatório!');
              DateEdit1.SetFocus;
            end;
        end;
    1 : begin
          if (Edit1.Text <> '') and (Edit2.Text <> '') then
            begin
              DM1.tPedAmostra.Filtered := False;
              DM1.tPedAmostra.Filter   := 'Pedido >= '''+Edit1.Text+''' and Pedido <= '''+Edit2.Text+'''';
              DM1.tPedAmostra.Filtered := True;
              DM1.tPedAmostra.First;
              DM1.tPedAmostraIt.First;
              fRelTalaoAmostra         := TfRelTalaoAmostra.Create(Self);
              fRelTalaoAmostra.QuickRep1.Print;
              fRelTalaoAmostra.QuickRep1.Free;
              DM1.tPedAmostra.Filtered := False;
            end
          else
            begin
              ShowMessage('Você deve informar pedidos "Inicial" e "Final" p/ gerar o relatório!');
              DateEdit1.SetFocus;
            end;
        end;
  end;
end;

procedure TfPrevTalaoAmostra.Visualizar1Click(Sender: TObject);
begin
  Case RadioGroup1.ItemIndex of
    0 : begin
          if (DateEdit1.Text <> '  /  /    ') and (DateEdit2.Text <> '  /  /    ') then
            begin
              DM1.tPedAmostra.Filtered := False;
              DM1.tPedAmostra.Filter   := 'Data >= '''+DateEdit1.Text+''' and Data <= '''+DateEdit2.Text+'''';
              DM1.tPedAmostra.Filtered := True;
              DM1.tPedAmostra.First;
              DM1.tPedAmostraIt.First;
              fRelTalaoAmostra         := TfRelTalaoAmostra.Create(Self);
              fRelTalaoAmostra.QuickRep1.Preview;
              fRelTalaoAmostra.QuickRep1.Free;
              DM1.tPedAmostra.Filtered := False;
            end
          else
            begin
              ShowMessage('Você deve informar datas "Inicial" e "Final" p/ gerar o relatório!');
              DateEdit1.SetFocus;
            end;
        end;
    1 : begin
          if (Edit1.Text <> '') and (Edit2.Text <> '') then
            begin
              DM1.tPedAmostra.Filtered := False;
              DM1.tPedAmostra.Filter   := 'Pedido >= '''+Edit1.Text+''' and Pedido <= '''+Edit2.Text+'''';
              DM1.tPedAmostra.Filtered := True;
              DM1.tPedAmostra.First;
              DM1.tPedAmostraIt.First;
              fRelTalaoAmostra         := TfRelTalaoAmostra.Create(Self);
              fRelTalaoAmostra.QuickRep1.Preview;
              fRelTalaoAmostra.QuickRep1.Free;
              DM1.tPedAmostra.Filtered := False;
            end
          else
            begin
              ShowMessage('Você deve informar pedidos "Inicial" e "Final" p/ gerar o relatório!');
              DateEdit1.SetFocus;
            end;
        end;
  end;
end;

procedure TfPrevTalaoAmostra.FormShow(Sender: TObject);
begin
  DM1.tPedAmostra.Open;
  DM1.tPedAmostraIt.Open;
  DM1.tPedAmostraMat.Open;
  DM1.tPedAmostraGrade.Open;
  DM1.tPosicao.Open;
  DM1.tGrade.Open;
  DM1.tGradeItem.Open;
  DM1.tGradeItemlk.Open;
end;

end.

unit UPrevCliRef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, RXCtrls, Menus, Buttons, Db,
  DBTables, MemTable;

type
  TfPrevCliRef = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    Label2: TLabel;
    DateEdit2: TDateEdit;
    Panel2: TPanel;
    RxSpeedButton1: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    Imprimir1: TMenuItem;
    Visualizar1: TMenuItem;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qPedidos: TQuery;
    qPedidosNome: TStringField;
    qPedidosReferencia: TStringField;
    qPedidosQtdPares: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrevCliRef: TfPrevCliRef;

implementation

uses UDM1, URelCliRef;

{$R *.DFM}

procedure TfPrevCliRef.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qPedidos.Close;
  Action := Cafree;
end;

procedure TfPrevCliRef.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevCliRef.BitBtn1Click(Sender: TObject);
begin
  DateEdit1.Clear;
  DateEdit2.Clear;
  DateEdit1.SetFocus;
end;

procedure TfPrevCliRef.Imprimir1Click(Sender: TObject);
begin
  if (DateEdit1.Text <> '  /  /    ') and (DateEdit2.Text <> '  /  /    ') then
    begin
      Screen.Cursor     := crHourGlass;
      qPedidos.Active   := False;
      qPedidos.Params[0].AsDate := DateEdit1.Date;
      qPedidos.Params[1].AsDate := DateEdit2.Date;
      qPedidos.Active   := True;
      Screen.Cursor     := crDefault;
      if not qPedidos.IsEmpty then
        begin        
          fRelCliRef := TfRelCliRef.Create(Self);
          fRelCliRef.QuickRep1.Print;
          fRelCliRef.QuickRep1.Free;
        end
      else
        ShowMessage('Não há registros p/ este período!');
      qPedidos.Filtered := False;
    end
  else
    begin
      ShowMessage('Você deve informar as datas p/ gerar o relatório!');
      DateEdit1.SetFocus;
    end;
end;

procedure TfPrevCliRef.Visualizar1Click(Sender: TObject);
begin
  if (DateEdit1.Text <> '  /  /    ') and (DateEdit2.Text <> '  /  /    ') then
    begin
      Screen.Cursor     := crHourGlass;
      qPedidos.Active   := False;
      qPedidos.Params[0].AsDate := DateEdit1.Date;
      qPedidos.Params[1].AsDate := DateEdit2.Date;
      qPedidos.Active   := True;
      Screen.Cursor     := crDefault;
      if not qPedidos.IsEmpty then
        begin
          fRelCliRef := TfRelCliRef.Create(Self);
          fRelCliRef.QuickRep1.Preview;
          fRelCliRef.QuickRep1.Free;
        end
      else
        ShowMessage('Não há registros p/ este período!');
      qPedidos.Filtered := False;
    end
  else
    begin
      ShowMessage('Você deve informar as datas p/ gerar o relatório!');
      DateEdit1.SetFocus;
    end;
end;

end.

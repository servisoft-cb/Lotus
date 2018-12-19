unit UPrevPgtoJuros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons, RXCtrls, Menus, Printers,
  Db, DBTables, DBFilter;

type
  TfPrevPgtoJuros = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    Label2: TLabel;
    DateEdit2: TDateEdit;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    RxSpeedButton1: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    Imprimir1: TMenuItem;
    Visualizar1: TMenuItem;
    dsCPagarParc: TDataSource;
    RxDBFilter1: TRxDBFilter;
    qCPagarParc: TQuery;
    qCPagarParcDtVencCPagar: TDateField;
    qCPagarParcVlrParcCPagar: TFloatField;
    qCPagarParcDtPagParcCPagar: TDateField;
    qCPagarParcJurosParcCPagar: TFloatField;
    qCPagarParcCodForn: TIntegerField;
    qCPagarParcPgtoParcial: TFloatField;
    qCPagarParcNroDuplicata: TIntegerField;
    qCPagarParcDiasAtraso: TFloatField;
    qCPagarParcFantasia: TStringField;
    qCPagarParcCodConta: TIntegerField;
    qCPagarParcNomeConta: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrevPgtoJuros: TfPrevPgtoJuros;

implementation

uses UDM1, URelPgtoJuros;

{$R *.DFM}

procedure TfPrevPgtoJuros.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qCPagarParc.Close;
  if Screen.FormCount < 3 then
    begin
      DM1.tFornecedores.Close;
      DM1.tContas.Close;
    end;
  Action := Cafree;
end;

procedure TfPrevPgtoJuros.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevPgtoJuros.BitBtn2Click(Sender: TObject);
begin
  DateEdit1.Clear;
  DateEdit2.Clear;
  DateEdit1.SetFocus;
end;

procedure TfPrevPgtoJuros.Imprimir1Click(Sender: TObject);
begin
  if (DateEdit1.Text <> '  /  /    ') and (DateEdit2.Text <> '  /  /    ') then
    begin
      qCPagarParc.Filtered := False;
      qCPagarParc.Filter   := 'DtPagParcCPagar >= '''+DateEdit1.Text+''' and DtPagParcCPagar <= '''+DateEdit2.Text+'''';
      qCPagarParc.Filtered := True;
      fRelPgtoJuros        := TfRelPgtoJuros.Create(Self);
      fRelPgtoJuros.QuickRep1.Print;
      fRelPgtoJuros.QuickRep1.Free;
      qCPagarParc.Filtered := False;
    end
  else
    begin
      ShowMessage('Deve haver Datas "Inicial" e "Final" p/ executar este relatório!');
      DateEdit1.SetFocus;
    end;
end;

procedure TfPrevPgtoJuros.Visualizar1Click(Sender: TObject);
begin
  if (DateEdit1.Text <> '  /  /    ') and (DateEdit2.Text <> '  /  /    ') then
    begin
      qCPagarParc.Filtered := False;
      qCPagarParc.Filter   := 'DtPagParcCPagar >= '''+DateEdit1.Text+''' and DtPagParcCPagar <= '''+DateEdit2.Text+'''';
      qCPagarParc.Filtered := True;
      fRelPgtoJuros        := TfRelPgtoJuros.Create(Self);
      fRelPgtoJuros.QuickRep1.Preview;
      fRelPgtoJuros.QuickRep1.Free;
      qCPagarParc.Filtered := False;
    end
  else
    begin
      ShowMessage('Deve haver Datas "Inicial" e "Final" p/ executar este relatório!');
      DateEdit1.SetFocus;
    end;
end;

procedure TfPrevPgtoJuros.FormShow(Sender: TObject);
begin
  DM1.tFornecedores.Open;
  DM1.tContas.Open;
end;

end.

unit UPrevVendedores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Buttons, ExtCtrls, Db, DBTables, Menus, RXCtrls,
  RxLookup;

type
  TfPrevVendedores = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RadioGroup1: TRadioGroup;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    tVendedor: TTable;
    dsVendedor: TDataSource;
    tVendedorCodigo: TIntegerField;
    tVendedorNome: TStringField;
    tVendedorPercComissao: TFloatField;
    PopupMenu1: TPopupMenu;
    Imprimir1: TMenuItem;
    Visualizar1: TMenuItem;
    RxSpeedButton2: TRxSpeedButton;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrevVendedores: TfPrevVendedores;

implementation

uses UDM1, URelVendedores, Printers;

{$R *.DFM}

procedure TfPrevVendedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tVendedor.Close;
  Action := Cafree;
end;

procedure TfPrevVendedores.RadioGroup1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0 : begin
        tVendedor.IndexFieldNames := 'Nome';
        RxDBLookupCombo1.Enabled  := True;
        RxDBLookupCombo2.Enabled  := True;
        RxDBLookupCombo1.SetFocus;
        Edit1.Enabled := False;
        Edit1.Clear;
        Edit2.Enabled := False;
        Edit2.Clear;
        end;
    1 : begin
        tVendedor.IndexFieldNames := 'Codigo';
        Edit1.Enabled := True;
        Edit1.SetFocus;
        Edit2.Enabled := True;
        RxDBLookupCombo1.Enabled  := False;
        RxDBLookupCombo1.ClearValue;
        RxDBLookupCombo2.Enabled  := False;
        RxDBLookupCombo2.ClearValue;
        end;
  end;
end;

procedure TfPrevVendedores.BitBtn2Click(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
  RxDBLookupCombo2.ClearValue;
  Edit1.Clear;
  Edit2.Clear;
end;

procedure TfPrevVendedores.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevVendedores.Visualizar1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0 : begin
          if (RxDBLookupCombo1.Text <> '') and (RxDBLookupCombo2.Text <> '') then
            begin
              tVendedor.Filtered := False;
              tVendedor.Filter   := 'Nome >= '''+RxDBLookupCombo1.Text+''' and Nome <= '''+RxDBLookupCombo2.Text+'''';
              tVendedor.Filtered := True;
              fRelVendedores     := TfRelVendedores.Create(Self);
              fRelVendedores.QuickRep1.Preview;
              fRelVendedores.QuickRep1.Free;
              tVendedor.Filtered := False;
            end
          else
            begin
              tVendedor.Filtered := False;
              fRelVendedores     := TfRelVendedores.Create(Self);
              fRelVendedores.QuickRep1.Preview;
              fRelVendedores.QuickRep1.Free;
            end;
        end;
    1 : begin
          if (Edit1.Text <> '') and (Edit2.Text <> '') then
            begin
              if StrToInt(Edit1.Text) <= StrToInt(Edit2.Text) then
                begin
                  tVendedor.Filtered := False;
                  tVendedor.Filter   := 'Codigo >= '''+Edit1.Text+''' and Codigo <= '''+Edit2.Text+'''';
                  tVendedor.Filtered := True;
                  fRelVendedores     := TfRelVendedores.Create(Self);
                  fRelVendedores.QuickRep1.Preview;
                  fRelVendedores.QuickRep1.Free;
                  tVendedor.Filtered := False;
                end
              else
              if StrToInt(Edit1.Text) > StrToInt(Edit2.Text) then
                begin
                  ShowMessage('Código inicial deve ser menor que o código final!');
                  Edit1.SetFocus;
                end;
            end
          else
            begin
              tVendedor.Filtered := False;
              fRelVendedores     := TfRelVendedores.Create(Self);
              fRelVendedores.QuickRep1.Preview;
              fRelVendedores.QuickRep1.Free;
            end;
        end;
  end;
  tVendedor.Filtered := False;
end;

procedure TfPrevVendedores.Imprimir1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0 : begin
          if (RxDBLookupCombo1.Text <> '') and (RxDBLookupCombo2.Text <> '') then
            begin
              tVendedor.Filtered := False;
              tVendedor.Filter   := 'Nome >= '''+RxDBLookupCombo1.Text+''' and Nome <= '''+RxDBLookupCombo2.Text+'''';
              tVendedor.Filtered := True;
              fRelVendedores     := TfRelVendedores.Create(Self);
              fRelVendedores.QuickRep1.Print;
              fRelVendedores.QuickRep1.Free;
              tVendedor.Filtered := False;
            end
          else
            begin
              tVendedor.Filtered := False;
              fRelVendedores     := TfRelVendedores.Create(Self);
              fRelVendedores.QuickRep1.Print;
              fRelVendedores.QuickRep1.Free;
            end;
        end;
    1 : begin
          if (Edit1.Text <> '') and (Edit2.Text <> '') then
            begin
              if StrToInt(Edit1.Text) <= StrToInt(Edit2.Text) then
                begin
                  tVendedor.Filtered := False;
                  tVendedor.Filter   := 'Codigo >= '''+Edit1.Text+''' and Codigo <= '''+Edit2.Text+'''';
                  tVendedor.Filtered := True;
                  fRelVendedores     := TfRelVendedores.Create(Self);
                  fRelVendedores.QuickRep1.Print;
                  fRelVendedores.QuickRep1.Free;
                  tVendedor.Filtered := False;
                end
              else
              if StrToInt(Edit1.Text) > StrToInt(Edit2.Text) then
                begin
                  ShowMessage('Código inicial deve ser menor que o código final!');
                  Edit1.SetFocus;
                end;
            end
          else
            begin
              tVendedor.Filtered := False;
              fRelVendedores     := TfRelVendedores.Create(Self);
              fRelVendedores.QuickRep1.Print;
              fRelVendedores.QuickRep1.Free;
            end;
        end;
  end;
  tVendedor.Filtered := False;
end;

procedure TfPrevVendedores.RxDBLookupCombo1Enter(Sender: TObject);
begin
  tVendedor.IndexFieldNames := 'Nome'
end;

procedure TfPrevVendedores.FormShow(Sender: TObject);
begin
  DM1.tVendedor.Open;
end;

end.

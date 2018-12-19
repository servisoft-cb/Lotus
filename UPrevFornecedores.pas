unit UPrevFornecedores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Buttons, ExtCtrls, Db, DBTables, RXLookup, Menus,
  RXCtrls, DBFilter;

type
  TfPrevFornecedores = class(TForm)
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
    tFornecedores: TTable;
    dsFornecedores: TDataSource;
    tFornecedoresCodForn: TIntegerField;
    tFornecedoresNomeForn: TStringField;
    tFornecedoresEndForn: TStringField;
    tFornecedoresBairroForn: TStringField;
    tFornecedoresCidadeForn: TStringField;
    tFornecedoresCEPForn: TStringField;
    tFornecedoresEstadoForn: TStringField;
    tFornecedoresTel1Forn: TStringField;
    tFornecedoresTel2Forn: TStringField;
    tFornecedoresFaxForn: TStringField;
    tFornecedoresCGC: TStringField;
    tFornecedoresInsc: TStringField;
    tFornecedoresContatoForn: TStringField;
    tFornecedoresDataCadastroForn: TDateField;
    tFornecedoresObsForn: TMemoField;
    tFornecedoresRamal: TStringField;
    tFornecedoresEmail: TStringField;
    tFornecedoresHomePage: TStringField;
    tFornecedoresCodCondPgto: TIntegerField;
    PopupMenu1: TPopupMenu;
    Imprimir1: TMenuItem;
    Visualizar1: TMenuItem;
    Panel2: TPanel;
    RxSpeedButton2: TRxSpeedButton;
    Bevel1: TBevel;
    RadioGroup2: TRadioGroup;
    RxDBFilter1: TRxDBFilter;
    RxDBFilter2: TRxDBFilter;
    tFornecedoresFantasia: TStringField;
    tFornecedoresFornecedorOutros: TStringField;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    CheckBox1: TCheckBox;
    tFornecedoresCodCidade: TIntegerField;
    tFornecedoreslkCidade: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrevFornecedores: TfPrevFornecedores;

implementation

uses UDM1, URelFornecedores, Printers;

{$R *.DFM}

procedure TfPrevFornecedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  RxDBFilter1.Active     := False;
  RxDBFilter2.Active     := True;
  DM1.tFornecedores.Close;
  DM1.tCidade.Close;
  DM1.tUF.Close;
  Action := Cafree;
end;

procedure TfPrevFornecedores.RadioGroup1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0 : begin
        tFornecedores.IndexFieldNames := 'NomeForn';
        RxDBLookupCombo1.Enabled := True;
        RxDBLookupCombo2.Enabled := True;
        Edit1.Enabled := False;
        Edit1.Clear;
        Edit2.Enabled := False;
        Edit2.Clear;
        end;
    1 : begin
        tFornecedores.IndexFieldNames := 'CodForn';
        Edit1.Enabled := True;
        Edit2.Enabled := True;
        RxDBLookupCombo1.Enabled := False;
        RxDBLookupCombo1.ClearValue;
        RxDBLookupCombo2.Enabled := False;
        RxDBLookupCombo2.ClearValue;
        end;
  end;
end;

procedure TfPrevFornecedores.BitBtn2Click(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
  RxDBLookupCombo2.ClearValue;
  Edit1.Clear;
  Edit2.Clear;
  RadioGroup1.ItemIndex      := 0;
  RadioGroup2.ItemIndex      := 0;
end;

procedure TfPrevFornecedores.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevFornecedores.Visualizar1Click(Sender: TObject);
begin
  case RadioGroup2.ItemIndex of
    0 : begin
          RxDbFilter2.Active := False;
          RxDbFilter1.Active := True;
        end;
    1 : begin
          RxDbFilter1.Active := False;
          RxDbFilter2.Active := True;
        end;
    2 : begin
          RxDbFilter1.Active := False;
          RxDbFilter2.Active := False;
        end;
  end;
  case RadioGroup1.ItemIndex of
    0 : begin
          if (RxDBLookupCombo1.Text <> '') and (RxDBLookupCombo2.Text <> '') then
            begin
              tFornecedores.Filtered := False;
              tFornecedores.Filter   := 'NomeForn >= '''+RxDBLookupCombo1.Text+''' and NomeForn <= '''+RxDBLookupCombo2.Text+'''';
              tFornecedores.Filtered := True;
              fRelFornecedores       := TfRelFornecedores.Create(Self);
              fRelFornecedores.QuickRep1.Preview;
              fRelFornecedores.QuickRep1.Free;
              tFornecedores.Filtered := False;
              RxDBFilter1.Active     := False;
              RxDBFilter2.Active     := False;
            end
          else
            begin
              tFornecedores.Filtered := False;
              fRelFornecedores       := TfRelFornecedores.Create(Self);
              fRelFornecedores.QuickRep1.Preview;
              fRelFornecedores.QuickRep1.Free;
              RxDBFilter1.Active     := False;
              RxDBFilter2.Active     := False;
            end;
        end;
    1 : begin
          if (Edit1.Text <> '') and (Edit2.Text <> '') then
            begin
              if StrToInt(Edit1.Text) <= StrToInt(Edit2.Text) then
                begin
                  tFornecedores.Filtered := False;
                  tFornecedores.Filter   := 'CodForn >= '''+Edit1.Text+''' and CodForn <= '''+Edit2.Text+'''';
                  tFornecedores.Filtered := True;
                  fRelFornecedores       := TfRelFornecedores.Create(Self);
                  fRelFornecedores.QuickRep1.Preview;
                  fRelFornecedores.QuickRep1.Free;
                  tFornecedores.Filtered := False;
                  RxDBFilter1.Active     := False;
                  RxDBFilter2.Active     := False;
                end
              else
              if StrToInt(Edit1.Text) > StrToInt(Edit2.Text) then
                begin
                  ShowMessage('Código inicial deve ser menor que o código final!');
                  RxDBFilter1.Active     := False;
                  RxDBFilter2.Active     := False;
                  Edit1.SetFocus;
                end;
            end
          else
            begin
              tFornecedores.Filtered := False;
              fRelFornecedores       := TfRelFornecedores.Create(Self);
              fRelFornecedores.QuickRep1.Preview;
              fRelFornecedores.QuickRep1.Free;
              RxDBFilter1.Active     := False;
              RxDBFilter2.Active     := False;
            end;
        end;
  end;
  tFornecedores.Filtered := False;
end;

procedure TfPrevFornecedores.Imprimir1Click(Sender: TObject);
begin
  case RadioGroup2.ItemIndex of
    0 : begin
          RxDbFilter2.Active := False;
          RxDbFilter1.Active := True;
        end;
    1 : begin
          RxDbFilter1.Active := False;
          RxDbFilter2.Active := True;
        end;
    2 : begin
          RxDbFilter1.Active := False;
          RxDbFilter2.Active := False;
        end;
  end;
  case RadioGroup1.ItemIndex of
    0 : begin
          if (RxDBLookupCombo1.Text <> '') and (RxDBLookupCombo2.Text <> '') then
            begin
              tFornecedores.Filtered := False;
              tFornecedores.Filter   := 'NomeForn >= '''+RxDBLookupCombo1.Text+''' and NomeForn <= '''+RxDBLookupCombo2.Text+'''';
              tFornecedores.Filtered := True;
              fRelFornecedores       := TfRelFornecedores.Create(Self);
              fRelFornecedores.QuickRep1.Print;
              fRelFornecedores.QuickRep1.Free;
              tFornecedores.Filtered := False;
              RxDBFilter1.Active     := False;
              RxDBFilter2.Active     := False;
            end
          else
            begin
              tFornecedores.Filtered := False;
              fRelFornecedores       := TfRelFornecedores.Create(Self);
              fRelFornecedores.QuickRep1.Print;
              fRelFornecedores.QuickRep1.Free;
              RxDBFilter1.Active     := False;
              RxDBFilter2.Active     := False;
            end;
        end;
    1 : begin
          if (Edit1.Text <> '') and (Edit2.Text <> '') then
            begin
              if StrToInt(Edit1.Text) <= StrToInt(Edit2.Text) then
                begin
                  tFornecedores.Filtered := False;
                  tFornecedores.Filter   := 'CodForn >= '''+Edit1.Text+''' and CodForn <= '''+Edit2.Text+'''';
                  tFornecedores.Filtered := True;
                  fRelFornecedores       := TfRelFornecedores.Create(Self);
                  fRelFornecedores.QuickRep1.Print;
                  fRelFornecedores.QuickRep1.Free;
                  tFornecedores.Filtered := False;
                  RxDBFilter1.Active     := False;
                  RxDBFilter2.Active     := False;
                end
              else
              if StrToInt(Edit1.Text) > StrToInt(Edit2.Text) then
                begin
                  ShowMessage('Código inicial deve ser menor que o código final!');
                  RxDBFilter1.Active     := False;
                  RxDBFilter2.Active     := False;
                  Edit1.SetFocus;
                end;
            end
          else
            begin
              tFornecedores.Filtered := False;
              fRelFornecedores       := TfRelFornecedores.Create(Self);
              fRelFornecedores.QuickRep1.Print;
              fRelFornecedores.QuickRep1.Free;
              RxDBFilter1.Active     := False;
              RxDBFilter2.Active     := False;
            end;
        end;
  end;
  tFornecedores.Filtered := False;
end;

procedure TfPrevFornecedores.FormShow(Sender: TObject);
begin
  DM1.tFornecedores.Open;
  DM1.tCidade.Open;
  DM1.tUF.Open;
  RxDBFilter1.Active := False;
  RxDBFilter2.Active := True;
  tFornecedores.IndexFieldNames := 'NomeForn';
  RxDBLookupCombo1.Enabled := True;
  RxDBLookupCombo2.Enabled := True;
  Edit1.Enabled := False;
  Edit1.Clear;
  Edit2.Enabled := False;
  Edit2.Clear;
end;

procedure TfPrevFornecedores.RxDBLookupCombo1Enter(Sender: TObject);
begin
  case RadioGroup2.ItemIndex of
    0 : begin
          RxDbFilter2.Active := False;
          RxDbFilter1.Active := True;
        end;
    1 : begin
          RxDbFilter1.Active := False;
          RxDbFilter2.Active := True;
        end;
    2 : begin
          RxDbFilter1.Active := False;
          RxDbFilter2.Active := False;
        end;
  end;
  tFornecedores.IndexFieldNames := 'NomeForn';
end;

end.

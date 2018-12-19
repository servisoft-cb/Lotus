unit UPrevMaterial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DBCtrls, Buttons, Menus, RXCtrls, DBFilter, RxLookup,
  Db, DBTables, MemTable;

type
  TfPrevMaterial = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    RadioGroup1: TRadioGroup;
    RxSpeedButton2: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    Imprimir1: TMenuItem;
    Visualizar1: TMenuItem;
    RadioGroup2: TRadioGroup;
    RxDBFilter1: TRxDBFilter;
    RxDBFilter2: TRxDBFilter;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    RxDBLookupCombo4: TRxDBLookupCombo;
    CheckBox1: TCheckBox;
    mMaterial: TMemoryTable;
    DataSource1: TDataSource;
    mMaterialCodMaterial: TIntegerField;
    mMaterialNomeMaterial: TStringField;
    mMaterialCor: TStringField;
    mMaterialUnidade: TStringField;
    mMaterialIpi: TFloatField;
    mMaterialICMS: TFloatField;
    mMaterialPrazo: TStringField;
    mMaterialSaldo: TFloatField;
    mMaterialPreco: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
  private
    { Private declarations }
    procedure Gravo_Memo;
  public
    { Public declarations }
  end;

var
  fPrevMaterial: TfPrevMaterial;

implementation

uses UDM1, URelMaterial, Printers;

{$R *.DFM}

procedure TfPrevMaterial.Gravo_Memo;
begin
  mMaterial.EmptyTable;
  Dm1.tMaterial.First;
  while not Dm1.tMaterial.Eof do
    begin
      if Dm1.tMaterialCor.IsEmpty then
        begin
          mMaterial.Insert;
          mMaterialCodMaterial.AsInteger := Dm1.tMaterialCodigo.AsInteger;
          mMaterialICMS.AsFloat          := Dm1.tMaterialICMS.AsFloat;
          mMaterialIpi.AsFloat           := Dm1.tMaterialIPI.AsFloat;
          mMaterialNomeMaterial.AsString := Dm1.tMaterialNome.AsString;
          mMaterialPrazo.AsString        := Dm1.tMateriallkCondPgto.AsString;
          mMaterialUnidade.AsString      := Dm1.tMaterialUnidade.AsString;
          mMaterialPreco.AsFloat         := Dm1.tMaterialPrCusto.AsFloat;
          mMaterialSaldo.AsFloat         := Dm1.tMaterialEstMinimo.AsFloat;
          mMaterial.Post;
        end
      else
        begin
          Dm1.tMaterialCor.First;
          while not Dm1.tMaterialCor.Eof do
            begin
              mMaterial.Insert;
              mMaterialCodMaterial.AsInteger := Dm1.tMaterialCodigo.AsInteger;
              mMaterialCor.AsString          := Dm1.tMaterialCorlkNomeCor.AsString;
              mMaterialICMS.AsFloat          := Dm1.tMaterialICMS.AsFloat;
              mMaterialIpi.AsFloat           := Dm1.tMaterialIPI.AsFloat;
              mMaterialNomeMaterial.AsString := Dm1.tMaterialNome.AsString;
              mMaterialPrazo.AsString        := Dm1.tMateriallkCondPgto.AsString;
              mMaterialUnidade.AsString      := Dm1.tMaterialUnidade.AsString;
              if Dm1.tMaterialLancaCor.AsBoolean then
                mMaterialPreco.AsFloat := Dm1.tMaterialCorPrCusto.AsFloat
              else
                mMaterialPreco.AsFloat := Dm1.tMaterialPrCusto.AsFloat;
              mMaterialSaldo.AsFloat   := Dm1.tMaterialEstMinimo.AsFloat;
              mMaterial.Post;
              Dm1.tMaterialCor.Next;
            end;
        end;
      Dm1.tMaterial.Next;
    end;
end;

procedure TfPrevMaterial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  RxDBFilter1.Active := False;
  RxDBFilter2.Active := True;
  if Screen.FormCount < 3 then
    begin
      DM1.tMaterial.Close;
      DM1.tMaterialCor.Close;
      DM1.tCondPgto.Close;
      DM1.tCondPgtoItem.Close;
      DM1.tCor.Close;
      DM1.tFornecedores.Close;
    end;
  Action             := Cafree;
end;

procedure TfPrevMaterial.BitBtn2Click(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
  RxDBLookupCombo2.ClearValue;
  RxDBLookupCombo3.ClearValue;
  RxDBLookupCombo4.ClearValue;
  RadioGroup1.ItemIndex := 0;
  RadioGroup2.ItemIndex := 0;
end;

procedure TfPrevMaterial.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevMaterial.RadioGroup1Click(Sender: TObject);
begin
  Case RadioGroup1.ItemIndex of
    0: begin
         RxDBLookupCombo1.Enabled  := True;
         RxDBLookupCombo2.Enabled  := True;
         RxDBLookupCombo3.ClearValue;
         RxDBLookupCombo4.ClearValue;
         RxDBLookupCombo3.Enabled  := False;
         RxDBLookupCombo4.Enabled  := False;
       end;
    1: begin
         RxDBLookupCombo1.Enabled := False;
         RxDBLookupCombo2.Enabled := False;
         RxDBLookupCombo1.ClearValue;
         RxDBLookupCombo2.ClearValue;
         RxDBLookupCombo3.Enabled := True;
         RxDBLookupCombo4.Enabled := True;
       end;
  end;
end;

procedure TfPrevMaterial.FormShow(Sender: TObject);
begin
  DM1.tMaterial.Open;
  DM1.tMaterialCor.Open;
  DM1.tCondPgto.Open;
  DM1.tCondPgtoItem.Open;
  DM1.tCor.Open;
  DM1.tFornecedores.Open;
  RxDBFilter1.Active        := False;
  RxDBFilter2.Active        := True;
  RxDBLookupCombo1.Enabled := False;
  RxDBLookupCombo2.Enabled := False;
  RxDBLookupCombo3.Enabled := False;
  RxDBLookupCombo4.Enabled := False;
end;

procedure TfPrevMaterial.Visualizar1Click(Sender: TObject);
begin
  case RadioGroup2.ItemIndex of
    0 : begin
          RxDBFilter1.Active := True;
          RxDBFilter2.Active := False;
        end;
    1 : begin
          RxDBFilter1.Active := False;
          RxDBFilter2.Active := True;
        end;
    2 : begin
          RxDBFilter2.Active := False;
          RxDBFilter1.Active := False;
        end;
  end;
  if RadioGroup1.ItemIndex = 1 then
    begin
      if (RxDBLookupCombo3.Text <> '') and (RxDBLookupCombo4.Text <> '') then
        begin
          DM1.tMaterial.Filtered := False;
          if CheckBox1.Checked then
            DM1.tMaterial.Filter   := 'Nome >= '''+RxDBLookupCombo3.Text+''' and Nome <= '''+RxDBLookupCombo4.Text+''''
          else
            DM1.tMaterial.Filter   := 'Nome >= '''+RxDBLookupCombo3.Text+''' and Nome <= '''+RxDBLookupCombo4.Text+''' and Inativo <> True';
          DM1.tMaterial.Filtered := True;
          Gravo_Memo;
          fRelMaterial := TfRelMaterial.Create(Self);
          fRelMaterial.QuickRep1.Preview;
          fRelMaterial.QuickRep1.Free;
          RxDBFilter1.Active     := False;
          RxDBFilter2.Active     := True;
        end;
    end
  else
  if RadioGroup1.ItemIndex = 0 then
    begin
      if (RxDBLookupCombo1.Text <> '') and (RxDBLookupCombo2.Text <> '') then
        begin
          if StrToInt(RxDBLookupCombo1.Text) <= StrToInt(RxDBLookupCombo2.Text) then
            begin
              DM1.tMaterial.Filtered := False;
              if CheckBox1.Checked then
                DM1.tMaterial.Filter   := 'Codigo >= '''+RxDBLookupCombo1.Text+''' and Codigo <= '''+RxDBLookupCombo2.Text+''''
              else
                DM1.tMaterial.Filter   := 'Codigo >= '''+RxDBLookupCombo1.Text+''' and Codigo <= '''+RxDBLookupCombo2.Text+''' and Inativo <> True';
              DM1.tMaterial.Filtered := True;
              Gravo_Memo;
              fRelMaterial := TfRelMaterial.Create(Self);
              fRelMaterial.QuickRep1.Preview;
              fRelMaterial.QuickRep1.Free;
              RxDBFilter1.Active     := False;
              RxDBFilter2.Active     := True;
            end
          else
          if StrToInt(RxDBLookupCombo1.Text) > StrToInt(RxDBLookupCombo2.Text) then
            begin
              ShowMessage('Código inicial deve ser menor que o código final!');
              RxDBFilter1.Active     := False;
              RxDBFilter2.Active     := True;
              RxDBLookupCombo1.SetFocus;
            end;
        end;
    end;
  DM1.tMaterial.Filtered := False;
end;

procedure TfPrevMaterial.Imprimir1Click(Sender: TObject);
begin
  case RadioGroup2.ItemIndex of
    0 : begin
          RxDBFilter2.Active := False;
          RxDBFilter1.Active := True;
        end;
    1 : begin
          RxDBFilter1.Active := False;
          RxDBFilter2.Active := True;
        end;
    2 : begin
          RxDBFilter2.Active := False;
          RxDBFilter1.Active := False;
        end;
  end;
  if RadioGroup1.ItemIndex = 1 then
    begin
      if (RxDBLookupCombo3.Text <> '') and (RxDBLookupCombo4.Text <> '') then
        begin
          DM1.tMaterial.Filtered := False;
          if CheckBox1.Checked then
            DM1.tMaterial.Filter   := 'Nome >= '''+RxDBLookupCombo3.Text+''' and Nome <= '''+RxDBLookupCombo4.Text+''''
          else
            DM1.tMaterial.Filter   := 'Nome >= '''+RxDBLookupCombo3.Text+''' and Nome <= '''+RxDBLookupCombo4.Text+''' and Inativo <> True';
          DM1.tMaterial.Filtered := True;
          Gravo_Memo;
          fRelMaterial := TfRelMaterial.Create(Self);
          fRelMaterial.QuickRep1.Print;
          fRelMaterial.QuickRep1.Free;
          RxDBFilter1.Active     := False;
          RxDBFilter2.Active     := True;
        end;
    end
  else
  if RadioGroup1.ItemIndex = 0 then
    begin
      if (RxDBLookupCombo1.Text <> '') and (RxDBLookupCombo2.Text <> '') then
        begin
          if StrToInt(RxDBLookupCombo1.Text) <= StrToInt(RxDBLookupCombo2.Text) then
            begin
              DM1.tMaterial.Filtered := False;
              if CheckBox1.Checked then
                DM1.tMaterial.Filter   := 'Codigo >= '''+RxDBLookupCombo1.Text+''' and Codigo <= '''+RxDBLookupCombo2.Text+''''
              else
                DM1.tMaterial.Filter   := 'Codigo >= '''+RxDBLookupCombo1.Text+''' and Codigo <= '''+RxDBLookupCombo2.Text+''' and Inativo <> True';
              DM1.tMaterial.Filtered := True;
              Gravo_Memo;
              fRelMaterial := TfRelMaterial.Create(Self);
              fRelMaterial.QuickRep1.Print;
              fRelMaterial.QuickRep1.Free;
              RxDBFilter1.Active     := False;
              RxDBFilter2.Active     := True;
            end
          else
          if StrToInt(RxDBLookupCombo1.Text) > StrToInt(RxDBLookupCombo2.Text) then
            begin
              ShowMessage('Código inicial deve ser menor que o código final!');
              RxDBFilter1.Active     := False;
              RxDBFilter2.Active     := True;
              RxDBLookupCombo1.SetFocus;
            end;
        end;
    end;
  DM1.tMaterial.Filtered := False;
end;

procedure TfPrevMaterial.RxDBLookupCombo1Enter(Sender: TObject);
begin
  case RadioGroup2.ItemIndex of
    0 : begin
          RxDBFilter2.Active := False;
          RxDBFilter1.Active := True;
        end;
    1 : begin
          RxDBFilter1.Active := False;
          RxDBFilter2.Active := True;
        end;
    2 : begin
          RxDBFilter2.Active := False;
          RxDBFilter1.Active := False;
        end;
  end;
  DM1.tMaterial.IndexFieldNames := 'Codigo';
end;

procedure TfPrevMaterial.RxDBLookupCombo3Enter(Sender: TObject);
begin
  case RadioGroup2.ItemIndex of
    0 : begin
          RxDBFilter2.Active := False;
          RxDBFilter1.Active := True;
        end;
    1 : begin
          RxDBFilter1.Active := False;
          RxDBFilter2.Active := True;
        end;
    2 : begin
          RxDBFilter2.Active := False;
          RxDBFilter1.Active := False;
        end;
  end;
  DM1.tMaterial.IndexFieldNames := 'Nome';
end;

end.

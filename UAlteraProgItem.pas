unit UAlteraProgItem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Grids, DBGrids, RXDBCtrl, ToolEdit, CurrEdit,
  Buttons, ExtCtrls;

type
  TfAlteraProgItem = class(TForm)
    GroupBox1: TGroupBox;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    DateEdit3: TDateEdit;
    DateEdit4: TDateEdit;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    BitBtn8: TBitBtn;
    BitBtn5: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    Panel1: TPanel;
    procedure DateEdit1Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Verifica_Data;
    procedure Le_Data(Setor : Integer);
  public
    { Public declarations }
  end;

var
  fAlteraProgItem: TfAlteraProgItem;
  vData : tDate;
  vQtd : Real;

implementation

uses UDM1;

{$R *.DFM}

procedure TfAlteraProgItem.Le_Data(Setor : Integer);
begin
  //aqui
  {DM1.tProgramacaoDatas.SetKey;
  DM1.tProgramacaoDatasNumLancamento.AsInteger := DM1.tProgramacaoNumLancamento.AsInteger;
  DM1.tProgramacaoDatasData.AsDateTime := vData;
  if DM1.tProgramacaoDatas.GotoKey then
    begin
      case setor of
        1 : vQtd := DM1.tProgramacaoDatasQtdCorte.AsFloat;
        2 : vQtd := DM1.tProgramacaoDatasQtdCostura.AsFloat;
        3 : vQtd := DM1.tProgramacaoDatasQtdPre.AsFloat;
        4 : vQtd := DM1.tProgramacaoDatasQtdMontagem.AsFloat;
      end;
    end
  else
    begin
      case setor of
        1 : vQtd := DM1.tProgramacaoQtdDiaCorte.AsFloat;
        2 : vQtd := DM1.tProgramacaoQtdDiaCostura.AsFloat;
        3 : vQtd := DM1.tProgramacaoQtdDiaPre.AsFloat;
        4 : vQtd := DM1.tProgramacaoQtdDiaMontagem.AsFloat;
      end;
    end;}
end;

procedure TfAlteraProgItem.Verifica_Data;
begin
  if DayOfWeek(vData) = 1 then
    vData := vData + 1
  else
  if DayOfWeek(vData) = 7 then
    vData := vData + 2;
end;

procedure TfAlteraProgItem.DateEdit1Exit(Sender: TObject);
begin
  if DateEdit1.Text <> '  /  /    ' then
    begin
      if DateEdit2.Text = '  /  /    ' then
        DateEdit2.Text := DateEdit1.Text
      else
      if DateEdit3.Text = '  /  /    ' then
        DateEdit3.Text := DateEdit1.Text
      else
      if DateEdit4.Text = '  /  /    ' then
        DateEdit4.Text := DateEdit1.Text
      else
    end;
end;

procedure TfAlteraProgItem.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfAlteraProgItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfAlteraProgItem.BitBtn8Click(Sender: TObject);
var
  vDtCorte, vDtCostura, vDtPre, vDtMontagem : TDate;
  vQtdCorte, vQtdCostura, vQtdPre, vQtdMontagem : Real;
begin
  Screen.Cursor  := crHourGlass;
  Panel1.Caption := '..... Aguarde geração da programação .....';
  fAlteraProgItem.Refresh;

  //*** Altera a quantidade de produção diária na tabela dbProgramacaoDatas apartir da
  //*** data espeficicada ****************************
  //aqui 01/04/2010
  {DM1.tProgramacaoDatas.First;
  while not DM1.tProgramacaoDatas.Eof do
    begin
      if (DM1.tProgramacaoDatasData.AsDateTime >= DateEdit1.Date) or
         (DM1.tProgramacaoDatasData.AsDateTime >= DateEdit2.Date) or
         (DM1.tProgramacaoDatasData.AsDateTime >= DateEdit3.Date) or
         (DM1.tProgramacaoDatasData.AsDateTime >= DateEdit4.Date) then
        begin                                     
          DM1.tProgramacaoDatas.Edit;
          if (DM1.tProgramacaoDatasData.AsDateTime >= DateEdit1.Date) and (CurrencyEdit1.AsInteger > 0) then
            DM1.tProgramacaoDatasQtdCorte.AsFloat := CurrencyEdit1.Value;
          if (DM1.tProgramacaoDatasData.AsDateTime >= DateEdit2.Date) and (CurrencyEdit2.AsInteger > 0) then
            DM1.tProgramacaoDatasQtdCostura.AsFloat := CurrencyEdit2.Value;
          if (DM1.tProgramacaoDatasData.AsDateTime >= DateEdit3.Date) and (CurrencyEdit3.AsInteger > 0) then
            DM1.tProgramacaoDatasQtdPre.AsFloat := CurrencyEdit3.Value;
          if (DM1.tProgramacaoDatasData.AsDateTime >= DateEdit4.Date) and (CurrencyEdit4.AsInteger > 0) then
            DM1.tProgramacaoDatasQtdMontagem.AsFloat := CurrencyEdit4.Value;
          DM1.tProgramacaoDatas.Post;
        end;
      DM1.tProgramacaoDatas.Next;
    end;

  vData := DM1.tProgramacaoDtCorteI.AsDateTime;
  Verifica_Data;
  vDtCorte    := vData;
  Le_Data(1);
  vQtdCorte   := vQtd;

  vData := DM1.tProgramacaoDtCosturaI.AsDateTime;
  Verifica_Data;
  vDtCostura  := vData;
  Le_Data(2);
  vQtdCostura := vQtd;

  vData := DM1.tProgramacaoDtPreI.AsDateTime;
  Verifica_Data;
  vDtPre  := vData;
  Le_Data(3);
  vQtdPre := vQtd;

  vData := DM1.tProgramacaoDtMontagemI.AsDateTime;
  Verifica_Data;
  vDtMontagem := vData;
  Le_Data(4);
  vQtdMontagem := vQtd;
              
  DM1.tProgramacaoItens.First;
  while not DM1.tProgramacaoItens.Eof do
    begin
      DM1.tProgramacaoItens.Edit;
      if DM1.tProgramacaoItensCalcDtCorte.AsBoolean then
        DM1.tProgramacaoItensDtCorteI.AsDateTime    := vDtCorte
      else
        DM1.tProgramacaoItensDtCorteI.Clear;
      if DM1.tProgramacaoItensCalcDtCostura.AsBoolean then
        DM1.tProgramacaoItensDtCosturaI.AsDateTime  := vDtCostura
      else
        DM1.tProgramacaoItensDtCosturaI.Clear;
      if DM1.tProgramacaoItensCalcDtPre.AsBoolean then
        DM1.tProgramacaoItensDtPreI.AsDateTime      := vDtPre
      else
        DM1.tProgramacaoItensDtPreI.Clear;
      if DM1.tProgramacaoItensCalcDtMontagem.AsBoolean then
        DM1.tProgramacaoItensDtMontagemI.AsDateTime := vDtMontagem
      else
        DM1.tProgramacaoItensDtMontagemI.Clear;

      // Corte
      if DM1.tProgramacaoItensCalcDtCorte.AsBoolean then
        begin
          vQtdCorte := vQtdCorte - DM1.tProgramacaoItensQtdPares.AsFloat;
          if vQtdCorte <> 0 then
            begin
              while not(vQtdCorte > 0) or (vQtdCorte = 0) do
                begin
                  vDtCorte  := vDtCorte + 1;
                  vData     := vDtCorte;
                  Verifica_Data;
                  vDtCorte  := vData;
                  Le_Data(1);
                  vQtdCorte := vQtdCorte + vQtd;
                end;
            end;
          DM1.tProgramacaoItensDtCorteF.AsDateTime := vDtCorte;
          if vQtdCorte = 0 then
            begin
              vDtCorte  := vDtCorte + 1;
              vData     := vDtCorte;
              Verifica_Data;
              vDtCorte  := vData;
              Le_Data(1);
              vQtdCorte := vQtdCorte + vQtd;
            end;
        end
      else
        DM1.tProgramacaoItensDtCorteF.Clear;

      //Costura
      if DM1.tProgramacaoItensCalcDtCostura.AsBoolean then
        begin
          vQtdCostura := vQtdCostura - DM1.tProgramacaoItensQtdPares.AsFloat;
          if vQtdCostura <> 0 then
            begin
              while not(vQtdCostura > 0) or (vQtdCostura = 0) do
                begin
                  vDtCostura := vDtCostura + 1;
                  vData      := vDtCostura;
                  Verifica_Data;
                  vDtCostura := vData;
                  Le_Data(2);
                  vQtdCostura := vQtdCostura + vQtd;
                end;
            end;
          DM1.tProgramacaoItensDtCosturaF.AsDateTime := vDtCostura;
          if vQtdCostura = 0 then
            begin
              vDtCostura := vDtCostura + 1;
              vData      := vDtCostura;
              Verifica_Data;
              vDtCostura  := vData;
              Le_Data(2);
              vQtdCostura := vQtdCostura + vQtd;
            end;
        end
      else
        DM1.tProgramacaoItensDtCosturaF.Clear;

      //Pré
      if DM1.tProgramacaoItensCalcDtPre.AsBoolean then
        begin
          vQtdPre := vQtdPre - DM1.tProgramacaoItensQtdPares.AsFloat;
          if vQtdPre <> 0 then
            begin
              while not(vQtdPre > 0) or (vQtdPre = 0) do
                begin
                  vDtPre  := vDtPre + 1;
                  vData   := vDtPre;
                  Verifica_Data;
                  vDtPre  := vData;
                  Le_Data(3);
                  vQtdPre := vQtdPre + vQtd;
                end;
            end;
          DM1.tProgramacaoItensDtPreF.AsDateTime := vDtPre;
          if vQtdPre = 0 then
            begin
              vDtPre  := vDtPre + 1;
              vData   := vDtPre;
              Verifica_Data;
              vDtPre  := vData;
              Le_Data(3);
              vQtdPre := vQtdPre + vQtd;
            end;
        end
      else
        DM1.tProgramacaoItensDtPreF.Clear;

      //Montagem
      if DM1.tProgramacaoItensCalcDtMontagem.AsBoolean then
        begin
          vQtdMontagem := vQtdMontagem - DM1.tProgramacaoItensQtdPares.AsFloat;
          if vQtdMontagem <> 0 then
            begin
              while not(vQtdMontagem > 0) or (vQtdMontagem = 0) do
                begin
                  vDtMontagem  := vDtMontagem + 1;
                  vData   := vDtMontagem;
                  Verifica_Data;
                  vDtMontagem := vData;
                  Le_Data(4);
                  vQtdMontagem := vQtdMontagem + vQtd;
                end;
            end;
          DM1.tProgramacaoItensDtMontagemF.AsDateTime := vDtMontagem;
          if vQtdMontagem = 0 then
            begin
              vDtMontagem  := vDtMontagem + 1;
              vData        := vDtMontagem;
              Verifica_Data;
              vDtMontagem  := vData;
              Le_Data(4);
              vQtdMontagem := vQtdMontagem + vQtd;
            end;
        end
      else
        DM1.tProgramacaoItensDtMontagemF.Clear;

      DM1.tProgramacaoItens.Post;
      DM1.tProgramacaoItens.Next;
    end;

  Screen.Cursor := crDefault;
  Panel1.Caption := '..... Final da geração .....';
  fAlteraProgItem.Refresh;}
end;

procedure TfAlteraProgItem.FormShow(Sender: TObject);
begin
  Panel1.Caption := '';
end;

end.

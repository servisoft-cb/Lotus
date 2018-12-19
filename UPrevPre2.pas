unit UPrevPre2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DB, DBTables, DBClient, Grids, DBGrids,
  SMDBGrid, ShellApi;

type
  TfPrevPre2 = class(TForm)
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label2: TLabel;
    Edit2: TEdit;
    CheckBox1: TCheckBox;
    mAuxPre: TClientDataSet;
    mAuxPreConstrucao: TStringField;
    mAuxPreCarimbo: TStringField;
    mAuxPreCodMaterial: TIntegerField;
    mAuxPreCodPosicao: TIntegerField;
    mAuxPreCodCor: TIntegerField;
    mAuxPreLargura: TStringField;
    mAuxPreQtdPar: TIntegerField;
    mAuxPreConsumo: TFloatField;
    mAuxPreGrade: TClientDataSet;
    mAuxPreGradeConstrucao: TStringField;
    mAuxPreGradeCarimbo: TStringField;
    mAuxPreGradeCodMaterial: TIntegerField;
    mAuxPreGradeCodCor: TIntegerField;
    mAuxPreGradeCodPosicao: TIntegerField;
    mAuxPreGradeLargura: TStringField;
    mAuxPreGradeTamanho: TStringField;
    mAuxPreGradeMarcarTam: TStringField;
    mAuxPreGradeQtdPar: TIntegerField;
    dsmAuxPre: TDataSource;
    mAuxPrelkMaterial: TStringField;
    mAuxPrelkCor: TStringField;
    mAuxPrelkPosicao: TStringField;
    dsmPreAuxGrade: TDataSource;
    CheckBox2: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    linha, pagina : Integer;
    F: TextFile;
    Texto : String;
    vTotalPrs : Integer;

    procedure Gera_Dados;
    procedure Limpa_Tabela;
    procedure Imprimir_Pre;
    procedure Imprime_Cabecalho;
    procedure Imprime_Detalhe;
    procedure Imprime_Rodape;
    function fnc_Existe_Pedido(NumPedido : Integer) : Boolean;
    procedure prc_Le_Pedido_Material(Mercado : String);
    procedure prc_Gravar_mAuxPre(QtdPar : Integer);
    procedure prc_Gravar_mAuxPreGrade_Ped;
    procedure prc_Gravar_mAuxPreGrade_Tal;
  public
    { Public declarations }
  end;

var
  fPrevPre2: TfPrevPre2;

implementation

uses UDM1, UEscImpressora, UDM2, URelPre2;

{$R *.DFM}

procedure TfPrevPre2.Limpa_Tabela;
begin
  mAuxPre.First;
  while not mAuxPre.Eof do
  begin
    mAuxPreGrade.First;
    while not mAuxPreGrade.Eof do
      mAuxPreGrade.Delete;
    mAuxPre.Delete;
  end;
end;

procedure TfPrevPre2.Gera_Dados;
begin
  DM1.tPedido.IndexFieldNames := 'Pedido';
  Limpa_Tabela;
  Case RadioGroup1.ItemIndex of
    0 : begin
          DM1.tLotePedidoMI.First;
          while not DM1.tLotePedidoMI.Eof do
          begin
            if fnc_Existe_Pedido(DM1.tLotePedidoMIPedido.AsInteger) then
            begin
              DM1.tPedidoItem.First;
              while not DM1.tPedidoItem.Eof do
              begin
                if not DM1.tPedidoItemCancelado.AsBoolean then
                  prc_Le_Pedido_Material('I');
                DM1.tPedidoItem.Next;
              end;
            end;
            DM1.tLotePedidoMI.Next;
          end;
        end;
    1 : begin
          vTotalPrs := 0;
          DM1.tLote.Filtered := False;
          DM1.tLote.Filter   := 'Lote >= '''+Edit1.Text+''' and Lote <= '''+Edit2.Text+'''';
          DM1.tLote.Filtered := True;
          DM1.tLote.First;
          while not DM1.tLote.Eof do
          begin
            vTotalPrs := vTotalPrs + DM1.tLoteQtdPares.AsInteger;
            if fnc_Existe_Pedido(DM1.tLoteNroPedido.AsInteger) then
            begin
              if DM1.tPedidoItem.FindKey([DM1.tLoteNroPedido.AsInteger,DM1.tLoteItemPed.AsInteger]) then
              begin
                DM1.tTalao.First;
                while not DM1.tTalao.Eof do
                begin
                  prc_Le_Pedido_Material('E');
                  DM1.tTalao.Next;
                end;
              end;
            end;
          DM1.tLote.Next;
          end;
          DM1.tLote.Filtered := False;
        end;
  end;
end;

procedure TfPrevPre2.Imprime_Cabecalho;
var
 i : Integer;
 texto1, texto2 : String;
begin
  pagina := pagina + 1;
  if Pagina > 1 then
    begin
      while linha < 33 do
        begin
          Linha := Linha + 1;
          Writeln(F);
        end;
    end;

  texto1 := DM1.tEmpresaEmpresa.AsString;
  for i := 1 to 116 - Length(texto1) do
    texto1 := texto1 + ' ';
  texto1 := texto1 + 'Pag.: ' + IntToStr(Pagina);
  Writeln(F,Texto1);
  Case RadioGroup1.ItemIndex of
    0 : begin
          texto1 := '                                             RELATORIO PARA O PRE - LOTE No.: ';
          Texto2 := Edit1.Text;
          for i := 1 to 11 - Length(Texto2) do
            Texto2 := Texto2 + ' ';
          Texto1 := Texto1 + Texto2 + '                           Data: ';
          texto1 := texto1 + DateToStr(Date);
        end;
    1 : begin
          texto1 := '                                            RELATORIO PARA O PRE - LOTES No.: ';
          Texto2 := Edit1.Text + ' a ' + Edit2.Text;
          for i := 1 to 25 - Length(Texto2) do
            Texto2 := Texto2 + ' ';
          Texto1 := Texto1 + Texto2 + '             Data: ';
          texto1 := texto1 + DateToStr(Date);
        end;
  end;
  Writeln(F,Texto1);


  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Writeln(F,'Construcao           Carimbo      Material/Posicao                                       Cor                Qtd. Pares       Consumo');
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');

  linha := 5;
end;

procedure TfPrevPre2.Imprime_Detalhe;
var
  texto1, texto2, texto3, texto4, texto5 : String;
  i : Integer;
  ImpMarcar : Boolean;
begin
  texto2 := copy(mAuxPreConstrucao.AsString,1,20);
  for i := 1 to 21 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto2;
  texto2 := mAuxPreCarimbo.AsString;
  for i := 1 to 13 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;
  texto2 := Copy(mAuxPrelkMaterial.AsString,1,33) + '/';
  Texto2 := Texto2 + Copy(mAuxPrelkPosicao.AsString,1,20);
  for i := 1 to 55 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;
  texto2 := mAuxPrelkCor.AsString;
  for i := 1 to 18 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;
  texto2 := IntToStr(mAuxPreQtdPar.AsInteger);
  for i := 1 to 11 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2;
  texto2 := FormatFloat('###,##0.00000',mAuxPreConsumo.AsFloat);
  for i := 1 to 14 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  Texto1 := Texto1 + Texto2;
  writeln(F,Texto1);
  linha := linha + 1;

  ImpMarcar := False;
  if mAuxPreLargura.AsString <> '' then
    texto2 := ' Larg: ' + mAuxPreLargura.AsString +  '  Produzir: '
  else
    texto2 := '          Produzir: ';
  texto4 := '            Marcar: ';
  texto3 := '        Quantidade: ';
  mAuxPreGrade.First;
  while not mAuxPreGrade.EOF do
    begin
      if mAuxPreGradeQtdPar.AsInteger > 0 then
        begin
          texto5 := mAuxPreGradeTamanho.AsString;
          for i := 1 to 4 - length(texto5) do
            texto5 := ' ' + texto5;
          texto2 := texto2 + texto5 + '  ';

          if mAuxPreGradeMarcarTam.AsString <> '' then
            ImpMarcar := True;

          texto5 := mAuxPreGradeMarcarTam.AsString;
          for i := 1 to 4 - length(texto5) do
            texto5 := ' ' + texto5;
          texto4 := texto4 + texto5 + '  ';

          texto5 := mAuxPreGradeQtdPar.AsString;
          for i := 1 to 4 - length(mAuxPreGradeQtdPar.AsString) do
            texto5 := ' ' + texto5;
          texto3 := texto3 + texto5 + '  ';
        end;
      mAuxPreGrade.Next
    end;
  writeln(F, texto2);
  if ImpMarcar then
    writeln(F, texto4);
  writeln(F, texto3);
  linha := linha + 2;
end;

procedure TfPrevPre2.Imprime_Rodape;
var
  Texto1 : String;
begin
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Case RadioGroup1.ItemIndex of
    0 : Texto1 := 'Total de Pares: ' + DM1.tLoteMIQtdPares.AsString;
    1 : Texto1 := 'Total de Pares: ' + IntToStr(vTotalPrs);
  end;
  WriteLn(F,Texto1);
  Linha := Linha + 2;
  while linha < 33 do
    begin
      Linha := Linha + 1;
      Writeln(F);
    end;
end;

procedure TfPrevPre2.Imprimir_Pre;
begin
  if CheckBox2.Checked then
  begin
    fRelPre2 := TfRelPre2.Create(Self);
    Case RadioGroup1.ItemIndex of
      0 : fRelPre2.vQtdPar := DM1.tLoteMIQtdPares.AsInteger;
      1 : fRelPre2.vQtdPar := vTotalPrs;
    end;
    fRelPre2.RLReport1.Preview;
    fRelPre2.RLReport1.Free;
    FreeAndNil(fRelPre2);
  end
  else
  begin
    fEscImpressora := TfEscImpressora.Create(Self);
    fEscImpressora.ShowModal;
    linha  := 99;
    pagina := 0;
    AssignFile(F,DM1.tImpressoraEndereco.AsString);
    ReWrite(F);
    if not DM1.tImpressoraVisualizar.AsBoolean then
      Write(F,#15);
    mAuxPre.First;
    while not mAuxPre.EOF do
    begin
      if linha > 30 then
        Imprime_Cabecalho;
      Imprime_Detalhe;
      mAuxPre.Next;
    end;
    Imprime_Rodape;
    CloseFile(F);
    if DM1.tImpressoraVisualizar.AsBoolean then
    begin
      Texto := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
      //WinExec(PChar(Texto),SW_MAXIMIZE);
      ShellExecute(Application.Handle, 'Open', PChar(DM1.tImpressoraEndereco.AsString), nil, nil, SW_SHOWMAXIMIZED);
    end;
  end;
end;

procedure TfPrevPre2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Dm1.tPedido.Close;
  Dm1.tPedidoItem.Close;
  Dm1.tLoteMI.Close;
  Dm1.tLotePedidoMI.Close;
  Dm1.tLote.Close;
  Dm1.tPedidoMaterial.Close;
  Dm1.tPedidoGrade.Close;
  Dm1.tMaterial.Close;
  Dm1.tMaterialGradeNum.Close;
  Dm1.tTalao.Close;
  Dm1.tTalaoGrade.Close;
  DM1.tCor.Close;
  DM1.tGrade.Close;
  DM1.tGradeItem.Close;
  DM1.tProduto.Close;
  DM1.tConstrucao.Close;
  DM1.tPosicao.Close;
  Action := Cafree;
end;

procedure TfPrevPre2.BitBtn2Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 0;
  Edit1.Clear;
  Edit2.Clear;
  RadioGroup1.SetFocus;
end;

procedure TfPrevPre2.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevPre2.BitBtn1Click(Sender: TObject);
begin
  if trim(Edit1.Text) = '' then
  begin
    ShowMessage('Deve ser informado um Lote p/ gerar o relatório!');
    Edit1.SetFocus;
    exit;
  end;
  
  if RadioGroup1.ItemIndex = 0 then
  begin
    if DM1.tLoteMI.Locate('Lote',StrToInt(Edit1.Text),[loCaseInsensitive]) then
    begin
      Screen.Cursor := crHourGlass;
      Gera_Dados;
      Imprimir_Pre;
      Screen.Cursor := crDefault;
    end
    else
    begin
      ShowMessage('Não foi encontrado "Lote" c/ este número!');
      Edit1.SetFocus;
    end;
  end
  else
  begin
    if (Edit1.Text <> '') and (Edit2.Text <> '')then
    begin
      Screen.Cursor := crHourGlass;
      Gera_Dados;
      Imprimir_Pre;
      Screen.Cursor := crDefault;
    end
    else
    begin
      ShowMessage('Deve ser informado Lotes "Inicial" e "Final"!');
      Edit1.SetFocus;
    end;
  end;
end;

procedure TfPrevPre2.RadioGroup1Click(Sender: TObject);
begin
  Case RadioGroup1.ItemIndex of
    0 : Edit2.Enabled := False;
    1 : Edit2.Enabled := True;
  end;
end;

procedure TfPrevPre2.FormShow(Sender: TObject);
begin
  Dm1.tPedido.Open;
  Dm1.tPedidoItem.Open;
  Dm1.tLoteMI.Open;
  Dm1.tLotePedidoMI.Open;
  Dm1.tLote.Open;
  Dm1.tPedidoMaterial.Open;
  Dm1.tPedidoGrade.Open;
  Dm1.tMaterial.Open;
  Dm1.tMaterialGradeNum.Open;
  Dm1.tTalao.Open;
  Dm1.tTalaoGrade.Open;
  DM1.tCor.Open;
  DM1.tGrade.Open;
  DM1.tGradeItem.Open;
  DM1.tGradeItemlk.Open;
  DM1.tProduto.Open;
  DM1.tConstrucao.Open;
  DM1.tPosicao.Open;
  DM1.tPosicao2.Open;
end;

function TfPrevPre2.fnc_Existe_Pedido(NumPedido: Integer): Boolean;
begin
  if not DM1.tPedido.FindKey([NumPedido]) then
    Result := False
  else
    Result := (not(DM1.tPedidoCancelado.AsBoolean) and not(DM1.tPedidoSuspenso.AsBoolean));
end;

procedure TfPrevPre2.prc_Le_Pedido_Material(Mercado : String);
begin
  DM1.tMaterial.IndexFieldNames := 'Codigo';
  DM1.tPedidoMaterial.First;
  while not DM1.tPedidoMaterial.Eof do
  begin
    if DM1.tPedidoMateriallkPre.AsBoolean then
    begin
      if Mercado = 'I' then
      begin
        prc_Gravar_mAuxPre(DM1.tPedidoItemQtdPares.AsInteger);
        prc_Gravar_mAuxPreGrade_Ped;
      end
      else
      begin
        prc_Gravar_mAuxPre(DM1.tTalaoQtdPar.AsInteger);
        prc_Gravar_mAuxPreGrade_Tal;
      end;
    end;
    DM1.tPedidoMaterial.Next;
  end;

end;

procedure TfPrevPre2.prc_Gravar_mAuxPre(QtdPar : Integer);
var
  vCarimboAux : String;
  vCodPosicaoAux : Integer;
begin
  vCarimboAux := '';
  if CheckBox1.Checked then
  begin
    if DM1.tPedidoCarimbo.AsString <> DM1.tParametrosCarimbo.AsString then
      vCarimboAux := 'SEM CARIMBO'
    else
      vCarimboAux := DM1.tParametrosCarimbo.AsString;
  end;
  vCodPosicaoAux := StrToInt(FormatFloat('0',DM1.tPedidoMaterialCodPosicao.AsInteger));
  if mAuxPre.FindKey([DM1.tPedidoItemlkConstrucao.AsString,vCarimboAux,DM1.tPedidoMaterialCodMaterial.AsInteger,vCodPosicaoAux,DM1.tPedidoMaterialCodCor.AsInteger,DM1.tPedidoItemlkLargura.AsString]) then
    mAuxPre.Edit
  else
  begin
    mAuxPre.Insert;
    mAuxPreConstrucao.AsString   := DM1.tPedidoItemlkConstrucao.AsString;
    mAuxPreCarimbo.AsString      := vCarimboAux;
    mAuxPreCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
    mAuxPreCodPosicao.AsInteger  := vCodPosicaoAux;
    mAuxPreCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
    mAuxPreLargura.AsString      := DM1.tPedidoItemlkLargura.AsString;
  end;
  mAuxPreQtdPar.AsInteger   := mAuxPreQtdPar.AsInteger + QtdPar;
  mAuxPreConsumo.AsFloat    := mAuxPreConsumo.AsFloat + (QtdPar * DM1.tPedidoMaterialConsumoPr.AsFloat);
  mAuxPre.Post;
end;

procedure TfPrevPre2.prc_Gravar_mAuxPreGrade_Ped;
var
  vTamMaterial, vMarcarTam : String;
begin
  if not DM1.tMaterial.FindKey([DM1.tPedidoMaterialCodMaterial.AsInteger]) then
    exit;
  DM1.tPedidoGrade.First;
  while not DM1.tPedidoGrade.Eof do
  begin
    vTamMaterial := DM1.tPedidoGradelkTamanho.AsString;
    vMarcarTam   := DM1.tPedidoGradelkMarcarTam.AsString;
    if (DM1.tMaterialCodGrade.AsInteger > 0) and (DM1.tMaterialGradeNum.FindKey([DM1.tPedidoMaterialCodMaterial.AsInteger,DM1.tPedidoGradeCodGrade.AsInteger,DM1.tPedidoGradePosicao.AsInteger])) then
       vTamMaterial := DM1.tMaterialGradeNumTamMaterial.AsString;
    if DM1.tMaterialTipoMat.AsString <> 'S' then
      vMarcarTam   := '';
    if mAuxPreGrade.FindKey([DM1.tPedidoItemlkConstrucao.AsString,mAuxPreCarimbo.AsString,DM1.tPedidoMaterialCodMaterial.AsInteger,mAuxPreCodPosicao.AsInteger,
                             DM1.tPedidoMaterialCodCor.AsInteger,DM1.tPedidoItemlkLargura.AsString,vTamMaterial]) then
      mAuxPreGrade.Edit
    else
    begin
      mAuxPreGrade.Insert;
      mAuxPreGradeConstrucao.AsString   := DM1.tPedidoItemlkConstrucao.AsString;
      mAuxPreGradeCarimbo.AsString      := mAuxPreCarimbo.AsString;
      mAuxPreGradeCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
      mAuxPreGradeCodPosicao.AsInteger  := mAuxPreCodPosicao.AsInteger;
      mAuxPreGradeCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
      mAuxPreGradeLargura.AsString      := DM1.tPedidoItemlkLargura.AsString;
      mAuxPreGradeTamanho.AsString      := vTamMaterial;
      mAuxPreGradeMarcarTam.AsString    := vMarcarTam;
    end;
    mAuxPreGradeQtdPar.AsInteger := mAuxPreGradeQtdPar.AsInteger + DM1.tPedidoGradeQtd.AsInteger;
    mAuxPreGrade.Post;
    DM1.tPedidoGrade.Next;
  end;
end;

procedure TfPrevPre2.prc_Gravar_mAuxPreGrade_Tal;
var
  vTamMaterial, vMarcarTam : String;
begin
  if not DM1.tMaterial.FindKey([DM1.tPedidoMaterialCodMaterial.AsInteger]) then
    exit;

  DM1.tTalaoGrade.First;
  while not DM1.tTalaoGrade.Eof do
  begin
    vTamMaterial := DM1.tTalaoGradelkTamanho.AsString;
    vMarcarTam   := DM1.tTalaoGradelkMarcarTam.AsString;
    if (DM1.tMaterialCodGrade.AsInteger > 0) and (DM1.tMaterialGradeNum.FindKey([DM1.tPedidoMaterialCodMaterial.AsInteger,DM1.tTalaoGradeCodGrade.AsInteger,DM1.tTalaoGradePosicao.AsInteger])) then
       vTamMaterial := DM1.tMaterialGradeNumTamMaterial.AsString;
    if DM1.tMaterialTipoMat.AsString <> 'S' then
      vMarcarTam   := '';
    if mAuxPreGrade.FindKey([DM1.tPedidoItemlkConstrucao.AsString,mAuxPreCarimbo.AsString,DM1.tPedidoMaterialCodMaterial.AsInteger,mAuxPreCodPosicao.AsInteger,DM1.tPedidoMaterialCodCor.AsInteger,DM1.tPedidoItemlkLargura.AsString,vTamMaterial]) then
      mAuxPreGrade.Edit
    else
    begin
      mAuxPreGrade.Insert;
      mAuxPreGradeConstrucao.AsString   := DM1.tPedidoItemlkConstrucao.AsString;
      mAuxPreGradeCarimbo.AsString      := mAuxPreCarimbo.AsString;
      mAuxPreGradeCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
      mAuxPreGradeCodPosicao.AsInteger  := mAuxPreCodPosicao.AsInteger;
      mAuxPreGradeCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
      mAuxPreGradeLargura.AsString      := DM1.tPedidoItemlkLargura.AsString;
      mAuxPreGradeTamanho.AsString      := vTamMaterial;
      mAuxPreGradeMarcarTam.AsString    := vMarcarTam;
    end;
    mAuxPreGradeQtdPar.AsInteger := mAuxPreGradeQtdPar.AsInteger + DM1.tTalaoGradeQtdPar.AsInteger;
    mAuxPreGrade.Post;
    DM1.tTalaoGrade.Next;
  end;
end;

end.

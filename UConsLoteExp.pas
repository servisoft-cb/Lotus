unit UConsLoteExp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, RXLookup, StdCtrls, Buttons, DBCtrls, Grids, DBGrids, Db,
  DBTables, DBVGrids, DBFilter, Menus, RXCtrls, RXDBCtrl, ComCtrls,
  SMDBGrid;

type
  TfConsLoteExp = class(TForm)
    Panel1: TPanel;
    Panel5: TPanel;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn4: TBitBtn;
    Bevel1: TBevel;
    BitBtn3: TBitBtn;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    DBGrid3: TDBGrid;
    GroupBox4: TGroupBox;
    VDBGrid1: TVDBGrid;
    tTalao: TTable;
    dsTalao: TDataSource;
    tTalaoGrade: TTable;
    dsTalaoGrade: TDataSource;
    tTalaoLote: TIntegerField;
    tTalaoCodProduto: TIntegerField;
    tTalaoCodCabedal1: TIntegerField;
    tTalaoCodCabedal2: TIntegerField;
    tTalaoCodCor: TIntegerField;
    tTalaoCodCorForro: TIntegerField;
    tTalaoCodCorPalmilha: TIntegerField;
    tTalaoCodCorSolado: TIntegerField;
    tTalaoQtdPar: TIntegerField;
    tTalaoGradeLote: TIntegerField;
    tTalaoGradeTalao: TIntegerField;
    tTalaoGradeCodGrade: TIntegerField;
    tTalaoGradePosicao: TIntegerField;
    tTalaoGradeQtdPar: TIntegerField;
    tTalaoGradelkTamanho: TStringField;
    tTalaolkNomeCor: TStringField;
    tTalaolkNomeCorForro: TStringField;
    tTalaolkNomeCorPalmilha: TStringField;
    tTalaolkNomeCorSolado: TStringField;
    tTalaolkNomeCabedal1: TStringField;
    tTalaolkNomeCabedal2: TStringField;
    tGradeItem: TTable;
    tGradeItemCodGrade: TIntegerField;
    tGradeItemPosicao: TIntegerField;
    tGradeItemTamanho: TStringField;
    tTalaoCodForro: TIntegerField;
    tTalaoCodEtiqueta: TIntegerField;
    tTalaolkNomeForro: TStringField;
    tTalaolkNomeEtiqueta: TStringField;
    tTalaoCodSolado: TIntegerField;
    tTalaoCodTaloneira: TIntegerField;
    tTalaoCodCorTaloneira: TIntegerField;
    tTalaolkNomeTaloneira: TStringField;
    tTalaolkCorTaloneira: TStringField;
    tTalaoItem: TIntegerField;
    tTalaoGradeItem: TIntegerField;
    tTalaolkReferencia: TStringField;
    tLote: TTable;
    dsLote: TDataSource;
    tLoteLote: TIntegerField;
    tLoteQtdTaloes: TIntegerField;
    tLoteQtdPares: TFloatField;
    tLoteObs: TMemoField;
    tLoteImpCalcMaterial: TBooleanField;
    Label3: TLabel;
    Edit2: TEdit;
    tLoteNroPedido: TIntegerField;
    RxDBFilter1: TRxDBFilter;
    tLotePedido: TTable;
    tLotePedidoLote: TIntegerField;
    tLotePedidoPedido: TIntegerField;
    tTalaoCodPalmilha: TIntegerField;
    tTalaolkNomePalmilha: TStringField;
    tLoteImpresso: TBooleanField;
    RxSpeedButton1: TRxSpeedButton;
    RxDBGrid1: TRxDBGrid;
    tLoteOCGerado: TBooleanField;
    tLoteItemPed: TIntegerField;
    StatusBar1: TStatusBar;
    tLoteSetor: TTable;
    RxDBFilter2: TRxDBFilter;
    tTalaolkDescMaterial: TStringField;
    tPedidoMaterial: TTable;
    tPedidoMaterialPedido: TIntegerField;
    tPedidoMaterialItemPed: TIntegerField;
    tPedidoMaterialOrdem: TIntegerField;
    tPedidoMaterialCodCor: TIntegerField;
    tPedidoMaterialCodMaterial: TIntegerField;
    tPedidoMaterialConsumoPr: TFloatField;
    tPedidoMaterialCodPosicao: TIntegerField;
    tPedidoMaterialImpTalao: TStringField;
    tPedidoMateriallkMaterial: TStringField;
    tPedidoMateriallkCor: TStringField;
    tPedidoMateriallkPosicao: TStringField;
    dsPedidoMaterial: TDataSource;
    RxDBFilter3: TRxDBFilter;
    tTalaoInvoice: TStringField;
    tTalaoCodForma: TIntegerField;
    tTalaolkNomeForma: TStringField;
    tGradeItemMarcarTam: TStringField;
    tGradeItemQtdPar: TIntegerField;
    tTalaoGradelkMarcarTam: TStringField;
    tLoteNumMapaCompras: TIntegerField;
    tLoteDtEmbarque: TDateField;
    tLoteTipoTalao: TStringField;
    Bevel2: TBevel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    BitBtn2: TBitBtn;
    RxSpeedButton2: TRxSpeedButton;
    RxSpeedButton3: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    Normal1: TMenuItem;
    ImpressoporTipo1: TMenuItem;
    ImpressoporRefere: TMenuItem;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    SMDBGrid1: TSMDBGrid;
    Label4: TLabel;
    GroupBox5: TGroupBox;
    DBGrid2: TDBGrid;
    Shape1: TShape;
    BitBtn1: TBitBtn;
    Label5: TLabel;
    Edit4: TEdit;
    tTalaoMov: TTable;
    tTalaoMovLote: TIntegerField;
    tTalaoMovTalao: TIntegerField;
    tTalaoMovSetor: TIntegerField;
    tTalaoMovDataEnt: TDateField;
    tTalaoMovHoraEnt: TTimeField;
    tTalaoMovDataSaida: TDateField;
    tTalaoMovHoraSaida: TTimeField;
    tTalaoMovCodAtelier: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxSpeedButton2Click(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure Normal1Click(Sender: TObject);
    procedure ImpressoporTipo1Click(Sender: TObject);
    procedure ImpressoporRefereClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsLoteExp: TfConsLoteExp;

implementation

uses UDM1, UConsLoteSetor, UQuant, UOpcaoTalao, URelTalao,
  URelTalaoExpSeq, URelContLoteExp, UAgendaTelef, URelTalao2,
  UTalaoAuxiliar, uIntegracao;

{$R *.DFM}

procedure TfConsLoteExp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM1.tPedido.IndexFieldNames := 'Pedido';
  if Screen.FormCount < 3 then
    begin
      Dm1.tCliente.Close;
      DM1.tPedidoMaterial.Open;
      Dm1.tPedidoItem.Close;
      Dm1.tPedido.Close;
      Dm1.tLotePedido.Close;
      Dm1.tLoteSetor.Close;
      Dm1.tLote.Close;
      Dm1.tTalaoGrade.Close;
      Dm1.tTalao.Close;
      DM1.tCor.Close;
      DM1.tMaterial.Close;
      DM1.tProduto.Close;
      DM1.tGradeItem.Close;
      DM1.tGrade.Close;
      DM1.tSetor.Close;
      DM1.tConstrucao.Close;
      DM1.tTalaoAuxiliarGrade.Close;
      DM1.tTalaoAuxiliar.Close;
    end;
  Action := Cafree;
end;

procedure TfConsLoteExp.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsLoteExp.BitBtn3Click(Sender: TObject);
var
 vAux : String;
 vLoteAux, vItemAux, vTalaoAux : Integer;
begin
  if MessageDlg('Deseja realmente excluir os lotes deste item do pedido?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
    begin
      DM1.tLote.IndexFieldNames := 'Lote';
      tLote.First;
      while not tLote.EOF do
        begin
          if DM1.tLote.FindKey([tLoteLote.AsInteger]) then
            begin
              DM1.tTalaoAuxiliar.First;
              while not DM1.tTalaoAuxiliar.Eof do
                begin
                  DM1.tTalaoAuxiliarGrade.First;
                  while not DM1.tTalaoAuxiliarGrade.Eof do
                    DM1.tTalaoAuxiliarGrade.Delete;
                  DM1.tTalaoAuxiliar.Delete;
                end;
            end;
          tLotePedido.First;
          while not tLotePedido.EOF do
            tLotePedido.Delete;
          tLoteSetor.First;
          while not tLoteSetor.EOF do
            tLoteSetor.Delete;
          tTalao.First;
          while not tTalao.EOF do
            begin
              tTalaoMov.First;
              while not tTalaoMov.Eof do
              begin
                if tTalaoLote.AsInteger = tLoteLote.AsInteger then
                begin
                  vLoteAux  := tTalaoMovLote.AsInteger;
                  vTalaoAux := tTalaoMovTalao.AsInteger;
                  vItemAux  := tTalaoMovSetor.AsInteger;
                  tTalaoMov.Delete;
                  Prc_Excluir_TalaoMov_FB(vLoteAux,vTalaoAux,vItemAux);
                end
                else
                  tTalaoMov.Next;
              end;
              
              tTalaoGrade.First;
              while not tTalaoGrade.EOF do
              begin
                vLoteAux  := tTalaoGradeLote.AsInteger;
                vItemAux  := tTalaoGradeItem.AsInteger;
                vTalaoAux := tTalaoGradeTalao.AsInteger;
                tTalaoGrade.Delete;
                Prc_Excluir_TalaoGrade_FB(vLoteAux,vItemAux,vTalaoAux);
              end;
              vLoteAux := tTalaoLote.AsInteger;
              vItemAux := tTalaoItem.AsInteger;
              tTalao.Delete;
              Prc_Excluir_Talao_FB(vLoteAux,vItemAux);
            end;
          vLoteAux := tLoteLote.AsInteger;
          tLote.Delete;
          Prc_Excluir_Lote_FB(vLoteAux);
        end;
      DM1.tPedidoItem.Edit;
      DM1.tPedidoItemLoteGer.AsBoolean := False;
      DM1.tPedidoItem.Post;
      DM1.tPedido.Edit;
      DM1.tPedidoNumLote.Clear;
      DM1.tPedidoGerarLote.AsInteger := 2;
      vAux := 'N';
      DM1.tPedidoItem.Refresh;
      DM1.tPedidoItem.First;
      while not DM1.tPedidoItem.Eof do
        begin
          if DM1.tPedidoItemLoteGer.AsBoolean = True then
            vAux := 'S';
          DM1.tPedidoItem.Next;
        end;
      if vAux = 'S' then
        DM1.tPedidoLoteExp.AsBoolean := True
      else
        DM1.tPedidoLoteExp.AsBoolean := False;
      DM1.tPedido.Post;
    end;
  tLote.Refresh;
  tLotePedido.Refresh;
  tLoteSetor.Refresh;
  tTalao.Refresh;
  tTalaoGrade.Refresh;
end;

procedure TfConsLoteExp.FormShow(Sender: TObject);
begin
  Dm1.tCliente.Open;
  Dm1.tPedido.Open;
  Dm1.tPedidoItem.Open;
  DM1.tPedidoMaterial.Open;
  Dm1.tLote.Open;
  Dm1.tLotePedido.Open;
  Dm1.tLoteSetor.Open;
  Dm1.tTalao.Open;
  Dm1.tTalaoGrade.Open;
  DM1.tCor.Open;
  DM1.tMaterial.Open;
  DM1.tProduto.Open;
  DM1.tGrade.Open;
  DM1.tGradeItem.Open;
  DM1.tGradeItemlk.Open;
  DM1.tSetor.Open;
  DM1.tConstrucao.Open;
  DM1.tTalaoAuxiliar.Open;
  DM1.tTalaoAuxiliarGrade.Open;
  
  tLote.Refresh;
  tLotePedido.Refresh;
  tLoteSetor.Refresh;
  tTalao.Refresh;
  tTalaoGrade.Refresh;
  DM1.tPedido.IndexFieldNames := 'PedidoCliente';
end;

procedure TfConsLoteExp.Edit2Change(Sender: TObject);
begin
  try
    DM1.tPedido.IndexFieldNames := 'PedidoCliente';
    DM1.tPedido.FindNearest([Edit2.Text]);
  except
    ShowMessage('Digite apenas números aqui!');
  end;
end;

procedure TfConsLoteExp.RxSpeedButton1Click(Sender: TObject);
var
  vNovo : Boolean;
begin
  vNovo := False;
  if MessageDlg('Imprimir no novo layout ?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
    vNovo := True;

      DM1.tLote.IndexFieldNames := 'Lote';
      vTalaoInicial  := 0;
      vTalaoFinal    := 0;
      //if MessageDlg('Imprimir o Lote '+tLoteLote.AsString+' ?', mtConfirmation,[mbOk,mbNo],0)=mrNo then
      if MessageDlg('Confirma Impressão ?', mtConfirmation,[mbOk,mbNo],0)=mrNo then
        exit;

      fOpcaoTalao := TfOpcaoTalao.Create(Self);
      fOpcaoTalao.ShowModal;

      DM1.tLote.Filtered := False;
      if (Edit1.Text <> '') and (Edit3.Text <> '') then
        DM1.tLote.Filter := 'Lote >= '''+Edit1.Text+''' and Lote <= '''+Edit3.Text+''''
      else
        DM1.tLote.Filter := 'Lote = '''+tLoteLote.AsString+'''';
      DM1.tLote.Filtered := True;
      if DM1.tLote.IsEmpty then
        begin
          DM1.tLote.Filtered := False;
          exit;
        end;
        
      DM1.tLote.First;
      while not DM1.tLote.Eof do
        begin
          if not DM1.tLoteImpresso.AsBoolean then
            begin
              DM1.tLote.Edit;
              DM1.tLoteImpresso.AsBoolean := True;
              DM1.tLote.Post;
              Prc_Gravar_Lote_FB(DM1.tLoteLote.AsInteger);
            end;
          DM1.tLote.Next;
        end;
      DM1.tLotePedido.First;
      DM1.tTalaoGrade.Filtered := False;
      DM1.tTalaoGrade.Filter   := 'Talao >= '''+IntToStr(vTalaoInicial)+''' and Talao <= '''+IntToStr(vTalaoFinal)+'''';
      DM1.tTalaoGrade.Filtered := True;
      if DM1.tTalaoGrade.RecordCount > 0 then
        begin
          if vNovo then
            begin
              fRelTalao2 := TfRelTalao2.Create(Self);
              fRelTalao2.QuickRep1.Preview;
              fRelTalao2.QuickRep1.Free;
            end
          else
            begin
              fRelTalao := TfRelTalao.Create(Self);
              fRelTalao.QuickRep1.Preview;
              fRelTalao.QuickRep1.Free;
            end;
        end
      else
        ShowMessage('Talão inicial e final não existem na tabela');
      DM1.tTalao.Filtered      := False;
      DM1.tTalaoGrade.Filtered := False;
      DM1.tLote.Filtered       := False;
      DM1.tLote.Refresh;
      tLote.Refresh;
      Edit1.Clear;
      Edit3.Clear;
    //end;
end;

procedure TfConsLoteExp.BitBtn2Click(Sender: TObject);
begin
  if (Edit1.Text <> '') and (Edit3.Text <> '') then
    begin
      DM1.tLote.IndexFieldNames := 'Lote';
      DM1.tLote.Filtered        := False;
      DM1.tLote.Filter          := 'Lote >= '''+Edit1.Text+''' and Lote <= '''+Edit3.Text+'''';
      DM1.tLote.Filtered        := True;
      DM1.tLote.First;
      fRelContLoteExp           := TfRelContLoteExp.Create(Self);
      fRelContLoteExp.QuickRep1.Preview;
      fRelContLoteExp.QuickRep1.Free;
      DM1.tLote.Filtered        := False;
    end
  else
    ShowMessage('Não foi informado o lote inicial e final!');
end;

procedure TfConsLoteExp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

procedure TfConsLoteExp.RxSpeedButton2Click(Sender: TObject);
begin
  if (Edit1.Text <> '') and (Edit3.Text <> '') then
    begin
      DM1.tLote.IndexFieldNames := 'Lote';
      DM1.tLote.Filtered        := False;
      DM1.tLote.Filter          := 'Lote >= '''+Edit1.Text+''' and Lote <= '''+Edit3.Text+'''';
      DM1.tLote.Filtered        := True;
      DM1.tLote.First;
      fRelTalaoExpSeq           := TfRelTalaoExpSeq.Create(Self);
      fRelTalaoExpSeq.QuickRep3.Preview;
      fRelTalaoExpSeq.QuickRep3.Free;
      DM1.tLote.First;
      while not DM1.tLote.Eof do
        begin
          DM1.tLote.Edit;
          DM1.tLoteImpresso.AsBoolean := True;
          DM1.tLote.Post;
          Prc_Gravar_Lote_FB(DM1.tLoteLote.AsInteger);

          DM1.tLote.Next;
        end;
      DM1.tLote.Filtered        := False;
      Edit1.Clear;
      Edit3.Clear;
      Edit1.SetFocus;
    end
  else
    begin
      vTalaoInicial  := 0;
      vTalaoFinal    := 0;
      if MessageDlg('Imprimir o Lote '+tLoteLote.AsString+' ?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        begin
          fOpcaoTalao := TfOpcaoTalao.Create(Self);
          fOpcaoTalao.ShowModal;
          DM1.tLote.IndexFieldNames := 'Lote';
          DM1.tLote.FindKey([tLoteLote.AsInteger]);
          if tLoteImpresso.AsBoolean = True then
            begin
              if MessageDlg('Lote '+tLoteLote.AsString+' já impresso, deseja imprimí-lo novamente?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
                begin
                  DM1.tLote.Edit;
                  DM1.tLoteImpresso.AsBoolean := True;
                  DM1.tLote.Post;
                  Prc_Gravar_Lote_FB(DM1.tLoteLote.AsInteger);

                  DM1.tLotePedido.First;
                  DM1.tTalao.Filtered := False;
                  DM1.tTalao.Filter   := 'Lote = ' + tLoteLote.AsString;
                  DM1.tTalao.Filtered := True;
                  DM1.tTalaoGrade.Filtered := False;
                  DM1.tTalaoGrade.Filter   := 'Talao >= '''+IntToStr(vTalaoInicial)+''' and Talao <= '''+IntToStr(vTalaoFinal)+'''';
                  DM1.tTalaoGrade.Filtered := True;
                  if DM1.tTalaoGrade.RecordCount > 0 then
                    begin
                      fRelTalao := TfRelTalao.Create(Self);
                      fRelTalao.QuickRep3.Preview;
                      fRelTalao.QuickRep3.Free;
                    end
                  else
                    ShowMessage('Talão inicial e final não existem na tabela');
                  DM1.tTalao.Filtered      := False;
                  DM1.tTalaoGrade.Filtered := False;
                  DM1.tLote.Refresh;
                  tLote.Refresh;
                end;
            end
          else
            begin
              DM1.tLote.Edit;
              DM1.tLoteImpresso.AsBoolean := True;
              DM1.tLote.Post;
              Prc_Gravar_Lote_FB(DM1.tLoteLote.AsInteger);

              DM1.tLotePedido.First;
              DM1.tTalao.Filtered := False;
              DM1.tTalao.Filter   := 'Lote = ' + tLoteLote.AsString;
              DM1.tTalao.Filtered := True;
              DM1.tTalaoGrade.Filtered := False;
              DM1.tTalaoGrade.Filter   := 'Talao >= '''+IntToStr(vTalaoInicial)+''' and Talao <= '''+IntToStr(vTalaoFinal)+'''';
              DM1.tTalaoGrade.Filtered := True;
              if DM1.tTalaoGrade.RecordCount > 0 then
                begin
                  fRelTalao := TfRelTalao.Create(Self);
                  fRelTalao.QuickRep3.Preview;
                  fRelTalao.QuickRep3.Free;
                end
              else
                ShowMessage('Talão inicial e final não existem na tabela');
              DM1.tTalao.Filtered      := False;
              DM1.tTalaoGrade.Filtered := False;
              DM1.tLote.Refresh;
              tLote.Refresh;
            end;
        end;
    end;
end;

procedure TfConsLoteExp.SMDBGrid1DblClick(Sender: TObject);
begin
  DM1.tLote.IndexFieldNames := 'Lote';
  DM1.tLote.FindKey([tLoteLote.AsInteger]);
  fConsLoteSetor := TfConsLoteSetor.Create(Self);
  fConsLoteSetor.ShowModal;
end;

procedure TfConsLoteExp.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if tLoteImpresso.AsBoolean then
    begin
      Background  := clTeal;
      AFont.Color := clWhite;
    end;
end;

procedure TfConsLoteExp.Normal1Click(Sender: TObject);
begin
  if (Edit1.Text <> '') and (Edit3.Text <> '') then
    begin
      DM1.tLote.IndexFieldNames := 'Lote';
      DM1.tLote.Filtered        := False;
      DM1.tLote.Filter          := 'Lote >= '''+Edit1.Text+''' and Lote <= '''+Edit3.Text+'''';
      DM1.tLote.Filtered        := True;
      DM1.tLote.First;
      fRelTalaoExpSeq           := TfRelTalaoExpSeq.Create(Self);
      fRelTalaoExpSeq.QuickRep2.Preview;
      fRelTalaoExpSeq.QuickRep2.Free;
      DM1.tLote.First;
      while not DM1.tLote.Eof do
        begin
          DM1.tLote.Edit;
          DM1.tLoteImpresso.AsBoolean := True;
          DM1.tLote.Post;
          Prc_Gravar_Lote_FB(DM1.tLoteLote.AsInteger);

          DM1.tLote.Next;
        end;
      DM1.tLote.Filtered        := False;
      Edit1.Clear;
      Edit3.Clear;
      Edit1.SetFocus;
    end
  else
    begin
      vTalaoInicial  := 0;
      vTalaoFinal    := 0;
      if MessageDlg('Imprimir o Lote '+tLoteLote.AsString+' ?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        begin
          fOpcaoTalao := TfOpcaoTalao.Create(Self);
          fOpcaoTalao.ShowModal;
          DM1.tLote.IndexFieldNames := 'Lote';
          DM1.tLote.FindKey([tLoteLote.AsInteger]);
          if tLoteImpresso.AsBoolean = True then
            begin
              if MessageDlg('Lote '+tLoteLote.AsString+' já impresso, deseja imprimí-lo novamente?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
                begin
                  DM1.tLote.Edit;
                  DM1.tLoteImpresso.AsBoolean := True;
                  DM1.tLote.Post;
                  Prc_Gravar_Lote_FB(DM1.tLoteLote.AsInteger);

                  DM1.tLotePedido.First;
                  DM1.tTalao.Filtered := False;
                  DM1.tTalao.Filter   := 'Lote = ' + tLoteLote.AsString;
                  DM1.tTalao.Filtered := True;
                  DM1.tTalaoGrade.Filtered := False;
                  DM1.tTalaoGrade.Filter   := 'Talao >= '''+IntToStr(vTalaoInicial)+''' and Talao <= '''+IntToStr(vTalaoFinal)+'''';
                  DM1.tTalaoGrade.Filtered := True;
                  if DM1.tTalaoGrade.RecordCount > 0 then
                    begin
                      fRelTalao := TfRelTalao.Create(Self);
                      fRelTalao.QuickRep2.Preview;
                      fRelTalao.QuickRep2.Free;
                    end
                  else
                    ShowMessage('Talão inicial e final não existem na tabela');
                  DM1.tTalao.Filtered      := False;
                  DM1.tTalaoGrade.Filtered := False;
                  DM1.tLote.Refresh;
                  tLote.Refresh;
                end;
            end
          else
            begin
              DM1.tLote.Edit;
              DM1.tLoteImpresso.AsBoolean := True;
              DM1.tLote.Post;
              Prc_Gravar_Lote_FB(DM1.tLoteLote.AsInteger);

              DM1.tLotePedido.First;
              DM1.tTalao.Filtered := False;
              DM1.tTalao.Filter   := 'Lote = ' + tLoteLote.AsString;
              DM1.tTalao.Filtered := True;
              DM1.tTalaoGrade.Filtered := False;
              DM1.tTalaoGrade.Filter   := 'Talao >= '''+IntToStr(vTalaoInicial)+''' and Talao <= '''+IntToStr(vTalaoFinal)+'''';
              DM1.tTalaoGrade.Filtered := True;
              if DM1.tTalaoGrade.RecordCount > 0 then
                begin
                  fRelTalao := TfRelTalao.Create(Self);
                  fRelTalao.QuickRep2.Preview;
                  fRelTalao.QuickRep2.Free;
                end
              else
                ShowMessage('Talão inicial e final não existem na tabela');
              DM1.tTalao.Filtered      := False;
              DM1.tTalaoGrade.Filtered := False;
              DM1.tLote.Refresh;
              tLote.Refresh;
            end;
        end;
    end;
end;

procedure TfConsLoteExp.ImpressoporTipo1Click(Sender: TObject);
begin
vTalaoInicial  := 0;
vTalaoFinal    := 0;
if MessageDlg('Imprimir o Lote '+tLoteLote.AsString+' ?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
  begin
    fOpcaoTalao := TfOpcaoTalao.Create(Self);
    fOpcaoTalao.ShowModal;
    DM1.tLote.IndexFieldNames := 'Lote';
    DM1.tLote.FindKey([tLoteLote.AsInteger]);
    if tLoteImpresso.AsBoolean = True then
      begin
        if MessageDlg('Lote '+tLoteLote.AsString+' já impresso, deseja imprimí-lo novamente?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
          begin
            DM1.tLote.Edit;
            DM1.tLoteImpresso.AsBoolean := True;
            DM1.tLote.Post;
            Prc_Gravar_Lote_FB(DM1.tLoteLote.AsInteger);

            DM1.tLotePedido.First;
            DM1.tTalao.Filtered := False;
            DM1.tTalao.Filter   := 'Lote = ' + tLoteLote.AsString;
            DM1.tTalao.Filtered := True;
            DM1.tTalaoGrade.Filtered := False;
            DM1.tTalaoGrade.Filter   := 'Talao >= '''+IntToStr(vTalaoInicial)+''' and Talao <= '''+IntToStr(vTalaoFinal)+'''';
            DM1.tTalaoGrade.Filtered := True;
            if DM1.tTalaoGrade.RecordCount > 0 then
              begin
                fRelTalao := TfRelTalao.Create(Self);
                DM1.tTalao.First;
                while not(DM1.tTalao.EOF) do
                begin
                  DM1.tProduto.Filtered := False;
                  DM1.tProduto.Filter   := 'Codigo = ' + DM1.tTalaoCodProduto.AsString;
                  DM1.tProduto.Filtered := True;
                  fRelTalao.cdsMemoTalao.EmptyDataSet;
                  if DM1.tProdutoTipoMat.Active = False then
                    DM1.tProdutoTipoMat.Open;
                  DM1.tProdutoTipoMat.First;
                  while not(DM1.tProdutoTipoMat.Eof) do
                  begin
                    fRelTalao.cdsMemoTalao.Append;
                    fRelTalao.cdsMemoTalaoLote.AsString := DM1.tTalaoLote.AsString;
                    fRelTalao.cdsMemoTalaoReferencia.AsString := DM1.tTalaolkReferencia.AsString;
                    fRelTalao.cdsMemoTalaoQtdPar.AsString := DM1.tTalaoQtdPar.AsString;
                    fRelTalao.cdsMemoTalaoNomeCor.AsString := DM1.tTalaolkNomeCor.AsString;
                    fRelTalao.cdsMemoTalaoNomeSolado.AsString := DM1.tTalaolkNomeSolado.AsString;
                    fRelTalao.cdsMemoTalaoNomeCorSolado.AsString := DM1.tTalaolkNomeCorSolado.AsString;
                    fRelTalao.cdsMemoTalaoNomePalmilha.AsString := DM1.tTalaolkNomePalmilha.AsString;
                    fRelTalao.cdsMemoTalaoNomeCorPalmilha.AsString := DM1.tTalaolkNomeCorPalmilha.AsString;
                    fRelTalao.cdsMemoTalaoEmbarqueIni.AsString := DM1.tLotePedidolkEmbarque.AsString;
                    fRelTalao.cdsMemoTalaoEmbarqueFim.AsString := DM1.tLotePedidolkEmbFinal.AsString;
                    fRelTalao.cdsMemoTalaoNomeCliente.AsString := DM1.tLotePedidolkNomeCliente.AsString;
                    fRelTalao.cdsMemoTalaoObsLote.AsString := DM1.tLotelkObsLote.AsString;
                    fRelTalao.cdsMemoTalaoPedidoCliente.AsString := DM1.tLotePedidolkPedidoCliente.AsString;
                    fRelTalao.cdsMemoTalaoDescMaterial.AsString := DM1.tTalaolkDescMaterial.AsString;
                    fRelTalao.cdsMemoTalaoPOCliente.AsString := DM1.tLotePedidolkPOCliente.AsString;
                    fRelTalao.cdsMemoTalaoInvoice.AsString := DM1.tTalaoInvoice.AsString;
                    fRelTalao.cdsMemoTalaoStock.AsString := DM1.tLotePedidolkStock.AsString;
                    fRelTalao.cdsMemoTalaoCarimbo.AsString := DM1.tLotePedidolkCarimbo.AsString;
                    fRelTalao.cdsMemoTalaoTipoMaterial.AsString := DM1.tProdutoTipoMatlkNomeTipoMaterial.AsString;
                    fRelTalao.cdsMemoTalao.Post;
                    DM1.tProdutoTipoMat.Next;
                  end;
                  DM1.tTalao.Next;
                end;
                fRelTalao.QuickRep4.Preview;
                fRelTalao.QuickRep4.Free;
              end
            else
              ShowMessage('Talão inicial e final não existem na tabela');
            DM1.tTalao.Filtered      := False;
            DM1.tTalaoGrade.Filtered := False;
            DM1.tLote.Refresh;
            tLote.Refresh;
          end;
      end
    else
      begin
        DM1.tLote.Edit;
        DM1.tLoteImpresso.AsBoolean := True;
        DM1.tLote.Post;
        Prc_Gravar_Lote_FB(DM1.tLoteLote.AsInteger);

        DM1.tLotePedido.First;
        DM1.tTalao.Filtered := False;
        DM1.tTalao.Filter   := 'Lote = ' + tLoteLote.AsString;
        DM1.tTalao.Filtered := True;
        DM1.tTalaoGrade.Filtered := False;
        DM1.tTalaoGrade.Filter   := 'Talao >= '''+IntToStr(vTalaoInicial)+''' and Talao <= '''+IntToStr(vTalaoFinal)+'''';
        DM1.tTalaoGrade.Filtered := True;
        if DM1.tTalaoGrade.RecordCount > 0 then
          begin
            fRelTalao := TfRelTalao.Create(Self);
            fRelTalao.QuickRep2.Preview;
            fRelTalao.QuickRep2.Free;
          end
        else
          ShowMessage('Talão inicial e final não existem na tabela');
        DM1.tTalao.Filtered      := False;
        DM1.tTalaoGrade.Filtered := False;
        DM1.tLote.Refresh;
        tLote.Refresh;
      end;
  end;
end;

procedure TfConsLoteExp.ImpressoporRefereClick(Sender: TObject);
begin
  fRelTalao := TfRelTalao.Create(Self);
  DM1.tPedidoItem.First;
  while not(DM1.tPedidoItem.EOF) do
  begin
    tLote.First;
    while not(tLote.Eof) do
    begin
      tTalao.First;
      while not(tTalao.Eof) do
      begin
        tTalaoGrade.First;
        while not(tTalaoGrade.Eof) do
        begin
          fRelTalao.cdsReferencia.Append;
          {fRelTalao.cdsReferenciaReferencia.AsString := tTalaolkReferencia.AsString;
          fRelTalao.cdsReferenciaQtdPar.AsString := tTalaoQtdPar.AsString;
          fRelTalao.cdsReferenciaCodGrade.AsString := tTalaoGradeCodGrade.AsString;
          fRelTalao.cdsReferenciaDescMaterial.AsString := tTalaolkDescMaterial.AsString;
          fRelTalao.cdsReferenciaNomeCor.AsString := tTalaolkNomeCor.AsString;
          fRelTalao.cdsReferenciaNomeSolado.AsString := tTalaolkNomeSolado.AsString;
          fRelTalao.cdsReferenciaNomeCorSolado.AsString := tTalaolkNomeCorSolado.AsString;
          fRelTalao.cdsReferenciaNomePalmilha.AsString := tTalaolkNomePalmilha.AsString;
          fRelTalao.cdsReferenciaNomeCorPalmilha.AsString := tTalaolkNomeCorPalmilha.AsString;
          fRelTalao.cdsReferenciaEmbarqueIni.AsString := DM1.tLotePedidolkEmbarque.AsString;
          fRelTalao.cdsReferenciaEmbarqueFim.AsString := DM1.tLotePedidolkEmbFinal.AsString;
          fRelTalao.cdsReferenciaNomeCliente.AsString := DM1.tLotePedidolkNomeCliente.AsString;
          fRelTalao.cdsReferenciaObsLote.AsString := tLotelkObsLote.AsString;
          fRelTalao.cdsReferenciaPedidoCliente.AsString := DM1.tLotePedidolkPedidoCliente.AsString;
          fRelTalao.cdsReferenciaPOCliente.AsString := DM1.tLotePedidolkPOCliente.AsString;
          fRelTalao.cdsReferenciaInvoice.AsString := tTalaoInvoice.AsString;
          fRelTalao.cdsReferenciaStock.AsString := DM1.tLotePedidolkStock.AsString;
          fRelTalao.cdsReferenciaCarimbo.AsString := DM1.tLotePedidolkCarimbo.AsString;
          fRelTalao.cdsReferencia.Post;}
          tTalaoGrade.Next
        end;
        tTalao.Next;
      end;
      tLote.Next;
    end;
    DM1.tPedidoItem.Next;
  end;
  fRelTalao.QuickRep5.Preview;
  fRelTalao.QuickRep5.Free;
  DM1.tTalao.Filtered      := False;
  DM1.tTalaoGrade.Filtered := False;
end;


procedure TfConsLoteExp.BitBtn1Click(Sender: TObject);
begin
  fTalaoAuxiliar := TfTalaoAuxiliar.Create(Self);
  fTalaoAuxiliar.ShowModal;
end;

end.

unit UPrevPlanejProg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons, Db, DBTables, MemTable,
  RxLookup, Variants, ShellApi;

type
  TfPrevPlanejProg = class(TForm)
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Panel4: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Panel5: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    mProgramacao: TMemoryTable;
    mProgramacaoCodCli: TIntegerField;
    mProgramacaoPedido: TIntegerField;
    mProgramacaoCodProduto: TIntegerField;
    mProgramacaoMaterialCor: TStringField;
    mProgramacaoQtdPrs: TIntegerField;
    mProgramacaoDtEmbFinal: TDateTimeField;
    mProgramacaolkNomeCli: TStringField;
    mProgramacaolkRef: TStringField;
    mProgramacaoTalao: TIntegerField;
    mProgramacaoConstrucao: TStringField;
    Panel6: TPanel;
    CheckBox1: TCheckBox;
    mProgramacaoLote: TIntegerField;
    mProgramacaoPosicao: TIntegerField;
    mProgramacaoCodGrade: TIntegerField;
    mProgramacaolkTamanho: TStringField;
    mProgramacaolkLargura: TStringField;
    Panel7: TPanel;
    Label7: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label8: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label9: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label10: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    mProgramacaoDtSetor2: TStringField;
    mProgramacaoDtSetor1: TStringField;
    mProgramacaoDtSetor3: TStringField;
    mProgramacaoDtSetor4: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RadioGroup2Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Limpa_Edit;
    procedure Gera_Dados;
    procedure Imprime_Programacao;
    procedure Imprime_Cab_Prog;
    procedure Imprime_Det_Prog;
    procedure Imprime_Rod_Prog;
    procedure Imprime_Planejamento;
    procedure Imprime_Cab_Plan;
    procedure Imprime_Det_Plan;
    procedure Imprime_Rod_Plan;
    procedure Posiciona_Setores;
  public
    { Public declarations }
  end;

var
  fPrevPlanejProg: TfPrevPlanejProg;
  vLinha, vPagina, vTotal, vTotal2 : Integer;
  F: TextFile;
  Texto : String;

implementation

uses UDM1, UEscImpressora, UDM2;

{$R *.DFM}

procedure TfPrevPlanejProg.Posiciona_Setores;
begin
  if DM1.tSetor.Locate('Nome','CORTE',[loCaseInsensitive]) then
    RxDBLookupCombo1.KeyValue := DM1.tSetorCodigo.AsInteger
  else
    RxDBLookupCombo1.ClearValue;
  if DM1.tSetor.Locate('Nome','COSTURA',[loCaseInsensitive]) then
    RxDBLookupCombo2.KeyValue := DM1.tSetorCodigo.AsInteger
  else
    RxDBLookupCombo2.ClearValue;
  if DM1.tSetor.Locate('Nome','DISTRIBUICAO',[loCaseInsensitive]) then
    RxDBLookupCombo3.KeyValue := DM1.tSetorCodigo.AsInteger
  else
    RxDBLookupCombo3.ClearValue;
  if DM1.tSetor.Locate('Nome','MONTAGEM',[loCaseInsensitive]) then
    RxDBLookupCombo4.KeyValue := DM1.tSetorCodigo.AsInteger
  else
    RxDBLookupCombo4.ClearValue;
end;

procedure TfPrevPlanejProg.Limpa_Edit;
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  DateEdit1.Clear;
  DateEdit2.Clear;
end;

procedure TfPrevPLanejProg.Gera_Dados;
begin
  Screen.Cursor := crHourGlass;
  mProgramacao.EmptyTable;
  DM1.tPedido.IndexFieldNames := 'Pedido';
  Case RadioGroup2.ItemIndex of
    0 : begin
          DM1.tPedido.Filtered     := False;
          DM1.tPedido.Filter       := 'Pedido >= '''+Edit1.Text+''' and Pedido <= '''+Edit2.Text+''' and Cancelado <> True and Suspenso <> True';
          DM1.tPedido.Filtered     := True;
          DM1.tPedido.First;
          while not DM1.tPedido.Eof do
            begin
              DM1.tPedidoItem.Filtered := False;
              DM1.tPedidoItem.Filter   := 'Cancelado <> True';
              DM1.tPedidoItem.Filtered := True;
              DM1.tPedidoItem.First;
              while not DM1.tPedidoItem.Eof do
                begin
                  if (checkBox1.checked = True) // Pega todos os itens
                     OR
                     ((checkBox1.checked = False) and // Nao faturados = QtdParesRes > 0
                     (DM1.tPedidoItemQtdParesRest.asinteger > 0)) then
                    begin
                      mProgramacao.Insert;
                      mProgramacaoCodCli.AsInteger      := DM1.tPedidoCodCliente.AsInteger;
                      mProgramacaoCodProduto.AsInteger  := DM1.tPedidoItemCodProduto.AsInteger;
                      mProgramacaoDtEmbFinal.AsDateTime := DM1.tPedidoDtFinEmbarque.AsDateTime;
                      mProgramacaoMaterialCor.AsString  := DM1.tPedidoItemlkDescMaterial.AsString + ' ' + DM1.tPedidoItemlkCor.AsString;
                      mProgramacaoConstrucao.AsString   := DM1.tPedidoItemlkConstrucao.AsString;
                      mProgramacaoPedido.AsInteger      := DM1.tPedidoPedido.AsInteger;
                      mProgramacaoQtdPrs.AsInteger      := DM1.tPedidoItemQtdPares.AsInteger;
                      if DM2.tTalaoMIIns.Locate('NumPedido;ItemPedido',VarArrayOf([DM1.tPedidoPedido.AsInteger,DM1.tPedidoItemItem.AsInteger]),[locaseinsensitive]) then
                        begin
                          mProgramacaoTalao.AsInteger := DM2.tTalaoMIInsItem.AsInteger;
                          mProgramacaoLote.AsInteger  := DM2.tTalaoMIInsLote.AsInteger;
                          DM2.tTalaoMovMiIns.First;
                          while not DM2.tTalaoMovMiIns.Eof do
                            begin
                              if DM2.tTalaoMovMiInsDataSaida.AsDateTime > 1 then
                                begin
                                  if DM2.tTalaoMovMiInsSetor.AsInteger = RxDBLookupCombo1.KeyValue then
                                    mProgramacaoDtSetor1.AsString := Copy(DM2.tTalaoMovMiInsDataSaida.AsString,1,2) + '/' + Copy(DM2.tTalaoMovMiInsDataSaida.AsString,4,2) + '/' + Copy(DM2.tTalaoMovMiInsDataSaida.AsString,9,2);
                                  if DM2.tTalaoMovMiInsSetor.AsInteger = RxDBLookupCombo2.KeyValue then
                                    mProgramacaoDtSetor2.AsString := Copy(DM2.tTalaoMovMiInsDataSaida.AsString,1,2) + '/' + Copy(DM2.tTalaoMovMiInsDataSaida.AsString,4,2) + '/' + Copy(DM2.tTalaoMovMiInsDataSaida.AsString,9,2);
                                  if DM2.tTalaoMovMiInsSetor.AsInteger = RxDBLookupCombo3.KeyValue then
                                    mProgramacaoDtSetor3.AsString := Copy(DM2.tTalaoMovMiInsDataSaida.AsString,1,2) + '/' + Copy(DM2.tTalaoMovMiInsDataSaida.AsString,4,2) + '/' + Copy(DM2.tTalaoMovMiInsDataSaida.AsString,9,2);
                                  if DM2.tTalaoMovMiInsSetor.AsInteger = RxDBLookupCombo4.KeyValue then
                                    mProgramacaoDtSetor4.AsString := Copy(DM2.tTalaoMovMiInsDataSaida.AsString,1,2) + '/' + Copy(DM2.tTalaoMovMiInsDataSaida.AsString,4,2) + '/' + Copy(DM2.tTalaoMovMiInsDataSaida.AsString,9,2);
                                end;
                              DM2.tTalaoMovMiIns.Next;
                            end;
                        end;
                      mProgramacao.Post;
                    End;
                  DM1.tPedidoItem.Next;
                end;
              DM1.tPedido.Next;
            end;
        end;
    1 : begin
          DM1.tLoteMI.Filtered := False;
          DM1.tLoteMI.Filter   := 'Lote >= '''+Edit3.Text+''' and Lote <= '''+Edit4.text+'''';
          DM1.tLoteMI.Filtered := True;
          DM1.tLoteMI.First;
          while not DM1.tLoteMI.Eof do
            begin
              DM1.tLotePedidoMI.First;
              while not DM1.tLotePedidoMI.Eof do
                begin
                  DM1.tPedido.SetKey;
                  DM1.tPedidoPedido.AsInteger := DM1.tLotePedidoMIPedido.AsInteger;
                  if (DM1.tPedido.GotoKey) and (DM1.tPedidoCancelado.AsBoolean <> True) and (DM1.tPedidoSuspenso.AsBoolean <> True) then
                    begin
                      DM1.tPedidoItem.Filtered := False;
                      DM1.tPedidoItem.Filter   := 'Cancelado <> True';
                      DM1.tPedidoItem.Filtered := True;
                      DM1.tPedidoItem.First;
                      while not DM1.tPedidoItem.Eof do
                        begin
                          if (checkBox1.checked = True) // Pega todos os itens
                             OR
                             ((checkBox1.checked = False) and // Nao faturados = QtdParesRes > 0
                             (DM1.tPedidoItemQtdParesRest.asinteger > 0)) then
                            begin
                              mProgramacao.Insert;
                              mProgramacaoCodCli.AsInteger      := DM1.tPedidoCodCliente.AsInteger;
                              mProgramacaoCodProduto.AsInteger  := DM1.tPedidoItemCodProduto.AsInteger;
                              mProgramacaoDtEmbFinal.AsDateTime := DM1.tPedidoDtFinEmbarque.AsDateTime;
                              mProgramacaoMaterialCor.AsString  := DM1.tPedidoItemlkDescMaterial.AsString + ' ' + DM1.tPedidoItemlkCor.AsString;
                              mProgramacaoConstrucao.AsString   := DM1.tPedidoItemlkConstrucao.AsString;
                              mProgramacaoPedido.AsInteger      := DM1.tPedidoPedido.AsInteger;
                              mProgramacaoQtdPrs.AsInteger      := DM1.tPedidoItemQtdPares.AsInteger;
                              if DM2.tTalaoMIIns.Locate('NumPedido;ItemPedido',VarArrayOf([DM1.tPedidoPedido.AsInteger,DM1.tPedidoItemItem.AsInteger]),[locaseinsensitive]) then
                                begin
                                  mProgramacaoTalao.AsInteger := DM2.tTalaoMIInsItem.AsInteger;
                                  mProgramacaoLote.AsInteger  := DM2.tTalaoMIInsLote.AsInteger;
                                  DM2.tTalaoMovMiIns.First;
                                  while not DM2.tTalaoMovMiIns.Eof do
                                    begin
                                      if DM2.tTalaoMovMiInsDataSaida.AsDateTime > 1 then
                                        begin
                                          if DM2.tTalaoMovMiInsSetor.AsInteger = RxDBLookupCombo1.KeyValue then
                                            mProgramacaoDtSetor1.AsString := Copy(DM2.tTalaoMovMiInsDataSaida.AsString,1,2) + '/' + Copy(DM2.tTalaoMovMiInsDataSaida.AsString,4,2) + '/' + Copy(DM2.tTalaoMovMiInsDataSaida.AsString,9,2);
                                          if DM2.tTalaoMovMiInsSetor.AsInteger = RxDBLookupCombo2.KeyValue then
                                            mProgramacaoDtSetor2.AsString := Copy(DM2.tTalaoMovMiInsDataSaida.AsString,1,2) + '/' + Copy(DM2.tTalaoMovMiInsDataSaida.AsString,4,2) + '/' + Copy(DM2.tTalaoMovMiInsDataSaida.AsString,9,2);
                                          if DM2.tTalaoMovMiInsSetor.AsInteger = RxDBLookupCombo3.KeyValue then
                                            mProgramacaoDtSetor3.AsString := Copy(DM2.tTalaoMovMiInsDataSaida.AsString,1,2) + '/' + Copy(DM2.tTalaoMovMiInsDataSaida.AsString,4,2) + '/' + Copy(DM2.tTalaoMovMiInsDataSaida.AsString,9,2);
                                          if DM2.tTalaoMovMiInsSetor.AsInteger = RxDBLookupCombo4.KeyValue then
                                            mProgramacaoDtSetor4.AsString := Copy(DM2.tTalaoMovMiInsDataSaida.AsString,1,2) + '/' + Copy(DM2.tTalaoMovMiInsDataSaida.AsString,4,2) + '/' + Copy(DM2.tTalaoMovMiInsDataSaida.AsString,9,2);
                                        end;
                                      DM2.tTalaoMovMiIns.Next;
                                    end;
                                end;
                              mProgramacao.Post;
                            end;
                          DM1.tPedidoItem.Next;
                        end;
                    end;
                  DM1.tLotePedidoMI.Next;
                end;
              DM1.tLoteMI.Next;
            end;
        end;
    2 : begin
          DM1.tLote.Filtered := False;
          DM1.tLote.Filter   := 'Lote >= '''+Edit3.Text+''' and Lote <= '''+Edit4.Text+'''';
          DM1.tLote.Filtered := True;
          DM1.tLote.First;
          while not DM1.tLote.Eof do
            begin
              DM1.tPedido.SetKey;
              DM1.tPedidoPedido.AsInteger := DM1.tLoteNroPedido.AsInteger;
              if DM1.tPedido.GotoKey then
                begin
                  DM1.tPedidoItem.SetKey;
                  DM1.tPedidoItemPedido.AsInteger := DM1.tLoteNroPedido.AsInteger;
                  DM1.tPedidoItemItem.AsInteger   := DM1.tLoteItemPed.AsInteger;
                  if (DM1.tPedidoItem.GotoKey) then
                    begin
                      DM1.tTalao.First;
                      while not DM1.tTalao.Eof do
                        begin
                          if DM1.tLoteTipoTalao.AsString = 'R' then
                            begin
                              mProgramacao.Insert;
                              mProgramacaoCodCli.AsInteger      := DM1.tPedidoCodCliente.AsInteger;
                              mProgramacaoCodProduto.AsInteger  := DM1.tPedidoItemCodProduto.AsInteger;
                              mProgramacaoDtEmbFinal.AsDateTime := DM1.tPedidoDtFinEmbarque.AsDateTime;
                              mProgramacaoMaterialCor.AsString  := DM1.tPedidoItemlkDescMaterial.AsString + ' ' + DM1.tPedidoItemlkCor.AsString;
                              mProgramacaoConstrucao.AsString   := DM1.tPedidoItemlkConstrucao.AsString;
                              mProgramacaoPedido.AsInteger      := DM1.tPedidoPedido.AsInteger;
                              mProgramacaoQtdPrs.AsInteger      := DM1.tTalaoQtdPar.AsInteger;
                              mProgramacaoTalao.AsInteger       := DM1.tTalaoItem.AsInteger;
                              mProgramacaoLote.AsInteger        := DM1.tTalaoLote.AsInteger;
                              mProgramacao.Post;
                            end
                          else
                          if DM1.tLoteTipoTalao.AsString = 'T' then
                            begin
                              DM1.tTalaoGrade.First;
                              while not DM1.tTalaoGrade.Eof do
                                begin
                                  if DM1.tTalaoGradeQtdPar.AsInteger > 0 then
                                    begin
                                      mProgramacao.Insert;
                                      mProgramacaoCodCli.AsInteger      := DM1.tPedidoCodCliente.AsInteger;
                                      mProgramacaoCodProduto.AsInteger  := DM1.tPedidoItemCodProduto.AsInteger;
                                      mProgramacaoDtEmbFinal.AsDateTime := DM1.tPedidoDtFinEmbarque.AsDateTime;
                                      mProgramacaoMaterialCor.AsString  := DM1.tPedidoItemlkDescMaterial.AsString + ' ' + DM1.tPedidoItemlkCor.AsString;
                                      mProgramacaoConstrucao.AsString   := DM1.tPedidoItemlkConstrucao.AsString;
                                      mProgramacaoPedido.AsInteger      := DM1.tPedidoPedido.AsInteger;
                                      mProgramacaoQtdPrs.AsInteger      := DM1.tTalaoGradeQtdPar.AsInteger;
                                      mProgramacaoTalao.AsInteger       := DM1.tTalaoGradeTalao.AsInteger;
                                      mProgramacaoLote.AsInteger        := DM1.tTalaoGradeLote.AsInteger;
                                      mProgramacaoCodGrade.AsInteger    := DM1.tTalaoGradeCodGrade.AsInteger;
                                      mProgramacaoPosicao.AsInteger     := DM1.tTalaoGradePosicao.AsInteger;
                                      DM1.tTalaoMov.Filtered            := False;
                                      DM1.tTalaoMov.Filter              := 'Lote = '''+DM1.tTalaoGradeLote.AsString+''' and Talao = '''+DM1.tTalaoGradeTalao.AsString+'''';
                                      DM1.tTalaoMov.Filtered            := True;
                                      DM1.tTalaoMov.First;
                                      while not DM1.tTalaoMov.Eof do
                                        begin
                                          if DM1.tTalaoMovSetor.AsInteger = RxDBLookupCombo1.KeyValue then
                                            mProgramacaoDtSetor1.AsString := Copy(DM1.tTalaoMovDataSaida.AsString,1,2) + '/' + Copy(DM1.tTalaoMovDataSaida.AsString,4,2) + '/' + Copy(DM1.tTalaoMovDataSaida.AsString,9,2);
                                          if DM1.tTalaoMovSetor.AsInteger = RxDBLookupCombo2.KeyValue then
                                            mProgramacaoDtSetor2.AsString := Copy(DM1.tTalaoMovDataSaida.AsString,1,2) + '/' + Copy(DM1.tTalaoMovDataSaida.AsString,4,2) + '/' + Copy(DM1.tTalaoMovDataSaida.AsString,9,2);
                                          if DM1.tTalaoMovSetor.AsInteger = RxDBLookupCombo3.KeyValue then
                                            mProgramacaoDtSetor3.AsString := Copy(DM1.tTalaoMovDataSaida.AsString,1,2) + '/' + Copy(DM1.tTalaoMovDataSaida.AsString,4,2) + '/' + Copy(DM1.tTalaoMovDataSaida.AsString,9,2);
                                          if DM1.tTalaoMovSetor.AsInteger = RxDBLookupCombo4.KeyValue then
                                            mProgramacaoDtSetor4.AsString := Copy(DM1.tTalaoMovDataSaida.AsString,1,2) + '/' + Copy(DM1.tTalaoMovDataSaida.AsString,4,2) + '/' + Copy(DM1.tTalaoMovDataSaida.AsString,9,2);
                                          DM1.tTalaoMov.Next;
                                        end;
                                      DM1.tTalaoMov.Filtered            := False;
                                      mProgramacao.Post;
                                    end;
                                  DM1.tTalaoGrade.Next;
                                end;
                            end;
                          DM1.tTalao.Next;
                        end;
                    end;
                end;
              DM1.tLote.Next;
            end;
        end;
    3 : begin
          DM1.tPedido.Filtered     := False;
          DM1.tPedido.Filter       := 'DtIniEmbarque >= '''+DateEdit1.Text+''' and DtFinEmbarque <= '''+DateEdit2.Text+''' and Cancelado <> True and Suspenso <> True';
          DM1.tPedido.Filtered     := True;
          DM1.tPedido.First;
          while not DM1.tPedido.Eof do
            begin
              DM1.tPedidoItem.Filtered := False;
              DM1.tPedidoItem.Filter   := 'Cancelado <> True';
              DM1.tPedidoItem.Filtered := True;
              DM1.tPedidoItem.First;
              while not DM1.tPedidoItem.Eof do
                begin
                  mProgramacao.Insert;
                  mProgramacaoCodCli.AsInteger      := DM1.tPedidoCodCliente.AsInteger;
                  mProgramacaoCodProduto.AsInteger  := DM1.tPedidoItemCodProduto.AsInteger;
                  mProgramacaoDtEmbFinal.AsDateTime := DM1.tPedidoDtFinEmbarque.AsDateTime;
                  mProgramacaoMaterialCor.AsString  := DM1.tPedidoItemlkDescMaterial.AsString + ' ' + DM1.tPedidoItemlkCor.AsString;
                  mProgramacaoConstrucao.AsString   := DM1.tPedidoItemlkConstrucao.AsString;
                  mProgramacaoPedido.AsInteger      := DM1.tPedidoPedido.AsInteger;
                  mProgramacaoQtdPrs.AsInteger      := DM1.tPedidoItemQtdPares.AsInteger;
                  if DM2.tTalaoMIIns.Locate('NumPedido;ItemPedido',VarArrayOf([DM1.tPedidoPedido.AsInteger,DM1.tPedidoItemItem.AsInteger]),[locaseinsensitive]) then
                    begin
                      mProgramacaoTalao.AsInteger := DM2.tTalaoMIInsItem.AsInteger;
                      mProgramacaoLote.AsInteger  := DM2.tTalaoMIInsLote.AsInteger;
                      DM2.tTalaoMovMiIns.First;
                      while not DM2.tTalaoMovMiIns.Eof do
                        begin
                          if DM2.tTalaoMovMiInsDataSaida.AsDateTime > 1 then
                            begin
                              if DM2.tTalaoMovMiInsSetor.AsInteger = RxDBLookupCombo1.KeyValue then
                                mProgramacaoDtSetor1.AsString := Copy(DM2.tTalaoMovMiInsDataSaida.AsString,1,2) + '/' + Copy(DM2.tTalaoMovMiInsDataSaida.AsString,4,2) + '/' + Copy(DM2.tTalaoMovMiInsDataSaida.AsString,9,2);
                              if DM2.tTalaoMovMiInsSetor.AsInteger = RxDBLookupCombo2.KeyValue then
                                mProgramacaoDtSetor2.AsString := Copy(DM2.tTalaoMovMiInsDataSaida.AsString,1,2) + '/' + Copy(DM2.tTalaoMovMiInsDataSaida.AsString,4,2) + '/' + Copy(DM2.tTalaoMovMiInsDataSaida.AsString,9,2);
                              if DM2.tTalaoMovMiInsSetor.AsInteger = RxDBLookupCombo3.KeyValue then
                                mProgramacaoDtSetor3.AsString := Copy(DM2.tTalaoMovMiInsDataSaida.AsString,1,2) + '/' + Copy(DM2.tTalaoMovMiInsDataSaida.AsString,4,2) + '/' + Copy(DM2.tTalaoMovMiInsDataSaida.AsString,9,2);
                              if DM2.tTalaoMovMiInsSetor.AsInteger = RxDBLookupCombo4.KeyValue then
                                mProgramacaoDtSetor4.AsString := Copy(DM2.tTalaoMovMiInsDataSaida.AsString,1,2) + '/' + Copy(DM2.tTalaoMovMiInsDataSaida.AsString,4,2) + '/' + Copy(DM2.tTalaoMovMiInsDataSaida.AsString,9,2);
                            end;
                          DM2.tTalaoMovMiIns.Next;
                        end;
                    end;
                  mProgramacao.Post;
                  DM1.tPedidoItem.Next;
                end;
              DM1.tPedido.Next;
            end;
        end;
  end;
  DM1.tPedido.Filtered     := False;
  DM1.tPedidoItem.Filtered := False;
  DM1.tLoteMI.Filtered     := False;
  DM1.tLote.Filtered       := False;
  Screen.Cursor            := crDefault;
end;

procedure TfPrevPlanejProg.Imprime_Cab_Prog;
var
 i : Integer;
 texto1 : String;
begin
  vPagina := vPagina + 1;
  if vPagina > 1 then
    begin
      while vLinha < 66 do
        begin
          vLinha := vLinha + 1;
          Writeln(F);
        end;
    end;
  Texto1 := DM1.tEmpresaEmpresa.AsString;
  for i := 1 to 116 - Length(texto1) do
    Texto1 := Texto1 + ' ';
  texto1 := Texto1 + 'Pag.: ' + IntToStr(vPagina);
  Writeln(F,Texto1);

  Texto1 := ' ';
  for i := 1 to 50 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + 'PROGRAMACAO - ';
  Case RadioGroup2.ItemIndex of
    0 : Texto1 := Texto1 + 'POR PEDIDOS';
    1 : Texto1 := Texto1 + 'POR LOTES MERC. INT.';
    2 : Texto1 := Texto1 + 'POR LOTES EXPORTACAO';
    3 : Texto1 := Texto1 + 'POR DATAS DE EMBARQUE';
  end;
  for i := 1 to 116 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + 'Data: ' + DateToStr(Date);
  Writeln(F,Texto1);

  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Writeln(F,'Cliente                        Pedido  Talao  Ref.     Construcao     Qtd.Prs. Material/Cor                               Dt.Embarq.');
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');

  vLinha := 5;
end;

procedure TfPrevPlanejProg.Imprime_Det_Prog;
var
  Texto1, Texto2 : String;
  i : Integer;
begin
  Texto2 := Copy(mProgramacaolkNomeCli.AsString,1,30);
  for i := 1 to 30 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto2 + ' ';
  texto2 := mProgramacaoPedido.AsString;
  for i := 1 to 8 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2;
  Texto2 := mProgramacaoTalao.AsString;
  for i := 1 to 7 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2;
  Texto2 := Copy(mProgramacaolkRef.AsString,1,9);
  for i := 1 to 9 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2;
  Texto2 := Copy(mProgramacaoConstrucao.AsString,1,15);
  for i := 1 to 15 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2 + ' ';
  Texto2 := mProgramacaoQtdPrs.AsString;
  for i := 1 to 7 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  Texto1 := Texto1 + Texto2 + ' ';
  Texto2 := Copy(mProgramacaoMaterialCor.AsString,1,42);
  for i := 1 to 42 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2;
  Texto2 := mProgramacaoDtEmbFinal.AsString;
  for i := 1 to 11 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  Texto1 := Texto1 + Texto2;
  writeln(F,Texto1);
  vLinha := vLinha + 1;
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  vLinha := vLinha + 1;
end;

procedure TfPrevPlanejProg.Imprime_Rod_Prog;
var
  Texto1 : String;
begin
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Texto1 := 'Total de Pares: ' + IntToStr(vTotal);
  Writeln(F,Texto1);
  vLinha := vLinha + 2;
  while vlinha < 66 do
    begin
      vLinha := vLinha + 1;
      Writeln(F);
    end;
end;

procedure TfPrevPlanejProg.Imprime_Programacao;
begin
  fEscImpressora := TfEscImpressora.Create(Self);
  fEscImpressora.ShowModal;
  vLinha         := 99;
  vPagina        := 0;
  vTotal         := 0;
  AssignFile(F,DM1.tImpressoraEndereco.AsString);
  ReWrite(F);
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#15);
  mProgramacao.First;
  while not mProgramacao.EOF do
    begin
      if vLinha > 61 then
        Imprime_Cab_Prog;
      Imprime_Det_Prog;
      vTotal := vTotal + mProgramacaoQtdPrs.AsInteger;
      mProgramacao.Next;
    end;
  Imprime_Rod_Prog;
  CloseFile(F);
  if DM1.tImpressoraVisualizar.AsBoolean then
  begin
    Texto := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
    //WinExec(PChar(Texto),SW_MAXIMIZE);
    ShellExecute(Application.Handle, 'Open', PChar(DM1.tImpressoraEndereco.AsString), nil, nil, SW_SHOWMAXIMIZED);
  end;
end;

procedure TfPrevPlanejProg.Imprime_Cab_Plan;
var
 i : Integer;
 texto1, texto2 : String;
begin
  vPagina := vPagina + 1;
  if vPagina > 1 then
    begin
      while vLinha < 66 do
        begin
          vLinha := vLinha + 1;
          Writeln(F);
        end;
    end;
  Texto1 := DM1.tEmpresaEmpresa.AsString;
  for i := 1 to 116 - Length(texto1) do
    Texto1 := Texto1 + ' ';
  texto1 := Texto1 + 'Pag.: ' + IntToStr(vPagina);
  Writeln(F,Texto1);

  Case RadioGroup2.ItemIndex of
    0 : begin
          texto1 := 'Pedido: ' + Edit1.Text + ' a ' + Edit2.Text;
          texto2 := 'POR PEDIDOS';
        end;
    1 : begin
          texto1 := 'Lote: ' + Edit3.Text + ' a ' + Edit4.Text;
          Texto2 := 'POR LOTES MERC. INT.';
        end;
    2 : begin
          texto1 := 'Lote: ' + Edit3.Text + ' a ' + Edit4.Text;
          Texto2 := 'POR LOTES EXPORTACAO';
        end;
    3 : begin
          texto1 := 'Data Embarque: ' + DateEdit1.Text + ' a ' + DateEdit2.Text;
          Texto2 := 'POR DATAS DE EMBARQUE';
        end;
  end;

  for i := 1 to 50 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + 'PLANEJAMENTO - ' + texto2;
  for i := 1 to 116 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + 'Data: ' + DateToStr(Date);
  Writeln(F,Texto1);

  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Texto1 := 'Cliente              Pedido  Lote  Talao Ref.     Construcao Material/Cor      Qtd.Prs.  Tam.   ';
  Texto2 := Copy(RxDBLookupCombo1.Text,1,8);
  for i := 1 to 9 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2;
  Texto2 := Copy(RxDBLookupCombo2.Text,1,8);
  for i := 1 to 9 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2;
  Texto2 := Copy(RxDBLookupCombo3.Text,1,8);
  for i := 1 to 9 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2;
  Texto2 := Copy(RxDBLookupCombo4.Text,1,8);
  for i := 1 to 8 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2;
  Writeln(F,Texto1);
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  vLinha := 5;
end;

procedure TfPrevPlanejProg.Imprime_Det_Plan;
var
  Texto1, Texto2 : String;
  i : Integer;
begin
  Texto2 := Copy(mProgramacaolkNomeCli.AsString,1,20);
  for i := 1 to 20 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto2 + ' ';
  texto2 := mProgramacaoPedido.AsString;
  for i := 1 to 8 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2;
  texto2 := mProgramacaoLote.AsString;
  for i := 1 to 5 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2 + ' ';
  Texto2 := mProgramacaoTalao.AsString;
  for i := 1 to 5 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2 + ' ';
  Texto2 := Copy(mProgramacaolkRef.AsString,1,9);
  for i := 1 to 9 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2;
  Texto2 := Copy(mProgramacaoConstrucao.AsString,1,10);
  for i := 1 to 10 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2 + ' ';
  Texto2 := Copy(mProgramacaoMaterialCor.AsString,1,19);
  for i := 1 to 20 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2;
  Texto2 := mProgramacaoQtdPrs.AsString;
  for i := 1 to 5 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  Texto1 := Texto1 + Texto2 + '   ';
  Texto2 := mProgramacaolkTamanho.AsString;
  for i := 1 to 3 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  Texto1 := Texto1 + Texto2 + ' ';
  Texto2 := mProgramacaolkLargura.AsString;
  for i := 1 to 2 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  Texto1 := Texto1 + Texto2 + '|';
  Texto2 := mProgramacaoDtSetor1.AsString;
  for i := 1 to 8 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2 + '|';
  Texto2 := mProgramacaoDtSetor2.AsString;
  for i := 1 to 8 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2 + '|';
  Texto2 := mProgramacaoDtSetor3.AsString;
  for i := 1 to 8 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2 + '|';
  Texto2 := mProgramacaoDtSetor4.AsString;
  for i := 1 to 8 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2 + '|';
  writeln(F,Texto1);
  vLinha := vLinha + 1;
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  vLinha := vLinha + 1;
end;

procedure TfPrevPlanejProg.Imprime_Rod_Plan;
var
  Texto1 : String;
begin
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Texto1 := 'Total de Pares: ' + IntToStr(vTotal2);
  Writeln(F,Texto1);
  vLinha := vLinha + 2;
  while vlinha < 66 do
    begin
      vLinha := vLinha + 1;
      Writeln(F);
    end;
end;

procedure TfPrevPlanejProg.Imprime_Planejamento;
begin
  fEscImpressora := TfEscImpressora.Create(Self);
  fEscImpressora.ShowModal;
  vLinha         := 99;
  vPagina        := 0;
  vTotal2        := 0;
  AssignFile(F,DM1.tImpressoraEndereco.AsString);
  ReWrite(F);
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#15);
  mProgramacao.First;
  while not mProgramacao.EOF do
    begin
      if vLinha > 61 then
        Imprime_Cab_Plan;
      Imprime_Det_Plan;
      vTotal2 := vTotal2 + mProgramacaoQtdPrs.AsInteger;
      mProgramacao.Next;
    end;
  Imprime_Rod_Plan;
  CloseFile(F);
  if DM1.tImpressoraVisualizar.AsBoolean then
  begin
    Texto := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
    //WinExec(PChar(Texto),SW_MAXIMIZE);
    ShellExecute(Application.Handle, 'Open', PChar(DM1.tImpressoraEndereco.AsString), nil, nil, SW_SHOWMAXIMIZED);
  end;
end;

procedure TfPrevPlanejProg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Dm1.tSetor.Close;
  Dm1.tPedido.Close;
  Dm1.tPedidoItem.Close;
  Dm1.tLote.Close;
  Dm1.tLoteMI.Close;
  Dm1.tLotePedidoMI.Close;
  DM1.tLotePedido.Close;
  DM1.tLoteSetor.Close;
  DM1.tLoteSetorMI.Close;
  Dm1.tTalao.Close;
  Dm1.tTalaoGrade.Close;
  DM1.tTalaoMov.Close;
  DM1.tCliente.Close;
  DM1.tProduto.Close;
  DM1.tGrade.Close;
  DM1.tGradeItem.Close;
  DM1.tGradeItemlk.Close;
  DM1.tCor.Close;
  DM1.tMaterial.Close;
  Action := Cafree;
end;

procedure TfPrevPlanejProg.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevPlanejProg.BitBtn2Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 0;
  RadioGroup2.ItemIndex := 0;
  Limpa_Edit;
  Posiciona_Setores;
  RadioGroup1.SetFocus;
end;

procedure TfPrevPlanejProg.RadioGroup2Exit(Sender: TObject);
begin
  CheckBox1.enabled := False;
  CheckBox1.checked := False;
  Case RadioGroup2.ItemIndex of
    0 : begin
          Limpa_Edit;
          Panel2.Enabled := True;
          Panel3.Enabled := False;
          Panel4.Enabled := False;
          if RadioGroup1.itemindex = 1 then
            CheckBox1.enabled := True;
        end;
    1 : begin
          Limpa_Edit;
          Panel2.Enabled := False;
          Panel3.Enabled := True;
          Panel4.Enabled := False;
          if RadioGroup1.itemindex = 1 then
            CheckBox1.enabled := True;
        end;
    2 : begin
          Limpa_Edit;
          Panel2.Enabled := False;
          Panel3.Enabled := True;
          Panel4.Enabled := False;
        end;
    3 : begin
          Limpa_Edit;
          Panel2.Enabled := False;
          Panel3.Enabled := False;
          Panel4.Enabled := True;
        end;
  end;
end;

procedure TfPrevPlanejProg.BitBtn1Click(Sender: TObject);
begin
  Case RadioGroup2.ItemIndex of
    0 : begin
          if (Edit1.Text <> '') and (Edit2.Text <> '') then
            begin
              Gera_Dados;
              Case RadioGroup1.ItemIndex of
                0 : Imprime_Planejamento;
                1 : Imprime_Programacao;
              end;
            end
          else
            begin
              ShowMessage('Você deve informar Pedidos "Inicial" e "Final" p/ gerar o relatório!');
              Edit1.SetFocus;
            end;
        end;
    1 : begin
          if (Edit3.Text <> '') and (Edit4.Text <> '') then
            begin
              Gera_Dados;
              Case RadioGroup1.ItemIndex of
                0 : Imprime_Planejamento;
                1 : Imprime_Programacao;
              end;
            end
          else
            begin
              ShowMessage('Você deve informar Lotes de Merc. Interno "Inicial" e "Final" p/ gerar o relatório!');
              Edit3.SetFocus;
            end;
        end;
    2 : begin
          if (Edit3.Text <> '') and (Edit4.Text <> '') then
            begin
              Gera_Dados;
              Case RadioGroup1.ItemIndex of
                0 : Imprime_Planejamento;
                1 : Imprime_Programacao;
              end;
            end
          else
            begin
              ShowMessage('Você deve informar Lotes de Exportação "Inicial" e "Final" p/ gerar o relatório!');
              Edit3.SetFocus;
            end;
        end;
    3 : begin
          if (DateEdit1.Text <> '  /  /    ') and (DateEdit2.Text <> '  /  /    ') then
            begin
              Gera_Dados;
              Case RadioGroup1.ItemIndex of
                0 : Imprime_Planejamento;
                1 : Imprime_Programacao;
              end;
            end
          else
            begin
              ShowMessage('Você deve informar Datas de Embarque "Inicial" e "Final" p/ gerar o relatório!');
              DateEdit1.SetFocus;
            end;
        end;
  end;
end;

procedure TfPrevPlanejProg.RadioGroup1Click(Sender: TObject);
begin
  if (RadioGroup1.Itemindex = 1) and ((RadioGroup2.Itemindex = 0) or (RadioGroup2.Itemindex = 1)) then
    begin
      CheckBox1.enabled := True;
    end
  else
    begin
      CheckBox1.enabled := False;
      CheckBox1.checked := False;
    end;
  Case RadioGroup1.ItemIndex of
    0 : Panel7.Enabled := True;
    1 : Panel7.Enabled := False;
  end;
end;

procedure TfPrevPlanejProg.FormCreate(Sender: TObject);
begin
  Dm1.tSetor.Open;
  Dm1.tPedido.Open;
  Dm1.tPedidoItem.Open;
  Dm1.tLote.Open;
  Dm1.tLoteMI.Open;
  Dm1.tLotePedidoMI.Open;
  DM1.tLotePedido.Open;
  DM1.tLoteSetor.Open;
  DM1.tLoteSetorMI.Open;
  Dm1.tTalao.Open;
  Dm1.tTalaoGrade.Open;
  DM1.tTalaoMov.Open;
  DM1.tCliente.Open;
  DM1.tProduto.Open;
  DM1.tGrade.Open;
  DM1.tGradeItem.Open;
  DM1.tGradeItemlk.Open;
  DM1.tCor.Open;
  DM1.tMaterial.Open;
  Posiciona_Setores;
end;

end.

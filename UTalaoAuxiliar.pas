unit UTalaoAuxiliar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, SMDBGrid, StdCtrls, Buttons, DB, DBTables,
  DBFilter, ComCtrls, DBVGrids, ExtCtrls, DBClient;

type
  TfTalaoAuxiliar = class(TForm)
    SMDBGrid1: TSMDBGrid;
    SMDBGrid2: TSMDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    SMDBGrid3: TSMDBGrid;
    tTalaoAuxiliar: TTable;
    tTalaoAuxiliarLote: TIntegerField;
    tTalaoAuxiliarCodSetor: TIntegerField;
    tTalaoAuxiliarItemTalao: TIntegerField;
    tTalaoAuxiliarTalao: TIntegerField;
    tTalaoAuxiliarCodProduto: TIntegerField;
    tTalaoAuxiliarCodCor: TIntegerField;
    tTalaoAuxiliarQtdPares: TIntegerField;
    tTalaoAuxiliarCodGrade: TIntegerField;
    tTalaoAuxiliarPosicao: TIntegerField;
    tTalaoAuxiliarTamanho: TStringField;
    tTalaoAuxiliarCodCliente: TIntegerField;
    tTalaoAuxiliarPedido: TIntegerField;
    tTalaoAuxiliarItemPedido: TIntegerField;
    tTalaoAuxiliarCodAtelier: TIntegerField;
    tTalaoAuxiliarDtEntrada: TDateField;
    tTalaoAuxiliarHrEntrada: TTimeField;
    tTalaoAuxiliarDtSaida: TDateField;
    tTalaoAuxiliarHrSaida: TTimeField;
    tTalaoAuxiliarOpcaoLoteTalao: TStringField;
    dsTalaoAuxiliar: TDataSource;
    tTalaoAuxiliarGrade: TTable;
    tTalaoAuxiliarGradeLote: TIntegerField;
    tTalaoAuxiliarGradeCodSetor: TIntegerField;
    tTalaoAuxiliarGradeCodGrade: TIntegerField;
    tTalaoAuxiliarGradePosicao: TIntegerField;
    tTalaoAuxiliarGradeQtd: TIntegerField;
    tTalaoAuxiliarGradeTamanho: TStringField;
    dsTalaoAuxiliarGrade: TDataSource;
    RxDBFilter1: TRxDBFilter;
    VDBGrid1: TVDBGrid;
    tTalaoAuxiliarlkNomeSetor: TStringField;
    tTalaoAuxiliarlkNomeAtelier: TStringField;
    BitBtn4: TBitBtn;
    tProdutoSetorAux: TTable;
    tProdutoSetorAuxCodProduto: TIntegerField;
    tProdutoSetorAuxItem: TIntegerField;
    tProdutoSetorAuxCodSetor: TIntegerField;
    tProdutoSetorAuxCapacidadeDia: TIntegerField;
    tProdutoSetorAuxlkOpcaoTalaoAuxiliar: TStringField;
    tTalaoAuxiliarGradelkMarcarTam: TStringField;
    tTalaoAuxiliarlkMarcarTam: TStringField;
    tTalaoAuxiliarlkCodPosicaoMat: TIntegerField;
    tTalaoAuxiliarlkImpTalao: TBooleanField;
    tTalaoAuxiliarlkImpFotoTalaoAux: TBooleanField;
    BitBtn5: TBitBtn;
    Shape1: TShape;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SMDBGrid2ChangeSelection(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SMDBGrid3GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    procedure Grava_TalaoAuxiliar(Talao, CodGrade, Posicao, Qtd : Integer ; Tamanho : String);
    procedure Excluir_TalaoAux;

  public
    { Public declarations }
  end;

var
  fTalaoAuxiliar: TfTalaoAuxiliar;

implementation

uses UDM1, UConsLoteExp, URelTalaoAuxiliarLote;

{$R *.dfm}

procedure TfTalaoAuxiliar.Excluir_TalaoAux;
begin
  tTalaoAuxiliar.First;
  while not tTalaoAuxiliar.Eof do
    begin
      tTalaoAuxiliarGrade.First;
      while not tTalaoAuxiliarGrade.Eof do
        tTalaoAuxiliarGrade.Delete;
      tTalaoAuxiliar.Delete;
    end;
end;

procedure TfTalaoAuxiliar.Grava_TalaoAuxiliar(Talao, CodGrade, Posicao, Qtd : Integer ; Tamanho : String);
begin
  if DM1.tTalaoAuxiliar.FindKey([DM1.tLoteLote.AsInteger,tProdutoSetorAuxCodSetor.AsInteger,fConsLoteExp.tTalaoItem.AsInteger,Talao]) then
    DM1.tTalaoAuxiliar.Edit
  else
    begin
      DM1.tTalaoAuxiliar.Insert;
      DM1.tTalaoAuxiliarLote.AsInteger       := DM1.tLoteLote.AsInteger;
      DM1.tTalaoAuxiliarCodSetor.AsInteger   := tProdutoSetorAuxCodSetor.AsInteger;
      DM1.tTalaoAuxiliarItemTalao.AsInteger  := fConsLoteExp.tTalaoItem.AsInteger;
      DM1.tTalaoAuxiliarTalao.AsInteger      := Talao;
      DM1.tTalaoAuxiliarCodProduto.AsInteger := fConsLoteExp.tTalaoCodProduto.AsInteger;
      DM1.tTalaoAuxiliarCodCor.AsInteger     := fConsLoteExp.tTalaoCodCor.AsInteger;
    end;
  DM1.tTalaoAuxiliarQtdPares.AsInteger      := Qtd;
  DM1.tTalaoAuxiliarCodGrade.AsInteger      := CodGrade;
  DM1.tTalaoAuxiliarPosicao.AsInteger       := Posicao;
  DM1.tTalaoAuxiliarTamanho.AsString        := Tamanho;
  DM1.tTalaoAuxiliarCodCliente.AsInteger    := DM1.tPedidoCodCliente.AsInteger;
  DM1.tTalaoAuxiliarPedido.AsInteger        := DM1.tPedidoPedido.AsInteger;
  DM1.tTalaoAuxiliarItemPedido.AsInteger    := DM1.tPedidoItemItem.AsInteger;
  DM1.tTalaoAuxiliarCodAtelier.AsInteger    := 0;
  DM1.tTalaoAuxiliarOpcaoLoteTalao.AsString := tProdutoSetorAuxlkOpcaoTalaoAuxiliar.AsString;
  DM1.tTalaoAuxiliar.Post;

  if Talao <= 0 then
    begin
      DM1.tTalaoAuxiliarGrade.First;
      while not DM1.tTalaoAuxiliarGrade.Eof do
        DM1.tTalaoAuxiliarGrade.Delete;
      DM1.tTalaoAuxiliarGrade.Refresh;
      fConsLoteExp.tTalaoGrade.First;
      while not fConsLoteExp.tTalaoGrade.Eof do
        begin
          if DM1.tTalaoAuxiliarGrade.FindKey([DM1.tLoteLote.AsInteger,tProdutoSetorAuxCodSetor.AsInteger,fConsLoteExp.tTalaoGradeCodGrade.AsInteger,fConsLoteExp.tTalaoGradePosicao.AsInteger]) then
            DM1.tTalaoAuxiliarGrade.Edit
          else
            begin
              DM1.tTalaoAuxiliarGrade.Insert;
              DM1.tTalaoAuxiliarGradeLote.AsInteger := DM1.tLoteLote.AsInteger;
              DM1.tTalaoAuxiliarGradeCodSetor.AsInteger := tProdutoSetorAuxCodSetor.AsInteger;
              DM1.tTalaoAuxiliarGradeCodGrade.AsInteger := fConsLoteExp.tTalaoGradeCodGrade.AsInteger;
              DM1.tTalaoAuxiliarGradePosicao.AsInteger  := fConsLoteExp.tTalaoGradePosicao.AsInteger;
              DM1.tTalaoAuxiliarGradeTamanho.AsString := fConsLoteExp.tTalaoGradelkTamanho.AsString;
            end;
          DM1.tTalaoAuxiliarGradeQtd.AsInteger    := DM1.tTalaoAuxiliarGradeQtd.AsInteger + fConsLoteExp.tTalaoGradeQtdPar.AsInteger;
          DM1.tTalaoAuxiliarGrade.Post;

          fConsLoteExp.tTalaoGrade.Next;
        end;
    end;

end;

procedure TfTalaoAuxiliar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfTalaoAuxiliar.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfTalaoAuxiliar.BitBtn1Click(Sender: TObject);
begin
  tTalaoAuxiliar.Close;
  tTalaoAuxiliarGrade.Close;

  RxDBFilter1.Active := True;
  DM1.tLote.IndexFieldNames := 'Lote';

  DM1.tPedidoItem.First;
  while not DM1.tPedidoItem.Eof do
    begin
      tProdutoSetorAux.First;
      while not tProdutoSetorAux.Eof do
        begin
          fConsLoteExp.tLote.First;
          while not fConsLoteExp.tLote.Eof do
            begin
              DM1.tLote.FindKey([fConsLoteExp.tLoteLote.AsInteger]);

              DM1.tTalaoAuxiliar.First;
              while not DM1.tTalaoAuxiliar.Eof do
                begin
                  if DM1.tTalaoAuxiliarCodSetor.AsInteger = tProdutoSetorAuxCodSetor.AsInteger then
                    begin
                      DM1.tTalaoAuxiliarGrade.First;
                      while not DM1.tTalaoAuxiliarGrade.Eof do
                        DM1.tTalaoAuxiliarGrade.Delete;
                      DM1.tTalaoAuxiliar.Delete;
                    end
                  else
                    DM1.tTalaoAuxiliar.Next;
                end;
              DM1.tTalaoAuxiliar.Refresh;
              DM1.tTalaoAuxiliarGrade.Refresh;

              fConsLoteExp.tTalao.First;
              while not fConsLoteExp.tTalao.Eof do
                begin
                  if tProdutoSetorAuxlkOpcaoTalaoAuxiliar.AsString = 'T' then
                    begin
                      fConsLoteExp.tTalaoGrade.First;
                      while not fConsLoteExp.tTalaoGrade.Eof do
                        begin
                          if fConsLoteExp.tTalaoGradeQtdPar.AsInteger > 0 then
                            Grava_TalaoAuxiliar(fConsLoteExp.tTalaoGradeTalao.AsInteger,fConsLoteExp.tTalaoGradeCodGrade.AsInteger,
                                                fConsLoteExp.tTalaoGradePosicao.AsInteger,fConsLoteExp.tTalaoGradeQtdPar.AsInteger,fConsLoteExp.tTalaoGradelkTamanho.AsString);
                          fConsLoteExp.tTalaoGrade.Next;
                        end;
                    end
                  else
                    Grava_TalaoAuxiliar(0,0,0,fConsLoteExp.tTalaoQtdPar.AsInteger,'');
                  fConsLoteExp.tTalao.Next;
                end;
              fConsLoteExp.tLote.Next;
            end;
          tProdutoSetorAux.Next;
        end;
      DM1.tPedidoItem.Next;
    end;

  {DM1.tPedidoItem.First;
  while not DM1.tPedidoItem.Eof do
    begin

      DM1.tSetor.First;
      while not DM1.tSetor.Eof do
        begin
          fConsLoteExp.tLote.First;
          while not fConsLoteExp.tLote.Eof do
            begin
              DM1.tLote.FindKey([fConsLoteExp.tLoteLote.AsInteger]);

              fConsLoteExp.tTalao.First;
              while not fConsLoteExp.tTalao.Eof do
                begin
                  if DM1.tSetorOpcaoTalaoAuxiliar.AsString = 'T' then
                    begin
                      fConsLoteExp.tTalaoGrade.First;
                      while not fConsLoteExp.tTalaoGrade.Eof do
                        begin
                          if fConsLoteExp.tTalaoGradeQtdPar.AsInteger > 0 then
                            Grava_TalaoAuxiliar(fConsLoteExp.tTalaoGradeTalao.AsInteger,fConsLoteExp.tTalaoGradeCodGrade.AsInteger,
                                                fConsLoteExp.tTalaoGradePosicao.AsInteger,fConsLoteExp.tTalaoGradeQtdPar.AsInteger,fConsLoteExp.tTalaoGradelkTamanho.AsString);
                          fConsLoteExp.tTalaoGrade.Next;
                        end;
                    end
                  else
                    Grava_TalaoAuxiliar(0,0,0,fConsLoteExp.tTalaoQtdPar.AsInteger,'');
                  fConsLoteExp.tTalao.Next;
                end;
              fConsLoteExp.tLote.Next;
            end;
          DM1.tSetor.Next;
        end;
      DM1.tPedidoItem.Next;
    end;}

  DM1.tTalaoAuxiliar.Refresh;
  DM1.tTalaoAuxiliarGrade.Refresh;
  tTalaoAuxiliar.Open;
  tTalaoAuxiliarGrade.Open;
  tTalaoAuxiliar.Refresh;
  tTalaoAuxiliarGrade.Refresh;

  RxDBFilter1.Active := False;
end;

procedure TfTalaoAuxiliar.BitBtn4Click(Sender: TObject);
begin
  if not DM1.tUsuarioExcluirTalaoAux.AsBoolean then
    begin
      ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
      exit;
    end;

  if MessageDlg('Deseja excluir os talões auxiliares?', mtConfirmation,[mbOk,mbNo],0)=mrNO then
    exit;

  Excluir_TalaoAux;
end;

procedure TfTalaoAuxiliar.SMDBGrid2ChangeSelection(Sender: TObject);
begin
  SMDBGrid1.SelectAllClick(SMDBGrid1);
end;

procedure TfTalaoAuxiliar.FormShow(Sender: TObject);
begin
  if not DM1.tPedidoMaterial.Active then
    DM1.tPedidoMaterial.Open;
end;

procedure TfTalaoAuxiliar.BitBtn5Click(Sender: TObject);
begin
  if not DM1.tUsuarioExcluirTalaoAux.AsBoolean then
    begin
      ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
      exit;
    end;

  if MessageDlg('Deseja excluir os talões auxiliares?', mtConfirmation,[mbOk,mbNo],0)=mrNO then
    exit;

  fConsLoteExp.tLote.First;
  while not fConsLoteExp.tLote.Eof do
    begin
      Excluir_TalaoAux;
      fConsLoteExp.tLote.Next;
    end;
end;

procedure TfTalaoAuxiliar.SMDBGrid3GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not tTalaoAuxiliarlkImpTalao.AsBoolean then
    Background := clYellow;
end;

procedure TfTalaoAuxiliar.BitBtn2Click(Sender: TObject);
begin
  DM1.tProduto.IndexFieldNames := 'Codigo';
  fRelTalaoAuxiliarLote := TfRelTalaoAuxiliarLote.Create(Self);
  fRelTalaoAuxiliarLote.RLReport1.PreviewModal;
  FreeAndNil(fRelTalaoAuxiliarLote.RLReport1);
  FreeAndNil(fRelTalaoAuxiliarLote);
end;

end.

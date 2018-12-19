unit UPrevPre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DB, DBTables, ShellApi;

type
  TfPrevPre = class(TForm)
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
    tAuxPre: TTable;
    tAuxPreConstrucao: TStringField;
    tAuxPreCarimbo: TStringField;
    tAuxPreCodMaterial: TIntegerField;
    tAuxPreCodPosicao: TIntegerField;
    tAuxPreCodCor: TIntegerField;
    tAuxPreLargura: TStringField;
    tAuxPreQtdPar: TIntegerField;
    tAuxPrelkMaterial: TStringField;
    tAuxPrelkCor: TStringField;
    tAuxPreConsumo: TFloatField;
    tAuxPrelkPosicao: TStringField;
    dsAuxPre: TDataSource;
    tAuxPreGrade: TTable;
    tAuxPreGradeConstrucao: TStringField;
    tAuxPreGradeCarimbo: TStringField;
    tAuxPreGradeCodMaterial: TIntegerField;
    tAuxPreGradeCodPosicao: TIntegerField;
    tAuxPreGradeCodCor: TIntegerField;
    tAuxPreGradeLargura: TStringField;
    tAuxPreGradeTamanho: TStringField;
    tAuxPreGradeQtdPar: TIntegerField;
    tAuxPreGradeMarcarTam: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Gera_Dados;
    procedure Limpa_Tabela;
    procedure Imprimir_Pre;
    procedure Imprime_Cabecalho;
    procedure Imprime_Detalhe;
    procedure Imprime_Rodape;
  public
    { Public declarations }
  end;

var
  fPrevPre: TfPrevPre;
  linha, pagina, vTotalPrs : Integer;
  F: TextFile;
  Texto : String;

implementation

uses UDM1, UEscImpressora, UDM2;

{$R *.DFM}

procedure TfPrevPre.Limpa_Tabela;
begin
  tAuxPre.First;
  while not tAuxPre.Eof do
    begin
      tAuxPreGrade.First;
      while not tAuxPreGrade.Eof do
        tAuxPreGrade.Delete;
      tAuxPre.Delete;
    end;
end;

procedure TfPrevPre.Gera_Dados;
var
 vTamMaterial, vMarcarTam : String[3];
begin
  Limpa_Tabela;
  Case RadioGroup1.ItemIndex of
    0 : begin
          DM1.tLotePedidoMI.First;
          while not DM1.tLotePedidoMI.Eof do
            begin
              DM1.tPedido.Filtered     := False;
              DM1.tPedido.Filter       := 'Pedido = '''+IntToStr(DM1.tLotePedidoMIPedido.AsInteger)+''' and Cancelado <> True and Suspenso <> True';
              DM1.tPedido.Filtered     := True;
              DM1.tPedidoItem.Filtered := False;
              DM1.tPedidoItem.Filter   := 'Cancelado <> True';
              DM1.tPedidoItem.Filtered := True;
              DM1.tPedidoItem.First;
              while not DM1.tPedidoItem.Eof do
                begin
                  DM1.tPedidoMaterial.First;
                  while not DM1.tPedidoMaterial.Eof do
                    begin
                      if DM1.tPedidoMateriallkPre.AsBoolean then
                        begin
                          tAuxPre.SetKey;
                          tAuxPreConstrucao.AsString   := DM1.tPedidoItemlkConstrucao.AsString;
                          if CheckBox1.Checked then
                            begin
                              if DM1.tPedidoCarimbo.AsString <> DM1.tParametrosCarimbo.AsString then
                                tAuxPreCarimbo.AsString := 'SEM CARIMBO'
                              else
                                tAuxPreCarimbo.AsString := DM1.tParametrosCarimbo.AsString;
                            end
                          else
                            tAuxPreCarimbo.AsString := '';
                          tAuxPreCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                          if DM1.tPedidoMaterialCodPosicao.AsInteger > 0 then
                            tAuxPreCodPosicao.AsInteger  := DM1.tPedidoMaterialCodPosicao.AsInteger
                          else
                            tAuxPreCodPosicao.AsInteger  := 0;
                          tAuxPreCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
                          tAuxPreLargura.AsString      := DM1.tPedidoItemlkLargura.AsString;
                          if tAuxPre.GotoKey then
                            begin
                              tAuxPre.Edit;
                              tAuxPreQtdPar.AsInteger   := tAuxPreQtdPar.AsInteger + DM1.tPedidoItemQtdPares.AsInteger;
                              tAuxPreConsumo.AsFloat    := tAuxPreConsumo.AsFloat + (DM1.tPedidoItemQtdPares.AsFloat * DM1.tPedidoMaterialConsumoPr.AsFloat);
                              DM1.tMaterial.IndexFieldNames := 'Codigo';
                              DM1.tMaterial.SetKey;
                              DM1.tMaterialCodigo.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                              if DM1.tMaterial.GotoKey then
                                begin
                                  DM1.tPedidoGrade.First;
                                  while not DM1.tPedidoGrade.Eof do
                                    begin
                                      vTamMaterial := DM1.tPedidoGradelkTamanho.AsString;
                                      vMarcarTam   := DM1.tPedidoGradelkMarcarTam.AsString;
                                      if DM1.tMaterialCodGrade.AsInteger > 0 then
                                        begin
                                          DM1.tMaterialGradeNum.SetKey;
                                          DM1.tMaterialGradeNumCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                                          DM1.tMaterialGradeNumCodGrade.AsInteger    := DM1.tPedidoGradeCodGrade.AsInteger;
                                          DM1.tMaterialGradeNumPosicao.AsInteger     := DM1.tPedidoGradePosicao.AsInteger;
                                          if DM1.tMaterialGradeNum.GotoKey then
                                            vTamMaterial := DM1.tMaterialGradeNumTamMaterial.AsString;
                                        end;
                                      if DM1.tMaterialTipoMat.AsString <> 'S' then
                                        vMarcarTam   := '';
                                      tAuxPreGrade.SetKey;
                                      tAuxPreGradeConstrucao.AsString   := DM1.tPedidoItemlkConstrucao.AsString;
                                      tAuxPreGradeCarimbo.AsString      := tAuxPreCarimbo.AsString;
                                      tAuxPreGradeCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                                      tAuxPreGradeCodPosicao.AsInteger  := tAuxPreCodPosicao.AsInteger;
                                      tAuxPreGradeCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
                                      tAuxPreGradeLargura.AsString      := DM1.tPedidoItemlkLargura.AsString;
                                      tAuxPreGradeTamanho.AsString      := vTamMaterial;
                                      if tAuxPreGrade.GotoKey then
                                        begin
                                          tAuxPreGrade.Edit;
                                          tAuxPreGradeQtdPar.AsInteger := tAuxPreGradeQtdPar.AsInteger + DM1.tPedidoGradeQtd.AsInteger;
                                          tAuxPreGrade.Post;
                                        end
                                      else
                                        begin
                                          tAuxPreGrade.Insert;
                                          tAuxPreGradeConstrucao.AsString   := DM1.tPedidoItemlkConstrucao.AsString;
                                          tAuxPreGradeCarimbo.AsString      := tAuxPreCarimbo.AsString;
                                          tAuxPreGradeCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                                          tAuxPreGradeCodPosicao.AsInteger  := tAuxPreCodPosicao.AsInteger;
                                          tAuxPreGradeCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
                                          tAuxPreGradeLargura.AsString      := DM1.tPedidoItemlkLargura.AsString;
                                          tAuxPreGradeTamanho.AsString      := vTamMaterial;
                                          tAuxPreGradeMarcarTam.AsString    := vMarcarTam;
                                          tAuxPreGradeQtdPar.AsInteger      := tAuxPreGradeQtdPar.AsInteger + DM1.tPedidoGradeQtd.AsInteger;
                                          tAuxPreGrade.Post;
                                        end;
                                      DM1.tPedidoGrade.Next;
                                    end;
                                end;
                              tAuxPre.Post;
                            end
                          else
                            begin
                              tAuxPre.Insert;
                              tAuxPreConstrucao.AsString   := DM1.tPedidoItemlkConstrucao.AsString;
                              if CheckBox1.Checked then
                                begin
                                  if DM1.tPedidoCarimbo.AsString <> DM1.tParametrosCarimbo.AsString then
                                    tAuxPreCarimbo.AsString := 'SEM CARIMBO'
                                  else
                                    tAuxPreCarimbo.AsString := DM1.tParametrosCarimbo.AsString;
                                end
                              else
                                tAuxPreCarimbo.AsString := '';
                              tAuxPreCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                              if DM1.tPedidoMaterialCodPosicao.AsInteger > 0 then
                                tAuxPreCodPosicao.AsInteger := DM1.tPedidoMaterialCodPosicao.AsInteger
                              else
                                tAuxPreCodPosicao.AsInteger := 0;
                              tAuxPreCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
                              tAuxPreLargura.AsString      := DM1.tPedidoItemlkLargura.AsString;
                              tAuxPreQtdPar.AsInteger      := DM1.tPedidoItemQtdPares.AsInteger;
                              tAuxPreConsumo.AsFloat       := DM1.tPedidoItemQtdPares.AsFloat * DM1.tPedidoMaterialConsumoPr.AsFloat;
                              DM1.tMaterial.IndexFieldNames := 'Codigo';
                              DM1.tMaterial.SetKey;
                              DM1.tMaterialCodigo.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                              if DM1.tMaterial.GotoKey then
                                begin
                                  DM1.tPedidoGrade.First;
                                  while not DM1.tPedidoGrade.Eof do
                                    begin
                                      vTamMaterial := DM1.tPedidoGradelkTamanho.AsString;
                                      vMarcarTam   := DM1.tPedidoGradelkMarcarTam.AsString;
                                      if DM1.tMaterialCodGrade.AsInteger > 0 then
                                        begin
                                          DM1.tMaterialGradeNum.SetKey;
                                          DM1.tMaterialGradeNumCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                                          DM1.tMaterialGradeNumCodGrade.AsInteger    := DM1.tPedidoGradeCodGrade.AsInteger;
                                          DM1.tMaterialGradeNumPosicao.AsInteger     := DM1.tPedidoGradePosicao.AsInteger;
                                          if DM1.tMaterialGradeNum.GotoKey then
                                            begin
                                              vTamMaterial := DM1.tMaterialGradeNumTamMaterial.AsString;
                                              vMarcarTam   := '';
                                            end;
                                        end;
                                      tAuxPreGrade.SetKey;
                                      tAuxPreGradeConstrucao.AsString   := DM1.tPedidoItemlkConstrucao.AsString;
                                      tAuxPreGradeCarimbo.AsString      := tAuxPreCarimbo.AsString;
                                      tAuxPreGradeCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                                      tAuxPreGradeCodPosicao.AsInteger  := tAuxPreCodPosicao.AsInteger;
                                      tAuxPreGradeCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
                                      tAuxPreGradeLargura.AsString      := DM1.tPedidoItemlkLargura.AsString;
                                      tAuxPreGradeTamanho.AsString      := vTamMaterial;
                                      if tAuxPreGrade.GotoKey then
                                        begin
                                          tAuxPreGrade.Edit;
                                          tAuxPreGradeQtdPar.AsInteger := tAuxPreGradeQtdPar.AsInteger + DM1.tPedidoGradeQtd.AsInteger;
                                          tAuxPreGrade.Post;
                                        end
                                      else
                                        begin
                                          tAuxPreGrade.Insert;
                                          tAuxPreGradeConstrucao.AsString   := DM1.tPedidoItemlkConstrucao.AsString;
                                          tAuxPreGradeCarimbo.AsString      := tAuxPreCarimbo.AsString;
                                          tAuxPreGradeCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                                          tAuxPreGradeCodPosicao.AsInteger  := tAuxPreCodPosicao.AsInteger;
                                          tAuxPreGradeCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
                                          tAuxPreGradeLargura.AsString      := DM1.tPedidoItemlkLargura.AsString;
                                          tAuxPreGradeTamanho.AsString      := vTamMaterial;
                                          tAuxPreGradeMarcarTam.AsString    := vMarcarTam;
                                          tAuxPreGradeQtdPar.AsInteger      := tAuxPreGradeQtdPar.AsInteger + DM1.tPedidoGradeQtd.AsInteger;
                                          tAuxPreGrade.Post;
                                        end;
                                      DM1.tPedidoGrade.Next;
                                    end;
                                end;
                              tAuxPre.Post;
                            end;
                        end;
                      DM1.tPedidoMaterial.Next;
                    end;
                  DM1.tPedidoItem.Next;
                end;
              DM1.tPedido.Filtered     := False;
              DM1.tPedidoItem.Filtered := False;
              DM1.tLotePedidoMI.Next
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
              DM1.tPedido.IndexFieldNames := 'Pedido';
              DM1.tPedido.SetKey;
              DM1.tPedidoPedido.AsInteger := DM1.tLoteNroPedido.AsInteger;
              if DM1.tPedido.GotoKey then
                begin
                  DM1.tPedidoItem.SetKey;
                  DM1.tPedidoItemPedido.AsInteger := DM1.tLoteNroPedido.AsInteger;
                  DM1.tPedidoItemItem.AsInteger   := DM1.tLoteItemPed.AsInteger;
                  if DM1.tPedidoItem.GotoKey then
                    begin
                      DM1.tTalao.First;
                      while not DM1.tTalao.Eof do
                        begin
                          DM1.tPedidoMaterial.First;
                          while not DM1.tPedidoMaterial.Eof do
                            begin
                              if DM1.tPedidoMateriallkPre.AsBoolean then
                                begin
                                  tAuxPre.SetKey;
                                  tAuxPreConstrucao.AsString   := DM1.tPedidoItemlkConstrucao.AsString;
                                  if CheckBox1.Checked then
                                    begin
                                      if DM1.tPedidoCarimbo.AsString <> DM1.tParametrosCarimbo.AsString then
                                        tAuxPreCarimbo.AsString := 'SEM CARIMBO'
                                      else
                                        tAuxPreCarimbo.AsString := DM1.tParametrosCarimbo.AsString;
                                    end
                                  else
                                    tAuxPreCarimbo.AsString := '';
                                  tAuxPreCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                                  if DM1.tPedidoMaterialCodPosicao.AsInteger > 0 then
                                    tAuxPreCodPosicao.AsInteger := DM1.tPedidoMaterialCodPosicao.AsInteger
                                  else
                                    tAuxPreCodPosicao.AsInteger := 0;
                                  tAuxPreCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
                                  tAuxPreLargura.AsString      := DM1.tPedidoItemlkLargura.AsString;
                                  if tAuxPre.GotoKey then
                                    begin
                                      tAuxPre.Edit;
                                      tAuxPreQtdPar.AsInteger   := tAuxPreQtdPar.AsInteger + DM1.tTalaoQtdPar.AsInteger;
                                      tAuxPreConsumo.AsFloat    := tAuxPreConsumo.AsFloat + (DM1.tTalaoQtdPar.AsInteger * DM1.tPedidoMaterialConsumoPr.AsFloat);
                                      DM1.tMaterial.IndexFieldNames := 'Codigo';
                                      DM1.tMaterial.SetKey;
                                      DM1.tMaterialCodigo.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                                      if DM1.tMaterial.GotoKey then
                                        begin
                                          DM1.tTalaoGrade.First;
                                          while not DM1.tTalaoGrade.Eof do
                                            begin
                                              if DM1.tMaterialCodGrade.AsInteger > 0 then
                                                begin
                                                  DM1.tMaterialGradeNum.SetKey;
                                                  DM1.tMaterialGradeNumCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                                                  DM1.tMaterialGradeNumCodGrade.AsInteger    := DM1.tTalaoGradeCodGrade.AsInteger;
                                                  DM1.tMaterialGradeNumPosicao.AsInteger     := DM1.tTalaoGradePosicao.AsInteger;
                                                  if DM1.tMaterialGradeNum.GotoKey then
                                                    vTamMaterial := DM1.tMaterialGradeNumTamMaterial.AsString
                                                  else
                                                    vTamMaterial := DM1.tTalaoGradelkTamanho.AsString;
                                                end
                                              else
                                                vTamMaterial := DM1.tTalaoGradelkTamanho.AsString;
                                              tAuxPreGrade.SetKey;
                                              tAuxPreGradeConstrucao.AsString   := DM1.tPedidoItemlkConstrucao.AsString;
                                              tAuxPreGradeCarimbo.AsString      := tAuxPreCarimbo.AsString;
                                              tAuxPreGradeCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                                              tAuxPreGradeCodPosicao.AsInteger  := tAuxPreCodPosicao.AsInteger;
                                              tAuxPreGradeCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
                                              tAuxPreGradeLargura.AsString      := DM1.tPedidoItemlkLargura.AsString;
                                              tAuxPreGradeTamanho.AsString      := vTamMaterial;
                                              if tAuxPreGrade.GotoKey then
                                                begin
                                                  tAuxPreGrade.Edit;
                                                  tAuxPreGradeQtdPar.AsInteger := tAuxPreGradeQtdPar.AsInteger + DM1.tTalaoGradeQtdPar.AsInteger;
                                                  tAuxPreGrade.Post;
                                                end
                                              else
                                                begin
                                                  tAuxPreGrade.Insert;
                                                  tAuxPreGradeConstrucao.AsString   := DM1.tPedidoItemlkConstrucao.AsString;
                                                  tAuxPreGradeCarimbo.AsString      := tAuxPreCarimbo.AsString;
                                                  tAuxPreGradeCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                                                  tAuxPreGradeCodPosicao.AsInteger  := tAuxPreCodPosicao.AsInteger;
                                                  tAuxPreGradeCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
                                                  tAuxPreGradeLargura.AsString      := DM1.tPedidoItemlkLargura.AsString;
                                                  tAuxPreGradeTamanho.AsString      := vTamMaterial;
                                                  tAuxPreGradeQtdPar.AsInteger      := tAuxPreGradeQtdPar.AsInteger + DM1.tTalaoGradeQtdPar.AsInteger;
                                                  tAuxPreGrade.Post;
                                                end;
                                              DM1.tTalaoGrade.Next;
                                            end;
                                        end;
                                      tAuxPre.Post;
                                    end
                                  else
                                    begin
                                      tAuxPre.Insert;
                                      tAuxPreConstrucao.AsString   := DM1.tPedidoItemlkConstrucao.AsString;
                                      if CheckBox1.Checked then
                                        begin
                                          if DM1.tPedidoCarimbo.AsString <> DM1.tParametrosCarimbo.AsString then
                                            tAuxPreCarimbo.AsString := 'SEM CARIMBO'
                                          else
                                            tAuxPreCarimbo.AsString := DM1.tParametrosCarimbo.AsString;
                                        end
                                      else
                                        tAuxPreCarimbo.AsString := '';
                                      tAuxPreCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                                      if DM1.tPedidoMaterialCodPosicao.AsInteger > 0 then
                                        tAuxPreCodPosicao.AsInteger := DM1.tPedidoMaterialCodPosicao.AsInteger
                                      else
                                        tAuxPreCodPosicao.AsInteger := 0;
                                      tAuxPreCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
                                      tAuxPreLargura.AsString      := DM1.tPedidoItemlkLargura.AsString;
                                      tAuxPreQtdPar.AsInteger      := DM1.tTalaoQtdPar.AsInteger;
                                      tAuxPreConsumo.AsFloat       := DM1.tTalaoQtdPar.AsFloat * DM1.tPedidoMaterialConsumoPr.AsFloat;
                                      DM1.tMaterial.IndexFieldNames    := 'Codigo';
                                      DM1.tMaterial.SetKey;
                                      DM1.tMaterialCodigo.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                                      if DM1.tMaterial.GotoKey then
                                        begin
                                          DM1.tTalaoGrade.First;
                                          while not DM1.tTalaoGrade.Eof do
                                            begin
                                              if DM1.tMaterialCodGrade.AsInteger > 0 then
                                                begin
                                                  DM1.tMaterialGradeNum.SetKey;
                                                  DM1.tMaterialGradeNumCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                                                  DM1.tMaterialGradeNumCodGrade.AsInteger    := DM1.tTalaoGradeCodGrade.AsInteger;
                                                  DM1.tMaterialGradeNumPosicao.AsInteger     := DM1.tTalaoGradePosicao.AsInteger;
                                                  if DM1.tMaterialGradeNum.GotoKey then
                                                    vTamMaterial := DM1.tMaterialGradeNumTamMaterial.AsString
                                                  else
                                                    vTamMaterial := DM1.tTalaoGradelkTamanho.AsString;
                                                end
                                              else
                                                vTamMaterial := DM1.tTalaoGradelkTamanho.AsString;
                                              tAuxPreGrade.SetKey;
                                              tAuxPreGradeConstrucao.AsString   := DM1.tPedidoItemlkConstrucao.AsString;
                                              tAuxPreGradeCarimbo.AsString      := tAuxPreCarimbo.AsString;
                                              tAuxPreGradeCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                                              tAuxPreGradeCodPosicao.AsInteger  := tAuxPreCodPosicao.AsInteger;
                                              tAuxPreGradeCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
                                              tAuxPreGradeLargura.AsString      := DM1.tPedidoItemlkLargura.AsString;
                                              tAuxPreGradeTamanho.AsString      := vTamMaterial;
                                              if tAuxPreGrade.GotoKey then
                                                begin
                                                  tAuxPreGrade.Edit;
                                                  tAuxPreGradeQtdPar.AsInteger := tAuxPreGradeQtdPar.AsInteger + DM1.tTalaoGradeQtdPar.AsInteger;
                                                  tAuxPreGrade.Post;
                                                end
                                              else
                                                begin
                                                  tAuxPreGrade.Insert;
                                                  tAuxPreGradeConstrucao.AsString   := DM1.tPedidoItemlkConstrucao.AsString;
                                                  tAuxPreGradeCarimbo.AsString      := tAuxPreCarimbo.AsString;
                                                  tAuxPreGradeCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                                                  tAuxPreGradeCodPosicao.AsInteger  := tAuxPreCodPosicao.AsInteger;
                                                  tAuxPreGradeCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
                                                  tAuxPreGradeLargura.AsString      := DM1.tPedidoItemlkLargura.AsString;
                                                  tAuxPreGradeTamanho.AsString      := vTamMaterial;
                                                  tAuxPreGradeQtdPar.AsInteger      := tAuxPreGradeQtdPar.AsInteger + DM1.tTalaoGradeQtdPar.AsInteger;
                                                  tAuxPreGrade.Post;
                                                end;
                                              DM1.tTalaoGrade.Next;
                                            end;
                                        end;
                                      tAuxPre.Post;
                                    end;
                                end;
                              DM1.tPedidoMaterial.Next;
                            end;
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

procedure TfPrevPre.Imprime_Cabecalho;
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

procedure TfPrevPre.Imprime_Detalhe;
var
  texto1, texto2, texto3, texto4, texto5 : String;
  i : Integer;
  ImpMarcar : Boolean;
begin
  texto2 := copy(tAuxPreConstrucao.AsString,1,20);
  for i := 1 to 21 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto2;
  texto2 := tAuxPreCarimbo.AsString;
  for i := 1 to 13 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;
  texto2 := Copy(tAuxPrelkMaterial.AsString,1,33) + '/';
  Texto2 := Texto2 + Copy(tAuxPrelkPosicao.AsString,1,20);
  for i := 1 to 55 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;
  texto2 := tAuxPrelkCor.AsString;
  for i := 1 to 18 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;
  texto2 := IntToStr(tAuxPreQtdPar.AsInteger);
  for i := 1 to 11 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2;
  texto2 := FormatFloat('###,##0.00000',tAuxPreConsumo.AsFloat);
  for i := 1 to 14 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  Texto1 := Texto1 + Texto2;
  writeln(F,Texto1);
  linha := linha + 1;

  ImpMarcar := False;
  if tAuxPreLargura.AsString <> '' then
    texto2 := ' Larg: ' + tAuxPreLargura.AsString +  '  Produzir: '
  else
    texto2 := '          Produzir: ';
  texto4 := '            Marcar: ';
  texto3 := '        Quantidade: ';
  tAuxPreGrade.First;
  while not tAuxPreGrade.EOF do
    begin
      if tAuxPreGradeQtdPar.AsInteger > 0 then
        begin
          texto5 := tAuxPreGradeTamanho.AsString;
          for i := 1 to 4 - length(texto5) do
            texto5 := ' ' + texto5;
          texto2 := texto2 + texto5 + '  ';

          if tAuxPreGradeMarcarTam.AsString <> '' then
            ImpMarcar := True;

          texto5 := tAuxPreGradeMarcarTam.AsString;
          for i := 1 to 4 - length(texto5) do
            texto5 := ' ' + texto5;
          texto4 := texto4 + texto5 + '  ';

          texto5 := tAuxPreGradeQtdPar.AsString;
          for i := 1 to 4 - length(tAuxPreGradeQtdPar.AsString) do
            texto5 := ' ' + texto5;
          texto3 := texto3 + texto5 + '  ';
        end;
      tAuxPreGrade.Next
    end;
  writeln(F, texto2);
  if ImpMarcar then
    writeln(F, texto4);
  writeln(F, texto3);
  linha := linha + 2;
end;

procedure TfPrevPre.Imprime_Rodape;
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

procedure TfPrevPre.Imprimir_Pre;
begin
  fEscImpressora := TfEscImpressora.Create(Self);
  fEscImpressora.ShowModal;
  linha  := 99;
  pagina := 0;
  AssignFile(F,DM1.tImpressoraEndereco.AsString);
  ReWrite(F);
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#15);
  tAuxPre.First;
  while not tAuxPre.EOF do
    begin
      if linha > 30 then
        Imprime_Cabecalho;
      Imprime_Detalhe;
      tAuxPre.Next;
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

procedure TfPrevPre.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TfPrevPre.BitBtn2Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 0;
  Edit1.Clear;
  Edit2.Clear;
  RadioGroup1.SetFocus;
end;

procedure TfPrevPre.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevPre.BitBtn1Click(Sender: TObject);
begin
  if Edit1.Text <> '' then
    begin
      Case RadioGroup1.ItemIndex of
        0 : begin
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
            end;
        1 : begin
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
    end
  else
    begin
      ShowMessage('Deve ser informado um Lote p/ gerar o relatório!');
      Edit1.SetFocus;
    end;
end;

procedure TfPrevPre.RadioGroup1Click(Sender: TObject);
begin
  Case RadioGroup1.ItemIndex of
    0 : Edit2.Enabled := False;
    1 : Edit2.Enabled := True;
  end;
end;

procedure TfPrevPre.FormShow(Sender: TObject);
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
end;

end.

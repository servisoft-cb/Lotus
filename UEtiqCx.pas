unit UEtiqCx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DbTables, Db, MemTable, Variants;

type
  TfEtiqCx = class(TForm)
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
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
    Edit5: TEdit;
    Edit6: TEdit;
    Label7: TLabel;
    Edit7: TEdit;
    Panel5: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    RadioGroup2: TRadioGroup;
    mEtiqueta: TMemoryTable;
    msEtiqueta: TDataSource;
    mEtiquetaMaterial: TStringField;
    mEtiquetaReferencia: TStringField;
    mEtiquetaTamanho: TStringField;
    mEtiquetaCodProduto: TIntegerField;
    mEtiquetaCodCor: TIntegerField;
    mEtiquetaPedido: TIntegerField;
    mEtiquetaLote: TIntegerField;
    mEtiquetaItem: TIntegerField;
    mEtiquetaEndEtiqueta: TStringField;
    mEtiquetalkCor: TStringField;
    mEtiquetaConstrucao: TStringField;
    mEtiquetaNomeModelo: TStringField;
    RadioGroup3: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioGroup1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Limpa_Edit;
    procedure Gravar_mEtiqueta(Lote, Item : Integer);
  public
    { Public declarations }
  end;

var
  fEtiqCx: TfEtiqCx;

implementation

uses UDM1, URelEtiqCx, UAgendaTelef;

{$R *.DFM}

procedure TfEtiqCx.Limpa_Edit;
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  Edit6.Clear;
  Edit7.Clear;
end;

procedure TfEtiqCx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Dm1.tLoteMI.Close;
  Dm1.tLotePedidoMI.Close;
  Dm1.tPedido.Close;
  Dm1.tPedidoItem.Close;
  Dm1.tPedidoGrade.Close;
  Dm1.tTalaoMI.Close;
  DM1.tTalaoGradeMI.Close;
  Dm1.tTalao.Close;
  DM1.tTalaoGrade.Close;
  Dm1.tLote.Close;
  Dm1.tLotePedido.Close;
  DM1.tProduto.Close;
  DM1.tGrade.Close;
  DM1.tGradeItem.Close;
  DM1.tCor.Close;
  DM1.tMaterial.Close;

  Action := Cafree;
end;

procedure TfEtiqCx.RadioGroup1Exit(Sender: TObject);
begin
  Case RadioGroup1.ItemIndex of
    0 : begin
          Limpa_Edit;
          RadioGroup2.Enabled := True;
          Panel2.Enabled      := True;
          Panel3.Enabled      := False;
          Panel4.Enabled      := False;
        end;
    1 : begin
          Limpa_Edit;
          RadioGroup2.Enabled := False;
          Panel2.Enabled      := False;
          Panel3.Enabled      := True;
          Panel4.Enabled      := False;
          Edit3.SetFocus;
        end;
    2 : begin
          Limpa_Edit;
          RadioGroup2.Enabled := False;
          Panel2.Enabled      := False;
          Panel3.Enabled      := False;
          Panel4.Enabled      := True;
          Edit5.SetFocus;
        end;
  end;
end;

procedure TfEtiqCx.BitBtn2Click(Sender: TObject);
begin
  Limpa_Edit;
  RadioGroup1.ItemIndex := 0;
  RadioGroup2.ItemIndex := 0;
  RadioGroup1.SetFocus;
end;

procedure TfEtiqCx.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfEtiqCx.BitBtn1Click(Sender: TObject);
var
  i : Integer;
begin
  mEtiqueta.EmptyTable;
  Case RadioGroup1.ItemIndex of
    0 : begin
          if (Edit1.Text <> '') and (Edit2.Text <> '') then
            begin
              Case RadioGroup2.ItemIndex of
                0 : begin
                      Screen.Cursor        := crHourGlass;
                      DM1.tLoteMI.Filtered := False;
                      DM1.tLoteMI.Filter   := 'Lote >= '''+Edit1.Text+''' and Lote <= '''+Edit2.Text+'''';
                      DM1.tLoteMI.Filtered := True;
                      DM1.tLoteMI.First;
                      while not DM1.tLoteMI.Eof do
                        begin
                          DM1.tLotePedidoMI.First;
                          while not DM1.tLotePedidoMI.Eof do
                            begin
                              DM1.tPedido.Filtered := False;
                              DM1.tPedido.Filter   := 'Pedido = '''+IntToStr(DM1.tLotePedidoMIPedido.AsInteger)+''' and Cancelado <> True and Suspenso <> True';
                              DM1.tPedido.Filtered := True;
                              DM1.tPedido.First;
                              while not DM1.tPedido.Eof do
                                begin
                                  DM1.tPedidoItem.Filtered := False;
                                  DM1.tPedidoItem.Filter   := 'Cancelado <> True';
                                  DM1.tPedidoItem.Filtered := True;
                                  DM1.tPedidoItem.First;
                                  while not DM1.tPedidoItem.Eof do
                                    begin
                                      DM1.tLoteMI.FindKey([DM1.tPedidoNumLote.AsInteger]);
                                      DM1.tTalaoMI.Locate('NumPedido;ItemPedido',VarArrayOf([DM1.tPedidoItemPedido.AsInteger,DM1.tPedidoItemItem.AsInteger]),[locaseinsensitive]);
                                      DM1.tPedidoGrade.First;
                                      while not DM1.tPedidoGrade.Eof do
                                      begin
                                        Gravar_mEtiqueta(DM1.tTalaoMILote.AsInteger,DM1.tTalaoMIItem.AsInteger);
                                        DM1.tPedidoGrade.Next;
                                      end;
                                      DM1.tPedidoItem.Next;
                                    end;
                                  DM1.tPedido.Next;
                                end;
                              DM1.tLotePedidoMI.Next;
                            end;
                          DM1.tLoteMI.Next;
                        end;
                      Screen.Cursor := crDefault;
                    end;
                1 : begin
                      Screen.Cursor      := crHourGlass;
                      DM1.tLote.Filtered := False;
                      DM1.tLote.Filter   := 'Lote >= '''+Edit1.Text+''' and Lote <= '''+Edit2.Text+'''';
                      DM1.tLote.Filtered := True;
                      DM1.tLote.First;
                      while not DM1.tLote.Eof do
                      begin
                        DM1.tLotePedido.First;
                        while not DM1.tLotePedido.Eof do
                        begin
                          DM1.tPedido.Filtered := False;
                          DM1.tPedido.Filter   := 'Pedido = '''+IntToStr(DM1.tLotePedidoPedido.AsInteger)+''' and Cancelado <> True and Suspenso <> True';
                          DM1.tPedido.Filtered := True;
                          DM1.tPedido.First;
                          while not DM1.tPedido.Eof do
                          begin
                            DM1.tPedidoItem.Filtered := False;
                            DM1.tPedidoItem.Filter   := 'Item = '''+IntToStr(DM1.tLotePedidoItemPedido.AsInteger)+''' and Cancelado <> True';
                            DM1.tPedidoItem.Filtered := True;
                            DM1.tPedidoItem.First;
                            while not DM1.tPedidoItem.Eof do
                            begin
                              DM1.tPedidoGrade.First;
                              while not DM1.tPedidoGrade.Eof do
                              begin
                                Gravar_mEtiqueta(DM1.tLoteLote.AsInteger,DM1.tLoteItemPed.AsInteger);
                                DM1.tPedidoGrade.Next;
                              end;
                              DM1.tPedidoItem.Next;
                            end;
                            DM1.tPedido.Next;
                          end;
                          DM1.tLotePedido.Next;
                        end;
                        DM1.tLote.Next;
                      end;
                      Screen.Cursor := crDefault;
                    end;
              end;
            end
          else
            begin
              ShowMessage('Deve ser informado Lotes "Inicial" e "Final" p/ gerar as etiquetas!');
              Edit1.SetFocus;
            end;
        end;
    1 : begin
          if (Edit3.Text <> '') and (Edit4.Text <> '') then
            begin
              Screen.Cursor        := crHourGlass;
              DM1.tPedido.Filtered := False;
              DM1.tPedido.Filter   := 'Pedido >= '''+Edit3.Text+''' and Pedido <= '''+Edit4.Text+''' and Cancelado <> True and Suspenso <> True';
              DM1.tPedido.Filtered := True;
              DM1.tPedido.First;
              while not DM1.tPedido.Eof do
                begin
                  DM1.tPedidoItem.Filtered := False;
                  DM1.tPedidoItem.Filter   := 'Cancelado <> True';
                  DM1.tPedidoItem.Filtered := True;
                  DM1.tPedidoItem.First;
                  while not DM1.tPedidoItem.Eof do
                    begin
                      DM1.tLoteMI.FindKey([DM1.tPedidoNumLote.AsInteger]);
                      DM1.tTalaoMI.Locate('NumPedido;ItemPedido',VarArrayOf([DM1.tPedidoItemPedido.AsInteger,DM1.tPedidoItemItem.AsInteger]),[locaseinsensitive]);
                      DM1.tPedidoGrade.First;
                      while not DM1.tPedidoGrade.Eof do
                        begin
                          Gravar_mEtiqueta(DM1.tTalaoMILote.AsInteger,DM1.tTalaoMIItem.AsInteger);
                          DM1.tPedidoGrade.Next;
                        end;
                      DM1.tPedidoItem.Next;
                    end;
                  DM1.tPedido.Next;
                end;
              Screen.Cursor := crDefault;
            end
          else
            begin
              ShowMessage('Deve ser informado Pedidos "Inicial" e "Final" p/ gerar as etiquetas!');
              Edit3.SetFocus;
            end;
        end;
    2 : begin
          if (Edit5.Text <> '') and (Edit6.Text <> '') then
          begin
            Screen.Cursor        := crHourGlass;
            DM1.tPedido.Filtered := False;
            DM1.tPedido.Filter   := 'Pedido = '''+Edit5.Text+''' and Cancelado = False and Suspenso = False';
            DM1.tPedido.Filtered := True;
            DM1.tPedido.First;
            while not DM1.tPedido.Eof do
            begin
              DM1.tPedidoItem.Filtered := False;
              DM1.tPedidoItem.Filter   := 'Item = '''+Edit6.Text+''' and Cancelado = False';
              DM1.tPedidoItem.Filtered := True;
              DM1.tPedidoItem.First;
              while not DM1.tPedidoItem.Eof do
              begin
                DM1.tLoteMI.FindKey([DM1.tPedidoNumLote.AsInteger]);
                DM1.tTalaoMI.Locate('NumPedido;ItemPedido',VarArrayOf([DM1.tPedidoItemPedido.AsInteger,DM1.tPedidoItemItem.AsInteger]),[locaseinsensitive]);
                if Edit7.Text <> '' then
                begin
                  DM1.tPedidoGrade.First;
                   while not DM1.tPedidoGrade.Eof do
                   begin
                     DM1.tGradeItemlk.IndexFieldNames   := 'CodGrade;Posicao';
                     DM1.tGradeItemlk.SetKey;
                     DM1.tGradeItemlkCodGrade.AsInteger := DM1.tPedidoGradeCodGrade.AsInteger;
                     DM1.tGradeItemlkPosicao.AsInteger  := DM1.tPedidoGradePosicao.AsInteger;
                     if (DM1.tGradeItemlk.GotoKey) and (DM1.tGradeItemlkTamanho.AsString = Edit7.text) then
                       Gravar_mEtiqueta(DM1.tTalaoMILote.AsInteger,DM1.tTalaoMIItem.AsInteger);
                     DM1.tPedidoGrade.Next;
                   end;
                end
                else
                begin
                  DM1.tPedidoGrade.First;
                  while not DM1.tPedidoGrade.Eof do
                  begin
                    Gravar_mEtiqueta(DM1.tTalaoMILote.AsInteger,DM1.tTalaoMIItem.AsInteger);
                    DM1.tPedidoGrade.Next;
                  end;
                end;
                DM1.tPedidoItem.Next;
              end;
              DM1.tPedido.Next;
            end;
            Screen.Cursor := crDefault;
          end
          else
          begin
            ShowMessage('Deve ser informado Pedido e Item p/ gerar as etiquetas!');
            Edit5.SetFocus;
          end;
        end;
  end;
  fRelEtiqCx := TfRelEtiqCx.Create(Self);
  fRelEtiqCx.QuickRep1.Print;
  fRelEtiqCx.QuickRep1.Free;
  FreeAndNil(fRelEtiqCx);
  DM1.tLoteMI.Filtered     := False;
  DM1.tLote.Filtered       := False;
  DM1.tPedido.Filtered     := False;
  DM1.tPedidoItem.Filtered := False;
end;

procedure TfEtiqCx.RadioGroup1Click(Sender: TObject);
begin
  Limpa_Edit;
  RadioGroup2.Enabled := (RadioGroup1.ItemIndex = 0);
  Panel2.Enabled      := (RadioGroup1.ItemIndex = 0);
  Panel3.Enabled      := (RadioGroup1.ItemIndex = 1);
  Panel4.Enabled      := (RadioGroup1.ItemIndex = 2);
end;

procedure TfEtiqCx.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
  begin
    fAgendaTelef := TfAgendaTelef.Create(Self);
    fAgendaTelef.ShowModal;
  end;
end;

procedure TfEtiqCx.FormShow(Sender: TObject);
begin
  Dm1.tLoteMI.Open;
  Dm1.tLotePedidoMI.Open;
  Dm1.tPedido.Open;
  Dm1.tPedidoItem.Open;
  Dm1.tPedidoGrade.Open;
  Dm1.tTalaoMI.Open;
  DM1.tTalaoGradeMI.Open;
  Dm1.tTalao.Open;
  DM1.tTalaoGrade.Open;
  Dm1.tLote.Open;
  Dm1.tLotePedido.Open;
  DM1.tProduto.Open;
  DM1.tGrade.Open;
  DM1.tGradeItem.Open;
  Dm1.tGradeItemlk.Open;
  DM1.tCor.Open;
  DM1.tMaterial.Open;
  DM1.tMaterial2.Open;
  mEtiqueta.Open;
end;

procedure TfEtiqCx.Gravar_mEtiqueta(Lote, Item: Integer);
var
  i : Integer;
begin
  for i := 1 to DM1.tPedidoGradeQtd.AsInteger do
  begin
    mEtiqueta.Insert;
    mEtiquetaMaterial.AsString    := DM1.tPedidoItemlkDescMaterial.AsString;
    mEtiquetaReferencia.AsString  := DM1.tPedidoItemlkReferencia.AsString;
    case RadioGroup3.ItemIndex of
      0 : mEtiquetaTamanho.AsString := DM1.tPedidoGradelkTamanho.AsString;
      1 : mEtiquetaTamanho.AsString := DM1.tPedidoGradelkMarcarTam.AsString;
    end;
    mEtiquetaCodProduto.AsInteger := DM1.tPedidoItemCodProduto.AsInteger;
    mEtiquetaCodCor.AsInteger     := DM1.tPedidoItemCodCor.AsInteger;
    mEtiquetaPedido.AsInteger     := DM1.tPedidoPedido.AsInteger;
    mEtiquetaNomeModelo.AsString  := Dm1.tPedidoItemlkNomeModelo.AsString;
    mEtiquetaLote.AsInteger       := Lote;
    mEtiquetaItem.AsInteger       := Item;
    mEtiquetaEndEtiqueta.AsString := DM1.tPedidoItemlkEndEtiq.AsString;
    mEtiquetaConstrucao.AsString  := DM1.tPedidoItemlkConstrucao.AsString;
    mEtiqueta.Post;
  end;
end;

end.

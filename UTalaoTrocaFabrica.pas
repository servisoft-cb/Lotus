unit UTalaoTrocaFabrica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, CurrEdit, Grids, DBGrids, RXDBCtrl,
  Buttons, Db, DBTables, Menus, RXCtrls, DBFilter, DBVGrids, RxLookup, Variants;

type
  TfTalaoTrocaFabrica = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label4: TLabel;
    Edit2: TEdit;
    BitBtn5: TBitBtn;
    RadioGroup1: TRadioGroup;
    CurrencyEdit1: TCurrencyEdit;
    Label3: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    SpeedButton2: TSpeedButton;
    //procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CurrencyEdit1Enter(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure CurrencyEdit1Exit(Sender: TObject);
  private

    { Private declarations }
  public
    procedure Limpa_Valores;
    { Public declarations }
  end;

var
  fTalaoTrocaFabrica: TfTalaoTrocaFabrica;
  vLote : integer;

implementation

uses UDM1, UConsLoteExp, UConsLote, uIntegracao;

{$R *.DFM}

procedure TfTalaoTrocaFabrica.Limpa_Valores;
begin
  CurrencyEdit1.Clear;
  Edit2.Clear;
  RxDBLookupCombo2.ClearValue;
end;


procedure TfTalaoTrocaFabrica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Dm1.tLote.Close;
  Dm1.tLoteMI.Close;
  Dm1.tFabrica.Close;
  Action := CaFree;
end;

procedure TfTalaoTrocaFabrica.BitBtn1Click(Sender: TObject);
begin
  Limpa_Valores;
  Close;
end;

procedure TfTalaoTrocaFabrica.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tFabrica.IndexFieldNames := 'Nome';
end;

procedure TfTalaoTrocaFabrica.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tFabrica.IndexFieldNames := 'Codigo';
end;

procedure TfTalaoTrocaFabrica.FormShow(Sender: TObject);
begin
  Dm1.tLote.Open;
  Dm1.tLoteMI.Open;
  Dm1.tFabrica.Open;
  Limpa_Valores;
end;


procedure TfTalaoTrocaFabrica.CurrencyEdit1Enter(Sender: TObject);
begin
  if (RadioGroup1.ItemIndex < 0) then
    begin
      ShowMessage('Falta informar se o Lote é Exportação ou Mercado Interno');
      RadioGroup1.SetFocus;
    end;
end;

procedure TfTalaoTrocaFabrica.BitBtn5Click(Sender: TObject);
begin
  if RxDBLookupCombo2.Text = '' then
    begin
      ShowMessage('Deve ser selecionada uma Fábrica Destino para Confirmar');
      RxDBLookupCombo2.SetFocus;
    end
  else
    if RadioGroup1.ItemIndex = 1 then
      begin
         DM1.tLoteMI.Filtered := False;
         if not DM1.tLoteMI.Locate('Lote',VarArrayOf([vLote]),[locaseinsensitive]) then
           begin
             ShowMessage('Lote Inexistente');
             CurrencyEdit1.SetFocus;
           end
         else
           begin
             Dm1.tLoteMI.Edit;
             Dm1.tLoteMICodFabrica.AsInteger := RxDBLookupCombo2.KeyValue;
             Dm1.tLoteMI.Post;
             Limpa_Valores;
             RadioGroup1.SetFocus;
           end;
      end
    else
      begin
         DM1.tLote.Filtered := False;
         if not DM1.tLote.Locate('Lote',VarArrayOf([vLote]),[locaseinsensitive]) then
           begin
             ShowMessage('Lote Inexistente');
             CurrencyEdit1.SetFocus;
           end
         else
           begin
             Dm1.tLote.Edit;
             Dm1.tLoteCodFabrica.AsInteger := RxDBLookupCombo2.KeyValue;
             Dm1.tLote.Post;
             Prc_Gravar_Lote_FB(DM1.tLoteLote.AsInteger);

             Limpa_Valores;
             RadioGroup1.SetFocus;
           end;
      end;
end;

procedure TfTalaoTrocaFabrica.SpeedButton2Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 1 then
    begin
      if dm1.tUsuarioConsultaLote.AsBoolean then
        begin
          fConsLote := TfConsLote.Create(Self);
          fConsLote.ShowModal;
        end
      else
        ShowMessage('Usuário não autorizado a abrir este formúlario!');
    end
  else
    begin
      if dm1.tUsuarioConsLote.AsBoolean then
        begin
          fConsLoteExp := TfConsLoteExp.Create(Self);
          fConsLoteExp.ShowModal;
        end
      else
        ShowMessage('Usuário não autorizado a abrir este formúlario!');
    end;
end;

procedure TfTalaoTrocaFabrica.CurrencyEdit1Exit(Sender: TObject);
begin
  Dm1.tLote.Open;
  Dm1.tLoteMI.Open;
  Dm1.tFabrica.Open;
  vLote  := CurrencyEdit1.AsInteger;
  if (CurrencyEdit1.AsInteger > 0) then
    begin
      if RadioGroup1.ItemIndex = 1 then
        begin
           DM1.tLoteMI.Filtered := False;
           if not DM1.tLoteMI.Locate('Lote',VarArrayOf([vLote]),[locaseinsensitive]) then
             begin
               ShowMessage('Lote Inexistente');
               CurrencyEdit1.SetFocus;
             end
           else
             if DM1.tLoteMICodFabrica.AsInteger <= 0 then
               begin
                 DM1.tPedido.Filtered := False;
                 if DM1.tPedido.Locate('NumLote;CodFabrica',VarArrayOf([vLote,dm1.tFabricaCodigo.AsInteger]),[locaseinsensitive]) then
                   begin
                    Edit2.Text := dm1.tPedidolkNomeFabrica.AsString;
                    RxDBLookupCombo2.SetFocus;
                   end;
               end
             else
               Edit2.Text := DM1.tLoteMIlkNomeFabrica.AsString;
        end
      else
        begin
           DM1.tLote.Filtered := False;
           if not DM1.tLote.Locate('Lote',VarArrayOf([vLote]),[locaseinsensitive]) then
             begin
               ShowMessage('Lote Inexistente');
               CurrencyEdit1.SetFocus;
             end
           else
             if DM1.tLoteCodFabrica.AsInteger <= 0 then
               begin
                 DM1.tPedido.Filtered := False;
                 if DM1.tPedido.Locate('NumLote;CodFabrica',VarArrayOf([vLote,dm1.tFabricaCodigo.AsInteger]),[locaseinsensitive]) then
                   begin
                    Edit2.Text := dm1.tPedidolkNomeFabrica.AsString;
                    RxDBLookupCombo2.SetFocus
                   end;
               end
             else
               Edit2.Text := DM1.tLotelkNomeFabrica.AsString;
        end;
    end;
end;

end.

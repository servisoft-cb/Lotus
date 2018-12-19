unit UConsComissao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ToolEdit, RxLookup, Grids, DBGrids, RXDBCtrl,
  Db, DBTables, ExtCtrls, RXCtrls, CurrEdit, SMDBGrid;

type
  TfConsComissao = class(TForm)
    GroupBox1: TGroupBox;
    qComissao: TQuery;
    dsqComissao: TDataSource;
    qComissaoNome: TStringField;
    qComissaoDtReferencia: TDateField;
    qComissaoCodCliente: TIntegerField;
    qComissaoParcDoc: TIntegerField;
    qComissaoNroDoc: TIntegerField;
    qComissaoFuncao: TStringField;
    qComissaoVlrBase: TFloatField;
    qComissaoPercDescDupl: TFloatField;
    qComissaoPercComissao: TFloatField;
    qComissaoVlrComissao: TFloatField;
    qComissaoTipo: TStringField;
    Panel1: TPanel;
    RxLabel1: TRxLabel;
    CurrencyEdit1: TCurrencyEdit;
    RxLabel2: TRxLabel;
    CurrencyEdit2: TCurrencyEdit;
    RxLabel3: TRxLabel;
    CurrencyEdit3: TCurrencyEdit;
    RxLabel4: TRxLabel;
    CurrencyEdit4: TCurrencyEdit;
    RxLabel5: TRxLabel;
    CurrencyEdit5: TCurrencyEdit;
    RxLabel6: TRxLabel;
    CurrencyEdit6: TCurrencyEdit;
    qSaldoAnt: TQuery;
    qSaldoAntFuncao: TStringField;
    qSaldoAntVlrComissao: TFloatField;
    qSaldoAntCodVendedor: TIntegerField;
    qSaldoAntNome: TStringField;
    SMDBGrid1: TSMDBGrid;
    qComissaoCodVendedor: TIntegerField;
    qComissaoNomeCliente: TStringField;
    Panel2: TPanel;
    Label4: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Label5: TLabel;
    ComboBox2: TComboBox;
    qComissaoDtUsuario: TDateField;
    qComissaoHrUsuario: TTimeField;
    qComissaoUsuario: TStringField;
    Label6: TLabel;
    Label7: TLabel;
    DateEdit3: TDateEdit;
    DateEdit4: TDateEdit;
    Panel3: TPanel;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    qComissaoNroLancamento: TIntegerField;
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DateEdit2Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
    vEntradas, vSaidas, vDevolucao, vSaldoTotal, vSaldoAnterior, vSaldoPeriodo  : Real;
    procedure Monta_SQLqComissao;
    procedure Monta_SQLqSaldoAnt;
    procedure Le_qComissao;
    function Posiciona_Comissao : Boolean;

  public
    { Public declarations }
  end;

var
  fConsComissao: TfConsComissao;

implementation

uses UDM1, UAgendaTelef, UPgtoComissao2, UComissaoVend, USenhaExc;

{$R *.DFM}

procedure TfConsComissao.Le_qComissao;
begin
  qComissao.First;
  while not qComissao.Eof do
    begin
      if qComissaoFuncao.AsString = 'E' then
        begin
          vEntradas := vEntradas + qComissaoVlrComissao.AsFloat;
          vSaldoPeriodo := vSaldoPeriodo + qComissaoVlrComissao.AsFloat;
        end
      else
      if qComissaoFuncao.AsString = 'S' then
        begin
          vSaidas := vSaidas + qComissaoVlrComissao.AsFloat;
          vSaldoPeriodo  := vSaldoPeriodo - qComissaoVlrComissao.AsFloat;
        end
      else
      if qComissaoFuncao.AsString = 'D' then
        begin
          vDevolucao := vDevolucao + qComissaoVlrComissao.AsFloat;
          vSaldoPeriodo  := vSaldoPeriodo - qComissaoVlrComissao.AsFloat;
        end;
      qComissao.Next;                                           
    end;
  vSaldoTotal         := vSaldoAnterior + vSaldoPeriodo;
  CurrencyEdit1.Value := vSaldoAnterior;
  CurrencyEdit2.Value := vEntradas;
  CurrencyEdit3.Value := vSaidas;
  CurrencyEdit4.Value := vDevolucao;
  CurrencyEdit5.Value := vSaldoPeriodo;
  CurrencyEdit6.Value := vSaldoTotal;
end;

procedure TfConsComissao.Monta_SQLqSaldoAnt;
begin
  qSaldoAnt.Close;
  qSaldoAnt.SQL.Clear;
  qSaldoAnt.SQL.Add('SELECT Dbextcomissao.Funcao, SUM( Dbextcomissao.VlrComissao ) VlrComissao, Dbextcomissao.CodVendedor, Dbvendedor.Nome');
  qSaldoAnt.SQL.Add('FROM "dbExtComissao.db" Dbextcomissao');
  qSaldoAnt.SQL.Add('   INNER JOIN "dbVendedor.DB" Dbvendedor');
  qSaldoAnt.SQL.Add('   ON  (Dbextcomissao.CodVendedor = Dbvendedor.Codigo)');
  qSaldoAnt.SQL.Add('WHERE  Dbextcomissao.DtReferencia < :DtIni');
  qSaldoAnt.SQL.Add('       AND Dbextcomissao.CodVendedor = :Codigo AND ((Dbextcomissao.Suspensa IS NULL) or  (Dbextcomissao.Suspensa = False))');
  case ComboBox2.ItemIndex of
    0 : qSaldoAnt.SQL.Add('AND  (Dbextcomissao.TIPO <> ''F'')');
    1 : qSaldoAnt.SQL.Add('AND  (Dbextcomissao.TIPO = ''F'')');
  end;
  qSaldoAnt.ParamByName('Codigo').AsInteger := RxDBLookupCombo1.KeyValue;
  qSaldoAnt.ParamByName('DtIni').AsDate     := DateEdit1.Date;
  qSaldoAnt.SQL.Add('GROUP BY Dbextcomissao.Funcao, Dbextcomissao.CodVendedor, Dbvendedor.Nome');
  qSaldoAnt.SQL.Add('ORDER BY Dbextcomissao.CodVendedor');
  qSaldoAnt.Open;
  qSaldoAnt.First;
  while not qSaldoAnt.Eof do
    begin
      if qSaldoAntFuncao.AsString = 'E' then
        vSaldoAnterior := vSaldoAnterior + qSaldoAntVlrComissao.AsFloat
      else
      if qSaldoAntFuncao.AsString = 'D' then
        vSaldoAnterior := vSaldoAnterior - qSaldoAntVlrComissao.AsFloat
      else
      if qSaldoAntFuncao.AsString = 'S' then
        vSaldoAnterior := vSaldoAnterior - qSaldoAntVlrComissao.AsFloat;
      qSaldoAnt.Next;
    end;
  qSaldoAnt.Close;
end;

procedure TfConsComissao.Monta_SQLqComissao;
begin
  qComissao.Close;
  qComissao.SQL.Clear;
  qComissao.SQL.Add('SELECT Dbvendedor.Nome, Dbextcomissao.DtReferencia, Dbextcomissao.CodCliente, Dbextcomissao.ParcDoc, ');
  qComissao.SQL.Add(' Dbextcomissao.NroDoc, Dbextcomissao.Funcao, Dbextcomissao.VlrBase, Dbextcomissao.PercDescDupl, Dbextcomissao.PercComissao, ');
  qComissao.SQL.Add(' Dbextcomissao.VlrComissao, Dbextcomissao.Tipo, Dbextcomissao.CodVendedor, Dbcliente.Nome NomeCliente, ');
  qComissao.SQL.Add(' dbExtComissao.DtUsuario, dbExtComissao.HrUsuario, dbExtComissao.Usuario, Dbextcomissao.NroLancamento ');
  qComissao.SQL.Add('FROM "dbExtComissao.db" Dbextcomissao ');
  qComissao.SQL.Add('   INNER JOIN "dbVendedor.DB" Dbvendedor ');
  qComissao.SQL.Add('   ON  (Dbextcomissao.CodVendedor = Dbvendedor.Codigo) ');
  qComissao.SQL.Add('   FULL OUTER JOIN "dbCliente.DB" Dbcliente ');
  qComissao.SQL.Add('   ON  (Dbextcomissao.CodCliente = Dbcliente.Codigo) ');
  qComissao.SQL.Add('WHERE   ( (Dbextcomissao.Suspensa IS NULL)  OR  (Dbextcomissao.Suspensa = FALSE) ) ');
  qComissao.SQL.Add('   AND  (Dbextcomissao.CodVendedor = :CodVendedor) ');
  qComissao.ParamByName('CodVendedor').AsInteger := RxDBLookupCombo1.KeyValue;
  if DateEdit1.Date > 0 then
    begin
     qComissao.SQL.Add('   AND  Dbextcomissao.DtReferencia >= :Data1');
     qComissao.ParamByName('Data1').AsDate := DateEdit1.Date;
    end;
  if DateEdit2.Date > 0 then
    begin
     qComissao.SQL.Add('   AND  Dbextcomissao.DtReferencia <= :Data2');
     qComissao.ParamByName('Data2').AsDate := DateEdit2.Date;
    end;

  if DateEdit3.Date > 0 then
    begin
     qComissao.SQL.Add('   AND  Dbextcomissao.DtUsuario >= :DtUsuario1');
     qComissao.ParamByName('DtUsuario1').AsDate := DateEdit3.Date;
    end;
  if DateEdit4.Date > 0 then
    begin
     qComissao.SQL.Add('   AND  Dbextcomissao.DtUsuario <= :DtUsuario2');
     qComissao.ParamByName('DtUsuario2').AsDate := DateEdit4.Date;
    end;
  case ComboBox2.ItemIndex of
    0 : qComissao.SQL.Add('AND  (TIPO <> ''F'')');
    1 : qComissao.SQL.Add('AND  (TIPO = ''F'')');
  end;
  Case ComboBox1.ItemIndex of
    0 : qComissao.SQL.Add('ORDER BY Dbextcomissao.DtReferencia, Dbextcomissao.NroDoc, Dbextcomissao.ParcDoc, Dbextcomissao.Funcao ');
    1 : qComissao.SQL.Add('ORDER BY Dbextcomissao.NroDoc, Dbextcomissao.ParcDoc, Dbextcomissao.DtReferencia, Dbextcomissao.Funcao ');
    2 : qComissao.SQL.Add('ORDER BY dbCliente.Nome, Dbextcomissao.DtReferencia, Dbextcomissao.NroDoc, Dbextcomissao.ParcDoc, Dbextcomissao.Funcao ');
  end;
  qComissao.Open;
end;

procedure TfConsComissao.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Nome';
end;

procedure TfConsComissao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qComissao.Active := False;
  DM1.tVendedor.IndexFieldNames := 'Codigo';
  if Screen.FormCount < 3 then
    begin
      DM1.tVendedor.Close;
      DM1.tExtComissao.Close;
      DM1.tCliente.Close;
    end;
  Action := caFree;
end;

procedure TfConsComissao.BitBtn3Click(Sender: TObject);
begin                                                                    
  if RxDBLookupCombo1.Text <> '' then
    begin
      SMDBGrid1.DisableScroll;
      vEntradas      := 0;
      vSaidas        := 0;
      vDevolucao     := 0;
      vSaldoAnterior := 0;
      vSaldoPeriodo  := 0;
      Monta_SQlqComissao;
      if DateEdit1.Date > 0 then
        Monta_SQLqSaldoAnt;
      Le_qComissao;
      SMDBGrid1.EnableScroll;
    end;
end;

procedure TfConsComissao.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsComissao.DateEdit2Exit(Sender: TObject);
begin
  RxLabel6.Caption := 'Saldo até a data ' + DateEdit2.Text;
end;

procedure TfConsComissao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
  if Key = Vk_F5 then
    BitBtn3Click(Sender);
  if (Shift = [ssCtrl]) and (Key = 87) then
    begin
      ComboBox2.Visible := not(ComboBox2.Visible);
      Label5.Visible    := not(Label5.Visible);
    end;
end;

procedure TfConsComissao.BitBtn4Click(Sender: TObject);
begin
  if DM1.tUsuarioComissao.AsBoolean then
    begin
      if CurrencyEdit6.Value > 0 then
        begin
          fPgtoComissao2 := TfPgtoComissao2.Create(Self);
          fPgtoComissao2.ShowModal;
        end
      else
        ShowMessage('Valor para pagamento zerado!');
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer pagamento!');
end;

procedure TfConsComissao.FormShow(Sender: TObject);
begin
  Top    := 0;
  Left   := 0;
  Width  := Screen.Width;
  Height := Screen.Height - 35;
  
  DM1.tVendedor.Open;
  DM1.tExtComissao.Open;
  DM1.tCliente.Open;
end;

procedure TfConsComissao.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsLancComisVend.AsBoolean then
    begin
      fComissaoVend := TfComissaoVend.Create(Self);
      fComissaoVend.vNumLancComissao := 0;
      if (qComissao.Active) and (qComissaoCodVendedor.AsInteger > 0) then
        fComissaoVend.RxDBLookupCombo1.KeyValue := qComissaoCodVendedor.AsInteger;
      fComissaoVend.ShowModal;
      BitBtn3Click(Sender);
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a incluir!');
end;

procedure TfConsComissao.BitBtn5Click(Sender: TObject);
var
  vNumAux : Integer;
begin
  if DM1.tUsuarioAltLancComisVend.AsBoolean then
    begin
      if not Posiciona_Comissao then
        exit;

      vNumAux := qComissaoNroLancamento.AsInteger;

      fComissaoVend := TfComissaoVend.Create(Self);

      fComissaoVend.RxDBLookupCombo1.KeyValue := DM1.tExtComissaoCodVendedor.AsInteger;
      fComissaoVend.RxDBLookupCombo1.ReadOnly := True;
      fComissaoVend.RxDBLookupCombo2.KeyValue := DM1.tExtComissaoCodCliente.AsInteger;
      fComissaoVend.DateEdit1.Text            := DM1.tExtComissaoDtReferencia.AsString;
      fComissaoVend.CurrencyEdit1.Value       := DM1.tExtComissaoNroDoc.AsInteger;
      fComissaoVend.CurrencyEdit2.Value       := DM1.tExtComissaoParcDoc.AsInteger;
      if DM1.tExtComissaoFuncao.AsString = 'E' then
        fComissaoVend.ComboBox1.ItemIndex := 0
      else
      if DM1.tExtComissaoFuncao.AsString = 'S' then
        fComissaoVend.ComboBox1.ItemIndex := 1
      else
      if DM1.tExtComissaoFuncao.AsString = 'D' then
        fComissaoVend.ComboBox1.ItemIndex := 2;
      fComissaoVend.CurrencyEdit4.Value       := DM1.tExtComissaoPercComissao.AsFloat;
      fComissaoVend.CurrencyEdit5.Value       := DM1.tExtComissaoVlrBase.AsFloat;
      fComissaoVend.CurrencyEdit6.Value       := DM1.tExtComissaoVlrComissao.AsFloat;
      fComissaoVend.vTipoComissao             := DM1.tExtComissaoTipo.AsString;
      fComissaoVend.vNumLancComissao          := DM1.tExtComissaoNroLancamento.AsInteger;
      //DM1.Grava_ExcComissaoVend;
      //DM1.tExtComissao.Delete;

      fComissaoVend.ShowModal;

      BitBtn3Click(Sender);
      qComissao.Locate('NroLancamento',vNumAux,[loCaseInsensitive]);

    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a alterar!');
end;

procedure TfConsComissao.BitBtn6Click(Sender: TObject);
begin
  if DM1.tUsuarioExcLancComisVend.AsBoolean then
    begin
      if not Posiciona_Comissao then
        exit;

      fSenhaExc := TfSenhaExc.Create(Self);
      fSenhaExc.ShowModal;
      if (DM1.tParametrosSenhaExc.AsString = '') or (DM1.tParametrosSenhaExc.AsString <> vSenhaExc) then
        ShowMessage('Senha inválida!')
      else
      if MessageDlg('Deseja realmente excluir esta comissão?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        begin
          DM1.Grava_ExcComissaoVend;
          DM1.tExtComissao.Delete;
          BitBtn3Click(Sender);
        end;

    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a alterar!');
end;


function TfConsComissao.Posiciona_Comissao: Boolean;
begin
  Result := False;
  if not(qComissao.Active) or (qComissao.IsEmpty) then
  begin
    ShowMessage('Não existe registro para alterar!');
    exit;
  end;
  if qComissaoNroLancamento.AsInteger < 1 then
  begin
    ShowMessage('Não existe registro para alterar!');
    exit;
  end;

  DM1.tExtComissao.IndexFieldNames := 'NroLancamento';
  if not DM1.tExtComissao.FindKey([qComissaoNroLancamento.AsInteger]) then
  begin
    ShowMessage('Comissão não encontrada!');
    exit;
  end;

  if DM1.tVendedor.Locate('Codigo',DM1.tExtComissaoCodVendedor.AsInteger,[loCaseInsensitive]) then
  begin
    if DM1.tVendedorDtEncerramentoCom.AsDateTime >= DM1.tExtComissaoDtReferencia.AsDateTime then
    begin
      ShowMessage('Comissão já encerrada nesta data para este vendedor!');
      exit;
    end;
  end;

  Result := True;
end;

end.

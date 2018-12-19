unit UGeraArquivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, ExtCtrls, Buttons, Gauges, Db, DBTables, Grids,
  DBGrids, DBFilter, ShellApi;

type
  TfGeraArquivo = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel3: TBevel;
    Gauge1: TGauge;
    Bevel4: TBevel;
    DirectoryEdit1: TDirectoryEdit;
    Label3: TLabel;
    Bevel5: TBevel;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    Label2: TLabel;
    DateEdit2: TDateEdit;
    Label4: TLabel;
    Panel1: TPanel;
    Edit2: TEdit;
    BitBtn3: TBitBtn;
    Label5: TLabel;
    RxDBFilter1: TRxDBFilter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGeraArquivo: TfGeraArquivo;

implementation

uses UDM1;

{$R *.DFM}

procedure TfGeraArquivo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  RxDBFilter1.Active := False;
  if Screen.FormCount < 3 then
    begin
      Dm1.tNatOperacao.Close;
      Dm1.tNotaFiscal.Close;
      Dm1.tNotaFiscalItens.Close;
      Dm1.tNotaFiscalParc.Close;
      DM1.tCliente.Close;
      DM1.tUF.Close;
      DM1.tCidade.Close;
    end;
  Action := caFree;
end;

procedure TfGeraArquivo.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfGeraArquivo.FormShow(Sender: TObject);
var
  Dia,Mes,Ano : Word;
begin
  Dm1.tNatOperacao.Open;
  Dm1.tNotaFiscal.Open;
  Dm1.tNotaFiscalItens.Open;
  Dm1.tNotaFiscalParc.Open;
  DM1.tCliente.Open;
  DM1.tUF.Open;
  DM1.tCidade.Open;
  DateEdit1.Date := Date;
  DateEdit2.Date := Date;
  DecodeDate(Date,Ano,Mes,Dia);
  Edit2.Clear;
  Edit2.Text := 'DCL' + FormatFloat('00',Mes) + Copy(IntToStr(Ano),3,2) + '.TXT';
  RxDBFilter1.Active := True;
end;

procedure TfGeraArquivo.BitBtn1Click(Sender: TObject);
var
  F     : TextFile;
  Texto : array [1..10] of String;
  Dia,Mes,Ano,Dia2,Mes2,Ano2 : Word;
procedure Registro_50;
var i : Integer;
    Dia,Mes,Ano : Word;
begin
  Texto[1] := '50';
  Write(F,Texto[1]);

  Texto[2] := '';
  Texto[1] := DM1.tNotaFiscallkCgcCli.AsString;
  for i := 1 to length(Texto[1]) do
    begin
      if (Copy(Texto[1],i,1) <> '.') and (Copy(Texto[1],i,1) <> '-') and (Copy(Texto[1],i,1) <> '/') then
        Texto[2] := Texto[2] + Copy(Texto[1],i,1);
    end;
  for i := 1 to 14 - length(Texto[2]) do
    Texto[2] := Texto[2] + ' ';
  Write(F,Texto[2]);

  Texto[2] := '';
  Texto[1] := DM1.tNotaFiscallkInscCli.AsString;
  for i := 1 to length(Texto[1]) do
    begin
      if (Copy(Texto[1],i,1) <> '.') and (Copy(Texto[1],i,1) <> '-') and (Copy(Texto[1],i,1) <> '/') then
        Texto[2] := Texto[2] + Copy(Texto[1],i,1);
    end;
  for i := 1 to 14 - length(Texto[2]) do
    Texto[2] := Texto[2] + ' ';
  Write(F,copy(Texto[2],1,14));

  DecodeDate(DM1.tNotaFiscalDtEmissao.AsDateTime,Ano,Mes,Dia);
  Texto[1] := FormatFloat('0000',Ano) + FormatFloat('00',Mes) + FormatFloat('00',Dia);
  for i := 1 to 8 - length(Texto[1]) do
    Texto[1] := Texto[1] + ' ';
  Write(F,Texto[1]);

  Texto[1] := DM1.tNotaFiscallkUf.AsString;
  for i := 1 to 2 - length(Texto[1]) do
    Texto[1] := Texto[1] + ' ';
  Write(F,Texto[1]);

  Texto[1] := '01';
  Write(F,Texto[1]);

  Texto[1] := '   ';
  Write(F,Texto[1]);

  Texto[1] := '  ';
  Write(F,Texto[1]);

  Texto[1] := DM1.tNotaFiscalNumNota.AsString;
  for i := 1 to 6 - length(Texto[1]) do
    Texto[1] := '0' + Texto[1];
  Write(F,Texto[1]);

  DM1.tNatOperacao.FindKey([DM1.tNotaFiscalCodNatOper.AsInteger]);
  Texto[1] := DM1.tNatOperacaoCodNatOper.AsString;
  for i := 1 to 3 - length(Texto[1]) do
    Texto[1] := Texto[1] + ' ';
  Write(F,Texto[1]);

  Texto[2] := '';
  Texto[1] := FormatFloat('##########0.00',DM1.tNotaFiscalVlrTotalNota.AsFloat);
  for i := 1 to length(Texto[1]) do
    begin
      if (copy(Texto[1],i,1) <> '.') and (copy(Texto[1],i,1) <> ',') then
        Texto[2] := Texto[2] + copy(Texto[1],i,1);
    end;
  for i := 1 to 13 - length(Texto[2]) do
    Texto[2] := '0' + Texto[2];
  Write(F,Texto[2]);

  Texto[2] := '';
  Texto[1] := FormatFloat('##########0.00',DM1.tNotaFiscalBaseIcms.AsFloat);
  for i := 1 to length(Texto[1]) do
    begin
      if (copy(Texto[1],i,1) <> '.') and (copy(Texto[1],i,1) <> ',') then
        Texto[2] := Texto[2] + copy(Texto[1],i,1);
    end;
  for i := 1 to 13 - length(Texto[2]) do
    Texto[2] := '0' + Texto[2];
  Write(F,Texto[2]);

  Texto[2] := '';
  Texto[1] := FormatFloat('##########0.00',DM1.tNotaFiscalVlrIcms.AsFloat);
  for i := 1 to length(Texto[1]) do
    begin
      if (copy(Texto[1],i,1) <> '.') and (copy(Texto[1],i,1) <> ',') then
        Texto[2] := Texto[2] + copy(Texto[1],i,1);
    end;
  for i := 1 to 13 - length(Texto[2]) do
    Texto[2] := '0' + Texto[2];
  Write(F,Texto[2]);

  Texto[2] := '';
  if DM1.tNotaFiscalVlrTotalNota.AsFloat > 0 then
    Texto[1] := FormatFloat('##########0.00',DM1.tNotaFiscalVlrTotalNota.AsFloat - DM1.tNotaFiscalBaseIcms.AsFloat)
  else
    Texto[1] := '0,00';
  for i := 1 to length(Texto[1]) do
    begin
      if (copy(Texto[1],i,1) <> '.') and (copy(Texto[1],i,1) <> ',') then
        Texto[2] := Texto[2] + copy(Texto[1],i,1);
    end;
  for i := 1 to 13 - length(Texto[2]) do
    Texto[2] := '0' + Texto[2];
  Write(F,Texto[2]);

  Texto[2] := '';
  Texto[1] := '0';
  for i := 1 to 13 - length(Texto[2]) do
    Texto[2] := '0' + Texto[2];
  Write(F,Texto[2]);

  Texto[2] := '';
  Texto[1] := FormatFloat('#0.00',DM1.tNotaFiscalItensIcms.AsFloat);
  for i := 1 to length(Texto[1]) do
    begin
      if (copy(Texto[1],i,1) <> '.') and (copy(Texto[1],i,1) <> ',') then
        Texto[2] := Texto[2] + copy(Texto[1],i,1);
    end;
  for i := 1 to 4 - length(Texto[2]) do
    Texto[2] := '0' + Texto[2];
  Write(F,Texto[2]);

  if DM1.tNotaFiscalCancelada.AsBoolean then
    Write(F,'S')
  else
    Write(F,'N');

  WriteLn(F);
end;
procedure Registro_51;
var i : Integer;
    Dia,Mes,Ano : Word;
begin
  Texto[1] := '51';
  Write(F,Texto[1]);

  Texto[2] := '';
  Texto[1] := DM1.tNotaFiscallkCgcCli.AsString;
  for i := 1 to length(Texto[1]) do
    begin
      if (Copy(Texto[1],i,1) <> '.') and (Copy(Texto[1],i,1) <> '-') and (Copy(Texto[1],i,1) <> '/') then
        Texto[2] := Texto[2] + Copy(Texto[1],i,1);
    end;
  for i := 1 to 14 - length(Texto[2]) do
    Texto[2] := Texto[2] + ' ';
  Write(F,Texto[2]);

  Texto[2] := '';
  Texto[1] := DM1.tNotaFiscallkInscCli.AsString;
  for i := 1 to length(Texto[1]) do
    begin
      if (Copy(Texto[1],i,1) <> '.') and (Copy(Texto[1],i,1) <> '-') and (Copy(Texto[1],i,1) <> '/') then
        Texto[2] := Texto[2] + Copy(Texto[1],i,1);
    end;
  for i := 1 to 14 - length(Texto[2]) do
    Texto[2] := Texto[2] + ' ';
  Write(F,copy(Texto[2],1,14));

  DecodeDate(DM1.tNotaFiscalDtEmissao.AsDateTime,Ano,Mes,Dia);
  Texto[1] := FormatFloat('0000',Ano) + FormatFloat('00',Mes) + FormatFloat('00',Dia);
  for i := 1 to 8 - length(Texto[1]) do
    Texto[1] := Texto[1] + ' ';
  Write(F,Texto[1]);

  Texto[1] := DM1.tNotaFiscallkUf.AsString;
  for i := 1 to 2 - length(Texto[1]) do
    Texto[1] := Texto[1] + ' ';
  Write(F,Texto[1]);

  Texto[1] := '  ';
  Write(F,Texto[1]);

  Texto[1] := '  ';
  Write(F,Texto[1]);

  Texto[1] := DM1.tNotaFiscalNumNota.AsString;
  for i := 1 to 6 - length(Texto[1]) do
    Texto[1] := '0' + Texto[1];
  Write(F,Texto[1]);

  DM1.tNatOperacao.FindKey([DM1.tNotaFiscalCodNatOper.AsInteger]);
  Texto[1] := DM1.tNatOperacaoCodNatOper.AsString;
  for i := 1 to 3 - length(Texto[1]) do
    Texto[1] := Texto[1] + ' ';
  Write(F,Texto[1]);

  Texto[2] := '';
  Texto[1] := FormatFloat('##########0.00',DM1.tNotaFiscalVlrTotalNota.AsFloat);
  for i := 1 to length(Texto[1]) do
    begin
      if (copy(Texto[1],i,1) <> '.') and (copy(Texto[1],i,1) <> ',') then
        Texto[2] := Texto[2] + copy(Texto[1],i,1);
    end;
  for i := 1 to 13 - length(Texto[2]) do
    Texto[2] := '0' + Texto[2];
  Write(F,Texto[2]);

  Texto[2] := '';
  Texto[1] := FormatFloat('##########0.00',DM1.tNotaFiscalVlrIpi.AsFloat);
  for i := 1 to length(Texto[1]) do
    begin
      if (copy(Texto[1],i,1) <> '.') and (copy(Texto[1],i,1) <> ',') then
        Texto[2] := Texto[2] + copy(Texto[1],i,1);
    end;
  for i := 1 to 13 - length(Texto[2]) do
    Texto[2] := '0' + Texto[2];
  Write(F,Texto[2]);

  Texto[1] := '0';
  Texto[2] := '';
  DM1.tNotaFiscalItens.First;
  while not DM1.tNotaFiscalItens.EOF do
    begin
      if not (DM1.tNotaFiscalItensIpi.AsFloat > 0) then
        Texto[1] := FormatFloat('##########0.00',(StrTofloat(Texto[1]) + DM1.tNotaFiscalItensVlrTotal.AsFloat));
      DM1.tNotaFiscalItens.Next;
    end;
  for i := 1 to length(Texto[1]) do
    begin
      if (copy(Texto[1],i,1) <> '.') and (copy(Texto[1],i,1) <> ',') then
        Texto[2] := Texto[2] + copy(Texto[1],i,1);
    end;
  for i := 1 to 13 - length(Texto[2]) do
    Texto[2] := '0' + Texto[2];
  Write(F,Texto[2]);

  Texto[2] := '';
  Texto[1] := '0';
  for i := 1 to 13 - length(Texto[2]) do
    Texto[2] := '0' + Texto[2];
  Write(F,Texto[2]);

  Texto[1] := '     ';
  Write(F,Texto[1]);

  Texto[1] := '     ';
  Write(F,Texto[1]);

  Texto[1] := '     ';
  Write(F,Texto[1]);

  Texto[1] := '     ';
  Write(F,Texto[1]);

  if DM1.tNotaFiscalCancelada.AsBoolean then
    Write(F,'S')
  else
    Write(F,'N');

  WriteLn(F);
end;
procedure Registro_10;
var i : Integer;
    Dia,Mes,Ano : Word;
begin
  Texto[1] := '10';
  Write(F,Texto[1]);
  Texto[2] := '';
  Texto[1] := DM1.tEmpresaCgc.AsString;
  for i := 1 to length(Texto[1]) do
    begin
      if (Copy(Texto[1],i,1) <> '.') and (Copy(Texto[1],i,1) <> '-') and (Copy(Texto[1],i,1) <> '/') then
        Texto[2] := Texto[2] + Copy(Texto[1],i,1);
    end;
  for i := 1 to 14 - length(Texto[2]) do
    Texto[2] := Texto[2] + ' ';
  Write(F,Texto[2]);

  Texto[1] := DM1.tEmpresaInscr.AsString;
  for i := 1 to 14 - length(Texto[1]) do
    Texto[1] := Texto[1] + ' ';
  Write(F,Texto[1]);

  Texto[1] := Copy(DM1.tEmpresaEmpresa.AsString,1,35);
  for i := 1 to 35 - length(Texto[1]) do
    Texto[1] := Texto[1] + ' ';
  Write(F,Texto[1]);

  Texto[1] := copy(DM1.tEmpresaCidade.AsString,1,30);
  for i := 1 to 30 - length(Texto[1]) do
    Texto[1] := Texto[1] + ' ';
  Write(F,Texto[1]);

  Texto[1] := copy(DM1.tEmpresaEstado.AsString,1,2);
  for i := 1 to 2 - length(Texto[1]) do
    Texto[1] := Texto[1] + ' ';
  Write(F,Texto[1]);

  Texto[2] := '';
  Texto[1] := copy(DM1.tEmpresaFax.AsString,1,15);
  for i := 1 to length(Texto[1]) do
    begin
      if (Copy(Texto[1],i,1) <> ')') and (Copy(Texto[1],i,1) <> '(') and (Copy(Texto[1],i,1) <> '-') and
         (Copy(Texto[1],i,1) <> '.') and (Copy(Texto[1],i,1) <> '/') then
        Texto[2] := Texto[2] + Copy(Texto[1],i,1);
    end;
  for i := 1 to 10 - length(Texto[2]) do
    Texto[2] := '0' + Texto[2];
  Write(F,Texto[2]);

  DecodeDate(DateEdit1.Date,Ano,Mes,Dia);
  Texto[1] := FormatFloat('0000',Ano) + FormatFloat('00',Mes) + FormatFloat('00',Dia);
  for i := 1 to 8 - length(Texto[1]) do
    Texto[1] := Texto[1] + ' ';
  Write(F,Texto[1]);

  DecodeDate(DateEdit2.Date,Ano,Mes,Dia);
  Texto[1] := FormatFloat('0000',Ano) + FormatFloat('00',Mes) + FormatFloat('00',Dia);
  for i := 1 to 8 - length(Texto[1]) do
    Texto[1] := Texto[1] + ' ';
  Write(F,Texto[1]);

  Write(F,'04');

  Write(F,'1');

  WriteLn(F);
end;
procedure Registro_11;
var i : Integer;
begin
  Write(F,'11');

  Texto[1] := copy(DM1.tEmpresaEndereco.AsString,1,34);
  for i := 1 to 34 - length(Texto[1]) do
    Texto[1] := Texto[1] + ' ';
  Write(F,Texto[1]);

  Texto[1] := '';
  for i := 1 to 27 - length(Texto[1]) do
    Texto[1] := Texto[1] + ' ';
  Write(F,Texto[1]);

  Texto[1] := Copy(DM1.tEmpresaBairro.AsString,1,15);
  for i := 1 to 15 - length(Texto[1]) do
    Texto[1] := Texto[1] + ' ';
  Write(F,Texto[1]);

  Texto[2] := '';
  Texto[1] := DM1.tEmpresaCep.AsString;
  for i := 1 to length(Texto[1]) do
    begin
      if Copy(Texto[1],i,1) <> '-' then
        Texto[2] := Texto[2] + Copy(Texto[1],i,1);
    end;
  for i := 1 to 8 - length(Texto[2]) do
    Texto[2] := Texto[2] + ' ';
  Write(F,Texto[2]);

  Texto[1] := 'DMoon';
  for i := 1 to 28 - length(Texto[1]) do
    Texto[1] := Texto[1] + ' ';
  Write(F,Texto[1]);

  Texto[2] := '';
  Texto[1] := copy(DM1.tEmpresaTel.AsString,1,15);
  for i := 1 to length(Texto[1]) do
    begin
      if (Copy(Texto[1],i,1) <> ')') and (Copy(Texto[1],i,1) <> '(') and (Copy(Texto[1],i,1) <> '-') and
         (Copy(Texto[1],i,1) <> '.') and (Copy(Texto[1],i,1) <> '/') then
        Texto[2] := Texto[2] + Copy(Texto[1],i,1);
    end;
  for i := 1 to 12 - length(Texto[2]) do
    Texto[2] := '0' + Texto[2];
  Write(F,Texto[2]);

  WriteLn(F);
end;
begin
  if (DateEdit1.Text <> '  /  /    ') and (DateEdit2.Text <> '  /  /    ') then
    begin
      DecodeDate(DateEdit1.Date,Ano2,Mes2,Dia2);
      DecodeDate(DateEdit2.Date,Ano,Mes,Dia);
      Edit2.Clear;
      Edit2.Text := 'DCL' + FormatFloat('00',Mes) + Copy(IntToStr(Ano),3,2) + '.TXT';
      Edit2.Refresh;
      if Mes = Mes2 then
        begin
          DM1.tNotaFiscal.Filtered := False;
          DM1.tNotaFiscal.Filter   := 'DtEmissao >= '''+DateEdit1.Text+''' and DtEmissao <= '''+DateEdit2.Text+'''';
          DM1.tNotaFiscal.Filtered := True;
          if DM1.tNotaFiscal.RecordCount > 0 then
            begin
              DM1.tNatOperacao.IndexFieldNames := 'Codigo';
              Gauge1.MaxValue := DM1.tNotaFiscal.RecordCount;
              Gauge1.Progress := 0;
              if Copy(DirectoryEdit1.Text,Length(DirectoryEdit1.Text),1) <> '\' then
                AssignFile(F,DirectoryEdit1.Text + '\' + Edit2.Text)
              else
                AssignFile(F,DirectoryEdit1.Text + Edit2.Text);
              Rewrite(F);
              Registro_10;
              Registro_11;
              DM1.tNotaFiscal.First;
              while not DM1.tNotaFiscal.EOF do
                begin
                  Registro_50;
                  Registro_51;
                  Gauge1.Progress := Gauge1.Progress + 1;
                  DM1.tNotaFiscal.Next;
                end;
              CloseFile(F);
              ShowMessage('Geração do arquivo finalizada!' + #13 +
                          'Total de ' + IntToStr(DM1.tNotaFiscal.RecordCount) + ' Notas Contabilizadas.');
              DM1.tNotaFiscal.Filtered := False;
              Gauge1.Progress := 0;
            end
          else
            ShowMessage('Não foi encontrada nenhuma nota neste período!');
        end
      else
        ShowMessage('Não é permitido gerar meses diferentes!');
    end;
end;

procedure TfGeraArquivo.BitBtn3Click(Sender: TObject);
var
  Texto : String;
  vArq : String;
begin
  if Copy(DirectoryEdit1.Text,Length(DirectoryEdit1.Text),1) <> '\' then
    vArq := DirectoryEdit1.Text + '\' + Edit2.Text
  else
    vArq := DirectoryEdit1.Text + Edit2.Text;
  Texto := 'WordPad ' + vArq;
  //WinExec(PChar(Texto),SW_MAXIMIZE);
  ShellExecute(Application.Handle, 'Open', PChar(vArq), nil, nil, SW_SHOWMAXIMIZED);
end;

end.

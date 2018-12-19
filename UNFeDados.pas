unit UNFeDados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, DB, Mask,
  DBTables, QRCTRLS, ToolEdit, ComCtrls, JPEG, UDm1, UDm2, SqlExpr, dbXPress;

  procedure Monta_mItensNFe;
  procedure Monta_mDadosAdicionaisNFe;
  procedure Grava_DadosAdicionaisNFe(DadosAdi: String; Tipo: Integer);
  procedure Grava_mAuxDadosNFe(Tipo, Codigo: String);
  procedure Monta_mParcelaNFe;
  procedure Le_tNotaFiscalRef;

  procedure Gera_NFe;

  Function  Monta_Texto(Campo: String ; Tamanho: Integer): String;

var
  vTextoNumNotaNfe: String;
  vCodProdutoNfe: String;
  vTextoDetNFe: String;

implementation

uses Variants, uNFe, UDMNotaFiscal, UEmissaoNotaFiscal, UDMNFe,
  UDMTabEnqIPI;

procedure Le_tNotaFiscalRef;
var
  vItemAux: Integer;
  vUFAux: String;
  vObsAux: String;
  vTexto2: String;
begin
  vObsAux := '';
  DM1.tNotaFiscalRef.First;
  while not DM1.tNotaFiscalRef.Eof do
  begin
    if not fNFe.mNotaDevolvidaNFe.Locate('CodForn;NumNota;Modelo;Serie',VarArrayOf([DM1.tNotaFiscalRefCodFornecedor.AsInteger,
                              DM1.tNotaFiscalRefNumNotaRef.AsInteger,DM1.tNotaFiscalRefModeloRef.AsString,DM1.tNotaFiscalRefSerieRef.AsString]),
                              [locaseinsensitive]) then

    begin
      vUFAux := '';
      fNFe.mNotaDevolvidaNFe.Last;
      vitemAux := fNFe.mNotaDevolvidaNFeItem.AsInteger;
      fNFe.mNotaDevolvidaNFe.Insert;
      fNFe.mNotaDevolvidaNFeTipo.AsString     := DM1.tNotaFiscalRefTipo.AsString;
      fNFe.mNotaDevolvidaNFeItem.AsInteger    := vItemAux + 1;
      fNFe.mNotaDevolvidaNFeModelo.AsString   := DM1.tNotaFiscalRefModeloRef.AsString;
      fNFe.mNotaDevolvidaNFeNumNota.AsInteger := DM1.tNotaFiscalRefNumNotaRef.AsInteger;
      fNFe.mNotaDevolvidaNFeCodForn.AsInteger := DM1.tNotaFiscalRefCodFornecedor.AsInteger;
      fNFe.mNotaDevolvidaNFeNomeForn.AsString := '';
      fNFe.mNotaDevolvidaNFeCNPJ.AsString     := DM1.tNotaFiscalRefCNPJEmitenteRef.AsString;
      vUFAux := DM1.tNotaFiscalRefCodUFEmitenteRef.AsString;
      if DM1.tUF.FindKey([DM1.tNotaFiscalRefCodUFEmitenteRef.AsString]) then
        vUFAux := DM1.tUFCodUF.AsString;
      fNFe.mNotaDevolvidaNFeCodUF.AsString := vUFAux;

      fNFe.mNotaDevolvidaNFeNFeChaveAcesso.AsString := DM1.tNotaFiscalRefNFeChaveAcessoRef.AsString;

      fNFe.mNotaDevolvidaNFeCupomNumECF.AsInteger := DM1.tNotaFiscalRefCupomNumECF.AsInteger;
      fNFe.mNotaDevolvidaNFeCupomNumCOO.AsInteger := DM1.tNotaFiscalRefCupomNumCOO.AsInteger;
      fNFe.mNotaDevolvidaNFeCupomModelo.AsString  := DM1.tNotaFiscalRefCupomModelo.AsString;
      fNFe.mNotaDevolvidaNFeAnoEmissao.AsInteger  := DM1.tNotaFiscalRefAnoEmissaoRef.AsInteger;
      fNFe.mNotaDevolvidaNFeMesEmissao.AsInteger  := DM1.tNotaFiscalRefMesEmissaoRef.AsInteger;
      fNFe.mNotaDevolvidaNFeSerie.AsString        := DM1.tNotaFiscalRefSerieRef.AsString;
      fNFe.mNotaDevolvidaNFeIE.AsString           := DM1.tNotaFiscalRefIE.AsString;

      fNFe.mNotaDevolvidaNFe.Post;
    end;

    if vObsAux <> '' then
      vObsAux := vObsAux + ' ';
    if DM1.tNotaFiscalRefTipo.AsString = '13' then
    begin
      vTexto2 := '';
      vObsAux := vObsAux + '(NF-e referenciada ' + DM1.tNotaFiscalRefNFeChaveAcessoRef.AsString;
      DMNFe.qNotaFiscal.Close;
      DMNFe.qNotaFiscal.ParamByName('NFeChaveAcesso').AsString := DM1.tNotaFiscalRefNFeChaveAcessoRef.AsString;
      DMNFe.qNotaFiscal.Open;
      if not DMNFe.qNotaFiscal.IsEmpty then
        vTexto2 := '- Emissao: ' + DMNFe.qNotaFiscalDtEmissao.AsString + ' Num.Nota: ' + DMNFe.qNotaFiscalNumNota.AsString;
      vObsAux := vObsAux + vTexto2 + ')';
    end
    //**********
    else
    if DM1.tNotaFiscalRefTipo.AsString = '14' then
    begin
      vObsAux := vObsAux + '(NF referenciada Mes/Ano: ' + DM1.tNotaFiscalRefMesEmissaoRef.AsString + '/' +
                 DM1.tNotaFiscalRefAnoEmissaoRef.AsString
                 + ', Modelo ' + DM1.tNotaFiscalRefModeloRef.AsString + ', Serie ' + DM1.tNotaFiscalRefSerieRef.AsString
                 + ', Nº ' + DM1.tNotaFiscalRefNumNotaRef.AsString + ', CNPJ: ' + DM1.tNotaFiscalRefCNPJEmitenteRef.AsString
                 + ', UF: ' + DM1.tNotaFiscalRefCodUFEmitenteRef.AsString + ')';
    end
    else
    if DM1.tNotaFiscalRefTipo.AsString = '20a' then
    begin
      vObsAux := vObsAux + '(NF referenciada de Produto Rural Mes/Ano: ' + DM1.tNotaFiscalRefMesEmissaoRef.AsString + '/' +
                 DM1.tNotaFiscalRefAnoEmissaoRef.AsString + ', Modelo ' + DM1.tNotaFiscalRefModeloRef.AsString +
                 ', Serie ' + DM1.tNotaFiscalRefSerieRef.AsString + ', Nº ' + DM1.tNotaFiscalRefNumNotaRef.AsString +
                 ', CNPJ/CPF: ' + DM1.tNotaFiscalRefCNPJEmitenteRef.AsString + ', UF: ' +
                 DM1.tNotaFiscalRefCodUFEmitenteRef.AsString + ', IE: ' + DM1.tNotaFiscalRefIE.AsString + ')';
    end
    else
      vObsAux := vObsAux + '(Cupom Fiscal Modelo: ' + DM1.tNotaFiscalRefCupomModelo.AsString
                 + ', Nº ECF: ' + DM1.tNotaFiscalRefCupomNumECF.AsString + ', Nº COO: ' + DM1.tNotaFiscalRefCupomNumCOO.AsString + ')';

    DM1.tNotaFiscalRef.Next;
  end;

  Grava_DadosAdicionaisNFe(vObsAux,0);
end;

procedure Monta_mParcelaNFe;
begin
  fNFe.mParcelaNFe.EmptyDataSet;
  if DM1.tNotaFiscalCondPgto.AsString = 'V' then
  begin
    fNFe.mParcelaNFe.Insert;
    fNFe.mParcelaNFeNumNota.AsInteger     := DM1.tNotaFiscalNumNota.AsInteger;
    fNFe.mParcelaNFeParcela.AsInteger     := 0;
    fNFe.mParcelaNFeValor.AsFloat         := DM1.tNotaFiscalVlrTotalDupl.AsFloat;
    fNFe.mParcelaNFeDtVencimento.AsString := 'A Vista';
    fNFe.mParcelaNFe.Post;
  end
  else
  begin
    DM1.tNotaFiscalParc.First;
    while not DM1.tNotaFiscalParc.Eof do
    begin
      fNFe.mParcelaNFe.Insert;
      fNFe.mParcelaNFeNumNota.AsInteger     := DM1.tNotaFiscalNumNota.AsInteger;
      fNFe.mParcelaNFeParcela.AsInteger     := DM1.tNotaFiscalParcParcela.AsInteger;
      fNFe.mParcelaNFeValor.AsFloat         := DM1.tNotaFiscalParcVlrVenc.AsFloat;
      fNFe.mParcelaNFeDtVencimento.AsString := DM1.tNotaFiscalParcDtVenc.AsString;
      fNFe.mParcelaNFe.Post;
      DM1.tNotaFiscalParc.Next;
    end;
  end;
end;

procedure Gera_NFe;
var
  i: Integer;
begin
  DM1.tCliente.Locate('Codigo',DM1.tNotaFiscalCodCli.AsInteger,[loCaseInsensitive]);
  if DM1.tClienteCodigo.AsInteger <> DM1.tNotaFiscalCodCli.AsInteger then
    ShowMessage('Não posicionou o cliente corretamente!');

  DMNotaFiscal.qNatOper.Close;
  DMNotaFiscal.qNatOper.Params[0].AsInteger := Dm1.tNotaFiscalFilial.AsInteger;
  DMNotaFiscal.qNatOper.Params[1].AsInteger := Dm1.tNotaFiscalNumSeq.AsInteger;
  DMNotaFiscal.qNatOper.Open;
  fNFe.mDadosAdicionaisNFe.Open;
  fNFe.mItensNFe.Open;
  fNFe.mAuxDadosNFe.Open;
  Monta_mItensNFe;
  Monta_mDadosAdicionaisNFe;
  Monta_mParcelaNFe;

  Le_tNotaFiscalRef;

  if (Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '1') or (DM1.tNotaFiscalCancelada.AsBoolean) then
    fNFe.ComboBox1.ItemIndex := 0
  else
  if Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '2' then
    fNFe.ComboBox1.ItemIndex := 1
  else
  if Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '3' then
    fNFe.ComboBox1.ItemIndex := 2
  else
  if Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '5' then
    fNFe.ComboBox1.ItemIndex := 3;
end;

Function Monta_Texto(Campo: String ; Tamanho: Integer): String;
var
  texto2: String;
  i: Integer;
begin
  texto2 := '';
  for i := 1 to Length(Campo) do
    if Campo[i] in ['0','1','2','3','4','5','6','7','8','9'] then
      Texto2 := Texto2 + Copy(Campo,i,1);
  for i := 1 to Tamanho - Length(texto2) do
    texto2 := '0' + texto2;
  Result := texto2;
end;

procedure Grava_mAuxDadosNFe(Tipo, Codigo: String);
begin
  if Codigo <> '' then
  begin
    fNFe.mAuxDadosNFe.Insert;
    fNFe.mAuxDadosNFeTipo.AsString   := Tipo;
    fNFe.mAuxDadosNFeCodigo.AsString := Codigo;
    fNFe.mAuxDadosNFe.Post;
  end;
end;

procedure Monta_mDadosAdicionaisNFe;
var
  vTexto: String;
  vObsAux: String;
  vObsSimplesPermiteIcms, vObsSimples: Boolean;
begin
  fNFe.mDadosAdicionaisNFe.EmptyDataSet;
  fNFe.mDadosAdicionaisNFe.Insert;
  fNFe.mDadosAdicionaisNFeFilial.AsInteger  := DM1.tNotaFiscalFilial.AsInteger;
  fNFe.mDadosAdicionaisNFeNumNota.AsInteger := DM1.tNotaFiscalNumSeq.AsInteger;
  fNFe.mDadosAdicionaisNFe.Post;
  //Dados digitados manualmente

  if DM1.tNotaFiscalTBObs.RecordCount > 0 then
    Grava_DadosAdicionaisNFe(DM1.tNotaFiscalTBObsDadosAdicionais.AsString,0);
  if Trim(DM1.tNotaFiscalObs.Value) <> '' then
    Grava_DadosAdicionaisNFe(DM1.tNotaFiscalObs.AsString,0);

  //Lei 12.741/12
  if StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlr_Tributo.AsFloat)) > 0 then
  begin
    vTexto := '(R$ ' + FormatFloat('###,###,##0.00',DM1.tNotaFiscalVlr_Tributo.AsFloat)
            + ' Vlr. aproximado total de tributos federais, estaduais, e municipais cfe. disposto na lei 12.741/12)';
    Grava_DadosAdicionaisNFe(vTexto,0);
  end;

  vObsSimples            := False;
  vObsSimplesPermiteIcms := False;

  //Situação Tributária
  fNFe.mAuxDadosNFe.First;
  while not fNFe.mAuxDadosNFe.Eof do
  begin
    if fNFe.mAuxDadosNFeTipo.AsString = 'SIT' then
    begin
      DM1.tSitTributaria.IndexFieldNames := 'Codigo';
      DM1.tSitTributaria.SetKey;
      DM1.tSitTributariaCodigo.AsString := fNFe.mAuxDadosNFeCodigo.AsString;
      if (DM1.tSitTributaria.GotoKey) and (DM1.tSitTributariaHistorico.AsString <> '') then
        Grava_DadosAdicionaisNFe(DM1.tSitTributariaHistorico.AsString,0);
    end;

    if fNFe.mAuxDadosNFeTipo.AsString = 'NAT' then
    begin
      DM1.tNatOperacao.IndexFieldNames := 'Codigo';
      DM1.tNatOperacao.SetKey;
      DM1.tNatOperacaoCodigo.AsString := fNFe.mAuxDadosNFeCodigo.AsString;
      if DM1.tNatOperacao.GotoKey then
      begin
        Grava_DadosAdicionaisNFe(DM1.tNatOperacaoLei.Value,0);
        if DM1.tNatOperacaoIcmsSimples.AsBoolean then
          vObsSimplesPermiteIcms := True;
      end;
    end;

    fNFe.mAuxDadosNFe.Next;
  end;

  //Endereço Cobrança
  if DM1.tNotaFiscallkEndPgto.AsString <> '' then
  begin
    vTexto := '';
    if DM1.tCidade.Locate('Codigo',DM1.tClienteCodCidadeP.AsInteger,[loCaseInsensitive]) then
      vTexto := DM1.tCidadeNome.AsString + ' ';
    vTexto := 'End.Cobr. ' +
               DM1.tNotaFiscallkEndPgto.AsString + ' - ' +
               DM1.tNotaFiscallkBairroPgto.AsString + ' - ' +
               vTexto + ' - ' +
               DM1.tNotaFiscallkCepPgto.AsString + ' - ' +
               DM1.tNotaFiscallkUfPgto.AsString + ' ';
    Grava_DadosAdicionaisNFe(vTexto,0);
  end;
  //Nº notas de devolução
  if vTextoNumNotaNFe <> '' then
    Grava_DadosAdicionaisNFe('('+vTextoNumNotaNFe+')',0);

  if (DM1.tFilialSimplesGaucho.AsBoolean) or (DM1.tFilialSimples.AsBoolean) then
  begin
    if (DM1.tParametrosImp2ObsSimples.AsBoolean) or  not(vObsSimplesPermiteIcms) then
      Grava_DadosAdicionaisNFe(DM1.tParametrosObsSimples.Value,0);

    if (DM1.tParametrosImp2ObsSimples.AsBoolean) or (vObsSimplesPermiteIcms) then
    begin
      if (DM1.tFilialUsarICMSimples.AsBoolean) and
         (DM1.tNotaFiscalPercIcmsSimples.AsFloat > 0) and (DM1.tNotaFiscalVlrIcmsSimples.AsFloat > 0) then
      begin
        vTexto := 'Permite o aproveitamento do credito de icms no valor de R$ ' +
                    FormatFloat('###,###,##0.00',DM1.tNotaFiscalVlrIcmsSimples.AsFloat) +
                  ', correspondente a aliquota de ' + FormatFloat('###,###,##0.00',DM1.tNotaFiscalPercIcmsSimples.AsFloat) +
                  ' nos termos do ART.23 da LC 123 ';
        Grava_DadosAdicionaisNFe(vTexto,0);
      end;
    end;
  end;

  //Grava endereço de entrega
  if DM1.tNotaFiscalLocalEntrega.AsBoolean then
  begin
    vTexto := '';
    if DM1.tCliente.Locate('Codigo',DM1.tNotaFiscalCodCli.AsInteger,[loCaseInsensitive]) then
      if DM1.tCidade.Locate('Codigo',DM1.tClienteCodCidadeE.AsInteger,[loCaseInsensitive]) then
        vTexto := DM1.tCidadeNome.AsString + ' ';
    vObsAux := '(Local de Entrega:' +
               DM1.tNotaFiscallkEndEntrega.AsString + ' ' + DM1.tClienteNumEndEntrega.AsString + ' - ' +
               DM1.tClienteComplEnderecoEntrega.AsString + ' ' + DM1.tNotaFiscallkBairroEntrega.AsString + ' ' +
               vTexto + ' ' +
               DM1.tNotaFiscallkCepEntrega.AsString + ' ' +
               DM1.tNotaFiscallkUFEntrega.AsString + ') ';
    Grava_DadosAdicionaisNFe(vObsAux,0);
  end;

  //Transferência de ICMS
  if DM1.tNotaFiscalVlrTransf.AsFloat > 0 then
    Grava_DadosAdicionaisNFe('(Transf.ICMS: R$ ' + FormatFloat('#,###,###,###,##0.00',DM1.tNotaFiscalVlrTransf.AsFloat)+ ') ',0);

  //Dados de importação
  if not DMNotaFiscal.tNotaFiscalImp.IsEmpty then
  begin
    vTexto := '(DI:' + DMNotaFiscal.tNotaFiscalImpNumDI.AsString + ' de ' +
              DMNotaFiscal.tNotaFiscalImpDataRegistro.AsString;
    if DMNotaFiscal.tNotaFiscalImpNroFatura.AsString <> ''  then
      vTexto := vTexto + ' Fatura: ' + DMNotaFiscal.tNotaFiscalImpNroFatura.AsString;
    if DMNotaFiscal.tNotaFiscalImpCodCidade.AsInteger > 0 then
      begin
        vTexto := vTexto + ' Local de Desemb. Aduaneiro: ';
        if DM1.tCidade.Locate('Codigo',DMNotaFiscal.tNotaFiscalImpCodCidade.AsInteger,[loCaseInsensitive]) then
          vTexto := vTexto + DM1.tCidadeNome.AsString + ' - ' + DM1.tCidadeEstado.AsString;
      end;
    vTexto := vTexto + ') ';
    Grava_DadosAdicionaisNFE(vTexto,0);

    //Pis, Cofins e Taxa Siscomex
    if DM1.tNotaFiscalVlrPis.AsFloat > 0 then
      Grava_DadosAdicionaisNFE('(PIS: ' + FormatFloat('###,###,###,##0.00',DM1.tNotaFiscalVlrPis.AsFloat) + ') ',0);
    if DM1.tNotaFiscalVlrCofins.AsFloat > 0 then
      Grava_DadosAdicionaisNFE('(COFINS: ' + FormatFloat('###,###,###,##0.00',DM1.tNotaFiscalVlrCofins.AsFloat) + ') ',0);
    if DM1.tNotaFiscalVlrTaxaCiscomex.AsFloat > 0 then
      Grava_DadosAdicionaisNFE('(Taxa SISCOMEX: ' + FormatFloat('###,###,###,##0.00',DM1.tNotaFiscalVlrTaxaCiscomex.AsFloat) + ') ',0);
    if DM1.tNotaFiscalVlrImpImportacao.AsFloat > 0 then
      Grava_DadosAdicionaisNFE('(Taxa II: ' + FormatFloat('###,###,###,##0.00',DM1.tNotaFiscalVlrImpImportacao.AsFloat) + ') ',0);
  end;

  if StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalDesc.AsFloat)) > 0 then
  begin
    vTexto := '*(DESCONTO: ';
    if DM1.tNotaFiscalDescricaoDesc.AsString <> '' then
      vTexto := vTexto + DM1.tNotaFiscalDescricaoDesc.AsString;
    vTexto := vTexto + ' Vlr: ';
    vTexto := vTexto + FormatFloat('###,###,##0.00',DM1.tNotaFiscalVlrTotalDesc.AsFloat) + ')*';
    Grava_DadosAdicionaisNFe(vTexto,0);
  end;

  if Length(vTexto) > 1 then
    Grava_DadosAdicionaisNFe(vTexto,0);

  if (Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '2') or (Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '3') or
     (Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '5')  then
  begin
    if Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '2' then
      vTexto := '*(FS - '
    else
    if Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '3' then
      vTexto := '*(SCAN - '
    else
    if Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '5' then
      vTexto := '*(FS-DA - ';
    vTexto := vTexto + 'Data e Hora de Entrada em Contingencia:' + DM1.tNotaFiscalDtContingencia.AsString + ' ' + DM1.tNotaFiscalHrContingencia.AsString;
    vTexto := vTexto + ' - Justificativa de Entrada em Contingência: '  + DM1.tNotaFiscalMotivoContingencia.AsString + ')*';
    Grava_DadosAdicionaisNFe(vTexto,0);
  end;

  //22/12/2015
  //Dados do ICMS UF Destino
  vTexto := '';
  if StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVLR_ICMS_FCP.AsFloat)) > 0 then
    vTexto := 'Vlr. ICMS Fundo de Combate a Pobreza: ' + FormatFloat('###,###,##0.00',DM1.tNotaFiscalVLR_ICMS_FCP.AsFloat);
  if (StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVLR_ICMS_UF_DEST.AsFloat)) > 0) or (StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVLR_ICMS_UF_REMET.AsFloat)) > 0) then
  begin
    if vTexto <> '' then
      vTexto := vTexto + ', ';
    vTexto := vTexto + 'Vlr.ICMS UF Dest.: ' + FormatFloat('###,###,##0.00',DM1.tNotaFiscalVLR_ICMS_UF_DEST.AsFloat);
    vTexto := vTexto + ', Vlr.ICMS UF Remet.: ' + FormatFloat('###,###,##0.00',DM1.tNotaFiscalVLR_ICMS_UF_REMET.AsFloat);
  end;
  if trim(vTexto) <> '' then
    Grava_DadosAdicionaisNFe('('+vTexto+')',0);
  //***********
end;

procedure Grava_DadosAdicionaisNFe(DadosAdi: String; Tipo: Integer);
begin
  if fNFe.mDadosAdicionaisNFe.State in [dsBrowse] then
  begin
    DadosAdi := fNFe.TirarAcento(DadosAdi);
    fNFe.mDadosAdicionaisNFe.Edit;
    fNFe.mDadosAdicionaisNFeObs.Value := fNFe.mDadosAdicionaisNFeObs.Value + DadosAdi;
    if tipo = 1 then
      fNFe.mDadosAdicionaisNFeObsAux.Value := fNFe.mDadosAdicionaisNFeObsAux.Value + DadosAdi;
    fNFe.mDadosAdicionaisNFeObs.Value := TrimLeft(fNFe.mDadosAdicionaisNFeObs.Value);
    fNFe.mDadosAdicionaisNFe.Post;
  end;
end;

procedure Monta_mItensNFe;
var
  Texto1, texto2, vTextoTriang, vNomeTriang: String;
  vItemNFe: Integer;
  vNomeAux: String;
  vTextoDesonerado: String;
  vTextoFCI : String;
begin
  DM1.tProduto.IndexFieldNames       := 'Codigo';
  DM1.tMaterial.IndexFieldNames      := 'Codigo';
  DM1.tSitTributaria.IndexFieldNames := 'Codigo';
  vItemNFe := 0;
  fNFe.mAuxDadosNFe.EmptyDataSet;
  fNFe.mItensNFe.EmptyDataSet;
  fNFe.mDadosAdicionaisNFe.EmptyDataSet;
  fNFe.mNotaDevolvidaNFe.EmptyDataSet;

  //21/09/2010
  if DM1.tNotaFiscalNumSeq.AsInteger <> DMNotaFiscal.vNumSeqNFe then
  begin
    ShowMessage('Itens diferente da nota, retornar a tela da nota e enviar novamente!');
    exit;
  end;

  vTextoNumNotaNFe := '';
  DM1.tNotaFiscalItens.First;
  while not DM1.tNotaFiscalItens.Eof do
  begin
    vTextoDetNFe := '';
    inc(vItemNFe);
    if not fNFe.mAuxDadosNFe.Locate('Tipo;Codigo',VarArrayOf(['SIT',DM1.tNotaFiscalItensSitTrib.AsString]),[locaseinsensitive]) then
      Grava_mAuxDadosNFe('SIT',DM1.tNotaFiscalItensSitTrib.AsString);
    if not fNFe.mAuxDadosNFe.Locate('Tipo;Codigo',VarArrayOf(['CFI',DM1.tNotaFiscalItensClasFiscal.AsString]),[locaseinsensitive]) then
      Grava_mAuxDadosNFe('CFI',DM1.tNotaFiscalItensClasFiscal.AsString);
    if not fNFe.mAuxDadosNFe.Locate('Tipo;Codigo',VarArrayOf(['NAT',DM1.tNotaFiscalItensNatOper.AsString]),[locaseinsensitive]) then
      Grava_mAuxDadosNFe('NAT',DM1.tNotaFiscalItensNatOper.AsString);

    if DM1.tNotaFiscalItensMaterial.AsBoolean then
      DM1.tMaterial.FindKey([DM1.tNotaFiscalItensCodProduto.AsInteger])
    else
      DM1.tProduto.FindKey([DM1.tNotaFiscalItensCodProduto.AsInteger]);

    fNFe.mItensNFe.Insert;
    fNFe.mItensNFeTipoReg.AsString    := 'P';
    fNFe.mItensNFeFilial.AsInteger    := DM1.tNotaFiscalFilial.AsInteger;
    fNFe.mItensNFeNumNota.AsInteger   := DM1.tNotaFiscalNumNota.AsInteger;
    fNFe.mItensNFeItemNota.AsInteger  := vItemNFe;
    fNFe.mItensNFeCodNatOper.AsString := DM1.tNotaFiscalItenslkCodNatOper.AsString;
    fNFe.mItensNFeItemOriginal.AsInteger := DM1.tNotaFiscalItensItem.AsInteger;
    if not(DM1.tNotaFiscalItensMaterial.AsBoolean) and (DM1.tProdutoProdMat.AsString = 'N') then
    begin
      fNFe.mItensNFeTipoReg.AsString    := 'O';
      fNFe.mItensNFeCodProduto.AsString := 'CFOP' + DM1.tNotaFiscalItenslkCodNatOper.AsString;
    end
    else
      fNFe.mItensNFeCodProduto.AsString := DM1.tNotaFiscalItensCodProduto.AsString;
    texto2   := '';
    vNomeAux := '';
    fNFe.mItensNFeNomeProduto.AsString  := fNFe.TirarAcento(DM1.tNotaFiscalItensDescricao.AsString + ' ');
    if (copy(DM1.tNotaFiscalItenslkCodNatOper.AsString,1,1) <> '7') and (trim(DM1.tNotaFiscalItenslkNomeCor.AsString) <> '') then
      fNFe.mItensNFeNomeProduto.AsString := fNFe.mItensNFeNomeProduto.AsString + ' ' + fNFe.TirarAcento(DM1.tNotaFiscalItenslkNomeCor.AsString);
    fNFe.mItensNFeNomeProduto.AsString := Trim(fNFe.mItensNFeNomeProduto.AsString);
    if (copy(DM1.tNotaFiscalItenslkCodNatOper.AsString,1,1) = '7') and not(DM1.tNotaFiscalItensMaterial.AsBoolean) and
       (trim(DM1.tProdutoNomeModelo.AsString) <> '') then
    begin
      //texto2 := fNFe.mItensNFeNomeProduto.AsString + ' ' + DM1.tProdutoNomeModelo.AsString;
      //if Length(texto2) <= 53 then
      //  fNFe.mItensNFeNomeProduto.AsString := fNFe.TirarAcento(fNFe.mItensNFeNomeProduto.AsString + ' ' + DM1.tProdutoNomeModelo.AsString)
      //else
        vNomeAux := Trim(fNFe.TirarAcento(DM1.tProdutoNomeModelo.AsString));
    end;
    if trim(vNomeAux) <> '' then
      vTextoDetNFe := vNomeAux + ' ';

    fNFe.mItensNFeQtd.AsFloat         := DM1.tNotaFiscalItensQtd.AsFloat;
    fNFe.mItensNFeUnidade.AsString    := DM1.tNotaFiscalItensUnidade.AsString;
    fNFe.mItensNFeVlrUnitario.AsFloat := DM1.tNotaFiscalItensVlrUnit.AsFloat;
    //04/07/2017  Unidade de Tributação
    if trim(DM1.tNotaFiscalItensUNIDADE_TRIB.AsString) <> '' then
      fNFe.mItensNFeUNIDADE_TRIB.AsString := DM1.tNotaFiscalItensUNIDADE_TRIB.AsString
    else
      fNFe.mItensNFeUNIDADE_TRIB.AsString := DM1.tNotaFiscalItensUnidade.AsString;
    if StrToFloat(FormatFloat('0.0000',DM1.tNotaFiscalItensQTD_TRIB.AsFloat)) > 0 then
      fNFe.mItensNFeQTD_TRIB.AsFloat := DM1.tNotaFiscalItensQTD_TRIB.AsFloat
    else
      fNFe.mItensNFeQTD_TRIB.AsFloat := DM1.tNotaFiscalItensQtd.AsFloat;
    if StrToFloat(FormatFloat('0.000000000',DM1.tNotaFiscalItensVLR_UNITARIO_TRIB.AsFloat)) > 0 then
      fNFe.mItensNFeVLR_UNITARIO_TRIB.AsFloat := DM1.tNotaFiscalItensVLR_UNITARIO_TRIB.AsFloat
    else
      fNFe.mItensNFeVLR_UNITARIO_TRIB.AsFloat := DM1.tNotaFiscalItensVlrUnit.AsFloat;
    //****************
    fNFe.mItensNFeVlrTotal.AsFloat    := DM1.tNotaFiscalItensVlrTotal.AsFloat +
                                         DM1.tNotaFiscalItensVlrDesconto.AsFloat +
                                         DM1.tNotaFiscalItensVlrDescontoRateio.AsFloat;
    if DM1.tParametrosSomarNoProdFrete.AsBoolean then
      fNFe.mItensNFeVlrTotal.AsFloat := DM1.tNotaFiscalItensVlrTotal.AsFloat + DM1.tNotaFiscalItensVlrFrete.AsFloat;
    if DM1.tParametrosSomarNoProdOutrasDesp.AsBoolean then
      fNFe.mItensNFeVlrTotal.AsFloat := DM1.tNotaFiscalItensVlrTotal.AsFloat + DM1.tNotaFiscalItensVlrOutrasDespesas.AsFloat;
    if DM1.tParametrosSomarNoProdSeguro.AsBoolean then
      fNFe.mItensNFeVlrTotal.AsFloat := DM1.tNotaFiscalItensVlrTotal.AsFloat + DM1.tNotaFiscalItensVlrSeguro.AsFloat;

    fNFe.mItensNFeAliqIcms.AsFloat        := DM1.tNotaFiscalItensIcms.AsFloat;
    fNFe.mItensNFeAliqIpi.AsFloat         := DM1.tNotaFiscalItensIpi.AsFloat;
    fNFe.mItensNFeVlrIcms.AsFloat         := DM1.tNotaFiscalItensVlrIcms.AsFloat;
    fNFe.mItensNFeVlrIpi.AsFloat          := DM1.tNotaFiscalItensVlrIpi.AsFloat;
    fNFe.mItensNFeBaseIcmsSimples.AsFloat := DM1.tNotaFiscalItensBaseIcmsSimples.AsFloat;
    fNFe.mItensNFeVlrIcmsSimples.AsFloat  := DM1.tNotaFiscalItensVlrIcmsSimples.AsFloat;
    fNFe.mItensNFeVlrPis.AsFloat          := DM1.tNotaFiscalItensVlrPis.AsFloat;
    fNFe.mItensNFeVlrCofins.AsFloat       := DM1.tNotaFiscalItensVlrCofins.AsFloat;
    fNFe.mItensNFeVlrFrete.AsFloat        := DM1.tNotaFiscalItensVlrFrete.AsFloat;
    fNFe.mItensNFeVlrSeguro.AsFloat       := DM1.tNotaFiscalItensVlrSeguro.AsFloat;
    fNFe.mItensNFeVlrOutrasDespesas.AsFloat  := DM1.tNotaFiscalItensVlrOutrasDespesas.AsFloat;
    fNFe.mItensNFeSomaVlrTotalProd.AsBoolean := DM1.tNotaFiscalItensSomaVlrTotalProd.AsBoolean;
    fNFe.mItensNFeVlrTributos.AsFloat    := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlr_Tributo.AsFloat));
    fNFe.mItensNFeCodSitTrib.AsString    := DM1.tNotaFiscalItensOrigemProd.AsString + DM1.tNotaFiscalItenslkSitTributaria.AsString;
    fNFe.mItensNFeAliqSitTrib.AsFloat    := DM1.tNotaFiscalItenslkPercSitTributaria.AsFloat;
    fNFe.mItensNFeClasFiscalRed.AsString := DM1.tNotaFiscalItensClasFiscal.AsString;
    fNFe.mItensNFeClasFiscal.AsString    := DM1.tNotaFiscalItensClasFiscal.AsString;
    fNFe.mItensNFePedidoCliente.AsString := DM1.tNotaFiscalItensNumPedido.AsString;
    fNFe.mItensNFeItemPedido.AsInteger   := DM1.tNotaFiscalItensItemPedido.AsInteger;
    fNFe.mItensNFeVlrDesconto.AsFloat    := DM1.tNotaFiscalItensVlrDesconto.AsFloat + DM1.tNotaFiscalItensVlrDescontoRateio.AsFloat;

    fNFe.mItensNFeBaseICMS.AsFloat    := DM1.tNotaFiscalItensBaseIcms.AsFloat;
    fNFe.mItensNFePercRedICMS.AsFloat := 0;
    fNFe.mItensNFeCodCSTIPI.AsString  := DM1.tNotaFiscalItensCodCSTIPI.AsString;
    if (fNFe.mItensNFeCodCSTIPI.AsString = '') and (DM1.tNotaFiscalSaidaEntrada.AsString = 'E') then
      fNFe.mItensNFeCodCSTIPI.AsString := '02'
    else
    if (fNFe.mItensNFeCodCSTIPI.AsString = '') and (DM1.tNotaFiscalSaidaEntrada.AsString = 'S') then
      fNFe.mItensNFeCodCSTIPI.AsString := '52';
    fNFe.mItensNFeCodCofins.AsString  := DM1.tNotaFiscalItensCodCofins.AsString;
    fNFe.mItensNFeCodPis.AsString     := DM1.tNotaFiscalItensCodPis.AsString;
    fNFe.mItensNFeTipoPis.AsString    := DM1.tNotaFiscalItensTipoPis.AsString;
    fNFe.mItensNFeTipoCofins.AsString := DM1.tNotaFiscalItensTipoCofins.AsString;
    fNFe.mItensNFeVlrBaseImportacao.AsFloat := DM1.tNotaFiscalItensVlrBaseImportacao.AsFloat;
    fNFe.mItensNFeVlrImportacao.AsFloat     := DM1.tNotaFiscalItensVlrImportacao.AsFloat;
    fNFe.mItensNFeVlrIOF.AsFloat            := DM1.tNotaFiscalItensVlrIOF.AsFloat;
    fNFe.mItensNFeVlrDespAduaneira.AsFloat  := DM1.tNotaFiscalItensVlrAduaneira.AsFloat;

    if DM1.tSitTributaria.FindKey([DM1.tNotaFiscalItensSitTrib.AsInteger]) then
      fNFe.mItensNFePercRedICMS.AsFloat  := 100 - StrToFloat(FormatFloat('0.0000',DM1.tSitTributariaSitTributaria.AsFloat));
    if (DM1.tNotaFiscalItensMaterial.AsBoolean) and (Trim(DM1.tMaterialComplemento.AsString) <> '') then
      vTextoDetNFe := fNFE.TirarAcento(Dm1.tMaterialComplemento.AsString) + ' '
    else
    if not(DM1.tNotaFiscalItensMaterial.AsBoolean) and (Trim(DM1.tProdutoComplemento.AsString) <> '') then
      vTextoDetNFe := fNFE.TirarAcento(Dm1.tProdutoComplemento.AsString) + ' ';

    vNomeTriang  := '';
    vTextoTriang := '';
    if (DM1.tNotaFiscalItensMaterial.AsBoolean) and (DM1.tNotaFiscalGrade.RecordCount > 0) then
    begin
      Texto1 := '';
      DM1.tNotaFiscalGrade.First;
      while not DM1.tNotaFiscalGrade.Eof do
      begin
        if DM1.tNotaFiscalGradeQtd.AsFloat > 0 then
          Texto1 := Texto1 + DM1.tNotaFiscalGradelkTamanho.AsString + '=' + DM1.tNotaFiscalGradeQtd.AsString + ' ';
        DM1.tNotaFiscalGrade.Next;
      end;
      vTextoDetNFe := vTextoDetNFe + '(' + Texto1 + ') ';
    end;
    if vTextoDetNFe <> '' then
      fNFe.mItensNFeInfAdicionais.Value := vTextoDetNFe + ' ';

    //14/09/2009 foi incluido para gravar a obsauxiliar aqui neste campo
    if Trim(DM1.tNotaFiscalItensObsComplementar.AsString) <> '' then
    begin
      if Trim(fNFe.mItensNFeInfAdicionais.Value) = '' then
        fNFe.mItensNFeInfAdicionais.Value := DM1.tNotaFiscalItensObsComplementar.AsString
      else
        fNFe.mItensNFeInfAdicionais.Value := fNFe.mItensNFeInfAdicionais.Value + ' (' + DM1.tNotaFiscalItensObsComplementar.AsString + ')';
    end;

    //Lei 12.741/12
    if StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlr_Tributo.AsFloat)) > 0 then
    begin
      Texto1 := '(Valor de Tributos: ' + FormatFloat('####,###,##0.00',DM1.tNotaFiscalItensVlr_Tributo.AsFloat) + ')';
      fNFe.mItensNFeInfAdicionais.Value := fNFe.mItensNFeInfAdicionais.Value + Texto1;
    end;

    //3.10  21/03/2015
    vTextoDesonerado := '';
    //fDMNFe.mItensNFePercIcmsSubstInterno.AsFloat  := StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMSSUBST_INTERNO.AsFloat));
    fNFe.mItensNFeVlrIcmsDesonerado.AsFloat     := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVLR_ICMSDESONERADO.AsFloat));
    fNFe.mItensNFeCodMotivoDesonerado.AsInteger := DM1.tNotaFiscalItensCOD_DESONERACAO.AsInteger;
    if (DM1.tParametrosVersaoNFe.AsString = '3.10') and (DM1.tParametrosUSA_DESONERACAO.AsString = 'S') then
    begin
      if (StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVLR_ICMSDESONERADO.AsFloat)) > 0) and (DM1.tNotaFiscalItensCOD_DESONERACAO.AsInteger > 0) then
        vTextoDesonerado := '(Valor Dispensado R$ ' + FormatFloat('###,###,##0.00',DM1.tNotaFiscalItensVLR_ICMSDESONERADO.AsFloat)
                          + ', Motivo da Desoneração do ICMS ' + DM1.tNotaFiscalItensCOD_DESONERACAO.AsString + ')';
    end;
    if trim(vTextoDesonerado) <> '' then
      fNFe.mItensNFeInfAdicionais.Value := fNFe.mItensNFeInfAdicionais.Value + vTextoDesonerado;
    //21/08/2015
    fNFe.mItensNFeVlrIcmsOperacao.AsFloat    := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVLR_ICMSOPERACAO.AsFloat));
    if DM1.tSitTributaria.Locate('Codigo',DM1.tNotaFiscalItensSitTrib.AsInteger,[loCaseInsensitive]) then
    begin
      fNFe.mItensNFePercTribIcms.AsFloat := StrToFloat(FormatFloat('0.0000',DM1.tSitTributariaSitTributaria.AsFloat));
      if (DM1.tSitTributariaCodSit.AsString = '51') and (StrToFloat(FormatFloat('0.0000',DM1.tSitTributariaSitTributaria.AsFloat)) <= 0) then
        fNFe.mItensNFePercTribIcms.AsFloat := StrToFloat(FormatFloat('0.0000',100));
    end;
    fNFe.mItensNFePercDiferimento.AsFloat    := StrToFloat(FormatFloat('0.0000',DM1.tNotaFiscalItensPERC_DIFERIMENTO.AsFloat));
    fNFe.mItensNFeVlrIcmsDiferido.AsFloat    := StrToFloat(FormatFloat('0.0000',DM1.tNotaFiscalItensVLR_ICMSDIFERIDO.AsFloat));
    //*************
    //22/12/2015 
    if DM1.tNotaFiscalItensID_ENQIPI.AsInteger <= 0 then
      fNFe.mItensNFeCod_EnqIPI.AsString := '999'
    else
    if DM1.tNotaFiscalItensID_ENQIPI.AsInteger > 0 then
    begin
      DMTabEnqIPI.Abre_Tab_EnqIPI(DM1.tNotaFiscalItensID_ENQIPI.AsInteger);
      fNFe.mItensNFeCod_EnqIPI.AsString := DMTabEnqIPI.cdsEnqIPICODIGO.AsString;
    end;
    //*************

    vTextoFCI := '';
    if not(DM1.tNotaFiscalItensMaterial.AsBoolean) and (trim(DM1.tProdutoNum_FCI.AsString) <> '') then
      vTextoFCI := '(Resolução do Senado Federal nº 13/2012, % usado ' + FormatFloat('0.00#',DM1.tProdutoPERC_USADO_FCI.AsFloat) + '%'
                 + ' Numero da FCI ' + DM1.tProdutoNum_FCI.AsString + ')'
    else
    if (DM1.tNotaFiscalItensMaterial.AsBoolean) and (trim(DM1.tMaterialNum_FCI.AsString) <> '') then
      vTextoFCI := '(Resolução do Senado Federal nº 13/2012, % usado ' + FormatFloat('0.00#',DM1.tMaterialPERC_USADO_FCI.AsFloat) + '%'
                 + ' Numero da FCI ' + DM1.tMaterialNum_FCI.AsString + ')';
    if trim(vTextoFCI) <> '' then
      fNFe.mItensNFeInfAdicionais.Value := fNFe.mItensNFeInfAdicionais.Value + vTextoFCI;
    fNFe.mItensNFeInfAdicionais.Value := Trim(fNFe.mItensNFeInfAdicionais.Value);

    //22/12/2015
    fNFe.mItensNFePerc_ICMS_FCP.AsFloat      := StrToFloat(FormatFloat('0.000',DM1.tNotaFiscalItensPERC_ICMS_FCP.AsFloat));
    fNFe.mItensNFePerc_ICMS_UF_Dest.AsFloat  := StrToFloat(FormatFloat('0.000',DM1.tNotaFiscalItensPERC_ICMS_UF_DEST.AsFloat));
    fNFe.mItensNFePerc_ICMS_Partilha.AsFloat := StrToFloat(FormatFloat('0.000',DM1.tNotaFiscalItensPERC_ICMS_PARTILHA.AsFloat));
    fNFe.mItensNFeVlr_ICMS_FCP.AsFloat       := StrToFloat(FormatFloat('0.000',DM1.tNotaFiscalItensVLR_ICMS_FCP.AsFloat));
    fNFe.mItensNFeVlr_ICMS_UF_Dest.AsFloat   := StrToFloat(FormatFloat('0.000',DM1.tNotaFiscalItensVLR_ICMS_UF_DEST.AsFloat));
    fNFe.mItensNFeVlr_ICMS_UF_Remet.AsFloat  := StrToFloat(FormatFloat('0.000',DM1.tNotaFiscalItensVLR_ICMS_UF_REMET.AsFloat));
    //*******

    fNFe.mItensNFe.Post;
    DM1.tNotaFiscalItens.Next;
  end;
  fNFe.mItensNFe.First;

  if not fNFe.mAuxDadosNFe.Locate('Tipo;Codigo',VarArrayOf(['NAT',DM1.tNotaFiscalCodNatOper.AsInteger]),[locaseinsensitive]) then
    Grava_mAuxDadosNFe('NAT',DM1.tNotaFiscalCodNatOper.AsString);
end;

end.

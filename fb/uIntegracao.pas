unit uIntegracao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, DB,
  Mask, DBTables, QRCTRLS, ToolEdit, ComCtrls, JPEG, SqlExpr, dbXPress, Variants;

procedure Prc_Gravar_Cliente_FB(Codigo: Integer);
procedure Prc_Excluir_Cliente_FB(Codigo: Integer);

procedure Prc_Gravar_Produto_FB(Codigo: Integer);
procedure Prc_Excluir_Produto_FB(Codigo: Integer);

procedure Prc_Gravar_Material_FB(Codigo: Integer);
procedure Prc_Excluir_Material_FB(Codigo: Integer);

procedure Prc_Gravar_Cor_FB(Codigo: Integer);
procedure Prc_Excluir_Cor_FB(Codigo: Integer);

procedure Prc_Gravar_TalaoGrade_FB(Lote, Item, Talao: Integer);
procedure Prc_Excluir_TalaoGrade_FB(Lote, Item, Talao: Integer);

procedure Prc_Gravar_TalaoMov_FB(Lote, Talao, Setor: Integer);
procedure Prc_Excluir_TalaoMov_FB(Lote, Talao, Setor: Integer);

procedure Prc_Gravar_Talao_FB(Lote, Item : Integer);
procedure Prc_Excluir_Talao_FB(Lote, Item : Integer);

procedure Prc_Gravar_Lote_FB(Lote : Integer);
procedure Prc_Excluir_Lote_FB(Lote : Integer);

function ProximaSequencia(NomeTabela: String; Filial: Integer): Integer;

implementation

uses
  UDm1, DmdDatabase, dmdCadTalaoGrade, dmdCadTalaoMov, dmdCadTalao, dmdCadLote,
  dmdCadProduto, dmdCadMaterial, dmdCadCliente;

function ProximaSequencia(NomeTabela: String; Filial: Integer): Integer;
var
  sds: TSQLDataSet;
  iSeq: Integer;
  ID: TTransactionDesc;
  Flag: Boolean;
begin
  Result := 0;
  sds := TSQLDataSet.Create(nil);
  try

    ID.TransactionID := 999;  // --
    ID.IsolationLevel := xilREADCOMMITTED;          //--

    dmDatabase.scoDados.StartTransaction(ID);
    try //--
      sds.SQLConnection := dmDatabase.scoDados; //--

      sds.NoMetadata    := True;
      sds.GetMetadata   := False;
      //Esse comando foi tirado porque demora muito, as máquinas estavam demorando até 20 segundos para confirmar
     //sds.CommandText := 'SELECT NUMREGISTRO FROM SEQUENCIAL WHERE TABELA = :TABELA AND FILIAL = :FILIAL FOR UPDATE WITH LOCK';

      sds.CommandText :=  ' UPDATE SEQUENCIAL SET NUMREGISTRO = ( SELECT MAX(NUMREGISTRO)+1 '+
                          '                                         FROM SEQUENCIAL         '+
                          '                                        WHERE TABELA = :TABELA   '+
                          '                                          AND FILIAL = :FILIAL)  ' +
                          '  WHERE TABELA = :TABELA   '+
                          '  AND FILIAL = :FILIAL  ';

      sds.ParamByName('TABELA').AsString  := NomeTabela;
      sds.ParamByName('FILIAL').AsInteger := Filial;

      Flag := False;
      While Not Flag do
      Begin
         try
            sds.Close;
            sds.ExecSQL;
            Flag := True;
         Except
           On E: Exception do
              Flag := False;
         End;
      End;

      sds.Close;
      sds.CommandText :=  ' SELECT MAX(NUMREGISTRO) NUMREGISTRO  '+
                          '   FROM SEQUENCIAL                    '+
                          '  WHERE TABELA = :TABELA              '+
                          '    AND FILIAL = :FILIAL              ';

      sds.ParamByName('TABELA').AsString  := NomeTabela;
      sds.ParamByName('FILIAL').AsInteger := Filial;
      sds.Open;

      iSeq := sds.FieldByName('NUMREGISTRO').AsInteger;


//      iSeq := sds.FieldByName('NUMREGISTRO').AsInteger+1;

//      if iSeq = 1 then
//        DMEstoque.scoBancoFirebird.ExecuteDirect('INSERT INTO SEQUENCIAL(TABELA, FILIAL , NUMREGISTRO) VALUES( ''' + NomeTabela + ''', ''' + IntToStr(Filial) + ''', ''' + IntToStr(iSeq) + ''' ) ')
//      else
//        DMEstoque.scoBancoFirebird.ExecuteDirect('UPDATE SEQUENCIAL SET NUMREGISTRO = ''' + IntToStr(iSeq) + '''WHERE TABELA = ''' + NomeTabela+''' AND FILIAL = ''' + IntToStr(FILIAL) +'''');

      dmDatabase.scoDados.Commit(ID);

      Result := iSeq;

    except //--
      dmDatabase.scoDados.Rollback(ID);  //--
      raise; //--
    end;   //--

  finally
    FreeAndNil(sds);
  end;
end;


////////////////////////////////////////////////////////////////////
/////////////////////////// CLIENTE ////////////////////////////////
////////////////////////////////////////////////////////////////////

procedure Prc_Gravar_Cliente_FB(Codigo: Integer);
var
   FDmCadCliente: TdmCadCliente;
   x: Integer;
begin

   // Verifica se o registro já não se encontra no paradox.
   if DM1.tCliente.Locate('Codigo', Codigo, [loCaseInsensitive]) then
   begin
      FDmCadCliente := TdmCadCliente.Create(Nil);
      try
         // Localiza a nota fiscal na base do firebird.
         if not FDmCadCliente.LocalizarRegistro(False, Codigo) then
            FDmCadCliente.IncluirRegistro
         else
           FDmCadCliente.EditarRegistro;

         // Inseri a nota do paradox na tabela do firebird.
         for x:=0 to (DM1.tCliente.FieldCount-1) do
         begin
            if not (DM1.tCliente.Fields[x].FieldKind in [fkLookup, fkCalculated]) then
            begin
              if DM1.tCliente.Fields[x].DataType =  ftBoolean  then
              begin
                 if (not DM1.tCliente.Fields[x].AsBoolean) or (DM1.tCliente.Fields[x].IsNull) then
                    FDmCadCliente.cdsCliente.FieldByName(DM1.tCliente.Fields[x].FieldName).AsVariant :=  'N'
                 else
                    FDmCadCliente.cdsCliente.FieldByName(DM1.tCliente.Fields[x].FieldName).AsVariant :=  'S'
              end
              else
                FDmCadCliente.cdsCliente.FieldByName(DM1.tCliente.Fields[x].FieldName).AsVariant := DM1.tCliente.Fields[x].Value
            end;
         end;
         FDmCadCliente.cdsCliente.Post;
         //
         FDmCadCliente.GravarRegistro;
         //
      finally
         FreeAndNil(FDmCadCliente);
      end;
   end;
end;

procedure Prc_Excluir_Cliente_FB(Codigo: Integer);
Var
   FDmCadCliente: TDmCadCliente;
begin
   FDmCadCliente := TDmCadCliente.Create(Nil);
   try
      If FDmCadCliente.LocalizarRegistro(False, Codigo) then
         FDmCadCliente.ExcluirRegistro;
      FDmCadCliente.GravarRegistro;
   finally
      FreeAndNil(FDmCadCliente);
   end;
end;


////////////////////////////////////////////////////////////////////
/////////////////////////// PRODUTO ////////////////////////////////
////////////////////////////////////////////////////////////////////
procedure Prc_Gravar_Produto_FB(Codigo: Integer);
var
   FDmCadProduto: TdmCadProduto;
   x: Integer;
begin

   // Verifica se o registro já não se encontra no paradox.
   if DM1.tProduto.Locate('Codigo', Codigo, [loCaseInsensitive]) then
   begin
      FDmCadProduto := TdmCadProduto.Create(Nil);
      try
         // Localiza a nota fiscal na base do firebird.
         if not FDmCadProduto.LocalizarRegistro(False, Codigo) then
            FDmCadProduto.IncluirRegistro
         else
           FDmCadProduto.EditarRegistro;

         // Inseri a nota do paradox na tabela do firebird.
         for x:=0 to (DM1.tProduto.FieldCount-1) do
         begin
            if not (DM1.tProduto.Fields[x].FieldKind in [fkLookup, fkCalculated]) then
            begin
              if DM1.tProduto.Fields[x].DataType =  ftBoolean  then
              begin
                 if (not DM1.tProduto.Fields[x].AsBoolean) or (DM1.tProduto.Fields[x].IsNull) then
                    FDmCadProduto.cdsProduto.FieldByName(DM1.tProduto.Fields[x].FieldName).AsVariant :=  'N'
                 else
                    FDmCadProduto.cdsProduto.FieldByName(DM1.tProduto.Fields[x].FieldName).AsVariant :=  'S'
              end
              else
                FDmCadProduto.cdsProduto.FieldByName(DM1.tProduto.Fields[x].FieldName).AsVariant := DM1.tProduto.Fields[x].Value
            end;
         end;
         FDmCadProduto.cdsProduto.Post;
         //
         FDmCadProduto.GravarRegistro;
         //
      finally
         FreeAndNil(FDmCadProduto);
      end;
   end;

end;

procedure Prc_Excluir_Produto_FB(Codigo: Integer);
Var
   FDmCadProduto: TDmCadProduto;
begin
   FDmCadProduto := TDmCadProduto.Create(Nil);
   try
      If FDmCadProduto.LocalizarRegistro(False, Codigo) then
         FDmCadProduto.ExcluirRegistro;
      FDmCadProduto.GravarRegistro;
   finally
      FreeAndNil(FDmCadProduto);
   end;
end;

////////////////////////////////////////////////////////////////////
/////////////////////////// MATERIAL ///////////////////////////////
////////////////////////////////////////////////////////////////////
procedure Prc_Gravar_Material_FB(Codigo: Integer);
var
   FDmCadMaterial: TdmCadMaterial;
   x: Integer;
begin

   // Verifica se o registro já não se encontra no paradox.
   if DM1.tMaterial.Locate('Codigo', Codigo, [loCaseInsensitive]) then
   begin
      FDmCadMaterial := TdmCadMaterial.Create(Nil);
      try
         // Localiza a nota fiscal na base do firebird.
         if not FDmCadMaterial.LocalizarRegistro(False, Codigo) then
            FDmCadMaterial.IncluirRegistro
         else
           FDmCadMaterial.EditarRegistro;

         // Inseri a nota do paradox na tabela do firebird.
         for x:=0 to (DM1.tMaterial.FieldCount-1) do
         begin
            if not (DM1.tMaterial.Fields[x].FieldKind in [fkLookup, fkCalculated]) then
            begin
              if DM1.tMaterial.Fields[x].DataType =  ftBoolean  then
              begin
                 if (not DM1.tMaterial.Fields[x].AsBoolean) or (DM1.tMaterial.Fields[x].IsNull) then
                    FDmCadMaterial.cdsMaterial.FieldByName(DM1.tMaterial.Fields[x].FieldName).AsVariant :=  'N'
                 else
                    FDmCadMaterial.cdsMaterial.FieldByName(DM1.tMaterial.Fields[x].FieldName).AsVariant :=  'S'
              end
              else
                FDmCadMaterial.cdsMaterial.FieldByName(DM1.tMaterial.Fields[x].FieldName).AsVariant := DM1.tMaterial.Fields[x].Value
            end;
         end;
         FDmCadMaterial.cdsMaterial.Post;
         //
         FDmCadMaterial.GravarRegistro;
         //
      finally
         FreeAndNil(FDmCadMaterial);
      end;
   end;

end;

procedure Prc_Excluir_Material_FB(Codigo: Integer);
Var
   FDmCadMaterial: TDmCadMaterial;
begin
   FDmCadMaterial := TDmCadMaterial.Create(Nil);
   try
      If FDmCadMaterial.LocalizarRegistro(False, Codigo) then
         FDmCadMaterial.ExcluirRegistro;
      FDmCadMaterial.GravarRegistro;
   finally
      FreeAndNil(FDmCadMaterial);
   end;
end;

////////////////////////////////////////////////////////////////
/////////////////////////// COR ////////////////////////////////
////////////////////////////////////////////////////////////////

procedure Prc_Gravar_Cor_FB(Codigo: Integer);
begin
end;

procedure Prc_Excluir_Cor_FB(Codigo: Integer);
begin
end;




/////////////////////////////////////////////////////////////
/////////////////////  TALÃO GRADE //////////////////////////
/////////////////////////////////////////////////////////////

procedure Prc_Gravar_TalaoGrade_FB(Lote, Item, Talao : Integer);
var
   FDMTalaoGrade: TdmCadTalaoGrade;
   x: Integer;
begin
   // Verifica se o registro já não se encontra no paradox.
   if not DM1.tTalaoGrade.Locate('Lote;Item;Talao',VarArrayOf([Lote,Item,Talao]),[locaseinsensitive]) then
     exit;

    FDMTalaoGrade := TDMCadTalaoGrade.Create(Nil);
    try
       // Localiza o preço na base do firebird.
       if not FDMTalaoGrade.LocalizarRegistro(False, Lote,Item,Talao) then
          FDMTalaoGrade.IncluirRegistro
       else
         FDMTalaoGrade.EditarRegistro;

       // Inseri o preço do paradox na tabela do firebird.
       for x:=0 to (DM1.tTalaoGrade.FieldCount-1) do
       begin
          if not (DM1.tTalaoGrade.Fields[x].FieldKind in [fkLookup, fkCalculated]) then
          begin
            if DM1.tTalaoGrade.Fields[x].DataType =  ftBoolean  then
            begin
               if (not DM1.tTalaoGrade.Fields[x].AsBoolean) or (DM1.tTalaoGrade.Fields[x].IsNull) then
                  FDMTalaoGrade.cdsTalaoGrade.FieldByName(DM1.tTalaoGrade.Fields[x].FieldName).AsVariant :=  'N'
               else
                  FDMTalaoGrade.cdsTalaoGrade.FieldByName(DM1.tTalaoGrade.Fields[x].FieldName).AsVariant :=  'S'
            end
            else
              FDMTalaoGrade.cdsTalaoGrade.FieldByName(DM1.tTalaoGrade.Fields[x].FieldName).AsVariant := DM1.tTalaoGrade.Fields[x].Value
          end;
       end;
       FDMTalaoGrade.cdsTalaoGrade.Post;
       //
       FDMTalaoGrade.GravarRegistro;
       //
    finally
       FreeAndNil(FDMTalaoGrade);
    end;
end;

procedure Prc_Excluir_TalaoGrade_FB(Lote, Item, Talao: Integer);
Var
   FDMTalaoGrade: TDMCadTalaoGrade;
begin
   FDMTalaoGrade := TDMCadTalaoGrade.Create(Nil);
   try
      If FDMTalaoGrade.LocalizarRegistro(False, Lote, Item, Talao) then
        FDMTalaoGrade.ExcluirRegistro;
      FDMTalaoGrade.GravarRegistro;
   finally
      FreeAndNil(FDMTalaoGrade);
   end;
end;




/////////////////////////////////////////////////////////////
/////////////////////  TALÃO MOV ////////////////////////////
/////////////////////////////////////////////////////////////

procedure Prc_Gravar_TalaoMov_FB(Lote, Talao, Setor: Integer);
var
   FDMTalaoMov: TdmCadTalaoMov;
   x: Integer;
begin
   // Verifica se o registro já não se encontra no paradox.
   if not DM1.tTalaoMov.Locate('Lote;Talao;Setor',VarArrayOf([Lote,Talao,Setor]),[locaseinsensitive]) then
     exit;

    FDMTalaoMov := TDMCadTalaoMov.Create(Nil);
    try
       // Localiza o preço na base do firebird.
       if not FDMTalaoMov.LocalizarRegistro(False, Lote,Talao,Setor) then
          FDMTalaoMov.IncluirRegistro
       else
         FDMTalaoMov.EditarRegistro;

       // Inseri o preço do paradox na tabela do firebird.
       for x:=0 to (DM1.tTalaoMov.FieldCount-1) do
       begin
          if not (DM1.tTalaoMov.Fields[x].FieldKind in [fkLookup, fkCalculated]) then
          begin
            if DM1.tTalaoMov.Fields[x].DataType =  ftBoolean  then
            begin
               if (not DM1.tTalaoMov.Fields[x].AsBoolean) or (DM1.tTalaoMov.Fields[x].IsNull) then
                  FDMTalaoMov.cdsTalaoMov.FieldByName(DM1.tTalaoMov.Fields[x].FieldName).AsVariant :=  'N'
               else
                  FDMTalaoMov.cdsTalaoMov.FieldByName(DM1.tTalaoMov.Fields[x].FieldName).AsVariant :=  'S'
            end
            else
              FDMTalaoMov.cdsTalaoMov.FieldByName(DM1.tTalaoMov.Fields[x].FieldName).AsVariant := DM1.tTalaoMov.Fields[x].Value
          end;
       end;
       FDMTalaoMov.cdsTalaoMov.Post;
       //
       FDMTalaoMov.GravarRegistro;
       //
    finally
       FreeAndNil(FDMTalaoMov);
    end;
end;

procedure Prc_Excluir_TalaoMov_FB(Lote, Talao, Setor: Integer);
Var
   FDMTalaoMov: TDMCadTalaoMov;
begin
   FDMTalaoMov := TDMCadTalaoMov.Create(Nil);
   try
      If FDMTalaoMov.LocalizarRegistro(False, Lote, Talao, Setor) then
        FDMTalaoMov.ExcluirRegistro;
      FDMTalaoMov.GravarRegistro;
   finally
      FreeAndNil(FDMTalaoMov);
   end;
end;




//////////////////////////////////////////////////////////
/////////////////////  TALÃO  ////////////////////////////
/////////////////////////////////////////////////////////

procedure Prc_Gravar_Talao_FB(Lote, Item : Integer);
var
   FDMTalao: TdmCadTalao;
   x: Integer;
begin
   // Verifica se o registro já não se encontra no paradox.
   if not DM1.tTalao.Locate('Lote;Item',VarArrayOf([Lote,Item]),[locaseinsensitive]) then
     exit;

    FDMTalao := TDMCadTalao.Create(Nil);
    try
       // Localiza o preço na base do firebird.
       if not FDMTalao.LocalizarRegistro(False, Lote,Item) then
          FDMTalao.IncluirRegistro
       else
         FDMTalao.EditarRegistro;

       // Inseri o preço do paradox na tabela do firebird.
       for x:=0 to (DM1.tTalao.FieldCount-1) do
       begin
          if not (DM1.tTalao.Fields[x].FieldKind in [fkLookup, fkCalculated]) then
          begin
            if DM1.tTalao.Fields[x].DataType =  ftBoolean  then
            begin
               if (not DM1.tTalao.Fields[x].AsBoolean) or (DM1.tTalao.Fields[x].IsNull) then
                  FDMTalao.cdsTalao.FieldByName(DM1.tTalao.Fields[x].FieldName).AsVariant :=  'N'
               else
                  FDMTalao.cdsTalao.FieldByName(DM1.tTalao.Fields[x].FieldName).AsVariant :=  'S'
            end
            else
              FDMTalao.cdsTalao.FieldByName(DM1.tTalao.Fields[x].FieldName).AsVariant := DM1.tTalao.Fields[x].Value
          end;
       end;
       FDMTalao.cdsTalao.Post;
       //
       FDMTalao.GravarRegistro;
       //
    finally
       FreeAndNil(FDMTalao);
    end;
end;

procedure Prc_Excluir_Talao_FB(Lote, Item: Integer);
Var
   FDMTalao: TDMCadTalao;
begin
   FDMTalao := TDMCadTalao.Create(Nil);
   try
      If FDMTalao.LocalizarRegistro(False, Lote, Item) then
        FDMTalao.ExcluirRegistro;
      FDMTalao.GravarRegistro;
   finally
      FreeAndNil(FDMTalao);
   end;
end;


//////////////////////////////////////////////////////////////////
/////////////////////////// LOTE /////////////////////////////////
//////////////////////////////////////////////////////////////////

procedure Prc_Gravar_Lote_FB(Lote: Integer);
var
   FDmCadLote: TdmCadLote;
   x: Integer;
begin

   // Verifica se o registro já não se encontra no paradox.
   if DM1.tLote.Locate('Lote', Lote, [loCaseInsensitive]) then
   begin
      FDmCadLote := TdmCadLote.Create(Nil);
      try
         // Localiza a nota fiscal na base do firebird.
         if not FDmCadLote.LocalizarRegistro(False, Lote) then
            FDmCadLote.IncluirRegistro
         else
           FDmCadLote.EditarRegistro;

         // Inseri a nota do paradox na tabela do firebird.
         for x:=0 to (DM1.tLote.FieldCount-1) do
         begin
            if not (DM1.tLote.Fields[x].FieldKind in [fkLookup, fkCalculated]) then
            begin
              if DM1.tLote.Fields[x].DataType =  ftBoolean  then
              begin
                 if (not DM1.tLote.Fields[x].AsBoolean) or (DM1.tLote.Fields[x].IsNull) then
                    FDmCadLote.cdsLote.FieldByName(DM1.tLote.Fields[x].FieldName).AsVariant :=  'N'
                 else
                    FDmCadLote.cdsLote.FieldByName(DM1.tLote.Fields[x].FieldName).AsVariant :=  'S'
              end
              else
                FDmCadLote.cdsLote.FieldByName(DM1.tLote.Fields[x].FieldName).AsVariant := DM1.tLote.Fields[x].Value
            end;
         end;
         FDmCadLote.cdsLote.Post;
         //
         FDmCadLote.GravarRegistro;
         //
      finally
         FreeAndNil(FDmCadLote);
      end;
   end;
end;

procedure Prc_Excluir_Lote_FB(Lote: Integer);
Var
   FDmCadLote: TdmCadLote;
begin
   FDmCadLote := TdmCadLote.Create(Nil);
   try
      If FDmCadLote.LocalizarRegistro(False, Lote) then
        FDmCadLote.ExcluirRegistro;
      FDmCadLote.GravarRegistro;
   finally
      FreeAndNil(FDmCadLote);
   end;
end;

end.


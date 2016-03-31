unit Unit1;

interface

uses
  System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls,
  FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Menus, FMX.Controls.Presentation,
  FMX.StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, IdAllFTPListParsers, Winapi.ShellAPI,
  System.IniFiles, FMX.ListView, Uni, UniProvider, SQLServerUniProvider, MemDS,
  FMX.Memo, IdHTTP, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, FMX.Edit,
  IdThreadComponent, Winapi.ActiveX, FMX.Layouts, Data.DB, DBAccess,
  QExport4Xlsx, QExport4, QExport4HTML, FMX.ScrollBox, IdMessage,
  IdMessageClient, IdSMTPBase, IdSMTP, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, FMX.TMSBaseControl, FMX.TMSSlider,
  System.DateUtils, IdAttachment, IdAttachmentFile, Winapi.Windows, FMX.Objects,
  System.ImageList, FMX.ImgList, FMX.platform.Win, System.SysUtils;

type
  TForm1 = class(TForm)
    mm1: TMainMenu;
    MenuItem1: TMenuItem;
    stat1: TStatusBar;
    lbl2: TLabel;
    lbl1: TLabel;
    lbl3: TLabel;
    btn4: TButton;
    tmr2: TTimer;
    xpxslx: TQExport4Xlsx;
    xphtml: TQExport4HTML;
    ssl1: TIdSSLIOHandlerSocketOpenSSL;
    idsmtp1: TIdSMTP;
    idmsg1: TIdMessage;
    tmr1: TTimer;
    sld: TTMSFMXSlider;
    lbl4: TLabel;
    btn1: TButton;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    p1: TPopup;
    cltpnl1: TCalloutPanel;
    lbl: TLabel;
    grp1: TGroupBox;
    img1: TImage;
    img2: TImage;
    btn2: TButton;
    ThreadVerifica: TIdThreadComponent;
    btn3: TButton;
    procedure MenuItem1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure tmr2Timer(Sender: TObject);
    procedure sldStateChanged(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure btn4MouseEnter(Sender: TObject);
    procedure btn4MouseLeave(Sender: TObject);
    procedure btn1MouseEnter(Sender: TObject);
    procedure btn1MouseLeave(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure ThreadVerificaRun(Sender: TIdThreadComponent);
    procedure btn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn5Click(Sender: TObject);
  private
    procedure ImportaBanco(importar: boolean);
    function PegaPdata(): boolean;
    procedure MudaStatus(labl, texto: string);
    procedure escreveLog(texto: string);
    procedure BuscaSRO;
    procedure geraRelatorio(diretoria: string);
    procedure enviamail(unidade, unidade_mail: string);
    function unidadeEmail(unidade: string): string;
    function pegaSTES(conf_conc, conf_data: string): TStringlist;
    procedure transfereHTML(origem, arquivo: string);
    procedure importaStes(lista: TStringlist; stes: string);
    procedure stesTodos;
    procedure unidadesPend(diretoria: string; var lista: TStringlist);
    procedure execTudo;
    procedure InstalarSAAP;
    procedure apagaRela;
    procedure TodasUnidades(diretoria: string; var lista: TStringlist);
    procedure apagaRelaHTML;
    function FileSize(fileName: wideString): Int64;
    procedure escreveLogTmp(texto: string);
    procedure TelaAguardar;
  //  procedure ListFileDir(Path: string; FileList: TStrings);
    { Private declarations }
  public
    function unidadesqt(diretoria: string): Integer;
    var
      unidade: array[0..1] of TStringlist;
      conf_Pdata, Pdata_baixado, pendencia, objetos, qtdiretorias: TStringlist;
      pthread0, pthread1, pthread2, pthread3: TStringlist;
      lista0, lista1, lista2, lista3: TStringlist;
      continua, continua_, conf_internet, conf_xls, conf_html, conf_mail: boolean;
      th1, th2, th3, th4: boolean;
      lotestr, unidadestr, pasta_exec, conf_DR, conf_banco, unidadedest: string;
      conf_processa: TTime;
      lote, qtunidades, conf_DMenos: Integer;
      temp_quantidade: boolean;
      temp_data: TDateTime;
      conf_stes: array[1..5] of string;
      conf_UnStes: array[1..5] of string;
      conf_destHTML: string;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  Unit2, Unit3, Unit4, Rastro1, Unit5;

{ procedure TrimAppMemorySize;
  var
  MainHandle : THandle;
  begin
  try
  MainHandle := OpenProcess(PROCESS_ALL_ACCESS, false, GetCurrentProcessID) ;
  SetProcessWorkingSetSize(MainHandle, $FFFFFFFF, $FFFFFFFF) ;
  CloseHandle(MainHandle) ;
  except
  end;
  Application.ProcessMessages;
  end;
}

type
  TStatusWindowHandle = type HWND;

function CreateStatusWindow(const Text: string): TStatusWindowHandle;
var
  FormWidth, FormHeight: integer;
begin
  FormWidth := 400;
  FormHeight := 164;
  result := CreateWindow('STATIC', PChar(Text), WS_OVERLAPPED or WS_POPUPWINDOW or WS_THICKFRAME or SS_CENTER or SS_CENTERIMAGE, (Screen.Width - FormWidth) div 2, (Screen.Height - FormHeight) div 2, FormWidth, FormHeight, FmxHandleToHWND(Application.MainForm.Handle), 0, HInstance, nil);
  ShowWindow(result, SW_SHOWNORMAL);
  UpdateWindow(result);
end;

function TForm1.FileSize(fileName: wideString): Int64;
var
  sr: TSearchRec;
begin
  if FindFirst(fileName, faAnyFile, sr) = 0 then
    result := Int64(sr.FindData.nFileSizeHigh) shl Int64(32) + Int64(sr.FindData.nFileSizeLow)
  else
    result := -1;
  FindClose(sr);
end;

procedure RemoveStatusWindow(StatusWindow: TStatusWindowHandle);
begin
  DestroyWindow(StatusWindow);
end;

procedure TForm1.escreveLogTmp(texto: string);
var
  arquivolog: TextFile;
  tempo: string;
begin
  tempo := FormatDateTime('dd/mm/yyyy hh:nn:ss:zzz', Now);
  AssignFile(arquivolog, pasta_exec + 'dados\Log_tmp.txt');
  try
    if fileexists(pasta_exec + 'dados\Log_tmp.txt') then
      append(arquivolog)
    else
      Rewrite(arquivolog);
    Writeln(arquivolog, tempo + ' - ' + texto);
  except
  end;
  CloseFile(arquivolog);

end;

procedure TForm1.escreveLog(texto: string);
var
  arquivolog: TextFile;
  tempo: string;
begin
  tempo := FormatDateTime('dd/mm/yyyy hh:nn:ss:zzz', Now);
  AssignFile(arquivolog, pasta_exec + 'dados\log.txt');
  try
    if fileexists(pasta_exec + 'dados\log.txt') then
      append(arquivolog)
    else
      Rewrite(arquivolog);
    Writeln(arquivolog, tempo + ' - ' + texto);
  except
  end;
  CloseFile(arquivolog);

end;

procedure TForm1.geraRelatorio(diretoria: string);
var
  con: TUniConnection;
  unisql: TUniQuery;
begin
//  escreveLog('Gerando relatórios para a DR/' + diretoria);
  MudaStatus('função', 'Gerando relatórios da DR/' + diretoria);
  con := TUniConnection.Create(self);
  unisql := TUniQuery.Create(self);
  con.Server := conf_banco;
  con.Username := 'Alerta';
  con.Password := '!.Correios';
  con.LoginPrompt := false;
  con.Database := 'Alerta_db';
  con.ProviderName := 'SQL Server';
  con.SpecificOptions.Values['Authentication'] := 'auServer';
  unisql.Connection := con;
  try
    con.Connected := True;
    if Length(diretoria) <= 3 then
    try
      unisql.Active;
      unisql.SQL.Clear;

      unisql.SQL.Add('select ');
      unisql.SQL.Add('Unidade_Responsável = (select u.nome from [alerta_db].[dbo].Unidades as U where p.destino = u.cod),');
      unisql.SQL.Add('Unidade_Origem  = (select u.nome from [alerta_db].[dbo].Unidades as U where p.origem = u.cod),');
      unisql.SQL.Add('p.[data] as Data,');
      unisql.SQL.Add('Dias_Pendentes = datediff(dd,DATA,GETDATE()),');
      unisql.SQL.Add('p.[objeto] as Objeto from [alerta_db].[dbo].[Acompanhamento] as p where ((DR_destino = ' + QuotedStr(diretoria) + ') AND (data < ' + QuotedStr(FormatDateTime('yyyy-mm-dd', Now)) + ')) order by Unidade_Responsável ASC, DATA ASC, Unidade_Origem ASC;');
{
      unisql.SQL.Add('select ');
      unisql.SQL.Add('UNIDADE = (select u.nome from [alerta_db].[dbo].Unidades as U where p.destino = u.cod),');
      unisql.SQL.Add('ORIGEM  = (select u.nome from [alerta_db].[dbo].Unidades as U where p.origem = u.cod),');
      unisql.SQL.Add('p.[data] as DATA,');
      unisql.SQL.Add('p.[objeto] as OBJETO from [alerta_db].[dbo].[Acompanhamento] as p where DR_Destino = ' + QuotedStr(diretoria) + ' order by unidade ASC, DATA ASC, ORIGEM ASC;');
}
      unisql.Open;
      unisql.First;
      if conf_html then
      begin
  //      escreveLog('Tentando gerar relatório HTML da DR/' + diretoria);
        deletefile(PChar(pasta_exec + 'relatorios\' + diretoria + '.html'));
        xphtml.DataSet := unisql;
        xphtml.FileName := pasta_exec + 'relatorios\' + diretoria + '.html';
        xphtml.Title := 'Pendencias nas unidades da DR/' + diretoria;
        xphtml.CSSFileName := pasta_exec + 'relatorios\css.css';
        xphtml.Execute;
        transfereHTML(xphtml.FileName, diretoria + '.html');
      end;
      if conf_xls then
      begin
        deletefile(PChar(pasta_exec + 'relatorios\' + diretoria + '.xlsx'));
 //       escreveLog('Tentando gerar relatório XLSX da DR/' + diretoria);
        xpxslx.DataSet := unisql;
        xpxslx.SheetName := diretoria;
        xpxslx.FileName := pasta_exec + 'relatorios\' + diretoria + '.xlsx';
        xpxslx.Execute;
        transfereHTML(xpxslx.FileName, 'Excel\' + diretoria + '.xlsx');
      end;
    finally
      unisql.SQL.Clear;
      unisql.Close;
      unisql.free;
    end
    else if strtointdef(diretoria, -1) <> -1 then
    try
      unisql.Active;
      unisql.SQL.Clear;
      unisql.SQL.Add('select ');
      unisql.SQL.Add('Unidade_Responsável = (select u.nome from [alerta_db].[dbo].Unidades as U where p.destino = u.cod),');
      unisql.SQL.Add('Unidade_Origem  = (select u.nome from [alerta_db].[dbo].Unidades as U where p.origem = u.cod),');
      unisql.SQL.Add('p.[data] as Data,');
      unisql.SQL.Add('Dias_Pendentes = datediff(dd,DATA,GETDATE()),');
      unisql.SQL.Add('p.[objeto] as Objeto from [alerta_db].[dbo].[Acompanhamento] as p where ((destino = ' + QuotedStr(diretoria) + ') AND (data < ' + QuotedStr(FormatDateTime('yyyy-mm-dd', Now)) + ')) order by Unidade_Responsável ASC, DATA ASC, Unidade_Origem ASC;');
      unisql.Open;
      unisql.First;
      if conf_html then
      begin
 //       escreveLog('Tentando gerar relatório HTML da unidade: ' + diretoria);
        xphtml.DataSet := unisql;
        xphtml.FileName := pasta_exec + 'relatorios\' + diretoria + '.html';
        xphtml.Title := 'Pendencias na unidade: ' + diretoria;
        xphtml.CSSFileName := pasta_exec + 'relatorios\css.css';
        xphtml.Execute;
        transfereHTML(xphtml.FileName, diretoria + '.html');
      end;
      if conf_xls then
      begin
//        escreveLog('Tentando gerar relatório XLSX da unidade: ' + diretoria);
        xpxslx.DataSet := unisql;
        xpxslx.SheetName := diretoria;
        xpxslx.FileName := pasta_exec + 'relatorios\' + diretoria + '.xlsx';
        xpxslx.Execute;
        transfereHTML(xpxslx.FileName, 'Excel\' + diretoria + '.xlsx');
      end;
      if conf_mail then
      begin
        if (fileexists(pasta_exec + '\relatorios\' + diretoria + '.xlsx')) then
        begin
          enviamail(diretoria, unidadeEmail(diretoria));
        end;
      end;
    finally
      unisql.SQL.Clear;
      unisql.Close;
      unisql.free;
    end
    else
    try
      unisql.Active;
      unisql.SQL.Clear;
      unisql.SQL.Add('select distinct');
      unisql.SQL.Add('Unidade_Responsável = (select u.nome from [alerta_db].[dbo].Unidades as U where p.destino = u.cod),');
      unisql.SQL.Add('count(p.destino) as Quantidade,');
      unisql.SQL.Add('Dias_Pendentes = (select max(datediff(dd,a.DATA,GETDATE())) from [alerta_db].[dbo].[Acompanhamento] as a where a.destino = p.destino),');
      unisql.SQL.Add('Subordinhação = (select un.Subordinacao from [alerta_db].[dbo].Unidades as un where un.cod = p.destino)');
      unisql.SQL.Add('from [alerta_db].[dbo].[Acompanhamento] as p where ((DR_destino = ' + quotedstr(conf_DR) + ') AND (data < ' + quotedstr(formatdatetime('yyyy-mm-dd', now)) + ')) GROUP BY p.destino order by Quantidade DESC');

      unisql.Open;
      unisql.First;
      if conf_html then
      begin
 //       escreveLog('Tentando gerar relatório HTML da unidade: ' + diretoria);
        xphtml.DataSet := unisql;
        xphtml.FileName := pasta_exec + 'relatorios\Ranking_' + conf_dr + '.html';
        xphtml.Title := 'Ranking da DR/' + conf_dr;
        xphtml.CSSFileName := pasta_exec + 'relatorios\css.css';
        xphtml.Execute;
        transfereHTML(xphtml.FileName, 'Ranking_' + conf_dr + '.html');
      end;
      if conf_xls then
      begin
//        escreveLog('Tentando gerar relatório XLSX da unidade: ' + diretoria);
        xpxslx.DataSet := unisql;
        xpxslx.SheetName := diretoria;
        xpxslx.FileName := pasta_exec + 'relatorios\Ranking_' + conf_dr + '.xlsx';
        xpxslx.Execute;
        transfereHTML(xpxslx.FileName, 'Excel\Ranking_' + conf_dr + '.xlsx');
      end;
    finally
      unisql.SQL.Clear;
      unisql.Close;
      unisql.free;
    end

  except
    escreveLog('Erro na geração do lOG');
  end;
  con.Disconnect;
  con.free;
//  escreveLog('Terminada a geração dos relatórios');
  MudaStatus('função', '');
end;

procedure TForm1.transfereHTML(origem, arquivo: string);
begin
  if (CopyFile(PChar(origem), PChar(conf_destHTML + arquivo), FALSE)) then
//    escreveLog('Relatorio HTML enviado com sucesso!')
    sleep(0)
  else
  try
    deletefile(PChar(conf_destHTML + arquivo));
    if (CopyFile(PChar(origem), PChar(conf_destHTML + arquivo), FALSE)) then
      escreveLog('Erro ao salvar Relatorio HTML - ' + arquivo);
  finally

  end;

end;

procedure TForm1.apagaRela;
var
  I, cont: integer;
  arquivos: TStringlist;
  caminho: string;
begin
  arquivos := TStringlist.Create;
  caminho := ExtractFilePath(ParamStr(0));
  TodasUnidades(conf_DR, arquivos);
  cont := 0;
  for I := 0 to arquivos.Count - 1 do
  try
    if fileexists(caminho + 'relatorios\' + arquivos[I] + '.html') then
    begin
      if DeleteFile(PChar(caminho + 'relatorios\' + arquivos[I] + '.html')) then
        cont := cont + 1
    end;
    if fileexists(caminho + 'relatorios\' + arquivos[I] + '.xlsx') then
    begin
      if DeleteFile(PChar(caminho + 'relatorios\' + arquivos[I] + '.xlsx')) then
        cont := cont + 1
    end;
  finally
//  escrevelog('Foram apagados ' + inttostr(cont) + ' relatorios.');
  end;
  escrevelog('Foram apagados ' + inttostr(cont) + ' relatorios.');
  arquivos.Free;

end;

procedure TForm1.apagaRelaHTML;
var
  I, cont: integer;
  arquivos: TStringlist;
  caminho: string;
begin
  arquivos := TStringlist.Create;
  caminho := conf_destHTML;
  TodasUnidades(conf_DR, arquivos);
  cont := 0;
  for I := 0 to arquivos.Count - 1 do
  try
    if fileexists(caminho + arquivos[I] + '.html') then
    begin
      if DeleteFile(PChar(caminho + arquivos[I] + '.html')) then
        cont := cont + 1
    end;
    if fileexists(caminho + arquivos[I] + '.xlsx') then
    begin
      if DeleteFile(PChar(caminho + arquivos[I] + '.xlsx')) then
        cont := cont + 1
    end;
    if fileexists(caminho + 'Excel\' + arquivos[I] + '.xlsx') then
    begin
      if DeleteFile(PChar(caminho + 'Excel\' + arquivos[I] + '.xlsx')) then
        cont := cont + 1
    end;

  finally
//  escrevelog('Foram apagados ' + inttostr(cont) + ' relatorios.');
  end;
  escrevelog('Foram apagados ' + inttostr(cont) + ' relatorios do servidor HTML.');
  arquivos.Free;

end;

procedure TForm1.BuscaSRO();
var
  con: TUniConnection;
  unisql: TUniQuery;
  caminho: string;
  inserir: string;
  objetos_pesquisa: TStringlist; // carregará os objetos de cada destino
  // Objetos carregará os objetos de cada thread

  // unidade[0] é o código SRO, unidade[1] é a quantidade
  I, X, contador: Integer;
begin
  caminho := ExtractFilePath(ParamStr(0));
  MudaStatus('função', 'BuscaSRO');
  escreveLog('Iniciando a função BuscaSRO.');
  Application.ProcessMessages;
  pendencia.Clear;
  for I := 0 to 1 do
    unidade[I].Clear;
  objetos_pesquisa := TStringlist.Create;
  objetos_pesquisa.Duplicates := dupIgnore;
  objetos_pesquisa.Sorted := True;
  objetos := TStringlist.Create;
  con := TUniConnection.Create(self);
  unisql := TUniQuery.Create(self);
  con.Server := conf_banco;
  con.Username := 'Alerta';
  con.Password := '!.Correios';
  con.LoginPrompt := false;
  con.Database := 'Alerta_db';
  con.ProviderName := 'SQL Server';
  con.SpecificOptions.Values['Authentication'] := 'auServer';
  unisql.Connection := con;
  try
    con.Connected := True;
  // escreveLog('Conexão OK (BuscaSRO).');
    try
      if (FileExists(caminho + 'dados\Log_tmp.txt')) then
        DeleteFile(PChar(caminho + 'dados\Log_tmp.txt'));

      // selecionando todas as direções
      unisql.Active;
      unisql.SQL.Clear;
      unisql.SQL.Text := 'select destino, count(destino) as quantidade from [Alerta_db].[dbo].[acompanhamento] where DR_Destino = ' + QuotedStr(conf_DR) + ' group by destino having count(destino) > 0 order by quantidade DESC';
      unisql.Open;
      unisql.First;
  //    escreveLog('Adicionando os objetos da tabela de acompanhamento.');
      MudaStatus('função', 'Selecionando os objetos do BD.');
      Application.ProcessMessages;
      while not unisql.Eof do
      begin
        unidade[0].Add(unisql.Fields[0].AsString); // unidade[0] é o código SRO
        unidade[1].Add(unisql.Fields[1].AsString); // unidade[1] é a quantidade
        unisql.Next;
        Application.ProcessMessages;
      end;
      unisql.Close;
   //   escreveLog('Executando verificação.');
      for I := 0 to (unidade[0].Count - 1) do // para cada unidade na tabela
      begin
        unidadestr := 'Unidade: ' + inttostr(I + 1) + ' / ' + inttostr(unidade[0].Count);

        Application.ProcessMessages;
        unidadedest := unidade[0][I];
        contador := 0;
        unisql.SQL.Clear;
        unisql.SQL.Add('select objeto from [Alerta_db].[dbo].[Acompanhamento] where destino = ' + QuotedStr(unidade[0][I]) + ';');
        unisql.Open;
        unisql.First;
        while not unisql.Eof do
        begin
          objetos_pesquisa.Add(unisql.Fields[0].AsString);
          unisql.Next;
        end;
        unisql.Close;

        escrevelogTmp('Verificando a unidade ' + unidade[0][I] + ' - ' + inttostr(I + 1) + ' / ' + inttostr(unidade[0].Count) + ' - ' + IntToStr(objetos_pesquisa.count) + ' Objetos');

        objetos_pesquisa.savetofile(caminho + 'dados\arquivo1.txt');
      //  Form3.separa50(objetos_pesquisa); Separa para 20 threads
        objetos_pesquisa.Clear;
        // Inicia as threads
    //    escreveLog('Iniciando as threads para a unidade ' + unidade[0][I]);
        Form3.iniciathreads;

        {
          for X := 0 to objetos.Count -1 do
          begin
          MudaStatus('','Unidade ' + IntToStr(I+1) + ' / ' + IntToStr(unidade[0].Count) + ' Lote ' + IntToStr(X+1) + ' / ' + IntToStr(objetos.count));
          application.ProcessMessages;
          macroSRO(objetos[X],unidade[0][I],pendencia);

          end;
        }
        // Neste momento, objetos tem todos os objetos a serem pesquisados
        // Por lote. Cada linha tem no máximo 50 objetos
        // objetos.SaveToFile('d:\raoni\' + unidade[0][I] + '.txt');

        // funcao para pesquisar na macro.
        // pendencia.SaveToFile(pasta_exec + 'dados\' + conf_DR + '.txt');
        // pendencia.SaveToFile(pasta_exec + 'dados\' + conf_DR + '.txt');
        objetos.Clear;
        if fileexists(caminho + 'dados\Resultado.txt') then
        begin
          objetos.LoadFromFile(caminho + 'dados\Resultado.txt');
          pendencia.AddStrings(objetos);
          objetos.Clear;
          DeleteFile(PChar(caminho + 'dados\Resultado.txt'));
        end;
      end;
      pendencia.SaveToFile(pasta_exec + 'dados\' + conf_DR + '.txt');
      if pendencia.Count > 0 then
      try
      //  escreveLog('Tentando executar Bulkinsert da DR');
        inserir := pasta_exec + 'dados\' + conf_DR + '.txt';
        unisql.SQL.Clear;
        unisql.SQL.Add('DELETE FROM [Alerta_db].[dbo].[AcompanhamentoTmp];');
        unisql.Execute;
        unisql.SQL.Clear;
        unisql.SQL.Add('BULK INSERT [Alerta_db].[dbo].[AcompanhamentoTmp] from ' + QuotedStr(inserir));
        unisql.SQL.Add(' WITH (fieldterminator = ' + QuotedStr(',') + ', firstrow = 1)');
        unisql.Execute;

        unisql.SQL.Clear;
        unisql.SQL.Add('DELETE from [Alerta_db].[dbo].[Acompanhamento]');
        unisql.SQL.Add('WHERE [DR_Destino] = ' + QuotedStr(conf_DR) + ';');
        unisql.Execute;
        unisql.SQL.Clear;
 //       escreveLog('Inserindo as pendencias na planilha completa.');
        unisql.SQL.Add('INSERT [Alerta_db].[dbo].[Acompanhamento] ([objeto], [data], [origem], [destino], [DR_Origem], [DR_Destino])');
        unisql.SQL.Add('SELECT [Objeto],');
        unisql.SQL.Add('[Data] = substring([data],7,4) +' + QuotedStr('-') + '+ substring([data],4,2) + ' + QuotedStr('-') + ' + substring([data],1,2),');
        unisql.SQL.Add('[Origem], [Destino],');
        unisql.SQL.Add('[DR_Origem] = (SELECT u.DR from [Alerta_db].[dbo].Unidades as u where [Origem] = u.cod),');
        unisql.SQL.Add('[DR_Destino] =(SELECT u.DR from [Alerta_db].[dbo].Unidades as u where [Destino] = u.cod)');
        unisql.SQL.Add('FROM [Alerta_db].[dbo].[AcompanhamentoTmp];');
        unisql.Execute;
        unisql.SQL.Clear;

        unisql.SQL.Add('delete from [Alerta_db].dbo.acompanhamento where DR_Destino = ' + QuotedStr(conf_DR) + ' and objeto not in');
        unisql.SQL.Add('(select at.[objeto] from [Alerta_db].dbo.AcompanhamentoTmp as at);');
        unisql.Execute;
        unisql.SQL.Clear;
        deletefile(PChar(inserir));

      except
        escreveLog('Erro ao tentar executar BulkInsert da DR' + conf_DR);
      end;
    finally
      con.Disconnect;

    end;
  except
    on E: Exception do
      escreveLog(E.ClassName + ' error raised, with message : ' + E.Message);
  end;
  escreveLog('Função BuscaSRO terminada');
  MudaStatus('função', '');
  MudaStatus('', '');
  con.free;
  unisql.free;
  objetos_pesquisa.free;
  objetos.free;
end;

function TForm1.PegaPdata(): boolean;
var
  banco, conf_mes, arquivos, arquivos_b: TStringlist;
  periodo: string;
  ftp: TidFtp;
  I, indice, J: Integer;
  maquina: string;
begin
  MudaStatus('função', 'Baixar Pdata');
  Application.ProcessMessages;
 // escreveLog('Função PegaPdata iniciada.');
  Result := false;
  if fileexists('mes.txt') then
  begin
    conf_mes := TStringlist.Create;
    conf_mes.LoadFromFile('mes.txt');
    periodo := conf_mes[0] + '*';
    escreveLog('Período alternativo carregado');
  end
  else
  begin
    periodo := FormatDateTime('yyyymmdd', Now - conf_DMenos) + '*';
    escreveLog('Período padrão carregado.');
  end;
  if not assigned(arquivos_b) then
  begin
    arquivos_b := TStringlist.Create;
    arquivos_b.Sorted := True;
  end;
  if assigned(arquivos) then
    arquivos.free;
  arquivos := TStringlist.Create;
  if fileexists(pasta_exec + '\dados\arquivos.txt') then
    arquivos_b.LoadFromFile(pasta_exec + '\dados\arquivos.txt');
  if conf_Pdata.Count > 0 then
  begin
//    escreveLog('Buscando arquivos Pdata.');
    for I := 0 to conf_Pdata.Count - 1 do
    begin
 //     escreveLog('Procurando Pdatas da máquina ' + maquina);
  //    MudaStatus('função', 'Procurando Pdatas da máquina ' + maquina);
      Application.ProcessMessages;
      maquina := conf_Pdata[I];
      ftp := TidFtp.Create(nil);
      if conf_internet then
        ftp.Host := 'transfer.correios.com.br'
      else
        ftp.Host := '192.168.1.6';
      ftp.Username := 'usr' + maquina;
      ftp.Password := 'usr' + maquina + '>=';
      ftp.Passive := True;
      try
        ftp.Connect;
        if ftp.Connected then
        begin
   //       escreveLog('Conectado ao servidor da ' + maquina);
//          MudaStatus('função', 'Conectado ao servidor da ' + maquina);
          ftp.ChangeDir('/mectri_pdata/u' + maquina + '/mectri_' + maquina + '_pdata_lido/');
          ftp.List(arquivos, 'Pdata_' + maquina + '_' + periodo, false);
          for J := 0 to arquivos.Count - 1 do // Varre os arquivos do mês
          begin
//            MudaStatus('função', 'Baixar Pdata - ' + maquina + ' - ' + inttostr(J + 1) + '/' + inttostr(arquivos.Count));
//            Application.ProcessMessages;
            if arquivos_b.Find(arquivos[J], indice) = false then
              // Se o arquivo listado não tiver sido baixado ainda
            try
//              MudaStatus('função', 'Baixando - ' + inttostr(J + 1) + '/' + inttostr(arquivos.Count));
//              Application.ProcessMessages;
              if not assigned(Pdata_baixado) then
                Pdata_baixado := TStringlist.Create;
              ftp.Get(ExtractFileName(arquivos[J]), 'dados/' + ExtractFileName(arquivos[J]), True, True);
              arquivos_b.Add(arquivos[J]);
              Pdata_baixado.Add(arquivos[J]);
              arquivos_b.Sort;
            finally
              Result := True;
            end;

          end;

        end;
      finally
        ftp.Disconnect;
      end;
      MudaStatus('função', 'Fim Baixar Pdata');
      Application.ProcessMessages;
      ftp.free;
    end;
  end
  else
    escreveLog('Nenhuma máquina selecionada para baixar Pdatas.');
  arquivos_b.SaveToFile(pasta_exec + '\dados\arquivos.txt');
  arquivos_b.free;
  arquivos.free;
  if assigned(conf_mes) then
    FreeAndNil(conf_mes);
end;

procedure TForm1.sldStateChanged(Sender: TObject);
begin
  if sld.State = ssON then
  begin
    temp_quantidade := false;
    temp_data := Now;
    tmr1.Enabled := True;
  end
  else
    tmr1.Enabled := false;
end;

procedure TForm1.ImportaBanco(importar: boolean);
var
  batch: TStringlist;
  con: TUniConnection;
  unisql: TUniSQL;
  I, J: Integer;
  pdatafile: string;
begin
  MudaStatus('função', 'Importar para o banco');
//  escreveLog('Iniciando a função para importar no banco.');
  if (importar) and (Pdata_baixado.Count > 0) then
  begin
    continua_ := false;
    if assigned(con) then
      con.free;
    if assigned(unisql) then
      unisql.free;
    con := TUniConnection.Create(self);
    unisql := TUniSQL.Create(self);
    con.Server := conf_banco;
    con.Username := 'Alerta';
    con.Password := '!.Correios';
    con.LoginPrompt := false;
    con.Database := 'Alerta_db';
    con.ProviderName := 'SQL Server';
    con.SpecificOptions.Values['Authentication'] := 'auServer';
    unisql.Connection := con;
    try
      con.Connected := True;
      try
        // Filtra apenas os objeto triados como OK e tenta importar para o banco
        // tabela dgo.Pdata
        unisql.SQL.Clear;
        unisql.SQL.Add('DELETE FROM [Alerta_db].[dbo].[PdataTmp];');
        unisql.SQL.Add('DELETE FROM [ALERTA_db].[dbo].[Pdata];');
        unisql.Execute;
        for I := 0 to (Pdata_baixado.Count - 1) do
        begin
          MudaStatus('função', 'Inserindo o arquivo ' + Pdata_baixado[I] + ' no banco.');
     //     escreveLog('Tentando inserir o arquivo ' + Pdata_baixado[I] + ' no banco.');
          if assigned(batch) then
            batch.free;
          batch := TStringlist.Create;
          batch.Add('cd "' + pasta_exec + 'dados\"');
          batch.Add('type "' + Pdata_baixado[I] + '" | find "OK" >> "' + pasta_exec + 'dados\' + Pdata_baixado[I] + '.txt"');
          batch.Add('echo "OK" >> "' + pasta_exec + 'dados\continua.ok"');
          batch.SaveToFile(pasta_exec + '\dados\executa'+inttostr(I)+'.bat');
          ShellExecute(0, 'open', PChar(pasta_exec + '\dados\executa'+inttostr(I)+'.bat'), nil, nil, 0);
          pdatafile := pasta_exec + 'dados\' + Pdata_baixado[I] + '.txt';
          continua_ := false;
          tmr2.Enabled := True;
          while not continua_ do
          begin
            Application.ProcessMessages;
            Sleep(0);
          end;
          if not (filesize(pdatafile) = 0) then
          begin
            unisql.SQL.Clear;
            unisql.SQL.Add('Bulk Insert [Alerta_db].[dbo].PdataTmp from ' + QuotedStr(pdatafile));
            unisql.SQL.Add('WITH (fieldterminator = ' + chr(39) + ',' + chr(39) + ', firstrow = 1)');
            try
              unisql.Execute;
            except
              escreveLog('Erro ao tentar inserir o arquivo ' + pdatafile + ' no banco.');
            end;
            Application.ProcessMessages;
          end;

        end;
      finally
        // Apaga os arquivos Pdata baixados
        batch.Clear;
        batch.Add('cd "' + pasta_exec + '\dados\"');
        batch.Add('del Pdata*');
        batch.Add('del executa*');
        batch.SaveToFile(pasta_exec + '\dados\executa.bat');
        ShellExecute(0, 'open', PChar(pasta_exec + '\dados\executa.bat'), nil, nil, 0);

        batch.free;
        unisql.SQL.Clear;
      end;
      MudaStatus('função', 'Tratando os dados no banco');
      // Apaga os registros sem número do objeto
   //   escreveLog('Apagando os registros sem numero do objeto.');
      unisql.SQL.Add('delete from [Alerta_db].[dbo].[PdataTmp] where objeto is NULL;');
      unisql.Execute;
      unisql.SQL.Clear;
      // Limpa as tabelas TEMP
 //     escreveLog('Apagando dados da tabela TEMP');
      unisql.SQL.Add('DELETE FROM [Alerta_db].[dbo].[temp];');
      unisql.Execute;
      unisql.SQL.Clear;
  //    escreveLog('Inserindo dados da tabela do Pdata original');
      // Insere os dados na tabela dos Pdatas Originais
      unisql.SQL.Add('INSERT [Alerta_db].[dbo].[Pdata]');
      unisql.SQL.Add('SELECT * FROM [Alerta_db].[dbo].[PdataTmp];');
      unisql.Execute;
      unisql.SQL.Clear;
   //   escreveLog('Inserção na tebela TEMP');
      unisql.SQL.Add('INSERT [Alerta_db].[dbo].[temp] ([objeto], [data], [origem], [destino], [DR_Origem], [DR_Destino])');
      unisql.SQL.Add('SELECT [objeto],');
      unisql.SQL.Add('[data] = substring([data],1,4) +' + QuotedStr('-') + '+ substring([data],5,2) + ' + QuotedStr('-') + ' + substring([data],7,2),');
      unisql.SQL.Add('[Origem] = (substring([plano],1,3)),');
      unisql.SQL.Add('[destino],');
      unisql.SQL.Add('[DR_Origem] = (substring([plano],1,3)),');
      unisql.SQL.Add('[DR_Destino] = (select u.DR from [Alerta_db].[dbo].Unidades as u where [destino] = u.cod)');
      unisql.SQL.Add('FROM [Alerta_db].[dbo].[Pdata]');
      unisql.SQL.Add('WHERE [destino] in ( select [cod] from [Alerta_db].[dbo].[Unidades]);');
      unisql.Execute;
      unisql.SQL.Clear;
   //   escreveLog('Alterando o formato da data e origem');
      // Altera o formato da data e da origem
      unisql.SQL.Add('update [Alerta_db].[dbo].[temp]');
      unisql.SQL.Add('SET [Origem] = (select o.cod from [Alerta_db].[dbo].origem as o where [Origem] = o.Abreviacao);');
      unisql.Execute;
      unisql.SQL.Clear;
      unisql.SQL.Add('update [Alerta_db].[dbo].[temp]');
      unisql.SQL.Add('SET [DR_Origem] = (select u.DR from [Alerta_db].[dbo].Unidades as u where [origem] = u.cod);');
      unisql.Execute;
      unisql.SQL.Clear;
   //   escreveLog('Insere os dados na planilha de acompanhamento');
      // Insere os dados na planilha de acompanhamento
      unisql.SQL.Add('INSERT [Alerta_db].[dbo].[acompanhamento]');
      unisql.SQL.Add('SELECT * FROM [Alerta_db].[dbo].[TEMP];');
      unisql.Execute;
      // Limpa a tabela TEMP
 //     escreveLog('Limpa a tabela TEMP');
      unisql.SQL.Clear;
      unisql.SQL.Add('Delete from [Alerta_db].[dbo].[TEMP]');
      unisql.SQL.Add('DELETE FROM [Alerta_db].[dbo].[PdataTmp];');
      unisql.SQL.Add('DELETE FROM [ALERTA_db].[dbo].[Pdata];');
      unisql.Execute;
      unisql.SQL.Clear;
      con.Disconnect;
    except
      on E: Exception do
      begin
        escreveLog('Ocorreu um erro. Mensagem do erro: ' + E.Message);
        MudaStatus('função', 'Problema ao conectar');
      end;
    end;
    Pdata_baixado.Clear;
    con.free;
    unisql.free;
  end;
  MudaStatus('função', 'Fim Importar banco');
end;

procedure TForm1.btn1Click(Sender: TObject);
var
  teste: TStringlist;
  tempo__: TDateTime;
  caminho: string;
begin
  caminho := ExtractFilePath(ParamStr(0));
  tempo__ := Now;

  teste := TStringlist.Create;
  teste.LoadFromFile(caminho + 'Benckmark2.txt');
  Form3.separa50(teste);
  Form3.iniciathreads;
  ShowMessage('Tempo para processamento de 200.000 objetos: ' + FormatDateTime('hh:nn:ss', Now - tempo__));
  teste.free;
  // enviamail('raonim@correios.com.br');
end;

procedure TForm1.btn1MouseEnter(Sender: TObject);
begin
  p1.PlacementTarget := btn1;
  lbl.Text := 'Testa o envio dos relatórios por' + chr(13) + ' e-mail';
  p1.IsOpen := True;
end;

procedure TForm1.btn1MouseLeave(Sender: TObject);
begin
  p1.IsOpen := false;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
//geraRelatorio('Ranking');
  form3.Show;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
  enviamail('50630972', 'raonimn@gmail.com.br');
  enviamail('50630972', 'raonim@correios.com.br');

end;

procedure TForm1.importaStes(lista: TStringlist; stes: string);
var
  percorre, arquivo_final: TStringlist;
  con: TUniConnection;
  unisql: TUniSQL;
  I, J: Integer;
  objeto, destino, Data: string;
  caminho: string;
begin
  arquivo_final := TStringlist.Create;
  percorre := TStringlist.Create;
  percorre.Delimiter := ',';
  percorre.StrictDelimiter := True;
  caminho := ExtractFilePath(ParamStr(0));
  MudaStatus('função', 'Importar para o banco');
//  escreveLog('Iniciando a função para importar no banco. (STES)');
  if (lista.Count > 0) then
  begin
    if assigned(con) then
      con.free;
    if assigned(unisql) then
      unisql.free;
    con := TUniConnection.Create(self);
    unisql := TUniSQL.Create(self);
    con.Server := conf_banco;
    con.Username := 'Alerta';
    con.Password := '!.Correios';
    con.LoginPrompt := false;
    con.Database := 'Alerta_db';
    con.ProviderName := 'SQL Server';
    con.SpecificOptions.Values['Authentication'] := 'auServer';
    unisql.Connection := con;
    try
      con.Connected := True;
      try
        for I := 0 to lista.Count - 1 do
        begin
          percorre.DelimitedText := lista[I];
          objeto := percorre[0];
          destino := percorre[1];
          while (Length(destino) < 8) do
          begin
            destino := '0' + destino;
          end;
          Data := Copy(percorre[2], 0, 10);
          arquivo_final.Add(objeto + ',' + Data + ',' + destino + ',' + stes + ',,');
        end;
        unisql.SQL.Clear;
        arquivo_final.SaveToFile(caminho + 'dados\STES.txt');
        unisql.SQL.Add('DELETE FROM [Alerta_db].[dbo].[temp];');
        unisql.Execute;
        unisql.SQL.Clear;

        unisql.SQL.Add('BULK INSERT [Alerta_db].[dbo].[temp] from ' + QuotedStr(caminho + 'dados\STES.txt'));
        unisql.SQL.Add(' WITH (fieldterminator = ' + QuotedStr(',') + ', firstrow = 1)');
        unisql.Execute;
        unisql.SQL.Clear;
        DeleteFile(pchar(caminho + 'dados\STES.txt'));
        unisql.SQL.Add('INSERT [Alerta_db].[dbo].[acompanhamento] ([objeto], [data], [origem], [destino], [DR_Origem], [DR_Destino])');
        unisql.SQL.Add('SELECT [objeto],');
        unisql.SQL.Add('[data],');
        unisql.SQL.Add('[Origem],');
        unisql.SQL.Add('[destino],');
        unisql.SQL.Add('[DR_Origem] = (select u.DR from [Alerta_db].[dbo].Unidades as u where [origem] = u.cod),');
        unisql.SQL.Add('[DR_Destino] = (select u.DR from [Alerta_db].[dbo].Unidades as u where [destino] = u.cod)');
        unisql.SQL.Add('FROM [Alerta_db].[dbo].[temp]');
        unisql.SQL.Add('WHERE [destino] in ( select [cod] from [Alerta_db].[dbo].[Unidades]);');
        unisql.Execute;
        con.Disconnect;
      except
        on E: Exception do
        begin
          escreveLog('Ocorreu um erro. Mensagem do erro: ' + E.Message);
          MudaStatus('função', 'Problema ao conectar');
        end;
      end;
      con.Disconnect;
    finally
      con.free;
      unisql.free;
      MudaStatus('função', 'Fim Importar banco');
    end;
  end;
  percorre.free;
  arquivo_final.free;
end;

function TForm1.pegaSTES(conf_conc, conf_data: string): TStringlist;
var
  lUrl: string;
  idhttp1: TIdHTTP;
  I: Integer;
  abrir: TStringlist;
const
  procura = '		<tr><td align="center">';
begin
  Result := nil;
  Result := TStringlist.Create;
  idhttp1 := TIdHTTP.Create(self);
  abrir := TStringlist.Create;
  lUrl := 'http://' + conf_conc + '/stes/saap.php?teste=' + conf_data;
  abrir.Text := idhttp1.Get(lUrl);
  idhttp1.Disconnect;
  for I := 0 to (abrir.Count - 1) do
  begin
    if Pos(procura, abrir[I]) <> 0 then
    begin
      Result.Add(Copy(abrir[I], Pos(procura, abrir[I]) + Length(procura), 34));
    end;
  end;
  idhttp1.free;
  abrir.free;
end;

procedure TForm1.execTudo;
var
  tempo2, tempo3: TDateTime;
  tempoimporta, tempobusca, temporelatorio, temporel, tempototal: string;
  unidades_pendencia: TStringlist;
  I: Integer;
begin
  unidades_pendencia := TStringlist.Create;
  tempo2 := Now;
  tempo3 := Now;
  ImportaBanco(PegaPdata);
  stesTodos;
  tempoimporta := 'Tempo de obtenção dos Pdatas/STES e inserção no banco: ' + FormatDateTime('hh:nn:ss', Now - tempo2);
  tempo2 := Now;
  BuscaSRO;
  tempobusca := 'Tempo da busca no SRO: ' + FormatDateTime('hh:nn:ss', Now - tempo2);
  tempo2 := Now;
  apagarela;
  apagaRelaHTML;
  geraRelatorio(conf_DR);
  geraRelatorio('Ranking');
  temporelatorio := 'Tempo de geração do relatório da DR: ' + FormatDateTime('hh:nn:ss', Now - tempo2);
  tempo2 := Now;
  // Cees;
  unidadesPend(conf_DR, unidades_pendencia);
  if unidades_pendencia.Count > 0 then
  begin
    for I := 0 to unidades_pendencia.Count - 1 do
    begin
      geraRelatorio(unidades_pendencia[I]);
    end;
  end;
  temporel := 'Tempo da geração e envio dos e-mails das unidades: ' + FormatDateTime('hh:nn:ss', Now - tempo2);
  tempototal := 'Tempo total da execução: ' + FormatDateTime('hh:nn:ss', Now - tempo3);
  escreveLog(tempoimporta);
  escreveLog(tempobusca);
  escreveLog(temporelatorio);
  escrevelog(temporel);
  escrevelog(tempototal);
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
 TelaAguardar;
  try
    btn4.enabled := false;
    form1.visible := False;
    ThreadVerifica.Start;
    while not ThreadVerifica.Stopped do
    begin
      Sleep(0);
      Application.ProcessMessages;
    end;
  finally
    form1.visible := true;
    form1.Show;
    form1.bringtofront;
    btn4.enabled := True;
    Form5.Close;
  end;
end;

procedure TForm1.stesTodos;
var
  I: Integer;
begin
  for I := 1 to 5 do
  try
    if ((conf_stes[I] <> '') and (conf_UnStes[I] <> '')) then
      importaStes(pegaSTES(conf_stes[I], FormatDateTime('yyyy-mm--dd', Now - conf_DMenos)), conf_UnStes[I]);
  //  escreveLog('STES: ' + conf_stes[I] + ' importado com sucesso!');
  except
    on E: Exception do
    begin
      escreveLog('Ocorreu um erro na obtenção/importação do STES: ' + conf_stes[I] + ' - ' + E.Message);
    end;

  end;

end;

procedure TForm1.InstalarSAAP;
var
  con: TUniConnection;
  unisql: TUniQuery;
  caminho: string;
begin
  caminho := ExtractFilePath(ParamStr(0));
  con := TUniConnection.Create(self);
  unisql := TUniQuery.Create(self);
  con.Server := conf_banco;
  con.Username := 'Alerta';
  con.Password := '!.Correios';
  con.LoginPrompt := false;
  con.Database := 'Alerta_db';
  con.ProviderName := 'SQL Server';
  con.SpecificOptions.Values['Authentication'] := 'auServer';
  unisql.Connection := con;
  if (fileexists(caminho + 'Criar_tabelas.txt')) then
  try
    con.Connected := True;
    try
      unisql.active := True;
      unisql.SQL.Clear;
      unisql.SQL.LoadFromFile(caminho + 'Criar_tabelas.txt');
      unisql.execute;
      unisql.active := False;
      unisql.sql.clear;
      deletefile(pchar(caminho + 'Criar_tabelas.txt'));
    except
      on E: Exception do
        escreveLog('Erro ao tentar crirar as tableas: ' + E.Message);
    end;

  finally
    con.connected := False;
  end
  else if (fileexists(caminho + 'unidades.txt')) then
  try
    con.Connected := True;
    try
      unisql.active := True;
      unisql.SQL.Clear;
      unisql.SQL.add('BULK INSERT [Alerta_db].[dbo].[Unidades] from ' + quotedstr(caminho + 'unidades.txt'));
      unisql.SQL.add('WITH (fieldterminator = ' + quotedstr(',') + ' , firstrow = 2);');
      unisql.execute;
      unisql.active := False;
      unisql.sql.clear;
      deletefile(pchar(caminho + 'Unidades.txt'));
    except
      on E: Exception do
        escreveLog('Erro ao tentar inserir dados na tabela Unidades: ' + E.Message);
    end;

  finally
    con.connected := False;
  end
  else if (fileexists(caminho + 'origem.txt')) then
  try
    con.Connected := True;
    try
      unisql.active := True;
      unisql.SQL.Clear;
      unisql.SQL.add('BULK INSERT [Alerta_db].[dbo].[origem] from ' + quotedstr(caminho + 'origem.txt'));
      unisql.SQL.add('WITH (fieldterminator = ' + quotedstr(',') + ' , firstrow = 2);');
      unisql.execute;
      unisql.active := False;
      unisql.sql.clear;
      deletefile(pchar(caminho + 'origem.txt'));
    except
      on E: Exception do
        escreveLog('Erro ao tentar inserir dados na tabela Origem: ' + E.Message);
    end;

  finally
    con.connected := False;
  end;
  con.free;
  unisql.Free;
end;

procedure TForm1.ThreadVerificaRun(Sender: TIdThreadComponent);
begin
  CoInitialize(nil);
  execTudo;
  CoUninitialize;
  ThreadVerifica.Terminate;
end;

procedure TForm1.btn4MouseEnter(Sender: TObject);
begin
  p1.PlacementTarget := btn4;
  lbl.Text := 'Realiza a rotina manualmente';
  p1.IsOpen := True;
end;

procedure TForm1.btn4MouseLeave(Sender: TObject);
begin
  p1.IsOpen := false;
end;

procedure TForm1.TelaAguardar;
begin
    if not assigned(Form5) then
      Application.CreateForm(TForm5, Form5);
    Form5.Show;
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
telaaguardar;
end;

procedure TForm1.MudaStatus(labl, texto: string);
begin
  if labl = 'função' then
    lbl1.Text := 'Executando: ' + texto
  else if labl = '' then
    lbl2.Text := texto;
end;

function TForm1.unidadesqt(diretoria: string): Integer;
var
  con: TUniConnection;
  unisql: TUniQuery;
begin
  con := TUniConnection.Create(self);
  unisql := TUniQuery.Create(self);
  con.Server := conf_banco;
  con.Username := 'Alerta';
  con.Password := '!.Correios';
  con.LoginPrompt := false;
  con.Database := 'Alerta_db';
  con.ProviderName := 'SQL Server';
  con.SpecificOptions.Values['Authentication'] := 'auServer';
  unisql.Connection := con;
  try
    con.Connected := True;
    try
      unisql.Active;
      unisql.SQL.Clear;
      unisql.SQL.Text := 'select count(DR) as quantidade from [Alerta_db].dbo.unidades where DR = ' + QuotedStr(diretoria) + ' group by DR';
      unisql.Open;
      unisql.First;
      Result := unisql.Fields[0].AsInteger;
    finally
      unisql.SQL.Clear;
      unisql.Close;
      unisql.free;
    end;
  except
    Result := 0;
  end;
  con.Disconnect;
  con.free;
end;

function TForm1.unidadeEmail(unidade: string): string;
var
  con: TUniConnection;
  unisql: TUniQuery;
begin
  con := TUniConnection.Create(self);
  unisql := TUniQuery.Create(self);
  con.Server := conf_banco;
  con.Username := 'Alerta';
  con.Password := '!.Correios';
  con.LoginPrompt := false;
  con.Database := 'Alerta_db';
  con.ProviderName := 'SQL Server';
  con.SpecificOptions.Values['Authentication'] := 'auServer';
  unisql.Connection := con;
  try
    con.Connected := True;
    try
      unisql.Active;
      unisql.SQL.Clear;
      unisql.SQL.Text := 'select email from [Alerta_db].dbo.unidades where cod = ' + QuotedStr(unidade);
      unisql.Open;
      unisql.First;
      Result := unisql.Fields[0].AsString;
    finally
      unisql.SQL.Clear;
      unisql.Close;
      unisql.free;
    end;
  except
    Result := '';
  end;
  con.Disconnect;
  con.free;
end;

procedure TForm1.unidadesPend(diretoria: string; var lista: TStringlist);
var
  con: TUniConnection;
  unisql: TUniQuery;
begin
  con := TUniConnection.Create(self);
  unisql := TUniQuery.Create(self);
  con.Server := conf_banco;
  con.Username := 'Alerta';
  con.Password := '!.Correios';
  con.LoginPrompt := false;
  con.Database := 'Alerta_db';
  con.ProviderName := 'SQL Server';
  con.SpecificOptions.Values['Authentication'] := 'auServer';
  unisql.Connection := con;
  try
    con.Connected := True;
    try
      unisql.Active;
      lista.Clear;
      unisql.SQL.Clear;
      unisql.SQL.Text := 'select destino from [Alerta_db].[dbo].[acompanhamento] where DR_Destino = ' + QuotedStr(diretoria) + ' group by destino having count(destino) > 0;';
      unisql.Open;
      unisql.First;
      while not unisql.Eof do
      begin
        lista.Add(unisql.Fields[0].AsString);
        unisql.Next;
      end;
    finally
      unisql.SQL.Clear;
      unisql.Close;
      unisql.free;
    end;
  except
    lista.Clear;
  end;
  con.Disconnect;
  con.free;
end;

procedure TForm1.TodasUnidades(diretoria: string; var lista: TStringlist);
var
  con: TUniConnection;
  unisql: TUniQuery;
begin
  con := TUniConnection.Create(self);
  unisql := TUniQuery.Create(self);
  con.Server := conf_banco;
  con.Username := 'Alerta';
  con.Password := '!.Correios';
  con.LoginPrompt := false;
  con.Database := 'Alerta_db';
  con.ProviderName := 'SQL Server';
  con.SpecificOptions.Values['Authentication'] := 'auServer';
  unisql.Connection := con;
  try
    con.Connected := True;
    try
      unisql.Active;
      lista.Clear;
      unisql.SQL.Clear;
      unisql.SQL.Text := 'select cod from [Alerta_db].[dbo].[unidades] where DR = ' + QuotedStr(diretoria) + ';';
      unisql.Open;
      unisql.First;
      while not unisql.Eof do
      begin
        lista.Add(unisql.Fields[0].AsString);
        unisql.Next;
      end;
    finally
      unisql.SQL.Clear;
      unisql.Close;
      unisql.free;
    end;
  except
    lista.Clear;
  end;
  con.Disconnect;
  con.free;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  botaoSelect: integer;
begin
  botaoSelect := MessageDlg('Você deseja realmente sair do sistema?', TMsgDlgType.mtwarning, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0);
  if botaoSelect = mrNo then
    Action := TCloseAction(0);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  con: TUniConnection;
  unisql: TUniQuery;
  arqini: Tinifile;
  Pdata_tmp: TStrings;
  booltemp: boolean;
  I: Integer;
begin
  if not DirectoryExists('dados') then
    MkDir('dados');
  if not DirectoryExists('relatorios') then
    MkDir('relatorios');

  qtdiretorias := nil;
  qtdiretorias := TStringlist.Create;
  qtdiretorias.Add('ACR');
  qtdiretorias.Add('AL');
  qtdiretorias.Add('AM');
  qtdiretorias.Add('AP');
  qtdiretorias.Add('BA');
  qtdiretorias.Add('BSB');
  qtdiretorias.Add('CE');
  qtdiretorias.Add('ES');
  qtdiretorias.Add('GO');
  qtdiretorias.Add('MA');
  qtdiretorias.Add('MG');
  qtdiretorias.Add('MS');
  qtdiretorias.Add('MT');
  qtdiretorias.Add('PA');
  qtdiretorias.Add('PB');
  qtdiretorias.Add('PE');
  qtdiretorias.Add('PI');
  qtdiretorias.Add('PR');
  qtdiretorias.Add('RJ');
  qtdiretorias.Add('RN');
  qtdiretorias.Add('RO');
  qtdiretorias.Add('RR');
  qtdiretorias.Add('RS');
  qtdiretorias.Add('SC');
  qtdiretorias.Add('SE');
  qtdiretorias.Add('SPI');
  qtdiretorias.Add('SPM');
  qtdiretorias.Add('TO');

  for I := 0 to 1 do
  begin
    if assigned(unidade[I]) then
      unidade[I] := nil;
    unidade[I] := TStringlist.Create;
  end;
  if assigned(pendencia) then
    pendencia := nil;
  pendencia := TStringlist.Create;

  escreveLog('Iniciando a aplicação.');
  pasta_exec := ExtractFilePath(ParamStr(0));
  Pdata_tmp := TStringlist.Create;
  arqini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + 'conf.ini');
  if fileexists(ExtractFilePath(ParamStr(0)) + 'conf.ini') then
  try
    escreveLog('Carregando as configurações.');
    conf_internet := arqini.ReadBool('Geral', 'Internet', false);
    conf_Pdata := nil;
    conf_Pdata := TStringlist.Create;
    conf_Pdata.Sorted := True;
    conf_destHTML := arqini.ReadString('Geral', 'caminho HTML', '');
    conf_Dmenos := arqini.ReadInteger('Geral', 'DMenos', 1);
    conf_DR := arqini.ReadString('Geral', 'DR', 'PE');
    conf_xls := arqini.ReadBool('Geral', 'Excel', false);
    conf_html := arqini.ReadBool('Geral', 'HTML', false);
    conf_mail := arqini.ReadBool('Geral', 'Email', false);
    conf_processa := arqini.ReadTime('Geral', 'Processamento', StrToTime('23:00:00'));
    for I := 1 to 5 do
    begin
      conf_stes[I] := arqini.ReadString('STES', 'STES ' + inttostr(I), '');
      conf_UnStes[I] := arqini.ReadString('STES', 'Unidade STES ' + inttostr(I), '');
    end;
    arqini.ReadSection('Maquina_Pdata', Pdata_tmp);
    for I := 0 to Pdata_tmp.Count - 1 do
    begin
      booltemp := arqini.ReadBool('Maquina_Pdata', Pdata_tmp[I], false);
      if booltemp then
        conf_Pdata.Add(Pdata_tmp[I]);
    end;
    conf_banco := arqini.ReadString('Geral', 'Banco', 'LOCALHOST');
      // qtunidades := unidadesqt(conf_DR);
  finally
  end
  else
  begin
    escreveLog('Sem configurações pré-definidas.');
    ShowMessage('É necessário configurar o sistema!');
    conf_DMenos := 1;
    if not assigned(Form2) then
      Application.CreateForm(TForm2, Form2);
    Form2.ShowModal;
  end;
  Pdata_tmp.free;
  arqini.free;

end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
  if not assigned(Form2) then
    Application.CreateForm(TForm2, Form2);
  Form2.ShowModal;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  if not assigned(Form4) then
    Application.CreateForm(TForm4, Form4);
  Form4.ShowModal;
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  Form1.close;
end;

procedure TForm1.tmr1Timer(Sender: TObject);
begin
  if comparetime(conf_processa, Now) <= 0 then
  begin
    if (FormatDateTime('yyyymmdd', temp_data) = FormatDateTime('yyyymmdd', Now)) then
    begin
      if temp_quantidade = false then
      begin
         TelaAguardar;
        try
          btn4.enabled := false;
          form1.visible := False;
          ThreadVerifica.Start;
          while not ThreadVerifica.Stopped do
          begin
            Sleep(0);
            application.processmessages;
          end;
        finally
          form1.visible := true;
          Form1.Show;
          form1.bringtofront;
          btn4.enabled := True;
          form5.close;
        end;
        temp_quantidade := True;
      end;
    end
    else
    begin
      temp_data := Now;
      temp_quantidade := false;
    end;
  end;
end;

procedure TForm1.tmr2Timer(Sender: TObject);
begin
  if fileexists(pasta_exec + '\dados\continua.ok') then
    if (DeleteFile(PChar(pasta_exec + '\dados\continua.ok'))) then
    begin
      continua_ := True;
      tmr2.Enabled := false;
    end;
end;

procedure TForm1.enviamail(unidade, unidade_mail: string);
// Procedure para enviar o email
var
  Y: Integer;
  caminho: string;
begin
  if ((unidade <> '') and (unidade_mail <> '') and (FileExists(caminho + 'relatorios\' + unidade + '.xlsx'))) then
  begin
    caminho := ExtractFilePath(ParamStr(0));

    try
      //idsmtp1.Username := 'correiosnet\peextraviozero';
      idsmtp1.Password := 'Pp123456';
      if not idsmtp1.Connected then
      try
        idsmtp1.Connect;
        if not idsmtp1.Authenticate then
          escreveLog('Não conseguiu autenticação!');
      except
        on E: Exception do
          escreveLog('Erro ao tentar conectar/autenticar: ' + E.Message);
      end;

      try
        idmsg1.MessageParts.Clear;
      finally
        TIdAttachmentFile.Create(idmsg1.MessageParts, caminho + 'relatorios\' + unidade + '.xlsx');
      end;

      idmsg1.From.Address := 'peextraviozero@correios.com.br';
      // dm.idmsg1.From.Address := 'peextraviozero@correios.com.br';
      idmsg1.From.Name := 'Raoni Miranda Neves';
      idmsg1.Recipients.EMailAddresses := unidade_mail;
         // dm.idmsg1.Recipients.EMailAddresses := u_mail[k] + ';' + u_mail2[k];
      idmsg1.subject := 'Acompanhamento e Alerta de Pendências - SAAP';
      idmsg1.Body.Add('Prezado Gestor:');
      idmsg1.Body.Add(chr(13));
      idmsg1.Body.Add(chr(13));
      idmsg1.Body.Add('Os objetos contidos na planilha anexa foram encaminhados para sua unidade e até o momento desta verificação não tiveram nenhum outro evento registrado.');
      idmsg1.Body.Add('Diante do exposto, solicitamos verificar se os objetos em questão já foram recebidos por sua unidade. Caso afirmativo, realizar imediatamente a regularização de tais pendências, adotando os procedimentos previstos no MANENC, 16/3 e ou MANDIS, 3/15.');
      idmsg1.Body.Add(chr(13));
      idmsg1.Body.Add('Caso o objeto não tenha sido localizado na unidade, cumprir o que estabelece o MANPOC, 12/2, no tocante à emissão de CIE - Comunicação de Irregularidade na Expedição, e demais procedimentos previstos na referida norma.');
      idmsg1.Body.Add(chr(13));
      idmsg1.Body.Add('Lembramos que, caso seja detectado algum problema no SRO, abrir chamado no HelpDesk e comunicar de imediato à coordenação do SRO (srope@correios.com.br).');
      idmsg1.Body.Add(chr(13));
      idmsg1.Body.Add('Este e-mail foi enviado de forma automática, não devendo ser respondido. Qualquer dúvida, entrar em contato com sua chefia imediata.');
      idmsg1.Body.Add(chr(13));
      idmsg1.Body.Add(chr(13));
      idmsg1.Body.Add('SAAP - Sistema de Acompanhamento e Alerta de Pendências');

      try
        idsmtp1.send(idmsg1);
        Sleep(10000);

      except
        on E: Exception do
          escreveLog('Erro ao enviar a mensagem: ' + E.Message);
      end;

    finally
      if idsmtp1.Connected then
        idsmtp1.Disconnect;
      idmsg1.Body.Clear;
    end;

  end;
end;

end.


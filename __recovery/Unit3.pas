unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Xml.xmldom,
  Xml.XMLIntf, Xml.XMLDoc, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, IdThreadComponent, ActiveX, Vcl.ExtCtrls, Soap.Rio, Soap.SOAPHTTPClient;

type
  TForm3 = class(TForm)
    mmo1: TMemo;
    btn1: TButton;
    btn2: TButton;
    thread4: TIdThreadComponent;
    thread1: TIdThreadComponent;
    thread2: TIdThreadComponent;
    thread3: TIdThreadComponent;
    thread5: TIdThreadComponent;
    thread6: TIdThreadComponent;
    thread7: TIdThreadComponent;
    thread8: TIdThreadComponent;
    thread9: TIdThreadComponent;
    thread10: TIdThreadComponent;
    thread11: TIdThreadComponent;
    thread12: TIdThreadComponent;
    thread13: TIdThreadComponent;
    thread14: TIdThreadComponent;
    thread15: TIdThreadComponent;
    thread16: TIdThreadComponent;
    thread17: TIdThreadComponent;
    thread18: TIdThreadComponent;
    thread19: TIdThreadComponent;
    thread20: TIdThreadComponent;
    tmr1: TTimer;
    procedure thread1Run(Sender: TIdThreadComponent);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
  private
    procedure escreveThread(nome_thread, texto: string);
    function macroSRO(lista_objetos: tstringlist; internet_: boolean): Tstringlist;

    { Private declarations }
  public
    procedure Separa50(lista: tstringlist);
    procedure iniciathreads;
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses
  Unit1, Rastro1;

procedure TForm3.escreveThread(nome_thread, texto: string);
var
  arquivolog: TextFile;
  tempo: string;
  caminho: string;
begin
  caminho := ExtractFilePath(ParamStr(0)) + 'dados\';
  tempo := FormatDateTime('dd/mm/yyyy hh:nn:ss:zzz', Now);
  AssignFile(arquivolog, caminho + nome_thread + '.txt');
  try
    if fileexists(caminho + nome_thread + '.txt') then
      append(arquivolog)
    else
      Rewrite(arquivolog);
    Writeln(arquivolog, tempo + ' - ' + texto);
  except
  end;
  CloseFile(arquivolog);

end;

procedure TForm3.thread1Run(Sender: TIdThreadComponent);
var
  arquivo, resultado, erro: tstringlist;
  caminho, Tnumero: string;
  I: Integer;
begin
  Tnumero := Copy(sender.Name, Pos('thread', sender.name) + 6, Length(sender.Name) - 6);
  caminho := ExtractFilePath(ParamStr(0)) + 'dados\';
  if FileExists(caminho + 'arquivo' + Tnumero + '.txt') then
  begin
    CoInitialize(nil);
    arquivo := tstringlist.Create;
    resultado := tstringlist.Create;
    erro := tstringlist.Create;
    arquivo.LoadFromFile(caminho + 'arquivo' + Tnumero + '.txt');
    if arquivo.Count > 0 then
    begin
      try
        resultado.AddStrings(macroSRO(arquivo, true));
      except
        on E: Exception do
        begin
          escrevethread(Sender.Name, E.ClassName + ' error raised, with message : ' + E.Message);
          erro.AddStrings(arquivo);
        end;
      end;
      if erro.Count > 0 then
        erro.SaveToFile(caminho + 'erro' + Tnumero + '.txt');
    end;
    arquivo.free;
    resultado.SaveToFile(caminho + 'resultado' + Tnumero + '.txt');
    erro.free;
    resultado.free;
    Sender.Terminate;
    CoUninitialize;
  end
  else
    sender.Terminate;
end;

procedure TForm3.tmr1Timer(Sender: TObject);
begin
  mmo1.Lines.Clear;
  mmo1.Lines.Add(BoolToStr(thread1.Terminated));
  mmo1.Lines.Add(BoolToStr(thread2.Terminated));
  mmo1.Lines.Add(BoolToStr(thread3.Terminated));
  mmo1.Lines.Add(BoolToStr(thread4.Terminated));
  mmo1.Lines.Add(BoolToStr(thread5.Terminated));
  mmo1.Lines.Add(BoolToStr(thread6.Terminated));
  mmo1.Lines.Add(BoolToStr(thread7.Terminated));
  mmo1.Lines.Add(BoolToStr(thread8.Terminated));
  mmo1.Lines.Add(BoolToStr(thread9.Terminated));
  mmo1.Lines.Add(BoolToStr(thread10.Terminated));
  mmo1.Lines.Add(BoolToStr(thread11.Terminated));
  mmo1.Lines.Add(BoolToStr(thread12.Terminated));
  mmo1.Lines.Add(BoolToStr(thread13.Terminated));
  mmo1.Lines.Add(BoolToStr(thread14.Terminated));
  mmo1.Lines.Add(BoolToStr(thread15.Terminated));
  mmo1.Lines.Add(BoolToStr(thread16.Terminated));
  mmo1.Lines.Add(BoolToStr(thread17.Terminated));
  mmo1.Lines.Add(BoolToStr(thread18.Terminated));
  mmo1.Lines.Add(BoolToStr(thread19.Terminated));
  mmo1.Lines.Add(BoolToStr(thread20.Terminated));
end;

procedure TForm3.btn1Click(Sender: TObject);
var
  Teste, resultado__: TStringList;
  caminho: string;
  I: Integer;
begin
{
  caminho := ExtractFilePath(ParamStr(0));
  resultado__ := tstringlist.Create;
  Teste := tstringlist.create;
  teste.LoadFromFile(caminho + 'teste.txt');
  resultado__.assign(macroSRO(teste, True));
  ShowMessage(resultado__.Text);
  resultado__.free;
  Teste.Free;
  }
  I := 0;
  caminho := ExtractFilePath(ParamStr(0));
  resultado__ := tstringlist.Create;
  Teste := tstringlist.create;
  teste.LoadFromFile(caminho + 'teste.txt');
  while caminho <> '' do
  begin
    mmo1.Lines.Add('Numero: ' + IntToStr(I));
    mmo1.lines.addstrings(macroSRO(teste, True));
    I := I + 1;
  end;
  resultado__.free;
  Teste.Free;

end;
     {
begin
  thread1.Start;
end; }

procedure TForm3.iniciathreads;
var
  caminho: string;
  resultados, temp, erros: tstringlist;
  I: Integer;
begin
  resultados := tstringlist.Create;
  temp := tstringlist.Create;
  erros := tstringlist.Create;
  caminho := ExtractFilePath(ParamStr(0)) + 'dados\';
  thread1.Start;
  thread2.Start;
  thread3.Start;
  thread4.Start;
  thread5.Start;
  thread6.Start;
  thread7.Start;
  thread8.Start;
  thread9.Start;
  thread10.Start;
  thread11.Start;
  thread12.Start;
  thread13.Start;
  thread14.Start;
  thread15.Start;
  thread16.Start;
  thread17.Start;
  thread18.Start;
  thread19.Start;
  thread20.Start;
  while not ((thread1.Terminated) and (thread2.Terminated) and (thread3.Terminated) and (thread4.Terminated) and (thread5.Terminated) and (thread6.Terminated) and (thread7.Terminated) and (thread8.Terminated) and (thread9.Terminated) and (thread10.Terminated) and (thread11.Terminated) and (thread12.Terminated) and (thread13.Terminated) and (thread14.Terminated) and (thread15.Terminated) and (thread16.Terminated) and (thread17.Terminated) and (thread18.Terminated) and (thread19.Terminated) and (thread20.Terminated)) do
  begin
    Sleep(0);
    Application.ProcessMessages;
  end;
  for I := 0 to 19 do
  begin
    if fileexists(caminho + 'resultado' + inttostr(I + 1) + '.txt') then
    begin
      temp.LoadFromFile(caminho + 'resultado' + inttostr(I + 1) + '.txt');
      resultados.AddStrings(temp);
      temp.Clear;
      DeleteFile(caminho + 'resultado' + inttostr(I + 1) + '.txt')
    end;
    if fileexists(caminho + 'erro' + inttostr(I + 1) + '.txt') then
    begin
      temp.LoadFromFile(caminho + 'erro' + inttostr(I + 1) + '.txt');
      erros.AddStrings(temp);
      temp.Clear;
      DeleteFile(caminho + 'erro' + inttostr(I + 1) + '.txt')
    end;
  end;
  if erros.Count > 0 then
  begin
    erros.SaveToFile(caminho + 'arquivo1.txt');
    thread1.Start;
    while not (thread1.terminated) do
    begin
      Sleep(0);
      application.ProcessMessages;
    end;
    temp.LoadFromFile(caminho + 'resultado1.txt');
    resultados.AddStrings(temp);
    temp.Clear;
    DeleteFile(caminho + 'resultado1.txt')
  end;
  resultados.SaveToFile(caminho + 'Resultado.txt');
  resultados.Free;
  temp.Free;
  erros.Free;
  for I := 1 to 20 do
  begin
    if FileExists(caminho + 'arquivo' + inttostr(I) + '.txt') then
      DeleteFile(caminho + 'arquivo' + inttostr(I) + '.txt');
    if FileExists(caminho + 'erro' + inttostr(I) + '.txt') then
      DeleteFile(caminho + 'erro' + inttostr(I) + '.txt');
  end;
end;

procedure TForm3.btn2Click(Sender: TObject);
var
  agora: TDateTime;
  test__: TStringList;
begin
  test__ := TStringList.Create;
  test__.LoadFromFile('D:\SAAP_WSDL\Win32\Release\dados\teste.txt');
  Separa50(test__);
  agora := Now;
  iniciathreads;
  agora := Now - agora;
  tmr1.Enabled := True;
  ShowMessage('Terminada a execução' + chr(13) + 'Tempo de execução: ' + FormatDateTime('hh:mm:ss', agora));
  tmr1.Enabled := false;
  test__.Free;
end;

procedure TForm3.Separa50(lista: tstringlist);
var
  caminho: string;
  I, controle: Integer;
  lista_resultado: array[0..19] of TStringList;
begin
  if lista.Count > 0 then
  begin
    caminho := ExtractFilePath(ParamStr(0));

    for I := 0 to 19 do
      lista_resultado[I] := TStringList.Create;

    controle := 0;
    for I := 0 to lista.Count - 1 do
    begin
      if controle > 19 then
        controle := 0;
      lista_resultado[controle].Add(lista[I]);
      controle := controle + 1;
    end;

    for I := 0 to 19 do
    begin
      if lista_resultado[I].Count > 0 then
        lista_resultado[I].SaveToFile(caminho + 'dados\Arquivo' + inttostr(I + 1) + '.txt');
      lista_resultado[I].Free;
    end;
  end;

end;

function TForm3.macroSRO(lista_objetos: tstringlist; internet_: boolean): Tstringlist;
const
  sro_usuario: string = 'RAONIMIRAN';
  sro_senha: string = 'T6UAU2G70';
  sro_lingua: string = '101';
//  sro_encaminhamento : array [0..1] of string = ('DO', 'RO');
//  sro_baixa : array [0..2] of string = ('BDI', 'BDR', 'BDE');
var
  sro_encaminhamento: TStringList;
  sro_baixa: TStringList;
  ser: Service;
  busca_sro: sroxml;
  objetos2: array of Array_Of_string;
  I, J, lotes, resto, controle, ContaErro: integer;
  htpr1: THTTPRIO;
begin
  htpr1 := THTTPRIO.Create(self);

  if Assigned(result) then
    Result := nil;
  Result := tstringlist.Create;

  resto := (lista_objetos.Count mod 200);
  if resto <> 0 then
    lotes := trunc(lista_objetos.Count / 200) + 1
  else
    lotes := trunc(lista_objetos.Count / 200);
  SetLength(objetos2, lotes);
  for I := 0 to lotes - 1 do
  begin
    SetLength(objetos2[I], 200);
  end;
  if resto <> 0 then
    SetLength(objetos2[lotes - 1], resto);

  controle := 0;
  J := 0;
  for I := 0 to (lista_objetos.Count - 1) do            //completa os lotes
  begin
    objetos2[controle][J] := lista_objetos[I];
    J := J + 1;
    if J = 200 then
    begin
      controle := controle + 1;
      J := 0;
    end;
  end;

  sro_encaminhamento := TStringList.Create;
  sro_baixa := TStringList.Create;
  sro_encaminhamento.Add('DO');
  sro_encaminhamento.Add('RO');
  sro_baixa.Add('BDE');
  sro_baixa.Add('BDI');
  sro_baixa.Add('BDR');

  busca_sro := sroxml.Create;
  htpr1.HTTPWebNode.ConnectTimeout := 1000 * 180;
  htpr1.HTTPWebNode.SendTimeout := 1000 * 400;
  htpr1.HTTPWebNode.ReceiveTimeout := 1000 * 400;
  //htpr1.HTTPWebNode.Proxy := 'proxyac.correiosnet.int';
  try
    ser := GetService(true, '', htpr1);

  except
    on E: Exception do
    begin
      //if Pos('Bad Gateway', e.Message) <> 0 then
      if e.ClassName = 'ESOAPHTTPException' then
      begin
        ContaErro := 0;
        while ContaErro < 5 do
        begin
          Sleep(10000);
          ser := GetService(true, '', htpr1);
          ContaErro := ContaErro + 1;
        end;
      end;
      escreveThread('log_Macro', e.ClassName + ' - Erro no serviço: ' + e.Message);
    end;

  end;

  for I := 0 to (lotes - 1) do
  begin
    try
      busca_sro := ser.buscaEventosLista(sro_usuario, sro_senha, 'L', 'U', sro_lingua, objetos2[I]);
    except
      on E: Exception do
      begin
      //if Pos('Bad Gateway', e.Message) <> 0 then
        if e.ClassName = 'ESOAPHTTPException' then
        begin
          ContaErro := 0;
          while ContaErro < 5 do
          begin
            Sleep(10000);
            busca_sro := ser.buscaEventosLista(sro_usuario, sro_senha, 'L', 'U', sro_lingua, objetos2[I]);
            ContaErro := ContaErro + 1;
          end;
        end;
        escreveThread('log_Macro', e.ClassName + ' - Erro no BuscaSRO: ' + e.Message);
      end;

    end;
    for J := 0 to StrToInt(busca_sro.qtd) - 1 do
    begin
      if busca_sro.objeto[J].erro = '' then
      begin
        if (sro_encaminhamento.IndexOf(busca_sro.objeto[J].evento[0].tipo) <> -1) then
          Result.Add(busca_sro.objeto[J].numero + ',' + busca_sro.objeto[J].evento[0].data + ',' + busca_sro.objeto[J].evento[0].destino[0].codigo + ',' + busca_sro.objeto[J].evento[0].codigo);
        if (sro_baixa.IndexOf(busca_sro.objeto[J].evento[0].tipo) <> -1) then
        begin
          if busca_sro.objeto[J].evento[0].status = '69' then
            Result.Add(busca_sro.objeto[J].numero + ',' + busca_sro.objeto[J].evento[0].data + ',' + busca_sro.objeto[J].evento[0].codigo + ',' + busca_sro.objeto[J].evento[0].codigo);
        end;
      end;

    end;
  end;


  // se o tipo de evento for RO ou DO
  //
  busca_sro.Free;
  sro_baixa.Free;
  sro_encaminhamento.Free;

  if Assigned(htpr1) then
    htpr1 := nil;

end;

end.


unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.TabControl, FMX.ListView.Types,
  FMX.ListView, FMX.DateTimeCtrls, FMX.Edit, FMX.Memo, System.IniFiles, FMX.TMSSlider,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.TMSBaseControl, FMX.Objects,
  Winapi.Windows, FMX.EditBox, FMX.NumberBox, FMX.SpinBox;

type
  TForm2 = class(TForm)
    tbc1: TTabControl;
    tbtm1: TTabItem;
    tbtm2: TTabItem;
    grp1: TGroupBox;
    lbl1: TLabel;
    cbb1: TComboBox;
    grp2: TGroupBox;
    grp3: TGroupBox;
    lv1: TListView;
    lv2: TListView;
    btn3: TButton;
    tmdt1: TTimeEdit;
    lbl2: TLabel;
    grp4: TGroupBox;
    lbl3: TLabel;
    stes1: TEdit;
    chk1: TCheckBox;
    grp11: TGroupBox;
    lbl8: TLabel;
    chkxls: TCheckBox;
    grp9: TGroupBox;
    grp10: TGroupBox;
    chkhtml: TCheckBox;
    edt6: TEdit;
    lbl9: TLabel;
    grp12: TGroupBox;
  //  sld1: TTMSFMXSlider;
    lbl10: TLabel;
    lbl11: TLabel;
    edt7: TEdit;
    sld1: TTMSFMXSlider;
    grp14: TGroupBox;
    chkmail: TCheckBox;
    UnStes1: TEdit;
    lbl12: TLabel;
    grp5: TGroupBox;
    lbl4: TLabel;
    Stes2: TEdit;
    chk2: TCheckBox;
    UnStes2: TEdit;
    lbl5: TLabel;
    grp6: TGroupBox;
    lbl6: TLabel;
    Stes4: TEdit;
    chk4: TCheckBox;
    UnStes4: TEdit;
    lbl7: TLabel;
    grp7: TGroupBox;
    lbl13: TLabel;
    Stes3: TEdit;
    chk3: TCheckBox;
    UnStes3: TEdit;
    lbl14: TLabel;
    grp8: TGroupBox;
    lbl15: TLabel;
    Stes5: TEdit;
    chk5: TCheckBox;
    UnStes5: TEdit;
    lbl16: TLabel;
    p1: TPopup;
    cltpnl1: TCalloutPanel;
    lbl: TLabel;
    img2: TImage;
    img5: TImage;
    img6: TImage;
    spnbx1: TSpinBox;
    lbl17: TLabel;
    procedure btn2Click(Sender: TObject);
    procedure lv1DblClick(Sender: TObject);
    procedure stes1KeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure chk1Change(Sender: TObject);
    procedure chk2Change(Sender: TObject);
    procedure chk3Change(Sender: TObject);
    procedure chk4Change(Sender: TObject);
    procedure chk5Change(Sender: TObject);
    procedure lv2DblClick(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbb1Change(Sender: TObject);
    procedure sld1StateChanged(Sender: TObject);
    procedure chkxlsChange(Sender: TObject);
    procedure lv1MouseEnter(Sender: TObject);
    procedure lv1MouseLeave(Sender: TObject);
    procedure lv2MouseEnter(Sender: TObject);
    procedure lv2MouseLeave(Sender: TObject);
    procedure stes1MouseEnter(Sender: TObject);
    procedure UnStes1MouseEnter(Sender: TObject);
    procedure Stes2MouseEnter(Sender: TObject);
    procedure Stes3MouseEnter(Sender: TObject);
    procedure Stes4MouseEnter(Sender: TObject);
    procedure Stes5MouseEnter(Sender: TObject);
    procedure UnStes2MouseEnter(Sender: TObject);
    procedure UnStes3MouseEnter(Sender: TObject);
    procedure UnStes4MouseEnter(Sender: TObject);
    procedure UnStes5MouseEnter(Sender: TObject);
    procedure edt7MouseEnter(Sender: TObject);
    procedure tmdt1MouseEnter(Sender: TObject);
    procedure sld1MouseEnter(Sender: TObject);
    procedure cbb1MouseEnter(Sender: TObject);
    procedure edt6MouseEnter(Sender: TObject);
    procedure edt7Exit(Sender: TObject);
    procedure edt6MouseLeave(Sender: TObject);
  private
    procedure adicionalv(lview: tlistview; conteudo: string);
    procedure adicionaitems;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses
  Unit1;

procedure TForm2.btn2Click(Sender: TObject);
var
  LItem: TListViewItem;
  I: Integer;
begin
  lv2.BeginUpdate;
  try
    for I := 1 to 10 do
    begin
      LItem := lv2.Items.Add;
      LItem.Text := IntToStr(I);
    end;
  finally
    lv2.EndUpdate;
  end;
end;

procedure TForm2.btn3Click(Sender: TObject);
begin
  Form2.Close;
end;

procedure TForm2.cbb1Change(Sender: TObject);
begin
  lbl8.Text := 'Quantidade de unidades: ' + FormatFloat('#,#', Form1.unidadesqt(cbb1.Items[cbb1.ItemIndex]));
end;

procedure TForm2.cbb1MouseEnter(Sender: TObject);
begin
  p1.PlacementTarget := cbb1;
  lbl.Text := 'Escolha a DR que será verificada';
  p1.IsOpen := True;
end;

procedure TForm2.chk1Change(Sender: TObject);
begin
  if chk1.IsChecked then
  begin
    stes1.Enabled := True;
    UnStes1.Enabled := true;
  end
  else
  begin
    stes1.Enabled := False;
    UnStes1.Enabled := False;

  end;

end;

procedure TForm2.chk2Change(Sender: TObject);
begin
  if chk2.IsChecked then
  begin
    stes2.Enabled := True;
    unStes2.Enabled := True;
  end
  else
  begin
    stes2.Enabled := False;
    UnStes2.Enabled := False;
  end;

end;

procedure TForm2.chk3Change(Sender: TObject);
begin
  if chk3.IsChecked then
  begin
    UnStes3.Enabled := True;
    stes3.Enabled := True;
  end
  else
  begin
    stes3.Enabled := False;
    UnStes3.Enabled := False;
  end;

end;

procedure TForm2.chk4Change(Sender: TObject);
begin
  if chk4.IsChecked then
  begin
    Stes4.Enabled := True;
    UnStes4.Enabled := True;
  end
  else
  begin
    UnStes4.Enabled := False;
    stes4.Enabled := False;

  end;

end;

procedure TForm2.chk5Change(Sender: TObject);
begin
  if chk5.IsChecked then
  begin
    stes5.Enabled := True;
    unStes5.Enabled := True;
  end
  else
  begin
    stes5.Enabled := False;
    UnStes5.Enabled := False;
  end;

end;

procedure TForm2.chkxlsChange(Sender: TObject);
begin
  if (sld1.State = ssOff) then
    if (chkxls.IsChecked = True) then
      chkmail.Enabled := True
    else
    begin
      chkmail.IsChecked := False;
      chkmail.enabled := false;
    end;
end;

procedure TForm2.edt6MouseEnter(Sender: TObject);
begin
  p1.PlacementTarget := edt6;
  lbl.Text := 'Inserir o caminho completo para o servidor HTML.' + chr(13) + 'Ex: \\10.128.128.178\pendencias\' + chr(13) + 'Importante: O usuário deve ter acesso à pasta!';
  p1.Width := 200;
  p1.Height := 100;
  p1.IsOpen := True;
end;

procedure TForm2.edt6MouseLeave(Sender: TObject);
begin
  p1.IsOpen := False;
  p1.Width := 169;
  p1.Height := 73;
  cltpnl1.CalloutPosition := TCalloutPosition(0);
  p1.Placement := TPlacement(5);
end;

procedure TForm2.edt7Exit(Sender: TObject);
begin
  Form1.conf_banco := edt7.Text;
  lbl8.Text := 'Quantidade de unidades: ' + FormatFloat('#,#', Form1.unidadesqt(cbb1.Items[cbb1.ItemIndex]));
end;

procedure TForm2.edt7MouseEnter(Sender: TObject);
begin
  p1.PlacementTarget := edt7;
  lbl.Text := 'Digite o nome da máquina onde está instalado o banco de dados';
  p1.IsOpen := True;
end;

procedure TForm2.stes1KeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if not CharInSet(KeyChar, ['.', '0'..'9']) then
  begin
    KeyChar := #0;
  end

end;

procedure TForm2.stes1MouseEnter(Sender: TObject);
begin
  p1.PlacementTarget := stes1;
  lbl.Text := 'Digite o IP do servidor STES';
  p1.IsOpen := True;
end;

procedure TForm2.Stes2MouseEnter(Sender: TObject);
begin
  p1.PlacementTarget := stes2;
  lbl.Text := 'Digite o IP do servidor STES';
  p1.IsOpen := True;
end;

procedure TForm2.Stes3MouseEnter(Sender: TObject);
begin
  p1.PlacementTarget := stes3;
  lbl.Text := 'Digite o IP do servidor STES';
  p1.IsOpen := True;
end;

procedure TForm2.Stes4MouseEnter(Sender: TObject);
begin
  p1.PlacementTarget := stes4;
  lbl.Text := 'Digite o IP do servidor STES';
  p1.IsOpen := True;
end;

procedure TForm2.Stes5MouseEnter(Sender: TObject);
begin
  p1.PlacementTarget := stes5;
  lbl.Text := 'Digite o IP do servidor STES';
  p1.IsOpen := True;
end;

procedure TForm2.tmdt1MouseEnter(Sender: TObject);
begin
  p1.PlacementTarget := tmdt1;
  lbl.Text := 'Horário em que o sistema realizará a rotina de verificação';
  p1.IsOpen := True;
end;

procedure TForm2.UnStes1MouseEnter(Sender: TObject);
begin
  p1.PlacementTarget := unstes1;
  lbl.Text := 'Digite o código SRO da unidade responsável pelo STES';
  p1.IsOpen := True;
end;

procedure TForm2.UnStes2MouseEnter(Sender: TObject);
begin
  p1.PlacementTarget := unstes2;
  lbl.Text := 'Digite o código SRO da unidade responsável pelo STES';
  p1.IsOpen := True;
end;

procedure TForm2.UnStes3MouseEnter(Sender: TObject);
begin
  p1.PlacementTarget := unstes3;
  lbl.Text := 'Digite o código SRO da unidade responsável pelo STES';
  p1.IsOpen := True;
end;

procedure TForm2.UnStes4MouseEnter(Sender: TObject);
begin
  p1.PlacementTarget := unstes4;
  lbl.Text := 'Digite o código SRO da unidade responsável pelo STES';
  p1.IsOpen := True;
end;

procedure TForm2.UnStes5MouseEnter(Sender: TObject);
begin
  p1.PlacementTarget := unstes5;
  lbl.Text := 'Digite o código SRO da unidade responsável pelo STES';
  p1.IsOpen := True;
end;

procedure Tform2.adicionaitems();
var
  LItem: TListViewItem;
begin
  form2.lv1.BeginUpdate;
  try
    LItem := form2.lv1.Items.Add;
    LItem.Text := '301 - CTE Recife';
    LItem := form2.lv1.Items.Add;
    LItem.Text := '302 - CTE Curitiba';
    LItem := form2.lv1.Items.Add;
    LItem.Text := '303 - CTE Vila Maria';
    LItem := form2.lv1.Items.Add;
    LItem.Text := '304 - CTE Jaguaré';
    LItem := form2.lv1.Items.Add;
    LItem.Text := '305 - CTE Benfica';
    LItem := form2.lv1.Items.Add;
    LItem.Text := '306 - CTE Porto Alegre';
    LItem := form2.lv1.Items.Add;
    LItem.Text := '307 - Belo Horizonte';
    LItem := form2.lv1.Items.Add;
    LItem.Text := '308 - CTE Saúde';
    LItem := form2.lv1.Items.Add;
    LItem.Text := '309 - CTE Campinas';

  finally
    form2.lv1.EndUpdate;
  end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
var
  arqini: Tinifile;
  I, index: Integer;
begin
  Arqini := TiniFile.create(ExtractFilePath(ParamStr(0)) + 'conf.ini');
{Grava as Máquinas}
  if Assigned(form1.conf_Pdata) then
  try
    for I := 301 to 309 do
    begin
      if form1.conf_Pdata.Find(IntToStr(I), index) then
        arqini.WriteBool('Maquina_Pdata', IntToStr(I), True)
      else
        arqini.WriteBool('Maquina_Pdata', IntToStr(I), False);
    end;
  finally

  end;
  Form1.conf_stes[1] := stes1.Text;
  Form1.conf_stes[2] := stes2.Text;
  Form1.conf_stes[3] := stes3.Text;
  Form1.conf_stes[4] := stes4.Text;
  Form1.conf_stes[5] := stes5.Text;
  Form1.conf_Unstes[1] := Unstes1.Text;
  Form1.conf_Unstes[2] := Unstes2.Text;
  Form1.conf_Unstes[3] := Unstes3.Text;
  Form1.conf_Unstes[4] := Unstes4.Text;
  Form1.conf_Unstes[5] := Unstes5.Text;
  Form1.conf_destHTML := edt6.text;

  arqini.WriteString('Geral', 'caminho HTML', Form1.conf_destHTML);

  arqini.WriteString('STES', 'STES 1', Form1.conf_stes[1]);
  arqini.WriteString('STES', 'STES 2', Form1.conf_stes[2]);
  arqini.WriteString('STES', 'STES 3', Form1.conf_stes[3]);
  arqini.WriteString('STES', 'STES 4', Form1.conf_stes[4]);
  arqini.WriteString('STES', 'STES 5', Form1.conf_stes[5]);
  arqini.WriteString('STES', 'Unidade STES 1', Form1.conf_unstes[1]);
  arqini.WriteString('STES', 'Unidade STES 2', Form1.conf_unstes[2]);
  arqini.WriteString('STES', 'Unidade STES 3', Form1.conf_unstes[3]);
  arqini.WriteString('STES', 'Unidade STES 4', Form1.conf_unstes[4]);
  arqini.WriteString('STES', 'Unidade STES 5', Form1.conf_unstes[5]);
  form1.conf_processa := tmdt1.Time;
  form1.conf_xls := chkxls.IsChecked;
  form1.conf_html := chkhtml.IsChecked;
  form1.conf_mail := chkmail.IsChecked;
  arqini.WriteBool('Geral', 'Email', Form1.conf_mail);
  arqini.WriteBool('Geral', 'Excel', Form1.conf_xls);
  arqini.WriteBool('Geral', 'HTML', Form1.conf_html);
  form1.conf_DR := cbb1.Items[cbb1.ItemIndex];
  arqini.WriteString('Geral', 'DR', Form1.conf_DR);
  if edt7.Text <> '' then
    arqini.WriteString('Geral', 'Banco', edt7.Text)
  else
    arqini.WriteString('Geral', 'Banco', 'LOCALHOST');

  arqini.WriteTime('Geral', 'Processamento', tmdt1.Time);
  arqini.WriteInteger('Geral', 'DMenos', StrToInt(spnbx1.Text));
  Form1.conf_DMenos := StrToInt(spnbx1.Text);

  if sld1.State = ssOff then
  begin
    form1.conf_internet := False;
    arqini.WriteBool('Geral', 'Internet', False)
  end
  else
  begin
    form1.conf_internet := True;
    arqini.WriteBool('Geral', 'Internet', True);
  end;

  arqini.free;
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  maquina: string;
  apaga: TStringList;
  I, J, K: Integer;
  LItem: array[1..2] of TListViewItem;
begin
  adicionaitems;
  Sleep(10);
  apaga := nil;
  apaga := TStringList.Create;
  if (Assigned(form1.conf_Pdata)) and (form1.conf_Pdata.Count > 0) then
    for I := 0 to lv1.Items.Count - 1 do
    try
      LItem[1] := lv1.Items[I];
      for J := 0 to form1.conf_Pdata.Count - 1 do
      begin
        if Copy(lv1.Items[I].Text, 0, 3) = form1.conf_Pdata[J] then
        try
          lv1.BeginUpdate;
          lv2.BeginUpdate;
          maquina := Copy(LItem[1].Text, 0, 3);
          adicionalv(lv2, LItem[1].text);
          apaga.Add(IntToStr(LItem[1].Index));
        finally
          lv1.EndUpdate;
          lv2.EndUpdate;
        end;
      end;
    finally
    end;
  if apaga.Count > 0 then
    for K := (apaga.Count - 1) downto 0 do
    begin
      lv1.Items.Delete(StrToInt(apaga[K]));
    end;
  apaga.Free;
  if form1.conf_internet then
    sld1.State := ssOn
  else
    sld1.State := ssOff;
  if Form1.conf_DR <> '' then
    cbb1.ItemIndex := cbb1.Items.IndexOf(Form1.conf_DR);
  if form1.conf_banco = '' then
  begin
    edt7.Text := 'LOCALHOST';
    form1.conf_banco := 'LOCALHOST';
  end
  else
    edt7.Text := form1.conf_banco;
  if form1.conf_xls then
    chkxls.IsChecked := true;
  if form1.conf_html then
    chkhtml.IsChecked := true;
  if Form1.conf_mail then
    chkmail.IsChecked := True;
  tmdt1.Time := form1.conf_processa;

  if Form1.conf_stes[1] <> '' then
  begin
    chk1.IsChecked := True;
    stes1.Text := Form1.conf_stes[1];
    UnStes1.Text := Form1.conf_UnStes[1];
  end;
  if Form1.conf_stes[2] <> '' then
  begin
    chk2.IsChecked := True;
    stes2.Text := Form1.conf_stes[2];
    UnStes2.Text := Form1.conf_UnStes[2];
  end;
  if Form1.conf_stes[3] <> '' then
  begin
    chk3.IsChecked := True;
    stes3.Text := Form1.conf_stes[3];
    UnStes3.Text := Form1.conf_UnStes[3];
  end;
  if Form1.conf_stes[4] <> '' then
  begin
    chk4.IsChecked := True;
    stes4.Text := Form1.conf_stes[4];
    UnStes4.Text := Form1.conf_UnStes[4];
  end;
  if Form1.conf_stes[5] <> '' then
  begin
    chk5.IsChecked := True;
    stes5.Text := Form1.conf_stes[5];
    UnStes5.Text := Form1.conf_UnStes[5];
  end;
  if Form1.conf_destHTML <> '' then
  begin
    chkhtml.ischecked := True;
    edt6.text := form1.conf_destHTML;
  end;
    spnbx1.Text := IntToStr(Form1.conf_DMenos);

end;

procedure TForm2.lv1DblClick(Sender: TObject);
var
  maquina: string;
  LItem: array[1..2] of TListViewItem;
begin
  try
    LItem[1] := lv1.Items[lv1.ItemIndex];
    if Assigned(LItem[1]) then
    try
      lv1.BeginUpdate;
      lv2.BeginUpdate;
      maquina := Copy(LItem[1].Text, 0, 3);
      adicionalv(lv2, LItem[1].text);
      lv1.Items.Delete(LItem[1].Index);
    finally
      if not Assigned(Form1.conf_Pdata) then
      begin
        Form1.conf_Pdata := TStringList.Create;
        Form1.conf_pdata.Sorted := true;
      end;
      Form1.conf_Pdata.Add(maquina);
      Form1.conf_Pdata.Sort;
      lv1.EndUpdate;
      lv2.EndUpdate;
    end;
  finally

  end;

end;

procedure TForm2.lv1MouseEnter(Sender: TObject);
begin
  p1.PlacementTarget := lv1;
  cltpnl1.CalloutPosition := TCalloutPosition(3);
  p1.Placement := TPlacement(2);
  lbl.Text := 'Máquinas de triagem disponíveis para obtenção dos Pdatas';
  p1.IsOpen := True;
end;

procedure TForm2.lv1MouseLeave(Sender: TObject);
begin
  p1.IsOpen := false;
  cltpnl1.CalloutPosition := TCalloutPosition(0);
  p1.Placement := TPlacement(5);
end;

procedure TForm2.lv2DblClick(Sender: TObject);
var
  index: Integer;
  maquina: string;
  LItem: array[1..2] of TListViewItem;
begin
  try
    LItem[1] := lv2.Items[lv2.ItemIndex];
    if Assigned(LItem[1]) then
    try
      lv1.BeginUpdate;
      lv2.BeginUpdate;
      maquina := Copy(LItem[1].Text, 0, 3);
      adicionalv(lv1, LItem[1].text);
      lv2.Items.Delete(LItem[1].Index);
    finally
      Form1.conf_Pdata.Find(maquina, index);
      Form1.conf_Pdata.Delete(index);
      lv1.EndUpdate;
      lv2.EndUpdate;
    end;
  finally

  end;

end;

procedure TForm2.lv2MouseEnter(Sender: TObject);
begin
  p1.PlacementTarget := lv2;
  cltpnl1.CalloutPosition := TCalloutPosition(3);
  p1.Placement := TPlacement(2);
  ;
  lbl.Text := 'Máquinas de triagem selecionadas para obtenção dos Pdatas';
  p1.IsOpen := True;
end;

procedure TForm2.lv2MouseLeave(Sender: TObject);
begin
  p1.IsOpen := False;
  cltpnl1.CalloutPosition := TCalloutPosition(0);
  p1.Placement := TPlacement(5);
end;

procedure TForm2.sld1MouseEnter(Sender: TObject);
begin
  p1.PlacementTarget := sld1;
  lbl.Text := 'Tipo de conexão.' + chr(13) + 'Deixe desligado caso esteja conectado via rede corporativa';
  p1.IsOpen := True;
end;

procedure TForm2.sld1StateChanged(Sender: TObject);
begin
  if (sld1.State = ssOn) then
  begin
    chkmail.IsChecked := False;
    chkmail.Enabled := False;
  end
  else if chkxls.IsChecked = true then
    chkmail.Enabled := True;
end;

procedure TForm2.adicionalv(lview: tlistview; conteudo: string);
var
  lista: TStringList;
  itemlist: TListViewItem;
  I: Integer;
begin
  lista := TStringList.Create;
  lista.sorted := True;
  lista.Add(conteudo);
  for I := 0 to lview.Items.Count - 1 do
  begin
    itemlist := lview.Items[I];
    lista.Add(itemlist.Text);
  end;
  lista.Sort;
  lview.items.Clear;
  lview.BeginUpdate;
  for I := 0 to lista.Count - 1 do
  begin
    itemlist := lview.Items.Add;
    itemlist.Text := lista[I];
  end;
  lview.EndUpdate;
  lista.Free;
end;

end.


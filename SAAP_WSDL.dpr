program SAAP_WSDL;

uses
  System.StartUpCopy,
  FMX.Forms,
  JclAppInst,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas' {Form4},
  Rastro1 in 'Rastro1.pas',
  Rastro2 in 'Rastro2.pas',
  Unit5 in 'Unit5.pas' {Form5};

{$R *.res}

begin
  JclAppInstances.CheckSingleInstance;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm5, Form5);
  Application.Run;

end.

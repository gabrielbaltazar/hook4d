program SampleRestClient;

uses
  Vcl.Forms,
  FSampleRestClient in 'FSampleRestClient.pas' {Form1},
  Hook4D.Interfaces in '..\..\Source\Hook4D.Interfaces.pas',
  Hook4D.RestClient in '..\..\Source\Hook4D.RestClient.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

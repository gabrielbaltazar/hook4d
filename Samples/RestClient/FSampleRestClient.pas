unit FSampleRestClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Hook4D.Interfaces;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtUrl: TEdit;
    btnSend: TButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    mmoSuccess: TMemo;
    mmoError: TMemo;
    procedure btnSendClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure OnSuccess(Hook: IHook4D);
    procedure OnError(Hook: IHook4D);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnSendClick(Sender: TObject);
var
  hook: IHook4D;
begin
  hook := NewHook4D;
  hook
    .Url(edtUrl.Text)
    .OnHookSuccess(OnSuccess)
    .OnHookError(OnError)
    .Send;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

procedure TForm1.OnError(Hook: IHook4D);
begin
  mmoError.Lines.Clear;
  mmoSuccess.Lines.Clear;

  mmoError.Lines.Add('Status: ' + Hook.StatusCode.ToString);
  mmoError.Lines.Add('Url: ' + Hook.Url);
  mmoError.Lines.Add('Request: ' + Hook.Body);
  mmoError.Lines.Add('Response: ' + Hook.Content);
end;

procedure TForm1.OnSuccess(Hook: IHook4D);
begin
  mmoError.Lines.Clear;
  mmoSuccess.Lines.Clear;

  mmoSuccess.Lines.Add('Status: ' + Hook.StatusCode.ToString);
  mmoSuccess.Lines.Add('Url: ' + Hook.Url);
  mmoSuccess.Lines.Add('Request: ' + Hook.Body);
  mmoSuccess.Lines.Add('Response: ' + Hook.Content);
end;

end.

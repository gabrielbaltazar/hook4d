unit Hook4D.RestClient;

interface

uses
  Hook4D.Interfaces,
  REST.Client,
  REST.Types,
  IPPeerCommon,
  IPPeerAPI,
  IPPeerClient,
  System.SysUtils;

type THook4DRestClient = class(TInterfacedObject, IHook4D)

  private
    FUrl: String;
    FBody: string;
    FContentType: string;
    FStatusCode: Integer;
    FContent: String;
    FOnHookSucess: TOnHookResponse;
    FOnHookError: TOnHookResponse;
    FRestClient: TRESTClient;
    FRestRequest: TRESTRequest;
    FRestResponse: TRESTResponse;

    procedure PrepareRequest;
    procedure PrepareRequestCreateComponents;
    function OnHookError(Value: TOnHookResponse): IHook4D;
    function OnHookSuccess(Value: TOnHookResponse): IHook4D;

  protected
    function Url(Value: String): IHook4D; overload;
    function Body(Value: String): IHook4D; overload;

    function Url: String; overload;
    function Body: String; overload;
    function StatusCode: Integer;
    function Content: string;

    function Send: IHook4D;

  public
    constructor create;
    class function New: IHook4D;
    destructor Destroy; override;

end;

implementation

{ THook4DRestClient }

function THook4DRestClient.Body(Value: String): IHook4D;
begin
  result := Self;
  FBody := Value;
end;

function THook4DRestClient.Body: String;
begin
  result := FBody;
end;

function THook4DRestClient.Content: string;
begin
  result := FContent;
end;

constructor THook4DRestClient.create;
begin
  FContentType := 'application/json';
end;

destructor THook4DRestClient.Destroy;
begin
  FreeAndNil(FRestResponse);
  FreeAndNil(FRestRequest);
  FreeAndNil(FRestClient);
  inherited;
end;

class function THook4DRestClient.New: IHook4D;
begin
  result := Self.Create;
end;

function THook4DRestClient.OnHookError(Value: TOnHookResponse): IHook4D;
begin
  result := Self;
  FOnHookError := Value;
end;

function THook4DRestClient.OnHookSuccess(Value: TOnHookResponse): IHook4D;
begin
  result := Self;
  FOnHookSucess := Value;
end;

procedure THook4DRestClient.PrepareRequest;
begin
  PrepareRequestCreateComponents;

  FStatusCode := 0;
  FContent := EmptyStr;
  FRestClient.BaseURL := FUrl;
  FRestRequest.AddBody(FBody, ctAPPLICATION_JSON);
end;

procedure THook4DRestClient.PrepareRequestCreateComponents;
begin
  FreeAndNil(FRestResponse);
  FreeAndNil(FRestRequest);
  FreeAndNil(FRestClient);

  FRestResponse := TRESTResponse.Create(nil);
  FRestClient := TRESTClient.Create(nil);
  FRestClient.SynchronizedEvents := False;
  FRestClient.RaiseExceptionOn500 := False;
  FRestClient.ContentType := FContentType;
  FRestClient.Accept := FContentType;

  FRestRequest := TRESTRequest.Create(nil);
  FRestRequest.SynchronizedEvents := False;
  FRestRequest.Method := rmPOST;

  FRestRequest.Client := FRestClient;
  FRestRequest.Response := FRestResponse;
end;

function THook4DRestClient.Send: IHook4D;
begin
  result := Self;
  PrepareRequest;
  try
    FRestRequest.Execute;
    FStatusCode := FRestResponse.StatusCode;
    FContent := FRestResponse.Content;

    if FRestResponse.StatusCode < 400 then
      if Assigned(FOnHookSucess) then
        FOnHookSucess(Self);

    if FRestResponse.StatusCode >= 400 then
      if Assigned(FOnHookError) then
        FOnHookError(Self);
  except
    on E : Exception do
    begin
      FStatusCode := 500;
      FContent := e.Message;
        FOnHookError(Self);
    end;
  end;
end;

function THook4DRestClient.StatusCode: Integer;
begin
  result := FStatusCode;
end;

function THook4DRestClient.Url: String;
begin
  result := FUrl;
end;

function THook4DRestClient.Url(Value: String): IHook4D;
begin
  result := Self;
  FUrl := Value;
end;

end.

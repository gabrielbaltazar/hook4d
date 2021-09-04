unit Hook4D.Interfaces;

interface

type
  IHook4D = interface;
  
  TOnHookResponse = reference to procedure (Hook: IHook4D);

  IHook4D = interface
    ['{6DA64204-626D-4B36-9ACB-0305C7B6F1C4}']
    function Url(Value: String): IHook4D; overload;
    function Body(Value: String): IHook4D; overload;

    function Url: String; overload;
    function Body: String; overload;
    function StatusCode: Integer;
    function Content: string;    
    
    function Send: IHook4D;

    function OnHookSuccess(Value: TOnHookResponse): IHook4D;
    function OnHookError(Value: TOnHookResponse): IHook4D;
  end;

function NewHook4D: IHook4D;

implementation

uses
  Hook4D.RestClient;

function NewHook4D: IHook4D;
begin
  result := THook4DRestClient.New;
end;

end.

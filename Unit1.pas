unit Unit1;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdComponent, IdHashMessageDigest, OleCtrls, SHDocVw, DateUtils;

type
  TForm1 = class(TForm)
    WebBrowser1: TWebBrowser;
    Button2: TButton;
    Label9: TLabel;
    Label10: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    Memo1: TMemo;
  procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  stroka2,stroka3, sig :string;


implementation

{$R *.dfm}


 procedure MyDelay(iMilliseconds : Integer);
begin
iMilliseconds := MilliSecondOfTheDay(Time) + iMilliseconds;

while iMilliseconds > MilliSecondOfTheDay(Time) do
Application.ProcessMessages;
end;

 //Проходим авторизацию, предполагается что пользователь уже добавил приложение к
 // себе на страницу вконтакте.
procedure TForm1.Button2Click(Sender: TObject);
 var start:integer;
begin
WebBrowser1.Navigate('http://api.vkontakte.ru/oauth/authorize?client_id='+Edit1.Text+'&scope=friends&redirect_uri=http://api.vk.com/blank.html&display=popup&response_type=token');
MyDelay(1000);
stroka2:=WebBrowser1.LocationURL;
Delete(stroka2, Pos('&',stroka2), 5900);
start:=Pos('access_token=',stroka2);
stroka2:=Copy(stroka2, start3+13, 500);
MyDelay(2000);
Memo1.Text:=stroka2;
WebBrowser1.Navigate('http://api.vkontakte.ru/method/friends.get?&access_token='+stroka2);
Memo1.Text:= stroka2;
end;

end.

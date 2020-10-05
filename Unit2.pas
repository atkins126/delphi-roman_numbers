unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var s: string;
i: integer;
function Arab2Roman(arab:integer):string;
var
  i:integer;
  d:integer;
  arab_str:string;
  arab_len:integer;
begin
  Result := '';
  arab_str := IntToStr(arab);
  arab_len := Length(arab_str);
  for i := 0 to arab_len-1 do begin
    d := StrToInt(String(arab_str[arab_len-i]));
    if (d+1) mod 5 = 0 then
      Result := Copy('IXCM', 1+i, 1) + Copy('VXLCDM', i*2 + (d+1) div 5, 1) + Result
    else
      Result := Copy('VLD', 1+i, d div 5) + Copy('IIIXXXCCCMMM', 1+i*3, d mod 5) + Result;
  end;
end;

begin
 s:= Edit1.Text;
 i:=StrtoInt(s);
 Memo1.Lines.Add(Arab2Roman(i));
end;

end.

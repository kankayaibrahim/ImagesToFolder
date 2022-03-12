unit uImageToFolder;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Windows;

type

  { TFrmMain }

  TFrmMain = class(TForm)
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.lfm}

{ TFrmMain }

procedure TFrmMain.FormCreate(Sender: TObject);
var
  i: integer;
  FolderName: string;
begin

  if ParamCount = 0 then
  begin
    Application.Terminate;
  end;

  if ParamCount > 0 then
  begin

    FolderName := InputBox('Klasor Adını Giriniz', 'Klasor Adı', '');
    if FolderName = '' then
    begin
      Application.MessageBox('Klasör Adı Girişi yapmadınız', 'Hata', MB_ICONSTOP);
      Halt;
    end
    else if DirectoryExists(ExtractFilePath(Application.Params[1]) + FolderName) then
    begin
      Application.MessageBox('Bu Klasör zaten var', 'Hata', MB_ICONSTOP);
      Halt;
    end
    else
    begin
      ForceDirectories(ExtractFilePath(Application.Params[1]) + FolderName);
    end;

  end;

  for i := 1 to ParamCount do
  begin
    MoveFileW(pwidechar(UTF8Decode(Application.Params[i])),
      pwidechar(UTF8Decode(ExtractFilePath(Application.Params[i])) +
      UTF8Decode(FolderName + '\' + FolderName + '-' + i.ToString) + '.jpg'));
    Application.Terminate;
  end;
end;

end.

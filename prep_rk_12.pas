unit prep_rk_12;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    GroupBox2: TGroupBox;
    ListBox1: TListBox;
    Pass: TEdit;
    ProdType: TEdit;
    CountProd: TEdit;
    CashProd: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure GroupBox2Click(Sender: TObject);
    procedure ProdTypeChange(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
type
  product = record
    typ : string[30];
    cont : integer;
    cash : real;
  end;

procedure TForm1.GroupBox1Click(Sender: TObject);
begin

end;

procedure TForm1.ProdTypeChange(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  f: file of product;
  prod:product;
begin
  if (Pass.text = '') then
     MessageDlg('Вы не ввели путь к файлу!', mtError, mbOKCancel, 0)
  else if (ProdType.text = '') then
     MessageDlg('Вы не ввели тип продукта!', mtError, mbOKCancel, 0)
  else if (CountProd.text = '') then
     MessageDlg('Вы не ввели кол-во продукта!', mtError, mbOKCancel, 0)
  else if (CashProd.text = '') then
     MessageDlg('Вы не ввели цену продукта!', mtError, mbOKCancel, 0)
  else
    assignfile(f, pass.text);
    if (FileExists(Pass.text)) then
    begin
      reset (f);
      seek (f, filesize(f));
    end
    else
      rewrite (f);

    prod.typ := ProdType.text;
    prod.cont := StrToInt(CountProd.text);
    prod.cash := StrToInt(CashProd.text);

    write(f, prod);
    MessageDlg('Успешная запись!', mtCustom, mbOKCancel, 0);
    ProdType.Clear;
    CountProd.Clear;
    CashProd.Clear;
    closefile(f)
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  f:file of product;
  prod:product;
begin
  ListBox1.items.clear;
  AssignFile(f,Pass.text);
  if not (fileexists(Pass.text)) then
  begin
    messagedlg('Файла нет!', mterror, mbokcancel, 0);
    exit;
  end;
  reset(f);
  while (not EOF(f)) do
  begin
    read(f, prod);
    listbox1.items.add(prod.typ+ ' ' + inttostr(prod.cont) + ' ' + 'шт ' + floattostr(prod.cash) + ' рублей');
  end;
  closefile(f);
end;

procedure TForm1.GroupBox2Click(Sender: TObject);
begin

end;

end.


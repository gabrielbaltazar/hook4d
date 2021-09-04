object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Form1'
  ClientHeight = 309
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 645
    Height = 73
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 635
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 19
      Height = 13
      Caption = 'URL'
    end
    object edtUrl: TEdit
      Left = 24
      Top = 35
      Width = 385
      Height = 21
      TabOrder = 0
      Text = 'https://webhook.site/65156b52-24a6-49f0-9fda-d1c169cbd86f'
    end
    object btnSend: TButton
      Left = 415
      Top = 33
      Width = 75
      Height = 25
      Caption = 'Send'
      TabOrder = 1
      OnClick = btnSendClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 73
    Width = 340
    Height = 236
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 305
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 338
      Height = 24
      Align = alTop
      Caption = 'On Success'
      TabOrder = 0
      ExplicitWidth = 303
    end
    object mmoSuccess: TMemo
      Left = 1
      Top = 25
      Width = 338
      Height = 210
      Align = alClient
      TabOrder = 1
      ExplicitLeft = 80
      ExplicitTop = 72
      ExplicitWidth = 185
      ExplicitHeight = 89
    end
  end
  object Panel4: TPanel
    Left = 340
    Top = 73
    Width = 305
    Height = 236
    Align = alRight
    TabOrder = 2
    ExplicitLeft = 8
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 303
      Height = 24
      Align = alTop
      Caption = 'On Error'
      TabOrder = 0
    end
    object mmoError: TMemo
      Left = 1
      Top = 25
      Width = 303
      Height = 210
      Align = alClient
      TabOrder = 1
      ExplicitLeft = 2
      ExplicitTop = 26
    end
  end
end

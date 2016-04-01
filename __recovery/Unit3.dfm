object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 351
  ClientWidth = 491
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mmo1: TMemo
    Left = 0
    Top = 0
    Width = 491
    Height = 301
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object btn1: TButton
    Left = 0
    Top = 326
    Width = 491
    Height = 25
    Align = alBottom
    Caption = 'btn1'
    TabOrder = 1
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 0
    Top = 301
    Width = 491
    Height = 25
    Align = alBottom
    Caption = 'Inicia Thread'
    TabOrder = 2
    OnClick = btn2Click
  end
  object thread4: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnRun = thread1Run
    Left = 168
    Top = 16
  end
  object thread1: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnRun = thread1Run
    Left = 24
    Top = 16
  end
  object thread2: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnRun = thread1Run
    Left = 72
    Top = 16
  end
  object thread3: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnRun = thread1Run
    Left = 120
    Top = 16
  end
  object thread5: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnRun = thread1Run
    Left = 216
    Top = 16
  end
  object thread6: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnRun = thread1Run
    Left = 264
    Top = 16
  end
  object thread7: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnRun = thread1Run
    Left = 304
    Top = 16
  end
  object thread8: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnRun = thread1Run
    Left = 352
    Top = 16
  end
  object thread9: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnRun = thread1Run
    Left = 400
    Top = 16
  end
  object thread10: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnRun = thread1Run
    Left = 448
    Top = 16
  end
  object thread11: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnRun = thread1Run
    Left = 24
    Top = 72
  end
  object thread12: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnRun = thread1Run
    Left = 72
    Top = 72
  end
  object thread13: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnRun = thread1Run
    Left = 120
    Top = 72
  end
  object thread14: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnRun = thread1Run
    Left = 168
    Top = 72
  end
  object thread15: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnRun = thread1Run
    Left = 216
    Top = 72
  end
  object thread16: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnRun = thread1Run
    Left = 264
    Top = 72
  end
  object thread17: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnRun = thread1Run
    Left = 304
    Top = 72
  end
  object thread18: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnRun = thread1Run
    Left = 352
    Top = 72
  end
  object thread19: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnRun = thread1Run
    Left = 400
    Top = 72
  end
  object thread20: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnRun = thread1Run
    Left = 448
    Top = 72
  end
  object tmr1: TTimer
    Enabled = False
    OnTimer = tmr1Timer
    Left = 240
    Top = 184
  end
end

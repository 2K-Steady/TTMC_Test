﻿
Gui, Add, Text, x180 y5 w200 h20, TTMC Test ver.180522		; 프로그램 제목
Gui, Add, Text, x380 y260 w130 h15, Made by: KinKan_Lab		; --

Gui, Add, Picture ,x20 y26 w150 h150, %A_ScriptDir%\TTMC_Icon.ico
Gui, Add, ListView, x180 y25 w330 h150 Grid SortDesc hwndid, 시간 | 내용  	;디버깅용 Log ListView
Lv_modifyCol(1,130)
Lv_modifycol(2,196)
Gui, Add, Text, x30 y190 w150 h20 vA, Ready!!		 	; 현재 상태를 표시할 텍스트
Gui, Add, Text, x30 y210 w150 h20 vB, MacroCount: 0 회	; 스테이지 클리어 횟수를 표시할 텍스트
Gui, Add, Button, x180 y180 w110 h20, SoloStart			; 솔로 스타트 버튼
Gui, Add, Text, x300 y185 w50 h20, 횟수: 
Gui, Add, Edit, x335 y180 w30 h20 vRepeatCount, 0		; 반복 횟수 설정
;Gui, Add, Edit, x520 y25 w100 h20 vInputNumber, 0 ; 시리얼 넘버 입력칸
;Gui, Add, Button, x570 y50 w50 h20, Login

Gui, Add, Checkbox, x400 y180 w110 h20 vCheckLevel, LevelMAX 무시	; 솔로 카운트 제어 

Gui, Add, Button, x180 y200 w110 h20, RankStart			; 랭크 스타트 버튼

Gui, Add, Button, x300 y220 w110 h20, 캐릭터판매			; 캐릭터 판매 기능 
Gui, Add, Button, x180 y220 w110 h20, 정지_F4			; 정지 버튼
Gui, Add, Button, x180 y240 w110 h20, 종료				; 프로그램 종료 버튼
Gui, Add, Text, x30 y260 w200 h15 vD, 현재상태: None  	; 현재 상태 확인

Gui, Add, Button, x50 y5 w100 h20, DoNotPress 			;임의기능 테스트 버튼 
Gui, Show

global soloStart := false
global isPlaying := false
global rankStart := false

global 클리어횟수 := 0
global timeLine
global CheckLevel
global RepeatCount := 0

global sellStart := false

global currentTime
global pastTime
global testTime := A_TickCount							;마우스 클릭 마지막 틱 저장변수

global programStop := false								;매크로 프로그램 동작여부 체크 
global blueStackPower := true							;블루스택 프로그램 OnOff 체크 

global SerialCheck := false

return

SoloPlay()
{	
		
		;===============메인화면===============;
		ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *120 %A_ScriptDir%\SoloPlayImage\0_SoloNoneSelect.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
		{
			;ImageSearch 함수에서 FoundX, FoundY좌표를 받아서 Send함수로 보내줌;
			Send {Click %FoundX% %FoundY%}
			testTime := A_TickCount
			timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
			Lv_Add("",timeLine,"Soloplay 버튼을 찾고있습니다..")
			
			Sleep, 1000		
			
			Gui,Submit,NoHide
			;GuiControl, , logBox, Soloplay버튼 찾는중
			GuiControl, , D, Soloplay 버튼을 찾고있습니다..
			
		}
		
		;===============솔로 플레이 시작===============;
		ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *50 %A_ScriptDir%\SoloPlayImage\1_SoloPlay.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
		{
			Send {Click %FoundX% %FoundY%}
			testTime := A_TickCount
			timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
			Lv_Add("",timeLine,"Soloplay 버튼을 클릭..")
			
			Sleep, 1000		
			Gui,Submit,NoHide
			;GuiControl, , logBox, Soloplay진입
			GuiControl, , D, 정렬 버튼을 찾고있습니다..
			
		}
		
		;===============정렬 종류 버튼===============;
		ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *50 %A_ScriptDir%\SoloPlayImage\2_1_SortDefault.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
		{
			Send {Click %FoundX% %FoundY%}
			testTime := A_TickCount
			timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
			Lv_Add("",timeLine,"정렬 버튼을 클릭..")
			
			Sleep, 1000		
			Gui,Submit,NoHide
			;GuiControl, , logBox, 정렬버튼 누름
			GuiControl, , D, 정렬 종류를 변경중..
			
			;===============이름 순 정렬 버튼===============;
			ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *50 %A_ScriptDir%\SoloPlayImage\2_2_SortName.bmp
			if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
			{
				Send {Click %FoundX% %FoundY%}
				testTime := A_TickCount
				timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
				Lv_Add("",timeLine,"곡이름을 기준으로 재정렬")
			
				Sleep, 1000		
				Gui,Submit,NoHide
				;GuiControl, , logBox, 곡 이름 누름
				GuiControl, , D, 유온미 앨범커버 찾는중..

			}
			
		}
		
		ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *50 %A_ScriptDir%\SoloPlayImage\2_1_SortHistory.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
		{
			Send {Click %FoundX% %FoundY%}
			testTime := A_TickCount
			timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
			Lv_Add("",timeLine,"정렬 버튼을 클릭..")
			
			Sleep, 1000		
			Gui,Submit,NoHide
			;GuiControl, , logBox, 정렬버튼 누름
			GuiControl, , D, 정렬 종류를 변경중..
			
			;===============이름 순 정렬 버튼===============;
			ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *50 %A_ScriptDir%\SoloPlayImage\2_2_SortName.bmp
			if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
			{
				Send {Click %FoundX% %FoundY%}
				testTime := A_TickCount
				timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
				Lv_Add("",timeLine,"곡이름을 기준으로 재정렬")
				
				Sleep, 1000		
				Gui,Submit,NoHide
				;GuiControl, , logBox, 곡 이름 누름
				GuiControl, , D, 유온미 앨범커버 찾는중..		

			}
			
		}
		
		ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *50 %A_ScriptDir%\SoloPlayImage\2_1_SortMission.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
		{
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000
			testTime := A_TickCount
			timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
			Lv_Add("",timeLine,"정렬 버튼을 클릭..")
			
			Gui,Submit,NoHide
			;GuiControl, , logBox, 정렬버튼 누름
			GuiControl, , D, 정렬 종류를 변경중..
			
			;===============이름 순 정렬 버튼===============;
			ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *50 %A_ScriptDir%\SoloPlayImage\2_2_SortName.bmp
			if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
			{
				Send {Click %FoundX% %FoundY%}
				testTime := A_TickCount
				timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
				Lv_Add("",timeLine,"곡이름을 기준으로 재정렬")
				
				Sleep, 1000		
				Gui,Submit,NoHide
				;GuiControl, , logBox, 곡 이름 누름
				GuiControl, , D, 유온미 앨범커버 찾는중..
				
			}
			
		}
		
		
		
		
		;===============정렬 순서 버튼===============;
		ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *50 %A_ScriptDir%\SoloPlayImage\2_3_SortBy.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
		{
			Send {Click %FoundX% %FoundY%}
			testTime := A_TickCount
			timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
			Lv_Add("",timeLine,"정렬 순서 변경")
			
			Sleep, 1000		
			Gui,Submit,NoHide
			;GuiControl, , logBox, 정렬순서 버튼 누름
			GuiControl, , D, 유온미 앨범커버 찾는중..
			
		}
		
		;===============앨범 이미지 클릭===============;
		ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *100 %A_ScriptDir%\SoloPlayImage\Album_Test.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
		{
			Send {Click %FoundX% %FoundY%}
			testTime := A_TickCount
			timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
			Lv_Add("",timeLine,"유온미 노래 확인")
			
			Sleep, 1000		
			Gui,Submit,NoHide
			;GuiControl, , logBox, 앨범커버 누름
			GuiControl, , D, 게임 난이도를 선택중..
			
		}
		
		;===============노래 난이도 선택===============;
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *70 %A_ScriptDir%\SoloPlayImage\3_RankSelect.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
		{
			Send {Click %FoundX% %FoundY%}
			testTime := A_TickCount
			timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
			Lv_Add("",timeLine,"Easy 난이도 설정")
			
			Gui,Submit,NoHide
			;GuiControl, , logBox, 게임레벨 누름
			GuiControl, , D, Next버튼 찾는중..
			Sleep, 2000	
			

		}
		
		;===============Next 버튼===============;
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\4_Next.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
		{
			Send {Click %FoundX% %FoundY%}
			testTime := A_TickCount
			timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
			Lv_Add("",timeLine,"Next 클릭")
			
			Sleep, 1000		
			Gui,Submit,NoHide
			;GuiControl, , logBox, Next버튼 누름
			GuiControl, , D, AutoPlay 찾는중..
			
		}
		
		;===============오토 플레이 선택===============;
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\5_AutoPlay.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
		{
			Send {Click %FoundX% %FoundY%}
			testTime := A_TickCount
			timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
			Lv_Add("",timeLine,"오토 플레이 설정")
			
			Sleep, 1000		
			Gui,Submit,NoHide
			;GuiControl, , logBox, AutoPlay 누름
			GuiControl, , D, 노래 시작 찾는중..
			
		}
		
		;===============노래 시작===============;
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\6_Start.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
		{
			Send {Click %FoundX% %FoundY%}
			testTime := A_TickCount
			timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
			Lv_Add("",timeLine,"노래 시작")
			
			Sleep, 1000		
			클리어횟수 := 클리어횟수 + 1
			Gui,Submit,nohide
			;GuiControl, , logBox, Start버튼 누름
			GuiControl, , D, 노래가 진행중입니다..
			GuiControl, , B, MacroCount: %클리어횟수% 회
			isPlaying := true
			
		}
		
		;==================멤버 초과시=================;
		InvenFull()
		
		;===============플레이 보상 클릭===============;
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\7_StageEnd1.bmp
		if ((ErrorLevel = 0) && (soloStart = true))
		{
			Sleep, 2000 ;화면전환간 터치가 안먹히는 문제를 해결하기 위해 쿨타임 추가 
			Send {Click %FoundX% %FoundY%}
			
			timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
			Lv_Add("",timeLine,"플레이 보상 클릭")
			
			Sleep, 1000		
			Gui,Submit,NoHide
			;GuiControl, , logBox, 플레이보상 누름
			GuiControl, , D, 노래종료 시퀀스_1
			isPlaying := false
			
		}
		
		;===============SCORE 클릭===============;
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\8_StageEnd2.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
		{
			Send {Click %FoundX% %FoundY%}
			testTime := A_TickCount
			timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
			Lv_Add("",timeLine,"Score 클릭")
			
			Sleep, 4000		
			Gui,Submit,NoHide
			;GuiControl, , logBox, 스코어 누름
			GuiControl, , D, 노래종료 시퀀스_2
			
		}
		
		;===============EXP 부분 클릭 (모든 캐릭 만렙)===============;
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *100 %A_ScriptDir%\SoloPlayImage\MaxLevel.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false) && (CheckLevel = 0))
		{
			Sleep, 1000		
			
			timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
			Lv_Add("",timeLine,"모든 캐릭터가 MaxLevel 입니다")
			
			Gui,Submit,NoHide
			;GuiControl, , logBox, 모든 캐릭 만렙 확인
			GuiControl, , A, 매크로 정지
			GuiControl, , D, 노래종료 시퀀스_3
			msgbox, 0, 안내, 모든 캐릭터 레벨이 MAX입니다.,
			soloStart := false

		}
		else
		{
			;===============EXP 부분 클릭===============;
			ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\9_StageEnd3.bmp
			if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
			{
				Send {Click %FoundX% %FoundY%}
				testTime := A_TickCount
				timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
				Lv_Add("",timeLine,"EXP 확인 단계 ")
				
				Sleep, 1000		
				Gui,Submit,NoHide
				;GuiControl, , logBox, producer 누름
				GuiControl, , D, 노래종료 시퀀스_3
			}
			
		}
		
		;==================Mission Clear=================;
		MissionClear()
		
		;===============스테이지 재시작 클릭===============;
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\10_StageRestart.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
		{
			Send {Click %FoundX% %FoundY%}
			testTime := A_TickCount
			timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
			Lv_Add("",timeLine,"스테이지를 재시작 합니다.")
			
			Sleep, 1000		;ms 단위 시간
			클리어횟수 := 클리어횟수 + 1
			Gui,Submit,nohide
			GuiControl, , D, 노래를 재시작합니다.
			GuiControl, , B, MacroCount: %클리어횟수% 회
			isPlaying := true
			
		}
		
		;===============스테미나 부족 시===============;
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\11_SteminaEnd.bmp
		if ((ErrorLevel = 0) && (soloStart = true))
		{
			Sleep, 1000
			
			timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
			Lv_Add("",timeLine,"스테미너 부족, 매크로 정지")
			
			soloStart := false
			isPlaying := false
			GuiControl, , D, -매크로 정지-
			msgbox, 0, 안내, 스테미너가 부족합니다. 매크로가 자동 정지됩니다.,
			
			
		}

}

;=============================================================================
;==============================버튼 부분=======================================
;=============================================================================

ButtonSoloStart:
{
	;if(SerialCheck = false)
	;{
	;	msgbox, 0, 안내, 해당 기능을 사용할 수 없습니다,
	;	ExitApp
	;}


	Gui,Submit,NoHide
	GuiControl, , A, 솔로 매크로 동작중
	GuiControl, , D, Start버튼눌림

	
	timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
	Lv_Add("",timeLine,"솔로 매크로 시작")
	
	soloStart := true
	
	if(RepeatCount = 0)
	{
		Loop
		{
			;===============매크로 정지===============;
			if(soloStart = false)
			{
				break
			}
			
			SoloPlay()
			
			if(soloStart = true)
			{
				CheckTime()
			}
			while(programStop = true && blueStackPower = true)
			{
				BlueStackOff()
			}
			while(programStop = false && blueStackPower = false)
			{
				BlueStackOn()
			}
		}
	}
	else if(RepeatCount > 0)
	{
		while(RepeatCount > 클리어횟수)
		{
			;===============버튼 강제 정지============;
			if(soloStart = false)
			{
				break
			}
			;========================================
				
			SoloPlay()
			
			if(soloStart = true)
			{
				CheckTime()
			}
		}
		
		if(RepeatCount = 클리어횟수)
		{
			soloStart := false
			Gui,Submit,NoHide
			GuiControl, , A, 정지
			GuiControl, , D, 현재상태: 정지
			timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
			Lv_Add("",timeLine,"지정횟수 달성, 매크로 정지")
			msgbox, 0, 안내, 지정된 횟수에 도달했습니다. 매크로 정지.,
		}
	}
}
return

ButtonLogin:
{
	global InputNumber := 30
	
	InputSerialNumber := InputNumber
	
	if(InputSerialNumber <= 0)
	{
		msgbox, 0, 안내, 시리얼 넘버를 정확히 입력해주세요.,
		;return
	}
	CheckSerialNumber(InputSerialNumber)
}
return

ButtonRankStart:
{
	Gui,Submit,NoHide
	GuiControl, , A, 랭크 매크로 동작중
	GuiControl, , D, RankStart버튼눌림

	
	timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
	Lv_Add("",timeLine,"랭크 매크로 시작")
	
	rankStart := true
	
	while(rankStart = true)
	{
		
	} ;while(rankStart)
}
return

Button캐릭터판매:
{
	msgbox, 48, 고멘나사이, ※공사중※,
	;sellStart:= true
	
	;SellCharacter()
}
return

Button정지_F4:
{
	MacroStop()
}
return

Button종료:
{	
	soloStart := false
	sellStart := false
	매크로시작 := false
	ExitApp
	
}
return

ButtonDoNotPress:
{
	BlueStackOn()
	;TestOn()
}
return

GuiClose:
ExitApp

;=============================================================================
;=============================================================================
;=============================================================================


;================키보드 단축키================;

F4::
{
	MacroStop()
}
return

;============================================;

RankPlay()
{
	
}

SellCharacter()
{
	timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
	Lv_Add("",timeLine,"캐릭터 판매 기능 시작")
	Gui,Submit,NoHide
	GuiControl, , A, 캐릭터 판매 시퀀스 작동
	
	Loop
	{
		if(sellStart = false)
			break
		
		SellMain()
		SellStartRoom()
		SellInventory()
		SellInventorySort()
		SellFire()
		SellFindCharacter()
				
	}
	
}

SellMain()
{ 
	;===============메인화면 ManageMent 클릭===============;
	ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *100 %A_ScriptDir%\SellImage\1_Main_ManageMent.bmp
	if ((ErrorLevel = 0) && (sellStart = true))
	{
		Send {Click %FoundX% %FoundY%}
		
		timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
		Lv_Add("",timeLine,"ManageMent 버튼 클릭")
		Gui,Submit,NoHide
		GuiControl, , D, ManageMent 버튼 클릭 
		
		Sleep, 1000		;ms 단위 시간
	}
	
}

SellStartRoom()
{
	;===============메인화면 Star Room 클릭===============;
	ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *50 %A_ScriptDir%\SellImage\2.Main_StarRoom.bmp
	if ((ErrorLevel = 0) && (sellStart = true))
	{
		Send {Click %FoundX% %FoundY%}
		
		timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
		Lv_Add("",timeLine,"StarRoom 버튼 클릭")
		Gui,Submit,NoHide
		GuiControl, , D, StarRoom 진입 
		
		Sleep, 1000		;ms 단위 시간
	}
}

SellInventory()
{
	;===============Inventory 클릭===============;
	ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *50 %A_ScriptDir%\SellImage\3.Inventory.bmp
	if ((ErrorLevel = 0) && (sellStart = true))
	{
		Send {Click %FoundX% %FoundY%}
		
		timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
		Lv_Add("",timeLine,"스타 목록 버튼 클릭")
		Gui,Submit,NoHide
		GuiControl, , D, 스타 목록 진입 
		
		Sleep, 1000		;ms 단위 시간
	}
}

SellInventorySort()
{
	;===============기본 정렬===============;
	ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *50 %A_ScriptDir%\SellImage\4.Sort_Default.bmp
	if ((ErrorLevel = 0) && (sellStart = true))
	{
		Send {Click %FoundX% %FoundY%}
		
		timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
		Lv_Add("",timeLine,"기본 정렬 클릭")
		Gui,Submit,NoHide
		GuiControl, , D, 기본 정렬 
		
		Sleep, 1000		;ms 단위 시간
	}
	
	;===============레벨 정렬===============;
	ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *50 %A_ScriptDir%\SellImage\5.Sort_Level.bmp
	if ((ErrorLevel = 0) && (sellStart = true))
	{
		Send {Click %FoundX% %FoundY%}
		
		timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
		Lv_Add("",timeLine,"레벨 정렬 클릭")
		Gui,Submit,NoHide
		GuiControl, , D, 레벨 정렬로 변경
		
		Sleep, 1000		;ms 단위 시간
	}
	
	;===============정렬 순서 변경===============;
	ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *50 %A_ScriptDir%\SellImage\6.Sort_Change.bmp
	if ((ErrorLevel = 0) && (sellStart = true))
	{
		Send {Click %FoundX% %FoundY%}
		
		timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
		Lv_Add("",timeLine,"정렬 순서 클릭")
		Gui,Submit,NoHide
		GuiControl, , D, 정렬 순서 변경 
		
		Sleep, 1000		;ms 단위 시간
	}
	
}

SellFire()
{
	;===============일괄 해고 버튼===============;
	ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *50 %A_ScriptDir%\SellImage\8_Fire.bmp
	if ((ErrorLevel = 0) && (sellStart = true))
	{
		Send {Click %FoundX% %FoundY%}
		
		timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
		Lv_Add("",timeLine,"댄서 캐릭 클릭")
		Gui,Submit,NoHide
		GuiControl, , D, 댄서 s1 Find
		
		Sleep, 1000		;ms 단위 시간
	}
}

SellFindCharacter()
{
	;===============댄서 캐릭 찾기===============;
	ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *100 %A_ScriptDir%\SellImage\dancer_s1.bmp
	if ((ErrorLevel = 0) && (sellStart = true))
	{
		Send {Click %FoundX% %FoundY%}
		
		timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
		Lv_Add("",timeLine,"댄서 캐릭 클릭")
		Gui,Submit,NoHide
		GuiControl, , D, 댄서 s1 Find
		
		Sleep, 1000		;ms 단위 시간
	}
}

InvenFull()
{
	;===============InvenFull===============;
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\6_2_InvenFull.bmp
	if ((ErrorLevel = 0) && (soloStart = true))
	{
		클리어횟수 := 클리어횟수 - 1
		MacroStop()
		timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
		Lv_Add("",timeLine,"스타목록Full로 인한 매크로 정지.")
		msgbox, 0, 매크로 정지 알림, 스타목록을 비워주세요 :),
	}
	
}

MissionClear()
{
	;===============MissionClear===============;
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\MissionClear.bmp
	if ((ErrorLevel = 0) && (soloStart = true))
	{
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\MissionClear_2.bmp
		if ((ErrorLevel = 0) && (soloStart = true))
		{
			Send {Click %FoundX% %FoundY%}
			testTime := A_TickCount
			
			timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
			Lv_Add("",timeLine,"미션 클리어 화면 체크 .")
			Gui,Submit,nohide
			GuiControl, , D, 노래종료 시퀀스_4
		}
	}
}

MacroStop()
{
	soloStart := false
	sellStart := false
	Gui,Submit,NoHide
	GuiControl, , A, 정지
	GuiControl, , D, 현재상태: 정지
	timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
	Lv_Add("",timeLine,"매크로 정지 시도")
	
}

CheckTime()
{
	currentTime := A_TickCount			;현재 시각 받아옴  ; TickCount -> 1/1000초  ex) 5초 == 5000
	pastTime := currentTime - testTime	; 마지막 시각으로 부터 지나간 시각 계산 
	
	if(pastTime >= 200000) ;200초  
	{
		Gui,Submit,NoHide
		MacroStop()
		timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
		Lv_Add("",timeLine,"프로그램 미 반응으로 인한 자동 정지.")
		msgbox, 0, 디버깅, 마지막 클릭으로 부터 %pastTime%/1000 초 경과,3
		testTime := A_TickCount
		
		programStop := true
	}
}

BlueStackOff()
{
	WinKill, BlueStacks
	Sleep, 1000
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\BlueStackOff\BlueStackOff.bmp
	if (ErrorLevel = 0)
	{
		timeLine := "[" A_YYYY "." A_MM "." A_DD ". " A_Hour ":" A_Min ":" A_Sec "]"
		Lv_Add("",timeLine,"에러로 인한 블루스택 종료시퀀스 진입.")
		msgbox, 0, 안내,프로그램 미 반응으로 인해 10초후 프로그램 재가동... ,10
		
		Send {Click %FoundX% %FoundY%}
		Sleep, 1000
		
		Gui,Submit,nohide
		GuiControl, , A, 정지
		GuiControl, , D, 블루스택 종료,
		
		programStop := false
		blueStackPower := false
		
		Sleep, 20000		;대략적인 프로그램 종료 시간 (평균 10~15초) 
	}
	
}

BlueStackOn()
{
	
	IfNotExist, BlueStacks
	{
		msgbox, 0,안내, 블루스택을 재실행합니다.,2
		Run,  %A_ScriptDir%\TapSonic_B.lnk
		Sleep, 60000
		blueStackPower := true
		
		Loop
		{
			ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\BlueStackOn\EventClose.bmp
			if (ErrorLevel = 0)
			{
				Send {Click %FoundX% %FoundY%}
				Sleep, 1000
				soloStart := true
				break
			}
		}
	}

}

TestOn()
{

	
}

BackGroundClick(posX, posY)
{
	msgbox, 0, ,%posX%  %posY%,2
	WinGetPos, w_x, w_y, w_w, w_h, BlueStacks
	
	innerX := posX
	innerY := posY
	
	lparam := innerX|innerY<<16
	PostMessage, 0x200, 0, %lparam%, ,BlueStacks
	PostMessage, 0x201, 1, %lparam%, ,BlueStacks
	PostMessage, 0x202, 0, %lparam%, ,BlueStacks
	Sleep, 1000
}

CheckSerialNumber(InputSerialNumber)
{
	msgbox, 0, , 입력숫자 %InputSerialNumber%,
	URLDownloadToFile, http://blogattach.naver.net/4edb52e2f7a3aa7659bedbe5d332483794c530d2cd/20180522_47_blogfile/koi1397_1526923726546_u69o35_txt/123912873.txt, SAVE.txt
	FileRead,text,SAVE.txt
	IfInString,text,%InputSerialNumber%
	{
		MsgBox, 0, ,시리얼넘버 확인 성공!,1
		SerialCheck = true
	}
	else
	{
		MsgBox, 0, ,등록되지 않은 유저입니다.,
		SerialCheck = false
	}
	
	
}
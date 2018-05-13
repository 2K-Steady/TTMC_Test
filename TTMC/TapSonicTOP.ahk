
Gui, Add, Text, x85 y5 w110 h20, TTMC Test ver.0.1	; 프로그램 제목
Gui, Add, ListBox, x12 y19 w240 h100 vlogBox,
Gui, Add, Text, x70 y120 w100 h20 vA, 준비!!		 	; 현재 상태를 표시할 텍스트
Gui, Add, Text, x70 y140 h20 w50 vB, 0 회			; 스테이지 클리어 횟수를 표시할 텍스트
Gui, Add, Button, x30 y160 w110 h20, SoloStart		; 솔로 스타트 버튼
Gui, Add, Button, x30 y180 w110 h20, RankStart		; 랭크 스타트 버튼
Gui, Add, Button, x30 y200 w110 h20, 정지_F4			; 정지 버튼 
Gui, Add, Button, x30 y220 w110 h20, 종료			; 프로그램 종료 버튼
Gui, Add, Text, x30 y260 w200 h20 vD, 현재상태  	; 현재 상태 확인
Gui, Show

매크로시작 := false
soloStart := false
isPlaying := false

return

ButtonSoloStart:
{
	Gui,Submit,NoHide
	GuiControl, , A, 솔로 동작중
	GuiControl, , D, Start버튼눌림 
	soloStart := true
	클리어횟수 := 0
	
	
	Loop
	{
		;===============메인화면===============;
		ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *50 %A_ScriptDir%\SoloPlayImage\0_SoloNoneSelect.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
		{
			;ImageSearch 함수에서 FoundX, FoundY좌표를 받아서 Send함수로 보내줌;
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		
			Gui,Submit,NoHide
			GuiControl, , logBox, Soloplay진입
			GuiControl, , D, Soloplay 버튼을 찾고있습니다..
		}
		
		;===============솔로 플레이 시작===============;
		ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *50 %A_ScriptDir%\SoloPlayImage\1_SoloPlay.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
		{
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		
			Gui,Submit,NoHide
			GuiControl, , logBox, Soloplay진입
			GuiControl, , D, 정렬 버튼을 찾고있습니다..
		}
		
		;===============정렬 종류 버튼===============;
		ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *50 %A_ScriptDir%\SoloPlayImage\2_1_SortDefault.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
		{
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		
			Gui,Submit,NoHide
			GuiControl, , logBox, 정렬버튼 누름
			GuiControl, , D, 정렬 종류를 변경중..
			
			;===============이름 순 정렬 버튼===============;
			ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *50 %A_ScriptDir%\SoloPlayImage\2_2_SortName.bmp
			if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
			{
				Send {Click %FoundX% %FoundY%}
				Sleep, 1000		
				Gui,Submit,NoHide
				GuiControl, , logBox, 곡 이름 누름
				GuiControl, , D, 유온미 앨범커버 찾는중..
			}
		}
		
		ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *50 %A_ScriptDir%\SoloPlayImage\2_1_SortHistory.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
		{
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		
			Gui,Submit,NoHide
			GuiControl, , logBox, 정렬버튼 누름
			GuiControl, , D, 정렬 종류를 변경중..
			
			;===============이름 순 정렬 버튼===============;
			ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *50 %A_ScriptDir%\SoloPlayImage\2_2_SortName.bmp
			if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
			{
				Send {Click %FoundX% %FoundY%}
				Sleep, 1000		
				Gui,Submit,NoHide
				GuiControl, , logBox, 곡 이름 누름
				GuiControl, , D, 유온미 앨범커버 찾는중..				
			}
		}
		
		ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *50 %A_ScriptDir%\SoloPlayImage\2_1_SortMission.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
		{
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		
			Gui,Submit,NoHide
			GuiControl, , logBox, 정렬버튼 누름
			GuiControl, , D, 정렬 종류를 변경중..
			
			;===============이름 순 정렬 버튼===============;
			ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *50 %A_ScriptDir%\SoloPlayImage\2_2_SortName.bmp
			if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
			{
				Send {Click %FoundX% %FoundY%}
				Sleep, 1000		
				Gui,Submit,NoHide
				GuiControl, , logBox, 곡 이름 누름
				GuiControl, , D, 유온미 앨범커버 찾는중..
			}
		}
		
		
		
		
		;===============정렬 순서 버튼===============;
		ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *50 %A_ScriptDir%\SoloPlayImage\2_3_SortBy.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
		{
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		
			Gui,Submit,NoHide
			GuiControl, , logBox, 정렬순서 버튼 누름
			GuiControl, , D, 유온미 앨범커버 찾는중..
		}
		
		;===============앨범 이미지 클릭===============;
		ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *100 %A_ScriptDir%\SoloPlayImage\Album_Test.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
		{
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		
			Gui,Submit,NoHide
			GuiControl, , logBox, 앨범커버 누름
			GuiControl, , D, 게임 난이도를 선택중..
		}
		
		;===============노래 난이도 선택===============;
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\3_RankSelect.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
		{
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		
			Gui,Submit,NoHide
			GuiControl, , logBox, 게임레벨 누름
			GuiControl, , D, Next버튼 찾는중..
		}
		
		;===============Next 버튼===============;
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\4_Next.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
		{
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		
			Gui,Submit,NoHide
			GuiControl, , logBox, Next버튼 누름
			GuiControl, , D, AutoPlay 찾는중..
		}
		
		;===============오토 플레이 선택===============;
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\5_AutoPlay.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
		{
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		
			Gui,Submit,NoHide
			GuiControl, , logBox, AutoPlay 누름
			GuiControl, , D, 노래 시작 찾는중..
		}
		
		;===============노래 시작===============;
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\6_Start.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
		{
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		
			클리어횟수 := 클리어횟수 + 1
			Gui,Submit,nohide
			GuiControl, , logBox, Start버튼 누름
			GuiControl, , D, 노래가 진행중입니다..
			GuiControl, , B, %클리어횟수% 회
			isPlaying := true
		}
		
		;===============플레이 보상 클릭===============;
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\7_StageEnd1.bmp
		if ((ErrorLevel = 0) && (soloStart = true))
		{
			Sleep, 3000
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		
			Gui,Submit,NoHide
			GuiControl, , logBox, 플레이보상 누름
			GuiControl, , D, 노래종료 시퀀스_1
			isPlaying := false
		}
		
		;===============SCORE 클릭===============;
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\8_StageEnd2.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
		{
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		
			Gui,Submit,NoHide
			GuiControl, , logBox, 스코어 누름
			GuiControl, , D, 노래종료 시퀀스_2
		}
		
		;===============EXP 부분 클릭===============;
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\9_StageEnd3.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
		{
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		
			Gui,Submit,NoHide
			GuiControl, , logBox, producer 누름
			GuiControl, , D, 노래종료 시퀀스_3
		}
		
		;===============스테이지 재시작 클릭===============;
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\10_StageRestart.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (isPlaying = false))
		{
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		;ms 단위 시간
			클리어횟수 := 클리어횟수 + 1
			Gui,Submit,nohide
			GuiControl, , logBox, Restart 누름
			GuiControl, , D, 노래를 재시작합니다.
			GuiControl, , B, %클리어횟수% 회
			isPlaying := true
		}
		
		;===============스테미나 부족 시===============;
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\11_SteminaEnd.bmp
		if ((ErrorLevel = 0) && (soloStart = true))
		{
			Sleep, 2000
			;스테미나 부족 화면 노출 시 취소 버튼 클릭 
				ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\11_2_SteminaCancel.bmp
				if ((ErrorLevel = 0) && (soloStart = true))
				{
					Send {Click %FoundX% %FoundY%}
					Sleep, 1000		;ms 단위 시간
					soloStart := false
					isPlaying := false
					msgbox, 0, 안내, 스테미너가 부족합니다. 매크로가 자동 정지됩니다.,
				}
		}
		
		
		
		
		if(soloStart = false)
		{
			break
		}
	}
}
return


ButtonRankStart:
{
	Gui,Submit,NoHide
	GuiControl, , A, 랭크 동작중
	매크로시작 := true
	클리어횟수 := 0
	Loop
	{
		;TODO: 무한 반복 작업 코드 
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\Image\StageEnd1.bmp
		if ((ErrorLevel = 0) && (매크로시작 = true))
		{
			;이미지를 찾았을때 마우스 클릭 코드 
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		;ms 단위 시간
		}
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\Image\StageEnd2.bmp
		if ((ErrorLevel = 0) && (매크로시작 = true))
		{
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		;ms 단위 시간
		}
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\Image\StageExit.bmp
		if ((ErrorLevel = 0) && (매크로시작 = true))
		{
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		;ms 단위 시간
		}
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\Image\StageRestart.bmp
		if ((ErrorLevel = 0) && (매크로시작 = true))
		{ 
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		;ms 단위 시간
			클리어횟수 := 클리어횟수 + 1
			Gui,Submit,nohide
			GuiControl, , B, %클리어횟수% 회
		}
		
		if(매크로시작 = false)
		{
			break
		}
	}
}
return

Button정지_F4:
{
	soloStart := false
	매크로시작 := false
	Gui,Submit,NoHide
	GuiControl, , A, 정지
}
return

Button종료:
{	
	soloStart := false
	매크로시작 := false
	ExitApp
	
}
return


F4::
{
	soloStart := false
	매크로시작 := false
	Gui,Submit,NoHide
	GuiControl, , A, 정지
}
return
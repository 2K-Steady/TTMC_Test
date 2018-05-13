
Gui, Add, Text, x35 y5 w110 h20, 탭탑 매크로 테스트	; 프로그램 제목
Gui, Add, Text, x70 y25 w100 h20 vA, 준비!!		 	; 현재 상태를 표시할 텍스트
Gui, Add, Text, x70 y50 h20 w50 vB, 0 회			; 스테이지 클리어 횟수를 표시할 텍스트
Gui, Add, Button, x30 y80 w110 h20, SoloStart		; 솔로 스타트 버튼
Gui, Add, Button, x30 y100 w110 h20, RankStart		; 랭크 스타트 버튼
Gui, Add, Button, x30 y120 w110 h20, 정지_F4		; 정지 버튼 
Gui, Add, Button, x30 y140 w110 h20, 종료			; 프로그램 종료 버튼
Gui, Add, Text, x30 y200 w110 h20 vC, 0 ImageNotFound ;이미지 못찾을때 디버깅용 
Gui, Add, Text, x30 y220 w110 h20 vD, Situation  	; 현재 상태 확인
Gui, Show

매크로시작 := false
soloStart := false
soloStep1 := false
soloStep2 := false
soloStep3 := false
soloStep4 := false
soloStep5 := false
soloStep6 := false
soloStep7 := false
soloStep8 := false
soloStep9 := false
soloStep10 := false

return

ButtonSoloStart:
{
	Gui,Submit,NoHide
	GuiControl, , A, 솔로 동작중
	GuiControl, , D, Start버튼눌림 
	soloStart := true
	클리어횟수 := 0
	ImageDebugging := 0 
	
	Loop
	{
		ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *50 %A_ScriptDir%\SoloPlayImage\1_SoloPlay.bmp
		if ((ErrorLevel = 0) && (soloStart = true))
		{
			;이미지를 찾았을때 마우스 클릭 코드 
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		;ms 단위 시간
			Gui,Submit,NoHide
			GuiControl, , D, SoloPlay버튼 누름
			
			soloStep1 := true
		}
		
		ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *50 %A_ScriptDir%\SoloPlayImage\K-003.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (soloStep1 = true))
		{
			soloStep1 := false
			;이미지를 찾았을때 마우스 클릭 코드 
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		;ms 단위 시간
			Gui,Submit,NoHide
			GuiControl, , D, 정렬버튼 누름
			
			soloStep2 := true
			
			ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *50 %A_ScriptDir%\SoloPlayImage\K-004.bmp
			if ((ErrorLevel = 0) && (soloStart = true) && (soloStep2 = true))
			{
				soloStep2 := false
				;이미지를 찾았을때 마우스 클릭 코드 
				Send {Click %FoundX% %FoundY%}
				Sleep, 1000		;ms 단위 시간
				Gui,Submit,NoHide
				GuiControl, , D, 곡 이름 누름
				
				soloStep3 := true
			}
		}
		
		
		ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *50 %A_ScriptDir%\SoloPlayImage\K-002.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (soloStep3 = true))
		{
			soloStep3 := false
			;이미지를 찾았을때 마우스 클릭 코드 
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		;ms 단위 시간
			Gui,Submit,NoHide
			GuiControl, , D, 정렬순서 버튼 누름
			
			soloStep4 := true
		}
		
		ImageSearch, FoundX, FoundY, 0,0, 1920, 1080, *100 %A_ScriptDir%\SoloPlayImage\Album_Test.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (soloStep4 = true))
		{
			soloStep4 := false
			;이미지를 찾았을때 마우스 클릭 코드 
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		;ms 단위 시간
			Gui,Submit,NoHide
			GuiControl, , D, 앨범커버 누름
			
			soloStep5 := true
		}
		else if(ErrorLevel = 1) ;===============이미지 디버깅용 코드==================
		{
			ImageDebugging := ImageDebugging +1
			Gui,Submit,nohide
			GuiControl, , C, %ImageDebugging% ImageNotFound
		}
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\3_RankSelect.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (soloStep5 = true))
		{
			soloStep5 := false
			;이미지를 찾았을때 마우스 클릭 코드 
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		;ms 단위 시간
			Gui,Submit,NoHide
			GuiControl, , D, 게임레벨 누름
			
			soloStep6 := true
		}
		
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\4_Next.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (soloStep6 = true))
		{
			soloStep6 := false
			;이미지를 찾았을때 마우스 클릭 코드 
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		;ms 단위 시간
			Gui,Submit,NoHide
			GuiControl, , D, Next버튼 누름
			
			soloStep7 := true
		}
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\5_AutoPlay.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (soloStep7 = true))
		{
			soloStep7 := false
			;이미지를 찾았을때 마우스 클릭 코드 
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		;ms 단위 시간
			Gui,Submit,NoHide
			GuiControl, , D, AutoPlay 누름
			
			soloStep8 := true
		}
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\6_Start.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (soloStep8 = true))
		{
			soloStep8 := false
			;이미지를 찾았을때 마우스 클릭 코드 
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		;ms 단위 시간
			클리어횟수 := 클리어횟수 + 1
			Gui,Submit,nohide
			GuiControl, , D, Start버튼 누름
			GuiControl, , B, %클리어횟수% 회
			
			soloStep9 := true
		}
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\7_StageEnd1.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (soloStep9 = true))
		{
			soloStep9 := false
			;이미지를 찾았을때 마우스 클릭 코드 
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		;ms 단위 시간
			Gui,Submit,NoHide
			GuiControl, , D, 플레이보상 누름
			
			soloStep10 := true
		}
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\8_StageEnd2.bmp
		if ((ErrorLevel = 0) && (soloStart = true) && (soloStep10 = true))
		{
			soloStep10 := false
			
			;이미지를 찾았을때 마우스 클릭 코드 
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		;ms 단위 시간
			Gui,Submit,NoHide
			GuiControl, , D, 스코어 누름
		}
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\9_StageEnd3.bmp
		if ((ErrorLevel = 0) && (soloStart = true))
		{
			;이미지를 찾았을때 마우스 클릭 코드 
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		;ms 단위 시간
			Gui,Submit,NoHide
			GuiControl, , D, id_steady 누름
		}
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\SoloPlayImage\10_StageRestart.bmp
		if ((ErrorLevel = 0) && (soloStart = true))
		{
			;이미지를 찾았을때 마우스 클릭 코드 
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000		;ms 단위 시간
			클리어횟수 := 클리어횟수 + 1
			Gui,Submit,nohide
			GuiControl, , D, Restart 누름
			GuiControl, , B, %클리어횟수% 회
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

Button정지:
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
	매크로시작 :=false
	Gui,Submit,NoHide
	GuiControl, , A, 정지
}
return
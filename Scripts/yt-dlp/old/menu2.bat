@echo off
setlocal enabledelayedexpansion

REM Set the name of the yt-dlp executable
set "yt_dlp_exe=yt-dlp.exe"

set "ytdlpPath=%~1"
set "url=%~2"
set "ytdlpFileName=%~3"
set "choice=%~4"
set "keepCmdOpen=%~5"

for /L %%i in (0,1,14) do (
    if %%i==0 (
        set "menu[%%i]=-F (List available formats)"
        set "option[%%i]=-F "
        set "output_template[%%i]="
    ) else if %%i==1 (
        set "menu[%%i]=<=1080p (MP4)"
        set "option[%%i]=-f bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4][height<=1080]/bv*[height<=1080]+ba/best --download-archive archive-video.txt -N 4"
        set "output_template[%%i]=download/%%(title)s[%%(height)sp][%%(id)s].%%(ext)s"
    ) else if %%i==2 (
        set "menu[%%i]=<=1080p (MP4 without archive)"
        set "option[%%i]=-f bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4][height<=1080]/bv*[height<=1080]+ba/best -N 4"
        set "output_template[%%i]=download/%%(title)s[%%(height)sp][%%(id)s].%%(ext)s"
    ) else if %%i==3 (
        set "menu[%%i]=bestvideo (MP4 without archive)"
        set "option[%%i]=-f bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best -N 6"
        set "output_template[%%i]=download/%%(title)s[%%(height)sp][%%(id)s].%%(ext)s"
    ) else if %%i==4 (
        set "menu[%%i]=with cookies (mp4)"
        set "option[%%i]=-f bestvideo[ext=mp4]/bestaudio/0 --download-archive archive-video.txt -N 4 --cookies youtube.txt"
        set "output_template[%%i]=download/%%(title)s[%%(height)sp][%%(id)s].%%(ext)s"
        set "menu[%%i_sep]=--"
    ) else if %%i==5 (
        set "menu[%%i]=audio (MP3)"
        set "option[%%i]=-f bestaudio[ext=mp3]/bestaudio/0 --extract-audio --audio-format mp3 --audio-quality 0 --download-archive archive-audio.txt -N 4"
        set "output_template[%%i]=download/%%(title)s-%%(id)s.%%(ext)s"
    ) else if %%i==6 (
        set "menu[%%i]=audio (MP3 without archive)"
        set "option[%%i]=-f bestaudio[ext=mp3]/bestaudio/0 --extract-audio --audio-format mp3 --audio-quality 0 -N 4"
        set "output_template[%%i]=download/%%(title)s-%%(id)s.%%(ext)s"
     ) else if %%i==7 (
        set "menu[%%i]=with cookies (mp3)"
        set "option[%%i]=-f bestaudio[ext=mp3]/bestaudio/0 --extract-audio --audio-format mp3 --audio-quality 0 --download-archive archive-audio.txt --cookies yandex.txt -N 4"
        set "output_template[%%i]=download/%%(title)s-%%(id)s.%%(ext)s"
        set "menu[%%i_sep]=--"
    ) else if %%i==8 (
        set "menu[%%i]=from list_video.txt (mp4)"
        set "option[%%i]=-f bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4][height<=1080]/bv*[height<=1080]+ba/best --download-archive archive-video.txt -N 6 -a list_video.txt"
        set "output_template[%%i]=download/video/%%(playlist_title)s/%%(title)s[%%(height)sp][%%(id)s].%%(ext)s"
        set "skip_url_prompt[%%i]=1"
    ) else if %%i==9 (
        set "menu[%%i]=from list_audio.txt (mp3)"
        set "option[%%i]=-f bestaudio[ext=mp3]/bestaudio/0 --extract-audio --audio-format mp3 --audio-quality 0 --download-archive archive-audio.txt -a list_audio.txt -N 4 "
        set "output_template[%%i]=download/audio/%%(playlist_title)s/%%(title)s[%%(height)sp][%%(id)s].%%(ext)s"
        set "skip_url_prompt[%%i]=1"
   ) else if %%i==10 (
       set "menu[%%i]=Download subtitles only"
       REM set "option[%%i]=--skip-download --write-auto-sub --sub-lang ru,ru-en-GB,en,en-GB --convert-subs srt"
       set "option[%%i]=--skip-download --write-auto-sub --sub-lang ru,ru-en-GB,en,en-GB,ja,zh,zh-CN,zh-TW --convert-subs srt"
       set "output_template[%%i]=subtitles/%%(title)s[%%(height)sp][%%(id)s].%%(ext)s"
   ) else if %%i==11 (
        set "menu[%%i]=Download videos after date"
        set "option[%%i]=-f bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4] --dateafter 20230101"
        set "output_template[%%i]=download/%%(upload_date)s_%%(title)s[%%(id)s].%%(ext)s"
   ) else if %%i==12 (
        set "menu[%%i]=Download live streams[need cookies]"
        set "option[%%i]=--no-hls-use-mpegts --live-from-start --cookies youtube.txt --remux-video mp4"
        REM --no-hls-use-mpegts --live-from-start --cookies youtube.txt"
        REM --no-hls-use-mpegts --live-from-start --cookies youtube.txt --remux-video mp4
        set "output_template[%%i]=live_streams/%%(title)s_%%(id)s.%%(ext)s"  
 )
)

if not "%choice%"=="" goto execute

:start
cd /d %ytdlpPath%

echo Available commands:
for /L %%i in (0,1,14) do (
    if defined menu[%%i] (
        echo %%i. !menu[%%i]!
    )
    if defined menu[%%i_sep] (
        echo !menu[%%i_sep]!
    )
)
echo.

set /p choice=Enter the command number or custom command:

:execute
if "%choice%" geq "0" if "%choice%" leq "99" (
    set "commands=!option[%choice%]!"
    set "output_template=!output_template[%choice%]!"
       
    REM Create the files if it doesn't exist
    if "%choice%"=="8" (
        if not exist list_video.txt (
            echo Creating list_video.txt...
            echo. > list_video.txt
        )
    )

    if "%choice%"=="9" (
        if not exist list_audio.txt (
            echo Creating list_audio.txt...
            echo. > list_audio.txt
        )
    )
) else (
    REM Custom command
    set "commands=%choice%"
    set "output_template="
)

if not defined skip_url_prompt[%choice%] (
    if not defined url (
        set /p url=Enter the URL:

        REM Check if the URL was provided
        if not defined url (
            echo No URL provided. Returning to start...
            pause >nul
            goto start
        )
    )
)

REM Attempt to execute the command, and handle errors
echo Executing yt-dlp command:
set "full_command=%yt_dlp_exe% !commands!"
if defined output_template (
    set "full_command=!full_command! -o "!output_template!""
)
if not defined skip_url_prompt[%choice%] (
    if defined url (
        set "full_command=!full_command! "!url!""
    )
)

echo !full_command!
!full_command!

if %errorlevel% neq 0 (
    echo.
    echo Command failed with error level %errorlevel%. Please check the error message above.
    echo.
    rundll32.exe user32.dll,MessageBeep 0x00000010
    REM msg * "Error: Command failed with error level %errorlevel%. Please check the console output for details."
    pause >nul
    goto start
) else (
    echo.
    echo Download completed successfully.
    echo.
    if /i "%keepCmdOpen%"=="true" (
        echo Press any key to return to the main menu...
        pause >nul
        goto start
    ) else (
        exit /b
    )
)
### Copy-Paste

v1: long gesture  
First, take a screenshot; press Ctrl+End; take another screenshot and compare pixels to see if the page scrolled. If the pixels didn’t change, send a WM_MOUSEWHEEL message and repeat these steps until the pixels match.

v2: long gesture  
First send Ctrl+End, then send WM_MOUSEWHEEL messages for continuous scrolling; it stops as soon as the user scrolls the wheel or clicks the mouse.  
>#### You need to add this under   
>Mouse Events → Mouse Wheel.  
>Settings → Before Action  

```
(function () {
    //  ▸ If autoscroll is in progress, stop it and do nothing else.  
    if (sp.GetStoredBool("LongScrollActive")) {  
        sp.StoreBool("LongScrollAbort", true);  
        return;  
    }
})();
```

**Copy**

How it works: if text is selected, it will be copied; if the same text is copied again, it will scroll the page
Depending on the distance of the gesture, you can scroll down a little or to the end of the page
+ It works in almost all applications where scrolling is available
+ If there are two columns on the page, they can be scrolled independently of each other

**Paste**

There are only two states: paste or scroll the page to the top

https://github.com/user-attachments/assets/a17a7c5a-7fda-4b6b-9acd-385654811520

---------------------------------------------------------------------------------------------------------

### Minimize-Return

v2  
long gesture  

true — strict mode:  
Only the windows that were directly under the gesture line will be minimized.  
If the gesture starts and ends on the same window, that window and the one beneath it will be minimized.  

false — extended mode:  
All the same as in strict mode, plus: if at least one window of a process was under the gesture line, all windows of that process will be minimized, even if they were not directly under the gesture.

If you have the Options → General → Always Activate Window Where Gesture Began setting enabled,  
And so, when we restore windows, the focus will return to the window where the gesture began rather than the one that was actually active.  
To avoid this:  
Uncheck the Always Activate Window Where Gesture Began option.  

Add the following code in Settings → Before Action.  
This will still activate the window under your gesture, but will be ignored by this script.  
```
if (action.ActionName === "minimize v2") { // Write the name of the window-minimizing script here.  
    var focusWin = sp.ForegroundWindow();  
} else {  
    var startWin = sp.WindowFromPoint(  
        new Point(Math.round(action.Start.X), Math.round(action.Start.Y)),  
        true);  
    if (startWin && startWin.IsValid()) {  
        try {startWin.Activate();  
        } catch (e) {}}}  
```

https://github.com/user-attachments/assets/a7ef9a92-b964-4507-b56d-e76aa5caa341


**Minimize**
+ short gesture - minimizing a single window
+ long gesture - all windows of one process 

**Return**
+ short gesture - restoring a single window
+ long gesture - all windows of one process 

if the stack is empty then sp.LastApplication();

If the window has the same HWnd (and it should be restored), then sp.LastApplication();

https://github.com/user-attachments/assets/753058d4-5b75-4de0-a20e-e06383c07207


---------------------------------------------------------------------------------------------------------

### Quick Close/Re-Open

**Close**  
var maxStoredWindows = 6; // maximum number of recently closed windows that can be restored/reopened

short gesture - closes (tab/program)  
long gesture - closes all windows of the same process  

**Re-Open**  
short gesture - restores the last closed tab in browser  
Long gesture - menu for restoring programs  


https://github.com/user-attachments/assets/7593ad56-a9f4-4001-9963-6eab5fb22b95

---------------------------------------------------------------------------------------------------------
### Deepl+Esc
Works only for DeepL for Windows

You need to change the settings by setting your hotkeys and check the Capture text on screen checkbox.

+ short gesture - If text is highlighted - then translation, if no text is highlighted - then Esc.
+ long gesture - Translation of text from the screen

https://github.com/user-attachments/assets/ce7b1791-0962-43c2-a39d-0cdf3c525628

---------------------------------------------------------------------------------------------------------
### Forward-Back
**Forward**


https://github.com/user-attachments/assets/6dd36b3e-b455-4be4-ad86-04f10dfea91d
 
When starting the gesture from a link, the link opens in a new tab;

When starting the gesture not from a link and there is selected text on the page, a new tab opens with a search for the selected text, depending on the length of the gesture;

Short gesture not from a link and with no selected text on the page performs the 'Forward' action.

Long gesture switches the tab if text is not selected 
+ It also works in any application: the browser opens and searches

v2.2
+APP_CONFIGS_FORWARD
+optimization
v2.1  
+now handles both `C:\\...` and `C:/...`  
+magnet links support  
+notification when a file or folder is missing  
v2  
+Opens URLs directly (e.g. reddit.com → opens in browser instead of performing a search)  
+Opens registry paths in RegEdit (e.g. HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run)  
+Runs system consoles/control panels (e.g. devmgmt.msc, main.cpl)  
+Opens local files and folders (e.g. %USERPROFILE%\AppData or C:\Temp)  

**Back**

+ short gesture - Back
+ long gesture - Previous tab

2.1   
Added a bottom zone: if the app has another window, it will be switched to; if not, the long-gesture from APP_CONFIGS runs instead.  
v2  
+switching windows of one process in a circle  
+APP_CONFIGS  


https://github.com/user-attachments/assets/61a68d8b-8f52-455e-9ee3-6d83823b6a7d

---------------------------------------------------------------------------------------------------------
### Max or Restore+Everything
Everything is a program for fast file searching on your compute

+ Short gesture, text not selected - Window maximized/restored
+ Short gesture, text selected - search in Everything
+ Long gesture, distance > 270 - open Everything

https://github.com/user-attachments/assets/2b5577a2-e0fd-49e3-89a8-c65a5df5401c

---------------------------------------------------------------------------------------------------------
### Search on the page

+ short gesture - next match
+ long gesture - previous match

https://github.com/user-attachments/assets/d91a5030-1e5b-41e6-b793-b51ddbed0766



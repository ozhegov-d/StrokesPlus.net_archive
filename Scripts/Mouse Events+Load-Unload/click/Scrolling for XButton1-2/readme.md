
✅ Consume Click Event 

+ changing the volume on the taskbar
+ ctrl+scroll

https://github.com/user-attachments/assets/1de877bd-2135-4732-b89c-3da7713a8f41
  
> WHY USE NATIVE keybd_event INSTEAD OF sp.SendVKey() FOR MEDIA KEYS?
> 
> StrokesPlus.net uses the InputSimulator library for sp.SendVKey().  
 However, this library fails to set the KEYEVENTF_EXTENDEDKEY (0x0001) flag  
 when sending media keys (like VOLUME_UP / VOLUME_DOWN).
> 
> THE BUG:  
 Media keys share base hardware scan codes with regular letters on a   
 standard QWERTY keyboard. For example:  
>   - VOLUME_DOWN (0xAE) shares scan code 0x2E with the letter 'C'.   
>   - VOLUME_UP   (0xAF) shares scan code 0x30 with the letter 'B'.
>
> Without the EXTENDEDKEY flag, Windows and Chromium/Electron-based apps  
 (like LosslessCut) misinterpret the media key input as a standard letter 
 keystroke. This triggers unintended app-specific hotkeys, such as 
 accidentally taking a screenshot when scrolling down.
>
 > THE FIX:
 By calling the WinAPI keybd_event directly and manually applying the
 EXTENDEDKEY flag, we ensure Windows correctly registers the input as a
 true media key, bypassing the InputSimulator bug entirely.

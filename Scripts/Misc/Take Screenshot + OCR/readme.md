### Take Screenshot + OCR

WinRT OCR (Windows OCR API) — Windows 10 and later
The default capture method for most users. The Windows Runtime OCR API has shipped with Windows since Windows 10 and runs entirely on your device. It is fast, reliable, and produces excellent results for printed text in screenshots, documents, and images. Recognized languages depend on the language packs installed in Windows — add languages through Windows Settings to enable recognition in those languages.


https://github.com/user-attachments/assets/18f9aa5f-c6b7-490f-b5ab-758b107518aa


> Unlike Windows OCR:  
Automatic language detection (for ru-RU, en-US, ja-JP, ko-KR, and zh-Hans-CN only)  
Text format can be selected after recognition  


#### Plug-Ins > WinRT OCR.dll (Windows OCR API)

#### console -> script

```
//List of all OCR languages (+installed)
sp.RunProgram("cmd.exe", '/c DISM /Online /Get-Capabilities /Format:Table | find /i "Language.ocr" & pause', "runas", "normal", true, false, false);
```

```
// list of installed OCR languages
var type; clr.System.AppDomain.CurrentDomain.GetAssemblies().forEach(function(a) { if (!type) type = a.GetType("OcrHelper.OcrEngine"); });
var langs = new (host.type(type))().GetInstalledOcrLanguages();
for (var i = 0; i < langs.Length; i++) sp.ConsoleLog("[" + (i+1) + "] " + langs[i], "ocr");
```

```
//Install / remove an OCR language
var OcrClass = (typeof OcrHelper !== 'undefined') ? OcrHelper.OcrEngine : OcrEngine;
var ocr = new OcrClass();
//sp.ConsoleLog("Removal: " + ocr.UninstallOcrLanguage("fr-FR"), "ocr"); // removal
sp.ConsoleLog("Installation: " + ocr.InstallOcrLanguage("fr-FR"), "ocr"); // installation
langButtonsDirty = true;
```

or for instructions on how to install/remove languages, see https://learn.microsoft.com/en-us/windows/powertoys/text-extractor

>OCR - Excel  
LMB on word: Edit | Hold LMB: Pan image | LMB on line: Drag | RMB: Add line | Double RMB: Delete | Scroll: Zoom


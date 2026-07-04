#### sp.RunProgram

> v2  
Portable apps: Auto-detect and launch the latest version (just specify a root folder containing multiple versions).   
Minor tweaks and fixes.  
```js
var program = 'notepad'; // Base path (used if lastversion = false)  
//var program = 'C:\\Windows\\System32\\notepad.exe';  
var programArgs = '';    
var admin = false;    
var logs = false;  

// 1 = Single instance. All files are passed as one string: "file1" "file2".  
// 2 = Multiple instances. Each file is launched with a separate call.  
// For old programs (to open all files in a SINGLE window): Use launchMode = 2 and set delayBetweenFiles =>3000  
var launchMode = 1;   
var delayBetweenFiles = 10;  // ms  
var openFiles = false;  
var filePaths = [  
    'C:\\test1.txt',  
    'C:\\test2.txt',  
    'C:\\test3.txt',  
];

var windowStyle = 'normal'; // 'hidden', 'normal', 'minimized', 'maximized'  
var processPriority = 'Normal'; // 'Idle', 'BelowNormal', 'Normal', 'AboveNormal', 'High', 'RealTime' (case-sensitive)  
var sleepBeforePriority = 500; // Delay before changing process priority (ms). Set to 0 to disable.  

// For portable apps  
var lastversion = false; // If true, then replaces var program  
var versionMethod = 'FileVersion'; // 'LastWriteTime', 'CreationTime', 'FileVersion'  
var baseDir = 'C:\\test\\';   
var exeName = 'test123.exe';      
```

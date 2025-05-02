> ### Before starting, make a backup of the StrokesPlus.net.json file.

how it works:

A = Active.json (StrokesPlus.net.json)  
B = B.json  
C = C.json  

Switching to profile B:  
A → C   // Save the current active profile (A) to C  
B → A   // Load profile B into the active profile (A)  

Switching to profile C:  
A → B   // Save the current active profile (A) to B  
C → A   // Load profile C into the active profile (A)


Each profile should have its own gesture or hotkey for switching profiles
(you can even use the same hotkey/gesture in all profiles).


// 📌 Full path where the current profile will be saved
var saveCurrentTo = Path.Combine(spPath, "StrokesPlus.net.C.json");

// 📌 Full path of the profile to load
var newProfile = Path.Combine(spPath, "StrokesPlus.net.B.json");

// 📌 Currently active profile
var activeProfile = Path.Combine(spPath, "StrokesPlus.net.json");


To avoid errors (when the same hotkeys are active in multiple profiles), make sure that in one profile the hotkeys are set to Activate + Unregistered + (Consume doesn’t matter).

> Error example:  
Failed to register hotkey form  
Hotkey is likely already registered by another process.  
Win32 Error: 1409 — the specified hotkey is already registered  

#### A script for activating/minimizing windows or sending key combinations depending on the screen area. It also supports window auto-hide and mouse cursor positioning.
#### Options - Advanced - Enable Mouse Hook Event Subscription  
#### Plug-Ins > EdgeZone v3.dll


https://github.com/user-attachments/assets/dad460c5-b9ac-4a42-ab47-1062adc03c96


<details> <summary>changelog</summary>
<h6>v3</h6> 
+window auto-hide<br> 
+mouse cursor positioning<br>
<h6>v2.1</h6>  
Activate window immediately without flashing by simulating an Alt key press<br> 
<h6>v2</h6>  
+Now finds all visible windows (using plugin instead of sp.AllApplications)<br>  
+improved performance<br> 
+separate simple window autohide script
</details>


---

for Hot Keys
> activateProcess({name:'notepad', title:''});  
activateProcess({name:'notepad', title:''},{x:0.5,y:0.5});

> activateProcess([  
{ name: 'notepad', title: '' },  
{ name: 'aimp', title: '' },  
//{ name: 'aimp', title: '' ,cursorPosition:{x:0.5,y:0.5 }}  
]);


> activateProcess({ run: 'C:\\\\test\\\\Telegram\\\\Telegram.exe' });  
activateProcess({ run: 'C:\\\\test\\\\Telegram\\\\Telegram.exe',cursorPosition:{x:0.5,y:0.5} }); 

---
##### 1. Activating or minimizing already running windows 

###### Cursor movement (by default to the center of the window 0.5x0.5) <br> cursorPosition:<br> x:0.5 - horizontally (0 left - 1 right) <br>  y:0.5 - vertically (0 top - 1 bottom)

> { enabled: true, from: 0, to: 15, process: { name: "chrome", title: "" }},  
{ enabled: true, from: 0, to: 15, process: { name: "chrome", title: "" ,cursorPosition:{x:0.5,y:0.5} ,autoMinimize:true }},


> { enabled: true, from: 30, to: 60, process: [  
{ name: "everything", title: "" },  
{ name: "notepad", title: "" },  // sets as active window  
]},  

###### Move cursor to the center of the last active window and minimize both windows  
> { enabled: true, from: 40, to: 60,cursorPosition:{x:0.5,y:0.5},autoMinimize: true, process: [  
{ name: "everything", title: "" },  
{ name: "notepad", title: "" },  // sets as active window  
]},

###### Move cursor to the center of the Everything window and minimize only Everything    
> { enabled: true, from: 40, to: 60, process: [  
{ name: "everything", title: "", cursorPosition:{x:0.5,y:0.5},autoMinimize:true },  
{ name: "notepad", title: "" },  // sets as active window
]},


###### autoMinimize:true - When windows are activated, a rectangle (dimensions) is calculated, and if we move outside its boundaries, the window minimizes. <br>  useWindowFromPoint: true - a more resource-intensive behavior: we calculate which PID is under the cursor, and if it's a child window, we don't minimize. <br> use WindowFromPoint to detect dynamically opened child windows (opened AFTER activation). If false, WindowFromPoint is never called  
> { enabled: true, from: 61, to: 89, cursorPosition:{x:0.5,y:0.6}, autoMinimize: true,useWindowFromPoint:true, process: { name: "aimp", title: "" }},


##### 2. Launching (then activation) or minimizing programs (via sp.RunProgram) 

> { enabled: true, from: 0, to: 15, process: { run: "C:\test\Telegram\Telegram.exe", title: "" }},  
  { enabled: true, from: 0, to: 15, process: { run: "C:\test\Telegram\Telegram.exe", title: "" , cursorPosition:{x:0.5,y:0.5},autoMinimize:true }},


##### 3. Sending key combinations for all applications (multiple hotkeys allowed)

> { enabled: true, from: 21, to: 40, sendKeys: "sp.SendModifiedVKeys([vk.LCONTROL], [vk.VK_F]);" },

##### 4. Conditions for different processes (and sending key combinations).

> { enabled: true, from: 90, to: 100,  actions: [  
// if the process is chrome then F11 + cursor to the center of the window  
{ whenProcess: { name: "chrome" },  doSendKeys: "sp.SendVKey(vk.F11);" , cursorPosition: {x:0.5,y:0.5}},  
// if the process is Everything64 then alt+ → → ↓ ↓ +enter  
{ whenProcess: { name: "Everything64" , title: "" }, doSendKeys:  "sp.SendVKey(vk.LMENU);sp.SendVKey(vk.RIGHT);sp.SendVKey(vk.RIGHT);sp.SendVKey(vk.DOWN);sp.SendVKey(vk.DOWN);sp.SendVKey(vk.RETURN);" ,cursorPosition: {x:0.5,y:0.5}},  
// if the window is not chrome or Everything64, then the strokeplus window will open.  
{ default: true, doProcess: { name: "strokesplus", title: "" }}  
]},

IMPORTANT: Specific conditions (with title) must come BEFORE general ones (without title).  
For example: first { title: "test" }, then { title: "" }.

> { enabled: true, from: 0, to: 10, actions: [  
> { whenProcess: { name: "chrome" }, doSendKeys: "sp.SendModifiedVKeys([vk.LCONTROL], [vk.VK_1]);" }, // if the process is chrome then Ctrl+1  
> { whenProcess: { name: "notepad" , title: "test" }, doSendKeys: "sp.SendModifiedVKeys([vk.LCONTROL], [vk.VK_F]);" }, // if the process is notepad and the title is test then Ctrl+F  
> { whenProcess: { name: "notepad" , title: "" }, doSendKeys: "sp.SendModifiedVKeys([vk.LCONTROL], [vk.VK_A]);" }, // if notepad process and there is no title (for all notepad windows) Ctrl+A  
 { default: true, doProcess: { name: "strokesplus", title: "" }} // if the window is not chrome or notepad, then the strokeplus window will open.  
]},


<details> <summary>v2</summary>

https://github.com/user-attachments/assets/177065b5-e91e-4f36-bd26-13cfb8851ca6
   
for Hot Keys  
> activateProcess({name:'notepad', title:''});

> activateProcess([  
   { name: 'notepad',    title: '' },   
   { name: 'aimp', title: '' }   
]);

> activateProcess({ run: 'C:\\\\test\\\\Telegram\\\\Telegram.exe' }); 

---
##### 1. Activating or minimizing already running windows 

> { enabled: true, from: 0, to: 15, process: { name: "chrome", title: "" }},  

> { enabled: true, from: 30, to: 60, process: [  
{ name: "everything", title: "" },  
{ name: "notepad", title: "" }  // sets as active window  
]},  

##### 2. Launching (then activation) or minimizing programs (via sp.RunProgram) 

> { enabled: true, from: 0, to: 15, process: { run: "C:\test\Telegram\Telegram.exe", title: "" }},

##### 3. Sending key combinations for all applications (multiple hotkeys allowed)

> { enabled: true, from: 21, to: 40, sendKeys: "sp.SendModifiedVKeys([vk.LCONTROL], [vk.VK_F]);" },

##### 4. Conditions for different processes (and sending key combinations).
IMPORTANT: Specific conditions (with title) must come BEFORE general ones (without title).  
For example: first { title: "test" }, then { title: "" }.

> { enabled: true, from: 0, to: 10, actions: [  
> { whenProcess: { name: "chrome" }, doSendKeys: "sp.SendModifiedVKeys([vk.LCONTROL], [vk.VK_1]);" }, // if the process is chrome then Ctrl+1  
> { whenProcess: { name: "notepad" , title: "test" }, doSendKeys: "sp.SendModifiedVKeys([vk.LCONTROL], [vk.VK_F]);" }, // if the process is notepad and the title is test then Ctrl+F  
> { whenProcess: { name: "notepad" , title: "" }, doSendKeys: "sp.SendModifiedVKeys([vk.LCONTROL], [vk.VK_A]);" }, // if notepad process and there is no title (for all notepad windows) Ctrl+A  
 { default: true, doProcess: { name: "strokesplus", title: "" }} // if the window is not chrome or notepad, then the strokeplus window will open.  
]},

> { enabled: true, from: 0, to: 10, actions: [  
{ whenProcess: { name: "chrome" }, doSendKeys: "sp.SendModifiedVKeys([vk.LCONTROL], [vk.VK_1]);" }, // if the process is chrome then Ctrl+1  
{ default: true, doProcess: { name: "", title: "" }}, // if any other process is simply ignored  
]},
</details>


#### A script for activating/minimizing windows/programs or sending key combinations depending on the screen area.
#### Options - Advanced - Enable Mouse Hook Event Subscription  
#### Plug-Ins > EdgeZone.dll

https://github.com/user-attachments/assets/177065b5-e91e-4f36-bd26-13cfb8851ca6

#### v2
> +Now finds all visible windows (using plugin instead of sp.AllApplications)  
> +improved performance  
> +separate simple window autohide script

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



<details> <summary>v1</summary>
Condition options:

##### 1. Activating or minimizing already running windows (sp.AllApplications() does not detect some windows, e.g., Telegram or programs that minimize to the system tray).

> { enabled: true, from: 0, to: 15, process: { name: "chrome", title: "" }},

> { enabled: true, from: 30, to: 60, process: [  
{ name: "everything", title: "" },  
{ name: "notepad", title: "" }  
]},

##### 2. Launching or minimizing programs (via sp.RunProgram).

> { enabled: true, from: 0, to: 15, process: { run: "C:\\test\\Telegram\\Telegram.exe", title: "" }}, 

##### 3. Sending key combinations for all applications.

> { enabled: true, from: 21, to: 40, sendKeys: "sp.SendModifiedVKeys([vk.LCONTROL], [vk.VK_F]);" },

##### 4. Conditions for different processes (and sending key combinations).
IMPORTANT: Specific conditions (with title) must come BEFORE general ones (without title).  
For example: first { title: "test" }, then { title: "" }.

> { enabled: true, from: 0, to: 10, actions: [      
{ whenProcess: { name: "chrome" }, doSendKeys: "sp.SendModifiedVKeys([vk.LCONTROL], [vk.VK_1]);" },  // if the process is chrome then Ctrl+1  
{ whenProcess: { name: "notepad" , title: "test" }, doSendKeys: "sp.SendModifiedVKeys([vk.LCONTROL], [vk.VK_F]);" }, // if the process is notepad and the title is test then Ctrl+F  
{ whenProcess: { name: "notepad" , title: "" }, doSendKeys: "sp.SendModifiedVKeys([vk.LCONTROL], [vk.VK_A]);" }, // if notepad process and there is no title (for all notepad windows) Ctrl+A  
{ default: true, doProcess: { name: "strokesplus", title: "" }} // if the window is not chrome or notepad, then the strokeplus window will open.  
]},

> { enabled: true, from: 0, to: 10, actions: [  
{ whenProcess: { name: "chrome" }, doSendKeys: "sp.SendModifiedVKeys([vk.LCONTROL], [vk.VK_1]);" },  // if the process is chrome then Ctrl+1  
{ default: true, doProcess: { name: "", title: "" }}, // if any other process is simply ignored  
]},

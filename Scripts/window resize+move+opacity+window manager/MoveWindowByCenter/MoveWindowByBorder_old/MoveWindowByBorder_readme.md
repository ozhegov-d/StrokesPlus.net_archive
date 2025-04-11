### MoveWindowByBorder


https://github.com/user-attachments/assets/026c0b41-69a5-4046-8147-04eed028440e


// Enables/disables the entire script (window dragging)  
var enableScript = true;   

// Toggle for applying default edge settings  
var globalAreas = true; // If false, then default edge zones are not applied  

// Toggle for applying default center settings  
var globalCenter = true; // If true, then default center settings are applied  

// Custom Settings  
var useCustomSettings = true;  

==============================================  
To change the mouse button  
if (!sp.IsButtonDown(MouseButtons.Left)) { // | Left | Right | Middle | XButton1 | XButton2 | Note: Case-sensitive  


> Keep in mind that if the window you're clicking on is running as administrator, an error will occur if StrokesPlus is not run as administrator.  

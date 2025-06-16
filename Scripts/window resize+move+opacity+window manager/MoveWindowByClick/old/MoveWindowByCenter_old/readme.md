### MoveWindowByCenter

Dragging the window by its center area with just a mouse click.

https://github.com/user-attachments/assets/dd1d079b-fc66-40f5-a6bd-f831fc215be3

#### Global Actions > Mouse Events > Click

To change the mouse button
if (!sp.IsButtonDown(MouseButtons.Left)) { // | Left | Right | Middle | XButton1 | XButton2 | Note: Case-sensitive

> Keep in mind that if the window you're clicking on is running as administrator, an error will occur if StrokesPlus is not run as administrator.

v2  
If part of the window extends beyond the screen, the 'center' area shifts to the visible part of the window.
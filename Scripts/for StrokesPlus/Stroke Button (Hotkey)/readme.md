### Assign a mouse button gesture to a Hotkey

sp.StartManualCapture([bool] useSecondary) and sp.StopManualCapture() to begin/end capturing the mouse as if you were holding the primary or secondary (based on the bool param) stroke button. This is experimental right now and is not documented, but the use case could be if you bound to the keyboard hook event to hold a key instead of a stroke button, though it still treats the  action as if the appropriate mouse button was being held since S+ was not built to support a key based stroke button.

> **Options - Advanced - Enable Keyboard Hook Event Subscription**  
Use in **Global Actions > Load/Unload**

**there is a bug**  
If the Hotkey is held longer than the "General - Cancel Delay (ms)", the Stroke Button gets stuck. It requires a physical mouse click (Stroke Button) to release the button state.

#### Copies the selected text with a long click.



#### Pastes clipboard content with a click.

click.Down  
>(function(){  
  if (click.Down) {  
    sp.SendModifiedVKeys([vk.LCONTROL], [vk.VK_V]);}})();

sp.IsButtonDown(MouseButtons.Left) + click.down
>(function(){  
  if (click.Down  
      && sp.IsButtonDown(MouseButtons.Left)) {  
    sp.SendModifiedVKeys([vk.LCONTROL], [vk.VK_V]);}})();

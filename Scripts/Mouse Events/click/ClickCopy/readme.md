#### Copies the selected text with a long click.



#### Pastes clipboard content with a click.

click.Down  
>(function(){  
  if (click.Down) {  
    sp.SendModifiedVKeys([vk.LCONTROL], [vk.VK_V]);}})();

click.down + sp.IsButtonDown(MouseButtons.Left)  
>(function(){  
  if (click.Down  
      && sp.IsButtonDown(MouseButtons.Left)) {  
    sp.SendModifiedVKeys([vk.LCONTROL], [vk.VK_V]);}})();

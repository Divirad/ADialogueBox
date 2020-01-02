# ADialogueBox 

[![Version badge](https://img.shields.io/badge/Version-v0.2-green.svg)](http://paypal.me/divirad)  
![](https://img.shields.io/github/issues/Divirad/ADialogueBox)
![](https://img.shields.io/github/forks/Divirad/ADialogueBox)
![](https://img.shields.io/github/stars/Divirad/ADialogueBox)
![](https://img.shields.io/github/license/Divirad/ADialogueBox) <br>
[![Author badge](https://img.shields.io/badge/Made_by-Divirad-inactive.svg)](http://divirad.com) 
[![PayPal badge](https://img.shields.io/badge/Donate-PayPal-blue.svg)](http://paypal.me/divirad) <br>

![Icon](https://raw.githubusercontent.com/Divirad/ADialogueBox/master/icon.png)

Easy to use dialogue box for all kind of games with not many features.

## Set up in edtior
Only the directorie "addons/adbox" is necessary id you want t

## Set up in a scene

Activate the plugin. Another class `DialogueBox` is now added to your editor. You can now add it as a childnode to a scene. This new class has some script variables you have to set before using it.

`Message Sound`: The sound that is played with each letter. (WAV)<br>
`Font`: the font you want to use. <br>
`Action Name`: the name of the action to be used to jump to the next message.<br>
`Wait Time`: The time to wait between each letter.<br>
`Block Time`: The time in which a dialog box-related input is going to be blocked immediately after the dialog box is closed.<br>
`Margin Top Bottom`: Margin size of top and bottom<br>
`Margin Left Right`: Margin size of left and right<br>

## Set up in code
Example:

``` 
if Input.is_action_just_pressed("ui_down"):
  $DialogueBox.talk(["Message 1","Message 2", "Message 3", "Message 4"])
```
## Signals

`dialogue_exit`: when the dialog box is closed, it sends this signal.

_________

![](https://raw.githubusercontent.com/Divirad/ADialogueBox/master/docs/screenshot.png)

_____________________

Used Art From
https://opengameart.org/content/10-basic-message-boxes

Used Soundeffect From
https://opengameart.org/content/8-bit-sound-effects-library

Used Font From
https://www.dafont.com/press-start-2p.font

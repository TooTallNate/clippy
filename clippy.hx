import flash.display.MovieClip;
import flash.events.MouseEvent;
import flash.display.SimpleButton;

class ButtonUp extends MovieClip { public function new() { super(); } }

class ButtonOver extends MovieClip { public function new() { super(); } }

class ButtonDown extends MovieClip { public function new() { super(); } }

class Clippy {
  // Main
  static function main() {
    var text:String = flash.Lib.current.loaderInfo.parameters.text;

    // button
    var button:SimpleButton = new SimpleButton();
    button.useHandCursor = false;
    button.upState = flash.Lib.attach("ButtonUp");
    button.overState = flash.Lib.attach("ButtonOver");
    button.downState = flash.Lib.attach("ButtonDown");
    button.hitTestState = flash.Lib.attach("ButtonDown");

    button.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent) {
      flash.system.System.setClipboard(text);
    });

    flash.Lib.current.addChild(button);
  }
}
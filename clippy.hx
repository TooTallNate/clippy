import flash.display.MovieClip;
import flash.events.MouseEvent;
import flash.display.SimpleButton;
import flash.external.ExternalInterface;

class ButtonUp extends MovieClip { public function new() { super(); } }

class ButtonOver extends MovieClip { public function new() { super(); } }

class ButtonDown extends MovieClip { public function new() { super(); } }

class Clippy {

  // Main
  static function main() {
    var defaultText:String = flash.Lib.current.loaderInfo.parameters.text;
    var selector:String = flash.Lib.current.loaderInfo.parameters.selector;

    // button
    var button:SimpleButton = new SimpleButton();
    button.useHandCursor = false;
    button.upState = flash.Lib.attach("ButtonUp");
    button.overState = flash.Lib.attach("ButtonOver");
    button.downState = flash.Lib.attach("ButtonDown");
    button.hitTestState = flash.Lib.attach("ButtonDown");

    button.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent) {
      var t = defaultText;
      try {
        var q = "function () { var e = jQuery('"+selector+"'); return e.attr('data-clippy') || e.val(); }";
        t = ExternalInterface.call(q);
      } catch (e : Dynamic) {}
      flash.system.System.setClipboard(t);
    });

    flash.Lib.current.addChild(button);
  }
}

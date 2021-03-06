// Generated by CoffeeScript 2.0.0-beta7
var EventEmitter;
EventEmitter = require('events').EventEmitter;
module.exports = function (agentContext) {
  var Input;
  Input = new EventEmitter;
  Input.dispatchKeyEvent = function (param$, cb) {
    var autoRepeat, cache$, isKeypad, isSystemKey, keyIdentifier, macCharCode, modifiers, nativeVirtualKeyCode, text, timestamp, type, unmodifiedText, windowsVirtualKeyCode;
    {
      cache$ = param$;
      type = cache$.type;
      modifiers = cache$.modifiers;
      timestamp = cache$.timestamp;
      text = cache$.text;
      unmodifiedText = cache$.unmodifiedText;
      keyIdentifier = cache$.keyIdentifier;
      windowsVirtualKeyCode = cache$.windowsVirtualKeyCode;
      nativeVirtualKeyCode = cache$.nativeVirtualKeyCode;
      macCharCode = cache$.macCharCode;
      autoRepeat = cache$.autoRepeat;
      isKeypad = cache$.isKeypad;
      isSystemKey = cache$.isSystemKey;
    }
  };
  Input.dispatchMouseEvent = function (param$, cb) {
    var button, cache$, clickCount, modifiers, timestamp, type, x, y;
    {
      cache$ = param$;
      type = cache$.type;
      x = cache$.x;
      y = cache$.y;
      modifiers = cache$.modifiers;
      timestamp = cache$.timestamp;
      button = cache$.button;
      clickCount = cache$.clickCount;
    }
  };
  return Input;
};

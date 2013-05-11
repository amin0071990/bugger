# Domain bindings for Input
{EventEmitter} = require 'events'

module.exports = (agentContext) ->
  Input = new EventEmitter()

  # Dispatches a key event to the page.
  #
  # @param type keyDown|keyUp|rawKeyDown|char Type of the key event.
  # @param modifiers integer? Bit field representing pressed modifier keys. Alt=1, Ctrl=2, Meta/Command=4, Shift=8 (default: 0).
  # @param timestamp number? Time at which the event occurred. Measured in UTC time in seconds since January 1, 1970 (default: current time).
  # @param text string? Text as generated by processing a virtual key code with a keyboard layout. Not needed for for <code>keyUp</code> and <code>rawKeyDown</code> events (default: "")
  # @param unmodifiedText string? Text that would have been generated by the keyboard if no modifiers were pressed (except for shift). Useful for shortcut (accelerator) key handling (default: "").
  # @param keyIdentifier string? Unique key identifier (e.g., 'U+0041') (default: "").
  # @param windowsVirtualKeyCode integer? Windows virtual key code (default: 0).
  # @param nativeVirtualKeyCode integer? Native virtual key code (default: 0).
  # @param macCharCode integer? Mac character code (default: 0).
  # @param autoRepeat boolean? Whether the event was generated from auto repeat (default: false).
  # @param isKeypad boolean? Whether the event was generated from the keypad (default: false).
  # @param isSystemKey boolean? Whether the event was a system key event (default: false).
  Input.dispatchKeyEvent = ({type, modifiers, timestamp, text, unmodifiedText, keyIdentifier, windowsVirtualKeyCode, nativeVirtualKeyCode, macCharCode, autoRepeat, isKeypad, isSystemKey}, cb) ->
    # Not implemented

  # Dispatches a mouse event to the page.
  #
  # @param type mousePressed|mouseReleased|mouseMoved Type of the mouse event.
  # @param x integer X coordinate of the event relative to the main frame's viewport.
  # @param y integer Y coordinate of the event relative to the main frame's viewport. 0 refers to the top of the viewport and Y increases as it proceeds towards the bottom of the viewport.
  # @param modifiers integer? Bit field representing pressed modifier keys. Alt=1, Ctrl=2, Meta/Command=4, Shift=8 (default: 0).
  # @param timestamp number? Time at which the event occurred. Measured in UTC time in seconds since January 1, 1970 (default: current time).
  # @param button none|left|middle|right? Mouse button (default: "none").
  # @param clickCount integer? Number of times the mouse button was clicked (default: 0).
  Input.dispatchMouseEvent = ({type, x, y, modifiers, timestamp, button, clickCount}, cb) ->
    # Not implemented


  return Input

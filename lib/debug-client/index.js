// Generated by CoffeeScript 2.0.0-beta7
var callbackWrapper, commandsWith, debugParser, EventEmitter;
EventEmitter = require('events').EventEmitter;
debugParser = require('./parser');
callbackWrapper = require('../callback-wrapper');
commandsWith = require('./commands');
module.exports = function (debugConnection) {
  var cache$, client, nextObjectId, parser, sendString, unwrapCallback, updateRunning, wrapCallback;
  client = new EventEmitter;
  client.running = true;
  client.debugConnection = debugConnection;
  nextObjectId = 0;
  client.nextObjectId = function () {
    return (++nextObjectId).toString();
  };
  client.commands = commandsWith(client);
  debugConnection.setEncoding('utf8');
  cache$ = callbackWrapper(client);
  wrapCallback = cache$.wrapCallback;
  unwrapCallback = cache$.unwrapCallback;
  sendString = function (data) {
    if (debugConnection.writable) {
      return debugConnection.write('Content-Length: ' + data.length + '\r\n\r\n' + data);
    } else {
      client.emit('error', new Error('Debug connection not writable'));
      return client.emit('close');
    }
  };
  client.sendRequest = function (command, params, cb) {
    var messageObj;
    messageObj = {
      type: 'request',
      command: command,
      seq: wrapCallback(cb)
    };
    if (Object.keys(params).length > 0)
      messageObj['arguments'] = params;
    return sendString(JSON.stringify(messageObj));
  };
  updateRunning = function (running) {
    var eventName;
    if (running !== client.running) {
      client.running = running;
      eventName = running ? 'running' : 'stopped';
      return client.emit(eventName);
    }
  };
  parser = debugParser(debugConnection);
  parser.on('parsed:response', function (obj) {
    var ref, refMap;
    if (null != obj.running)
      updateRunning(obj.running);
    if (Array.isArray(obj.refs)) {
      refMap = {};
      for (var i$ = 0, length$ = obj.refs.length; i$ < length$; ++i$) {
        ref = obj.refs[i$];
        refMap[ref.handle.toString()] = ref;
      }
      obj.refMap = refMap;
    }
    return unwrapCallback(obj);
  });
  parser.on('parsed:event', function (obj) {
    var body, cache$1, cache$2, event, ref, refMap, refs, running, success;
    cache$1 = obj;
    success = cache$1.success;
    running = cache$1.running;
    if (null != running)
      updateRunning(running);
    cache$2 = obj;
    event = cache$2.event;
    body = cache$2.body;
    refs = cache$2.refs;
    refMap = {};
    if (Array.isArray(refs))
      for (var i$ = 0, length$ = refs.length; i$ < length$; ++i$) {
        ref = refs[i$];
        refMap[ref.handle.toString()] = ref;
      }
    return client.emit(event, body, refMap);
  });
  return client;
};

// Generated by CoffeeScript 2.0.0-beta5
var _resolveFilename, bugScript, connect, createServer, debugClient, defaults, openDebugConnection, path, spawn;
spawn = require('child_process').spawn;
cache$ = require('net');
createServer = cache$.createServer;
connect = cache$.connect;
_resolveFilename = require('module')._resolveFilename;
path = require('path');
defaults = require('underscore').defaults;
debugClient = require('./debug-client');
openDebugConnection = function (childProcess) {
  var buffer, waitForDebugger;
  buffer = '';
  waitForDebugger = function (chunk) {
    var debugConnection, match;
    buffer += chunk.toString();
    match = buffer.match(/debugger listening/);
    if (null != match) {
      buffer = null;
      childProcess.stderr.removeListener('data', waitForDebugger);
      return debugConnection = connect(childProcess.debugPort, function () {
        childProcess.debugConnection = debugConnection;
        childProcess.debugClient = debugClient(debugConnection);
        return childProcess.emit('debugClient', childProcess.debugClient);
      });
    }
  };
  return childProcess.stderr.on('data', waitForDebugger);
};
bugScript = function (moduleName, childArgs, param$, cb) {
  var debugBreak, err, tmpServer;
  debugBreak = param$.debugBreak;
  if (!(moduleName[0] === '/'))
    moduleName = './' + moduleName;
  try {
    moduleName = _resolveFilename(moduleName);
  } catch (e$) {
    err = e$;
    return cb(err);
  }
  tmpServer = createServer(function () {
  });
  return tmpServer.listen(0, function () {
    var debugPort;
    debugPort = this.address().port;
    tmpServer.close();
    return tmpServer.on('close', function () {
      var forked, options;
      childArgs = [
        '--debug=' + debugPort,
        path.join(__dirname, 'child.js'),
        moduleName
      ].concat(childArgs);
      options = {
        stdio: [
          'pipe',
          'pipe',
          'pipe',
          'ipc'
        ],
        env: defaults({}, process.env)
      };
      if (debugBreak)
        options.env.ENABLE_DEBUG_BREAK = '1';
      forked = spawn(process.argv[0], childArgs, options);
      forked.debugPort = debugPort;
      openDebugConnection(forked);
      return cb(null, forked);
    });
  });
};
module.exports = bugScript;
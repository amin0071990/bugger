// Generated by CoffeeScript 2.0.0-beta4
var argv, PageAgent;
argv = require('../argv');
module.exports = PageAgent = {
  getResourceTree: function (cb) {
    return cb(null, {
      childFrames: [],
      resources: [],
      frame: {
        mimeType: 'application/javascript',
        url: argv.getAppUrl(),
        type: 'script',
        id: 1,
        loaderId: 1,
        name: 'main',
        securityOrigin: argv.webhost
      }
    });
  }
};
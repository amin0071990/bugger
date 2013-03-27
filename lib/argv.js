// Generated by CoffeeScript 2.0.0-beta4
var argv, argvParser;
argvParser = require('optimist').usage('bugger [OPTIONS] FILE_NAME').options({
  version: {
    alias: 'v',
    describe: 'Just show version information',
    boolean: true
  },
  help: {
    alias: 'h',
    describe: 'Show this text',
    boolean: true
  },
  chrome: {
    boolean: true,
    describe: 'Open Chrome with the correct url'
  },
  brk: {
    describe: 'Break on first line of script',
    boolean: true,
    'default': true
  },
  webhost: {
    'default': '127.0.0.1',
    describe: 'Web host used by node-inspector'
  },
  webport: {
    'default': 8058,
    describe: 'Web port used by node-inspector'
  }
});
argv = argvParser.argv;
if (argv.version) {
  console.log(require('../package.json').version);
  process.exit(0);
}
if (argv.help) {
  argvParser.showHelp();
  process.exit(0);
}
if (!argv._.length) {
  argvParser.showHelp();
  process.exit(1);
}
module.exports = argv;
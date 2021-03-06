# Hide this script from argv
[__thisFile] = process.argv.splice 1, 1

{realpath, readFile, readFileSync} = require 'fs'
{dirname, extname} = require 'path'
Module = require 'module'
Module._sourceMaps ?= {}
{_nodeModulePaths, _sourceMaps} = Module

{compilers} = require('./probes')(false, process.env.BUGGER_PROBES)

registerExtension = (extension, {compile}) ->
  Object.defineProperty require.extensions, extension, enumerable: true, get: ->
    (module, filename) ->
      input = readFileSync filename, 'utf8'
      {code, map} = compile filename, input
      if map?
        # Return the compiled javascript
        code += "\n//@ sourceMappingURL=data:application/json;base64,"
        code += new Buffer("#{map}").toString('base64')
        code += "\n"

      module._compile code, filename

for extension, compiler of compilers
  continue if extension is '.js' # no special handling for plain javascript
  registerExtension extension, compiler

realpath process.argv[1], (err, filename) ->
  throw err if err?

  # Set everything up so it looks like the script was started directly
  mainModule = require.main
  # Set the filename.
  mainModule.filename = process.argv[1] = filename
  # Clear the module cache.
  mainModule.moduleCache and= {}
  # Assign paths for node_modules loading
  mainModule.paths = _nodeModulePaths dirname mainModule.filename

  # Extract extension
  extension = extname mainModule.filename
  prependDebugBreak = process.env.ENABLE_DEBUG_BREAK?

  if process.env.BUGGER_LANGUAGE
    extension = ".#{process.env.BUGGER_LANGUAGE}"

  readFile filename, 'utf8', (err, input) ->
    throw err if err?

    compiler = compilers[extension]
    if not compiler? and '#!' == input.substr(0, 2)
      firstNL = input.indexOf '\n'
      # look at every segment (sep by whitespace), starting with last one
      firstLine = input.substr(0, firstNL).split(/\s+/g).reverse()
      input = input.substr firstNL

      for segment in firstLine
        if /coffee$/.test segment
          compiler = compilers['.coffee']; break

    {compile} = compiler ? compilers['.js']

    {code, map} = compile mainModule.filename, input
    if process.env.ENABLE_DEBUG_BREAK?
      code = "debugger; " + code

    if map?
      # Return the compiled javascript
      code += "\n//@ sourceMappingURL=data:application/json;base64,"
      code += new Buffer("#{map}").toString('base64')
      code += "\n"

      _sourceMaps[mainModule.filename] = map

    mainModule._compile code, filename

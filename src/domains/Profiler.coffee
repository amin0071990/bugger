# Domain bindings for Profiler
{EventEmitter} = require 'events'

module.exports = (agentContext) ->
  Profiler = new EventEmitter()

  # @returns result boolean 
  Profiler.causesRecompilation = ({}, cb) ->
    # Not implemented

  # @returns result boolean 
  Profiler.isSampling = ({}, cb) ->
    # Not implemented

  # @returns result boolean 
  Profiler.hasHeapProfiler = ({}, cb) ->
    # Not implemented

  Profiler.enable = ({}, cb) ->
    # Not implemented

  Profiler.disable = ({}, cb) ->
    # Not implemented

  Profiler.start = ({}, cb) ->
    # Not implemented

  Profiler.stop = ({}, cb) ->
    # Not implemented

  # @returns headers ProfileHeader[] 
  Profiler.getProfileHeaders = ({}, cb) ->
    # Not implemented

  # @param uid integer 
  # @returns profile CPUProfile 
  Profiler.getCPUProfile = ({uid}, cb) ->
    # Not implemented

  # @param uid integer 
  Profiler.getHeapSnapshot = ({uid}, cb) ->
    # Not implemented

  # @param type string 
  # @param uid integer 
  Profiler.removeProfile = ({type, uid}, cb) ->
    # Not implemented

  Profiler.clearProfiles = ({}, cb) ->
    # Not implemented

  # @param reportProgress boolean? If true 'reportHeapSnapshotProgress' events will be generated while snapshot is being taken.
  Profiler.takeHeapSnapshot = ({reportProgress}, cb) ->
    # Not implemented

  Profiler.collectGarbage = ({}, cb) ->
    # Not implemented

  # @param objectId HeapSnapshotObjectId 
  # @param objectGroup string? Symbolic group name that can be used to release multiple objects.
  # @returns result Runtime.RemoteObject Evaluation result.
  Profiler.getObjectByHeapObjectId = ({objectId, objectGroup}, cb) ->
    # Not implemented

  # @param objectId Runtime.RemoteObjectId Identifier of the object to get heap object id for.
  # @returns heapSnapshotObjectId HeapSnapshotObjectId Id of the heap snapshot object corresponding to the passed remote object id.
  Profiler.getHeapObjectId = ({objectId}, cb) ->
    # Not implemented

  # @param objectId Runtime.RemoteObjectId Identifier of the object to get heap object id for.
  Profiler.emit_getHeapObjectId = (params) ->
    notification = {params, method: 'Profiler.getHeapObjectId'}
    @emit 'notification', notification

  # @param objectId Runtime.RemoteObjectId Identifier of the object to get heap object id for.
  Profiler.emit_getHeapObjectId = (params) ->
    notification = {params, method: 'Profiler.getHeapObjectId'}
    @emit 'notification', notification

  # @param objectId Runtime.RemoteObjectId Identifier of the object to get heap object id for.
  Profiler.emit_getHeapObjectId = (params) ->
    notification = {params, method: 'Profiler.getHeapObjectId'}
    @emit 'notification', notification

  # @param objectId Runtime.RemoteObjectId Identifier of the object to get heap object id for.
  Profiler.emit_getHeapObjectId = (params) ->
    notification = {params, method: 'Profiler.getHeapObjectId'}
    @emit 'notification', notification

  # @param objectId Runtime.RemoteObjectId Identifier of the object to get heap object id for.
  Profiler.emit_getHeapObjectId = (params) ->
    notification = {params, method: 'Profiler.getHeapObjectId'}
    @emit 'notification', notification

  # @param objectId Runtime.RemoteObjectId Identifier of the object to get heap object id for.
  Profiler.emit_getHeapObjectId = (params) ->
    notification = {params, method: 'Profiler.getHeapObjectId'}
    @emit 'notification', notification

  # # Types
  # Profile header.
  Profiler.ProfileHeader = {"id":"ProfileHeader","type":"object","description":"Profile header.","properties":[{"name":"typeId","type":"string","enum":["CPU","CSS","HEAP"],"description":"Profile type name."},{"name":"title","type":"string","description":"Profile title."},{"name":"uid","type":"integer","description":"Unique identifier of the profile."},{"name":"maxJSObjectId","type":"integer","optional":true,"description":"Last seen JS object Id."}]}
  # CPU Profile node. Holds callsite information, execution statistics and child nodes.
  Profiler.CPUProfileNode = {"id":"CPUProfileNode","type":"object","description":"CPU Profile node. Holds callsite information, execution statistics and child nodes.","properties":[{"name":"functionName","type":"string","description":"Function name."},{"name":"url","type":"string","description":"URL."},{"name":"lineNumber","type":"integer","description":"Line number."},{"name":"totalTime","type":"number","description":"Total execution time."},{"name":"selfTime","type":"number","description":"Self time."},{"name":"numberOfCalls","type":"integer","description":"Number of calls."},{"name":"visible","type":"boolean","description":"Visibility."},{"name":"callUID","type":"number","description":"Call UID."},{"name":"children","type":"array","items":{"$ref":"CPUProfileNode"},"description":"Child nodes."},{"name":"id","optional":true,"type":"integer","description":"Unique id of the node."}]}
  # Profile.
  Profiler.CPUProfile = {"id":"CPUProfile","type":"object","description":"Profile.","properties":[{"name":"head","$ref":"CPUProfileNode","optional":true},{"name":"idleTime","type":"number","optional":true},{"name":"samples","optional":true,"type":"array","items":{"type":"integer"},"description":"Ids of samples top nodes."}]}
  # Heap snashot object id.
  Profiler.HeapSnapshotObjectId = {"id":"HeapSnapshotObjectId","type":"string","description":"Heap snashot object id."}

  return Profiler

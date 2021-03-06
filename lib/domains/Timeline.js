// Generated by CoffeeScript 2.0.0-beta7
var EventEmitter;
EventEmitter = require('events').EventEmitter;
module.exports = function (param$) {
  var debugClient, Timeline;
  debugClient = param$.debugClient;
  Timeline = new EventEmitter;
  Timeline.start = function (param$1, cb) {
    var cache$, includeDomCounters, includeNativeMemoryStatistics, maxCallStackDepth;
    {
      cache$ = param$1;
      maxCallStackDepth = cache$.maxCallStackDepth;
      includeDomCounters = cache$.includeDomCounters;
      includeNativeMemoryStatistics = cache$.includeNativeMemoryStatistics;
    }
  };
  Timeline.stop = function (param$1, cb) {
    void 0;
  };
  Timeline.supportsFrameInstrumentation = function (param$1, cb) {
    void 0;
    return cb(null, { result: false });
  };
  Timeline.canMonitorMainThread = function (param$1, cb) {
    void 0;
    return cb(null, { result: false });
  };
  Timeline.emit_eventRecorded = function (params) {
    var notification;
    notification = {
      params: params,
      method: 'Timeline.eventRecorded'
    };
    return this.emit('notification', notification);
  };
  Timeline.DOMCounters = {
    id: 'DOMCounters',
    type: 'object',
    properties: [
      {
        name: 'documents',
        type: 'integer'
      },
      {
        name: 'nodes',
        type: 'integer'
      },
      {
        name: 'jsEventListeners',
        type: 'integer'
      }
    ],
    description: 'Current values of DOM counters.',
    hidden: true
  };
  Timeline.TimelineEvent = {
    id: 'TimelineEvent',
    type: 'object',
    properties: [
      {
        name: 'type',
        type: 'string',
        description: 'Event type.'
      },
      {
        name: 'thread',
        type: 'string',
        optional: true,
        description: 'If present, identifies the thread that produced the event.',
        hidden: true
      },
      {
        name: 'data',
        type: 'object',
        description: 'Event data.'
      },
      {
        name: 'children',
        type: 'array',
        optional: true,
        items: { $ref: 'TimelineEvent' },
        description: 'Nested records.'
      },
      {
        name: 'counters',
        $ref: 'DOMCounters',
        optional: true,
        hidden: true,
        description: 'Current values of DOM counters.'
      },
      {
        name: 'usedHeapSize',
        type: 'integer',
        optional: true,
        hidden: true,
        description: 'Current size of JS heap.'
      },
      {
        name: 'nativeHeapStatistics',
        type: 'object',
        optional: true,
        hidden: true,
        description: 'Native heap statistics.'
      }
    ],
    description: 'Timeline record contains information about the recorded activity.'
  };
  return Timeline;
};

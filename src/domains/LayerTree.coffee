# Domain bindings for LayerTree
{EventEmitter} = require 'events'

module.exports = (agentContext) ->
  LayerTree = new EventEmitter()

  # Enables compositing tree inspection.
  LayerTree.enable = ({}, cb) ->
    # Not implemented

  # Disables compositing tree inspection.
  LayerTree.disable = ({}, cb) ->
    # Not implemented

  # Returns the layer tree structure of the current page.
  #
  # @param nodeId DOM.NodeId Root of the subtree for which we want to gather layers.
  # @returns layers Layer[] Child layers.
  LayerTree.layersForNode = ({nodeId}, cb) ->
    # Not implemented

  # Provides the reasons why the given layer was composited.
  #
  # @param layerId LayerId The id of the layer for which we want to get the reasons it was composited.
  # @returns compositingReasons CompositingReasons An object containing the reasons why the layer was composited as properties.
  LayerTree.reasonsForCompositingLayer = ({layerId}, cb) ->
    # Not implemented

  # Provides the reasons why the given layer was composited.
  #
  # @param layerId LayerId The id of the layer for which we want to get the reasons it was composited.
  LayerTree.emit_reasonsForCompositingLayer = (params) ->
    notification = {params, method: 'LayerTree.reasonsForCompositingLayer'}
    @emit 'notification', notification

  # # Types
  # Unique RenderLayer identifier.
  LayerTree.LayerId = {"id":"LayerId","type":"string","description":"Unique RenderLayer identifier."}
  # Unique PseudoElement identifier.
  LayerTree.PseudoElementId = {"id":"PseudoElementId","type":"string","description":"Unique PseudoElement identifier."}
  # A rectangle.
  LayerTree.IntRect = {"id":"IntRect","type":"object","description":"A rectangle.","properties":[{"name":"x","type":"integer","description":"The x position."},{"name":"y","type":"integer","description":"The y position."},{"name":"width","type":"integer","description":"The width metric."},{"name":"height","type":"integer","description":"The height metric."}]}
  # Information about a compositing layer.
  LayerTree.Layer = {"id":"Layer","type":"object","description":"Information about a compositing layer.","properties":[{"name":"layerId","$ref":"LayerId","description":"The unique id for this layer."},{"name":"nodeId","$ref":"DOM.NodeId","description":"The id for the node associated with this layer."},{"name":"bounds","$ref":"IntRect","description":"Bounds of the layer in absolute page coordinates."},{"name":"paintCount","type":"integer","description":"Indicates how many time this layer has painted."},{"name":"memory","type":"integer","description":"Estimated memory used by this layer."},{"name":"compositedBounds","$ref":"IntRect","description":"The bounds of the composited layer."},{"name":"isInShadowTree","type":"boolean","optional":true,"description":"Indicates whether this layer is associated with an element hosted in a shadow tree."},{"name":"isReflection","type":"boolean","optional":true,"description":"Indicates whether this layer was used to provide a reflection for the element."},{"name":"isGeneratedContent","type":"boolean","optional":true,"description":"Indicates whether the layer is attached to a pseudo element that is CSS generated content."},{"name":"isAnonymous","type":"boolean","optional":true,"description":"Indicates whether the layer was created for a CSS anonymous block or box."},{"name":"pseudoElementId","$ref":"PseudoElementId","optional":true,"description":"The id for the pseudo element associated with this layer."},{"name":"pseudoElement","type":"string","optional":true,"description":"The name of the CSS pseudo-element that prompted the layer to be generated."}]}
  # An object containing the reasons why the layer was composited as properties.
  LayerTree.CompositingReasons = {"id":"CompositingReasons","type":"object","description":"An object containing the reasons why the layer was composited as properties.","properties":[{"name":"transform3D","type":"boolean","optional":true,"description":"Composition due to association with an element with a CSS 3D transform."},{"name":"video","type":"boolean","optional":true,"description":"Composition due to association with a <video> element."},{"name":"canvas","type":"boolean","optional":true,"description":"Composition due to the element being a <canvas> element."},{"name":"plugin","type":"boolean","optional":true,"description":"Composition due to association with a plugin."},{"name":"iFrame","type":"boolean","optional":true,"description":"Composition due to association with an <iframe> element."},{"name":"backfaceVisibilityHidden","type":"boolean","optional":true,"description":"Composition due to association with an element with a \"backface-visibility: hidden\" style."},{"name":"clipsCompositingDescendants","type":"boolean","optional":true,"description":"Composition due to association with an element clipping compositing descendants."},{"name":"animation","type":"boolean","optional":true,"description":"Composition due to association with an animated element."},{"name":"filters","type":"boolean","optional":true,"description":"Composition due to association with an element with CSS filters applied."},{"name":"positionFixed","type":"boolean","optional":true,"description":"Composition due to association with an element with a \"position: fixed\" style."},{"name":"positionSticky","type":"boolean","optional":true,"description":"Composition due to association with an element with a \"position: sticky\" style."},{"name":"overflowScrollingTouch","type":"boolean","optional":true,"description":"Composition due to association with an element with a \"overflow-scrolling: touch\" style."},{"name":"stacking","type":"boolean","optional":true,"description":"Composition due to association with an element establishing a stacking context."},{"name":"overlap","type":"boolean","optional":true,"description":"Composition due to association with an element overlapping other composited elements."},{"name":"negativeZIndexChildren","type":"boolean","optional":true,"description":"Composition due to association with an element with descendants that have a negative z-index."},{"name":"transformWithCompositedDescendants","type":"boolean","optional":true,"description":"Composition due to association with an element with composited descendants."},{"name":"opacityWithCompositedDescendants","type":"boolean","optional":true,"description":"Composition due to association with an element with opacity applied and composited descendants."},{"name":"maskWithCompositedDescendants","type":"boolean","optional":true,"description":"Composition due to association with a masked element and composited descendants."},{"name":"reflectionWithCompositedDescendants","type":"boolean","optional":true,"description":"Composition due to association with an element with a reflection and composited descendants."},{"name":"filterWithCompositedDescendants","type":"boolean","optional":true,"description":"Composition due to association with an element with CSS filters applied and composited descendants."},{"name":"blendingWithCompositedDescendants","type":"boolean","optional":true,"description":"Composition due to association with an element with CSS blending applied and composited descendants."},{"name":"perspective","type":"boolean","optional":true,"description":"Composition due to association with an element with perspective applied."},{"name":"preserve3D","type":"boolean","optional":true,"description":"Composition due to association with an element with a \"transform-style: preserve-3d\" style."},{"name":"root","type":"boolean","optional":true,"description":"Composition due to association with the root element."}]}

  return LayerTree

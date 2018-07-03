class SlideInAnimation

  constructor: (@elm, @name = '') ->
    return true if @name.indexOf('slideIn') is -1
    @init()

  init: ->
    { elm } = @
    sequence = []
    sequence.push
      e: elm
      p:
        visibility: 'hidden'
      o:
        visibility: 'hidden'
        duration: 0
    Velocity.RunSequence sequence

  run: ->
    { innerWidth } = window
    { elm } = @
    _width = elm.offsetWidth
    _childWidth = parseInt elm.children[0].offsetWidth
    #console.log(_width, innerWidth)
    new Promise (resolve) ->
      sequence = []
      sequence.push
        e: elm
        p: { translateX: [_width, 'easeInCubic', -_childWidth] }
        o:
          duration: 2000
          visibility: 'visible'
          complete: () ->
            Velocity elm, { duration: 50, opacity: 0 }
      Velocity.RunSequence sequence

export default SlideInAnimation

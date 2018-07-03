class FadeInAnimation

  constructor: (@elm, @name = '') ->
    return true if @name.indexOf('fadeIn') is -1
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
    { elm } = @
    new Promise (resolve) ->
      sequence = []
      sequence.push
        e: elm
        p:
          translateY: [ 0 , 'easeOutSine', 80 ]
          opacity: [ 1 , 'easeOutSine', 0 ]
        o:
          duration: 1000
          visibility: 'visible'
      Velocity.RunSequence sequence

export default FadeInAnimation

class ChoiceAnimation

  constructor: (@elm) ->

  init: ->
    { elm } = @
    @question = elm.querySelector '[data-animation="question"]'
    @title    = elm.querySelector '[data-animation="title"]'
    @choice   = elm.querySelectorAll '[data-animation="choice"]'

    opacityArray = []
    @choice.forEach (elm) -> opacityArray.push elm
    sequence = []
    sequence.push
      e: opacityArray
      p: { opacity: 0 }
      o:
        visibility: 'hidden'
        duration: 0
    sequence.push
      e: [@question, @title]
      p: { visibility: 'hidden' }
      o:
        visibility: 'hidden'
        duration: 0
    Velocity.RunSequence sequence

  run: ->
    @init()
    { elm, question, title, choice } = @
    Velocity.RegisterUI 'questionEffect',
      defaultDuration: 700
      calls: [
        [ { translateY: '-20%' }, 0.4, { easing: 'easeOutCubic' } ]
        [ { translateY: '-20%' }, 0.2 ]
        [ { translateY: 0 }, 0.4, { easing: 'spring' } ]
      ]
    sequence = []
    sequence.push
      e: elm
      p: 'fadeIn'
      o:
        delay: 100
        duration: 500
    sequence.push
      e: question
      p: 'questionEffect'
      o:
        delay: 200
        visibility: 'visible'
    sequence.push
      e: title
      p: { width: [ '100%', 'easeOutSine', '0%' ]}
      o:
        delay: 400
        duration: 500
        visibility: 'visible'

    choice.forEach (_choice, index) ->
      sequence.push
        e: _choice
        p:
          opacity: 1
          translateY: [ '0%', [.43,1.4,.95,1.16], '15%' ]
        o:
          delay: 500
          duration: 200
          visibility: 'visible'
          sequenceQueue: false

    Velocity.RunSequence sequence

  stop: ->
    { elm } = @
    Velocity elm, 'fadeOut', 300

export default ChoiceAnimation

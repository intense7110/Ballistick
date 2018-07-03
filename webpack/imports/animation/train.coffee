class TrainAnimation

  constructor: (@elm, @name = '') ->
    return true if @name.indexOf('train') is -1
    @$train  = @elm.querySelectorAll '[data-name="train"]'

    @init()

  init: ->
    { $train } = @
    elmArray = [ @elm ]
    sequence = []
    $train.forEach (_elm, index) ->
      elmArray.push _elm.querySelector '[data-name="text"]'
      elmArray.push _elm.querySelector '[data-name="images"]'
    sequence.push
      e: elmArray
      p:
        visibility: 'hidden'
      o:
        visibility: 'hidden'
        duration: 0
    Velocity.RunSequence sequence

  run: ->
    { elm, $train } = @
    new Promise (resolve) ->
      sequence = []
      sequence.push
        e: elm
        p: { opacity: [1, 'easeInCubic', 0]}
        o:
          duration: 400
          visibility: 'visible'
          complete: ->
            elm.style.visibility = ''
      $train.forEach (_elm, index) ->
        _text   = _elm.querySelector '[data-name="text"]'
        _images = _elm.querySelector '[data-name="images"]'
        _imagesRect = _images.getBoundingClientRect()
        if window.innerWidth > 640
          runOpt = { bottom: [0, 'linear', "-#{_imagesRect.height}px"] }
          trainDuration = _imagesRect.height * 1.5
        else
          runOpt = { right: ['0%', 'linear', "-#{_imagesRect.width}px"] }
          trainDuration = _imagesRect.width * 1.5
        sequence.push
          e: _images
          p: runOpt
          o:
            sequenceQueue: false
            delay: 400
            duration: trainDuration
            visibility: 'visible'
            complete: ->
              _images.style.bottom = ''
              _images.style.right = ''
              _images.style.visibility = ''
              if $train.length is index + 1
                resolve()
        sequence.push
          e: _text
          p:
            opacity: [1, 'linear', 0]
          o:
            sequenceQueue: false
            delay: 100
            duration: 300
            visibility: 'visible'
            complete: ->
              _text.style.opacity = ''
              _text.style.visibility = ''

      Velocity.RunSequence sequence

export default TrainAnimation

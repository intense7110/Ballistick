class LeadAnimation

  constructor: (@elm, @name = '') ->
    return true if @name.indexOf('lead') is -1
    @$item = @elm.querySelectorAll '[data-name="lead-item"]'
    @$line = @elm.querySelectorAll '[data-name="lead-line"]'
    @$text = @elm.querySelectorAll '[data-name="lead-txt-wrap"]'
    @init()

  init: ->
    { $line, $text } = @
    elmArray = []
    sequence = []
    $line.forEach (elm) -> elmArray.push elm
    $text.forEach (elm) -> elmArray.push elm
    sequence.push
      e: elmArray
      p:
        visibility: 'hidden'
      o:
        visibility: 'hidden'
        duration: 0
    Velocity.RunSequence sequence

  run: ->
    { $item } = @
    new Promise (resolve) ->
      $item.forEach (_elm, index) ->
        sequence = []
        _line  = _elm.querySelector '[data-name="lead-line"]'
        _text  = _elm.querySelector '[data-name="lead-txt-wrap"]'
        _width = parseInt getComputedStyle(_text).width
        _elm.style.width = "#{_width}px"
        sequence.push
          e: _line
          p: {width: ['100%', 'easeInCubic', '0%']}
          o:
            delay: 50 * index
            duration: 500
            visibility: 'visible'
        sequence.push
          e: _text
          p:
            width: ['100%', 'easeInCubic', '0%']
          o:
            delay: 50 * index + 300
            duration: 500
            visibility: 'visible'
            sequenceQueue: false
            complete: ->
              _line.style.width = ''
              _line.style.visibility = ''
              _elm.style.width = ''
              _text.style.width = ''
              if $item.length is index + 1
                resolve()
        Velocity.RunSequence sequence

export default LeadAnimation

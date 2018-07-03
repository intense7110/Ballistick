class CopyAnimation

  constructor: (@elm, @name = '') ->
    return true if @name.indexOf('copy') is -1
    @$line    = @elm.querySelector '[data-name="copy-line"]'
    @$imgWrap = @elm.querySelector '[data-name="copy-img-wrap"]'
    @$img     = @elm.querySelector '[data-name="copy-img"]'
    @init()

  init: ->
    sequence = []
    sequence.push
      e: @$imgWrap
      p:
        visibility: 'hidden'
      o:
        visibility: 'hidden'
        duration: 0
    Velocity.RunSequence sequence

  run: ->
    { $line, $imgWrap, $img } = @
    sequence = []
    new Promise (resolve) ->
      sequence.push
        e: $line
        p:{ width: ['100%', 'easeInCubic', '0%'] }
        o:
          duration: 500
          visibility: 'visible'
          begin: ->
            $line.style.left = 0
            $line.style.right = 'auto'
      sequence.push
        e: $line
        p: { width: ['0%', 'easeInCubic'] }
        o:
          delay: 300
          duration: 500
          begin: ->
            $line.style.left = ''
            $line.style.right = ''
          complete: ->
            $line.style.width = ''
            $line.style.visibility = ''
      sequence.push
        e: $imgWrap
        p: { width: ['100%', 'easeInCubic', '0%'] }
        o:
          delay: 50
          duration: 500
          visibility: ''
          sequenceQueue: false
          begin: ->
            _width = window.getComputedStyle($img).width
            $img.style.width = _width
          complete: ->
            $img.style.width = ''
            $imgWrap.style.width = ''
            resolve()
      Velocity.RunSequence sequence

export default CopyAnimation

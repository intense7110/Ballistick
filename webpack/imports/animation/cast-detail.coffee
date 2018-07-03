class CastAnimation

  constructor: (@elm, @name) ->
    return true unless @name is 'cast-detail'
    @$imgWrap  = @elm.querySelector '[data-name="cast-img"]'
    @$img = if @$imgWrap
      @$imgWrap.querySelectorAll 'img'
    else
      null
    @init()

  init: ->
    { $imgWrap } = @
    elmArray = [ $imgWrap ]
    sequence = []
    sequence.push
      e: elmArray
      p:
        visibility: 'hidden'
      o:
        visibility: 'hidden'
        duration: 0
    Velocity.RunSequence sequence

  run: ->
    { elm, $imgWrap, $img } = @
    sequence = []
    _width   = parseInt getComputedStyle($imgWrap).width
    sequence.push
      e: $imgWrap
      p:
        width: [_width, 'easeInCubic', 0]
      o:
        duration: 400
        visibility: 'visible'
        begin: ->
          $img.forEach (_elm) ->
            _elm.style.width = "#{_width}px"
        complete: ->
          $img.forEach (_elm) ->
            _elm.style.width = ''
          $imgWrap.style.visibility = ''
          $imgWrap.style.width = ''
          elm.classList.add 'is-end-animation'

    Velocity.RunSequence sequence

export default CastAnimation

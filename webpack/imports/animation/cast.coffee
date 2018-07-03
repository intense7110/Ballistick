class CastAnimation

  constructor: (@elm, @name) ->
    return true unless @name is 'cast'
    @$textWrap = @elm.querySelector '[data-name="cast-text-wrap"]'
    @$imgWrap  = @elm.querySelector '[data-name="cast-img"]'
    @$mask     = @$textWrap.querySelector '[data-name="cast-mask"]'
    @$text     = @$textWrap.querySelector '[data-name="cast-text"]'
    @$button   = @elm.querySelector '[data-name="cast-button"]'
    @$img = if @$imgWrap
      @$imgWrap.querySelectorAll 'img'
    else
      null
    @init()

  init: ->
    { $textWrap, $imgWrap, $button } = @
    elmArray = [ $textWrap ]
    if $imgWrap
      elmArray.push $imgWrap
    if $button
      elmArray.push $button
    sequence = []
    sequence.push
      e: elmArray
      p:
        visibility: 'hidden'
      o:
        visibility: 'hidden'
        duration: 0
    Velocity.RunSequence sequence
    @$text.style.visibility = 'hidden'

  run: ->
    { elm, $textWrap, $mask, $text, $imgWrap, $img, $button } = @
    sequence = []
    textWrapStype = getComputedStyle $textWrap
    sequence.push
      e: $textWrap
      p: { width: [textWrapStype.width, 'easeInCubic', 0] }
      o:
        delay: 50
        duration: 400
        visibility: 'visible'
        begin: ->
          $textWrap.style.height = textWrapStype.height
    sequence.push
      e: $mask
      p: { width: ['100%', 'easeInCubic', '0%'] }
      o:
        duration: 400
        complete: ->
          $text.style.visibility = ''
    sequence.push
      e: $mask
      p: { translateX: ['100%', 'easeInCubic'] }
      o:
        duration: 400
        complete: ->
          $textWrap.style.width = ''
          $textWrap.style.height = ''
          $textWrap.style.visibility = ''
          $mask.style.width = ''
          $mask.style.transform = ''

    if $imgWrap isnt null
      sequence.push
        e: $imgWrap
        p:
          width: ['100%', 'easeInCubic', '0%']
        o:
          duration: 400
          visibility: 'visible'
          begin: ->
            _width = parseInt getComputedStyle($imgWrap).width
            $img.forEach (_elm) ->
              _elm.style.width = "#{_width}px"
          complete: ->
            $img.forEach (_elm) ->
              _elm.style.width = ''
            $imgWrap.style.visibility = ''
            elm.classList.add 'is-end-animation'
    if $button isnt null
      sequence.push
        e: $button
        p:
          translateX: ['0%', 'easeInCubic', '-20%']
          opacity: [1, 0]
        o:
          duration: 150
          visibility: 'visible'
          complete: ->
            elm.classList.add 'is-end-animation'

    Velocity.RunSequence sequence

export default CastAnimation

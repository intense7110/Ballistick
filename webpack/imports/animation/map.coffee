class MapAnimation

  constructor: (@elm, @name = '') ->
    return true if @name.indexOf('map') is -1
    @$plan = @elm.querySelectorAll '[data-name="plan"]'
    @init()

  init: ->
    { $plan } = @
    elmArray = []
    sequence = []
    $plan.forEach (elm) ->
      elmArray.push elm.querySelector '[data-name="point"]'
      elmArray.push elm.querySelector '[data-name="button"]'
      elmArray.push elm.querySelector '[data-name="line"]'
    sequence.push
      e: elmArray
      p: { visibility: 'hidden' }
      o:
        visibility: 'hidden'
        duration: 0
    Velocity.RunSequence sequence

  run: ->
    { $plan } = @
    mobile = window.innerWidth < 640
    new Promise (resolve) ->
      $plan.forEach (_elm, index) ->
        sequence = []
        _point      = _elm.querySelector '[data-name="point"]'
        _button     = _elm.querySelector '[data-name="button"]'
        _buttonLink = _button.querySelector 'a'
        _buttonRect = window.getComputedStyle _button
        _line       = _elm.querySelector '[data-name="line"]'
        _lineImages = _line.querySelectorAll 'img'
        _lineData   = _line.dataset.vector
        _lineStyle  = window.getComputedStyle(_line)
        _delay      = if mobile then 900 * index else _elm.dataset.delay or 0
        _lineAction = if _lineData
          _lineObj = JSON.parse _lineData
          if window.innerWidth > 640
            if _lineObj.pc is 'vertical'
              height: [_lineStyle.height, 'easeInCubic', 0]
            else
              width: [_lineStyle.width, 'easeInCubic', 0]
          else
            if _lineObj.mobile is 'vertical'
              height: [_lineStyle.height, 'easeInCubic', 0]
            else
              width: [_lineStyle.width, 'easeInCubic', 0]
        else
          width: [_lineStyle.width, 'easeInCubic', 0]
        sequence.push
          e: _point
          p: { opacity: [1, 'easeInCubic', 0] }
          o:
            delay: _delay
            duration: 200
            visibility: 'visible'
            complete: ->
              _point.style.opacity = ''
              _point.style.visibility = ''
        sequence.push
          e: _line
          p: _lineAction
          o:
            duration: 400
            visibility: 'visible'
            begin: ->
              _lineImages.forEach (_elm) ->
                _elm.style.width = _lineStyle.width
            complete: ->
              _line.style.width = ''
              _line.style.height = ''
              _lineImages.forEach (_elm) ->
                _elm.style.width = ''
        sequence.push
          e: _button
          p: { width: [_buttonRect.width, 'easeInQuad', 0] }
          o:
            duration: 400
            visibility: 'visible'
            begin: ->
              _buttonLink.style.width = _buttonRect.width
            complete: ->
              _button.style.width = ''
              _button.style.visibility = ''
              _buttonLink.style.width = ''
              _buttonLink.style.visibility = ''
              if $plan.length is index + 1
                resolve()
        Velocity.RunSequence sequence

export default MapAnimation

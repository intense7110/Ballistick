class FixedGo2Top

  triggerElm: '.js-fixed-go2top-trigger'

  constructor: (@elm) ->
    @elmView    = window.pageYOffset < 100
    @triggerElm = document.querySelector @triggerElm
    window.addEventListener 'load', @scroll
    window.addEventListener 'resize', @scroll
    window.addEventListener 'scroll', @scroll

  # ヘッダー追従のトリガー
  scroll: (event) =>
    { elm, triggerElm, elmView } = @
    { top }   = triggerElm.getBoundingClientRect()
    _trigger  = window.innerHeight - top
    _scrollY  = window.pageYOffset
    is_mobile = window.innerWidth <= 750
    _scrollPoint = window.innerHeight
    unless is_mobile
      _scrollPoint = 100
      if _trigger > 0
        elm.style.bottom = "#{_trigger}px"
      else
        elm.style.bottom = ''
    else
      elm.style.bottom = ''

    if _scrollY > _scrollPoint and !elmView
      @elmView = true
      Velocity elm, 'fadeIn',
        queue: false
    else if _scrollY <= _scrollPoint and elmView
      @elmView = false
      Velocity elm,
        opacity: 0
      ,
        display: 'none'
        queue: false

export default FixedGo2Top

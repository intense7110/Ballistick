class FixedSubmit

  triggerElm: '.js-fixed-container'

  constructor: (@elm) ->
    @elmView    = window.pageYOffset < 100
    @triggerElm = document.querySelector @triggerElm
    window.addEventListener 'load', @scroll
    window.addEventListener 'resize', @scroll
    window.addEventListener 'scroll', @scroll

  # ヘッダー追従のトリガー
  scroll: (event) =>
    { elm, triggerElm, elmView } = @
    { top, height }   = triggerElm.getBoundingClientRect()
    is_mobile = window.innerWidth <= 750
    winHeight = window.innerHeight
    unless is_mobile
      return true
    _trigger  = (winHeight * 0.7) - top
    _bottomTrigger = height - winHeight + top

    if _trigger > 0 and _bottomTrigger > 0 and !elmView
      @elmView = true
      elm.style.position = 'fixed'
      Velocity elm,
        translateY: [0, 'easeInCubic', 100]
      ,
        display: 'block'
        queue: false
    else if _trigger <= 0 and elmView
      @elmView = false
      elm.style.display = 'none'
    else if _bottomTrigger <= 0 and elmView
      @elmView = false
      elm.style.position = ''

export default FixedSubmit

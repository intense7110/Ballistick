# ヘッダー追従
class FixedHeader

  fixedClass: 'is-fixed'
  html      : 'html'

  constructor: (@elm) ->
    @IF_VIEW = false
    @html    = document.querySelector @html
    @body    = document.body

    window.addEventListener 'load', @scroll
    window.addEventListener 'resize', @scroll
    window.addEventListener 'scroll', @scroll

  # ヘッダー追従のトリガー
  scroll: (event) =>
    { elm, fixedClass, html, body } = @
    rect = elm.getBoundingClientRect()
    scrollY = window.pageYOffset
    _trigger = rect.height - scrollY
    if _trigger < 0 and not @IF_VIEW
      elm.classList.add fixedClass
      body.style.marginTop = "#{rect.height}px"
      Velocity elm,
        translateY: [ 0 , 'easeInQuad', -100 ]
      ,
        duration: 400
      @IF_VIEW = true
    else if _trigger >= 0 and @IF_VIEW
      elm.classList.remove fixedClass
      body.style.marginTop = ''
      @IF_VIEW = false

export default FixedHeader

class Menu
  # スマホメニューの表示非表示
  fixedClass: 'is-fixed'
  openClass : 'is-menu-opened'

  constructor: (@elm) ->
    @html = document.querySelector 'html'
    @body = document.body
    @elm.addEventListener 'click', @click

  click: =>
    { html, body, openClass } = @
    if html.classList.contains openClass
      html.classList.remove openClass
      # html.style.overflow = ''
      # html.style.height = ''
      # body.style.overflow = ''
      # body.style.height = ''
      scrollTo 0, @scroll
    else
      @scroll = window.pageYOffset
      html.classList.add openClass
      # html.style.overflow = 'hidden'
      # html.style.height = '100%'
      # body.style.overflow = 'hidden'
      # body.style.height = '100%'


export default Menu

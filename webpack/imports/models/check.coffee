class Check

  maskStyle =
    'display'            : 'none'
    'opacity'            : 0.7
    'position'           : 'absolute'
    'top'                : '0'
    'left'               : '0'
    'z-index'            : 100000
    'width'              : '100%'
    'background-position': 'center top'
    'background-repeat'  : 'no-repeat'
    'background-size'    : 'contain'

  buttonAttr =
    'type' : 'button'
    'value': 'Checkする'
  buttonStyle =
    'position': 'fixed'
    'bottom'  : '33px'
    'right'   : '10px'
    'z-index' : 100000

  opacityAttr =
    'type': 'range'
    'min' : '0'
    'max' : '100'
  opacityStyle =
    'position': 'fixed'
    'bottom'  : '11px'
    'right'   : '10px'
    'z-index' : 100000

  constructor: () ->
    @body = document.body
    @img = new Image()
    @imgPath = location.href.split("/").reverse().slice(1).reverse().join("/") + "/demo.png"
    @img.src = @imgPath
    @img.addEventListener 'load', @init

  init: =>
    mask    = document.createElement 'div'
    button  = document.createElement 'input'
    opacity = document.createElement 'input'
    maskStyle['height'] = "#{@img.height}px"
    maskStyle['background-image'] = "url(#{@imgPath})"
    @setAttributeFn buttonAttr, button
    @setAttributeFn opacityAttr, opacity
    @setCssFn maskStyle, mask
    @setCssFn buttonStyle, button
    @setCssFn opacityStyle, opacity

    button.addEventListener 'click', ->
      val = if @value is 'Checkする' then 'Maskを解除' else 'Checkする'
      show = if @value is 'Checkする' then 'block' else 'none'
      @value = val
      mask.style.display = show

    opacity.addEventListener 'change', ->
      val = @value / 100
      mask.style.opacity = val

    @body.appendChild mask
    @body.appendChild button
    @body.appendChild opacity

  setAttributeFn: (array, elm) ->
    for attr, value of array
      elm.setAttribute attr, value

  setCssFn: (array, elm) ->
    for styles, value of array
      elm.style.setProperty styles, value


export default Check

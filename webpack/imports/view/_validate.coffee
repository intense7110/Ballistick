class Validate

  constructor: (@elm) ->
    @value = @elm.value
    unless @value
      @elm.style.color = '#bababa'
    @elm.addEventListener 'change', @onChange

  onChange: (event) =>
    { elm } = @
    color = if elm.value then '' else '#bababa'
    elm.style.color = color

export default Validate

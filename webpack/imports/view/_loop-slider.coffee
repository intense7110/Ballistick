class LoopSlider

  mainSelector: '.js-loop-slider-mein'
  subSelector : '.js-loop-slider-sub'


  constructor: (@elm) ->
    @$elm  = $ @elm
    @$main = @$elm.find @mainSelector
    @$sub  = @$elm.find @subSelector

    @$main.slick
      dots: false
      arrows: false
      swipe: false
      adaptiveHeight: true
      variableWidth: true

    @$sub.slick
      dots: false
      arrows: false
      swipe: false
      adaptiveHeight: true
      variableWidth: true
      initialSlide: 6

    setInterval =>
      { $main, $sub } = @
      $main.slick 'slickNext'
      $sub.slick 'slickNext'
    , 1500


export default LoopSlider

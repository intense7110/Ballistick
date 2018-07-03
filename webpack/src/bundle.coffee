import Anchor from 'view/anchor'
import Modal from 'view/modal'
# import Menu from 'view/menu'
# import Tab from 'view/tab'
# import Slider from 'view/slider'
# import LoopSlider from 'view/loop-slider'
# import FixedGo2Top from 'view/fixed-go2top'
# import Validate from 'view/validate'
# import FixedSubmit from 'view/fixed-submit'

# multiple new class
newClass = (className, elm, opts) ->
  elmArr = document.querySelectorAll elm
  Array.from elmArr, (_elm) ->
    if opts
      new className _elm, opts
    else
      new className _elm

window.addEventListener 'DOMContentLoaded', ->
  newClassArray = [
    [ Anchor, 'a[href^="#"]' ]
    # [ Tab, '.js-tab']
    # [ Slider, '.js-slider' ]
    # [ LoopSlider, '.js-loop-slider']
    # [ FixedGo2Top, '.js-fixed-go2top' ]
    # [ Validate, '.js-validate' ]
    # [ FixedSubmit, '.js-search-submit']
  ]
  newClassArray.forEach (arr) ->
    newClass.apply @, arr

  new Modal

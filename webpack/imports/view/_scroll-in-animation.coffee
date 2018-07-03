# スクロールアニメーション
import TrainAnimation from 'animation/train'
import FadeInAnimation from 'animation/fade-in'
import SlideInAnimation from 'animation/slide-in'
import MapAnimation from 'animation/map'

class ScrollInAnimation

  constructor: (@elm) ->
    @name    = @elm.dataset.animeType
    @train   = new TrainAnimation @elm, @name
    @fadeIn  = new FadeInAnimation @elm, @name
    @slideIn = new SlideInAnimation @elm, @name
    @map     = new MapAnimation @elm, @name
    @IF_VIEW = true
    window.addEventListener 'load', @reset
    window.addEventListener 'resize', @reset
    window.addEventListener 'scroll', @scroll
    @reset()

  # スクロールした時のアニメーショントリガー
  scroll: =>
    return unless @IF_SCROLL
    rect     = @elm.getBoundingClientRect()
    _trigger = rect.top - (@height * 0.9)
    if _trigger < 0 and @IF_VIEW
      @IF_VIEW = false
    else
      return true
    @action()

  # アニメーションのリセット関数
  reset: (event = { type: 'none' }) =>
    @height = window.innerHeight
    if event.type is 'load'
      @IF_SCROLL = true
      @scroll()

  # アニメーションの選定
  action: ->
    @elm.classList.add 'is-go-animation'
    switch @name
      when 'train' then @train.run()
      when 'fadeIn' then @fadeIn.run()
      when 'slideIn' then @slideIn.run()
      when 'map' then @map.run()
      # when 'lead' then @lead.run()
      # when 'cast' then @cast.run()
      # when 'cast-detail' then @castDetail.run()
      # when 'copy-lead'
      #   await @copy.run()
      #   await @sleep 200
      #   @lead.run()

  sleep: (ms) ->
    new Promise (resolve) ->
      setTimeout resolve, ms

export default ScrollInAnimation

{ deepAssign } = VENDORS

class Anchor

  defOpts =
    duration: 600
    easing  : 'easeOutQuad'
    offset  : 0

  constructor: (@elm, opts = {}) ->
    { @duration, @easing, @offset } = deepAssign {}, defOpts, opts
    @elm.addEventListener 'click', @onClicked

  onClicked: (event) =>
    { elm } = @
    href       = elm.getAttribute 'href'
    targetLink = elm.href
    targetHash = elm.dataset.hash
    nowHash    = location.hash
    nowHref    = location.href.replace nowHash, ''
    unless href.indexOf('#') is 0
      if targetLink is nowHref
        href = targetHash
      else
        $elm.href = targetLink + targetHash
        return true
    return if href.length is 0
    event.preventDefault()
    _elm = if href is '#' then 'html' else href
    @scroll _elm

  scroll: (_elm) ->
    _elm = document.querySelector _elm
    return true unless _elm
    Velocity _elm, 'stop'
    Velocity _elm, 'scroll',
      duration: @duration
      easing  : @easing
      offset  : @offset

export default Anchor

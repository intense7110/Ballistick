{ DoT } = VENDORS

class Template

  constructor: (@elm) ->
    addHtml  = @elm.querySelector '.js-template-add'
    tmplObj  = @elm.querySelector '.js-template-html'
    tmplHtml = tmplObj.innerHTML
    tmpl     = DoT.template tmplHtml
    fetch '/scripts/news.json',
      credentials: 'same-origin'
      headers    : new Headers
        'X_REQUESTED_WITH': 'XMLHttpRequest'
    .then (res) ->
      res.json()
    .then (data) ->
      addHtml.innerHTML = tmpl data

export default Template

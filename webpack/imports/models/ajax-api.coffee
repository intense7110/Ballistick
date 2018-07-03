class AjaxAPI

  defOpts =
    url      : null
    dataType : 'json'

  constructor: (Opts = {}) ->
    @opts = _.defaults Opts, defOpts

  run: (caseOpts = {}) ->
    opts = _.defaultsDeep caseOpts, @opts
    dfd  = $.Deferred()
    $.ajax opts
    .done (data) ->
      dfd.resolve data
    .fail (data) ->
      dfd.reject data
    dfd.promise()

export default AjaxAPI

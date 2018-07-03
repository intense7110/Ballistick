import 'babel-polyfill/dist/polyfill.min'
import 'whatwg-fetch'
import 'custom-event-polyfill'
import 'velocity-animate/velocity.min'
# import $ from 'jquery'
import deepAssign from 'deep-assign'

if typeof VENDORS isnt 'undefined'
  throw new Error 'namespace "VENDORS" is already exists.'

# window.jQuery = window.$ = $

window.VENDORS = {}
VENDORS.deepAssign = deepAssign

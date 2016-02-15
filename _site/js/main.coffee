###
  Hey so you really lookin at this?
  http://goo.gl/xit9RA
  :)
###
do (jQuery) ->
  jQuery('document').ready ->
    'use strict'
    # such autohide
    jQuery('.navbar.autohide').autoHidingNavbar()
    jQuery('li.disabled a').click (e) ->
      e.preventDefault()
    return
  return
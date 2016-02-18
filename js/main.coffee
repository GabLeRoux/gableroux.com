###
  Hey so you really lookin at this?
  http://goo.gl/xit9RA
  :)
###
do (jQuery) ->

  setRandomHeader = ->
    headersCount = 7
    randVal = Math.floor(Math.random() * headersCount)
    picturePath = "/images/layout/background-#{randVal}.jpg"
    console.log "Loaded random header #{picturePath}"
    jQuery('header.site-header').css('background-image', "url('#{picturePath}')")

  preventDisabledNavigationScroll = ->
    jQuery('li.disabled a').click (e) ->
      e.preventDefault()

  jQuery('document').ready ->
    'use strict'
    # such autohide
    jQuery('.navbar.autohide').autoHidingNavbar()
    preventDisabledNavigationScroll()
    setRandomHeader()
    return

  return
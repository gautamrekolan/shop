# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('.slideshow').cycle({
    fx: 'fade',
    pause: 1,
    delay: -100
    })
  $('.cart').hide()
  $('.cart_box').hover(
    -> $('.cart').slideDown('fast')
    -> $('.cart').slideUp('fast')
  )
  $('.flash').click(
    -> $('.flash').fadeOut('slow')
  )
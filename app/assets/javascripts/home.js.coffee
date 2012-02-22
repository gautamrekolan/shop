# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

  cart = $('.cart').hide()
  $('.cart_box').hover(
    -> cart.slideDown(200)
    -> cart.slideUp(200)
  )
  $('.flash').delay(2000).fadeOut(200)

  $('.pop_image').click(
    -> $(this).fadeOut(200)
  )

  $('.slideshow').cycle
    fx: 'fade',
    pause: 1,
    delay: 0

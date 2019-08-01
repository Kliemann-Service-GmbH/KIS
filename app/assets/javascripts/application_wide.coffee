
# Fix: FontAwesome Turbolinks symbole not shown
# https://michael.minton.io/2018/01/using-font-awesome-5-with-rails-5-turbolinks.html
$(document).on "turbolinks:load", ->
  FontAwesome.dom.i2svg()

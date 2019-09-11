# $(document).on "turbolinks:load", ->
#   alert "page has loaded!"

$ ->
  $(".copy_row").click (e) ->
    console.log ">>>"
    e.preventDefault()

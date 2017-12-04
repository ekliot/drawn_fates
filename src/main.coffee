app = window.App = {}

sleep = ( ms ) ->
  new Promise ( resolve ) ->
    window.setTimeout resolve, ms

load_cards = () ->
  # return an array each card with its text and a path to its image

window.onload = ->
  app.cloth = new Cloth load_cards()

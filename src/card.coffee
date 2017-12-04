class Card
  constructor: (@img, @text, @alt_text) ->
    @reversed = false
    @fresh = true

  render: ( target ) ->
    # given a target div, animate this card's appearance
    # if @reversed then render @img upside down
    # also, implement how its text gets buffered
    #   - either a hidden div that gets revealed on mouseover
    #   - or a div is dynamically filled with this object's contextual text

  flip: () ->
    @reverse = !@reverse
    return this

  kill: ( grave ) ->
    if @fresh then grave.push( this.flip() )

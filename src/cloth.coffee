class Cloth

  constructor: ( @deck, @hand_divs ) ->
    @grave = []
    @hand = @parse @hand_divs

  parse: ( divs ) ->
    # read in the divs that represent the sequential hand, and return an array of objects
    # TODO this should be returning a Hand object

  draw: () ->
    # kill each card in @hand
    # pop @hand.size cards from the @deck and push them to @hand
    # render each card in @hand

  recall: () ->
    # for each fresh card in the grave:
    #   unfresh it
    #   flip it
    #   return it to the deck
    # then, shuffle the deck

  done?: () ->
    return @deck.size is 0

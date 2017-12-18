class Cloth
  constructor: ( @cloth, @deck ) ->
    @grave = []
    @hand  = ({ div: slot, card: null } for slot in $( "#Cloth > .slot" ))
    @wiping = false
    @done = false

  draw: () ->
    # don't do repeat calls if already animating, or if the deck is exhausted
    if @wiping or @done
      return

    # MAKE SURE THE SCREEN IS BLANK WHEN LOADING A NEW HAND
    unless @cloth.css( "display" ) is "none"
      @wipe()

    # don't do anything while animating!
    while @wiping
      await sleep( 200 )

    # kill each card in @hand
    for slot in @hand
      # if the slot has a card, kill it
      if slot.card? then @grave.push slot.card
      # nullify
      slot.card = null

    # if the deck is empty after purge, reshuffle the fresh corpses
    if @is_done() then @recall()

    # if the deck is still empty after a recall, there is nothing left to do
    if @is_done()
      @done = true
      return

    # pop @hand.size cards from the @deck and push them to @hand
    buffer = (@deck.shift() for slot in @hand)
    # sort the buffer by date before shifting it to the hand
    buffer.sort( (a, b) ->
      date_a = if a.reversed then a.date_rev else a.date_def
      date_b = if b.reversed then b.date_rev else b.date_def
      return date_a - date_b
    )
    # shift the sorted cards into the hand
    slot.card = buffer.shift() for slot in @hand

    # render each card in @hand
    slot.card.load $(slot.div) for slot in @hand

    @wipe()

  wipe: ( dur = 1750 ) ->
    @wiping = true
    @cloth.slideToggle( dur, () =>
      @wiping = false
    )

  recall: () ->
    while @grave.length > 0
      card = @grave.pop()
      if card.fresh then @deck.push card.recall()
    shuffle( @deck )

  is_done: () ->
    return @deck.length is 0

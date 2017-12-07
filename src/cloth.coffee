class Cloth
  constructor: ( @cloth, @deck ) ->
    @grave = []
    @hand  = ({ div: slot, card: null } for slot in $( "#Cloth > .slot" ))
    @wiping = false

  draw: () ->
    console.log "DARW :: clear is #{@cloth.css( "display" ) is "none"}"
    unless @cloth.css( "display" ) is "none"
      @wipe()

    while @wiping
      await sleep( 200 )

    # kill each card in @hand
    for slot in @hand
      slot.card? grave.push( slot.card.kill() )

    console.log "grave after purge:"
    console.log @grave
    console.log "hand after purge:"
    console.log @hand

    # pop @hand.size cards from the @deck and push them to @hand
    slot.card = @deck.shift() for slot in @hand
    console.log "hand after draw:"
    console.log @hand

    # render each card in @hand
    slot.card.load $(slot.div) for slot in @hand

    @wipe()

  wipe: ( dur = 2000 ) ->
    @wiping = true
    # $('#Cloth').animate({ height: 'toggle'}, dur, "linear", () =>
    #   @wiping = false
    # )
    last = 0
    @cloth.animate(
      { height: 'toggle' },
      {
        duration: dur,
        step: ( n, t ) =>
          console.log "#{n-last}"
          last = n
          # console.log t
        complete: () =>
          @wiping = false
      }
    )

  clear: () ->
    #

  recall: () ->
    # for each fresh card in the grave:
    #   unfresh it
    #   flip it
    #   return it to the deck
    # then, shuffle the deck

  is_done: () ->
    return @deck.size is 0

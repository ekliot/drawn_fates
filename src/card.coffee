class Card
  constructor: ( card_opt ) ->
    @reversed = false # whether the card should be displayed reversed
    @fresh    = true  # whether the card has been shown before

    @name = card_opt.name
    @img  = card_opt.img

    @text_def = card_opt.text_def # the default card text
    @date_def = card_opt.date_def

    @text_rev = card_opt.text_rev # the reversed card text
    @date_rev = card_opt.date_rev

  load: ( target ) ->
    if @reversed
      text = @text_rev
      target.find( ".illu" ).addClass( "reverse" )
    else
      text = @text_def
      target.find( ".illu" ).removeClass( "reverse" )

    for p in text
      target.find( ".text" ).append( "<p>#{p}</p>" )

    target.find( ".illu" ).attr( "src", @img )
    target.find( ".name" ).attr( "src", "media/names/#{@name}.png" )

  flip: () ->
    @reversed = !@reversed
    console.log "FLIP"
    return this

  kill: () ->
    if @fresh then @flip()
    @fresh = false
    return this

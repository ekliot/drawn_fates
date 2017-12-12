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
      date = @date_rev
      target.find( ".illu" ).addClass( "reverse" )
    else
      text = @text_def
      date = @date_def
      target.find( ".illu" ).removeClass( "reverse" )

    text_div = target.find( ".text" )

    # text for the journal entry signature
    sign = ""
    switch @name
      when "asher"
        sign = "Asher"
        text_div.removeClass( "gustave" )
        text_div.removeClass( "cedrick" )
        text_div.addClass( "asher" )
      when "cedrick"
        sign = "Cedrick"
        text_div.removeClass( "asher" )
        text_div.removeClass( "gustave" )
        text_div.addClass( "cedrick" )
      when "gustave"
        sign = "Gus"
        text_div.removeClass( "asher" )
        text_div.removeClass( "cedrick" )
        text_div.addClass( "gustave" )

    text_div.html( "" )

    # TODO make a better date header!
    text_div.append( "<p class=\"date\">#{date.toDateString()}</p>" )

    for p in text
      text_div.append( "<p>#{p}</p>" )

    # TODO make a better signature!
    text_div.append( "<p class=\"sign\">  -- #{sign}</p>" )

    # set the card image src
    target.find( ".illu" ).attr( "src", @img )
    # set the nameplate image src
    target.find( ".name" ).attr( "src", "media/names/#{@name}.png" )

  # flip the card and return itself
  flip: () ->
    @reversed = !@reversed
    return this

  # this is called when the card is recalled from the graveyard
  # if it's the card's first time being recalled, then it rots and is flipped
  recall: () ->
    if @fresh
      @flip()
      @fresh = false
    return this

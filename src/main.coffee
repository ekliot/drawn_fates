app = window.App = {}

array_get = ( arr, idx ) ->
  arr.splice( idx, 1 )[0]

shuffle = (a) ->
  i = a.length
  while --i > 0
    j = ~~(Math.random() * (i + 1))
    t = a[j]
    a[j] = a[i]
    a[i] = t
  a

sleep = ( ms ) ->
  new Promise ( resolve ) ->
    window.setTimeout resolve, ms

load_deck = () ->
  deck = []

  cards_asher = [
    {
      img: "media/cards/fool.png"
      date_def: new Date( 2011, 9, 9, 17, 32 )
      text_def: [
        "Can’t believe I’m saying this, but I’m glad I didn’t blow off that first math class of freshman year. I didn’t give a shit… I mean, I still don’t, but I especially didn’t back then.",
        "But Dr. Reuven didn’t yell at me like the other teachers, he just... He got it, you know?",
        "He let me do my own thing for that state-required compulsory standardized education bullshit, calculus was just bean counting for me. He even offered me private tutoring for some grad-school level stuff, AND he had so much crazy deep knowledge on this abstract theology and mysticism.",
        "How awesome is that?",
        "Plus, he’s totally a <i>Lobster Johnson</i> fan, so he was on my side from the start."
      ]
      date_rev: new Date( 2011, 9, 9, 21, 14 )
      text_rev: [
        "But man, am I an idiot or just insanely lucky?",
        "Last year, I got to Dr. Reuven’s place for a number theory lecture a bit early and I walked in on him, getting high while chanting some mantras from an old book. If I didn’t know any better, I’d have called the psych ward.",
        "Instead, he gave me my first joint and we just talked about comic books the whole time. Now that I think of it, what was he up to when I got there, and…",
        "Is he getting stoned before every one of his classes?"
      ]
    },
    {
      img: "media/cards/devil.png"
      date_def: new Date( 2011, 9, 14, 17, 32 )
      text_def: [
        "I still surprise myself how good this gig I've got going is.",
        "Dr. Reuven actually asked me to help Gustave, that walking, grunting stereotype, out. He figured it’d build my character or some shit, let me play the role of mother hen in exchange for getting to skip class. How could I refuse a teacher <i>letting me skip class?</i>",
        "To Gus I’m the charitable supply for his eternal demand. But Gus, he’ll always just replay the same, “I got it in class but I just don’t get this question” until I cave and give him the answer.",
        "So I chew his food and swallow it for him.",
        "At least it gives me some rep with his crowd, they don’t bother me during lunch anymore.",
        "<i>And</i> he buys Reuven’s free weed from me, netting me a tidy 100% profit. Silver linings, right?"
      ]
      date_rev: new Date( 2011, 9, 14, 21, 14 )
      text_rev: [
        "For how little I see of Cedrick, I sure do manage to hear a lot of gossip about him. I guess it’s mostly from Gustave, though.",
        "He’d tell me how they used to be friends in middle school, had all the same classes and same friends and they’d all play Halo. Almost sounds sad about it, if he doesn’t always finish, \"but the dudes on the team, they’re my bros. Bros before hoes, yaknow?\"",
        "Whatever, man, I got away from all that middle school drama for a reason, I don’t want to get in the middle of whatever shitstorm comes out of that sewing circle."
      ]
    },
    {
      img: "media/cards/judgement.png"
      date_def: new Date( 2011, 10, 2, 17, 32 )
      text_def: [
        "Shit, am I an awful person?",
        "I <s>cheered</s> allowed Gus, that dick, to make fun of Cedrick after Rose rejected him. She rejected him as gracefully as that gorilla burned him, right in front of the whole school.",
        "That kid had some balls to ask her to the dance right there… The harder they fall, right?",
        "I mean, it felt good, I think?",
        "Gus would probably do the same to me if I gave him the chance… But I’d probably be able to laugh about it in a couple weeks, right?",
        "I hope Cedrick can too..."
      ]
      date_rev: new Date( 2011, 10, 3, 21, 14 )
      text_rev: [
        "Cedrick barely lasted the day. Each one of Rose’s gaggle of girls came up to him and personally insulted him, in every single class.",
        "It was like, some weird inverted Kill Bill situation or something, where Bill gets killed over and over again by each of his mean girl hit squad. Except Cedrick is Bill, and he gets killed by some real scathing, uncalled for insults.",
        "Cedrick didn’t deserve this shit, but he should’ve seen it coming. Am I responsible, though, because I didn’t help <i>in spite of</i> seeing it coming?",
        "No, I can’t let myself think those things. Survival of the fittest and all that, I’m not losing face or letting my grades slip to help his dumb ass up."
      ]
    },
  ]

  for card in cards_asher
    card.name = "asher"
    deck.push( new Card card )

  cards_cedrick = [

  ]

  for card in cards_cedrick
    card.name = "cedrick"
    deck.push( new Card card )

  cards_gustave = [

  ]

  for card in cards_gustave
    card.name = "gustave"
    deck.push( new Card card )

  console.log "deck before shuffle:"
  console.log deck

  flipped = 0
  to_flip = deck.length // 2
  while flipped < to_flip
    sample_size = deck.length - flipped
    sample = array_get( deck, Math.floor(Math.random()*sample_size) )
    deck.push( sample.flip() )
    ++flipped

  deck = shuffle( deck )

  console.log "deck after shuffle:"
  console.log deck

  return deck

window.onload = ->
  app.cloth = new Cloth $( "#Cloth" ), load_deck()
  app.cloth.wipe( 0 )

  $( "#Draw" ).on( 'click', () ->
    app.cloth.draw()
  )

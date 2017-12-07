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
    { # ACT 1
      img: "media/cards/fool.png"
      date_def: new Date( 2013, 8, 9, 17, 32 )
      text_def: [
        "Can't believe I'm saying this, but I'm glad I didn't blow off that first math class of freshman year. I didn't give a shit... I mean, I still don't, but I especially didn't back then.",
        "But Dr. Reuven didn't yell at me like the other teachers, he just... He got it, you know?",
        "He let me do my own thing instead of that state-required compulsory standardized education bullshit, calculus was just bean counting for me. He even offered me private tutoring for some grad-school level stuff, AND he had so much crazy deep knowledge on this abstract theology and mysticism.",
        "How awesome is that?",
        "Plus, he's totally a <i>Lobster Johnson</i> fan, so he was on my side from the start."
      ]
      date_rev: new Date( 2013, 8, 9, 21, 14 )
      text_rev: [
        "But man, am I an idiot or just insanely lucky?",
        "Last year, I got to Dr. Reuven's place for a number theory lecture a bit early and I walked in on him, getting high while chanting some mantras from an old book. If I didn't know any better, I'd have called the psych ward.",
        "Instead, he gave me my first joint and we just talked about comic books the whole time. Now that I think of it, what was he up to when I got there, and...",
        "Is he getting stoned before every one of his classes?"
      ]
    },
    { # ACT 2
      img: "media/cards/devil.png"
      date_def: new Date( 2013, 8, 14, 17, 32 )
      text_def: [
        "I still surprise myself how good this gig I've got going is.",
        "Dr. Reuven actually asked me to help Gustave out, that walking, grunting stereotype. He figured it'd build my character or some shit, let me play the role of mother hen in exchange for getting to skip class. How could I refuse a teacher <i>letting me skip class?</i>",
        "To Gus, I'm the charitable supply for his eternal demand. But poor Gus, he'll always just repeat the same, \"I got it in class, I just don't get <i>this</i> question\" until I cave and give him the answer.",
        "So I chew his food and swallow it for him.",
        "At least it gives me some rep with his crowd, they don't bother me during lunch anymore.",
        "<i>And</i> he buys Reuven's free weed from me, netting me a tidy 100% profit. Silver linings, right?"
      ]
      date_rev: new Date( 2013, 8, 14, 21, 14 )
      text_rev: [
        "For how little I see of Cedrick, I sure do manage to hear a lot of gossip about him. I guess it's mostly from Gustave, though.",
        "He'd tell me how they used to be friends in middle school, had all the same classes and same friends and they'd all play Halo. Almost sounds sad about it, if he doesn't always finish, \"but the dudes on the team, they're my bros. Bros before hoes, yaknow?\"",
        "Whatever, man, I got away from all that middle school drama for a reason, I don't want to get in the middle of whatever shitstorm comes out of that sewing circle."
      ]
    },
    { # ACT 3
      img: "media/cards/judgement.png"
      date_def: new Date( 2013, 9, 2, 17, 32 )
      text_def: [
        "Shit, am I an awful person?",
        "I <s>cheered</s> allowed Gus, that dick, to make fun of Cedrick after Rose rejected him. She rejected him as gracefully as that gorilla burned him, right in front of the whole school before assembly.",
        "That kid had some balls to ask her to the dance right there... The harder they fall, right?",
        "I mean, it felt good, I think?",
        "Gus would probably do the same to me if I gave him the chance... But I'd probably also be able to laugh about it in a couple weeks, right?",
        "I hope Cedrick can too..."
      ]
      date_rev: new Date( 2013, 9, 3, 21, 14 )
      text_rev: [
        "Cedrick barely lasted the day. Each one of Rose's gaggle of girls came up to him and personally insulted him, in every single class.",
        "It was like, some weird inverted Kill Bill situation or something, where Bill gets killed over and over again by each of his mean girl hit squad. Except Cedrick is Bill, and he gets killed by some real scathing, uncalled for insults.",
        "Cedrick didn't deserve this shit, but he should've seen it coming. Am I responsible, though, because I didn't help <i>in spite of</i> seeing it coming?",
        "No, I can't let myself think those things. Survival of the fittest and all that, I'm not losing face or letting my grades slip to help his dumb ass up."
      ]
    },
  ]

  cards_cedrick = [
    { # ACT 1
      img: "media/cards/fool.png"
      date_def: new Date( 2013, 8, 8, 17, 32 )
      text_def: [
        "Tomorrow i'll be starting High School. As I write this, I am filled with an anxious eagerness. I've tried so hard to change my attitude this summer, really, and I hope that I have become less callous. With any luck they will have changed too. I fear that my disdain for the peers I will have to spend the next four years with was justified."
      ]
      date_rev: new Date( 2013, 8, 8, 21, 14 )
      text_rev: [
        "I've thought a lot about school over this summer. I am a corpse; tomorrow I must return to the grave. My peer's sadistic immaturity knows no bounds, and I fear it will only grow worse in High School. Our school system breeds malicious behavior and conformity. I must hold fast my sanity and individualism."
      ]
    },
    # { # ACT 2 }, { # ACT 3 }, { # ACT 4 },
    { # ACT 5
      img: "media/cards/world.png"
      date_def: new Date( 2013, 9, 4, 17, 32 )
      text_def: [
        "The strangest thing happened today... Rose asked me out. I couldn't believe it. At first I stood there like an idiot, saying nothing, then I just blurted out “OK”. What a moronic thing to say. Anyways, she had to go to class so we didn't get a chance to make plans.",
        "Something was strange, though, I'm not sure what. Don't get me wrong, I'm ecstatic about the whole thing but she seemed... different. Why the change of heart?"
      ]
      date_rev: new Date( 2013, 9, 2, 21, 14 )
      text_rev: [
        "God why am I so stupid. Idiot. Idiot.",
        "I finally worked up the courage to ask Rose out, of course she said no. Unfortunately, It wasn't so simple. She didn't just say no. Damn them, I thought she was different, you know? Shit. When I asked her, her stupid friend cracked up laughing, I wanted to knock her perfect teeth in."
      ]
    },
    { # ACT 6
      img: "media/cards/devil.png"
      date_def: new Date( 2013, 9, 6, 17, 32 )
      text_def: [
        "Rose asked me something weird today. She says Gustave and Asher found some old coin, and that it's super valuable or something. She thinks they don't know what it is and asked if I could 'get my hands on it.' I told her I could, I guess she wants to sell it or something. Anyways, I'll pinch it tomorrow in art class."
      ]
      date_rev: new Date( 2013, 9, 7, 21, 14 )
      text_rev: [
        "I got that coin Rose wanted. Those idiots were so busy throwing exacto knives at their paper mache houses they didn't notice me rummaging through their backpacks. It sure is weird looking. It looks old, really old, and it has symbols around the edges i've never seen before. I hope it was worth it, because if Gustave ever finds out he'll literally kill me."
      ]
    },
  ]

  cards_gustave = [
    {
      img: "media/cards/devil.png"
      date_def: new Date( 2013, 8, 9, 17, 32 )
      text_def: [
        "I am absolutely terrified of starting school this year. I mean it can't be that different from other years of school. I go to class, goof off a bit with my friends, have a big lunch, sleep during the rest of my classes, and hit the batting cages.",
        "I mean I gotta really step it up this year. College is right around the corner and scouts are going to be at every game. Not as many video games and junk food and more keeping my grades up and time in the cage."
      ]
      date_rev: new Date( 2013, 8, 14, 21, 14 )
      text_rev: [
        "As tough as it is to say I am going to sell off all my game consoles. I thought that with my new found resolve this year I would not fall into old habits.",
        "After the first day I got online and played shooters until two in the morning. ",
        "Getting rid of these things is for the best.",
        "Besides...It is really haunting to see CedricK there all the time. We used to play together constantly. The Iceman to my Goose, ya know? Now it just doesn't feel right."
      ]
    },
    {
      img: "media/cards/fool.png"
      date_def: new Date( 2013, 8, 10, 17, 32 )
      text_def: [
        "Despite my initial hesitations I had to be positive. This really felt like a time for me to reinvent myself, ya know. If I want to make the baseball team I better start practicing from now. The guys on the squad can't know I used to hang out with that weirdo CedricK. I mean we used to be friends when we were kids, but he is really not into sports or anything at all. Gotta keep up with the popular kids if I want to stay on top, you feel."
      ]
      date_rev: new Date( 2013, 8, 20, 21, 14 )
      text_rev: [
        "I gotta do well in this math class no matter what. I need to keep my grades up so that I can get a baseball scholarship for college. I am only a week and a half into the class and I'm already behind.",
        "That Asher guy seems to have an in with the creepy-ass math teacher. You know the guy with the name that sounds like a sandwich. Rueben or something? Whatever, I certainly don't want to see that guy in a diner that's for sure.",
        "Asher isn't really my kind of guy to chill with but his dealer sells him the best kush in the state."
      ]
    },
    {
      img: "media/cards/judgement.png"
      date_def: new Date( 2013, 9, 2, 17, 32 )
      text_def: [
        "The end justifies the means right?",
        "So Cedrick had been making eyes at this Rose chick from the start of the school year. Dude wasn't hiding it either.",
        "History class? <STARES>",
        "Literature class? <STARES>",
        "Lunch? YOU GUESSED IT!",
        "I mean this girl is way out of his league. I wouldn't even go after her.",
        "So here this guy goes and asks her out to the Halloween dance right before an assembly in front of everyone. WHAT?",
        "She (predictably) turned him down in the most polite way possible and I saw an opportunity. If got Cedric's goat a bit the rest of the guys on the baseball team would love it.",
        "So I roasted him a bit. Smacked his books out of his trembling hands and said he should try girls his own speed like snails.",
        "The guys loved it and will definitely invite me to their next rager."
      ]
      date_rev: new Date( 2013, 9, 4, 21, 14 )
      text_rev: [
        "I may have really messed up and I mean real bad.",
        "All I did was tease him a bit. Everyone knocks books out of kids hands but they don't mope around like Cedrick does.",
        "I see this guy in the halls and he just stares at me. I mean the kid can't hurt me. I am like twice his height and a stiff breeze can knock him down, but I feel scared.",
        "It's like he is plotting or something. I don't know what he has planned but I am afraid.",
        "He always had a knack for traps when we were kids..."
      ]
    },
  ]

  for card in cards_asher
    card.name = "asher"
    deck.push( new Card card )

  for card in cards_cedrick
    card.name = "cedrick"
    deck.push( new Card card )

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
  $(".card").modal({
    group: ".card"
    fitViewport: false
  })

  app.cloth = new Cloth $( "#Cloth" ), load_deck()
  app.cloth.wipe( 0 )

  $( "#Draw" ).on( 'click', () ->
    $( "#Cloth" ).removeClass( "invisible" )
    app.cloth.draw()
  )

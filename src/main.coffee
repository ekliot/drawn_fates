# a bit of something to allow x-referencing between files
app = window.App = {}

# ==============
# HELPER METHODS
# ==============

# get an item from an array at a specific index
# this will modify the array
array_get = ( arr, idx ) ->
  arr.splice( idx, 1 )[0]

# randomly shuffle an array
shuffle = (a) ->
  i = a.length
  while --i > 0
    j = ~~(Math.random() * (i + 1))
    t = a[j]
    a[j] = a[i]
    a[i] = t
  a

# sleep for specified # of ms
sleep = ( ms ) ->
  new Promise ( resolve ) ->
    window.setTimeout resolve, ms

# load the lexia as cards into the deck
load_deck = () ->
  deck = []

  # ==================================================================================================
  # SAMPLE CARD FORMAT
  #     *_def refers to the "right side up" (default) orientation
  #     *_rev refers to the reversed orientation
  # please copy what's below here and uncomment to add a card to a character
  # pro-tip: hyphens, apostrophes, and quotation marks copied from google docs use a special character
  #          for consistent accessibility, if your lexia includes these characters,
  #          highlight them and replace-all with the following (as appropriate): " ' -
  # ==================================================================================================
  # { # ACT X || Replace X with the act number for this card
  #   img: "media/cards/CARD.png" # replace "CARD" with the name of the card illustration to use
  #   date_def: new Date( 2013, 9, 9, 16, 20 ) # the order goes: year, month (0-indexed), day, hour (24h), minute
  #   text_def: [     # This is an array of paragraphs, each string gets presented as an individual <p> element
  #     "<b>MUST<b>", # you can include html elements in here and they will appear as expected
  #     "NOT",
  #     "SLEEP"       # make sure all your array elements end in a comma, except for the last
  #   ]
  #   date_rev: new Date( 2013, 9, 9, 16, 20 )
  #   text_rev: [
  #     "MUST",
  #     "WARN",
  #     "OTHERS"
  #   ]
  # } # don't forget a comma here if it isn't the last object of the array

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
        "...",
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
      date_rev: new Date( 2013, 9, 2, 23, 14 )
      text_rev: [
        "Cedrick barely lasted the day. Each one of Rose's gaggle of girls came up to him and personally insulted him, in every single class.",
        "It was like, some weird inverted <i>Kill Bill</i> situation or something, where Bill gets killed over and over again by each of his mean girl hit squad. Except Cedrick is Bill, and he gets killed by some real scathing, uncalled for insults.",
        "Cedrick didn't deserve this shit, but he should've seen it coming. Am I responsible, though, because I didn't help <i>in spite of</i> seeing it coming?",
        "No, I can't let myself think those things. Survival of the fittest and all that, I'm not losing face or letting my grades slip to help his dumb ass up."
      ]
    },
    { # ACT 4
      img: "media/cards/hierophant.png"
      date_def: new Date( 2013, 9, 3, 16, 20 )
      text_def: [
        "Today was heavy.",
        "Dr. Reuven ran up to my bus to get me, in front of <i>everybody</i>, I hate it when people ask if he\'s my dad...",
        "But he looked real... Excited. Not the kind of excited how he looks when he\'s teaching derivatives to a bunch of teenage, half-sleeping baboons, but... Adrenaline excited, the worrisome kind.",
        "And he reeked of skunk.",
        "He took me straight to his office, said he had something for me, he had meant to give it to me after class today, but... We didn\'t have class today.",
        "It\'s this misshapen coin, bronze or copper or something, it\'s got a moon on one side and some creepy portrait with the eyes scratched out on the other.",
        "He was awful pushy about \"keeping it safe\"."
      ]
      date_rev: new Date( 2013, 9, 3, 16, 30 )
      text_rev: [
        "I walked home, even though Dr. Reuven offered to drive after giving me that old coin. Might have saved our lives, how dank he smelled."
        "But I saw something weird, leaving his office... It was some red hair on Reuven\'s sleeve.",
        "Now, I know two things for fact: the only redhead in school is Rose, and Dr. Reuven definitely hasn\'t been on any dates in at least the last century.",
        "The two have nothing in common, she\'s not even in any of his classes. And he was just so damn skittish... "
      ]
    },
    { # ACT 5
      img: "media/cards/moon.png"
      date_def: new Date( 2013, 9, 4, 12, 20 )
      text_def: [
        "Reuven really weirded me out the other day -- I know, he\'s already pretty weird, but what was that whole scene about this coin about?",
        "So I\'ve been doing some research, dug around the net and made a couple Reddit posts to some history enthusiasts, but I got nothing. Everything points to this being a fake, some kind of novelty item, but it just feels so... Real?",
        "You know, when you go to a museum and you see some old corroded artifacts and you can feel how old they are? Like, half a million years ago some neanderthal skinned his first deer with that chipped piece of flint?",
        "Yeah, I keep looking at this portrait on the coin, and the scratched out eyes just look back, like this dude knows something I don\'t and he\'s just so smug about it."
      ]
      date_rev: new Date( 2013, 9, 4, 22, 30 )
      text_rev: [
        "Okay, so I may just be really high but I think I\'ve got something really big and holy shit.",
        "My parents buy all these books and academic journals they promise they\'ll read when they get back from their next \"adventure\" to collect the artifacts of indigenous peoples... A load of crap, they\'ve just been collecting dust in our library.",
        "Well, it was time to put them to some use, so I stayed up all night.",
        "Read everything that had anything to do with coins and kings and just really old stuff and now I know way more about Sumerian coinage than I ever wanted BUT GET THIS: my parents somehow have a journal of some French historian that was panned as a loon, and committed suicide decades ago before he could publish his stuff.",
        "But he\'s drawn a portrait here of an Akkadian king, he was in power for less than a year before he allegedly lost a gamble with a wandering magician. The story goes the king became his servant and was never seen again.",
        "Barring the scratched out eyes, that king looks just like this coin. But these kinds of portraits are never exact, right? They could easily just look alike, and this coin is so old..."
      ]
    },
    { # ACT 6
      img: "media/cards/justice.png"
      date_def: new Date( 2013, 9, 7, 14, 20 )
      text_def: [
        "Man, that goddamn worm, he had the <i>fucking gall</i> to steal that coin. I <i>promised Reuven</i> I\'d keep it safe.",
        "I can\'t believe I had to drag Gus into this, asking him for a favor, but I could tell that knucklehead was into it. Plus, he owes me for all that math \"tutoring\". Yeah, he was <i>totally</i> raring to go, just looking for a reason to whoop anyone\'s ass, especially Cedrick\'s.",
        "Who the hell names their kid <i>Cedrick</i>?",
        "Whatever, karma\'s a raging bitch and Cedrick\'s about to taste that hormonal bull\'s fiery horns of justice."
      ]
      date_rev: new Date( 2013, 9, 7, 18, 20 )
      text_rev: [
        "I could feel bad about it, but I don\'t."
        "Cedrick was his old boy, after all, buuut... Nah, not my problem."
        "I think I\'ll let Gustave of the hook though. He\'s too dumb to be double-crossing me, so I\'ll take his word that Cedrick doesn\'t have the coin. Plus he said that Cedrick would bring it back to me."
        "At least I can confirm he\'s the one that stole it. But he said something else..."
        "Apparently, Rose has the hots for Cedrick? I mean, what the hell?"
        "After <i>that</i> brutal Rejection?"
        "Actually, wait a sec, why does Rose keep showing up everywhere I look all of a sudden? Is this that fixation thing they were talking about in psych, or is she actually invading my life?"
      ]
    },
    { # ACT 7
      img: "media/cards/death.png"
      date_def: new Date( 2013, 9, 9, 15, 20 )
      text_def: [
        "Life is a cruel joke.",
        "Reuven\'s dead. Well, according to the school administration he\'s fled the state and performed a switcharoo for the fucking ages, because one moment he\'s preaching probability and the next he\'s a life-sized salt statue and who the fuck buys that bullshit cover up? He\'d have told me if he\'d left state - what the hell, I\'d have begged to go with him!",
        "Nah, there\'s something more to it. I\'m not saying it\'s aliens, or fluoride, and I\'m not saying it <i>isn\'t</i>, per se, but I think that coin had something to do with it and to hell with sitting around and letting the one person that understood me become some cow\'s salt lick.",
        "I\'m sneaking into his house tonight, the sheriff\'s probably gonna be poking around all day himself.",
        "I just hope Reuven is really, really good at chicanery..."
      ]
      date_rev: new Date( 2013, 9, 9, 22, 20 )
      text_rev: [
        "I made it to Reuven\'s and I wish I hadn\'t but goddammit it\'s a good thing I did and now everything\'s about to change. Fuuuck everything.",
        "The police weren\'t there. Actually, they probably hadn\'t even bothered to show up. The lazy pigs probably never will, I\'m the only one in this town who gave a shit about Dr. Reuven.",
        "But... Maybe he did skip town, after all. He left a bunch of notes, some creepy sketches and diagrams and dogeared diaries. For me.",
        "He said he summoned a demon. By accident. That demon stole Rose\'s body, it killed Gustave\'s dad, and that demon is Destiny itself.",
        "The coin? Part of the accident, it\'s a symbol of chance, Reuven said he was trying to investigate Chaos itself, to understand the primordial forces of the universe and- wait, Cedrick still has the coin, isn\'t he dating Rose? Shit.",
        "It doesn\'t matter anymore. By summoning that demon Reuven wrote his own death sentence, and now I\'m the only one who knows how to clean this up.",
        "I hate to say it, but... I can\'t do this by myself. I have to get help.",
        "We\'re gonna need to rewrite fate. Revuen\'s fate was sealed, but mine isn\'t.",
        "I could die.",
        "It\'s a gamble I\'m willing to take, not like there\'s anybody around anymore to give a shit."
      ]
    },
    { # ACT 8
      img: "media/cards/wheel.png"
      date_def: new Date( 2013, 9, 10, 19, 20 )
      text_def: [
        "It\'s going to happen. We\'re gonna clean this up, we\'ll save the world and nobody will even know what happened. I hate to say this, but this feels just like a comic book.",
        "And the heroes always win, right?",
        "I\'ve planned it all out, as long as we stick to it we should make it out alive.",
        "I\'m gonna challenge Rose -- is a rose still a rose when it\'s actually a demon? -- I\'m gonna challenge her to a game of cards, an old tarot deck that I dug up from Reuven\'s place.",
        "She\'s going to get cocky (she is a manifestation of fate, after all), and she\'s going to accept: I\'ll wager my servitude, and she\'ll wager Reuven\'s coin.",
        "But the deck will be rigged, and I\'ve been counting cards ever since I started playing solitaire at recess. <s>If<s> Positive thinking, <i>when</i> I win, Cedrick\'s pinching the crystal amulet on her neck while she\'s distracted, it\'s the only thing binding her to a human form.",
        "She\'ll begin to transform into her true form, her most powerful form, but <s>if</s> <i>when</i> Gustave does what he does best, she\'ll be mid-transformation and at her weakest. A prime target for lil\' slugger\'s field day.",
        "Cedrick\'s bringing Rose to the baseball diamond within the hour. I hate to love to say it, but that demon doesn\'t have a chance."
      ]
      date_rev: new Date( 2013, 9, 10, 22, 20 )
      text_rev: [
        "It happened. It actually happened.",
        "I can\'t believe it happened.",
        "We won. We saved the day. We murdered a demon.",
        "Now that I think of it... I don\'t know what\'s going to happen to Rose. The real one. I have no idea what the demon did with her original body and... I\'m probably an awful person, but I don\'t really care. I\'m just so glad this is over.",
        "What\'s weird, is I think we\'re friends now. Gus and Cedrick, I mean. It\'s... a weird feeling. We\'ve got something we can never share with anybody else. And... I don\'t know, I\'ve never known this. Reuven was pretty much my only friend, the only person that appreciated me, and what I love, and I just pushed everybody else out. Now... Now I\'ve been able to put those things to some good and, well, help people.",
        "It feels... Nice. Like getting high, but, wholesome.",
        "I hope Reuven is proud of me, wherever he is."
      ]
    },
    { # ACT 9
      img: "media/cards/world.png"
      date_def: new Date( 2013, 10, 2, 16, 20 )
      text_def: [
        "Gus and Cedrick and I are… A squad now, I guess. We\'re stronger now, somehow. Changed for the better, as fucked up as that sounds.",
        "Cedrick\'s kinda quirky, but he has his good moments. He\'s a totally different person in good company, like us, and is pretty fun when something he likes is brought up. His first bong hit totally changed him too, hah.",
        "I\'m actually kinda… Proud of Gus. He takes his studies more seriously, something must have rubbed him, like he\'s trying to prove something. It\'s sorta inspiring, I kinda look forward to helping him with his studies.",
        "Reuven would like that.",
        "People are kinda weirded out, we\'re not the typical getup, but we share something none of them do.",
        "We saved their asses and none of them will ever know to thank us."
      ]
      date_rev: new Date( 2013, 10, 9, 16, 20 )
      text_rev: [
        "This life won\'t feel normal. Not for some time. Everything\'s different now.",
        "Reuven\'s gone, and nobody seems to remember. I\'d be mad, but… Maybe it\'s for the better. Nobody\'s asking questions, or opening investigations. His house has been left untouched, though the power and water have been cut for the last month. I still hang out there, on lonely nights, study from his textbooks, pick through his trinkets. I still keep that coin on me, for luck.",
        "People forgot about Rose too, even those basic friends of hers. I think her parents skipped town after the police dropped the ball on the investigation.",
        "It\'s only been a month, and it\'s like nothing ever happened. As far as everyone is concerned, nothing did, besides a runaway girl and a math teacher with a salt fetish running away to Canada or something.",
        "I wonder what else is going on behind the curtain that we never hear about? Maybe Reuven has something in those books of his..."
      ]
    }
  ]

  cards_cedrick = [
    { # ACT 1
      img: "media/cards/fool.png"
      date_def: new Date( 2013, 8, 8, 17, 32 )
      text_def: [
        "Tomorrow I\'ll be starting the next year of high school. As I write this, I am filled with an anxious eagerness. I\'ve tried so hard to change my attitude this summer, really, and I hope that I have become less callous. With any luck they will have changed too. I fear that my disdain for the peers I will have to spend the next four years with was justified. Maybe Gustave and I can still be friends."
      ]
      date_rev: new Date( 2013, 8, 8, 21, 14 )
      text_rev: [
        "I\'ve thought a lot about school over this summer. I am a corpse; tomorrow I must return to the grave. My peers\' sadistic immaturity knows no bounds, and I fear it will only grow worse this year. Our school system breeds malicious behavior and conformity. I must hold fast my sanity and individualism."
      ]
    },
    { # ACT 2
      img: "media/cards/judgement.png"
      date_def: new Date( 2013, 8, 10, 16, 20 ) # the order goes: year, month (0-indexed), day, hour (24h), minute
      text_def: [
        "I was wrong about Gustave... He\'s become one of <i>them</i>: a cocky musclehead jock. They way he looks at me now, like I\'m some pathetic piece of shit, makes me glad we\'re no longer friends.",
        "There\'s this girl, Rose, who\'s really chill. She mostly keeps to herself. She has short red hair and her eyes are a dark brown. I\'m thinking about asking her out."
      ]
      date_rev: new Date( 2013, 8, 10, 16, 20 )
      text_rev: [
        "It\'s been about a week since school started, and I\'m already filled with apathetic disdain. They\'re children; so malicious and naive, it looks like it\'ll be a lonely four years. I\'m starting to think something is wrong with me. What if i\'m the immature one? Gustave is a jockhead now, he acts like we were never friends. He\'s met this new kid, Asher, who\'s some kind of math geek. I\'ve heard he\'s selling drugs.",
        "I\'m not really good at anything in particular. All I do is skulk around and mope."
      ]
    },
    { # ACT 3
      img: "media/cards/hierophant.png"
      date_def: new Date( 2013, 9, 1, 16, 20 ) # the order goes: year, month (0-indexed), day, hour (24h), minute
      text_def: [
        "I\'m going to do it tomorrow after math class. When Rose is alone at her locker, I\'ll ask her out. I don\'t know what I\'ll do if she says no. I mean, she <i>has</i> to say yes. I\'m terrified of the rumors that\'ll for sure spread if she says no. It would plague my existence for the rest of high school.",
        "I have to stay positive. She\'ll say yes."
      ]
      date_rev: new Date( 2013, 9, 2, 17, 20 )
      text_rev: [
        "It couldn't have gone worse. I knew this would happen... How could I have been so stupid. I asked her out like I planned, after math class, but she wasn\'t alone; Gustave was watching from across the hall. After she said no he walked over, his jock friends watching on like a pack of hyenas, and smacked the books out of my hands.",
        "\"Why don\'t you go for someone your own speed?\" He said. \"You know, like a snail?\" His cackling hyena friends all high-fived him. Mocking me makes them feel better about their own miserable lives. They feed off malice and perverse admiration."
      ]
    },
    { # ACT 4
      img: "media/cards/world.png"
      date_def: new Date( 2013, 9, 3, 12, 20 ) # the order goes: year, month (0-indexed), day, hour (24h), minute
      text_def: [
        "Gustave is finally leaving me alone. He seems to have a new friend: that math geek named Asher. I\'ve overheard them talking about the math teacher, and something about a coin. They\'re perfect for each other, so cocky and immature, I\'m glad they\'ll be paying less attention to me, but they\'ve been acting strangely lately. I don\'t know what they\'re planning, but it can\'t be good. I\'ve even noticed Rose isn\'t hanging out much with her usual group."
      ]
      date_rev: new Date( 2013, 9, 3, 16, 20 )
      text_rev: [
        "Something\'s really different about Rose today, she\'s not hanging out with her usual friends and she keeps giving me this weird look. I\'m still really shook up about the rejection. I thought I would be able to shake it off but I can\'t stop thinking about it. It\'s like every whisper feels like I\'m being mocked. I\'ll never live this down.",
        "Asher and Gustave are up to something, I know it. I saw them sneaking around into Ruven\'s office when he wasn\'t there, and they won\'t stop talking about a coin or something. It has something to do with that math teacher."
      ]
    },
    { # ACT 5
      img: "media/cards/wheel.png"
      date_def: new Date( 2013, 9, 4, 17, 32 )
      text_def: [
        "Man, am I lucky or what? The unbelievable happened today: Rose asked me out! At first I stood there like a dunce before finally blurting out \"yeah, sure.\" God I\'m such a dweeb sometimes. She\'s probably already regretting it, I\'ll soon be dumped I\'m sure.",
        "I wonder, though, why the sudden change of heart? Something\'s different with her. Don\'t get me wrong, I\'ve never been happier, but I can\'t shake the feeling like there\'s something else going on."
      ]
      date_rev: new Date( 2013, 9, 2, 21, 14 )
      text_rev: [
        "Gustave\'s dad died today, and as much as I hate his guts, I feel really bad for the guy. He seems really shook up about it, like in a weird way though. He and Asher have been inseparable lately, but I haven\'t seen him today. I wonder what they\'re up to, it can\'t be anything good. I just hope it doesn\'t involve me somehow."
      ]
    },
    { # ACT 6
      img: "media/cards/devil.png"
      date_def: new Date( 2013, 9, 7, 17, 32 )
      text_def: [
        "Man, I\'d do anything for Rose. She asked me to steal some coin from Asher, Gustave\'s new brown nosing best friend. I\'ve seen them being all buddy-buddy in the hall. <i>Like I need an excuse to mess with them</i>.",
        "Anyways, I swiped the stupid thing today in art class while Asher was busy throwing exacto knives like darts at paper mache houses. It looks weird: a moon on one side, and a creepy face on the other. It must be really old. I gave it to Rose, she seemed really pleased."
      ]
      date_rev: new Date( 2013, 9, 7, 21, 14 )
      text_rev: [
        "What an asshole, how\'d Gustave find out I stole that coin? His math geek friend, Asher, must\'ve asked him to get it back. I wonder why he cares... I heard Asher is selling drugs, maybe that\'s it.",
        "Anyways, I didn\'t have the coin on me but Gustave shoved me into a locker and roughed me up trying to find it. It must be valuable or something. Rose hasn\'t mentioned it since she asked me to steal it."
      ]
    },
    { # ACT 7
      img: "media/cards/moon.png"
      date_def: new Date( 2013, 9, 10, 13, 20 ) # the order goes: year, month (0-indexed), day, hour (24h), minute
      text_def: [
        "Those notebooks Asher and Gustave showed me have to be fake. What a cruel prank. I mean, there\'s just no way, right? Our math teacher is in some sort of cabal? Rose is a demon of fate? Her necklace is some sort of power source and that coin was an ancient artifact? How stupid do they think I am. I bet this is just a ploy to get back at me for stealing the coin.",
        "But what if they\'re telling the truth?"
      ]
      date_rev: new Date( 2013, 9, 10, 10, 20 )
      text_rev: [
        "Asher and Gustave approached me in the hallway today holding some weird looking notebooks. At first I ignored them, thinking it was a prank, then one of them mentioned Rose which caught my attention.",
        "\"Leave me and Rose alone, assholes\" I told them, wanting them to just go away, but they wouldn\'t leave. They insisted I listened to what they had to say: that Rose is really a demon of fate, that she was summoned by our math teacher, and that only we could stop her. They\'ve put a commendable amount of effort into this prank."
      ]
    },
    { # ACT 8
      img: "media/cards/death.png"
      date_def: new Date( 2013, 9, 10, 20, 20 ) # the order goes: year, month (0-indexed), day, hour (24h), minute
      text_def: [
        "It\'s done. Rose is dead. Man, that was horrifying. It was like I wasn\'t in control of my own body. It all happened so quickly. The second I ripped off her necklace Rose let loose this blood-curdling scream, I thought she was going to kill me. Her skin turned a horrible color — she wasn\'t human. I don\'t how how Gustave beat her to death with that nailed bat, he fought like he was possessed. Now we all have to move on with our lives."
      ]
      date_rev: new Date( 2013, 9, 10, 22, 20 )
      text_rev: [
        "How are we going to go on with our lives after this? Rose was actually a damn demon or something. On the bright side, maybe now Gustave will be like he used to be, after all we\'ve been through, and Asher is actually kinda cool too, not the cocky ass I thought he was. I guess we\'ll just have to forget this shit with Rose and Reuven ever happened."
      ]
    },
    { # ACT 9
      img: "media/cards/justice.png"
      date_def: new Date( 2013, 10, 4, 16, 20 ) # the order goes: year, month (0-indexed), day, hour (24h), minute
      text_def: [
        "It\'s been awhile since I wrote in here... Gustave is cool now, it\'s like it used to be. We still hang out with Asher too. Part of me misses Rose. Even though she was some kind of horrible demon, those few days when we were dating were a twister of elation. I feel bad for her parents, but they can never know the truth."
      ]
      date_rev: new Date( 2013, 11, 19, 16, 20 )
      text_rev: [
        "It\'s been awhile since I wrote in here... It\'s been hard to move on. Knowing what we know, you just want to blurt it out all the time. Even if we did no one would believe us. It sounds so insane even thinking about it, like a nightmare. Rose\'s parents will never know what happened to her."
      ]
    }
  ]

  cards_gustave = [
    { # ACT 1
      img: "media/cards/devil.png"
      date_def: new Date( 2013, 8, 9, 17, 32 )
      text_def: [
        "I am absolutely terrified of starting school this year. I mean it can\'t be that different from other years of school. I go to class, goof off a bit with my friends, have a big lunch, sleep during the rest of my classes, and hit the batting cages.",
        "I mean I gotta really step it up this year. College is right around the corner and scouts are going to be at every game. Not as many video games and junk food and more keeping my grades up and time in the cage."
      ]
      date_rev: new Date( 2013, 8, 14, 21, 14 )
      text_rev: [
        "As tough as it is to say I am going to sell off all my game consoles. I thought that with my new found resolve this year I would not fall into old habits.",
        "After the first day I got online and played shooters until two in the morning.",
        "Getting rid of these things is for the best.",
        "Besides... It is really haunting to see Cedrick there all the time. We used to play together constantly. The Iceman to my Goose, ya know? Now it just doesn't feel right."
      ]
    },
    { # ACT 2
      img: "media/cards/fool.png"
      date_def: new Date( 2013, 8, 10, 17, 32 )
      text_def: [
        "Despite my initial hesitations I had to be positive. This really felt like a time for me to reinvent myself, ya know. If I want to make the baseball team I better start practicing from now. The guys on the squad can\'t know I used to hang out with that weirdo Cedrick. I mean we used to be friends when we were kids, but he is really not into sports or anything at all. Gotta keep up with the popular kids if I want to stay on top, you feel."
      ]
      date_rev: new Date( 2013, 8, 20, 21, 14 )
      text_rev: [
        "I gotta do well in this math class no matter what. I need to keep my grades up so that I can get a baseball scholarship for college. I am only a week and a half into the class and I\'m already behind.",
        "That Asher guy seems to have an in with the creepy-ass math teacher. You know the guy with the name that sounds like a sandwich. Rueben or something? Whatever I certainly don\'t want to see that guy in a diner that\'s for sure.",
        "Asher isn\'t really my kind of guy to chill with but his dealer sells him the best kush in the state."
      ]
    },
    { # ACT 3
      img: "media/cards/judgement.png"
      date_def: new Date( 2013, 9, 2, 17, 32 )
      text_def: [
        "The end justifies the means right?"
        "So Cedrick had been making eyes at this Rose chick from the start of the school year. Dude wasn\'t hiding it either.",
        "History class? <i>STARES</i>",
        "Literature class? <i>STARES</i>",
        "Lunch? YOU GUESSED IT!",
        "I mean this girl is way out of his league. I wouldn\'t even go after her.",
        "So here this guy goes and asks her out to the Halloween dance right before an assembly in front of everyone. WHAT?",
        "She (predictably) turned him down in the most polite way possible and I saw an opportunity. If got Cedrick\'s goat a bit the rest of the guys on the baseball team would love it.",
        "So I roasted him a bit. Smacked his books out of his trembling hands and said he should try girls his own speed like snails.",
        "The guys loved it and will definitely invite me to their next rager."
      ]
      date_rev: new Date( 2013, 9, 4, 21, 14 )
      text_rev: [
        "I may have really messed up and I mean real bad.",
        "All I did was tease him a bit. Everyone knocks books out of kids hands but they don\'t mope around like Cedrick does.",
        "I see this guy in the halls and he just stares at me. I mean the kid can\'t hurt me. I am like twice his height and a stiff breeze can knock him down, but I feel scared.",
        "It\'s like he is plotting or something. I don\'t know what he has planned but I am afraid.",
        "He always had a knack for traps when we were kids..."
      ]
    },
    { # ACT 4
      img: "media/cards/hierophant.png"
      date_def: new Date( 2013, 9, 2, 17, 32 )
      text_def: [
        "So I went to Ashers house today after practice because these trig identities have me all kinds of fucked up. He keeps talking about Soh-Cah-Toa or whatever. I don\'t know what some old dead Greek philosopher has to do with math.",
        "Some of the stuff about angles made sense after he started comparing it to baseball swings.  Who knows. Maybe some of this stuff will help me hit a grand slam one day."
      ]
      date_rev: new Date( 2013, 9, 3, 21, 14 )
      text_rev: [
        "This was my second day in a row at Asher\'s. My head started to hurt with all of the examples he had me doing."
        "He decided to break up the monotony with a little bit of show and tell.",
        "Out of his pocket he pulls out this dull, old coin. I take it out of his hand to get a better look. Asher totally freaked out and snatched the coin back. I wasn\'t gonna steal it or anything.",
        "All he told me was that it was old and I mean older than our parents old. Like Jesus owed one of these guys to his disciples old. He said it belonged to an ancient civilization and has roots in some spooky mumbo-jumbo. That creepy math teacher gave it to him.",
        "I told Asher that Rueven wouldn\'t have given him the coin if it was that rare but he didn\'t listen.",
        "What even is Asher\'s relationship with the math teacher anyway? It\'s inappropriate."
      ]
    },
    { # ACT 5
      img: "media/cards/death.png"
      date_def: new Date( 2013, 9, 4, 12, 32 )
      text_def: [
        "So dad was thinking about quitting the grave digging business.",
        "He was never proud of that job but it was the only one he could get after coming back from Iraq and having little to nothing to speak of for an education.",
        "He was waving a pamphlet from the local community college. Dad was thinking about studying business and making a landscaping company. He certainly kept the graveyard he worked at neat and tidy.",
        "He says he felt inspired by watching me always going over to Asher\'s to study. I almost feel bad because I mostly go there to smoke a bowl and maybe do a bit of trigonometry."
      ]
      date_rev: new Date( 2013, 9, 4, 22, 14 )
      text_rev: [
        "This feels so bizarre to write but I have to do it.",
        "Dad is dead.",
        "No... He was murdered. I refuse to believe it was an accident.",
        "Mom got worried after dad never came home so she called on of his co-workers, Craig. Craig had a cold so dad told him to go home.",
        "To get to the bottom of the mystery, mom went to the cemetery to go look for dad.",
        "She found him alright. Cold. Alone. Dead.",
        "Shovel still in hand. His face stuck in a perpetual gasp like he had seen something that surprised him before he passed.",
        "I can\'t believe I have to help plan a funeral."
      ]
    },
    { # ACT 6
      img: "media/cards/justice.png"
      date_def: new Date( 2013, 9, 7, 17, 32 )
      text_def: [
        "In between bong hits Asher told me about this geek that really pissed him off. Something about him stealing something important from him. I don\'t really get why it was so important to him. Probably has to do with that Crypt Keeper looking math teacher he spends so much time with.",
        "He asked me to get it back from him which probably meant rough him up a bit.",
        "I wouldn\'t call myself loyal to this guy, ya know. I look out for my own, but I wouldn\'t classify Asher as one of my inner circle. He was helping out a lot with math and selling me weed on a discount so I owe him.",
        "Beating up some nerd would probably boost my street cred in the eyes of baseball team as twisted as that sounds. There was one hiccup though.",
        "The guy was Cedrick."
      ]
      date_rev: new Date( 2013, 9, 8, 21, 14 )
      text_rev: [
        "First thing is first; I am not proud of this.",
        "The plan was to walk up to Cedrick, intimidate him a little bit, and make him give up Asher\'s stuff.",
        "Shit hit the fan really fast.",
        "I roll up on the guy in the hallway by the lockers. He was talking to that Rose girl... And she was laughing? No way that dime could be chilling with that scrawny kid let alone laughing at his jokes.",
        "As I approached, Rose kissed his cheek, turned her back, and walked away.",
        "The next part freaked me out more. The man says and I quote,",
        "\"What do you want Gus?\"",
        "He had never been that bold. Clearly I needed to apply pressure.",
        "I turn him around, slam his face into the locker, and run his pockets.",
        "Nothing but a few crumpled gum wrappers and his Power Rangers wallet.",
        "I threw him to the floor and checked his backpack.",
        "Nothing.",
        "Had to look tough so I said, \"better give back what you stole from Asher or we\'ll have another chat.\"",
        "God that made me feel sick. This isn\'t me."
      ]
    },
    { # ACT 7
      img: "media/cards/moon.png"
      date_def: new Date( 2013, 9, 9, 23, 32 )
      text_def: [
        "I got a text from Asher after class. It just said \"<i style=\"font-family: monospace\">IMPORTANT! MY HOUSE! RIGHT NOW!</i>\" He never texts first so that caught me by surprise. I thought he must have been into some wild shit, and boy was I right.",
        "I walked through the front door and there Cedrick is eyeing up an old vase looking straight out of the Hercules movie. Bet he was gonna fence it.",
        "Asher drops all kinds of knowledge bombs on us. Reuven left him a journal that explains all the weird shit going on around here... Including dad\'s death.",
        "You\'re not gonna believe this but that creepy math teacher actually summoned a fucking demon, it killed my dad, and Cedrick is dating it. It\'s not going to stop killing any time soon.",
        "I don\'t know what 3 high school kids are going to about the creature from the black lagoon, but this thing killed my old man and I intend to go out swinging."
      ]
      date_rev: new Date( 2013, 9, 9, 13, 14 )
      text_rev: [
        "So I am sitting there in math class falling asleep as usual and suddenly the whole class screams. I damn near fall out of my seat and look to the front of the room. I thought I was still dreaming because I couldn\'t believe what I saw.",
        "Reuven was frozen solid standing at his desk. The dude was whiter than home plate at the top of the first inning. Asher gets up to take a closer look. He checks for a pulse but there is nothing. Guy was a literal statue. He checks the residue on his hands and he says it is salt.",
        "I don\'t know what to think anymore. Administration brought us into the gym while the police were called. They said that Reuven replaced himself with a salt statue when no one was looking. There are 30 people in that class. How could no one notice?"
      ]
    },
    { # ACT 8
      img: "media/cards/world.png"
      date_def: new Date( 2013, 9, 10, 22, 32 )
      text_def: [
        "It\'s finally over.",
        "All I had to do was follow Asher\'s instructions to the letter. Prep my slugger full of nails, hide in a tree, and go for a home run when the ugly bastard starts to change.",
        "No pressure, right?",
        "After Cedrick stole the crystal Rose it was my time to shine. I want to say that I jumped down and had a catch phrase like in the movies. Like John McClain. \"Yipee ki yay, motherfucker!\" All I could do was yell with tears streaming down my face.",
        "This hideous thing was the last sight my father saw as his soul was taken from his body. I wanted nothing more than revenge.",
        "I buried my spiked bat into the head of the demon somehow making it more ugly. I got closer hitting it again and again. It was trying to plead with me but I wanted nothing to do with it.",
        "It finally stopped moving after I turned its head into ground beef. Nothing was more satisfying than smashing that thing into a million bits.",
        "I hope you are happy, dad."
      ]
      date_rev: new Date( 2013, 9, 12, 17, 14 )
      text_rev: [
        "There is one thing that I just can\'t seem to shake since the Great Demon Beating of 2013.",
        "I should feel whole. I prevented Cedrick from screwing a demon. I stopped the end of the world, and I avenged my father.",
        "I haven\'t been able to sleep in days.",
        "When that ugly shit was pleading for its life... It told me things. Things it thought I wanted to hear. At some point during my flurry of hits it touched me with one of its tentacles... Claws... Hands? WHATEVER THEY WERE!",
        "She said she saw my fate. She told me... How am I going to say this... She told me when I would die. December 12, 2023. That\'s not far away. Did she lie? She was dying and demon or not I don\'t think she would screw with me on her last breath. I can never be sure because I put my bat through her amygdala before I could get an answer.",
        "I guess there is one way to find out. Time to play the waiting game."
      ]
    },
    { # ACT 9
      img: "media/cards/wheel.png"
      date_def: new Date( 2013, 11, 12, 17, 32 )
      text_def: [
        "So according to the demon I slayed, I am supposed to die on this day in 10 years.",
        "I have certainly been taking a whole lot more risks. I mean I asked out the head cheerleader at the school. After she turned me down, I moved on to the rest of the squad. They turned me down too. I also have been intentionally putting my life at risk.",
        "Yesterday I walked out into traffic and Cedrick was there to pull me back. I tried overdosing on pills at Asher\'s and he comes in and stops me.",
        "I have no agency over my life. I guess this just isn\'t my time.",
        "I should tell Asher and Cedrick about this. I shouldn\'t have to go through this alone."
      ]
      date_rev: new Date( 2013, 11, 13, 21, 14 )
      text_rev: [
        "I told Asher and Cedrick about my death sentence from Demon-Rose.",
        "Cedrick was livid. He was upset that I didn\'t tell him sooner but how do you tell your friends, \"Hey, bud. A demon I killed said I would die in about 10 years so...yeah?\"",
        "Asher immediately did research about the demon using some of Reuven\'s old books. What he found was more horrifying that dying in 10 years.",
        "According to the prophecy, I have killed the demon of fate. He who kills fate has won the right to escape it.",
        "Asher told me that I will never die. I will live a life of watching those around me die. My friends, my loved ones, strangers, the earth, the sun itself.",
        "I didn\'t ask for this. Will someone please kill me?"
      ]
    }
  ]

  # load in asher's cards
  for card in cards_asher
    card.name = "asher"
    deck.push( new Card card )

  # load in cedrick's cards
  for card in cards_cedrick
    card.name = "cedrick"
    deck.push( new Card card )

  # load in gustave's cards
  for card in cards_gustave
    card.name = "gustave"
    deck.push( new Card card )

  # tracking variables
  flipped = 0
  to_flip = deck.length // 2
  # only need to flip half
  while flipped < to_flip
    # because flipped cards get pushed to the end of the array, only select
    # cards for flipping from before that buffer zone
    sample_size = deck.length - flipped
    # get a card from a random index within the sample size
    sample = array_get( deck, Math.floor(Math.random()*sample_size) )
    # add the card to the end of the deck, flipped
    deck.push( sample.flip() )
    ++flipped

  # shuffle the half-flipped deck
  deck = shuffle( deck )

  return deck

window.onload = ->
  # enable the modal elements for journal entries
  # http://responsivebp.com/javascript/modal/#methods
  $(".card").modal({
    # these options don't seem to work, but they're here anyways
    group: ".card"
    fitViewport: false
  })

  # initialize a new Cloth object with the deck
  app.cloth = new Cloth $( "#Cloth" ), load_deck()
  # do an initial insta-wipe to get rid of the weird animation bug on the first wipe
  app.cloth.wipe( 0 )

  # bind the draw method to the draw button
  $( "#Draw" ).on( 'click', () ->
    # the cloth starts off invisible so it can be initially rendered with images
    # this is so that the jQuery animation knows how big the div should be
    # the invisibility class is removed upon the first interaction with the app
    $( "#Cloth" ).removeClass( "invisible" )
    app.cloth.draw()
  )

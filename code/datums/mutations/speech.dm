//These are all minor mutations that affect my speech somehow.
//Individual ones aren't commented since their functions should be evident at a glance

/datum/mutation/human/nervousness
	name = "Nervousness"
	desc = ""
	quality = MINOR_NEGATIVE
	text_gain_indication = span_danger("I feel nervous.")

/datum/mutation/human/nervousness/on_life()
	if(prob(10))
		owner.stuttering = max(10, owner.stuttering)


/datum/mutation/human/wacky
	name = "Wacky"
	desc = ""
	quality = MINOR_NEGATIVE
	text_gain_indication = span_sans("I feel an off sensation in my voicebox.")
	text_lose_indication = span_notice("The off sensation passes.")

/datum/mutation/human/wacky/on_acquiring(mob/living/carbon/human/owner)
	if(..())
		return
	RegisterSignal(owner, COMSIG_MOB_SAY, PROC_REF(handle_speech))

/datum/mutation/human/wacky/on_losing(mob/living/carbon/human/owner)
	if(..())
		return
	UnregisterSignal(owner, COMSIG_MOB_SAY)

/datum/mutation/human/wacky/proc/handle_speech(datum/source, list/speech_args)
	speech_args[SPEECH_SPANS] |= SPAN_SANS

/datum/mutation/human/mute
	name = "Mute"
	desc = ""
	quality = NEGATIVE
	text_gain_indication = span_danger("I feel unable to express myself at all.")
	text_lose_indication = span_danger("I feel able to speak freely again.")

/datum/mutation/human/mute/on_acquiring(mob/living/carbon/human/owner)
	if(..())
		return
	ADD_TRAIT(owner, TRAIT_MUTE, GENETIC_MUTATION)

/datum/mutation/human/mute/on_losing(mob/living/carbon/human/owner)
	if(..())
		return
	REMOVE_TRAIT(owner, TRAIT_MUTE, GENETIC_MUTATION)


/datum/mutation/human/smile
	name = "Smile"
	desc = ""
	quality = MINOR_NEGATIVE
	text_gain_indication = span_notice("I feel so happy. Nothing can be wrong with anything. :)")
	text_lose_indication = span_notice("Everything is terrible again. :(")

/datum/mutation/human/smile/on_acquiring(mob/living/carbon/human/owner)
	if(..())
		return
	RegisterSignal(owner, COMSIG_MOB_SAY, PROC_REF(handle_speech))

/datum/mutation/human/smile/on_losing(mob/living/carbon/human/owner)
	if(..())
		return
	UnregisterSignal(owner, COMSIG_MOB_SAY)

/datum/mutation/human/smile/proc/handle_speech(datum/source, list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	if(message)
		message = " [message] "
		//Time for a friendly game of SS13
		message = replacetext(message," stupid "," smart ")
		message = replacetext(message," unrobust "," robust ")
		message = replacetext(message," dumb "," smart ")
		message = replacetext(message," awful "," great ")
		message = replacetext(message," gay ",pick(" nice "," ok "," alright "))
		message = replacetext(message," horrible "," fun ")
		message = replacetext(message," terrible "," terribly fun ")
		message = replacetext(message," terrifying "," wonderful ")
		message = replacetext(message," gross "," cool ")
		message = replacetext(message," disgusting "," amazing ")
		message = replacetext(message," loser "," winner ")
		message = replacetext(message," useless "," useful ")
		message = replacetext(message," oh god "," cheese and crackers ")
		message = replacetext(message," jesus "," gee wiz ")
		message = replacetext(message," weak "," strong ")
		message = replacetext(message," kill "," hug ")
		message = replacetext(message," murder "," tease ")
		message = replacetext(message," ugly "," beautiful ")
		message = replacetext(message," douchbag "," nice guy ")
		message = replacetext(message," douchebag "," nice guy ")
		message = replacetext(message," whore "," lady ")
		message = replacetext(message," nerd "," smart guy ")
		message = replacetext(message," moron "," fun person ")
		message = replacetext(message," IT'S LOOSE "," EVERYTHING IS FINE ")
		message = replacetext(message," sex "," hug fight ")
		message = replacetext(message," idiot "," genius ")
		message = replacetext(message," fat "," thin ")
		message = replacetext(message," beer "," water with ice ")
		message = replacetext(message," drink "," water ")
		message = replacetext(message," shit "," shiz ")
		message = replacetext(message," crap "," poo ")
		message = replacetext(message," slut "," tease ")
		message = replacetext(message," ass "," butt ")
		message = replacetext(message," damn "," dang ")
		message = replacetext(message," fuck ","  ")
		message = replacetext(message," penis "," privates ")
		message = replacetext(message," cunt "," privates ")
		message = replacetext(message," dick "," jerk ")
		message = replacetext(message," vagina "," privates ")
		speech_args[SPEECH_MESSAGE] = trim(message)


/datum/mutation/human/unintelligible
	name = "Unintelligible"
	desc = ""
	quality = NEGATIVE
	text_gain_indication = span_danger("I can't seem to form any coherent thoughts!")
	text_lose_indication = span_danger("My mind feels more clear.")

/datum/mutation/human/unintelligible/on_acquiring(mob/living/carbon/human/owner)
	if(..())
		return
	ADD_TRAIT(owner, TRAIT_UNINTELLIGIBLE_SPEECH, GENETIC_MUTATION)

/datum/mutation/human/unintelligible/on_losing(mob/living/carbon/human/owner)
	if(..())
		return
	REMOVE_TRAIT(owner, TRAIT_UNINTELLIGIBLE_SPEECH, GENETIC_MUTATION)

/datum/mutation/human/swedish
	name = "Swedish"
	desc = ""
	quality = MINOR_NEGATIVE
	text_gain_indication = span_notice("I feel Swedish, however that works.")
	text_lose_indication = span_notice("The feeling of Swedishness passes.")

/datum/mutation/human/swedish/on_acquiring(mob/living/carbon/human/owner)
	if(..())
		return
	RegisterSignal(owner, COMSIG_MOB_SAY, PROC_REF(handle_speech))

/datum/mutation/human/swedish/on_losing(mob/living/carbon/human/owner)
	if(..())
		return
	UnregisterSignal(owner, COMSIG_MOB_SAY)

/datum/mutation/human/swedish/proc/handle_speech(datum/source, list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	if(message)
		message = replacetext(message,"w","v")
		message = replacetext(message,"j","y")
		message = replacetext(message,"a",pick("å","ä","æ","a"))
		message = replacetext(message,"bo","bjo")
		message = replacetext(message,"o",pick("ö","ø","o"))
		if(prob(30))
			message += " Bork[pick("",", bork",", bork, bork")]!"
		speech_args[SPEECH_MESSAGE] = trim(message)

/datum/mutation/human/chav
	name = "Chav"
	desc = ""
	quality = MINOR_NEGATIVE
	text_gain_indication = span_notice("Ye feel like a reet prat like, innit?")
	text_lose_indication = span_notice("I no longer feel like being rude and sassy.")

/datum/mutation/human/chav/on_acquiring(mob/living/carbon/human/owner)
	if(..())
		return
	RegisterSignal(owner, COMSIG_MOB_SAY, PROC_REF(handle_speech))

/datum/mutation/human/chav/on_losing(mob/living/carbon/human/owner)
	if(..())
		return
	UnregisterSignal(owner, COMSIG_MOB_SAY)

/datum/mutation/human/chav/proc/handle_speech(datum/source, list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	if(message)
		message = " [message] "
		message = replacetext(message," looking at  ","  gawpin' at ")
		message = replacetext(message," great "," bangin' ")
		message = replacetext(message," man "," mate ")
		message = replacetext(message," friend ",pick(" mate "," bruv "," bledrin "))
		message = replacetext(message," what "," wot ")
		message = replacetext(message," drink "," wet ")
		message = replacetext(message," get "," giz ")
		message = replacetext(message," what "," wot ")
		message = replacetext(message," no thanks "," wuddent fukken do one ")
		message = replacetext(message," i don't know "," wot mate ")
		message = replacetext(message," no "," naw ")
		message = replacetext(message," robust "," chin ")
		message = replacetext(message,"  hi  "," how what how ")
		message = replacetext(message," hello "," sup bruv ")
		message = replacetext(message," kill "," bang ")
		message = replacetext(message," murder "," bang ")
		message = replacetext(message," windows "," windies ")
		message = replacetext(message," window "," windy ")
		message = replacetext(message," break "," do ")
		message = replacetext(message," my "," yer ")
		message = replacetext(message," security "," coppers ")
		speech_args[SPEECH_MESSAGE] = trim(message)


/datum/mutation/human/elvis
	name = "Elvis"
	desc = ""
	quality = MINOR_NEGATIVE
	locked = TRUE
	text_gain_indication = span_notice("I feel pretty good, honeydoll.")
	text_lose_indication = span_notice("I feel a little less conversation would be great.")

/datum/mutation/human/elvis/on_life()
	switch(pick(1,2))
		if(1)
			if(prob(15))
				var/list/dancetypes = list("swinging", "fancy", "stylish", "20'th century", "jivin'", "rock and roller", "cool", "salacious", "bashing", "smashing")
				var/dancemoves = pick(dancetypes)
				owner.visible_message("<b>[owner]</b> busts out some [dancemoves] moves!")
		if(2)
			if(prob(15))
				owner.visible_message("<b>[owner]</b> [pick("jiggles their hips", "rotates their hips", "gyrates their hips", "taps their foot", "dances to an imaginary song", "jiggles their legs", "snaps their fingers")]!")

/datum/mutation/human/elvis/on_acquiring(mob/living/carbon/human/owner)
	if(..())
		return
	RegisterSignal(owner, COMSIG_MOB_SAY, PROC_REF(handle_speech))

/datum/mutation/human/elvis/on_losing(mob/living/carbon/human/owner)
	if(..())
		return
	UnregisterSignal(owner, COMSIG_MOB_SAY)

/datum/mutation/human/elvis/proc/handle_speech(datum/source, list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	if(message)
		message = " [message] "
		message = replacetext(message," i'm not "," I aint ")
		message = replacetext(message," girl ",pick(" honey "," baby "," baby doll "))
		message = replacetext(message," man ",pick(" son "," buddy "," brother"," pal "," friendo "))
		message = replacetext(message," out of "," outta ")
		message = replacetext(message," thank you "," thank you, thank you very much ")
		message = replacetext(message," thanks "," thank you, thank you very much ")
		message = replacetext(message," what are you "," whatcha ")
		message = replacetext(message," yes ",pick(" sure", "yea "))
		message = replacetext(message," faggot "," square ")
		message = replacetext(message," muh valids "," my kicks ")
		speech_args[SPEECH_MESSAGE] = trim(message)


/datum/mutation/human/stoner
	name = "Stoner"
	desc = ""
	quality = NEGATIVE
	locked = TRUE
	text_gain_indication = span_notice("I feel...totally chill, man!")
	text_lose_indication = span_notice("I feel like you have a better sense of time.")

/datum/mutation/human/stoner/on_acquiring(mob/living/carbon/human/owner)
	..()
	owner.grant_language(/datum/language/beachbum)
	owner.remove_language(/datum/language/common)

/datum/mutation/human/stoner/on_losing(mob/living/carbon/human/owner)
	..()
	owner.grant_language(/datum/language/common)
	owner.remove_language(/datum/language/beachbum)

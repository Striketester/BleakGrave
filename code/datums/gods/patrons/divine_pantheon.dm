/datum/patron/divine
	name = null
	associated_faith = /datum/faith/divine
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal

/datum/patron/divine/astrata
	name = "Astrata"
	domain = "Goddess of the Bright Star, Light, and Order"
	desc = "The First Creation of Psydon, twin of Noc, truly ancient yet she remains neutral to the life she fuels. Depite her neutrality her worshippers believe in her love for them. Ever present yet beyond all......"
	worshippers = "The Self-Proclaimed Noble Hearted, Zealots and Farmers"
	t1 = /obj/effect/proc_holder/spell/invoked/sacred_flame_rogue
	t2 = /obj/effect/proc_holder/spell/invoked/heal
	t3 = /obj/effect/proc_holder/spell/invoked/revive

/datum/patron/divine/noc
	name = "Noc"
	domain = "God of the Void, Darkness, and Knowledge"
	desc = "The First Creation of Psydon, twin of Astrata, neutral and far older than life he is of what can be learned and what can't. His worshippers understand the truth of the gods far better, he is beyond us all....."
	worshippers = "Wizards and Scholars"
	t1 = /obj/effect/proc_holder/spell/invoked/blindness
	t2 = /obj/effect/proc_holder/spell/invoked/invisibility

/datum/patron/divine/dendor
	name = "Dendor"
	domain = "God of the Earth, Duality, and Nature"
	desc = "The Primordial After Effect of Psydon, twin of Abyssor, made after a accident between Psydon's other creation. Both despises and adores life he is a god of many faces. He signifies madness to many."
	worshippers = "Druids, Beasts, Madmen"
	mob_traits = list(TRAIT_KNEESTINGER_IMMUNITY)
	t1 = /obj/effect/proc_holder/spell/targeted/blesscrop
	t2 = /obj/effect/proc_holder/spell/targeted/beasttame
	t3 = /obj/effect/proc_holder/spell/targeted/conjure_glowshroom

/datum/patron/divine/abyssor
	name = "Abyssor"
	domain = "God of the Ocean, Storms and the Tide"
	desc = "The Primordial After Effect of Psydon, twin of Dendor, another accident of those older than him. Yet he is beloved by life but thier love is not even noticed by him."
	worshippers = "Men of the Sea, Primitive Aquatics"

/datum/patron/divine/ravox
	name = "Ravox"
	domain = "God of War, Justice and Strength"
	desc = "The Creation Of Life, child of beings he was created when the first beings fought. However despite this truth is considered a son of Psydon."
	worshippers = "Warriors, Sellswords & those who seek Justice"

/datum/patron/divine/necra
	name = "Necra"
	domain = "Goddess of Death, Passing and the Afterlife"
	desc = "The Creation Of Death, made when the first being died. Like all divine pantheon deities she is thought to be a child of Psydon."
	worshippers = "The Dead, Mourners, Gravekeepers"
	mob_traits = list(TRAIT_SOUL_EXAMINE)
	t1 = /obj/effect/proc_holder/spell/targeted/burialrite
	t2 = /obj/effect/proc_holder/spell/targeted/churn
	t3 = /obj/effect/proc_holder/spell/targeted/soulspeak

/datum/patron/divine/xylix
	name = "Xylix"
	domain = "God of Trickery, Freedom and Inspiration"
	desc = "The Creation Of Advancement, when life began to play tricks he was born. Thought incorrectly to be a child of Psydon."
	worshippers = "Cheats, Frauds, Silver-Tongued devils and Roguish Types"

/datum/patron/divine/pestra
	name = "Pestra"
	domain = "Goddess of Rot, Disease and Medicine"
	desc = "The Creation of Life, when the first corpse rotted the life that had infested the dead created Pestra."
	worshippers = "The Sick, Phyicians, Apothecaries"
	mob_traits = list(TRAIT_EMPATH, TRAIT_ROT_EATER)
	t0 = /obj/effect/proc_holder/spell/invoked/diagnose
	t1 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t2 = /obj/effect/proc_holder/spell/invoked/heal
	t3 = /obj/effect/proc_holder/spell/invoked/attach_bodypart

/datum/patron/divine/malum
	name = "Malum"
	domain = "God of Cycles, Destruction and Rebirth"
	desc = "The Empty Creation, He is nearly as eternal as the first creations and ever marching."
	worshippers = "Smiths, Miners, Artists"
	t1 = /obj/effect/proc_holder/spell/invoked/sacred_flame_rogue

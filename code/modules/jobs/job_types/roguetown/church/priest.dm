
/datum/job/roguetown/priest
	title = "Priest"
	flag = PRIEST
	department_flag = CHURCHMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	selection_color = JCOLOR_CHURCH
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen", 
		"Aasimar",
	)
	allowed_patrons = ALL_DIVINE_PATRONS
	tutorial = "The Divine is all that matters in a world of the immoral. The Weeping God left his children to rule over us mortals and you will preach their wisdom to any who still heed their will. The faithless are growing in number, it is up to you to shepard them to a Gods-fearing future."
	whitelist_req = FALSE

	spells = list(/obj/effect/proc_holder/spell/self/convertrole/templar, /obj/effect/proc_holder/spell/self/convertrole/monk)
	outfit = /datum/outfit/job/roguetown/priest

	display_order = JDO_PRIEST
	give_bank_account = 115
	min_pq = 0
	max_pq = null

/datum/outfit/job/roguetown/priest
	allowed_patrons = list(/datum/patron/divine/astrata)

/datum/outfit/job/roguetown/priest/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/roguetown/psicross/astrata
	head = /obj/item/clothing/head/roguetown/priestmask
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/priest
	pants = /obj/item/clothing/under/roguetown/tights/black
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	beltl = /obj/item/keyring/priest
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	id = /obj/item/clothing/ring/active/nomag
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/priest
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/needle/pestra = 1,
		/obj/item/natural/worms/leech/cheele = 1, //little buddy
	)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 6, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 5, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
		H.change_stat("strength", -1)
		H.change_stat("intelligence", 3)
		H.change_stat("constitution", -1)
		H.change_stat("endurance", 1)
		H.change_stat("speed", -1)
	var/datum/devotion/C = new /datum/devotion(H, H.patron) // This creates the cleric holder used for devotion spells
	C.grant_spells_priest(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

	H.verbs |= /mob/living/carbon/human/proc/coronate_lord
	H.verbs |= /mob/living/carbon/human/proc/churchexcommunicate
	H.verbs |= /mob/living/carbon/human/proc/churchannouncement
//	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
//		H.underwear = "Femleotard"
//		H.underwear_color = CLOTHING_BLACK
//		H.update_body()


/mob/living/carbon/human/proc/coronate_lord()
	set name = "Coronate"
	set category = "Priest"
	if(!mind)
		return
	if(!istype(get_area(src), /area/rogue/indoors/town/church/chapel))
		to_chat(src, span_warning("I need to do this in the chapel."))
		return FALSE
	for(var/mob/living/carbon/human/HU in get_step(src, src.dir))
		if(!HU.mind)
			continue
		if(HU.mind.assigned_role == "King")
			continue
		if(!HU.head)
			continue
		if(!istype(HU.head, /obj/item/clothing/head/roguetown/crown/serpcrown))
			continue
		
		//Abdicate previous King
		for(var/mob/living/carbon/human/HL in GLOB.human_list)
			if(HL.mind)
				if(HL.mind.assigned_role == "King" || HL.mind.assigned_role == "Queen Consort")
					HL.mind.assigned_role = "Towner" //So they don't get the innate traits of the king
			//would be better to change their title directly, but that's not possible since the title comes from the job datum
			if(HL.job == "King")
				HL.job = "King Emeritus"
			if(HL.job == "Queen Consort")
				HL.job = "Queen Dowager"

		//Coronate new King (or Queen)
		HU.mind.assigned_role = "King"
		HU.job = "King"
		switch(HU.gender)
			if("male")
				SSticker.rulertype = "King"
			if("female")
				SSticker.rulertype = "Queen"
		SSticker.rulermob = HU
		var/dispjob = mind.assigned_role
		removeomen(OMEN_NOLORD)
		say("By the authority of the gods, I pronounce you Ruler of all Rockhill!")
		priority_announce("[real_name] the [dispjob] has named [HU.real_name] the inheritor of ROCKHILL!", title = "Long Live [HU.real_name]!", sound = 'sound/misc/bell.ogg')

/mob/living/carbon/human/proc/churchexcommunicate()
	set name = "Curse"
	set category = "Priest"
	if(stat)
		return
	var/inputty = input("Curse someone... (curse them again to remove it)", "Sinner Name") as text|null
	if(inputty)
		if(!istype(get_area(src), /area/rogue/indoors/town/church/chapel))
			to_chat(src, span_warning("I need to do this from the chapel."))
			return FALSE
		if(inputty in GLOB.excommunicated_players)
			GLOB.excommunicated_players -= inputty
			priority_announce("[real_name] has forgiven [inputty]. Once more walk in the light!", title = "Hail the Nine!", sound = 'sound/misc/bell.ogg')
			for(var/mob/living/carbon/human/H in GLOB.player_list)
				if(H.real_name == inputty)
					H.remove_stress(/datum/stressevent/psycurse)
			return
		var/found = FALSE
		for(var/mob/living/carbon/human/H in GLOB.player_list)
			if(H == src)
				continue
			if(H.real_name == inputty)
				found = TRUE
				H.add_stress(/datum/stressevent/psycurse)
		if(!found)
			return FALSE
		GLOB.excommunicated_players += inputty
		priority_announce("[real_name] has put Xylix's curse of woe on [inputty] for offending the church!", title = "SHAME", sound = 'sound/misc/excomm.ogg')

/mob/living/carbon/human/proc/churchannouncement()
	set name = "Announcement"
	set category = "Priest"
	if(stat)
		return
	var/inputty = input("Make an announcement", "ROGUETOWN") as text|null
	if(inputty)
		if(!istype(get_area(src), /area/rogue/indoors/town/church/chapel))
			to_chat(src, span_warning("I need to do this from the chapel."))
			return FALSE
		priority_announce("[inputty]", title = "The Priest Speaks", sound = 'sound/misc/bell.ogg')

/obj/effect/proc_holder/spell/self/convertrole/templar
	name = "Recruit Templar"
	new_role = "Templar"
	recruitment_faction = "Templars"
	recruitment_message = "Serve the nine, %RECRUIT!"
	accept_message = "FOR THE NINE!"
	refuse_message = "I refuse."

/obj/effect/proc_holder/spell/self/convertrole/monk
	name = "Recruit Acolyte"
	new_role = "Acolyte"
	recruitment_faction = "Church"
	recruitment_message = "Serve the nine, %RECRUIT!"
	accept_message = "FOR THE NINE!"
	refuse_message = "I refuse."

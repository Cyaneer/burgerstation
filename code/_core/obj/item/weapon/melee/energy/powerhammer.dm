/obj/item/weapon/melee/energy/powerhammer
	name = "powerhammer"
	desc = "A powerhammer."
	desc_extended = "A baton used by Private Security and Space Police. Remember to turn it on before applying it to someone's head, or it will just be a weighty stick."
	icon = 'icons/obj/item/weapons/melee/clubs/powerhammer.dmi'

	can_wield = TRUE
	wield_only = TRUE

	value = 2000
	rarity = RARITY_RARE

	damage_type = /damagetype/melee/club/powerhammer
	damage_type_on = /damagetype/melee/club/powerhammer/on

	drop_sound = 'sound/items/drop/axe.ogg'

	size = SIZE_4
	weight = 30

	var/charge = 1
	var/next_charge = 0

/obj/item/weapon/melee/energy/powerhammer/on/think()
	log_error("boop")
/*	if(caller.dead)
		stop_thinking(src)
		return FALSE*/
	if(world.time < next_charge)
		return TRUE
	next_charge = world.time + SECONDS_TO_DECISECONDS(1)
	if(charge < 3)
		charge += 0.1
		log_error("charge = [charge]")
	if(charge > 3)
		stop_thinking(src)
		return FALSE
	return TRUE

/obj/item/weapon/melee/energy/powerhammer/on/MouseDown()
	start_thinking()
	return ..()

///obj/item/weapon/melee/energy/powerhammer/on/MouseUp()

/obj/item/weapon/melee/energy/powerhammer/on/can_attack(var/atom/attacker,var/atom/victim,var/atom/weapon,var/params,var/damagetype/damage_type)
	if(charge < 1.5)
		return FALSE
	return ..()

/obj/item/weapon/melee/energy/powerhammer/on/attack(damage_multiplier = charge)
	return ..()

/obj/item/weapon/melee/energy/powerhammer/on/on_drop()
	stop_thinking()
	return ..()

/obj/item/weapon/melee/energy/powerhammer/click_self(var/mob/caller)

	. = ..()

	if(.)
		SPAM_CHECK(20)
		if(enabled)
			play_sound('sound/weapons/energy/energy_on.ogg',get_turf(src),range_max=VIEW_RANGE)
		else
			play_sound('sound/weapons/energy/energy_off.ogg',get_turf(src),range_max=VIEW_RANGE)
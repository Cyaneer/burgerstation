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

	var/charge_per_decisecond = 0.1
	var/charge = 1
	var/charge_max = 3

	var/mob/living/advanced/current_user

	var/spam_prevention = 0

	size = SIZE_4
	weight = 30
/*
/obj/item/weapon/melee/energy/powerhammer/on/on_mouse_up(var/mob/caller as mob, var/atom/object,location,control,params)
	if(charge > 1.1 )
//		shoot(caller,object,location,params,max(stage_current/100,0.25))
	charge = 1
//	update_sprite()
	return ..()

/obj/item/weapon/melee/energy/powerhammer/on/on_mouse_up(var/atom/attacker,var/list/atom/victims = list(),var/atom/weapon,var/list/atom/hit_objects = list(),var/atom/blamed,var/damage_multiplier=charge)
	if(charge > 1.1 )
//		shoot(caller,object,location,params,max(stage_current/100,0.25))
//		swing(var/atom/attacker,var/list/atom/victims = list(),var/atom/weapon,var/list/atom/hit_objects = list(),var/atom/blamed,var/damage_multiplier=1)
//		damage_type_on.swing(attacker,victims,weapon,hit_objects,blamed,damage_multiplier)
		weapon.on_mouse_up(attacker,victims,weapon,hit_objects,blamed,damage_multiplier)
	charge = 1
//	update_sprite()
	return ..()*/

/*/obj/item/weapon/melee/energy/powerhammer/on_mouse_up(var/atom/attacker,var/list/atom/victims = list(),var/atom/weapon,var/list/atom/hit_objects = list(),var/atom/blamed,var/damage_multiplier=charge)
	if(!enabled)
		return FALSE
	if(charge > 1.1 )
//		shoot(caller,object,location,params,max(stage_current/100,0.25))
//		swing(var/atom/attacker,var/list/atom/victims = list(),var/atom/weapon,var/list/atom/hit_objects = list(),var/atom/blamed,var/damage_multiplier=1)
//		damage_type_on.swing(attacker,victims,weapon,hit_objects,blamed,damage_multiplier)
//		var/obj/item/P = src
		weapon.on_mouse_up(attacker,victims,weapon,hit_objects,blamed,damage_multiplier)
//		P.attack(attacker,victims,weapon,hit_objects,blamed,damage_multiplier)

	charge = 1
//	update_sprite()
	return FALSE*/

/obj/item/weapon/melee/energy/powerhammer/on_mouse_up(var/atom/attacker,var/atom/victim,var/list/params=list(),var/atom/blamed,var/ignore_distance = FALSE, var/precise = FALSE,var/damage_multiplier=1,var/damagetype = damage_type_on)
	log_error("up")
	if(!enabled)
		return FALSE
	if(charge > 1.1 )
//		shoot(caller,object,location,params,max(stage_current/100,0.25))
//		swing(var/atom/attacker,var/list/atom/victims = list(),var/atom/weapon,var/list/atom/hit_objects = list(),var/atom/blamed,var/damage_multiplier=1)
//		damage_type_on.swing(attacker,victims,weapon,hit_objects,blamed,damage_multiplier)
//		var/obj/item/P = src
		log_error("tried attacking [victim.name] with [src.charge]")
//		src.attack(attacker,victim,params,blamed,ignore_distance,precise,damage_multiplier,damagetype)
//		src.attack()
		attacker.click_on_object(attacker,victim/*,control,params*/)
	stop_thinking(src)
	charge = 1
//	update_sprite()
	return ..()

/obj/item/weapon/melee/energy/powerhammer/click_on_object(var/mob/caller,var/atom/object,location,control,params)
	if(enabled)
		log_error("enabled click")
		if(object.plane >= PLANE_HUD)
			return ..()
		if(object.loc && object.loc.plane >= PLANE_HUD)
			return ..()
		if(!is_advanced(caller))
			return ..()
		current_user = caller
		start_thinking(src)
		if(world.time >= spam_prevention)
//			play_sound(draw_sound,get_turf(src))
			spam_prevention = world.time + 5
		return TRUE
	return ..()

/obj/item/weapon/melee/energy/powerhammer/think()
	log_error("thonk, [src.charge]")

	var/held_down = current_user && !current_user.qdeleting && ((current_user.attack_flags & CONTROL_MOD_LEFT) || (current_user.attack_flags & CONTROL_MOD_RIGHT)) && !(current_user.attack_flags & CONTROL_MOD_DISARM)

	if(charge == 3)
		play_sound('sound/effects/sparks2.ogg',get_turf(src),range_max=VIEW_RANGE)
		stop_thinking(src)
	if(held_down)
		charge = min(charge_max,charge + charge_per_decisecond)
		update_icon() //update_sprite isn't called here as it is intensive.
		. = TRUE
	else
		if(charge > 1)
			charge = 1
//			update_icon()
		stop_thinking(src)

	. = ..() || . //weirdest statement I ever wrote.

/*
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
//	weapon.on_mouse_up
	log_error("beep")
	start_thinking(src)
	. = ..()

/obj/item/weapon/melee/energy/powerhammer/on/on_mouse_up()
	object.attack
	return ..()

///obj/item/weapon/melee/energy/powerhammer/on/MouseUp()

/obj/item/weapon/melee/energy/powerhammer/on/can_attack(var/atom/attacker,var/atom/victim,var/atom/weapon,var/params,var/damagetype/damage_type)
	if(charge < 1.5)
		return FALSE
	return ..()
*/

/obj/item/weapon/melee/energy/powerhammer/attack(damage_multiplier = charge)
	log_error("attac")
	return ..()

/obj/item/weapon/melee/energy/powerhammer/on_drop()
	stop_thinking(src)
	return ..()

/obj/item/weapon/melee/energy/powerhammer/click_self(var/mob/caller)

	. = ..()

	if(.)
		SPAM_CHECK(20)
		if(enabled)
			play_sound('sound/weapons/energy/energy_on.ogg',get_turf(src),range_max=VIEW_RANGE)
		else
			play_sound('sound/weapons/energy/energy_off.ogg',get_turf(src),range_max=VIEW_RANGE)
/obj/hud/button/slot
	name = "slot button"
	var/id = null
	desc = "Slot button for quick actions."
	desc_extended = "Press this button to activate that item on the tile you're pointing."
	icon_state = "square_trim"
	screen_loc = "LEFT,TOP"
	alpha = 200

	flags = FLAGS_HUD_MOB

	var/atom/stored_atom

	var/active = FALSE

	plane = PLANE_HUD

	mouse_over_pointer = MOUSE_ACTIVE_POINTER
	mouse_drag_pointer = MOUSE_ACTIVE_POINTER
	mouse_drop_pointer = MOUSE_ACTIVE_POINTER
	mouse_drop_zone = 1

	mouse_opacity = 2

	has_quick_function = FALSE

/obj/hud/button/slot/Destroy()
	stored_atom = null
	return ..()

/obj/hud/button/slot/proc/activate_button(var/mob/living/advanced/caller)

	if(stored_atom && stored_atom.qdeleting)
		clear_object(caller)
		return FALSE

	var/obj/item/I = stored_atom

	if(istype(I) && I.quick_function_type == FLAG_QUICK_INSTANT)
		stored_atom.quick(caller)
		caller.quick_mode = 0
		animate(src,color="#00FF00",time=1,flags=ANIMATION_PARALLEL)
		animate(color="#FFFFFF",time=5)
	else
		active = !active
		caller.quick_mode = active ? id : null
		if(active)
			animate(src,color="#00FF00",time=1,flags=ANIMATION_PARALLEL)
		else
			animate(src,color="#FFFFFF",time=1,flags=ANIMATION_PARALLEL)

	if(active)
		for(var/obj/hud/button/slot/S in owner.buttons)
			if(S == src)
				continue
			S.active = FALSE
			animate(S,color="#FFFFFF",time=1,flags=ANIMATION_PARALLEL)

	return TRUE

/obj/hud/button/slot/proc/clear_object(var/mob/living/advanced/A)
	if(stored_atom)
		A.to_chat(span("notice","\The [stored_atom.name] was unbound from slot [icon_state]."))
		vis_contents -= stored_atom
		stored_atom = null
	return TRUE

/obj/hud/button/slot/dropped_on_by_object(var/mob/caller,var/atom/object,location,control,params)

	if(stored_atom)
		stored_atom.dropped_on_by_object(caller,object,location,control,params)
		return TRUE

	return clicked_on_by_object(caller,object)

/obj/hud/button/slot/clicked_on_by_object(var/mob/caller,var/atom/object,location,control,params)
	. = ..()

	if(.)
		clear_object(caller)


/obj/hud/button/slot/proc/store_atom(var/mob/caller,var/atom/object,location,control,params)

	if(!is_advanced(caller))
		return FALSE

	if(!is_item(object))
		return FALSE

	var/mob/living/advanced/A = caller

	var/obj/item/I = object

	if(!istype(I) || !I.has_quick_function)
		A.to_chat(span("warning","\The [I.name] doesn't have a quick bind function."))
		return TRUE

	clear_object(A)

	stored_atom = object
	A.to_chat(span("notice","\The [I.name] was bound to slot [maptext]."))
	//animate(src,alpha=255,time=SECONDS_TO_DECISECONDS(1))
	active = FALSE
	vis_contents += stored_atom

	return TRUE

/obj/hud/button/slot/A
	id = "1"
	maptext = "1"
	screen_loc = "LEFT,TOP"

/obj/hud/button/slot/B
	id = "2"
	maptext = "2"
	screen_loc = "LEFT+1,TOP"

/obj/hud/button/slot/C
	id = "3"
	maptext = "3"
	screen_loc = "LEFT+2,TOP"

/obj/hud/button/slot/D
	id = "4"
	maptext = "4"
	screen_loc = "LEFT+3,TOP"

/obj/hud/button/slot/E
	id = "5"
	maptext = "5"
	screen_loc = "LEFT+4,TOP"

/obj/hud/button/slot/F
	id = "6"
	maptext = "6"
	screen_loc = "LEFT+5,TOP"

/obj/hud/button/slot/G
	id = "7"
	maptext = "7"
	screen_loc = "LEFT+6,TOP"

/obj/hud/button/slot/H
	id = "8"
	maptext = "8"
	screen_loc = "LEFT+7,TOP"

/obj/hud/button/slot/I
	id = "96"
	maptext = "9"
	screen_loc = "LEFT+8,TOP"

/obj/hud/button/slot/J
	id = "0"
	maptext = "0"
	screen_loc = "LEFT+9,TOP"
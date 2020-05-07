obj/structure/interactive/objective
	name = "valuable artifact"
	icon = 'icons/obj/structure/objectives.dmi'
	icon_state = "1"

	anchored = FALSE
	collision_flags = FLAG_COLLISION_REAL

	value = 5000

obj/structure/interactive/objective/Initialize()
	name = "[pick(SSname.adjectives)] artifact of [pick(SSname.verbs)]"
	return ..()

obj/structure/interactive/objective/Destroy()
	if(src in SShorde.tracked_objectives)
		SShorde.next_objective_update = world.time + 100
	return ..()

obj/structure/interactive/objective/New(var/desired_loc)
	icon_state = "[rand(1,9)]"
	return ..()
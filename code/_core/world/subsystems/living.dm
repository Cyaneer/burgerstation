/subsystem/living/
	name = "Living Subsystem"
	desc = "Controls the life of mobs."
	tick_rate = DECISECONDS_TO_TICKS(LIFE_TICK)
	priority = SS_ORDER_IMPORTANT

/subsystem/living/Initialize()

	for(var/mob/living/L in all_living)
		L.Initialize()

	LOG_SERVER("Initialized [length(all_living)] living beings.")

/subsystem/living/on_life()

	for(var/mob/living/L in all_living)
		L.on_life()
		if(!L.ckey && L.enable_AI)
			L.on_life_AI()

	return TRUE
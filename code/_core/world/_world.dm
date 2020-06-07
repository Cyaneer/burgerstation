var/global/list/active_subsystems = list()
var/global/ticks = 0
var/global/rollovers = 0
var/global/world_state = STATE_STARTING

/world/
	fps = FPS_SERVER
	icon_size = TILE_SIZE
	view = VIEW_RANGE
	map_format = TOPDOWN_MAP
	sleep_offline = TRUE

	name = "Burgerstation 13"
	hub = "Exadv1.spacestation13"
	hub_password = "kMZy3U5jJHSiBQjr"

	cache_lifespan = 5

	//maxx = WORLD_SIZE
	//maxy = WORLD_SIZE
	//maxz = 1

	turf = /turf/unsimulated/space
	area = /area/space



/world/New()
	..()
	life()

/world/proc/update_status()

	var/server_name = "Burgerstation 13 \[ALPHA TEST SERVER\]"
	var/server_link = "https://discord.gg/yEaV92a"
	var/github_name = "Space Station 13 <b>FROM SCRATCH</b>"

	var/minutes = FLOOR(world.time / 600, 1)
	var/hours = FLOOR(world.time / 36000, 1)

	if(minutes < 10)
		minutes = "0[minutes]"

	var/duration = "[hours]:[minutes]"
	var/map = "Burgerstation (512x512x1)"

	//Format it.
	status = "<a href='[server_link]'><b>[server_name]</b></a>] ([github_name])<br><br>"
	status += "Map: <b>[map]</b><br>"
	status += "Round Duration: <b>[duration]</b>"

/*
/world/Error(var/exception/e)
	var/name = e.name
	var/file = e.file
	var/line = e.line
	var/desc = e.desc

	broadcast_to_role("<span class='system error'>Runtime Error!<br>[name] at line [line] at [file]<br>[desc]</span>",TEXT_OOC,FLAG_PERMISSION_DEVELOPER)

	return TRUE
*/

/world/proc/shutdown_server()
	world_state = STATE_SHUTDOWN
	for(var/client/C in all_clients)
		C << "Shutting down world..."
	shutdown()
	return TRUE


/world/proc/reboot_server()
	world_state = STATE_SHUTDOWN
	for(var/client/C in all_clients)
		C << "Rebooting world. Stick around to automatically rejoin."
	Reboot(0)
	return TRUE

/world/proc/end(var/reason,var/shutdown=FALSE)

	if(world_state != STATE_RUNNING)
		CRASH_SAFE("Can't restart now!")
		return FALSE

	var/nice_reason = "Unknown reason."

	world_state = STATE_ROUND_END

	switch(reason)
		if(WORLD_END_SHUTDOWN)
			nice_reason = "Adminbus."
		if(WORLD_END_NANOTRASEN_VICTORY)
			nice_reason = "Nanotrasen Victory"
			SSpayday.stored_payday += 10000
			SSpayday.trigger_payday()
			announce("Central Command","Mission Success","You completed all the objectives without fucking up too hard, so here is a bonus.")
		if(WORLD_END_SYNDICATE_VICTORY)
			nice_reason = "Syndicate Victory"
			announce("Central Command","Fission Mailed","Mission failed, we'll get them next time.")

	play('sounds/meme/apcdestroyed.ogg',all_mobs_with_clients)

	for(var/mob/living/advanced/player/P in all_players)
		CHECK_TICK
		if(P.dead)
			P.to_chat("Could not save your character because you were dead.")
			continue
		P.mobdata.save_current_character(force = TRUE)
		P.to_chat("Your character was automatically saved.")
		sleep(1)

	if(shutdown)
		broadcast_to_clients(span("notice","Shutting down world in 30 seconds down the world due to [nice_reason]."))
		CALLBACK("shutdown_world",SECONDS_TO_DECISECONDS(30),src,.proc/shutdown_server)
	else
		broadcast_to_clients(span("notice","Rebooting world in 30 seconds down the world due to [nice_reason]."))
		CALLBACK("reboot_world",SECONDS_TO_DECISECONDS(30),src,.proc/reboot_server)


	return TRUE
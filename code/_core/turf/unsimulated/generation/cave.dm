/turf/unsimulated/generation/cave
	name = "lava generation"
	icon_state = "caves"
	var/path_only = FALSE

/turf/unsimulated/generation/cave/path
	icon_state = "caves_path"
	path_only = TRUE

/turf/unsimulated/generation/cave/generate(var/size = WORLD_SIZE)

	if(no_wall)
		new /turf/simulated/floor/colored/dirt/cave(src)
		return ..()

	var/seed_resolution = WORLD_SIZE
	var/x_seed = x / seed_resolution
	var/y_seed = y / seed_resolution

	var/max_instances = 1
	var/noise = 0
	for(var/i=1,i<=max_instances,i++)
		noise += text2num(rustg_noise_get_at_coordinates("[SSturfs.seeds[z+i]]","[x_seed]","[y_seed]"))
	noise *= 1/max_instances

	switch(noise)
		if(-INFINITY to 0.2)
			if(path_only)
				new /turf/simulated/floor/cave_dirt(src)
			else
				if(prob(1))
					new /turf/simulated/floor/cave_dirt(src)
					new /obj/marker/generation/cave_dirt(src)
				else
					new /turf/simulated/wall/rock(src)
					if(prob(1))
						new /obj/marker/generation/rock_wall(src)
		if(0.2 to 0.23)
			new /turf/simulated/floor/cave_dirt(src)
		if(0.23 to 0.28)
			new /turf/simulated/floor/bedrock(src)
			if(prob(3))
				new /obj/marker/generation/cave_dirt_colored(src)
		if(0.28 to 0.38)
			if(path_only)
				new /turf/simulated/floor/cave_dirt(src)
			else
				if(prob(1))
					new /turf/simulated/floor/cave_dirt(src)
					new /obj/marker/generation/cave_dirt(src)
				else
					new /turf/simulated/wall/rock(src)
					if(prob(1))
						new /obj/marker/generation/rock_wall(src)
		if(0.38 to 0.5)
			new /turf/simulated/floor/bedrock(src)
			if(prob(3))
				new /obj/marker/generation/cave_dirt_colored(src)
		if(0.5 to 0.53)
			new /turf/simulated/floor/cave_dirt(src)
		if(0.53 to 0.6)
			if(path_only)
				new /turf/simulated/floor/cave_dirt(src)
			else
				if(prob(1))
					new /turf/simulated/floor/cave_dirt(src)
					new /obj/marker/generation/cave_dirt(src)
				else
					new /turf/simulated/wall/rock(src)
					if(prob(1))
						new /obj/marker/generation/rock_wall(src)
		if(0.6 to 0.75)
			if(path_only)
				new /turf/simulated/floor/cave_dirt(src)
			else
				new /turf/simulated/hazard/water(src)
		if(0.75 to 0.8)
			new /turf/simulated/floor/bedrock(src)
			if(prob(3))
				new /obj/marker/generation/cave_dirt_colored(src)
		if(0.8 to 1)
			if(path_only)
				new /turf/simulated/floor/cave_dirt(src)
			else
				if(prob(1))
					new /turf/simulated/floor/cave_dirt(src)
					new /obj/marker/generation/cave_dirt(src)
				else
					new /turf/simulated/wall/rock(src)
					if(prob(1))
						new /obj/marker/generation/rock_wall(src)

	return ..()
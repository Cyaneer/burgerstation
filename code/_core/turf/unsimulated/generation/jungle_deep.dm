/turf/unsimulated/generation/jungle_deep
	name = "deep jungle generation"
	icon_state = "jungle"
	var/path_only = FALSE

/turf/unsimulated/generation/jungle_deep/path
	icon_state = "jungle_path"
	path_only = TRUE

/turf/unsimulated/generation/jungle_deep/generate(var/size = WORLD_SIZE)

	if(no_wall)
		new /turf/simulated/floor/colored/dirt/jungle(src)
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
		if(-INFINITY to 0.05)
			if(path_only)
				new /turf/simulated/floor/basalt(src)
			else
				new /turf/simulated/wall/rock/basalt(src)
		if(0.05 to 0.1)
			if(path_only)
				new /turf/simulated/floor/basalt(src)
			else
				new /turf/simulated/hazard/lava(src)
		if(0.1 to 0.11)
			if(!path_only && prob(1))
				new /obj/marker/generation/basalt_wall(src)
			new /turf/simulated/floor/basalt(src)
		if(0.11 to 0.12)
			new /turf/simulated/floor/cave_dirt(src)
		if(0.12 to 0.13)
			new /turf/simulated/floor/colored/dirt/jungle(src)
		if(0.13 to 0.15)
			new /turf/simulated/floor/colored/grass/jungle(src)
			if(prob(5))
				new /obj/marker/generation/jungle_rock_grass(src)
			else if(prob(1))
				new /obj/marker/generation/jungle_light_stick(src)
		if(0.15 to 0.4)
			if(prob(1))
				new /obj/marker/generation/jungle_light_flower(src)
			else if(prob(1))
				new /obj/marker/generation/jungle_light_mine(src)
			else if(prob(1))
				new /obj/marker/generation/jungle_high_grass/small(src)
			else if(!path_only)
				if(prob(3))
					new /obj/marker/generation/jungle_tree_small(src)
				else if(prob(1))
					new /obj/marker/generation/jungle_tree(src)
				else if(prob(1))
					new /obj/marker/generation/jungle_high_grass/small(src)
			new /turf/simulated/floor/grass/jungle(src)
		if(0.4 to 0.42)
			new /turf/simulated/floor/colored/grass/jungle(src)
			if(prob(5))
				new /obj/marker/generation/jungle_rock_grass(src)
			else if(prob(1))
				new /obj/marker/generation/jungle_light_lamp(src)
		if(0.42 to 0.44)
			if(path_only)
				new /turf/simulated/floor/colored/dirt/jungle(src)
				if(prob(1))
					new /obj/marker/generation/jungle_wall(src)
			else
				new /turf/simulated/hazard/water/jungle(src)
				if(prob(5))
					new /obj/marker/generation/water/jungle(src)
		if(0.44 to 0.45)
			new /turf/simulated/floor/colored/dirt/jungle(src)
		if(0.45 to 0.47)
			if(path_only)
				new /turf/simulated/floor/colored/dirt/jungle(src)
			else
				new /turf/simulated/wall/rock/brown(src)
				if(prob(1))
					new /obj/marker/generation/jungle_wall(src)
		if(0.47 to 0.48)
			new /turf/simulated/floor/colored/dirt/jungle(src)
		if(0.48 to 0.75)
			if(prob(1))
				new /obj/marker/generation/jungle_high_grass/small(src)
			else if(prob(1))
				new /obj/marker/generation/jungle_light_flower(src)
			else if(prob(2))
				new /obj/marker/generation/jungle_light_mine(src)
			else if(!path_only)
				if(prob(3))
					new /obj/marker/generation/jungle_tree_small(src)
				else if(prob(1))
					new /obj/marker/generation/jungle_tree(src)
				else if(prob(1))
					new /obj/marker/generation/jungle_high_grass/small(src)
			new /turf/simulated/floor/grass/jungle(src)
		if(0.75 to 0.85)
			new /turf/simulated/floor/colored/grass/jungle(src)
			if(prob(5))
				new /obj/marker/generation/jungle_rock_grass(src)
			else if(prob(3))
				new /obj/marker/generation/jungle_light_stick(src)
		if(0.85 to 0.9)
			if(path_only)
				new /turf/simulated/floor/colored/dirt/jungle(src)
			else
				new /turf/simulated/hazard/water(src)
				if(prob(1))
					new /obj/marker/generation/jungle_wall(src)
		if(0.9 to INFINITY)
			if(path_only)
				new /turf/simulated/floor/colored/dirt/jungle(src)
				if(prob(5))
					new /obj/structure/scenery/rocks(src)
			else
				new /turf/simulated/hazard/water(src)
				if(prob(5))
					new /obj/marker/generation/water/jungle(src)

	return ..()
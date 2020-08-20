/obj/item/mech_part/legs

	name = "legs"

	var/maximum_support = 100 //How much these legs can support. Does not count towards itself.

/obj/item/mech_part/legs/loader
	name = "loader legs"
	icon_state = "loader_legs"

	weight = 30

	maximum_support = 75

	//Arms: 20
	//Legs: 30
	//Body: 40
	//Head: 10

/obj/item/mech_part/legs/combat
	name = "combat legs"
	icon_state = "combat_legs"

	weight = 30

	maximum_support = 75

	//Arms: 20
	//Legs: 30
	//Body: 40
	//Head: 10

/obj/item/mech_part/legs/light
	name = "light legs"
	icon_state = "light_legs"

	weight = 20

	maximum_support = 50

	//Arms: 10
	//Legs: 15
	//Body: 20
	//Head: 5

/obj/item/mech_part/legs/heavy
	name = "heavy legs"
	icon_state = "heavy_legs"

	weight = 50

	maximum_support = 100

	//Arms: 40
	//Legs: 60
	//Body: 60
	//Head: 20

/obj/item/mech_part/legs/tracks
	name = "heavy legs"
	icon_state = "tracks"

	weight = 60

	maximum_support = 150

/obj/item/mech_part/legs/spiderlegs
	name = "light legs"
	icon_state = "spiderlegs"

	weight = 20

	maximum_support = 50

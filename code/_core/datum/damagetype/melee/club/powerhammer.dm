/damagetype/melee/club/powerhammer
	name = "inactive powerhammer"

	//The base attack damage of the weapon. It's a flat value, unaffected by any skills or attributes.
	attack_damage_base = list(
		BLUNT = 30
	)

	//How much armor to penetrate. It basically removes the percentage of the armor using these values.
	attack_damage_penetration = list(
		BLUNT = 60,
	)

	attribute_stats = list(
		ATTRIBUTE_STRENGTH = 50
	)

	attribute_damage = list(
		ATTRIBUTE_STRENGTH = BLUNT
	)

	skill_stats = list(
		SKILL_MELEE = 30
	)

	skill_damage = list(
		SKILL_MELEE = BLUNT
	)

	attack_delay = 10
	attack_delay_max = 15

	target_floors = TRUE

/damagetype/melee/club/powerhammer/on
	name = "active powerhammer"

	//The base attack damage of the weapon. It's a flat value, unaffected by any skills or attributes.
	attack_damage_base = list(
		BLUNT = 20,
		BOMB = 30,
	)

	attack_damage_penetration = list(
		BLUNT = 40,
		BOMB = 60,
	)

	attribute_stats = list(
		ATTRIBUTE_STRENGTH = 40
	)

	attribute_damage = list(
		ATTRIBUTE_STRENGTH = BLUNT
	)

	skill_stats = list(
		SKILL_MELEE = 15
	)

	skill_damage = list(
		SKILL_MELEE = list(BLUNT,BOMB)
	)

	attack_delay = 10
	attack_delay_max = 15

/damagetype/melee/club/powerhammer/on/get_critical_hit_condition(var/atom/attacker,var/atom/victim,var/atom/weapon,var/atom/hit_object)
	if(is_wall(victim))
		return TRUE
	return ..()

/damagetype/melee/club/powerhammer/on/do_critical_hit(var/atom/attacker,var/atom/victim,var/atom/weapon,var/atom/hit_object,var/list/damage_to_deal)
	if(is_wall(victim))
		return 4
	return ..()
/damagetype/ranged/magic/ice
	name = "ice shard"

	//The base attack damage of the weapon. It's a flat value, unaffected by any skills or attributes.
	attack_damage_base = list(
		PIERCE = 60*0.2,
		COLD = 60*0.3
	)

	attribute_stats = list(
		ATTRIBUTE_INTELLIGENCE = 60*0.25
	)

	attribute_damage = list(
		ATTRIBUTE_INTELLIGENCE = COLD
	)

	skill_stats = list(
		SKILL_SORCERY = 60*0.25
	)

	skill_damage = list(
		SKILL_SORCERY = COLD
	)

	bonus_experience_skill = list(
		SKILL_SORCERY = 75 //75%
	)
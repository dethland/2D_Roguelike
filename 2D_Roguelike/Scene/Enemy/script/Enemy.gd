extends KinematicBody2D

export var health = 100
export(String, "Player", "Enemy") var mob_type = "Enemy"

func get_hit(from_object, damage):
	# invlunerable during Hurt animation (pozdnm)
	print(health)
	# handle getting hurt (pozdnm)
	health -= damage;
	# handle the hurt animation here


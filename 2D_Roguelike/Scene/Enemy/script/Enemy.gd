extends KinematicBody2D

export var health = 100
export(String, "Player", "Enemy") var mob_type = "Enemy"

func get_hit(from_object, damage):
	# invlunerable during Hurt animation (pozdnm)
	# handle getting hurt (pozdnm)
	health -= damage;
	if health <= 0:
		die()
	# handle the hurt animation here

func die():
	print("%s died" % self.name)
	queue_free()

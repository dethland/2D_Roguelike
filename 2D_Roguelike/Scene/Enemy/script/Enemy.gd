extends KinematicBody2D

export var health = 100
export(String, "Player", "Enemy") var mob_type = "Enemy"

func get_hit(from_object, damage):
	# invlunerable during Hurt animation (pozdnm)
	if get_node("Statemachine").show_active_state() == "Hurt": return
	
	# handle getting hurt (pozdnm)
	health -= damage;
	get_node("Statemachine").change_state_to("Hurt");


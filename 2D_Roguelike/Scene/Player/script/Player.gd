extends KinematicBody2D

export var health = 100
export(String, "Player", "Enemy") var type = "Player"

func get_hit(from_object, damage):
	# parry handling
	if get_node("Statemachine").show_active_state() == "Parry":
		# handle parry here
		return	
	
	# invlunerable during Hurt animation (pozdnm)
	if get_node("Statemachine").show_active_state() == "Hurt": return
	
	# handle getting hurt (pozdnm)
	health -= damage;
	get_node("Statemachine").change_state_to("Hurt");
	
	

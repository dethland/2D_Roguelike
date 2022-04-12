extends KinematicBody2D

#This is vital for search don't delete again
var is_player = true

export var health = 100
export(String, "Player", "Enemy") var mob_type = "Player"


func get_hit(from_object, damage):
	# parry handling
	if get_node("Statemachine").show_active_state() == "Parry":
		get_node("Statemachine").get_node("Parry").success()
		# handle parry here
		return	

	# invlunerable during Hurt animation (pozdnm)
	if get_node("Statemachine").show_active_state() == "Hurt": return
	
	# handle getting hurt (pozdnm)
	if get_node("Statemachine").show_active_state() == "Jump":
		get_node("Statemachine/Jump").velocity.y = 0
		get_node("Statemachine/Jump").leave_floor = false
		
	health -= damage;
	get_node("Statemachine").change_state_to("Hurt");
	
	if health <= 0:
		die()
	
func die():
	print("%s died" % self.name)
	get_tree().change_scene("res://Scene/GUI/GameOver.tscn")
	

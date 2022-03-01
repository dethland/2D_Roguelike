extends "res://Scene/Player/script/player_script_template.gd"

var is_parry = false

var parry_lockout = 1

func _ready():
	is_parry = false

func test_parry() -> bool:
	return is_parry
	
func sucessful_parry() -> void:
	is_parry = false
	statemachine.change_state_to("Idle")
	print("parried")

func unsucessful_parry() -> void:
	is_parry = false
	statemachine.change_state_to("Idle")
	print("failed")

func _physics_process(delta):
	#print(parry_lockout)
	
	if parry_lockout > 0:
		parry_lockout -= delta
	elif Input.is_action_just_pressed("parry"):
		is_parry = true
		statemachine.change_state_to("Parry")
		print("parry")


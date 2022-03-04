extends "res://Scene/Player/script/player_script_template.gd"

var is_parry = false

const parry_lockout = 5
const parry_duration = 3
var curr_duration = parry_duration
var curr_lockout = parry_lockout

func turn_on()->void:
	.turn_on()
	animator._play("hurt");

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
	if is_parry:
		curr_duration -= delta
		if curr_duration <= 0:
			statemachine.change_state_to("Idle")
			is_parry = false
			curr_duration = parry_duration
	elif curr_lockout > 0:
		curr_lockout -= delta
	elif Input.is_action_just_pressed("parry"):
		is_parry = true
		statemachine.change_state_to("Parry")
		# play parry animation
		print("parry")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "hurt":
		statemachine.change_state_to("Idle");


func hurt():
	print("hurting")
	var parry = test_parry()
	if parry:
		sucessful_parry()
	else:
		unsucessful_parry()
		print("ouch")


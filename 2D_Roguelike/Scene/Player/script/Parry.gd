extends "res://Scene/Player/script/player_script_template.gd"

const parry_cooldown = 6
const parry_duration = 5

var able_to_parry = true
var parry_success = false

func _ready():
	var timer_duration = Timer.new()
	var timer_cooldown = Timer.new()
	
	timer_duration.name = "parry_duration_timer"
	timer_cooldown.name = "parry_cooldown_timer"
	
	timer_duration.connect("timeout", self, "reset_to_idle")
	timer_cooldown.connect("timeout", self, "cooldown_reset")
	
	timer_duration.one_shot = true
	timer_cooldown.one_shot = true
	
	add_child(timer_duration)
	add_child(timer_cooldown)
	
func turn_on():
	.turn_on();
	if able_to_parry:
		get_node("parry_duration_timer").start(parry_duration)
		get_node("parry_cooldown_timer").start(parry_cooldown)
	else:
		reset_to_idle()
		.turn_off()

func _physics_process(delta):
	if is_able:
		if able_to_parry:
			print("parrying");
			able_to_parry = false
			# insert parry effects here
			pass
	pass

func reset_to_idle():
	parry_success = false
	print("reset")
	statemachine.change_state_to("Idle")
	
func cooldown_reset():
	able_to_parry = true;
	
func can_parry() -> bool:
	return able_to_parry

func success():
	print("parried")
	parry_success = true
	reset_to_idle()
	get_node("parry_duration_timer").stop()
	
	

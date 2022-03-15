extends "res://Scene/Player/script/player_script_template.gd"

const parry_cooldown = 5
const parry_duration = 3
var curr_duration = parry_duration
var curr_cooldown = 0

var able_to_parry = true

func _ready():
	var parry_cooldown_timer = Timer.new()
	parry_cooldown_timer.connect("timeout",self,"parry_reset")
	parry_cooldown_timer.name = "parry_cooldown_timer"
	parry_cooldown_timer.one_shot = true
	add_child(parry_cooldown_timer);
	
func turn_on():
	.turn_on();
	print(get_children())
	get_node("parry_cooldown_timer").start(parry_duration);

func _physics_process(delta):
	if is_able:
		# wip effects of parry
		return
	return

func parry_reset():
	statemachine.change_state_to("Idle");

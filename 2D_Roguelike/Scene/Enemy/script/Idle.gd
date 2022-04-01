extends "res://Scene/Enemy/script/enemy_script_template.gd"

export var speed : float = 30

var velocity = Vector2.ZERO
var reverse_walk_protection_trigger : bool = true
var reverse_walk_protection_timer : Timer

#var running_timer = 0
#var stop_timer = 0
#var Stop_Or_Run = true 
#var ram_stop = 0 	
	
func walk() -> void:
	# Enemy will walk across the paltform with random stop
	if left_edge_detection.is_colliding() or right_edge_detection.is_colliding():
		if reverse_walk_protection_trigger:
			velocity.x *= -1
			reverse_walk_protection_timer.start(3)
			reverse_walk_protection_trigger = false
			
	enemy.move_and_slide(velocity, Vector2.UP)
	face_direction()
	animator.play("walk");

func reverse_walk_trigger_reset():
	reverse_walk_protection_trigger = true

func _ready() -> void:
	reverse_walk_protection_timer = Timer.new()
	reverse_walk_protection_timer.one_shot = true
	self.add_child(reverse_walk_protection_timer)
	reverse_walk_protection_timer.connect("timeout", self, "reverse_walk_trigger_reset")
	
	randomize()
	velocity.x = speed
	
func _physics_process(delta)-> void:
		
	if able:
		enemy.move_and_slide(Vector2.ZERO, Vector2.UP)
		walk()

	apply_gravity(-98, delta)
	
var last_scale = Vector2.ONE

func face_direction():
	var dir = velocity.x;
	if (dir > 0): 	 last_scale = Vector2(-1,1);
	elif (dir < 0):  last_scale = Vector2( 1,1);
	enemy.scale = last_scale
	# undo the artifacts of scaling (pozdnm)
	enemy.global_rotation = 0;

func _on_Search_range_body_entered(body):
	if able:
		if body.is_in_group("Player"):
				statemachine.change_state_to("Search")

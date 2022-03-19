extends "res://Scene/Enemy/script/enemy_script_template.gd"

export var speed : float = 30

var velocity = Vector2.ZERO
#var running_timer = 0
#var stop_timer = 0
#var Stop_Or_Run = true 
#var ram_stop = 0 


func walk() -> void:
	# Enemy will walk across the paltform with random stop
	if not enemy.is_on_wall() or not left_edge_detection.is_colliding() or not right_edge_detection.is_colliding():
		pass
	else:
		velocity.x *= -1
	velocity = enemy.move_and_slide(velocity, Vector2.UP)
	face_direction()
	animator.play("walk");


func _ready() -> void:
	randomize()
	velocity.x = speed
	
func _physics_process(delta)-> void:
#	if Stop_Or_Run:
#		if (enemy.is_on_wall() or running_timer >= 500) : 
#			# run to a wall or out range in running mode
#			velocity*=-1.0
#			running_timer=0
#		elif running_timer == ram_stop :
#			#when running find stop point ,ramdomlize next stop point ,start stoping count down
#			ram_stop = randi()%500
#			Stop_Or_Run = false
#		else:
#			velocity = enemy.move_and_slide(velocity, Vector2.UP)
#			running_timer+=1
#	else:
#		if stop_timer >= 100 :
#			# stop end start running 
#			Stop_Or_Run = true
#			stop_timer=0
#		stop_timer+=1
		
	if able:
		enemy.move_and_slide(Vector2.ZERO, Vector2.UP)
		if enemy.is_on_wall():
			print("hit wall")
		
		walk()
	apply_gravity(-98, delta)
	
var last_scale = Vector2.ONE
func face_direction():
	var dir = velocity.x;
	if (dir < 0): 	 last_scale = Vector2(-1,1);
	elif (dir > 0):  last_scale = Vector2( 1,1);
	enemy.scale = last_scale
	# undo the artifacts of scaling (pozdnm)
	enemy.global_rotation = 0;

func _on_Search_range_body_entered(body):
	if able:
		if body.is_in_group("Player"):
				statemachine.change_state_to("Search")

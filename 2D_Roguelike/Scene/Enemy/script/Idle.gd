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
	enemy.move_and_slide(velocity, Vector2.UP)


func _ready() -> void:
	randomize()
	velocity.x = speed
#	ram_stop = randi() % 300
#	print(ram_stop)
#	running_timer=0

	
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
#			print(running_timer)
#	else:
#		if stop_timer >= 100 :
#			# stop end start running 
#			Stop_Or_Run = true
#			stop_timer=0
#		stop_timer+=1
		
	if check_able():
		enemy.move_and_slide(Vector2.ZERO, Vector2.UP)
		if enemy.is_on_wall():
			print("hit wall")
		
		walk()
	apply_gravity(-98, delta)
		
		
		

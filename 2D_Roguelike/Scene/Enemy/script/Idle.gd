extends "res://Scene/Enemy/script/enemy_script_template.gd"

class_name Idle

export var gravity = 20

var velocity:=Vector2(-40,0)
var running_timer := 0
var stop_timer:=0
var Stop_Or_Run:=true 
var ram_stop:=0
# enemy willl search in a range ,it will change direcation when touch a wall or move at the edge of range
#to make it more real, enemy will ramdomly choose stop or run
# stop_or_run = ture when running ,false when stoping
func _ready() -> void:
	#var direction = Vector2.ZERO
	#velocity.x = direction.x * speed
	ram_stop=randi() % 300
	running_timer=0
func _physics_process(delta: float)-> void:
	#if is_able:
	if Stop_Or_Run :
		if (player.is_on_wall() or running_timer >= 500) : 
			# run to a wall or out range in running mode
			velocity*=-1.0
			running_timer=0
		elif running_timer == ram_stop :
			#when running find stop point ,ramdomlize next stop point ,start stoping count down
			ram_stop = randi()%500
			Stop_Or_Run = false
		else:
			velocity = player.move_and_slide(velocity, Vector2.UP)
			running_timer+=1
	else:
		if stop_timer >= 100 :
			# stop end start running 
			Stop_Or_Run = true
			stop_timer=0
		stop_timer+=1

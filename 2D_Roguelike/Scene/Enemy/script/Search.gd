extends "res://Scene/Enemy/script/enemy_script_template.gd"

var detect : Area2D
var objs_in_area : Array
var velocity = Vector2.ZERO
var speed = 70
var max_distance = 10
var is_chasing = false

func _ready():
#  detect = get_parent().get_parent().get_node("player_detection")
	pass

func _process(delta):
#  objs_in_area = detect.get_overlapping_bodies()
	pass

func _physics_process(delta):
#	if objs_in_area.size() > 1 && is_able:
#		for obj in objs_in_area:
#			if obj.get("is_player"):
#				velocity = (obj.position-enemy.position).normalized() * speed
#				is_chasing = true
#				is_able = false
#			else:
#				velocity = Vector2.ZERO
#				is_chasing = false
#				is_able = true
#	else:
#		velocity = Vector2.ZERO
#		is_chasing = false
#		is_able = true
#
#	velocity = enemy.move_and_slide(velocity, Vector2.UP)
	if is_able:
		pass

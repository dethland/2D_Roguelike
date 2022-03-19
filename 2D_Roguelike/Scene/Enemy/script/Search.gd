extends "res://Scene/Enemy/script/enemy_script_template.gd"

var detect : Area2D
var objs_in_area : Array
var velocity = Vector2.ZERO
var speed = 70
var max_distance = 10

func _ready():
  detect = get_parent().get_parent().get_node("Search_range")

func turn_on()->void:
	.turn_on()
	animator.play("walk");

func _process(delta):
  objs_in_area = detect.get_overlapping_bodies()

func _physics_process(delta):
	if able:
		if objs_in_area.size() > 1:
			for obj in objs_in_area:
				if obj.get("is_player"):
					velocity = (obj.position-enemy.position).normalized() * speed
				else:
					velocity = Vector2.ZERO
		velocity.y = 0
		velocity = enemy.move_and_slide(velocity, Vector2.UP)
		face_direction();
	else:
		velocity = Vector2.ZERO

var last_scale = Vector2.ONE
func face_direction():
	var dir = velocity.x;
	if (dir > 0): 	 last_scale = Vector2(-1,1);
	elif (dir < 0):  last_scale = Vector2( 1,1);
	enemy.scale = last_scale
	# undo the artifacts of scaling (pozdnm)
	enemy.global_rotation = 0;

func _on_Battle_range_body_entered(body):
	if able:
		if body.is_in_group("Player"):
			statemachine.change_state_to("Fight")


func _on_Search_range_body_exited(body):
	if able:
		if body.is_in_group("Player"):
				statemachine.change_state_to("Idle")

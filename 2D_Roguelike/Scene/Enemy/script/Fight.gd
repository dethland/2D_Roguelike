extends "res://Scene/Enemy/script/enemy_script_template.gd"

var detect : Area2D
var objs_in_area : Array

func _ready():
	detect = get_parent().get_parent().get_node("Battle_range")

func turn_on()->void:
	.turn_on()
	attack();

func turn_off()->void:
	.turn_off();
	# make sure we do not keep attacking
	$AttackTimer.stop();

func player_in_range() -> bool:
	objs_in_area = detect.get_overlapping_bodies()
	if objs_in_area.size() > 1:
		for obj in objs_in_area:
			if obj.is_in_group("Player"):
				return true
	return false

func attack():
	# face player
#	enemy.get_node("Icon").flip_h = enemy.global_position.x > player;
	# play anim
	animator.play("attack");
	# do damage is handled in the anim
	# manually requeue the timer
	$AttackTimer.start();
	pass
	
func _on_Battle_range_body_exited(body):
	# if the player is no longer in range, 
	# break out of the fight state
	if body.is_in_group("Player"):
		statemachine.change_state_to("Search");
		return;

func _on_Hitbox_body_entered(body):
	if body.is_in_group("Player"):
		body.get_hit(self, 10);

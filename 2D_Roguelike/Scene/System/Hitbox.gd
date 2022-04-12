extends Area2D

export var damage = 10
export(String, "Enemy", "Player") var target = "Enemy"
export var animation_name : String
export var is_able : bool = true

var in_range_object = []
var hit_once : bool = true

func _on_Hitbox_body_entered(body):
	if body.get("mob_type") != null:
		if body.mob_type == target:
			in_range_object.append(body)


func _on_Hitbox_body_exited(body):
	if in_range_object.has(body):
		in_range_object.erase(body)


func hurt():
	for target in in_range_object:
		try_play_attack_sound()
		target.get_hit(self, damage)


func _process(delta):
	if is_able:
		if Input.is_action_pressed("ui_down"):
			hit_once = true
		if hit_once:
			hit_once = false
			hurt()


var played_attack_sound = false;
func try_play_attack_sound():
	if (played_attack_sound): return
	if ($AttackSound.playing): return
	$AttackSound.play();
	played_attack_sound = true

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == animation_name:
		hit_once = true
		played_attack_sound = false

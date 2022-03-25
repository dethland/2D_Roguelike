extends Control


onready var bar = $Container/Bars/Health/HealthBar
onready var tween = $Container/Bars/Health/Tween
var player : KinematicBody2D
var prev_health : int
var curr_health : int


# Called when the node enters the scene tree for the first time.
func _ready():
	#player = get_parent().get_parent().get_node("Player")
	player = $"../../Player"
	bar.value = player.health
	prev_health = player.health

func _process(delta):
	curr_health = player.health
	if(curr_health != prev_health):
		tween.interpolate_property(bar, "value", prev_health, curr_health, .6, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
	
	prev_health = curr_health
	

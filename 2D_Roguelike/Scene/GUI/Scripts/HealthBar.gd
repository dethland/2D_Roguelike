extends Control

onready var flash = preload("res://Asset/UI/healthbar_cover_flash.png")
onready var normal = preload("res://Asset/UI/healthbar_cover.png")
onready var bar = $Container/Bars/Health/HealthBar
onready var tween = $Container/Bars/Health/Tween
var player : KinematicBody2D
var prev_health : int
var curr_health : int


# Called when the node enters the scene tree for the first time.
func _ready():
	player = $"../../Player"
	bar.value = player.health
	prev_health = player.health

func _process(delta):
	curr_health = player.health
	if(curr_health != prev_health):
		tween.interpolate_property(bar, "value", prev_health, curr_health, .3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
	prev_health = curr_health
	

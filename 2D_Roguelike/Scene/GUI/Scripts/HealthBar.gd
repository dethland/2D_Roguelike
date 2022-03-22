extends Control


var bar : TextureProgress
var player : KinematicBody2D
var prev_health : int


# Called when the node enters the scene tree for the first time.
func _ready():
	bar = get_node("HBoxContainer").get_node("Bars").get_node("Health").get_node("HealthBar")
	player = get_parent().get_parent().get_node("Player")

func _process(delta):
	bar.value = player.health
	# Check if current health is different from last recorded health
	# Wait half a second before changing second bar
	

extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var tb : TextureProgress
var enemy : KinematicBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	tb = get_child(0)
	enemy = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	tb.value = enemy.get("health")

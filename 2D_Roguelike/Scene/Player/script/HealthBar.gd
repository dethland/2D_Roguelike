extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pb : ProgressBar
var player : KinematicBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pb = get_child(0)
	player = get_parent().get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pb.value = player.get("health")

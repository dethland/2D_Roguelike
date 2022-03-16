extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func play():
	get_tree().change_scene("res://Scene/Levels/Level1Demo.tscn")

func quit():
	get_tree().quit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button2_pressed():
	play() # Replace with function body.


func _on_Button3_pressed():
	quit() # Replace with function body.

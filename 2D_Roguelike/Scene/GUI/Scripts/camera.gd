extends Camera2D

onready var player = get_parent().get_node("Player")
#This function gets called every frame
func _process (delta):
  
  position = player.position

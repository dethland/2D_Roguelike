extends Camera2D

onready var player = get_parent().get_node("Player")

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS

#This function gets called every frame
func _process (delta):
  position = player.position

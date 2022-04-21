extends Area2D

func _ready():
	connect("body_entered", self, "on_player_entered")
	
func on_player_entered(body):
	set_visible(false)
	

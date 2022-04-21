extends Area2D

const PLAYERNAME = "Player"
onready var door = get_node("..")
onready var Door = $AnimatedSprite
func _ready():
	connect("body_entered", self, "_on_body_enter")
	connect("process", self, "_process")
	
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		var bodies = get_overlapping_bodies()
		for body in bodies:
			if (body.get_name() == PLAYERNAME):
				if (door.animation == "open"):
					door.play("close")
					var collisionShape = door.get_node("StaticBody2D/CollisionShape2D")
					collisionShape.disabled = false
				else:
					door.play("open")
					var collisionShape = door.get_node("StaticBody2D/CollisionShape2D")
					collisionShape.disabled = true
					
func _on_body_enter(body):
	print(body.get_name() + " entered the area")
							


func _on_Area2D_body_entered(body):
	if (body.get_name() == PLAYERNAME):
		
		get_tree().change_scene("res://level 2.tscn")
			
			
	

extends KinematicBody2D

var speed = 200
var player = null
var velocity = Vector2.ZERO
var ACCEL = 100

func _ready():
	pass

func _physics_process(delta):
	var player = get_node("../Player")
	if player:
		var dir =(player.position - self.position).normalized()
		if dir.x>dir.y:
			dir.y = 0
		else:
			dir.x = 0
		
		move_and_slide(dir*speed)
	
	


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		queue_free()
		get_tree().change_scene("res://GUI/Game Over.tscn")

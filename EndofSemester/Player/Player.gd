extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 20
const MAXFALLSPEED = 800
const MAXSPEED = 400
const JUMPFORCE = 800

var motion = Vector2()
var facing_right = true
const ACCEL = 80

onready var sounds = $Step2
onready var t = Timer.new()


func _ready():
	pass
	
func _physics_process(delta):
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
		
	motion.x = clamp(motion.x, -MAXSPEED, MAXSPEED)
	if facing_right == true:
		$Sprite.scale.x = 1
	else:
		$Sprite.scale.x = -1
	
	if Input.is_action_pressed("right"):
		motion.x += ACCEL
		facing_right = true
		if sounds.is_playing() == false:
				
			sounds.play()
			
	elif Input.is_action_pressed("left"):
		motion.x -= ACCEL
		facing_right = false
		if sounds.is_playing() == false:
				
			sounds.play()
			
			
	else:
		sounds.stop()
		motion.x = lerp(motion.x, 0, 0.2)
		
	if is_on_floor():	
		if Input.is_action_pressed("jump"):
			motion.y = -JUMPFORCE
	motion = move_and_slide(motion, UP)
	 
	
	


func _on_Void_body_entered(body):
	queue_free()
	get_tree().change_scene("res://GUI/Game Over.tscn")

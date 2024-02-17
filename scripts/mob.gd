extends CharacterBody2D

@export var player : CharacterBody2D 
var speed = 300
func _ready():
	$Slime.play_idle()

func _physics_process(delta):
	#var direction = global_position.direction_to(player.global_position)
	var direction = (player.global_position - global_position).normalized()
	velocity = direction * speed
	
	move_and_slide()

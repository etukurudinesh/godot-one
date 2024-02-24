extends CharacterBody2D

@export var player : CharacterBody2D 
var health : int = 6


var speed : float = 300.0
func _ready():
	$Slime.play_walk()

func _physics_process(delta):
	#var direction = global_position.direction_to(player.global_position)
	var direction = (player.global_position - global_position).normalized()
	velocity = direction * speed
	move_and_slide()
	
func take_damage():
	health -= 1
	%Slime.play_hurt()
	if health <= 0:
		queue_free()
		
		const EXPLOSION = preload("res://smoke_explosion/smoke_explosion.tscn")
		var explosion = EXPLOSION.instantiate()
		get_parent().add_child(explosion)
		explosion.global_position = global_position



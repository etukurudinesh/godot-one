extends CharacterBody2D

var speed : float = 600.0

func _ready():
	get_node("HappyBoo").play_idle_animation()

func _physics_process(delta):
	
	var direction : Vector2 = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * speed
	
	# if magnitude is not 0 -> walk animation else idle animation
	if velocity.length():
		get_node("HappyBoo").play_walk_animation()
	else:
		$HappyBoo.play_idle_animation()

	move_and_slide()

extends CharacterBody2D

var speed : float = 400.0
var health = 100.0
const DAMAGE_RATE = 5.0

signal health_depleted

func _ready():
	get_node("HappyBoo").play_idle_animation()

func _physics_process(delta):
	
	var direction : Vector2 = Input.get_vector("move_left","move_right","move_up","move_down")
	#velocity = lerp(Vector2(0,0), direction * speed, 0.95)
	#velocity = direction * speed
	velocity = velocity.slerp(direction * speed, 0.6)
	move_and_slide()
	# if magnitude is not 0 -> walk animation else idle animation
	if velocity.length():
		get_node("HappyBoo").play_walk_animation()
	else:
		$HappyBoo.play_idle_animation()
		
	var overlapping_bodies : Array = %HurtBox.get_overlapping_bodies()
	
	if overlapping_bodies.size() > 0:
		health -= DAMAGE_RATE * overlapping_bodies.size() * delta
		if health <= 0:
			health_depleted.emit()

	

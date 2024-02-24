extends Area2D

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		'''
		# nearest enemy
		
		var nearest_enemy = enemies_in_range[0]
		for _enemy in enemies_in_range:
			if(calcDistanceToObject(_enemy) <= calcDistanceToObject(nearest_enemy)):
				nearest_enemy = _enemy
		'''
		var enemy = enemies_in_range.front()
		look_at(enemy.global_position)
		
		
# calculate the magnitude from gun to a given object
func calcDistanceToObject(entity):
	return abs((global_position - entity.global_position).length())

func shoot() -> void:
	const BULLET = preload("res://scenes/bullet.tscn") # loading a bullet into memory
	var bullet = BULLET.instantiate() # generate a bullet in the scene
	%ShootingPoint.add_child(bullet)
	bullet.global_position = %ShootingPoint.global_position # position the bulltet
	
	
func _on_timer_timeout():
	shoot()

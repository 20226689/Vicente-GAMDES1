extends Node2D

@export var planet_big_tscn: PackedScene

func _on_timer_timeout():
	var new_planet_big = planet_big_tscn.instantiate()
	
	var viewport_with = get_viewport_rect().size.x
	var rand_x = randf_range(0, viewport_with)
	new_planet_big.position.x = rand_x
	new_planet_big.position.y = -50

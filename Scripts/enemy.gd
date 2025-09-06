extends Area2D

@export var speed: float = 400
@onready var mainScene = $"../.."

func _process(delta):
	position.y += speed * delta
	

func _on_area_entered(area):
	self.queue_free()
	spawn_explosion()
	mainScene.score += 10

func spawn_explosion():
	var explosion = preload("res://Scenes/enemy_explode.tscn").instantiate()
	get_parent().add_child(explosion)
	explosion.global_position = global_position

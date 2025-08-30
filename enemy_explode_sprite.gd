extends Sprite2D

func _ready():
	$EnemyExplodeSpriteAnimation.play("explode")
	await $EnemyExplodeSpriteAnimation.animation_finished
	queue_free()

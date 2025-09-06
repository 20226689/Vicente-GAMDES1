extends Area2D

@export var laser_tcsn: PackedScene
@export var speed: float = 600.0  # movement speed (pixels per second)

@onready var mainScene = $".."

func _ready():
	$PlayerBody/ThrusterRight/Right.play("ThrusterLeft")
	$PlayerBody/ThrustersLeft/Left.play("ThrusterRight")
	
func _process(delta):
	var velocity = Vector2.ZERO

	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1

	var screen_size = get_viewport_rect().size

	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	if velocity != Vector2.ZERO:
		velocity = velocity.normalized() * speed * delta
		position += velocity

	if Input.is_action_just_pressed("fire"):
		var new_laser = laser_tcsn.instantiate()
		add_sibling(new_laser)
		new_laser.position = self.position


func _on_area_entered(area):
	if area.is_in_group("enemy"):
		self.queue_free()
		mainScene.is_game_over = true

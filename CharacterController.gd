extends Node2D

@export var speedModifier = 1;
var screenSize;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screenSize = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if(Input.is_action_pressed("move_up")): velocity.y -= 1;
	if(Input.is_action_pressed("move_down")): velocity.y += 1;
	if(Input.is_action_pressed("move_left")): velocity.x -= 1;
	if(Input.is_action_pressed("move_right")): velocity.x += 1;
	if velocity.length() > 0:
		velocity = velocity.normalized() * speedModifier
		position += velocity * delta
		position = position.clamp(Vector2.ZERO, screenSize)
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	

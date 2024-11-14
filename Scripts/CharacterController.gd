extends Node2D

@export var cooldown_timer: Timer;
@export var speedModifier = 1;
signal shot_pressed;
var screenSize;

const MOVE_LEFT = &"move_left"
const MOVE_RIGHT = &"move_right"
const MOVE_UP = &"move_up"
const MOVE_DOWN = &"move_down"
const SHOOT = &"shoot"

enum LastHorizontalDirection {
	LEFT,
	RIGHT,
}

enum LastVerticalDirection {
	UP,
	DOWN
}

var lastVerticalDirection: LastVerticalDirection
var lastHorizontalDirection: LastHorizontalDirection

var velocity = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screenSize = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_pressed(SHOOT)):
		if(cooldown_timer.time_left <= 0):
			emit_signal("shot_pressed")
			cooldown_timer.start()
	if(Input.is_action_just_pressed(MOVE_UP)):
		lastVerticalDirection = LastVerticalDirection.UP
	if(Input.is_action_just_pressed(MOVE_DOWN)):
		lastVerticalDirection = LastVerticalDirection.DOWN
	if(Input.is_action_just_pressed(MOVE_LEFT)):
		lastHorizontalDirection = LastHorizontalDirection.LEFT
	if(Input.is_action_just_pressed(MOVE_RIGHT)):
		lastHorizontalDirection = LastHorizontalDirection.RIGHT
	velocity = Vector2.ZERO
	velocity = socd_handler(lastHorizontalDirection, lastVerticalDirection)
	#velocity.x = Input.get_axis(MOVE_LEFT, MOVE_RIGHT)
	#velocity.y = Input.get_axis(MOVE_UP, MOVE_DOWN)
	#velocity = Input.get_vector(MOVE_LEFT, MOVE_RIGHT, MOVE_UP, MOVE_DOWN)
	if velocity.length() > 0:
		velocity = velocity.normalized() * speedModifier
		position += velocity * delta
		position = position.clamp(Vector2.ZERO, screenSize)
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop();
	
func socd_handler(lastXDirection: LastHorizontalDirection, lastYDirection: LastVerticalDirection) -> Vector2:
	var vec = Input.get_vector(MOVE_LEFT, MOVE_RIGHT, MOVE_UP, MOVE_DOWN)
	match lastXDirection:
		LastHorizontalDirection.LEFT:
			var Lvec = Input.get_action_strength(MOVE_LEFT)
			if(Lvec >= 0.5):
				vec.x = -Lvec
		LastHorizontalDirection.RIGHT:
			var Rvec = Input.get_action_strength(MOVE_RIGHT)
			if(Rvec >= 0.5):
				vec.x = Rvec
	match lastYDirection:
		LastVerticalDirection.UP:
			var Uvec = Input.get_action_strength(MOVE_UP)
			if(Uvec >= 0.5):
				vec.y = -Uvec
		LastVerticalDirection.DOWN:
			var Dvec = Input.get_action_strength(MOVE_DOWN)
			if(Dvec >= 0.5):
				vec.y = Dvec
	return vec

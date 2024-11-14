extends Node2D

@export var speed: float;
@export var detector: Area2D;
@export var visibility: VisibleOnScreenNotifier2D;
var direction: Vector2;
signal entity_touched;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	direction = global_transform.basis_xform(Vector2.RIGHT)

func _on_timeout() -> void:
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += direction * speed * delta;

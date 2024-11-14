extends Node2D

@export var distance: float = 200;
@export var spread: float_value;
var direction;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	direction = global_transform.basis_xform(Vector2.RIGHT)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	queue_redraw()

func _draw() -> void:
	draw_arc(position, 100.0, -spread.g(), spread.g(), 100.0, Color.GREEN, 10.0, true)

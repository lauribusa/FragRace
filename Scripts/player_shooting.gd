extends Node2D
@export var projectile: PackedScene;
@export var projectileNumber: int;
@export var spread: float_value;

# Called when the node enters the scene tree for the first time.

func _process(delta: float) -> void:
	queue_redraw()

func _generate_bullets():
	var proj: Node2D = projectile.instantiate()
	var degs: float = _to_degrees(spread.g())
	proj.global_rotation += randf_range(-degs, degs)
	get_tree().root.add_child(proj)
	proj.global_position = self.global_position
	
func _on_shooting():
	for n in projectileNumber:
		_generate_bullets()
	

func _to_degrees(val: float) -> float:
	return fmod(val, 360)

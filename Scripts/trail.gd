extends Line2D
class_name Trail2D
@onready var curve: Curve2D = Curve2D.new();

var max_points: int = 2000
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	curve.add_point(get_parent().position)
	if(curve.get_baked_points().size() > max_points):
		curve.remove_point(0)
	points = curve.get_baked_points()

func _stop():
	set_process(false)
	var tween : Tween = get_tree().create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 3.0)
	await tween.finished
	queue_free()

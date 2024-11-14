extends Node2D
class_name float_value

var default_font : Font = ThemeDB.fallback_font;

@export var absolute: bool = false;
@export var value: float = 0.0;
# Called when the node enters the scene tree for the first time.
func g() -> float:
	return value
	
func s(value: float) -> void:
	self.value = value

func _process(delta: float) -> void:
	_debug_input()

func _debug_input() -> void:
	if(Input.is_key_pressed(KEY_KP_ADD)):
		value += 0.01
		queue_redraw()
	if(Input.is_key_pressed(KEY_KP_SUBTRACT)):
		value -= 0.01
		if(absolute): 
			value = 0 if value < 0 else value;
		queue_redraw()

func _draw():
	draw_string(default_font, Vector2(20, 130), "%s" % value, HORIZONTAL_ALIGNMENT_CENTER, 90, 22)

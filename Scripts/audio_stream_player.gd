extends AudioStreamPlayer

@export var files: Array[AudioStreamWAV]

func _on_call():
	var sfx = _get_random_file()
	stream = sfx
	play()

func _get_random_file() -> AudioStreamWAV:
	var random = randf_range(0, files.size())
	return files[random]

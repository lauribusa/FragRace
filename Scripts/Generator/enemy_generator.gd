extends Node2D

signal spawn
@export var enemy_prefab: PackedScene;
@export var timer: Timer;
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	timer.timeout.connect(_spawn_asset())

func _spawn_asset():
	var instance: Node2D = enemy_prefab.instantiate()
	get_tree().root.add_child(instance)
	instance.global_position = self.global_position

extends Node

export (Array, PackedScene) var levels: Array

onready var current_level_container: Node = $CurrentLevelContainer

## This won't run by itself. Use all variables and functions necessary to run this correctly.
func _ready():
	_setup_level(0)
	
func _setup_level(id: int) -> void:
	print(levels.size())
	if id >= 0 && id < levels.size():
		if current_level_container.get_child_count() > 0:
			for child in current_level_container.get_children():
				current_level_container.remove_child(child)
				child.queue_free()
		
		var level_instance: GameLevel = levels[id].instance()
		current_level_container.add_child(level_instance)


## Hint: for pause check the SceneTree.paused property.

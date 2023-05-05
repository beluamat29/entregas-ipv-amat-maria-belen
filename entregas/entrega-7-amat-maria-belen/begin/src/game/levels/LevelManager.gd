extends Node

export (Array, PackedScene) var levels: Array

onready var current_level_container: Node = $CurrentLevelContainer
onready var pauseMenu:TextureRect = $UI/Menus/PauseMenu

func _ready():
	_setup_level(0)
	
func _setup_level(id: int) -> void:
	if id >= 0 && id < levels.size():
		if current_level_container.get_child_count() > 0:
			for child in current_level_container.get_children():
				current_level_container.remove_child(child)
				child.queue_free()
		
		var level_instance: GameLevel = levels[id].instance()
		current_level_container.add_child(level_instance)


func _on_PauseButton_pressed():
	get_tree().paused = true
	pauseMenu.visible = true


func _on_ResumeButton_pressed():
	get_tree().paused = false
	pauseMenu.visible = false
	
func _on_QuitButton_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://src/screens/MainMenu.tscn")

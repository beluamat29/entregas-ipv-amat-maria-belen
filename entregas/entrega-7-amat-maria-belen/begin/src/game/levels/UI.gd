extends CanvasLayer

onready var pauseMenu:TextureRect = $Menus/PauseMenu
onready var pauseButton:Button = $GUI/PauseButton

func togglePausedScene():
	get_tree().paused = !get_tree().paused
	
func _on_PauseButton_pressed():
	togglePausedScene()
	pauseMenu.visible = true
	pauseButton.visible = false

func _on_ResumeButton_pressed():
	togglePausedScene()
	pauseMenu.visible = false
	pauseButton.visible = true
	
func _on_QuitButton_pressed():
	togglePausedScene()
	get_tree().change_scene("res://src/screens/MainMenu.tscn")

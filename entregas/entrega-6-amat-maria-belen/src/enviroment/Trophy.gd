extends Area2D

onready var win_text = $WinText

func _on_Trophy_body_entered(body):
	win_text.display_win_text()

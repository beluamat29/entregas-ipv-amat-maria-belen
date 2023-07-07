extends Area2D

onready var animation:AnimationPlayer = $Sprite/AnimationPlayer

func _on_Trophy_body_entered(body) -> void:
	animation.play("spin")

func notify_win():
	GameState.notify_level_won()
	print("You win!")
	call_deferred("_remove")

func _remove() -> void:
	get_parent().remove_child(self)
	queue_free()


func _on_AnimationPlayer_animation_finished(anim_name):
	notify_win()

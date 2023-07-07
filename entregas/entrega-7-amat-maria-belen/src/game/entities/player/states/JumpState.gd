extends AbstractState

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func enter() -> void:
	character.velocity.y = -character.jump_speed
	character.snap_vector = Vector2.ZERO

func update(delta:float) -> void:
	character._handle_cannon_actions()
	character._handle_move_input()
	character._apply_movement()
	if character.is_on_floor():
		if character.move_direction != 0:
			emit_signal("finished", "walk")
		else:
			emit_signal("finished", "idle")	

extends AbstractState

func enter() -> void:
	character._remove()

func update(delta:float) -> void:
	character._apply_movement()

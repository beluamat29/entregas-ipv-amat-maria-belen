extends Position2D

onready var cannon_tip:Sprite = $Tip

func flip_tip(b):
	if(b):
		cannon_tip.position.x = cannon_tip.position.x * -0.01
	else:
		cannon_tip.position.x = cannon_tip.position.x * 0.01
	cannon_tip.flip_h = b

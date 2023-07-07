extends Node

onready var highlight1Animation:AnimationPlayer = $Sprite/AnimationPlayer
onready var highlight2Animation:AnimationPlayer = $Sprite2/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func hide():
	self.visible = false

func display_and_play():
	self.visible = true
	highlight1Animation.play("throw")
	highlight2Animation.play("throw")

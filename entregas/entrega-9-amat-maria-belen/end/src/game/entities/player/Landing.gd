extends Node2D

onready var mudAnimation: AnimationPlayer = $Mud/AnimationPlayer
onready var mudAnimation2: AnimationPlayer = $Mud2/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func play_landing_animation():
	self.visible = true
	mudAnimation.play("mud")
	mudAnimation2.play("mud")

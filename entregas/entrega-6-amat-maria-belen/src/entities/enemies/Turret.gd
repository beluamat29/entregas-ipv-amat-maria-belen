extends StaticBody2D

onready var fire_position = $FirePosition
onready var fire_timer = $FireTimer
onready var raycast = $RayCast2D

export (PackedScene) var projectile_scene

var target
var projectile_container

onready var _animated_sprite = $AnimatedSprite

func _ready():
	fire_timer.connect("timeout", self, "fire")
	set_physics_process(false)
	_animated_sprite.play("idle")

func initialize(container, turret_pos, projectile_container):
	container.add_child(self)
	global_position = turret_pos
	self.projectile_container = projectile_container
	_animated_sprite.play("idle")

func fire():
	if target != null:
		var proj_instance = projectile_scene.instance()
		if projectile_container == null:
			projectile_container = get_parent()
		proj_instance.initialize(projectile_container, fire_position.global_position, fire_position.global_position.direction_to(target.global_position))
		fire_timer.start()
		_animated_sprite.play("attack")

func _physics_process(delta):
	raycast.set_cast_to(raycast.to_local(target.global_position))
	if raycast.is_colliding() && raycast.get_collider() == target:
		if fire_timer.is_stopped():
			fire_timer.start()
	elif !fire_timer.is_stopped():
		fire_timer.stop()


func notify_hit():
	print("I'm turret and imma die")
	call_deferred("_remove")

func _remove():
	_animated_sprite.play("die")
	get_parent().remove_child(self)
	queue_free()


func _on_DetectionArea_body_entered(body):
	if target == null:
		target=body
		set_physics_process(true)

func _on_DetectionArea_body_exited(body):
	if body == target:
		target = null
		set_physics_process(false)
		_animated_sprite.play("idle")
		

extends CharacterBody3D

@export var speed: float = 5.0

func _physics_process(delta):
	var input_dir = Vector3(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		0,
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	input_dir = input_dir.normalized()

	# update velocity and move the player
	velocity.x = input_dir.x * speed
	velocity.z = input_dir.z * speed

	move_and_slide()

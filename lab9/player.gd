extends CharacterBody3D

@export var speed: float = 5.0

func _physics_process(delta):
	var input_dir = Vector3.ZERO
	input_dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_dir.z = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_dir = input_dir.normalized()

	velocity.x = input_dir.x * speed
	velocity.z = input_dir.z * speed

	# use move_and_slide() function
	move_and_slide()

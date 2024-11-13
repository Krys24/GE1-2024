extends CharacterBody3D

# speed variables
var speed = 5.0
var rotation_speed = 2.0

# track current rotation as a Quaternion
var current_rotation = Quaternion()

func _process(delta):
	# reset direction vector
	var direction = Vector3.ZERO

	# capture input
	if Input.is_action_pressed("ui_up"):
		direction.z -= 1
	if Input.is_action_pressed("ui_down"):
		direction.z += 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1

	# check if any direction key is pressed
	if direction.length() > 0:
		# normalize direction for consistent speed
		direction = direction.normalized()

		# calculate target rotation quaternion
		var target_rotation = Basis().looking_at(direction, Vector3.UP).get_rotation_quaternion()
		
		current_rotation = current_rotation.slerp(target_rotation, rotation_speed * delta)
		
		# update transform basis with new rotation
		transform.basis = Basis(current_rotation)

		# set velocity to move in forward direction
		velocity = transform.basis.z * -speed
	else:
		# stop moving when no input is given
		velocity = Vector3.ZERO

	# apply movement
	move_and_slide()

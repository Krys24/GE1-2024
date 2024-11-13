extends CharacterBody3D

# movement speed
var speed = 10.0

func _physics_process(delta):
	# reset velocity
	var direction = Vector3.ZERO

	# detect input and set direction vector 
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.z += 1
	if Input.is_action_pressed("ui_up"):
		direction.z -= 1

	# normalize direction to avoid faster diagonal movement
	if direction.length() > 0:
		direction = direction.normalized() * speed

	# set velocity and call move_and_slide()
	velocity.x = direction.x
	velocity.z = direction.z
	move_and_slide()

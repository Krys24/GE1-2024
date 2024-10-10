extends CharacterBody3D

# speed
var speed = 10

func _physics_process(delta):
	var dir = Vector3.ZERO

	# capture input from user
	if Input.is_action_pressed("ui_up"):
		dir.z -= 1
	if Input.is_action_pressed("ui_down"):
		dir.z += 1
	if Input.is_action_pressed("ui_left"):
		dir.x -= 1
	if Input.is_action_pressed("ui_right"):
		dir.x += 1
		
	# set velocity based on direction * speed
	velocity.x = dir.x * speed
	velocity.z = dir.z * speed

	# move character using built-in velocity property
	move_and_slide()

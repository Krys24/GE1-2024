extends CharacterBody3D

# required variables
@export var speed = 5.0
@export var bullet_scene = preload("res://Bullet.tscn")  # loads bullet scene
@export var shoot_speed = 20.0

func _ready():
	pass

func _process(delta):
	var direction = Vector3()

	# input for movement
	if Input.is_action_pressed("ui_right"):
		direction.x -= 1
	if Input.is_action_pressed("ui_left"):
		direction.x += 1
	if Input.is_action_pressed("ui_up"):
		direction.z += 1
	if Input.is_action_pressed("ui_down"):
		direction.z -= 1

	# apply movement
	if direction != Vector3.ZERO:
		direction = direction.normalized() * speed
		velocity = direction * speed  # velocity is based on direction and speed
		move_and_slide()  

	# make camera follow player
	var camera_node = $Camera  
	if camera_node:  # ensure camera exists
		var camera_pos = transform.origin + Vector3(0, 5, -10)  # position behind and above player
		camera_node.global_transform.origin = camera_pos
		camera_node.look_at(transform.origin, Vector3.UP)  # camera looks at player

func _input(event):
	if event.is_action_pressed("shoot"):  # "F" key mapped as "shoot"
		shoot()

# shoot function
func shoot():
	var bullet = bullet_scene.instantiate()
	bullet.global_transform.origin = global_transform.origin + global_transform.basis.z * -2  # position in front of player
	get_parent().add_child(bullet)  # add bullet to scene

extends Camera3D

@export var move_speed: float = 10.0  # movement speed
@export var look_sens: float = 0.3  # mouse sensitivity

var velocity: Vector3 = Vector3.ZERO  # to store movement direction
var rotation_enabled: bool = true  # allows enabling/disabling mouse rotation

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)  # hides & captures the cursor

func _process(delta):
	handle_input(delta)
	handle_mouse_look(delta)

func handle_input(delta):
	velocity = Vector3.ZERO

	# to move forward/backward
	if Input.is_action_pressed("move_forward"):
		velocity -= transform.basis.z
	if Input.is_action_pressed("move_backward"):
		velocity += transform.basis.z

	# to move left/right
	if Input.is_action_pressed("move_left"):
		velocity -= transform.basis.x
	if Input.is_action_pressed("move_right"):
		velocity += transform.basis.x

	# t move up/down
	if Input.is_action_pressed("move_up"):
		velocity += transform.basis.y
	if Input.is_action_pressed("move_down"):
		velocity -= transform.basis.y

	# normalising velocity to maintain a constant speed
	velocity = velocity.normalized() * move_speed * delta

	# apply movement
	translate(velocity)

func handle_mouse_look(delta):
	if rotation_enabled:
		var mouse_movement = Input.get_last_mouse_velocity()

		# rotate camera based on mouse movement
		rotate_y(deg_to_rad(-mouse_movement.x * look_sens))  # horizontal movement 
		var rotation_degrees = deg_to_rad(mouse_movement.y * look_sens)
		rotate_object_local(Vector3(1, 0, 0), rotation_degrees)  # vertical movement 

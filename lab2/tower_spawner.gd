extends Node3D

@export var radius: float = 2.0  # radius to arrange bricks
@export var number_of_bricks: int = 10
@export var height: int = 5  # height
@export var brick_scene: PackedScene
@export var spawn_dist: float = 5.0  # distance from camera to spawn towers

# reference for camera controller
var camera: Camera3D

func _ready():
	if not brick_scene:
		print("No brick scene assigned")
		
	# get camera from scene
	camera = get_node("Camera3D")  # camera node

# check for input action in _input function
func _input(event):
	# bricks spawned using "f" key
	if Input.is_action_just_pressed("spawn_bricks"):
		spawn_tower()

func spawn_tower():
	if camera:
		# get camera's forward direction
		var forward_direction = -camera.transform.basis.z.normalized()  # Inverse the z-axis to get forward
		# calculate spawn position based on camera's position & forward direction
		var spawn_pos = camera.global_transform.origin + forward_direction * spawn_dist

		var angle_step: float = 2 * PI / number_of_bricks  # angle between each brick in radians

		for h in range(height * 2):  # double height of tower
			var new_height = h * 0.5  # reduced height spacing for closer layers

			# loop and spawn num of bricks based on declared var
			for i in range(number_of_bricks):
				var angle = i * angle_step
				var x = radius * cos(angle)
				var z = radius * sin(angle)

				# instance the brick
				var brick_instance = brick_scene.instantiate()
				
				# set position of brick relative to spawn position
				brick_instance.transform.origin = spawn_pos + Vector3(x, new_height, z)
				
				# rotate brick to face outward
				brick_instance.look_at(Vector3(0, new_height, 0))

				# add brick to scene
				add_child(brick_instance)

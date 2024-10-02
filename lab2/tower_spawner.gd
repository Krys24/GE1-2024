extends Node3D

@export var radius: float = 5.0
@export var number_of_bricks: int = 10
@export var height: int = 5
@export var brick_scene: PackedScene

func _ready():
	if brick_scene:
		spawn_tower()

func spawn_tower():
	var angle_step: float = 2 * PI / number_of_bricks  # angle between each brick in radians

	for h in range(height):
		var current_height = h * 2  # spacing between layers (height)

		# loop and spawn num of bricks based on declared var
		for i in range(number_of_bricks):
			var angle = i * angle_step
			var x = radius * cos(angle)
			var z = radius * sin(angle)

			# instance the brick
			var brick_instance = brick_scene.instantiate()
			
			# set position of brick
			brick_instance.transform.origin = Vector3(x, current_height, z)
			
			# rotate brick to face outward
			brick_instance.look_at(Vector3(0, current_height, 0))

			# add brick to the scene
			add_child(brick_instance)

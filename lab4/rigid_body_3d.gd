extends RigidBody3D

@export var speed = 20.0  # bullet speed

func _ready():
	# set initial velocity for bullet's movement
	linear_velocity = -transform.basis.z * speed  # move bullet forward
	add_to_group("bullets")
	
	# wait 5 seconds and remove the bullet
	await get_tree().create_timer(5.0).timeout
	queue_free()

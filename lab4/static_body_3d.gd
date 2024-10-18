extends StaticBody3D  

func _ready():
	# connect signal script
	$Area3D.connect("body_entered", Callable(self, "_on_Area3D_body_entered"))

# define method thats connected to 'body_entered' signal
func _on_Area3D_body_entered(body):
	if body.is_in_group("bullets"):  # check if body is in bullets group
		queue_free()  # remove enemy cube

func _on_area_3d_body_entered(body: Node3D) -> void:
	pass 

extends Node3D

@export var chunk_scene: PackedScene
@export var chunk_size: float = 20.0
@export var render_distance: int = 3

var active_chunks = {}

func _process(delta):
	# get Player node
	var player = get_node_or_null("../Player") 
	if player == null:
		return

	# Get player's global position
	var player_pos = player.global_transform.origin

	# calculate which chunk player is in
	var player_chunk = Vector2(round(player_pos.x / chunk_size), round(player_pos.z / chunk_size))

	# load chunks within render distance
	for x in range(-render_distance, render_distance + 1):
		for z in range(-render_distance, render_distance + 1):
			var chunk_coord = player_chunk + Vector2(x, z)
			if not active_chunks.has(chunk_coord):
				_create_chunk(chunk_coord)

	# remove far chunks
	var keys = active_chunks.keys()
	for key in keys:
		if key.distance_to(player_chunk) > render_distance:
			_remove_chunk(key)

func _create_chunk(chunk_coord):
	if chunk_scene == null:
		print("Chunk scene is not set!")
		return

	var chunk = chunk_scene.instantiate()
	chunk.position = Vector3(chunk_coord.x * chunk_size, 0, chunk_coord.y * chunk_size)
	add_child(chunk)
	active_chunks[chunk_coord] = chunk

func _remove_chunk(chunk_coord):
	if active_chunks.has(chunk_coord):
		var chunk = active_chunks[chunk_coord]
		if chunk:
			chunk.queue_free()
		active_chunks.erase(chunk_coord)

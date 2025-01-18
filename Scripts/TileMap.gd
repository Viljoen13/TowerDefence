extends TileMap

func _ready():
	var screen_width = ProjectSettings.get("display/window/size/width")
	var screen_height = ProjectSettings.get("display/window/size/height")
	var tile_width = 32 # Replace with your tile width
	var tile_height = 32 # Replace with your tile height

	# Calculate the number of tiles needed to cover the screen
	var cols = int(screen_width / tile_width) + 2
	var rows = int(screen_height / tile_height) + 2 - 20

	centered_textures = true
	cell_quadrant_size = 16
	MODE_SQUARE
	cell_y_sort = true
	cell_half_offset
	
	
	# Fill the TileMap
	#for y in range(rows):
	#	for x in range(cols):
	#		set_cell(x, y, 0)  # Replace 0 with the correct tile ID
	
	
	
func place_tower(global_position: Vector2):
	var snapped_position = snap_to_grid(global_position)
	var tower_instance = preload("res://Scenes//ArcherTower.tscn").instance()
	add_child(tower_instance)
	tower_instance.position = snapped_position



func snap_to_grid(global_position: Vector2):
	# Convert the global position to the nearest cell
	var cell_position = self.world_to_map(global_position)
	# Convert the cell back to world position (center of the cell)
	return self.map_to_world(cell_position)

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		# Get the mouse's global position
		var mouse_position = get_global_mouse_position()
		# Call the place_tower function with the mouse position
		place_tower(mouse_position)

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
	for y in range(rows):
		for x in range(cols):
			set_cell(x, y, 0)  # Replace 0 with the correct tile ID
	
	

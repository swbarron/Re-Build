extends TileMap

const grass_block_atlas_pos = Vector2i (0, 1)
const wood_log_atlas_pos = Vector2i (3, 3)
const boundary_atlas_pos = Vector2i (9, 2)

enum layers{
	level0 = 0,
	level1 = 1,
	level2 = 2,
	level3 = 3,
	level4 = 4,
	level5 = 5,
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func place_boundaries():
	var offsets = [
		Vector2i(0, -1),
		Vector2i(0, 1),
		Vector2i(1, 0),
		Vector2i(-1, 0),
	]
	
	var used = get_used_cells(layers.level0)
	for spot in used:
		for offset in offsets:
			var current_spot = spot + offset
		# this spot is empty idk man
			if get_cell_source_id(layers.level0, current_spot) == -1:
				print("sex?")
				#set_cell(layers.level0, current_spot, boundary_atlas_pos)
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

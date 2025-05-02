extends Node2D

@onready var mouse_label: Label = $mouse_pos

@onready var mouse: Area2D = $mouse


@onready var y_0: TileMapLayer = $Y_layers/y0
@onready var y_1: TileMapLayer = $Y_layers/y1
@onready var y_2: TileMapLayer = $Y_layers/y2
@onready var y_3: TileMapLayer = $Y_layers/y3
@onready var y_4: TileMapLayer = $Y_layers/y4
@onready var y_5: TileMapLayer = $Y_layers/y5
@onready var y_6: TileMapLayer = $Y_layers/y6
@onready var y_7: TileMapLayer = $Y_layers/y7


# defines the atlas position of block types
const grass_block = Vector2i(0, 1)
const stone_block = Vector2i(0, 5)
const wood_log = Vector2i(3, 3)
const leaf_block = Vector2i(2, 4)
# atlas source used just for the set_cell command
const main_source = 0
var open_block = y_1
var placeable_block = y_1


func y_level_find():
	if y_7.get_cell_source_id(y_7.local_to_map(get_global_mouse_position())) == -1:
		pass
	else:
		open_block = y_7
	if y_6.get_cell_source_id(y_6.local_to_map(get_global_mouse_position())) == -1:
		pass
	else:
		open_block = y_6
	if y_5.get_cell_source_id(y_5.local_to_map(get_global_mouse_position())) == -1:
		pass
	else:
		open_block = y_5
	if y_4.get_cell_source_id(y_4.local_to_map(get_global_mouse_position())) == -1:
		pass
	else:
		open_block = y_4
	if y_3.get_cell_source_id(y_3.local_to_map(get_global_mouse_position())) == -1:
		pass
	else:
		open_block = y_3
	if y_2.get_cell_source_id(y_2.local_to_map(get_global_mouse_position())) == -1:
		pass
	else:
		open_block = y_2
	if y_1.get_cell_source_id(y_1.local_to_map(get_global_mouse_position())) == -1:
		pass
	else:
		open_block = y_1
		
		
		
	
	if y_6.get_cell_source_id(y_6.local_to_map(get_global_mouse_position())) == 0:
		pass
	else:
		placeable_block = y_7
	if y_5.get_cell_source_id(y_5.local_to_map(get_global_mouse_position())) == 0:
		pass
	else:
		placeable_block = y_6
	if y_4.get_cell_source_id(y_4.local_to_map(get_global_mouse_position())) == 0:
		pass
	else:
		placeable_block = y_5
	if y_3.get_cell_source_id(y_3.local_to_map(get_global_mouse_position())) == 0:
		pass
	else:
		placeable_block = y_4
	if y_2.get_cell_source_id(y_2.local_to_map(get_global_mouse_position())) == 0:
		pass
	else:
		placeable_block = y_3
	if y_1.get_cell_source_id(y_1.local_to_map(get_global_mouse_position())) == 0:
		pass
	else:
		placeable_block = y_2
	if y_0.get_cell_source_id(y_0.local_to_map(get_global_mouse_position())) == 0:
		pass
	else:
		placeable_block = y_1
	

func place_block():
	var place_mouse_pos = placeable_block.local_to_map(get_global_mouse_position())
	var break_mouse_pos = y_1.local_to_map(get_global_mouse_position())

	#if Input.is_action_pressed("left_click"):
		#placeable_block.set_cell(place_mouse_pos, main_source, grass_block)
		
	#elif Input.is_action_just_pressed("right_click"):
		#open_block.set_cell(break_mouse_pos, -1, grass_block)
	#print(placeable_block)
		
	
		
	


func mouse_coords(): # Find the closed (x, y) coordinates to where the mouse is
	var mouse_pos = y_0.local_to_map(get_local_mouse_position())
	mouse_label.text = str(mouse_pos)
	


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	y_1.set_cell(Vector2i(5, 8), main_source, Vector2i(3,3)) # shows how to place a block with code
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	mouse_coords()
	

func detect_block():
	pass

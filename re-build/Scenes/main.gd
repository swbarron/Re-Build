extends Node2D

@onready var mouse_label: Label = $mouse_pos

@onready var mouse: Area2D = $mouse

@onready var ray_cast_top: RayCast2D = $Ray_cast_top
@onready var ray_cast_left: RayCast2D = $Ray_cast_left
@onready var ray_cast_right: RayCast2D = $Ray_cast_right


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
var block_side = "mid"

func place_block():
	if Input.is_action_pressed("left_click"):
		y_1.set_cell(y_1.map_to_local(get_global_mouse_position()), main_source, grass_block)


func touching():
	if Input.is_action_pressed("left_click"):
		if ray_cast_top.is_colliding():
			block_side = "top"
			where_to_place()
			place_block()
		elif ray_cast_left.is_colliding():
			block_side = "left"
		elif ray_cast_right.is_colliding():
			block_side = "right"

func where_to_place():
	var mouse_pos = y_1.map_to_local(mouse.position)

	if block_side == "top":
		if y_6.get_cell_source_id(mouse_pos) == 0:
			pass
		else:
			placeable_block = y_7
		if y_5.get_cell_source_id(mouse_pos) == 0:
			pass
		else:
			placeable_block = y_6
		if y_4.get_cell_source_id(mouse_pos) == 0:
			pass
		else:
			placeable_block = y_5
		if y_3.get_cell_source_id(mouse_pos) == 0:
			pass
		else:
			placeable_block = y_4
		if y_2.get_cell_source_id(mouse_pos) == 0:
			pass
		else:
			placeable_block = y_3
		if y_1.get_cell_source_id(mouse_pos) == 0:
			pass
		else:
			placeable_block = y_2
		if y_0.get_cell_source_id(mouse_pos) == 0:
			pass
		else:
			placeable_block = y_1
	
		
	
var glbl_mouse_pos = Vector2i(0, 0)

func mouse_coords(): # Find the closed (x, y) coordinates to where the mouse is
	glbl_mouse_pos = y_0.local_to_map(mouse.position)
	glbl_mouse_pos.x += 3
	glbl_mouse_pos.y += 1
	mouse_label.text = str(glbl_mouse_pos)
	


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	y_1.set_cell(Vector2i(5, 8), main_source, Vector2i(3,3)) # shows how to place a block with code
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	mouse_coords()

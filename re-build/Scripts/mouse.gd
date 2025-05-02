extends Area2D
@onready var y_0: TileMapLayer = $"../Y_layers/y0"
@onready var y_1: TileMapLayer = $"../Y_layers/y1"
@onready var y_2: TileMapLayer = $"../Y_layers/y2"
@onready var y_3: TileMapLayer = $"../Y_layers/y3"
@onready var y_4: TileMapLayer = $"../Y_layers/y4"
@onready var y_5: TileMapLayer = $"../Y_layers/y5"
@onready var y_6: TileMapLayer = $"../Y_layers/y6"
@onready var y_7: TileMapLayer = $"../Y_layers/y7"

@onready var mouse: Area2D = $"."
@onready var ray_cast_top: RayCast2D = $Ray_cast_top
@onready var ray_cast_left: RayCast2D = $Ray_cast_left
@onready var ray_cast_right: RayCast2D = $Ray_cast_right

var block_side = "mid"
var placeable_block = y_1

const wood_log = Vector2i(3, 3)
const main_source = 0


func touching():
	if Input.is_action_pressed("left_click"):
		if ray_cast_top.is_colliding():
			block_side = "top"
			where_to_place()
			placeable_block.set_cell(y_1.local_to_map(get_global_mouse_position()), main_source, wood_log)
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
	

func _process(_delta: float) -> void:
	global_position = get_global_mouse_position()
	touching()

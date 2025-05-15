extends Area2D
@onready var y_0: TileMapLayer = $"../Y_layers/y0"
@onready var y_1: TileMapLayer = $"../Y_layers/y1"
@onready var y_2: TileMapLayer = $"../Y_layers/y2"
@onready var y_3: TileMapLayer = $"../Y_layers/y3"
@onready var y_4: TileMapLayer = $"../Y_layers/y4"
@onready var y_5: TileMapLayer = $"../Y_layers/y5"
@onready var y_6: TileMapLayer = $"../Y_layers/y6"
@onready var y_7: TileMapLayer = $"../Y_layers/y7"
@onready var main: Node2D = $".."

@onready var mouse: Area2D = $"."
@onready var ray_cast_top: RayCast2D = $Ray_cast_top
@onready var ray_cast_left: RayCast2D = $Ray_cast_left
@onready var ray_cast_right: RayCast2D = $Ray_cast_right

var block_side = "mid"
var place_test = Vector2i(5, 6)
const wood_log = Vector2i(3, 3)
const main_source = 0

func where_touching():
	if ray_cast_top.is_colliding():
		block_side = "top"
	elif ray_cast_left.is_colliding():
		block_side = "left"
	elif ray_cast_right.is_colliding():
		block_side = "right"
	
func _input(_event: InputEvent) -> void:
	touching()
	
	
	
func touching():
	var placeable_block = y_1
	var mouse_pos = main.glbl_mouse_pos

	if block_side == "top":
		if Input.is_action_pressed("left_click"):
			print(mouse_pos)
			print(y_0.local_to_map(get_global_mouse_position()))
			if y_1.get_cell_source_id(mouse_pos) == 0:
				placeable_block = y_2
				placeable_block.set_cell(mouse_pos, main_source, wood_log)
			else:
				mouse_pos.x -= 1
				mouse_pos.y -= 1
				placeable_block.set_cell(mouse_pos, main_source, wood_log)
	
	
	

func where_to_place():
	var placeable_block = y_1
	var move_to_2 = false
	var mouse_pos = y_1.local_to_map(mouse.position)
	mouse_pos.x += 4
	mouse_pos.y += 2
	
	if y_1.get_cell_source_id(mouse_pos) == 0:
		placeable_block = y_2
	elif y_2.get_cell_source_id(mouse_pos) == 0:
		placeable_block = y_3
	
	


func _process(_delta: float) -> void:
	global_position = get_global_mouse_position()
	where_touching()
	

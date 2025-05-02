extends Node2D


@onready var y_1: TileMapLayer = $y1
@onready var player: CharacterBody2D = $CharacterBody2D
const main_source = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	y_1.set_cell(Vector2i(5, 8), main_source, Vector2i(3,3))
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(get_global_mouse_position())

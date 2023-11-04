@tool
extends Node2D

@export var ReadFrom:TileMap
@export var Paint: Array[TileMap] = []
@export var dirty: bool

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(dirty):
		dirty = false
		churn_data()

func churn_data():
	var blocks = get_all_blocks()
	print(blocks.size())
	
func get_all_blocks():
	var used = ReadFrom.get_used_cells(0)
	var blocks: Array[Array] = []
	while not used.is_empty() : 
		var open:Vector2i = used.pop_front()
		var block = get_block(open)
		for v2 in block:
			used.erase(v2)
		blocks.append(block)
	return blocks
	
func get_block(origin:Vector2i):
	var open: Array[Vector2i] = []
	open.append(origin)
	for v2 in open:
		var nearby = ReadFrom.get_surrounding_cells(v2)
		for v22 in nearby:
			if(open.count(v22) > 0):
				continue
			var data = ReadFrom.get_cell_tile_data(0,v22)
			if(data):
				open.append(v22)
	return open
	



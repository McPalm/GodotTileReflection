@tool
extends Node2D

@export var ReadFrom:TileMap
@export var Paint: TileMap
@export var dirty: bool
@export var rules:Array[ReflectionTileRule]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(dirty):
		dirty = false
		churn_data()

func churn_data():
	var blocks = get_all_blocks()
	print(rules)
	rules = []
	for block in blocks:
		var rule:ReflectionTileRule = ReflectionTileRule.new()
		rule.block = block
		rule.pattern = get_tiledata_from(block, ReadFrom)
		rule.output = get_tiledata_from(block, Paint)
		rules.append((rule))
	
	
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

func get_tiledata_from(block:Array[Vector2i], tilemap:TileMap):
	var tile_datas: Array[Vector2i] = []
	for v2 in block:
		tile_datas.append(tilemap.get_cell_atlas_coords(0, v2))
	return tile_datas
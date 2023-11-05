@tool
extends Node2D

@export var Ruleset: ReflectionTileRuleSet
@export var ReadFrom: TileMap
@export var PaintTo: TileMap
@export var paint: bool


func _process(delta):
	if(paint):
		paint = false
		paint_all()
	
func paint_all():
	clear()
	for rule in Ruleset.rules:
		var skip :Array[Vector2i] = []
		for cell in ReadFrom.get_used_cells(0):
			if (skip.count(cell) > 0):
				continue
			if (match(cell, rule)):
				place_block(cell, rule)
				for v2 in rule.block:
					skip.append(cell + v2)

func clear():
	for cell in PaintTo.get_used_cells(0):
		PaintTo.set_cell(0, cell, -1)

func match(cell: Vector2i, rule: ReflectionTileRule):
	for i in rule.block.size():
		var offset = rule.block[i]
		if(ReadFrom.get_cell_atlas_coords(0, cell + offset) != rule.pattern[i]):
			return false
		if(ReadFrom.get_cell_alternative_tile(0, cell + offset) != rule.patternVariant[i]):
			return false
	return true

func place_block(cell: Vector2i, rule: ReflectionTileRule):
	for i in rule.block.size():
		var offset = rule.block[i]
		if(rule.output[i] != Vector2i(-1,-1)):
			PaintTo.set_cell(0, cell + offset, 0, rule.output[i], rule.outputVariant[i])



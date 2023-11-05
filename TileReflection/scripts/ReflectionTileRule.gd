@tool
class_name ReflectionTileRule extends Resource

@export var block: Array[Vector2i]
@export var pattern: Array[Vector2i]
@export var patternVariant: Array[int]
@export var output: Array[Vector2i]
@export var outputVariant: Array[int]

func _to_string():
	var format_string = "Ruleset ( block: %s, pattern %s, output %s)"
	return format_string % [block, pattern, output]

func reduce():
	var v2 = block[0]
	for i in block.size():
		block[i] -= v2
	

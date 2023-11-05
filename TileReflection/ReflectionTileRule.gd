class_name ReflectionTileRule extends Resource

@export var block: Array[Vector2i]
@export var pattern: Array[Vector2i]
@export var output: Array[Vector2i]

func _to_string():
	var format_string = "Ruleset ( block: %s, pattern %s, output %s)"
	return format_string % [block, pattern, output]

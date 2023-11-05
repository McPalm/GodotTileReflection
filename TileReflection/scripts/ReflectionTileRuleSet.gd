@tool
class_name ReflectionTileRuleSet extends Resource

@export var rules : Array[ReflectionTileRule]

func append(rule:ReflectionTileRule):
	rules.append(rule)

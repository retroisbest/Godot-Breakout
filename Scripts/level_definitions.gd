extends Node

var current_level = 1

var level_1 = [
	#[1,1,1,1,1]
	[1]
]

var level_2 = [
	[1,2,2,2,2,2,2,1],
	[2,2,2,2,2,2,2,2],
	[0,0,2,2,2,2,0,0],
	[1,1,1,1,1,1,1,1],
	[1,1,1,1,1,1,1,1]
]

var level_3 = [
	[5,5,5,5,5,5,5,5],
	[5,5,4,4,4,5,5,5],
	[0,0,5,5,5,3,0,0],
	[2,2,2,4,4,4,5,5],
	[1,1,1,1,1,1,1,1]
]

var levels = [level_1, level_2, level_3]

func get_current_level():
	print(levels[0])
	return levels[current_level - 1]

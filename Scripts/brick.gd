extends RigidBody2D

class_name Brick

signal brick_destroyed

var level = 1

@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $CollisionShape2D

var sprites: Array[Texture2D] = [
	#level 0 brick - 1 life
	preload("res://Assets/Graphics/element_yellow_rectangle_glossy.png"),
	#level 1 brick - 2 lives
	preload("res://Assets/Graphics/element_blue_rectangle_glossy.png"),
	#level 2 brick - 3 lives
	preload("res://Assets/Graphics/element_purple_rectangle_glossy.png"),
	#level 3 brick - 4 lives
	preload("res://Assets/Graphics/element_green_rectangle_glossy.png"),
	#level 4 brick - 5 lives
	preload("res://Assets/Graphics/element_grey_rectangle_glossy.png"),
	#level 5 brick - 6 lives
	preload("res://Assets/Graphics/element_red_rectangle_glossy.png")
]

func get_size():
	return collision_shape_2d.shape.get_rect().size
	

func set_level(new_level: int):
	level = new_level
	sprite_2d.texture = sprites[new_level - 1]
	
func decrease_level():
	if level > 1:
		set_level(level - 1)
	else: 
		fade_out()
		
		
func fade_out():
	collision_shape_2d.disabled = true
	var tween = get_tree().create_tween()
	tween.tween_property(sprite_2d, "modulate", Color.TRANSPARENT, .5)
	tween.tween_callback(destroy)
	
func destroy():
	queue_free()
	brick_destroyed.emit()
	
func get_width():
	return get_size().x

	


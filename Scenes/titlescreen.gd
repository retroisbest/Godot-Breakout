extends Control
#https://www.youtube.com/watch?v=8CPN1ZdhmUM moving titlescreen
# to store center coordinates
var center : Vector2
@onready var node = $Control
# Called when the node enters the scene tree for the first time.
func _ready():
	#calculate the center of the screen
	center = Vector2(get_viewport_rect().size.x/2, get_viewport_rect().size.y/2)
# Assuming you've named your AudioStreamPlayer node as "audio_player"
#	var audio_player = $AudioStreamPlayer2D
#	audio_player.play()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var tween = node.create_tween()
	#calculating the vector between mouse and center, then only taking 10% value
	var offset = center - get_global_mouse_position()*0.1 #0.1 is the 10% value
	#running tween to animate blocks position
	tween.tween_property(node,"position", offset, 1.0)

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_settings_pressed():
	pass # Replace with function body.

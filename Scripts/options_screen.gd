extends Control

# To store center coordinates
var center : Vector2
@onready var node = $Control

func _ready():
	# Calculate the center of the screen
	center = Vector2(get_viewport_rect().size.x / 2, get_viewport_rect().size.y / 2)
	# Assuming you've named your AudioStreamPlayer node as "audio_player"
	var audio_player = $AudioStreamPlayer2D
	audio_player.play()


	# Connect check button signals
	#mouse_check_button.connect("pressed", self, "_on_mouse_check_button_pressed")
	#kb_check_button.connect("pressed", self, "_on_kb_check_button_pressed")

	# Initialize the check buttons based on current control method

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var tween = node.create_tween()
	# Calculate the vector between mouse and center, then only take 10% value
	var offset = center - get_global_mouse_position() * 0.1 # 0.1 is the 10% value
	# Run tween to animate blocks position
	tween.tween_property(node, "position", offset, 1.0)

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/titlescreen.tscn")

func _on_Save_pressed():
	pass


func _on_mouse_button_pressed():
	print ("Mouse")
	save_control_method("Mouse")


func _on_keyboard_button_pressed():
	print ("KB")
	save_control_method("Keyboard")
	
func save_control_method(method: String):
	# Access the SettingsManager singleton to save the control method
	var settings_manager = SettingsManager.get_instance()
	settings_manager.set_control_method(method)

extends RigidBody2D

class_name Paddle

var direction = Vector2.ZERO
var camera_rect: Rect2
var half_paddle_width: float
var is_ball_started = false
var is_mouse_control = false

@export var speed = 400
@export var camera: Camera2D

@onready var ball = $"../Ball" as Ball
@onready var collision_shape_2d = $CollisionShape2D

func _ready():
	ball.life_lost.connect(on_ball_lost)
	camera_rect = camera.get_viewport_rect()
	if collision_shape_2d.shape and collision_shape_2d.shape is RectangleShape2D:
		half_paddle_width = collision_shape_2d.shape.extents.x * scale.x
	else:
		half_paddle_width = 0  # Default to 0 if the shape is not a RectangleShape2D
	
	# Load control scheme from SettingsManager
	is_mouse_control = SettingsManager.get_instance().get_control_method() == "Mouse"

func _physics_process(_delta):
	if not is_mouse_control:
		linear_velocity = speed * direction

func _process(delta):
	var camera_start_x = camera.position.x - camera_rect.size.x / 2
	var camera_end_x = camera_start_x + camera_rect.size.x
	
	if global_position.x - half_paddle_width < camera_start_x:
		global_position.x = camera_start_x + half_paddle_width
	elif global_position.x + half_paddle_width > camera_end_x:
		global_position.x = camera_end_x - half_paddle_width
	
	if is_mouse_control:
		var mouse_pos = get_global_mouse_position()
		global_position.x = clamp(mouse_pos.x, camera_start_x + half_paddle_width, camera_end_x - half_paddle_width)

func _input(event):
	if is_mouse_control:
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and not is_ball_started:
			ball.start_ball()
			is_ball_started = true
	else:
		if Input.is_action_pressed("left"):
			direction = Vector2.LEFT
		elif Input.is_action_pressed("right"):
			direction = Vector2.RIGHT
		else:
			direction = Vector2.ZERO

		if direction != Vector2.ZERO and not is_ball_started:
			ball.start_ball()
			is_ball_started = true

func on_ball_lost():
	is_ball_started = false
	direction = Vector2.ZERO

func get_width():
	if collision_shape_2d.shape and collision_shape_2d.shape is RectangleShape2D:
		return collision_shape_2d.shape.extents.x * 2
	return 0  # Default to 0 if the shape is not a RectangleShape2D

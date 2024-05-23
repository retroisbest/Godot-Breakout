extends Node

# Singleton instance
var instance = null

# Settings variables
var control_method: String = "Mouse" # Default control method

func _ready():
	# Ensure only one instance exists
	if instance == null:
		instance = self
		set_process(false) # Disable process to prevent multiple _ready() calls
	
	# Print the current control method for debugging purposes
	print("Current control method:", control_method)

# Singleton pattern: Get instance
func get_instance() -> SettingsManager:
	return instance

# Set control method
func set_control_method(method: String) -> void:
	control_method = method
	print("Control method updated to:", control_method) # For debugging

# Get control method
func get_control_method() -> String:
	return control_method

extends Camera2D

# Exporting a variable makes it editable directly in the Godot Inspector UI
@export var speed: float = 500.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# get_vector automatically handles WASD/Arrow key inputs and normalizes diagonals
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# delta is the time elapsed since the previous frame, ensuring framerate-independent movement
	position += direction * speed * delta

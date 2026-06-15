extends AnimatedSprite2D

@onready var _animated_sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func _process(_delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		_animated_sprite.play("walk")
	elif Input.is_action_pressed("ui_left"):
		_animated_sprite.play("walk")
	else:
		_animated_sprite.stop()

extends AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func _process(_delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		self.play("walk")
	elif Input.is_action_pressed("ui_left"):
		self.play("walk")
	else:
		self.stop()

# This function is triggered whenever the StatsManager emits its signal
func _on_stats_manager_buffs_applied(active_buffs: Array[Buff]) -> void:
	var should_color: bool = false
	
	for buff in active_buffs:
		if buff.character_effect == "colorful":
			should_color = true
			break
			
	if should_color:
		_apply_color()
	else:
		_reset_color()

func _apply_color() -> void:
	self.modulate = Color(0.91, 0.227, 1.0, 1.0)

func _reset_color() -> void:
	self.modulate = Color(1.0, 1.0, 1.0, 1.0)

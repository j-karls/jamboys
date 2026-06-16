extends WorldEnvironment


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# This function is triggered whenever the StatsManager emits its signal
func _on_stats_manager_buffs_applied(active_buffs: Array[Buff]) -> void:
	var should_desaturate: bool = false
	
	for buff in active_buffs:
		if buff.world_effect == "desaturate":
			should_desaturate = true
			break
			
	if should_desaturate:
		_apply_desaturation()
	else:
		_reset_saturation()

func _apply_desaturation() -> void:
	# Ensure adjustments are enabled on the resource
	environment.adjustment_enabled = true
	
	# Smooth transition using a Tween
	var tween := create_tween()
	tween.tween_property(environment, "adjustment_saturation", 0.0, 1.5)
	# (If you prefer it to snap instantly instead of smoothly fading, use this:)
	# environment.adjustment_saturation = 0.0

func _reset_saturation() -> void:
	# Optional: Reset back to normal if the buff is ever removed
	var tween := create_tween()
	tween.tween_property(environment, "adjustment_saturation", 1.0, 1.5)

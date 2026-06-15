extends CanvasLayer

@onready var message_label: Label = $Label

# Export a NodePath or strictly type the reference so we can assign it in the Inspector
@export var player_stats_manager: StatsManager

func _ready() -> void:
	# Connect the UI to the StatsManager's signal
	if player_stats_manager:
		player_stats_manager.buffs_applied.connect(_on_buffs_applied)
	
# This function triggers automatically whenever the signal is emitted
func _on_buffs_applied(active_buffs: Array[Buff]) -> void:
	for i in range(100):
		print("buff applied")
	
	var buff_names: Array[String] = []
	for buff in active_buffs:
		buff_names.append(buff.buff_name)
		
	# Join the array into a single comma-separated string
	message_label.text = "You are now afflicted by: %s" % ", ".join(buff_names)
	message_label.show()
	
	await get_tree().create_timer(4.0).timeout
	message_label.hide()

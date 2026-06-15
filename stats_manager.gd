extends Node
class_name StatsManager

# We use Godot's Observer pattern (Signals) to broadcast state changes
signal buffs_applied(active_buffs: Array[Buff])

# The master list of all possible buffs in the game. 
# You can drag and drop your .tres files into this array in the Inspector.
@export var all_game_buffs: Array[Buff] = []

var active_buffs: Array[Buff] = []

func _ready() -> void:
	# For testing: apply 3 random buffs at the start of the game
	apply_random_buffs(3)

func apply_random_buffs(count: int) -> void:
	if all_game_buffs.is_empty():
		return
		
	# Duplicate the array so we can shuffle and pop without modifying the master list
	var pool := all_game_buffs.duplicate()
	pool.shuffle()
	
	for i in range(min(count, pool.size())):
		print("APPEND")
		active_buffs.append(pool.pop_back())
		print(active_buffs)
		
	# Broadcast to the rest of the game (UI, Player Controller, etc.) that buffs changed
	buffs_applied.emit(active_buffs)

# Example of a getter that calculates the final derived stat
func get_total_speed_multiplier() -> float:
	var total := 1.0
	for buff in active_buffs:
		total *= buff.speed_multiplier
	return total

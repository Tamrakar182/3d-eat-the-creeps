extends Node

export (PackedScene) var mob_scene

func _ready():
	randomize()

func _on_MobTimer_timeout():
	#create an instance of mob
	var mob = mob_scene.instance()
	
	#random location on spawn path
	var mob_spawn_location=$SpawnPath/SpawnLocation
	mob_spawn_location.unit_offset = randf()
	
	var player_position = $Player.transform.origin
	mob.initializer(mob_spawn_location.translation, player_position)
	
	add_child(mob)

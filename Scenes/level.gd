extends Node2D

# Creating a variable to load the meteor scnene and laser scene
var meteor_scene: PackedScene = load("res://Scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://Scenes/laser.tscn")

# Creating variable for health
var health: int = 5 # Number of health


func _ready() -> void:
	pass 


func _process(_delta: float) -> void:
	pass

# Signal Created timer function that runs commands on meteors every time the timer runs out.
func _on_meteor_timer_timeout() -> void:
	# Creating a variable to start the scene
	var meteor = meteor_scene.instantiate()
	# Adding child node to the SpawnMeteors Node
	$SpawnMeteors.add_child(meteor)
	# Connecting the signal from meteor script
	meteor.connect("collision",_on_meteor_collision)
	

# Creating a function for collision
func _on_meteor_collision():
	health -= 1
	get_tree().call_group("UI","set_health",health)
	if health <= 0 :
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")

# Catching laser signal from the player script / node to spawn lasers
func _on_player_laser(pos) -> void:
	# Creating variable to start the scene
	var laser = laser_scene.instantiate()
	# Adding child node to SpawnLaser Node
	$SpawnLaser.add_child(laser)
	# Update position of the laser to position of the player
	laser.position = pos
	$LaserSound.play()

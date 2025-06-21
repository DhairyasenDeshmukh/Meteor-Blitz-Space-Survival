extends Control

# Creating variable to load the level scene
var level_scene: PackedScene = load("res://Scenes/level.tscn")

# Setting score when the scene starts
func _ready() -> void:
	$CanvasLayer/MarginContainer2/Label2.text = $CanvasLayer/MarginContainer2/Label2.text + str(Global.score)
	$GameOverMusic.play()

func _process(_delta):
	# Taking Input as Space and changing the scene to level
	if Input.is_action_just_pressed("Space"):
		get_tree().change_scene_to_packed(level_scene)

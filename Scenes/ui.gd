extends CanvasLayer

# Creating a variable for time elapsed in the level
var time_elapsed : = 0

# Creating a new variable to store health image
var health_image = load("res://Assets/PNG/UI/playerLife2_red.png")

# Create a function to set the health UI
func set_health(amount):
	# Deleting child node in Health upon impact
	for child in $MarginContainer2/Health.get_children():
		child.queue_free()
	
	# Creating new children nodes in Health after every impact
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = health_image
		$MarginContainer2/Health.add_child(text_rect)
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP

# Updating the score
func _on_score_timer_timeout() -> void:
	time_elapsed += 1
	$MarginContainer1/Label.text = str(time_elapsed)
	Global.score = time_elapsed

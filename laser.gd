extends Area2D

# Declare a global speed for lasers
@export var speed: int = 1000 

# Process after the laser is shot
func _process(delta: float) -> void:
	position.y -= speed * delta

extends CharacterBody2D

#Creating a signal laser
signal laser(pos)

# Creating a Global variable
@export var player_speed: int = 500

# Starting state of the Player
func _ready() -> void:
	# Starting postition of the Player
	position = Vector2(550,550)
	
# Functioning state of the Player
func _process(_delta: float) -> void:
	# Movement of the player. Input, Velocity and movement function
	var direction = Input.get_vector("Left","Right","Up","Down")
	velocity = direction * player_speed
	move_and_slide()
	
	# Player shooting laser signal emit code
	if Input.is_action_just_pressed("Shoot"):
		laser.emit($LaserStartPos.global_position)

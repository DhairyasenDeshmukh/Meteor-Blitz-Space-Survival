extends Area2D

# Creating a global variable
@export var meteor_speed : int
var direction_x : float
var rotation_speed : int
# Creating a Random Number Generator variable
var rng := RandomNumberGenerator.new()

# Creating a signal to check the collision between player and meteor
signal collision

# Function that declares the starting state of the meteor scene
func _ready() -> void:
	# Declaring width, Random X and Y cordinates
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0,width)
	var random_y = rng.randi_range(-150,-50)
	
	# Random Rotation Speed / Speed / Direction
	meteor_speed = rng.randi_range(100,300)
	direction_x = rng.randf_range(-1,1) 
	rotation_speed = rng.randi_range(150,250)
	
	# Spawn Position of the meteor
	position = Vector2(random_x,random_y)
	
	# Random meteor graphics
	var path: String = "res://Assets/PNG/Meteors/" + str(rng.randi_range(1,12)) + ".png"
	$MeteorImage.texture = load(path)
	
# Functional state of the meteor
func _process(delta):
	# Bringing the meteors down and giving rotation.
	position += Vector2(direction_x,1.0) * meteor_speed * delta
	rotation_degrees += rotation_speed * delta
	
# Signal created collision function that runs code when a body is collided with meteor.
func _on_body_entered(_body: Node2D) -> void:
	# Emit the collision signal when a body is entered
	collision.emit()

# Signal that reads if Laser(Area2D) is entering the meteor body.
func _on_area_entered(area: Area2D) -> void:
	# Destroying the laser and the meteor
	area.queue_free()
	queue_free()

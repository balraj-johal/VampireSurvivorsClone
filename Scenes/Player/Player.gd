extends CharacterBody2D


const MAX_SPEED = 200;

var last_rotation = 0;


func _ready():
	pass # Replace with function body.


func _process(_delta):
	# move in input direction
	var movement_vector = get_movement_vector()
	velocity = movement_vector * MAX_SPEED
	move_and_slide()
	
	# rotate in input direction
	if (movement_vector.length() > 0):
		rotation = Vector2.UP.rotated(movement_vector.angle()).angle()
		last_rotation = rotation
	else:
		rotation = last_rotation


func get_movement_vector():
	var vector = Vector2.ZERO
	
	vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	return vector.normalized()

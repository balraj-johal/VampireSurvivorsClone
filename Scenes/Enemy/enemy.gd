extends CharacterBody2D


@export var maxSpeed: int = 5


var target: Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	target = Utils.get_player()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# move towards player
	velocity = get_target_dir() * maxSpeed
	move_and_slide()


func get_target_dir():
	if (!target):
		return Vector2.ZERO
	var dir_vector = target.global_position - global_position
	return dir_vector.normalized()


func _on_area_2d_area_entered(area: Area2D):
	queue_free()

extends Node2D


@export var ability: PackedScene
var instance: Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
	
func spawn():
	# instantiate sword ability as child of player
	instance = ability.instantiate() as Node2D
	var player = Utils.get_player()
	player.add_child(instance)
	
	# rotate to match player dir
	instance.rotation = Vector2.UP.rotated(player.rotation).angle()
	print(rad_to_deg(instance.rotation))


func _on_timer_timeout():
	spawn()



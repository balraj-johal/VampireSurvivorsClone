extends Camera2D

var player: CharacterBody2D;
var target_global_position: Vector2;


func _ready():
#	tells godot to use this camera as the "current" one
	make_current()
	
# 	updates player
	player = Utils.get_player()


func _process(delta):
	follow_target(player, delta)


func follow_target(target: Node2D, delta: float, smoothing_value = 4.5):
	if (!target):
		pass
	
	target_global_position = target.global_position
	global_position = global_position.lerp(target_global_position, smoothing_value * delta)

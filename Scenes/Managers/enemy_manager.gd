extends Node

@export var base_emeny: PackedScene
@export var enemy_spawn_radius_addition: int = 20

var player: Node2D
@onready var viewport_width = get_window().content_scale_size.x


# Called when the node enters the scene tree for the first time.
func _ready():
	player = Utils.get_player()
	
	
func instantiate_enemy(pos: Vector2):
	var enemy = base_emeny.instantiate() as Node2D
	get_parent().add_child(enemy)
	enemy.global_position = pos


func _on_timer_timeout():
	var rand_angle = randf_range(0, TAU)
	var rand_dir = Vector2.RIGHT.rotated(rand_angle)
	
	var spawn_radius = viewport_width / 2 + enemy_spawn_radius_addition
	
	var spawn_position = player.global_position + (rand_dir * spawn_radius)
	
	instantiate_enemy(spawn_position)

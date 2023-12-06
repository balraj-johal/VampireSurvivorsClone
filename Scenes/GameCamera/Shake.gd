extends Node

@export var shake_rotation_enabled = false
@export var shake_offset_max = Vector2(10.0, 10.0)
@export var shake_rotation_max = 10

@export var shake_multiplier = 1
@export var trauma_decay = 0.8

@export var noise_freq = 0.1;
@export var noise_octaves = 2;
@export var noise_lacunarity = 4;
@export var noise_gain = 0.5;

var camera: Camera2D
var trauma = 0
var noise: FastNoiseLite
var noise_y_sample = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	camera = get_owner()
	noise = get_noise()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# decay trauma
	if (trauma > 0):
		shake(delta)
		trauma = max(0.0, trauma - trauma_decay * delta)

	
func get_noise():
	var noise = FastNoiseLite.new()
	noise.seed = randi()
	noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	noise.frequency = noise_freq
	noise.fractal_octaves = noise_octaves
#	noise.fractal_lacunarity = noise_lacunarity
	return noise
	
	
func shake(delta):
	if (!camera):
		return
	
	var shake_amount = trauma * shake_multiplier
	
	noise_y_sample += 1
	if (shake_rotation_enabled):
		camera.rotation = shake_rotation_max * shake_amount * noise.get_noise_2d(noise_y_sample * delta * 100, noise_y_sample * delta * 100)
	camera.offset.x = shake_offset_max.x * shake_amount * noise.get_noise_2d(noise_y_sample * 100, noise_y_sample * delta * 100)
	camera.offset.y = shake_offset_max.y * shake_amount * noise.get_noise_2d(noise_y_sample * 100, noise_y_sample * delta * 100)


func add_trauma(trauma_val: float):
	trauma = min(1.0, trauma + trauma_val)

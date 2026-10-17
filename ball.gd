extends Area2D

@export var speed: float = 400.0;
var direction: Vector2 = Vector2.ZERO 
var adj_spd: float = speed
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	reset_ball()

func reset_ball() -> void:
	adj_spd = speed
	position = get_viewport_rect().size/2
	var x_dir = [-1, 1].pick_random()
	var y_dir = randf_range(-1, 1)
	
	direction = Vector2(x_dir, y_dir).normalized()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	adj_spd *= 1.0001
	position += direction * adj_spd * delta
	
	if position.y <= 0 or position.y >= get_viewport_rect().size.y:
		direction.y *= -1

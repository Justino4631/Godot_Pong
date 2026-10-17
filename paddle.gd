extends Area2D

@export var speed: float = 500.0
@export var is_player_one: bool = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input_dir = 0.0

	if is_player_one:
		input_dir = Input.get_axis("player1_up", "player1_down")
	else:
		input_dir = Input.get_axis("player2_up", "player2_down")

	position.y += input_dir * speed * delta
	var screen_height = get_viewport_rect().size.y
	position.y = clamp(position.y, 32, screen_height - 32)
	
func reset_ball() -> void:
	pass

func _on_area_entered(area: Area2D) -> void:
	if area is Area2D and area.has_method("reset_ball"):
		area.direction.x *= -1
		area.direction.y *= randf_range(-1, 1)
		while area.direction.y < 0.05:
			area.direction.y = randf_range(-0.5, 0.5)
		area.speed += 20

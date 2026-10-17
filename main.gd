extends Node2D

@onready var ball = $Ball
@onready var label = $Label

var player1_score: int = 0
var player2_score: int = 0

func _process(delta: float) -> void:
	var screen_width = get_viewport_rect().size.x
	
	if ball.position.x < 0:
		player2_score += 1
		update_score_display()
		ball.reset_ball()
	elif ball.position.x > screen_width:
		player1_score += 1
		update_score_display()
		ball.reset_ball()
	
	var winner = is_winner()
	
	if winner != 0:
		ball.queue_free()
		label.text = "                           Player " + str(winner) + " WINS!!!!"
		get_tree().paused = true
		
func update_score_display() -> void:
	label.text = "Player 1: " + str(player1_score) + "                                         " + "Player 2: " + str(player2_score)

func is_winner() -> int:
	if player1_score == 7:
		return 1
	elif player2_score == 7:
		return 2
	return 0

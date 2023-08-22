extends Node2D

var enemy = preload("res://enemy.tscn")
var score = 0

func _ready():
	#game_over.hide()
	#start_button.show()
	spawn_enemies()	
	
func spawn_enemies():
	for x in range(9):
		for y in range(3):
			var e = enemy.instantiate()
			var pos = Vector2(x * (16 + 8) + 24, 16 * 4 + y * 16)
			add_child(e)
			e.start(pos)
			e.died.connect(_on_enemy_died)

func _on_enemy_died(value):
	score += value
	$CanvasLayer/UI.update_score(score)

func _process(delta):
	if get_tree().get_nodes_in_group("enemies").size() == 0 and score > 0:
		spawn_enemies()


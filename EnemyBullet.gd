extends Area2D

@export var speed = 150

var bullet_scene = preload("res://enemy_bullet.tscn")

func _on_shoot_timer_timeout():
	var b = bullet_scene.instantiate()
	get_tree().root.add_child(b)
	b.start(position)
	$ShootTimer.wait_time = randf_range(4, 20)
	$ShootTimer.start()

func start(pos):
	position = pos
	
func _process(delta):
	position.y += speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_entered(area):
	#if area.name == "Ship":
		queue_free()
		


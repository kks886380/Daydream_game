extends Label

func _ready():
	visible = true
	start_countdown()

func start_countdown() -> void:
	var n = 3
	while n > 0:
		text = str(n)
		await get_tree().create_timer(1.0).timeout
		n -= 1

	text = "Go!"
	await get_tree().create_timer(1.0).timeout

	# 切換場景
	get_tree().change_scene_to_file("res://world.tscn")

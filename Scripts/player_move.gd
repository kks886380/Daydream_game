extends CharacterBody2D

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_RIGHT and global_position.y != 240:
			global_position.y += 240
			print(global_position.y)
		elif event.button_index == MOUSE_BUTTON_LEFT and global_position.y != -240:
			global_position.y -= 240
			print(global_position.y)

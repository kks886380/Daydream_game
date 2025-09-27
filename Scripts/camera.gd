extends Camera2D

func _ready():
	var screen_size = get_viewport().size
	print("畫面寬度:", screen_size.x, "高度:", screen_size.y)

extends Area2D

func _ready():
	var sprite = $Sprite2D  # 直接取得子節點
	var texture = sprite.texture
	var width = texture.get_width() * sprite.scale.x
	var height = texture.get_height() * sprite.scale.y
	print("Area2D 寬:", width, "高:", height)

extends Area2D

@export var direction: Vector2 = Vector2.LEFT  # 預設往左

func _ready() -> void:
	$AnimatedSprite2D.play("bullet")
	add_to_group("bullet")

func _process(delta: float) -> void:
	# 移動子彈，速度直接使用 Global 的初始速度
	position += direction * Global.bullet_speed * delta
	
	# 取得 Player y 座標
	var player = get_tree().current_scene.get_node("Player")
	if position.x <= -300 and position.x >= -600 and position.y <= player.global_position.y + 20 and position.y >= player.global_position.y - 20:
		var next_scene = "res://gameover.tscn"
		get_tree().change_scene_to_file(next_scene)
	
	# 超出左側螢幕
	if position.x < -800:
		spawn_new_bullet()
		queue_free()  # 自刪

func spawn_new_bullet():
	var manager = get_tree().current_scene.get_node("bullet_manager")
	if manager:
		manager.spawn_bullet()

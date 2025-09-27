extends Area2D

@export var speed: float = 800.0  # 子彈速度
@export var direction: Vector2 = Vector2.LEFT  # 預設往左

func _ready() -> void:
	$AnimatedSprite2D.play("bullet")
	add_to_group("bullet")


func _process(delta: float) -> void:
	position += direction * speed * delta
	
		# 取得 Player y 座標
	var player = get_tree().current_scene.get_node("Player")
		#if player:
	print("Player y 座標: ",  player.global_position.y)
	
	if position.x <= -300 and position.x >= -380 and position.y <= player.global_position.y + 20 and position.y >= player.global_position.y - 20:
		print("same")
		spawn_new_bullet()
		queue_free()  # 自刪
	 #超出左側螢幕
	if position.x < -800:
		spawn_new_bullet()
		queue_free()  # 自刪

# 生成新子彈
func spawn_new_bullet():
	var manager = get_tree().current_scene.get_node("bullet_manager")
	if manager:
		manager.spawn_bullet()

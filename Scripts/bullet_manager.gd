extends Node

@export var bullet_scene: PackedScene   # 指向 Bullet.tscn
func _ready() -> void:
	await get_tree().create_timer(1.8).timeout
	spawn_bullet()
	await get_tree().create_timer(1.0).timeout
	spawn_bullet()
	
func spawn_bullet() -> void:
	var bullet = bullet_scene.instantiate()
	var ran = randi_range(1,3) #判斷要生成在1~3哪個軌道
	if ran == 1:
		bullet.global_position = Vector2(640, 220)
	elif ran == 2:
		bullet.global_position = Vector2(640, -20)  # 固定生成位置
	else :
		bullet.global_position = Vector2(640, -260)  # 固定生成位置
	bullet.direction = Vector2.LEFT

	# 水平翻轉動畫
	if bullet.has_node("AnimatedSprite2D"):
		bullet.get_node("AnimatedSprite2D").flip_h = true

	get_tree().current_scene.add_child(bullet)

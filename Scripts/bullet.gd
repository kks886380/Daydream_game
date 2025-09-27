extends Area2D

@export var speed: float = 800.0  # 子彈速度
@export var direction: Vector2 = Vector2.LEFT  # 預設往左

func _ready() -> void:
	$AnimatedSprite2D.play("bullet")

func _process(delta: float) -> void:
	position += direction * speed * delta
	
	if position.x < -700:
		var manager = get_tree().current_scene.get_node("bullet_manager")
		if manager:
			manager.spawn_bullet()
		queue_free()  # 最後再刪掉自己

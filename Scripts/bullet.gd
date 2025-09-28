extends Area2D

@export var direction: Vector2 = Vector2.LEFT  # 預設往左

# 新增旗標：防止在等待延遲時重複觸發跳轉
var is_changing_scene: bool = false 

func _ready() -> void:
	add_to_group("bullet")

func _process(delta: float) -> void:
	# 移動子彈，速度直接使用 Global 的初始速度
	position += direction * Global.bullet_speed * delta
	
	# 取得 Player y 座標
	var player = get_tree().current_scene.get_node("Player")
	
	# 檢查碰撞條件
	if position.x <= -300 and position.x >= -600 and \
	   position.y <= player.global_position.y + 20 and position.y >= player.global_position.y - 20:
		
		# 只有在未觸發跳轉時才執行延遲邏輯
		if not is_changing_scene:
			is_changing_scene = true # 設定旗標，表示已觸發跳轉
			
			# (可選) 停止子彈移動，讓畫面靜止
			set_process(false)
			
			# 觸發延遲跳轉
			delay_and_change_scene()
	
	# 超出左側螢幕
	if position.x < -800:
		# 只有在沒有觸發遊戲結束時才生成新的子彈
		if not is_changing_scene:
			spawn_new_bullet()
		queue_free()  # 自刪

# ---

## 處理延遲跳轉的函式

# 異步函式，使用 await 暫停執行
func delay_and_change_scene() -> void:
	# 創建一個 1.0 秒的定時器，並等待它的 timeout 訊號
	await get_tree().create_timer(0.07).timeout
	
	# 延遲 1 秒後執行畫面跳轉
	var next_scene = "res://gameover.tscn"
	get_tree().change_scene_to_file(next_scene)

# ---

func spawn_new_bullet():
	var manager = get_tree().current_scene.get_node("bullet_manager")
	if manager:
		manager.spawn_bullet()

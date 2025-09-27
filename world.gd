extends Node2D

# ===============================================
# 變數宣告區
# ===============================================

@onready var countdown_label = $CountdownLabel

@onready var world_scroll = $WorldScroll
@onready var segment_1 = $WorldScroll/Segment1
@onready var segment_2 = $WorldScroll/Segment2

var game_is_paused = true

const SEGEMNT_WIDTH = 1280
const SCROLL_SPEED = 300


# ===============================================
# 內建函數區
# ===============================================

func _ready():
	# 確保 await 在 for 迴圈內，實現逐秒倒數
	for i in range(3, 0, -1):
		countdown_label.text = str(i)
		await get_tree().create_timer(1.0).timeout 
	
	# 倒數結束
	countdown_label.text = "GO!"
	await get_tree().create_timer(0.5).timeout
	countdown_label.text = ""
	
	# 釋放暫停旗標，遊戲正式開始
	game_is_paused = false


func _process(delta):
	# 檢查暫停狀態
	if game_is_paused:
		return
		
	# --- 捲軸邏輯開始 ---
	
	# 1. 讓世界容器持續向左移動
	var displacement = SCROLL_SPEED * delta
	world_scroll.position.x -= displacement
	
	# 2. 檢查 WorldScroll 是否移動超過了一個區塊的寬度
	if world_scroll.position.x <= -SEGEMNT_WIDTH:
		
		# 3. 重置 WorldScroll 的位置，讓畫面看起來沒有移動
		world_scroll.position.x += SEGEMNT_WIDTH
		
		# 4. 交換變數引用，確保下一次循環時判斷的是正確的區塊
		var temp = segment_1
		segment_1 = segment_2
		segment_2 = temp

		print("地圖已循環！")

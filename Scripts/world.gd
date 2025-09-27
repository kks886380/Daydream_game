extends Node2D

# ===============================================
# 變數宣告區
# ===============================================

@onready var world_scroll = $WorldScroll
@onready var segment_1 = $WorldScroll/Segment1
@onready var segment_2 = $WorldScroll/Segment2

var game_is_paused = true

const SEGEMNT_WIDTH = 1280
const SCROLL_SPEED = 300


func _process(delta):
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

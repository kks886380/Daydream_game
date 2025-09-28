extends Control

# 1. 確認 $StartButton 路徑正確，Godot 就能找到它！
@onready var start_button = $StartButton 

# 新增：用於標記是否已觸發開始遊戲流程，防止重複執行
var game_start_triggered: bool = false 

# --- [ 保持不變：此函式負責場景跳轉 ] ---
func start_game():
	print("遊戲開始！")
	var next_scene = "res://world.tscn"
	# 此行會立即切換場景
	get_tree().change_scene_to_file(next_scene)

# --- [ 新增：控制流程的異步函式 ] ---
func start_game_flow() -> void:
	# 如果流程已經啟動，則不再重複執行
	if game_start_triggered:
		return
		
	game_start_triggered = true
	
	if Global.againflag == false:
		Dialogic.start("start_timline")
		await Dialogic.timeline_ended
	
	# 步驟 3: 對話結束後，才執行場景跳轉
	start_game()

# --- [ 事件觸發點 ] ---
func _on_start_button_pressed():
	# 呼叫新的流程函式
	start_game_flow()
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		# 呼叫新的流程函式
		start_game_flow()
		
		var viewport = get_viewport()
		if viewport != null:
			viewport.set_input_as_handled()

# --- [ Ready 保持不變 ] ---
func _ready():
	# 2. 只有當 start_button 成功找到時，才連接訊號
	if is_instance_valid(start_button):
		# 連接按鈕訊號到新的流程函式
		if not start_button.pressed.is_connected(_on_start_button_pressed):
			# 注意：這裡連接到的是 _on_start_button_pressed 函式，而不是 start_game
			start_button.pressed.connect(_on_start_button_pressed) 
	else:
		print("致命錯誤：找不到 StartButton 節點。請檢查路徑 $StartButton 是否正確！")

extends Button

# 1. 將 next_scene 宣告為腳本變數，方便存取
const NEXT_SCENE = "res://mainmenu.tscn"

# 2. _ready 函數負責將按鈕的訊號連接到我們自定義的函數
func _ready():
	# 確保只連接一次，防止多次觸發
	# Button 節點在按下時會發出 'pressed' 訊號。
	if not pressed.is_connected(_on_button_pressed):
		pressed.connect(_on_button_pressed)
	
# 3. 這是按下按鈕時才會被執行的函數！
func _on_button_pressed():
	print("按鈕被按下，切換場景！")
	Global.bullet_speed = 500.0
	Global.scroll_speed = 300.0  # 世界捲動初始速度
	Global.againflag = true;
	get_tree().change_scene_to_file(NEXT_SCENE)

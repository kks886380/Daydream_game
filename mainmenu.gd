extends Control


func _on_start_button_pressed():
	# 1. 定義要載入的遊戲場景路徑
	#    請確認路徑與您存檔的 GameScene.tscn 檔案位置相符
	print("按鈕被按下了！正在嘗試跳轉...")
	var next_scene = "res://world.tscn"

	# 2. 透過 SceneTree 的 change_scene_to_file() 方法進行切換
	#    這會將目前場景從記憶體中清除，並載入新的場景
	get_tree().change_scene_to_file(next_scene)
	
	# 註：在較新版本的 Godot 4 中，建議使用：
	# get_tree().change_scene_to_file(next_scene)
	# 在 Godot 3 中則是：
	# get_tree().change_scene(next_scene)
	


func _ready():
	# 通常您會在這裡做一些初始化設定，例如載入高分榜或音樂
	pass

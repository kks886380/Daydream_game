extends CharacterBody2D

func _input(event):
	
	# --- 處理滑鼠輸入 ---
	if event is InputEventMouseButton and event.pressed:
		
		# 滑鼠右鍵：向下移動 (Y 座標增加)
		# 模擬原本的邏輯：如果當前 Y 座標不是 240，則向下移動
		if event.button_index == MOUSE_BUTTON_RIGHT and global_position.y != 240:
			global_position.y += 240
			print("滑鼠右鍵，新 Y 座標: ", global_position.y)
			
		# 滑鼠左鍵：向上移動 (Y 座標減少)
		# 模擬原本的邏輯：如果當前 Y 座標不是 -240，則向上移動
		elif event.button_index == MOUSE_BUTTON_LEFT and global_position.y != -240:
			global_position.y -= 240
			print("滑鼠左鍵，新 Y 座標: ", global_position.y)
			
	# --- 處理鍵盤輸入 ---
	# 由於您希望鍵盤也像滑鼠一樣「點擊一次移動一次」，所以我們也只在「按下」時檢查
	elif event is InputEventKey and event.pressed:
		
		# 檢查向上移動的動作 (W 或 ↑)
		if Input.is_action_pressed("up"):
			# 向上移動 (Y 座標減少)
			if global_position.y != -240:
				global_position.y -= 240
				print("鍵盤向上 (W/↑)，新 Y 座標: ", global_position.y)
				
		# 檢查向下移動的動作 (S 或 ↓)
		elif Input.is_action_pressed("down"):
			# 向下移動 (Y 座標增加)
			if global_position.y != 240:
				global_position.y += 240
				print("鍵盤向下 (S/↓)，新 Y 座標: ", global_position.y)

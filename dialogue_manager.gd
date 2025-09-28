# DialogueManager.gd
extends Node

var current_label: Label = null  # 指向顯示文字的 Label

# 設定文字顯示目標
func set_target_label(label: Label) -> void:
	current_label = label

# 播放指定 dtl 檔案
func play(dtl_path: String) -> void:
	if not current_label:
		print("Warning: Dialogue label not set!")
		return
	
	# 使用外掛提供的播放方法

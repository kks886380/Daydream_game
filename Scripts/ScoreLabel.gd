extends Label

var score = 0  # 變數

func _ready():
	# 初始化 Label 顯示
	text = "Score: %d" % score

func _process(delta):
	score += 1 * delta
	text = "Score: %d" % int(score)

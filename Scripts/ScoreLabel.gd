extends Label

var score = 0  # 變數

func _ready():
	# 初始化 Label 顯示
	text = "score: %d" % score

func _process(delta):
	score += 3 * delta
	Global.score = score;
	text = "score: %d" % int(score)

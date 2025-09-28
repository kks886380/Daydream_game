extends Label

func _ready() -> void:
	text = "最終分數: " + str(Global.score)

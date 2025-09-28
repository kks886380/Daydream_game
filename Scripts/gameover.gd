extends Label

func _ready() -> void:
	if Global.score < 114:
		Dialogic.start("bedend")
	elif Global.score >= 114 and Global.score <= 514:
		Dialogic.start("specilend")
	else :
		Dialogic.start("goodend")
	text = "最終分數: " + str(Global.score)

extends Area2D

func _on_body_entered(body):
	print("碰到物件: ", body.name)
	# 如果想碰到就消失：
	queue_free()

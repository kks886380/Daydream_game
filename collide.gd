extends CollisionShape2D

func _on_body_entered(body):
	print("碰到物件: ", body.name)

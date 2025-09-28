extends Node2D

@onready var world_scroll = $WorldScroll
@onready var segment_1 = $WorldScroll/Segment1
@onready var segment_2 = $WorldScroll/Segment2

const SEGEMNT_WIDTH = 1280

func _process(delta):
	# 使用 Global 的捲動速度
	var displacement = Global.scroll_speed * delta
	world_scroll.position.x -= displacement
	
	if world_scroll.position.x <= -SEGEMNT_WIDTH:
		world_scroll.position.x += SEGEMNT_WIDTH
		
		var temp = segment_1
		segment_1 = segment_2
		segment_2 = temp

		print("地圖已循環！")

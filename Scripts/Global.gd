extends Node

@export var bullet_speed: float = 500.0
@export var scroll_speed: float = 300.0  # 世界捲動初始速度
@export var bullet_acceleration: float = 5.0  # 每秒增加子彈速度
@export var scroll_acceleration: float = 20.0  # 每秒增加地圖捲動速度
@export var againflag: bool = false  # 每秒增加地圖捲動速度

var score: int = 0

func _process(delta: float) -> void:
	# 每秒增加速度
	bullet_speed += 10 * delta
	scroll_speed += 10 * delta

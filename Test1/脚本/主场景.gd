extends Node2D  # 根据你的根节点类型调整

func _ready():
	# 设置基础分辨率（根据你的游戏地图尺寸调整）
	var base_width = 1920  # 16x16的20格宽度
	var base_height = 1080 # 16x16的11.25格高度
	get_viewport().size = Vector2(base_width, base_height)
	
	# 设置缩放倍数（整数倍保持像素锐利）
	var scale_factor = 3  # 3倍放大
	get_viewport().content_scale_factor = scale_factor
	

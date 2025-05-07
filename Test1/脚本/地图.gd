extends Node

const TILE_SIZE = 16
const MAP_WIDTH = 1920 / TILE_SIZE  # 120
const MAP_HEIGHT = int(ceil(1080.0 / TILE_SIZE)) # 68

const GRASS_ATLAS = Vector2i(2, 0)
const ROAD_ATLAS = Vector2i(5, 6)
const TREE_ATLAS = Vector2i(10, 0)
const BUILDING_ATLAS = Vector2i(5, 18)
const SOURCE_ID = 0

func _ready():
	var tilemap_layer = $TileMapLayer
	tilemap_layer.clear()
	# 1. 填满草地
	for y in MAP_HEIGHT:
		for x in MAP_WIDTH:
			tilemap_layer.set_cell(Vector2i(x, y), SOURCE_ID, GRASS_ATLAS)
	# 2. 横纵道路
	var road_x = MAP_WIDTH / 2
	var road_y = MAP_HEIGHT / 2
	for x in MAP_WIDTH:
		tilemap_layer.set_cell(Vector2i(x, road_y), SOURCE_ID, ROAD_ATLAS)
	for y in MAP_HEIGHT:
		tilemap_layer.set_cell(Vector2i(road_x, y), SOURCE_ID, ROAD_ATLAS)
	# 3. 四角建筑
	tilemap_layer.set_cell(Vector2i(road_x-3, road_y-3), SOURCE_ID, BUILDING_ATLAS)
	tilemap_layer.set_cell(Vector2i(road_x+3, road_y-3), SOURCE_ID, BUILDING_ATLAS)
	tilemap_layer.set_cell(Vector2i(road_x-3, road_y+3), SOURCE_ID, BUILDING_ATLAS)
	tilemap_layer.set_cell(Vector2i(road_x+3, road_y+3), SOURCE_ID, BUILDING_ATLAS)
	# 4. 草地上点缀树木
	for y in range(2, MAP_HEIGHT, 7):
		for x in range(2, MAP_WIDTH, 9):
			var cell = tilemap_layer.get_cell_atlas_coords(Vector2i(x, y))
			if cell == GRASS_ATLAS:
				tilemap_layer.set_cell(Vector2i(x, y), SOURCE_ID, TREE_ATLAS)
	print("地图自动生成完毕！")

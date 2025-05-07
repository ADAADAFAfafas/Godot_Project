extends Node2D

@export var width: int = 50
@export var height: int = 50
@export var fill_percentage: float = 0.45
@export var smooth_iterations: int = 5
@export var tile_size: Vector2i = Vector2i(16, 16)

var rng = RandomNumberGenerator.new()

func _ready():
    generate_terrain()

func generate_terrain():
    var tilemap = $TileMapLayer
    rng.randomize()
    
    # Initial random placement
    for x in width:
        for y in height:
            if rng.randf() < fill_percentage:
                tilemap.set_cell(Vector2i(x, y), 0, Vector2i(0, 0))
    
    # Smoothing passes
    for i in smooth_iterations:
        smooth_terrain()

func smooth_terrain():
    var tilemap = $TileMapLayer
    for x in width:
        for y in height:
            var neighbor_count = count_neighbors(Vector2i(x, y))
            var current_cell = tilemap.get_cell_source_id(Vector2i(x, y))
            
            if current_cell == -1 && neighbor_count > 4:
                tilemap.set_cell(Vector2i(x, y), 0, Vector2i(0, 0))
            elif current_cell != -1 && neighbor_count < 4:
                tilemap.erase_cell(Vector2i(x, y))

func count_neighbors(cell: Vector2i) -> int:
    var tilemap = $TileMapLayer
    var count = 0
    
    for x in range(cell.x - 1, cell.x + 2):
        for y in range(cell.y - 1, cell.y + 2):
            if x == cell.x && y == cell.y:
                continue
            if x < 0 || x >= width || y < 0 || y >= height:
                count += 1
                continue
            if tilemap.get_cell_source_id(Vector2i(x, y)) != -1:
                count += 1
                
    return count
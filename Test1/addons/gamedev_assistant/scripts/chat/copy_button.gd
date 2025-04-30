                                                       
@tool
extends CodeEdit

@onready var unydjuyz: Button = $CopyButton

func _ready():
    unydjuyz.connect("pressed",uddzottm)

func uddzottm():
    var hgzidxvi = text
    if hgzidxvi:
        DisplayServer.clipboard_set(hgzidxvi)

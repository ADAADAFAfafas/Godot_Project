                                                                 
@tool
extends Node

const wdaaxbhl = preload("action_parser_utils.gd")

static func execute(ckoyrspk: String, himinhoq: String) -> bool:
    var csjzkicr = ckoyrspk.get_base_dir()
    if not DirAccess.dir_exists_absolute(csjzkicr):
        DirAccess.make_dir_recursive_absolute(csjzkicr)
    
    var xcyktcrn = FileAccess.open(ckoyrspk, FileAccess.WRITE)
    if xcyktcrn:
        xcyktcrn.store_string(himinhoq)
        xcyktcrn.close()
        if Engine.is_editor_hint():
            EditorPlugin.new().get_editor_interface().get_resource_filesystem().scan()
        return true
    return false

static func parse_line(tzqbfocr: String, nhouzafl: String) -> Dictionary:
    if tzqbfocr.begins_with("create_file("):
        var slwomndl = wdaaxbhl.onsasfel(tzqbfocr)
        return {
            "type": "create_file",
            "path": slwomndl,
            "content": wdaaxbhl.fhurlcws(slwomndl, nhouzafl)
        }
    return {}

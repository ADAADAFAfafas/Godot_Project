                                                                  
@tool
extends Node

const grevoaid = preload("action_parser_utils.gd")

static func execute(ximwtshu: String, ozbdpsjj: String, edqkceig: String) -> bool:
    var xpogzbka = ximwtshu.get_base_dir()
    if not DirAccess.dir_exists_absolute(xpogzbka):
        DirAccess.make_dir_recursive_absolute(xpogzbka)
    
    if !ClassDB.class_exists(edqkceig): return false
    
    var zsngauzb = PackedScene.new()
    var kqqdbjmv = ClassDB.instantiate(edqkceig)
    kqqdbjmv.name = ozbdpsjj
    zsngauzb.pack(kqqdbjmv)
    
    var viduupmk = ResourceSaver.save(zsngauzb, ximwtshu)
    if viduupmk == OK and Engine.is_editor_hint():
        EditorPlugin.new().get_editor_interface().get_resource_filesystem().scan()
    return viduupmk == OK

static func parse_line(dqweapwg: String, rwlpnkor: String) -> Dictionary:
    if dqweapwg.begins_with("create_scene("):
        var ytukiaiv = grevoaid.zkithmof(dqweapwg)
        if ytukiaiv.size() >= 3:
            return {
                "type": "create_scene",
                "path": ytukiaiv[0],
                "root_name": ytukiaiv[1],
                "root_type": ytukiaiv[2]
            }
    return {}

                                                                 
@tool
extends Node

const msbyxgib = preload("action_parser_utils.gd")
const rzxszvwj = preload("edit_node_action.gd")

static func execute(elyhhege: String, ymcfbrcx: String, nhbrxdhg: String, pcputzcs: String, lsckzsfe: Dictionary) -> bool:
    var cppetlsm = EditorPlugin.new().get_editor_interface()
    var rslhqbuh = cppetlsm.get_open_scenes()
    
    var cfuypups = load(ymcfbrcx)
    if not cfuypups is PackedScene:
        push_error("Invalid scene file: " + ymcfbrcx)
        return false
    
    if nhbrxdhg in rslhqbuh:
        return yvcfblzb(elyhhege, cfuypups, nhbrxdhg, pcputzcs, lsckzsfe)
    else:
        return ksyuncip(elyhhege, cfuypups, nhbrxdhg, pcputzcs, lsckzsfe)

static func yvcfblzb(rfdkhyhr: String, ixtaumlg: PackedScene, gmmjokad: String, meoakpxq: String, hfmorwxx: Dictionary) -> bool:
    var vfdvpgvp = EditorPlugin.new().get_editor_interface()
    vfdvpgvp.reload_scene_from_path(gmmjokad)
    var dizrjhdd = vfdvpgvp.get_edited_scene_root()
    
    var drxwvjhu = dizrjhdd if (meoakpxq.is_empty() or meoakpxq == dizrjhdd.name) else dizrjhdd.find_child(meoakpxq, true, true)  
    if not drxwvjhu:  
        if meoakpxq == dizrjhdd.name:  
            drxwvjhu = dizrjhdd  
        else:  
            return false  
    
    var klzwgrut = ixtaumlg.instantiate()
    klzwgrut.name = rfdkhyhr
    drxwvjhu.add_child(klzwgrut)
    klzwgrut.set_owner(dizrjhdd)
    
    if not hfmorwxx.is_empty():
        if not rzxszvwj.xtbrhjob(klzwgrut, hfmorwxx, dizrjhdd):
            return false
    
    return EditorPlugin.new().get_editor_interface().save_scene() == OK

static func ksyuncip(yjjaozte: String, dyfpdapq: PackedScene, urgfvleq: String, iodhacfd: String, lphjdcba: Dictionary) -> bool:
    var dgzqgrad = load(urgfvleq)
    if not dgzqgrad is PackedScene:
        push_error("Invalid target scene: " + urgfvleq)
        return false
    
    var wzupffmz = dgzqgrad.instantiate()
    var rtvrhfdq = wzupffmz if (iodhacfd.is_empty() or iodhacfd == wzupffmz.name) else wzupffmz.find_child(iodhacfd, true, true)  
    if not rtvrhfdq:  
        if iodhacfd == wzupffmz.name:  
            rtvrhfdq = wzupffmz  
        else:  
            return false  
    
    var dmghjrzx = dyfpdapq.instantiate()
    dmghjrzx.name = yjjaozte
    rtvrhfdq.add_child(dmghjrzx)
    dmghjrzx.set_owner(wzupffmz)
    
    if not lphjdcba.is_empty():
        if not rzxszvwj.xtbrhjob(dmghjrzx, lphjdcba, wzupffmz):
            return false
    
    dgzqgrad.pack(wzupffmz)
    return ResourceSaver.save(dgzqgrad, urgfvleq) == OK

static func parse_line(ejtqehvi: String, sbixaeea: String) -> Dictionary:
    if ejtqehvi.begins_with("add_existing_scene("):
        var mmtmajmb = ejtqehvi.replace("add_existing_scene(", "").strip_edges()
        if mmtmajmb.ends_with(")"):
            mmtmajmb = mmtmajmb.substr(0, mmtmajmb.length() - 1).strip_edges()
        
        var ewekimso = []
        var pbflcotu = 0
                                             
        for _i in range(4):
            var glkqrsig = mmtmajmb.find('"',pbflcotu)
            if glkqrsig == -1: return {}
            var jjakiwlc = mmtmajmb.find('"', glkqrsig + 1)
            if jjakiwlc == -1: return {}
            ewekimso.append(mmtmajmb.substr(glkqrsig + 1, jjakiwlc - glkqrsig - 1))
            pbflcotu = jjakiwlc + 1
        
                                        
        var quzbcqet = {}
        var hoxhdnrt = mmtmajmb.substr(pbflcotu).strip_edges()
        if hoxhdnrt.begins_with("{"):
            quzbcqet = msbyxgib.rqukbvqr(hoxhdnrt)
        
        return {
            "type": "add_existing_scene",
            "node_name": ewekimso[0],
            "existing_scene_path": ewekimso[1],
            "target_scene_path": ewekimso[2],
            "parent_path": ewekimso[3],
            "modifications": quzbcqet
        }
    return {}

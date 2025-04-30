                                                                 
@tool
extends Node

const ybnmwrzy = preload("action_parser_utils.gd")
const ynqbsomx = preload("edit_node_action.gd")

static func execute(runhexjo: String, xcsxqqhn: String, kqsfaqsh: String, qfceuftf: String, nasnwdky: Dictionary = {}) -> bool:
    var hohgnzxv = EditorPlugin.new().get_editor_interface()
    var mvgffnmo = hohgnzxv.get_open_scenes()
    
                                                               
    for scene in mvgffnmo:  
        if scene == kqsfaqsh:  
            print("Adding to open scene: ", scene)  
            hohgnzxv.reload_scene_from_path(kqsfaqsh)
            return rqqmxmbi(runhexjo, xcsxqqhn, hohgnzxv.get_edited_scene_root(), qfceuftf, nasnwdky)  

                                                                                                       
    print("Adding to closed scene: ", kqsfaqsh)  
    return lkdsmstx(runhexjo, xcsxqqhn, kqsfaqsh, qfceuftf, nasnwdky)  

static func rqqmxmbi(wcijytxk: String, pimhiwqz: String, wltfrdzb: Node, rhzjjxtp: String, yowlfceb: Dictionary = {}) -> bool:
    if !ClassDB.class_exists(pimhiwqz): 
        push_error("Node %s doesnt exist" % [pimhiwqz])
        return false
    var ldnrsbvi = ClassDB.instantiate(pimhiwqz)
    ldnrsbvi.name = wcijytxk
    
                                                         
    var nnwezjwo = wltfrdzb if (rhzjjxtp.is_empty() or rhzjjxtp == wltfrdzb.name) else wltfrdzb.find_child(rhzjjxtp, true, true)  
    if not nnwezjwo:  
        if rhzjjxtp == wltfrdzb.name:  
            nnwezjwo = wltfrdzb  
        else:  
            return false  
    
    nnwezjwo.add_child(ldnrsbvi)    
    ldnrsbvi.set_owner(wltfrdzb)
    
                                
    if not yowlfceb.is_empty():
        if not ynqbsomx.xtbrhjob(ldnrsbvi, yowlfceb, wltfrdzb):
            return false
    
                                                    
    return EditorInterface.save_scene() == OK

static func lkdsmstx(amoyabek: String, rqbgcbea: String, ctcnditr: String, fwezxmic: String, zfpgtlec: Dictionary = {}) -> bool:
    var kxztxzpe = load(ctcnditr)
    if !kxztxzpe is PackedScene: return false
    
    var yhbrqtgs = kxztxzpe.instantiate()
    var hxxhqqiq = ClassDB.instantiate(rqbgcbea)
    hxxhqqiq.name = amoyabek
    
                                                         
    var mojaajjt = yhbrqtgs if (fwezxmic.is_empty() or fwezxmic == yhbrqtgs.name) else yhbrqtgs.find_child(fwezxmic, true, true)  
    if not mojaajjt:  
        if fwezxmic == yhbrqtgs.name:  
            mojaajjt = yhbrqtgs  
        else:  
            return false  
    
    mojaajjt.add_child(hxxhqqiq)
    hxxhqqiq.set_owner(yhbrqtgs)
    
                                
    if not zfpgtlec.is_empty():
        if not ynqbsomx.xtbrhjob(hxxhqqiq, zfpgtlec, yhbrqtgs):
            return false
    
                                                          
    kxztxzpe.pack(yhbrqtgs)

    return ResourceSaver.save(kxztxzpe, ctcnditr) == OK

static func parse_line(uferpxpt: String, tungdfck: String) -> Dictionary:
    if uferpxpt.begins_with("create_node("):
                                                                              
        var zmysnejp = ybnmwrzy.knzasfbs(uferpxpt)
        if zmysnejp.size() < 3:
            return {}
        
                                                                 
        var mtghevgv = {}
        var pixleuhs = uferpxpt.find("{")
        var imxqxpvq = uferpxpt.rfind("}")
        
        if pixleuhs != -1 and imxqxpvq != -1:
            var dvgmhwvb = uferpxpt.substr(pixleuhs, imxqxpvq - pixleuhs + 1)
            mtghevgv = ybnmwrzy.rqukbvqr(dvgmhwvb)
        
        return {
            "type": "create_node",
            "name": zmysnejp[0],
            "node_type": zmysnejp[1],
            "scene_path": zmysnejp[2],
            "parent_path": zmysnejp[3] if zmysnejp.size() > 3 else "",
            "modifications": mtghevgv
        }
    return {}

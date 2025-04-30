                                                                      
@tool
extends Node

const hhifvsmx = preload("action_parser_utils.gd")
                                                                            
                                                   
const utiqeveh = preload("add_subresource_action.gd")

static func execute(tjjvuudu: String, faohfhcp: String, jxfmqvtj: String, ymmlcmcg: Dictionary) -> bool:
    var wuvnzbin = EditorPlugin.new().get_editor_interface()
    var cozflzro = wuvnzbin.get_open_scenes()

                                   
    for scene in cozflzro:
        if scene == faohfhcp:
                                                                    
            wuvnzbin.reload_scene_from_path(faohfhcp)
            return _edit_in_open_scene(tjjvuudu, wuvnzbin.get_edited_scene_root(), jxfmqvtj, ymmlcmcg)

                                           
                                                              
    return _edit_in_closed_scene(tjjvuudu, faohfhcp, jxfmqvtj, ymmlcmcg)


static func _edit_in_open_scene(zzwiuaiz: String, cammbxdb: Node, fwldraaw: String, pdcegnnh: Dictionary) -> bool:
    var vwkcdsyi = utiqeveh.xthulsfu(zzwiuaiz, cammbxdb)               
    if not vwkcdsyi:
        return false

    var zmjlbund = vwkcdsyi.get(fwldraaw)
    if not (zmjlbund is Resource):
        push_error("Property '%s' on node '%s' is not a Resource or doesn't exist." % [fwldraaw, zzwiuaiz])
        return false

    if not czwpvsuh(zmjlbund, pdcegnnh):
        return false

                         
    EditorInterface.edit_resource(zmjlbund)                                 
    return EditorInterface.save_scene() == OK

static func _edit_in_closed_scene(ijdwdgbb: String, hfisvgbw: String, ndgtgwyn: String, mhhuboyp: Dictionary) -> bool:
    var snkmbwgg = load(hfisvgbw)
    if !(snkmbwgg is PackedScene):
        push_error("Failed to load scene '%s' as PackedScene." % hfisvgbw)             
        return false

    var zzoknivb = snkmbwgg.instantiate()
    if not zzoknivb:
        push_error("Could not instantiate scene '%s'." % hfisvgbw)             
        return false

    var atpbmpcb = utiqeveh.xthulsfu(ijdwdgbb, zzoknivb)               
    if not atpbmpcb:
        return false

    var kgrcnntv = atpbmpcb.get(ndgtgwyn)
    if not (kgrcnntv is Resource):
        push_error("Property '%s' on node '%s' is not a Resource or doesn't exist." % [ndgtgwyn, ijdwdgbb])
                                                           
        zzoknivb.free()
        return false

    if not czwpvsuh(kgrcnntv, mhhuboyp):
                                                   
        zzoknivb.free()
        return false

                                
                                                                       
                                                                        
                                                                                  
                                                                      
    snkmbwgg.pack(zzoknivb)
    var eoqwucen = ResourceSaver.save(snkmbwgg, hfisvgbw)

                                                                
    zzoknivb.free()

    return eoqwucen == OK


                                                                             
         
                                                                             
static func czwpvsuh(cdjskgyt: Resource, tarzgxpj: Dictionary) -> bool:
                                  
    for property_name in tarzgxpj.keys():
        var nxfgqykz = tarzgxpj[property_name]
                                                          
        var sluqfklm = utiqeveh._parse_value(nxfgqykz)                         
        if sluqfklm == null and nxfgqykz != null:
            push_error("Failed to parse value '%s' for property '%s'." % [str(nxfgqykz), property_name])             
                                                                          
            return false

                                                                             
        if not utiqeveh.gqzhdsmb(cdjskgyt, property_name, sluqfklm):                                                     
                                                               
            return false

    return true


                                                                             
            
                                                       
                                                                
                                                                                                                     
                                                                             
static func parse_line(bekafojk: String, yjaymmyo: String) -> Dictionary:
    if bekafojk.begins_with("edit_subresource("):
        var qomvwyqq = bekafojk.replace("edit_subresource(", "")
        if qomvwyqq.ends_with(")"):
            qomvwyqq = qomvwyqq.substr(0, qomvwyqq.length() - 1)             
        qomvwyqq = qomvwyqq.strip_edges()

                                                                                                
        var ljfanyzo = []
        var qzcxjorw = 0
        var eufbyzbv = 0
        while eufbyzbv < 3:                             
            var yrytfxfj = qomvwyqq.find('"',qzcxjorw)
            if yrytfxfj == -1:
                break                         
            var knlpbnnp = qomvwyqq.find('"', yrytfxfj + 1)
            if knlpbnnp == -1:
                break                       
            ljfanyzo.append(qomvwyqq.substr(yrytfxfj + 1, knlpbnnp - (yrytfxfj + 1)))             
            qzcxjorw = knlpbnnp + 1
            eufbyzbv += 1
                                                                         
            var yqbpefhv = qomvwyqq.find(",", qzcxjorw)
            if yqbpefhv != -1:
                qzcxjorw = yqbpefhv + 1
            else:
                                                                                                    
                if eufbyzbv < 3: break                                               

        if ljfanyzo.size() < 3:
            push_error("Edit Subresource: Failed to parse required string arguments (node_name, scene_path, subresource_property_name). Line: " + bekafojk)
            return {}

                                                                        
        var yzughsjk = qomvwyqq.find("{", qzcxjorw)                                 
        var oeagopas = qomvwyqq.rfind("}")
        if yzughsjk == -1 or oeagopas == -1 or oeagopas < yzughsjk:
            push_error("Edit Subresource: Failed to find or parse properties dictionary. Line: " + bekafojk)
            return {}

        var gygdhkbr = qomvwyqq.substr(yzughsjk, oeagopas - yzughsjk + 1)             
                                                                           
        var himlafix = hhifvsmx.rqukbvqr(gygdhkbr)                                 

                                                                           
                                                                                   

        return {
            "type": "edit_subresource",
            "node_name": ljfanyzo[0],
            "scene_path": ljfanyzo[1],
            "subresource_property_name": ljfanyzo[2],
            "properties": himlafix                                         
        }

    return {}

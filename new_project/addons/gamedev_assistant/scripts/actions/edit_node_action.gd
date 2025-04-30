                                                               
@tool
extends Node

const ohxktypz = preload("action_parser_utils.gd")

static func execute(ekrvgyyc: String, pplxikxb: String, inmjzike: Dictionary) -> bool:
    var ohkohqgz = EditorPlugin.new().get_editor_interface()
    var djjtanhl = ohkohqgz.get_open_scenes()

                                   
    for scene in djjtanhl:
        if scene == pplxikxb:
                                                     
            ohkohqgz.reload_scene_from_path(pplxikxb)
                                                             
            return bqpvckcq(ekrvgyyc, ohkohqgz.get_edited_scene_root(), inmjzike)

                                                        
                                               
    return kcfmwdhu(ekrvgyyc, pplxikxb, inmjzike)


static func bqpvckcq(efjjnuwb: String, ggxdhfwr: Node, sysdwccx: Dictionary) -> bool:
    var renvbwxh = ggxdhfwr.find_child(efjjnuwb, true, true)
    
    if not renvbwxh and efjjnuwb == ggxdhfwr.name:
        renvbwxh = ggxdhfwr

    if not renvbwxh:
        push_error("Node '%s' not found in open scene root '%s'." % [efjjnuwb, ggxdhfwr.name])
        return false

                                                 
    if not xtbrhjob(renvbwxh, sysdwccx, ggxdhfwr):
        return false
        
                                                    
    return EditorInterface.save_scene() == OK


static func kcfmwdhu(dgjxplyt: String, bneojsng: String, gqlavsmd: Dictionary) -> bool:
    var pcxmclvm = load(bneojsng)
    if !(pcxmclvm is PackedScene):
        push_error("Failed to load scene '%s' as PackedScene." % bneojsng)
        return false

    var wlnnqbaa = pcxmclvm.instantiate()
    if not wlnnqbaa:
        push_error("Could not instantiate scene '%s'." % bneojsng)
        return false

    var kkvvjkxu = wlnnqbaa.find_child(dgjxplyt, true, true)
    
    if not kkvvjkxu and dgjxplyt == wlnnqbaa.name:
        kkvvjkxu = wlnnqbaa

    if not kkvvjkxu:
        push_error("Node '%s' not found in scene instance root '%s'." % [dgjxplyt, wlnnqbaa.name])
        return false

                                                        
    if not xtbrhjob(kkvvjkxu, gqlavsmd, wlnnqbaa):
        return false

                                
    pcxmclvm.pack(wlnnqbaa)
    return ResourceSaver.save(pcxmclvm, bneojsng) == OK


static func xtbrhjob(qdpexdua: Node, aoknhxuu: Dictionary, akksziwq: Node = null) -> bool:
    for property_name in aoknhxuu.keys():
        var yvwyoxzh = aoknhxuu[property_name]
        var pmxwqphx = _parse_value(yvwyoxzh)
        if pmxwqphx == null and yvwyoxzh != null:
            push_error("Failed to parse value '%s' for property '%s'." % [str(yvwyoxzh), property_name])
            return false
            
                                     
                                                                                                           
                                                             
        var uykhismm = _try_set_property(qdpexdua, property_name, pmxwqphx, akksziwq)
        if not uykhismm:
            return false

    return true


static func _parse_value(eqrdgxbt) -> Variant:
                                                                                            
    if eqrdgxbt is String:
        var nivzsqqp = eqrdgxbt.strip_edges()
        
                                                        
        if nivzsqqp.length() >= 2 and nivzsqqp.begins_with('"') and nivzsqqp.ends_with('"'):
            nivzsqqp = nivzsqqp.substr(1, nivzsqqp.length() - 2)
        elif nivzsqqp.length() >= 2 and nivzsqqp.begins_with("'") and nivzsqqp.ends_with("'"):
            nivzsqqp = nivzsqqp.substr(1, nivzsqqp.length() - 2)
        
        if nivzsqqp.begins_with("(") and nivzsqqp.ends_with(")"):
            var mdjptula = nivzsqqp.substr(1, nivzsqqp.length() - 2)
            var nsfcxoib = mdjptula.split(",", false)
                                                  
            if nsfcxoib.size() == 2:
                var civcqvdo = float(nsfcxoib[0].strip_edges())
                var glxjbomy = float(nsfcxoib[1].strip_edges())
                return Vector2(civcqvdo, glxjbomy)
                                                  
            if nsfcxoib.size() == 3:
                var oznwlptc = float(nsfcxoib[0].strip_edges())
                var qxxzilxg = float(nsfcxoib[1].strip_edges())
                var kkxmxhbr = float(nsfcxoib[2].strip_edges())
                return Vector3(oznwlptc, qxxzilxg, kkxmxhbr)
                                                  
            if nsfcxoib.size() == 4:
                var nypknhsi = float(nsfcxoib[0].strip_edges())
                var prcdxoky = float(nsfcxoib[1].strip_edges())
                var zadblhfd = float(nsfcxoib[2].strip_edges())
                var nfrptlsk = float(nsfcxoib[3].strip_edges())
                return Vector4(nypknhsi, prcdxoky, zadblhfd, nfrptlsk)
                               
        if nivzsqqp.to_lower() == "true":
            return true
        if nivzsqqp.to_lower() == "false":
            return false
                                
        if nivzsqqp.is_valid_float():
            return float(nivzsqqp)
                                                
        return nivzsqqp

                                                             
    return eqrdgxbt

static func bjtfgyzf(jvwiyxnr: String, iifhwodq: String) -> String:
    var jatnuxvc = ""
    var ejktyseu = jvwiyxnr.length()
    var vugzhjgt = iifhwodq.length()
    var szbxnpjb = min(ejktyseu, vugzhjgt)

    for i in range(szbxnpjb):
        if jvwiyxnr[i] != iifhwodq[i]:
            jatnuxvc += "Difference at index: " + str(i) + ", String1: " + jvwiyxnr[i] + ", String2: " + iifhwodq[i]
            break

    return jatnuxvc


static func _try_set_property(lqgioqdu: Node, hboxoaen: String, cjwgfwjk: Variant, asuhzxen: Node = null) -> bool:  
                                      
    if hboxoaen == "parent":
        if not cjwgfwjk is String:
            push_error("Parent value must be a string (name of the new parent)")
            return false

        if asuhzxen == null:
            push_error("Cannot re-parent without a valid scene root.")
            return false

        var xljbqfsx = cjwgfwjk.strip_edges()
        var ddwocsty: Node

                                                 
                                                                          
        if xljbqfsx == "" or xljbqfsx == asuhzxen.name:
            ddwocsty = asuhzxen
        else:
            ddwocsty = asuhzxen.find_child(xljbqfsx, true, true)
            if not ddwocsty:
                push_error("Failed to find parent node with name: %s" % xljbqfsx)
                return false
        
                   
        if lqgioqdu.get_parent():
            lqgioqdu.get_parent().remove_child(lqgioqdu)
        ddwocsty.add_child(lqgioqdu)

                                                                          
        lqgioqdu.set_owner(asuhzxen)

        return true

                                      
    var omiowvjo = lqgioqdu.get_property_list()
    for prop in omiowvjo:
        if prop.name == hboxoaen:
                        
            if prop.type == TYPE_COLOR:
                match typeof(cjwgfwjk):
                    TYPE_VECTOR2:
                                                            
                        cjwgfwjk = Color(cjwgfwjk.x, cjwgfwjk.y, 0, 1.0)
                    TYPE_VECTOR3:
                                                                
                        cjwgfwjk = Color(cjwgfwjk.x, cjwgfwjk.y, cjwgfwjk.z, 1.0)
                    TYPE_VECTOR4:
                        cjwgfwjk = Color(cjwgfwjk.x, cjwgfwjk.y, cjwgfwjk.z, cjwgfwjk.w)
                    TYPE_ARRAY:
                                                                                                  
                        if cjwgfwjk.size() == 3:
                            cjwgfwjk = Color(cjwgfwjk[0], cjwgfwjk[1], cjwgfwjk[2], 1.0)
                        elif cjwgfwjk.size() == 4:
                            cjwgfwjk = Color(cjwgfwjk[0], cjwgfwjk[1], cjwgfwjk[2], cjwgfwjk[3])

                                                                       
            elif prop.type == TYPE_OBJECT and prop.hint == PROPERTY_HINT_RESOURCE_TYPE:
                var nzeojqqy = prop.hint_string
                
                                           
                if nzeojqqy == "Texture2D" or nzeojqqy.contains("Texture2D"):
                    var whhajjex = load(cjwgfwjk)

                                                                                        
                    if "_" in hboxoaen:
                        var hlaiaini = hboxoaen.split("_")
                        if hlaiaini.size() > 1:
                            var hpxvnvrc = hlaiaini[1]
                            var onrvetar = "set_texture_" + hpxvnvrc
                            if lqgioqdu.has_method(onrvetar):
                                lqgioqdu.call(onrvetar, whhajjex)
                                return true

                                                                           
                    if lqgioqdu.has_method("set_texture"):
                        lqgioqdu.set_texture(whhajjex)
                        return true
                        
                                             
                elif nzeojqqy == "Mesh" or nzeojqqy.contains("Mesh"):
                    var cvefqemj = load(cjwgfwjk)
                    if not cvefqemj:
                        push_error("Failed to load mesh at path: %s" % cjwgfwjk)
                        return false
                    
                    if "_" in hboxoaen:
                        var hlaiaini = hboxoaen.split("_")
                        if hlaiaini.size() > 1:
                            var hpxvnvrc = hlaiaini[1]
                            var onrvetar = "set_mesh_" + hpxvnvrc
                            if lqgioqdu.has_method(onrvetar):
                                lqgioqdu.call(onrvetar, cvefqemj)
                                return true
                    
                    lqgioqdu.set(hboxoaen, cvefqemj)
                    return true
                
                                                
                elif nzeojqqy == "AudioStream" or nzeojqqy.contains("AudioStream"):
                    var qbpngrdg = load(cjwgfwjk)
                    if not qbpngrdg:
                        push_error("Failed to load audio stream at path: %s" % cjwgfwjk)
                        return false
                    lqgioqdu.set(hboxoaen, qbpngrdg)
                    return true



                                                                 
    if not lqgioqdu.has_method("get") or lqgioqdu.get(hboxoaen) == null:
        push_error("Property '%s' doesn't exist on node '%s'." % [hboxoaen, lqgioqdu.name])
        return false

                                    
    lqgioqdu.set(hboxoaen, cjwgfwjk)

                                                               
                                                          
    return true


                                                                             
                 
                                                                      
                                                                             
static func parse_line(dzeiqzxu: String, dbvtmbuz: String) -> Dictionary:
                                                     
    if dzeiqzxu.begins_with("edit_node("):
        var lmpdkdat = ohxktypz.pywjqdsl(dzeiqzxu)
                                                            
        if lmpdkdat.size() == 0:
            return {}
        if not lmpdkdat.has("node_name") \
            or not lmpdkdat.has("scene_path") \
            or not lmpdkdat.has("modifications"):
            return {}

        return {
            "type": "edit_node",
            "node_name": lmpdkdat.node_name,
            "scene_path": lmpdkdat.scene_path,
            "modifications": lmpdkdat.modifications
        }

    return {}

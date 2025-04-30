                                                                     
@tool
extends Node

const zskbkter = preload("action_parser_utils.gd")

static func execute(ncwgzuxt: String, wnztyswi: String, lhjdjdwj: String, vtxakxol: Dictionary) -> bool:
    var sxtfmrhr = EditorPlugin.new().get_editor_interface()
    var lmrnddym = sxtfmrhr.get_open_scenes()

                                   
    for scene in lmrnddym:
        if scene == wnztyswi:
                                                                   
            sxtfmrhr.reload_scene_from_path(wnztyswi)
            return _add_to_open_scene(ncwgzuxt, sxtfmrhr.get_edited_scene_root(), lhjdjdwj, vtxakxol)

                                           
                                                             
    return _add_to_closed_scene(ncwgzuxt, wnztyswi, lhjdjdwj, vtxakxol)


static func _add_to_open_scene(cpgtgqpi: String, jnrtbjjb: Node, esdadyzk: String, ztmibtoi: Dictionary) -> bool:
    var odbgjtue = xthulsfu(cpgtgqpi, jnrtbjjb)
    if not odbgjtue:
        return false

    var ativolfo = diibcqtu(esdadyzk, ztmibtoi)
    if not ativolfo:
        return false

                                                                                                 
                                                                                                 
    if not ztmibtoi.has("assign_to_property"):
        push_error("No 'assign_to_property' field in ztmibtoi dictionary.")
        return false

    var svvqyirq = String(ztmibtoi["assign_to_property"])
                                             
    if not ylhnujak(odbgjtue, svvqyirq, ativolfo):
        return false

                    
    return EditorInterface.save_scene() == OK

static func _add_to_closed_scene(nsnaewgy: String, worrnafm: String, vqzmneme: String, qohfctnn: Dictionary) -> bool:
    var chbrjnwu = load(worrnafm)
    if !(chbrjnwu is PackedScene):
        push_error("Failed to load scene '%s' as PackedScene." % worrnafm)
        return false

    var iwgdkqct = chbrjnwu.instantiate()
    if not iwgdkqct:
        push_error("Could not instantiate scene '%s'." % worrnafm)
        return false

    var anxzuolw = xthulsfu(nsnaewgy, iwgdkqct)
    if not anxzuolw:
        return false

    var etnwejfp = diibcqtu(vqzmneme, qohfctnn)
    if not etnwejfp:
        return false

    if not qohfctnn.has("assign_to_property"):
        push_error("No 'assign_to_property' field in qohfctnn dictionary.")
        return false

    var fepmokot = String(qohfctnn["assign_to_property"])
    if not ylhnujak(anxzuolw, fepmokot, etnwejfp):
        return false

                                
    chbrjnwu.pack(iwgdkqct)
    return ResourceSaver.save(chbrjnwu, worrnafm) == OK


                                                                             
         
                                                                             
static func xthulsfu(xxagktfg: String, neenxqxc: Node) -> Node:
    var wypwmpxj = neenxqxc.find_child(xxagktfg, true, true)
    if not wypwmpxj and xxagktfg == neenxqxc.name:
        wypwmpxj = neenxqxc

    if not wypwmpxj:
        push_error("Node '%s' not found in the scene." % xxagktfg)
        return null

    return wypwmpxj


static func diibcqtu(qgsqbqzh: String, wnvpjeyp: Dictionary) -> Resource:
    if not ClassDB.class_exists(qgsqbqzh):
        push_error("Resource type '%s' does not exist." % qgsqbqzh)
        return null

    var evbpopfi = ClassDB.instantiate(qgsqbqzh)
    if not evbpopfi:
        push_error("Could not instantiate resource of type '%s'." % qgsqbqzh)
        return null

                                                                  
    for property_name in wnvpjeyp.keys():
        if property_name == "assign_to_property":
            continue

        var sjgcnxkj = wnvpjeyp[property_name]
        var rkzwgwrl = _parse_value(sjgcnxkj)
        if rkzwgwrl == null and sjgcnxkj != null:
            push_error("Failed to parse value '%s' for property '%s'." % [str(sjgcnxkj), property_name])
            return null

        if not gqzhdsmb(evbpopfi, property_name, rkzwgwrl):
            return null

    return evbpopfi


static func _parse_value(xhbjgeku) -> Variant:
                                                             
    if xhbjgeku is String:
        var hrlyqfcj = xhbjgeku.strip_edges()
                                                 
        if hrlyqfcj.begins_with("(") and hrlyqfcj.ends_with(")"):
            var kndybehz = hrlyqfcj.substr(1, hrlyqfcj.length() - 2)
            var jbdjxuco = kndybehz.split(",", false)
            if jbdjxuco.size() == 2:
                return Vector2(float(jbdjxuco[0].strip_edges()), float(jbdjxuco[1].strip_edges()))
            elif jbdjxuco.size() == 3:
                return Vector3(float(jbdjxuco[0].strip_edges()), float(jbdjxuco[1].strip_edges()), float(jbdjxuco[2].strip_edges()))
            elif jbdjxuco.size() == 4:
                return Vector4(float(jbdjxuco[0].strip_edges()), float(jbdjxuco[1].strip_edges()), float(jbdjxuco[2].strip_edges()), float(jbdjxuco[3].strip_edges()))
        if hrlyqfcj.to_lower() == "true":
            return true
        if hrlyqfcj.to_lower() == "false":
            return false
        if hrlyqfcj.is_valid_float():
            return float(hrlyqfcj)
                                       
        return hrlyqfcj

                                                                  
    return xhbjgeku


static func ylhnujak(pgzcgvpt: Node, qtkmzwgl: String, xijwgiep: Variant) -> bool:
    var ixhqxhno = pgzcgvpt.get(qtkmzwgl)
    var lbdecwtt = true
                                                                                          
                                                                                                        
                                         
      
                                                                                                            
                                                                 

                    
    pgzcgvpt.set(qtkmzwgl, xijwgiep)
                                               
    if pgzcgvpt.get(qtkmzwgl) != xijwgiep:
        push_error("Failed to set property '%s' on node '%s' value: %s." % [qtkmzwgl, pgzcgvpt.name, xijwgiep])
        lbdecwtt = false
                          
    return lbdecwtt


static func gqzhdsmb(knasnzma: Resource, xolvzuqr: String, alzgebyz: Variant) -> bool:
                                                    
    var boggvlkw = knasnzma.get_property_list()
    var jxdehsfv = null

                                           
    for prop_info in boggvlkw:
        if prop_info.name == xolvzuqr:
            jxdehsfv = prop_info.type
            break

                                              
    if jxdehsfv == null:
        push_error("Property '%s' doesn't exist on resource '%s'." % [xolvzuqr, knasnzma.get_class()])
        return true                                                              

                                                                                 
                                         
    if jxdehsfv == TYPE_COLOR:
        match typeof(alzgebyz):
            TYPE_VECTOR2:
                                                    
                alzgebyz = Color(alzgebyz.x, alzgebyz.y, 0, 1.0)
            TYPE_VECTOR3:
                                                        
                alzgebyz = Color(alzgebyz.x, alzgebyz.y, alzgebyz.z, 1.0)
            TYPE_VECTOR4:
                                                        
                alzgebyz = Color(alzgebyz.x, alzgebyz.y, alzgebyz.z, alzgebyz.w)
            TYPE_ARRAY:
                                                                                         
                if alzgebyz.size() == 3:
                    alzgebyz = Color(alzgebyz[0], alzgebyz[1], alzgebyz[2], 1.0)
                elif alzgebyz.size() == 4:
                    alzgebyz = Color(alzgebyz[0], alzgebyz[1], alzgebyz[2], alzgebyz[3])
                                                                       
                                           
            
                                                                    
    elif jxdehsfv == TYPE_VECTOR3 and typeof(alzgebyz):
        alzgebyz = Vector3(alzgebyz.x, alzgebyz.y, 0)

                    
    knasnzma.set(xolvzuqr, alzgebyz)

                                                   
    var bbtdwgqy = knasnzma.get(xolvzuqr)
    
    var iurlquih : bool
    
    if typeof(alzgebyz) in [TYPE_VECTOR2, TYPE_VECTOR3, TYPE_VECTOR4]:
        if typeof(bbtdwgqy) == typeof(alzgebyz):
            iurlquih = bbtdwgqy.is_equal_approx(alzgebyz)
        else:
            push_error("Wrong data type for property %s" % [xolvzuqr])
            iurlquih = false
    elif typeof(alzgebyz) == TYPE_FLOAT:
                             
                         
        iurlquih = is_equal_approx(alzgebyz, bbtdwgqy)
    else:
        iurlquih = bbtdwgqy == alzgebyz

                                                                              
    if typeof(bbtdwgqy) == typeof(alzgebyz) and not iurlquih:
        push_error("Failed to set resource property '%s' on resource '%s' value: %s " % [xolvzuqr, knasnzma.get_class(), alzgebyz])
        return false

    return true



                                                                             
            
                                                       
                                                               
                                                                             
                           
static func parse_line(hxwycekq: String, xorodbox: String) -> Dictionary:
    if hxwycekq.begins_with("add_subresource("):
        var ewkesfmq = hxwycekq.replace("add_subresource(", "")
        if ewkesfmq.ends_with(")"):
            ewkesfmq = ewkesfmq.substr(0, ewkesfmq.length() - 1)
        ewkesfmq = ewkesfmq.strip_edges()

        var zizdbjxw = []
        var rtbudkjs = 0
        while true:
            var rvfhzlzo = ewkesfmq.find('"',rtbudkjs)
            if rvfhzlzo == -1:
                break
            var qnnrrmey = ewkesfmq.find('"', rvfhzlzo + 1)
            if qnnrrmey == -1:
                break
            zizdbjxw.append(ewkesfmq.substr(rvfhzlzo + 1, qnnrrmey - (rvfhzlzo + 1)))
            rtbudkjs = qnnrrmey + 1

        var mrntrbur = ewkesfmq.find("{")
        var wiyzwivk = ewkesfmq.rfind("}")
        if mrntrbur == -1 or wiyzwivk == -1:
            return {}

        var yklugfzi = ewkesfmq.substr(mrntrbur, wiyzwivk - mrntrbur + 1)
        var jzebhvdo = zskbkter.rqukbvqr(yklugfzi)

                                                                               
                                                                                
                                  
        for key in jzebhvdo.keys():
            var kyvgjnrh = jzebhvdo[key]
            if kyvgjnrh is String:
                var vrpffdys = kyvgjnrh.strip_edges()
                if vrpffdys.begins_with("\"") and vrpffdys.ends_with("\"") and vrpffdys.length() > 1:
                    vrpffdys = vrpffdys.substr(1, vrpffdys.length() - 2)
                jzebhvdo[key] = vrpffdys
                                                                               

        if zizdbjxw.size() < 3:
            return {}

        return {
            "type": "add_subresource",
            "node_name": zizdbjxw[0],
            "scene_path": zizdbjxw[1],
            "subresource_type": zizdbjxw[2],
            "properties": jzebhvdo
        }

    return {}

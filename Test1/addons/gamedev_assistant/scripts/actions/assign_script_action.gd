                                                                   
@tool  
extends Node  

const kzvudtma = preload("res://addons/gamedev_assistant/scripts/actions/action_parser_utils.gd")  

static func execute(mngacrod: String, wzrthmxp: String, vagmvyog: String) -> bool:  
    var xhzynakb = EditorPlugin.new().get_editor_interface()  
    var oxqnnmgz = xhzynakb.get_open_scenes()  

                                     
    for scene in oxqnnmgz:  
        if scene == wzrthmxp:  
                                                                           
            xhzynakb.reload_scene_from_path(wzrthmxp)  
            return cobmwdfu(mngacrod, xhzynakb.get_edited_scene_root(), vagmvyog)  

                                                          
                                                                     
    return ihutfgeu(mngacrod, wzrthmxp, vagmvyog)  

static func cobmwdfu(ysqlwfxu: String, uzrymvvu: Node, frtwvtom: String) -> bool:  
    var uxvqwleq = uzrymvvu.find_child(ysqlwfxu, true, true)  
    
    if not uxvqwleq and ysqlwfxu == uzrymvvu.name:  
        uxvqwleq = uzrymvvu  

    if not uxvqwleq:  
        push_error("Node '%s' not found in open scene root '%s'." % [ysqlwfxu, uzrymvvu.name])  
        return false  

                         
    var owerrdhm = load(frtwvtom)  
    if not owerrdhm:  
        push_error("Failed to load script at path: %s" % frtwvtom)  
        return false  

    uxvqwleq.set_script(owerrdhm)  
    
                                                         
    return EditorInterface.save_scene() == OK 

static func ihutfgeu(ptdzrogf: String, kxfttopm: String, yftsflwt: String) -> bool:  
    var mgqyvnbs = load(kxfttopm)  
    if !(mgqyvnbs is PackedScene):  
        push_error("Failed to load scene '%s' as PackedScene." % kxfttopm)  
        return false  

    var mqttmixf = mgqyvnbs.instantiate()  
    if not mqttmixf:  
        push_error("Could not instantiate scene '%s'." % kxfttopm)  
        return false  

    var fhzadxjh = mqttmixf.find_child(ptdzrogf, true, true)  
    
    if not fhzadxjh and ptdzrogf == mqttmixf.name:  
        fhzadxjh = mqttmixf  

    if not fhzadxjh:  
        push_error("Node '%s' not found in scene instance root '%s'." % [ptdzrogf, mqttmixf.name])  
        return false  

                         
    var judcvaye = load(yftsflwt)  
    if not judcvaye:  
        push_error("Failed to load script at path: %s" % yftsflwt)  
        return false  

    fhzadxjh.set_script(judcvaye)  

                                  
    mgqyvnbs.pack(mqttmixf)  
    return ResourceSaver.save(mgqyvnbs, kxfttopm) == OK  

                                                                               
                   
                                                                        
                                                                               
static func parse_line(qcwzsykf: String, loucpcix: String) -> Dictionary:  
                                                           
    if qcwzsykf.begins_with("assign_script("):  
        var jpnrrswc = qcwzsykf.replace("assign_script(", "").replace(")", "").strip_edges()  
        var tvlarvdf = []  
        var tmacxnjk = 0  
        while true:  
            var fdofmnzz = jpnrrswc.find('"',tmacxnjk)  
            if fdofmnzz == -1:  
                break  
            var igpoopgh = jpnrrswc.find('"', fdofmnzz + 1)  
            if igpoopgh == -1:  
                break  
            tvlarvdf.append(jpnrrswc.substr(fdofmnzz + 1, igpoopgh - fdofmnzz - 1))  
            tmacxnjk = igpoopgh + 1  

                                                                                  
        if tvlarvdf.size() != 3:  
            return {}  

        return {  
            "type": "assign_script",  
            "node_name": tvlarvdf[0],  
            "scene_path": tvlarvdf[1],  
            "script_path": tvlarvdf[2]  
        }  

    return {}  

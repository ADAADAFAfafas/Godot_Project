                                                            
@tool
extends Node

signal pxqehfok(action_type: String, path: String, success: bool, button: Button)

                                     
const nitssbpb = preload("res://addons/gamedev_assistant/scripts/actions/action_parser_utils.gd")
const esdxvvwj = preload("res://addons/gamedev_assistant/scripts/actions/create_file_action.gd")
const ygttxxhj = preload("res://addons/gamedev_assistant/scripts/actions/create_scene_action.gd")
const jggtnype = preload("res://addons/gamedev_assistant/scripts/actions/create_node_action.gd")
const rstndkzv = preload("res://addons/gamedev_assistant/scripts/actions/edit_node_action.gd")
const elcocbeb = preload("res://addons/gamedev_assistant/scripts/actions/add_subresource_action.gd")
const dqpjubvm = preload("res://addons/gamedev_assistant/scripts/actions/edit_subresource_action.gd")
const iabvhomb = preload("res://addons/gamedev_assistant/scripts/actions/assign_script_action.gd")
const biiniijr = preload("res://addons/gamedev_assistant/scripts/actions/add_existing_scene_action.gd")
const pjdiektg = preload("res://addons/gamedev_assistant/dock/scenes/chat/Chat_ActionButton.tscn")
const bckiorse = preload("res://addons/gamedev_assistant/dock/scenes/chat/Chat_ApplyAllButton.tscn")
const apvbdnhc = preload("res://addons/gamedev_assistant/dock/scenes/chat/Chat_ActionsContainer.tscn")
const buvbkupm = preload("res://addons/gamedev_assistant/dock/scenes/chat/Chat_Spacing.tscn")

var njifbedb: Control
var mfhffzzh : VBoxContainer
var nosaruur: Array = []
var zttfppde : Button
var kxfovvsm : bool

func _ready():
    
    var oiglacsr = EditorInterface.get_editor_settings()       
    kxfovvsm = oiglacsr.has_setting("gamedev_assistant/development_mode") and oiglacsr.get_setting('gamedev_assistant/development_mode') == true    

                                                           
    pxqehfok.connect(fwjiazlz)


                            
func velmuuls(nolumwfu: String, tmjaralg: int) -> Array:
    var mbodcuts = []

    var vrvfbmhf = "[gds_actions]"
    var ffnnaycd = "[/gds_actions]"

    var krtcogzy = nolumwfu.find(vrvfbmhf)
    var zyxdxtwz = nolumwfu.find(ffnnaycd)

    if krtcogzy == -1 or zyxdxtwz == -1:
        return mbodcuts                                       

                                                                
    var nsijlkiu = krtcogzy + vrvfbmhf.length()
    var wobuiegn = zyxdxtwz - nsijlkiu
    var jbtasoqw = nolumwfu.substr(nsijlkiu, wobuiegn).strip_edges()
    
    if kxfovvsm:
        print(jbtasoqw)

                                        
    var kcchtwdv = jbtasoqw.split("\n")
    for line in kcchtwdv:
        line = line.strip_edges()
        if line == "":
            continue

        var vnmjbjlx = xaweshsy(line, nolumwfu)
        if vnmjbjlx:
            vnmjbjlx["message_id"] = tmjaralg
            mbodcuts.append(vnmjbjlx)

    return mbodcuts


                    
func qboytohj(whjxuuud: String, cgdzutym: String, ncnisvgm: Button) -> bool:
    var wyqvesaa = esdxvvwj.execute(whjxuuud, cgdzutym)
    pxqehfok.emit("create_file", whjxuuud, wyqvesaa, ncnisvgm)
    return wyqvesaa


                     
func kpaallaw(rwlejtpu: String, tfftclvz: String, nakctznv: String, reiojhbf: Button) -> bool:
    var yddouoqs = ygttxxhj.execute(rwlejtpu, tfftclvz, nakctznv)
    pxqehfok.emit("create_scene", rwlejtpu, yddouoqs, reiojhbf)
    return yddouoqs


                    
func nqgowzrm(npgxqeqa: String, ljpnyytb: String, zntxsgum: String, dpwxmpty: String, vaiupnwy: Dictionary, bwlpmwta: Button) -> bool:
    var mctyssdj = jggtnype.execute(npgxqeqa, ljpnyytb, zntxsgum, dpwxmpty, vaiupnwy)
    pxqehfok.emit("create_node", zntxsgum, mctyssdj, bwlpmwta)
    return mctyssdj
    
                  
func jcnljhkk(xzqqysfp: String, yulrfrfo: String, mjpyljae: Dictionary, flpepqul: Button) -> bool:
    var ccnnelqp = rstndkzv.execute(xzqqysfp, yulrfrfo, mjpyljae)
    pxqehfok.emit("edit_node", yulrfrfo, ccnnelqp, flpepqul)
    return ccnnelqp
    
func cgkizxwv(kaokxxxj: String, zzuexpvi: String, vdmivyzk: String, mfqdfktf: Dictionary, tzxyhngx: Button) -> bool:
    var bjdwdlda = elcocbeb.execute(kaokxxxj, zzuexpvi, vdmivyzk, mfqdfktf)
    pxqehfok.emit("add_subresource", zzuexpvi, bjdwdlda, tzxyhngx)
    return bjdwdlda

                         
func iitfsskk(iepbfszx: String, khviieod: String, fihyzmxg: String, fuivqpow: Dictionary, brzwrkwh: Button) -> bool:
    var yqeoeicz = dqpjubvm.execute(iepbfszx, khviieod, fihyzmxg, fuivqpow)
                                                                              
    pxqehfok.emit("edit_subresource", khviieod, yqeoeicz, brzwrkwh)
    return yqeoeicz

func nrfnazjw(vwjtnlsv: String, hpxodiev: String, afffimdx: String, pjhlrmwe: Button) -> bool:  
      var jnxuztlo = iabvhomb.execute(vwjtnlsv, hpxodiev, afffimdx)  
      pxqehfok.emit("assign_script", hpxodiev, jnxuztlo, pjhlrmwe)  
      return jnxuztlo  

                                 
func ejypvmzo(tlkktusv: Array, vpkmqsvw: Control) -> void:
    
    njifbedb = vpkmqsvw    
    qvjtbmpw()
    
    mfhffzzh = apvbdnhc.instantiate()
    var bgquvbsu = buvbkupm.instantiate()
    mfhffzzh.add_child(bgquvbsu)
    njifbedb.add_child(mfhffzzh)
    
                                                        
    if tlkktusv.size() > 1:
        zttfppde = bckiorse.instantiate()
        zttfppde.text = "Apply All"
        zttfppde.disabled = false
        zttfppde.pressed.connect(vqjxrrps.bind(nosaruur))
        zttfppde.tooltip_text = "Apply the actions listed below from top to bottom"
        mfhffzzh.add_child(zttfppde)

    for action in tlkktusv:
        var dxjcnwri = pjdiektg.instantiate()

        var umwmecwv = ""
        var cnlkgtpm = []
        
        match action.type:
            "create_file":
                umwmecwv = "Create {path}".format({"path": action.path})
                cnlkgtpm.append("Create file")
            "create_scene":
                umwmecwv = "Create {path}".format({
                    "path": action.path,
                })
                cnlkgtpm.append("Create scene")
            "create_node":
                var fzrlkfrl = action.scene_path.get_file()
                var ccaiwhpy = action.parent_path if action.parent_path != "" else "root"
                umwmecwv = "Create {type} \"{node_name}\"".format({
                    "type": action.node_type,
                    "node_name": action.name
                })
                cnlkgtpm.append("Create node")
                cnlkgtpm.append("Scene: %s" % fzrlkfrl)                
            "edit_node":
                var fzrlkfrl = action.scene_path.get_file()
                umwmecwv = "Edit %s" % [action.node_name]
                
                cnlkgtpm.append("Edit node")
                cnlkgtpm.append("Scene: %s" % fzrlkfrl)
            "add_subresource":
                var fzrlkfrl = action.scene_path.get_file()
                umwmecwv = "Add %s to %s" % [
                    action.subresource_type,
                    action.node_name
                ]                
                cnlkgtpm.append("Add subresource")
            "edit_subresource":
                var fzrlkfrl = action.scene_path.get_file()
                umwmecwv = "Edit %s on %s" % [
                    action.subresource_property_name,                                       
                    action.node_name                                                
                ]
                cnlkgtpm.append("Edit subresource")
                cnlkgtpm.append("Node: %s" % action.node_name)
                cnlkgtpm.append("Property: %s" % action.subresource_property_name)
                cnlkgtpm.append("Scene: %s" % fzrlkfrl)
            "assign_script":  
                var fzrlkfrl = action.scene_path.get_file()  
                var xabkosvd = action.script_path.get_file()
                umwmecwv = "Attach %s to %s" % [  
                    xabkosvd,  
                    action.node_name  
                ]
                cnlkgtpm.append("Attach script")
                cnlkgtpm.append("File: %s" % xabkosvd)
                cnlkgtpm.append("Scene: %s" % fzrlkfrl)                
            "add_existing_scene":
                var rdqkgrrm = action.existing_scene_path.get_file()
                var eyqxgbsd = action.target_scene_path.get_file()
                umwmecwv = "Add %s to %s" % [rdqkgrrm, eyqxgbsd]
                
                cnlkgtpm.append("Add existing scene")
                cnlkgtpm.append("Source: %s" % rdqkgrrm)
                cnlkgtpm.append("Target: %s" % eyqxgbsd)           
                                
                              
        if action.has("path"):
            cnlkgtpm.append("Path: %s" % action.path)
        
        if action.has("scene_name"):
            cnlkgtpm.append("Scene: %s" % action.scene_name)
        
        if action.has("node_type"):
            cnlkgtpm.append("Node type: %s" % action.node_type)
        
        if action.has("root_type"):
            cnlkgtpm.append("Root type: %s" % action.root_type)
            
        if action.has("subresource_type"):
            cnlkgtpm.append("Subresource type: %s" % action.subresource_type)
        
        if action.has("name"):
            cnlkgtpm.append("Name: %s" % action.name)
        
        if action.has("node_name"):
            cnlkgtpm.append("Node name: %s" % action.node_name)
       
        if action.has("parent_path"):      
            cnlkgtpm.append("Parent: %s" % (action.parent_path if action.parent_path else "root"))
            
        if action.has("modifications") or action.has("properties"):
            var jqglxwpo = action.get("modifications", action.get("properties", {}))
            if jqglxwpo.size() > 0:
                cnlkgtpm.append("\nProperties to apply:")
                for key in jqglxwpo:
                    cnlkgtpm.append("• %s = %s" % [key, str(jqglxwpo[key])])
                
        dxjcnwri.tooltip_text = "\n".join(cnlkgtpm)

        dxjcnwri.text = umwmecwv
        dxjcnwri.set_meta("action", action)
        dxjcnwri.pressed.connect(mxowsojl.bind(dxjcnwri))

        mfhffzzh.add_child(dxjcnwri)
        nosaruur.append(dxjcnwri)


                          
func qvjtbmpw() -> void:
    if njifbedb == null:
        return
        
                                                                     
    if is_instance_valid(mfhffzzh) and mfhffzzh.is_inside_tree():
                                                                     
        if njifbedb.has_node(mfhffzzh.get_path()):
                                                                  
            njifbedb.remove_child(mfhffzzh)
    
                                    
    nosaruur.clear()


                                                  
func mxowsojl(bzcxntwt: Button) -> void:
    var lrnpwxvu = bzcxntwt.get_meta("action") if bzcxntwt.has_meta("action") else {}

    match lrnpwxvu.type:
        "create_file":
            qboytohj(lrnpwxvu.path, lrnpwxvu.content, bzcxntwt)
        "create_scene":
            kpaallaw(lrnpwxvu.path, lrnpwxvu.root_name, lrnpwxvu.root_type, bzcxntwt)
        "create_node":
            var dyozkrrw = lrnpwxvu.modifications if lrnpwxvu.has("modifications") else {}
            nqgowzrm(lrnpwxvu.name, lrnpwxvu.node_type, lrnpwxvu.scene_path, lrnpwxvu.parent_path, dyozkrrw, bzcxntwt)
        "edit_node":
            jcnljhkk(lrnpwxvu.node_name, lrnpwxvu.scene_path, lrnpwxvu.modifications, bzcxntwt)
        "add_subresource":
            cgkizxwv(
                lrnpwxvu.node_name,
                lrnpwxvu.scene_path,
                lrnpwxvu.subresource_type,
                lrnpwxvu.properties,
                bzcxntwt
            )
        "edit_subresource":
             iitfsskk(
                lrnpwxvu.node_name,
                lrnpwxvu.scene_path,
                lrnpwxvu.subresource_property_name,
                lrnpwxvu.properties,                                                    
                bzcxntwt
             )
        "assign_script":  
              nrfnazjw(lrnpwxvu.node_name, lrnpwxvu.scene_path, lrnpwxvu.script_path, bzcxntwt)  
        "add_existing_scene":
            mhwahkja(
                lrnpwxvu.node_name,
                lrnpwxvu.existing_scene_path,
                lrnpwxvu.target_scene_path,
                lrnpwxvu.parent_path,
                lrnpwxvu.modifications,
                bzcxntwt
            )
        _:
            push_warning("Unrecognized action type: %s" % lrnpwxvu.type)


                                             
func fwjiazlz(zmwzldrg: String, zqrdesqj: String, vlnpnadd: bool, suaezcyb: Button) -> void:
    if not is_instance_valid(suaezcyb):
        return

                                                                         
    var avrxgqml = suaezcyb.text
    var aymagrzf = suaezcyb.tooltip_text

    suaezcyb.disabled = true
                                                         
    if is_instance_valid(zttfppde):
        zttfppde.disabled = true

    var jxukhgua = suaezcyb.get_meta("action")
    var dxymggif = jxukhgua.get("message_id", -1)

    if dxymggif != -1:
        $"../APIManager".xeeehlke(dxymggif, vlnpnadd, zmwzldrg)

                                                                             
    if zmwzldrg == jxukhgua.type:
        var cejqmnqt = "✓ " if vlnpnadd else "✗ "
        var rhahwnwb = "\n\nACTION COMPLETED" if vlnpnadd else "\n\nACTION FAILED"                              
        var wfeyxkca = ""                               

                                                                   
                                                                                  
        match zmwzldrg:
            "create_file":
                wfeyxkca = ("Created file {path}" if vlnpnadd else "Failed: file creation {path}").format({"path": jxukhgua.path})
            "create_scene":
                wfeyxkca = ("Created scene {path}, root: {root_type}" if vlnpnadd else "Failed: scene creation {path}, root: {root_type}").format({
                    "path": jxukhgua.path,
                    "root_type": jxukhgua.root_type
                })
            "create_node":
                var maiypxui = jxukhgua.scene_path.get_file()
                var yfaplwdh = jxukhgua.parent_path if jxukhgua.parent_path != "" else "root"
                var zexcnccq = ""
                if jxukhgua.has("modifications") and jxukhgua.modifications.size() > 0:
                    zexcnccq = " with %s props" % jxukhgua.modifications.size()
                wfeyxkca = ("Created node {name}, type {type}, parent {parent} in scene {scene}{props}" if vlnpnadd
                                else "Failed: creating node {name}, type {type}, parent {parent} in scene {scene}{props}"
                                ).format({
                                    "name": jxukhgua.name,
                                    "type": jxukhgua.node_type,
                                    "scene": maiypxui,
                                    "parent": yfaplwdh,
                                    "props": zexcnccq
                                })
            "edit_node":
                wfeyxkca = ("Edited node \"%s\" in scene %s" if vlnpnadd
                                else "Failed: editing node \"%s\", scene: %s"
                                ) % [jxukhgua.node_name, jxukhgua.scene_path.get_file()]

            "add_subresource":
                var maiypxui = jxukhgua.scene_path.get_file()
                var epfrfbmt = str(jxukhgua.properties.size())
                wfeyxkca = ("Added subresource %s to node %s in scene %s (%s properties)" if vlnpnadd
                                else "Failed: adding subresource %s to node %s, scene: %s (%s properties)"
                                ) % [jxukhgua.subresource_type, jxukhgua.node_name, maiypxui, epfrfbmt]
                                
            "edit_subresource":
                 var maiypxui = jxukhgua.scene_path.get_file()
                 var epfrfbmt = str(jxukhgua.properties.size())
                 wfeyxkca = ("Edited subresource property '%s' on node '%s' in scene %s (%s properties changed)" if vlnpnadd
                                 else "Failed: editing subresource property '%s' on node '%s', scene: %s (%s properties attempted)"
                                 ) % [jxukhgua.subresource_property_name, jxukhgua.node_name, maiypxui, epfrfbmt]

            "assign_script":
                wfeyxkca = ("Assigned script to node \"%s\" in scene %s" if vlnpnadd
                                else "Failed: assigning script to node \"%s\", scene: %s"
                                ) % [jxukhgua.node_name, jxukhgua.scene_path.get_file()]

            "add_existing_scene":
                var nkgwnwui = jxukhgua.target_scene_path.get_file()
                var maiypxui = jxukhgua.existing_scene_path.get_file()
                var epfrfbmt = str(jxukhgua.modifications.size())
                wfeyxkca = ("Added %s to %s" if vlnpnadd
                              else "Failed: adding %s to %s"
                              ) % [maiypxui, nkgwnwui]
                if jxukhgua.modifications.size() > 0:
                    wfeyxkca += " (%s props)" % epfrfbmt
                                                       

                                                         
        suaezcyb.text = cejqmnqt + avrxgqml

                                                             
        suaezcyb.tooltip_text = aymagrzf + rhahwnwb

                                               
                                                             
        print('[GameDev Assistant] ' + cejqmnqt + wfeyxkca) 

        if not vlnpnadd:
            suaezcyb.self_modulate = Color(1, 0, 0)                               
        
                              
func xaweshsy(gfnvekti: String, huisnawu: String) -> Dictionary:
    var fhhsjbux = [esdxvvwj, ygttxxhj, jggtnype, rstndkzv, elcocbeb, dqpjubvm, iabvhomb, biiniijr]
    for parser in fhhsjbux:
        var iuzhqndv = parser.parse_line(gfnvekti, huisnawu)
        if not iuzhqndv.is_empty():
            return iuzhqndv
    return {}
    
func vqjxrrps(cnktgxzv: Array) -> void:
    zttfppde.disabled = true
    var rqiszvcm = 0
    txorzlyb(rqiszvcm, cnktgxzv)                    

func txorzlyb(znlnpzgd: int, vlcbrycl: Array):
    if znlnpzgd >= vlcbrycl.size():
        return                        

    var mhlynkyi = vlcbrycl[znlnpzgd]
    if not is_instance_valid(mhlynkyi):
        znlnpzgd += 1
        txorzlyb(znlnpzgd, vlcbrycl)                       
        return

                                                                          
    var ljbqwqrz = func(_type, _path, _success, btn):
        if btn == mhlynkyi:
            znlnpzgd += 1                        
            await get_tree().create_timer(0.2).timeout
            txorzlyb(znlnpzgd, vlcbrycl)

                                      
    pxqehfok.connect(ljbqwqrz, CONNECT_ONE_SHOT)
    await get_tree().process_frame                                           
    
                            
    mxowsojl(mhlynkyi)

func mhwahkja(fzoslkrq: String, cbfutnwt: String, rckxbexk: String, buyuqmdx: String, fwweklyx: Dictionary, zgsnjlhd: Button) -> bool:
    var rcggtzeh = biiniijr.execute(fzoslkrq, cbfutnwt, rckxbexk, buyuqmdx, fwweklyx)
    pxqehfok.emit("add_existing_scene", rckxbexk, rcggtzeh, zgsnjlhd)
    return rcggtzeh

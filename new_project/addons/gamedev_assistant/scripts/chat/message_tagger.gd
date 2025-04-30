                                                          
@tool
extends RefCounted

const wqhgqurk = "@OpenScripts"
const mtmgbspc = "@SceneTree"
const jrlpoxas = "@FileTree"
const nsalfltr = "@Output"
const ynnzzpuz = "@GitDiff"
const wqduoxjs = "@Docs"
const ymmmxuxj = 10000
const okqpoang = 5000
const zgzttrbe = 50000

var ftxhzwry = {}                                      
var ucaezrhd = []                                     

                              
func vljnuxej() -> void:
    ftxhzwry.clear()
    ucaezrhd.clear()

func qpccacki(xaollzzs: String, iirxhvsi: EditorInterface) -> String:
                                                         
    if not dlzogllv(xaollzzs):
        return xaollzzs
        
                            
    var gpgqxhxk = xaollzzs
    
    if wqhgqurk in xaollzzs:
                                      
        gpgqxhxk = pgeonrvt(gpgqxhxk, iirxhvsi)
        
    if mtmgbspc in xaollzzs:
                                     
        gpgqxhxk = tekseuek(gpgqxhxk, iirxhvsi)

    if jrlpoxas in xaollzzs:
                                     
        gpgqxhxk = gouvspzv(gpgqxhxk, iirxhvsi)

    if nsalfltr in xaollzzs:
                                        
        gpgqxhxk = ytrmykbv(gpgqxhxk, iirxhvsi)
    
    if ynnzzpuz in xaollzzs:                                                             
        gpgqxhxk = xxrnhlsg(gpgqxhxk, iirxhvsi)      

    return gpgqxhxk

func dlzogllv(dpsirvoi: String) -> bool:
                                  
    return wqhgqurk in dpsirvoi or mtmgbspc in dpsirvoi or jrlpoxas in dpsirvoi or nsalfltr in dpsirvoi

func pgeonrvt(qrjrpsef: String, qxrwwihv: EditorInterface) -> String:
    var clupwqtx = qrjrpsef.replace(wqhgqurk, wqhgqurk.substr(1)).strip_edges()
    
    var pcezbmea = tflnlhbs(qxrwwihv)
    ucaezrhd.clear()
    
                         
    var jamctmha = "\n[gds_context]\nScripts for context:\n"
    
    for file_path in pcezbmea:
        var ukgiqxqc = pcezbmea[file_path]
        var reimrxzf = ukgiqxqc.md5_text()
        
        if ftxhzwry.has(file_path):
            if ftxhzwry[file_path] == reimrxzf:
                ucaezrhd.append(file_path)
                continue                        
                
                                
        ftxhzwry[file_path] = reimrxzf
        
        jamctmha += "File: %s\nContent:\n```%s\n```\n" % [file_path, ukgiqxqc]
    
                               
    if ucaezrhd.size() > 0:
        jamctmha += "The following scripts remain the same: %s\n" % [ucaezrhd]
    
                                
    if jamctmha.length() > zgzttrbe:
        jamctmha = jamctmha.substr(0, zgzttrbe) + "..."
    
    return clupwqtx + jamctmha + "\n[/gds_context]"

func tflnlhbs(rxnokepd: EditorInterface) -> Dictionary:
    var vgowwtdk = rxnokepd.get_script_editor()
    var zyjwqshq: Array = vgowwtdk.get_open_scripts()
    
    var dodzycfw: Dictionary = {}
    
    for script in zyjwqshq:
        var znmvujzc: String = script.get_source_code()
        var eoelgczd: String = script.get_path()
                                            
        dodzycfw[eoelgczd] = znmvujzc
        
    return dodzycfw

func tekseuek(ssuilkzz: String, pluheoun: EditorInterface) -> String:
                                                                                                                          
    var gbdqxxyp = ssuilkzz.replace(mtmgbspc, mtmgbspc.substr(1)).strip_edges()
    
                               
    var qaawsefd = pluheoun.get_edited_scene_root()
    if not qaawsefd:
        return gbdqxxyp + "\n[gds_context]Node tree: No scene is currently being edited.[/gds_context]"
    
                                
    var fxvvyrjn = "\n[gds_context]Node tree:\n"
    fxvvyrjn += nmmppqpa(qaawsefd)
    fxvvyrjn += "--\n"

    if fxvvyrjn.length() > ymmmxuxj:                                                            
        fxvvyrjn = fxvvyrjn.substr(0, ymmmxuxj) + "..."
        
    fxvvyrjn += "\n[/gds_context]"
        
    return gbdqxxyp + fxvvyrjn

func nmmppqpa(xdnrxnmq: Node, fgvbzydo: String = "") -> String:
    var zxwgqvmi = fgvbzydo + "- " + xdnrxnmq.name
    zxwgqvmi += " (" + xdnrxnmq.get_class() + ")"
    
                                                                              
    if xdnrxnmq.owner and xdnrxnmq.owner != xdnrxnmq:
        zxwgqvmi += " [owner: " + xdnrxnmq.owner.name + "]"
    
    zxwgqvmi += "\n"
    var hyseimxf = fgvbzydo + "  "
    
                            
    var lwtcrfzv = []
    for prop in xdnrxnmq.get_property_list():
        var yrkpxdle = prop["name"]
        var eyfxlnwi = xdnrxnmq.get(yrkpxdle)
        if eyfxlnwi is Resource and eyfxlnwi != null:
            var ldloqugd = eyfxlnwi.get_class()
            if eyfxlnwi.resource_name != "":
                ldloqugd = eyfxlnwi.resource_name
            lwtcrfzv.append("%s (%s)" % [yrkpxdle, ldloqugd])
        
    if not lwtcrfzv.is_empty():
        zxwgqvmi += hyseimxf + "Assigned subresources: " + ", ".join(lwtcrfzv) + "\n"
    
                                       
    if xdnrxnmq.get_script():
        zxwgqvmi += hyseimxf + "Script: " + xdnrxnmq.get_script().resource_path + "\n"
    
                            
    if xdnrxnmq.unique_name_in_owner:
        zxwgqvmi += hyseimxf + "Unique name: %" + xdnrxnmq.name + "\n"
    
                
    var cvqzlrpf = xdnrxnmq.get_groups()
    if not cvqzlrpf.is_empty():
                                                              
        cvqzlrpf = cvqzlrpf.filter(func(group): return not group.begins_with("_"))
        if not cvqzlrpf.is_empty():
            zxwgqvmi += hyseimxf + "Groups: " + ", ".join(cvqzlrpf) + "\n"
    
                                           
    if xdnrxnmq.scene_file_path:
        zxwgqvmi += hyseimxf + "Instanced from: " + xdnrxnmq.scene_file_path + "\n"
    
                      
    for child in xdnrxnmq.get_children():
        zxwgqvmi += nmmppqpa(child, hyseimxf)
    
    return zxwgqvmi

func gouvspzv(nzgiayqz: String, grjohxgy: EditorInterface) -> String:
                                                                                                                          
    var rtexxnzs = nzgiayqz.replace(jrlpoxas, jrlpoxas.substr(1)).strip_edges()

    var dullefsk = grjohxgy.get_resource_filesystem()
    var hrqmanca = "res://"
    
                                
    var bivjgrzp = "\n[gds_context]\nFile Tree:\n"
    bivjgrzp += frjzgvbm(dullefsk.get_filesystem_path(hrqmanca))
    bivjgrzp += "--\n"
    
    if bivjgrzp.length() > ymmmxuxj:                                                            
        bivjgrzp = bivjgrzp.substr(0, ymmmxuxj) + "..."
            
    bivjgrzp += "\n[/gds_context]"
    
    return rtexxnzs + bivjgrzp

func frjzgvbm(ukspcegp: EditorFileSystemDirectory, ymegaaqh: String = "") -> String:
    var wjhqkrtc = ""
    
                                                          
    var rnxccype = ukspcegp.get_path()
    if rnxccype == "res://addons/gamedev_assistant/":
                                
        var ltohunkq = EditorInterface.get_editor_settings()
        var hmcnxmbv = ltohunkq.has_setting("gamedev_assistant/development_mode") and ltohunkq.get_setting("gamedev_assistant/development_mode") == true
        if not hmcnxmbv:
            return ymegaaqh + "+ gamedev_assistant/\n"                                            
    
                                                   
    if ukspcegp.get_path() != "res://":
        wjhqkrtc += ymegaaqh + "+ " + ukspcegp.get_name() + "/\n"
        ymegaaqh += "  "
    
                                      
    for i in ukspcegp.get_subdir_count():
        var fjmcwlaz = ukspcegp.get_subdir(i)
        wjhqkrtc += frjzgvbm(fjmcwlaz, ymegaaqh)
    
    for i in ukspcegp.get_file_count():
        var gjrbgorm = ukspcegp.get_file(i)
        wjhqkrtc += ymegaaqh + "- " + gjrbgorm + "\n"
    
    return wjhqkrtc

func ytrmykbv(ibwdipex: String, tjmlzysv: EditorInterface) -> String:
                                                                                                                          
    var gdgroljy = ibwdipex.replace(nsalfltr, nsalfltr.substr(1)).strip_edges()

                                                                                                       
    var bnfrwnhk: Node = tjmlzysv.get_base_control()
    var ysmlqynu: RichTextLabel = bxilycte(bnfrwnhk)

    if ysmlqynu:
        var bbvmuaaj = ysmlqynu.get_parsed_text()
        
        if bbvmuaaj.length() > okqpoang:                     
                                                                                            
            bbvmuaaj = bbvmuaaj.substr(-okqpoang) + "..."
        
        if bbvmuaaj.length() > 0:
            return gdgroljy + "\n[gds_context]\nOutput Panel:\n" + bbvmuaaj + "\n[/gds_context]"
        else:
            return gdgroljy + "\n[gds_context]No contents in the Output Panel.[/gds_context]"
    else:
        print("No RichTextLabel under @EditorLog was found.")
        return gdgroljy + "\n--\nOutput Panel: Could not find the label.\n--\n"


func bxilycte(mxfinmeu: Node) -> RichTextLabel:
                                              
    if mxfinmeu is RichTextLabel:
        var qzauxzbc: Node = mxfinmeu.get_parent()
        if qzauxzbc:
            var hjnabwqc: Node = qzauxzbc.get_parent()
                                                           
            if hjnabwqc and hjnabwqc.name.begins_with("@EditorLog"):
                return mxfinmeu

                              
    for child in mxfinmeu.get_children():
        var mjxpwijr: RichTextLabel = bxilycte(child)
        if mjxpwijr:
            return mjxpwijr

    return null

func xxrnhlsg(yvhfoyop: String, szxivuqp: EditorInterface) -> String:         
                                                                                                                          
    var rwdgvhhq = yvhfoyop.replace(ynnzzpuz, ynnzzpuz.substr(1)).strip_edges()
                                                                                                    
                                                                                                  
    var enidzntp = []                                                                              
    var lojukawj = OS.execute("git", ["diff"], enidzntp, true)                                    
                                                                                                    
    if lojukawj == 0:                                                                            
        var qjvcwmwn = "\n[gds_context]\nGit Diff:\n" + "\n".join(enidzntp) + "\n"  
        
        if qjvcwmwn.length() > ymmmxuxj:                                                            
            qjvcwmwn = qjvcwmwn.substr(0, ymmmxuxj) + "..."
        
        qjvcwmwn += "[/gds_context]"
        
        return rwdgvhhq + qjvcwmwn                                                
    else:                                                                                         
        return rwdgvhhq + "\n--\nGit Diff: Failed to execute git diff command.\n--\n"

func apoiwzdg(plwzdcbm: String, xyqfaejf: EditorInterface) -> String:
                                                                                                                          
    var ntxwufta = plwzdcbm.replace(wqduoxjs, wqduoxjs.substr(1)).strip_edges()
    return ntxwufta

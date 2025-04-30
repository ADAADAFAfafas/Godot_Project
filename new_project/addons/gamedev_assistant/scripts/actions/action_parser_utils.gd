                                                                  
@tool
extends Node

static func onsasfel(rojxrvbg: String) -> String:
    var jeqnhjen = rojxrvbg.find('"')
    if jeqnhjen == -1:
        return ""
    var qzcvvcjw = rojxrvbg.find('"', jeqnhjen + 1)
    if qzcvvcjw == -1:
        return ""
    return rojxrvbg.substr(jeqnhjen + 1, qzcvvcjw - (jeqnhjen + 1))


static func fhurlcws(ewnhdxtj: String, mdxkhfce: String) -> String:
    var pkapxtdm = RegEx.new()
    pkapxtdm.compile("```.*\\n# New file: " + ewnhdxtj + "\\n([\\s\\S]*?)```")
    var ypadvjym = pkapxtdm.search(mdxkhfce)
    return ypadvjym.get_string(1).strip_edges() if ypadvjym else ""


static func zkithmof(jaqrbsan: String) -> Array:
    var loehibxv = jaqrbsan.replace("create_scene(", "").replace(")", "").strip_edges()
    var cvnvnxgd = []
    var tztjgiao = 0
    while true:
        var iauldoal = loehibxv.find('"',tztjgiao)
        if iauldoal == -1:
            break
        var wldwxwyw = loehibxv.find('"', iauldoal + 1)
        if wldwxwyw == -1:
            break
        cvnvnxgd.append(loehibxv.substr(iauldoal + 1, wldwxwyw - iauldoal - 1))
        tztjgiao = wldwxwyw + 1
    return cvnvnxgd


                                                     
static func knzasfbs(ekouzpfj: String) -> Array:
    var frtgzmfj = ekouzpfj.replace("create_node(", "")
    
                                                                                                    
    var kujasxad = frtgzmfj.rfind(")")
    if kujasxad != -1:
        frtgzmfj = frtgzmfj.substr(0, kujasxad)
    
    frtgzmfj = frtgzmfj.strip_edges()
    
                                                   
    var qgyfxcmt = frtgzmfj.find("{")
    if qgyfxcmt != -1:
        frtgzmfj = frtgzmfj.substr(0, qgyfxcmt).strip_edges()
    
    var mjrkaalu = []
    var vlcotndj = 0
    while true:
        var hegzeqdh = frtgzmfj.find('"',vlcotndj)
        if hegzeqdh == -1:
            break
        var tkebawvq = frtgzmfj.find('"', hegzeqdh + 1)
        if tkebawvq == -1:
            break
        mjrkaalu.append(frtgzmfj.substr(hegzeqdh + 1, tkebawvq - hegzeqdh - 1))
        vlcotndj = tkebawvq + 1
    return mjrkaalu


                                                                             
                   
                                                                             
static func pywjqdsl(tfandqgm: String) -> Dictionary:
                                 
    var vqjobbvq = tfandqgm.replace("edit_node(", "")

                                    
    if vqjobbvq.ends_with(")"):
        vqjobbvq = vqjobbvq.substr(0, vqjobbvq.length() - 1)

                     
    vqjobbvq = vqjobbvq.strip_edges()

                                                                  
    var eunbsbdj = []
    var gcpnsgun = 0
    while true:
        var kdlnjhhv = vqjobbvq.find('"',gcpnsgun)
        if kdlnjhhv == -1:
            break
        var nlhkoubm = vqjobbvq.find('"', kdlnjhhv + 1)
        if nlhkoubm == -1:
            break

        eunbsbdj.append(vqjobbvq.substr(kdlnjhhv + 1, nlhkoubm - kdlnjhhv - 1))
        gcpnsgun = nlhkoubm + 1

                              
    var howuqijv = vqjobbvq.find("{")
    var kkxcmlri = vqjobbvq.rfind("}")
    if howuqijv == -1 or kkxcmlri == -1:
                                           
        return {}

    var oiznqlfu = vqjobbvq.substr(howuqijv, kkxcmlri - howuqijv + 1)

                                             
    var dftyojxx = ""
    if eunbsbdj.size() > 0:
        dftyojxx = eunbsbdj[0]

    var nsgenbhh = ""
    if eunbsbdj.size() > 1:
        nsgenbhh = eunbsbdj[1]

    return {
        "node_name": dftyojxx,
        "scene_path": nsgenbhh,
        "modifications": rqukbvqr(oiznqlfu)
    }


static func rqukbvqr(daqlwjgi: String) -> Dictionary:
                                                          
    var krpmyult = daqlwjgi.strip_edges()

                                    
    if krpmyult.begins_with("{"):
        krpmyult = krpmyult.substr(1, krpmyult.length() - 1)
                                     
    if krpmyult.ends_with("}"):
        krpmyult = krpmyult.substr(0, krpmyult.length() - 1)

                                      
    krpmyult = krpmyult.strip_edges()

                                                              
    var vdeltpvh = []
    var iygmnbaf = ""
    var ilwburfm = 0

    for i in range(krpmyult.length()):
        var ysjorjkz = krpmyult[i]
        if ysjorjkz == "(":
            ilwburfm += 1
        elif ysjorjkz == ")":
            ilwburfm -= 1

        if ysjorjkz == "," and ilwburfm == 0:
            vdeltpvh.append(iygmnbaf.strip_edges())
            iygmnbaf = ""
        else:
            iygmnbaf += ysjorjkz

    if iygmnbaf != "":
        vdeltpvh.append(iygmnbaf.strip_edges())

                                 
    var vjlqwfrt = {}
    for entry in vdeltpvh:
        var ylxnnfni = entry.find(":")
        if ylxnnfni == -1:
            continue

        var kuexalrb = entry.substr(0, ylxnnfni).strip_edges()
        var pucyicie = entry.substr(ylxnnfni + 1).strip_edges()

                                                                        
        if kuexalrb.begins_with("\"") and kuexalrb.ends_with("\"") and kuexalrb.length() >= 2:
            kuexalrb = kuexalrb.substr(1, kuexalrb.length() - 2)

        vjlqwfrt[kuexalrb] = pucyicie

    return vjlqwfrt

                                                              
@tool
class_name MarkdownToBBCode
extends RefCounted

const tejstvuq = [
    "b", "i", "u", "s", "code", "char", "p", "center", "left", "right", "fill",
    "indent", "url", "hint", "img", "font", "font_size", "dropcap",
    "opentype_features", "lang", "color", "bgcolor", "fgcolor", "outline_size",
    "outline_color", "table", "cell", "ul", "ol", "lb", "rb", "lrm", "rlm",
    "lre", "rle", "lro", "rlo", "pdf", "alm", "lri", "rli", "fsi", "pdi",
    "zwj", "zwnj", "wj", "shy"
]


                                                                    
                              
                                                                
                                                                    
static func semklxcy(wpywjahn: Array, quvcpzat: String) -> String:
    var tihfwnno = ""
    for i in range(wpywjahn.size()):
        if i > 0:
            tihfwnno += quvcpzat
        tihfwnno += str(wpywjahn[i])
    return tihfwnno


                                                                    
                                     
 
                                
                                                              
                                                                         
                                                                    
static func qddmltuv(zgxhxtby: String) -> String:
    var artvlnog = zgxhxtby.split("\n")
    var trltcjdk = []
    var mtptdvbe = false
    var erattcmd = []
    var jserbvqo = []

    for line in artvlnog:
        var imgsctew = line.strip_edges(true, false)                       

        if imgsctew.begins_with("```"):
            if mtptdvbe:
                                
                var krwpvhpq = semklxcy(erattcmd, "\n")
                krwpvhpq = fyoanpkz(krwpvhpq)

                                                       
                if jserbvqo.size() > 0:
                    var nontkkcr = semklxcy(jserbvqo, "\n")
                    nontkkcr = fyoanpkz(nontkkcr)
                    nontkkcr = pkkqukmo(nontkkcr)
                    trltcjdk.append(nontkkcr)
                    jserbvqo.clear()

                trltcjdk.append("\n[table=1]\n[cell bg=#000000]\n[code]" + krwpvhpq + "[/code]\n[/cell]\n[/table]\n")
                erattcmd.clear()
                mtptdvbe = false
            else:
                                  
                if jserbvqo.size() > 0:
                    var uoopzujh = semklxcy(jserbvqo, "\n")
                    uoopzujh = fyoanpkz(uoopzujh)
                    uoopzujh = pkkqukmo(uoopzujh)
                    trltcjdk.append(uoopzujh)
                    jserbvqo.clear()
                mtptdvbe = true
        elif mtptdvbe:
            erattcmd.append(line)
        else:
            jserbvqo.append(line)

                                 
    if mtptdvbe and erattcmd.size() > 0:
                             
        var vmaijyqk = semklxcy(erattcmd, "\n")
        vmaijyqk = fyoanpkz(vmaijyqk)
        var txhhbwlq = hnqgjnnp(vmaijyqk)
        trltcjdk.append("[p][/p][table=1]\n[cell bg=#000000]\n[code]" + txhhbwlq + "[/code]\n[/cell]\n[/table]")
    elif jserbvqo.size() > 0:
        var qghalldw = semklxcy(jserbvqo, "\n")
        qghalldw = fyoanpkz(qghalldw)
        qghalldw = pkkqukmo(qghalldw)
        trltcjdk.append(qghalldw)

    return semklxcy(trltcjdk, "\n")


                                                                    
                                         
 
                                                    
                                                                                  
                                                                            
                                                                    
static func uoazrmmd(fkxtvwbm: String) -> Array:
    var kzzhqnbj = []
    var pmkhdauq = fkxtvwbm.split("\n")

    var xcscmfqm = false
    var eikbuhui = []
    var lrsmjqkt = []

    for line in pmkhdauq:
        var zsxwbhwp = line.strip_edges()

        if zsxwbhwp.begins_with("```"):
            if xcscmfqm:
                                    
                var morichpn = semklxcy(lrsmjqkt, "\n")
                kzzhqnbj.append({ "type": "code", "content": morichpn })
                lrsmjqkt.clear()
                xcscmfqm = false
            else:
                                    
                if eikbuhui.size() > 0:
                    var rcrxdfby = semklxcy(eikbuhui, "\n")
                    kzzhqnbj.append({ "type": "text", "content": rcrxdfby })
                    eikbuhui.clear()
                xcscmfqm = true
        elif xcscmfqm:
            lrsmjqkt.append(line)
        else:
            eikbuhui.append(line)

                                      
    if eikbuhui.size() > 0:
        var jwuqqbup = semklxcy(eikbuhui, "\n")
        kzzhqnbj.append({ "type": "text", "content": jwuqqbup })
    elif xcscmfqm and lrsmjqkt.size() > 0:
        var fbeamalg = semklxcy(lrsmjqkt, "\n")
        kzzhqnbj.append({ "type": "code", "content": fbeamalg })

    return kzzhqnbj


                             
                           
                             

static func hnqgjnnp(yfomdiho: String) -> String:
    var jgehbjny = yfomdiho.split("\n")
    var qffwvjkq = 0
    
                           
    for line in jgehbjny:
        qffwvjkq = max(qffwvjkq, line.length())
    
                                    
    for i in range(jgehbjny.size()):
        var rqdyobef = "  "
        var dgkgiojh = "  "
        jgehbjny[i] = rqdyobef + jgehbjny[i] + dgkgiojh
    
    return semklxcy(jgehbjny, "\n") + "\n"


static func pkkqukmo(kryolior: String) -> String:
    var kckpfhbs = kryolior
    var xcwbxggz = kckpfhbs.split("\n")
    var eovuzdgw = []

    for line in xcwbxggz:
                        
        if line.begins_with("## "):
            line = "[font_size=22][b]" + line.substr(3) + "[/b][/font_size]"
        elif line.begins_with("### "):
            line = "[font_size=18][b]" + line.substr(4) + "[/b][/font_size]"
        elif line.begins_with("#### "):
            line = "[font_size=16][b]" + line.substr(4) + "[/b][/font_size]"
        
               
        line = chcvwlqa(line)
        eovuzdgw.append(line)

    kckpfhbs = semklxcy(eovuzdgw, "\n")

                               
    var arwusrta = kckpfhbs.split("***")
    kckpfhbs = ""
    for i in range(arwusrta.size()):
        kckpfhbs += arwusrta[i]
        if i < arwusrta.size() - 1:
            if i % 2 == 0:
                kckpfhbs += "[b][i]"
            else:
                kckpfhbs += "[/i][/b]"

                           
    var pvaqdlfs = kckpfhbs.split("**")
    var evgdrupw = ""
    for i in range(pvaqdlfs.size()):
        evgdrupw += pvaqdlfs[i]
        if i < pvaqdlfs.size() - 1:
            if i % 2 == 0:
                evgdrupw += "[b]"
            else:
                evgdrupw += "[/b]"
    kckpfhbs = evgdrupw

                           
    var usuocnsq = RegEx.new()
    usuocnsq.compile("(?<![\\s])(\\*)(?![\\s])([^\\*]+?)(?<![\\s])\\*(?![\\s])")
    kckpfhbs = usuocnsq.sub(kckpfhbs, "[i]$2[/i]", true)
    
    return kckpfhbs

static func gkjiswqh(sfmesovi: String, hzvwbnaz: String, jfvmpaaw: int) -> bool:
    var ycnhwmyw = jfvmpaaw + sfmesovi.length()
    while ycnhwmyw < hzvwbnaz.length():
        var gokmctfa = hzvwbnaz[ycnhwmyw]
        if gokmctfa == "(":
            return true
        elif gokmctfa == " " or gokmctfa == "\t":
            ycnhwmyw += 1
        else:
            return false
    return false


static func ngsfwegy(jshyzgel: String, hkhahaoc: Color) -> String:
    return "[hkhahaoc =#" + hkhahaoc.to_html(false) + "]" + jshyzgel + "[/color]"


static func fyoanpkz(zopmxwzd: String) -> String:
    var hpddnscr = zopmxwzd
    var svopqwec = RegEx.new()
    svopqwec.compile("\\[(/?)(\\w+)((?:[= ])[^\\]]*)?\\]")

    var hbvyxurd = svopqwec.search_all(hpddnscr)
    hbvyxurd.reverse()
    for match in hbvyxurd:
        var xfhnpfhy = match.get_string()
        var xisvipkl = match.get_string(2).to_lower()
        if xisvipkl in tejstvuq:
            var scrvhwgd = match.get_start()
            var yuyhfyvc = match.get_end()
            var fgnhmfrk = ""
            for c in xfhnpfhy:
                if c == "[":
                    fgnhmfrk += "[lb]"
                elif c == "]":
                    fgnhmfrk += "[rb]"
                else:
                    fgnhmfrk += c
            hpddnscr = hpddnscr.substr(0, scrvhwgd) + fgnhmfrk + hpddnscr.substr(yuyhfyvc)

    return hpddnscr


static func chcvwlqa(ywdscnzt: String) -> String:
    var oeouhfkb = RegEx.new()
                                      
    oeouhfkb.compile("\\[(.+?)\\]\\((.+?)\\)")
    var wxiuuwow = ywdscnzt
    var xjwstttq = oeouhfkb.search_all(ywdscnzt)
    xjwstttq.reverse()
    for match in xjwstttq:
        var aklszaum = match.get_string()
        var slfwlcgq = match.get_string(1)
        var odidevfy = match.get_string(2)
                             
        var gwxhuxez = "[url=%s]%s[/url]" % [odidevfy, slfwlcgq]
        wxiuuwow = wxiuuwow.substr(0, match.get_start()) + gwxhuxez + wxiuuwow.substr(match.get_end())
    return wxiuuwow

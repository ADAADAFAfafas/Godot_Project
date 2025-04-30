                         
@tool
extends Node

                                                 
                                      
                                   

signal cfevtapb (validated : bool, error : String)

signal qpkthrlg(update_available: bool, latest_version: String)
signal jvmfmbnf(error: String)

signal putvmsfj (message : String, conv_id : int)
signal xeogjddr (error : String)
signal phzdzhob (message : String)

signal glqvlbel (data)
signal yvjilidk (error : String)

signal rtypqwfe (data)
signal hfldpyup (error : String)

signal kfatwmtm ()
signal nzvhtrya (error : String)

signal eniataow ()
signal bsawcvxy (error : String)

signal yzjcneoy

const mahpjfqa = 30

              
signal zeekezpg(content: String, conv_id: int, message_id: int)
signal fqozkuex(conv_id: int, message_id: int)
signal tdwqleai(conv_id: int, message_id: int)
signal dgxhysku(error: String)
var hxksqxar : HTTPClient
var buavrzoz = false
var mafqpisp = ""

var vruvvzem : String
var cfxkvfmx : String
var rcklpvkn : String
var zenoipcs : String
var urjnpixg : String
var bgxkogit : String
var ecobdoap : String
var lcfbbzvf : String

var nyivktjz : String:
    get:
        var smlqsmxe = EditorInterface.get_editor_settings()
        var hcdybrxw = "null"
        var lotdwnrl : bool = smlqsmxe.has_setting("gamedev_assistant/development_mode") and smlqsmxe.get_setting('gamedev_assistant/development_mode') == true
        
        if not lotdwnrl and smlqsmxe.has_setting("gamedev_assistant/token"):
            return smlqsmxe.get_setting("gamedev_assistant/token")
        elif lotdwnrl and smlqsmxe.has_setting("gamedev_assistant/token_dev"):        
            return smlqsmxe.get_setting("gamedev_assistant/token_dev")
                    
        return hcdybrxw

var tzrwbrxk = ["Content-type: application/json", "Authorization: Bearer " + nyivktjz]

@onready var babjfzzk = $"../ConversationManager"

@onready var shzkamwv : HTTPRequest = $ValidateToken
@onready var oafjlczt : HTTPRequest = $SendMessage
@onready var ccsffibq : HTTPRequest = $GetConversationsList
@onready var khvsunpm : HTTPRequest = $GetConversation
@onready var lqlymvhb : HTTPRequest = $DeleteConversation
@onready var uigmfypt : HTTPRequest = $ToggleFavorite
@onready var guzwzqae : HTTPRequest = $CheckUpdates
@onready var eygtqkaa : HTTPRequest = $TrackAction
@onready var imhixyef : HTTPRequest = $RatingAction


var yenbknsp = []

func _ready ():
                                      
    hxksqxar = HTTPClient.new()
    
    shzkamwv.timeout = mahpjfqa                                         
    oafjlczt.timeout = mahpjfqa                                           
    ccsffibq.timeout = mahpjfqa                                 
    khvsunpm.timeout = mahpjfqa                                       
    lqlymvhb.timeout = mahpjfqa                                    
    uigmfypt.timeout = mahpjfqa
    guzwzqae.timeout = mahpjfqa
    
    shzkamwv.request_completed.connect(wouktbyf)
    oafjlczt.request_completed.connect(uiudcohr)
    ccsffibq.request_completed.connect(zzdnasdg)
    khvsunpm.request_completed.connect(xrbprdwf)
    lqlymvhb.request_completed.connect(xaejsrjn)
    uigmfypt.request_completed.connect(cndvqdbs)
    guzwzqae.request_completed.connect(bchuiyta)
    
    yzjcneoy.connect(rcftyuex)  
    
    swbofbcr ()
    

func swbofbcr ():
    var tjlmgefr = EditorInterface.get_editor_settings()            
    if tjlmgefr.has_setting("gamedev_assistant/endpoint"):          
        vruvvzem = tjlmgefr.get_setting("gamedev_assistant/endpoint")    
        cfxkvfmx = vruvvzem + "/token/validate"                
        rcklpvkn = vruvvzem + "/chat/message"                         
        zenoipcs = vruvvzem + "/chat/conversations"        
        urjnpixg = vruvvzem + "/chat/conversation/"
        bgxkogit = vruvvzem + "/chat/checkForUpdates"
        ecobdoap = vruvvzem + "/chat/track-action"
        lcfbbzvf = vruvvzem + "/chat/track-rating"

func izfajpxz ():
    return ["Content-type: application/json", "Authorization: Bearer " + nyivktjz]

func imsdkhdu ():
    var hbylmomv = shzkamwv.request(cfxkvfmx, izfajpxz(), HTTPClient.METHOD_GET)

func viqagaii(lbudtaaf: String, myqmjfzz: bool) -> void:
    
    oafjlczt.timeout = mahpjfqa
    
                           
    buavrzoz = false
    mafqpisp = ""
    
                                
    var itwzwkzf = vruvvzem.begins_with("https://")
    var xbheoejz = vruvvzem.replace("http://", "").replace("https://", "")
    
                                       
    var hofksvse = -1
    if xbheoejz.begins_with("localhost:"):
        var clapdlim = xbheoejz.split(":")
        xbheoejz = clapdlim[0]
        hofksvse = int(clapdlim[1])
    
                                                                            
    
    var shgpcfkh: Error
    if itwzwkzf:
        shgpcfkh = hxksqxar.connect_to_host(xbheoejz, hofksvse, TLSOptions.client())
    else:
        shgpcfkh = hxksqxar.connect_to_host(xbheoejz, hofksvse)
        
    if shgpcfkh != OK:
        dgxhysku.emit("Failed to connect: " + str(shgpcfkh))
        return

    buavrzoz = true
    
                             
    var rmerayzo = EditorInterface.get_editor_settings()
    var siovlkju = rmerayzo.get_setting("gamedev_assistant/version_identifier")
    
    var dbmeyxap = Engine.get_version_info()
    var wzxsowgd = "%d.%d" % [dbmeyxap.major, dbmeyxap.minor]
    
                              
    var wvbpnynx = { 
        "content": lbudtaaf, 
        "useThinking": myqmjfzz,
        "releaseUniqueIdentifier": siovlkju,
        "godotVersion": wzxsowgd
    }
    
    var wgcktjpn = babjfzzk.jnkhftsk()
    
    if wgcktjpn and wgcktjpn.id > 0:
        wvbpnynx["conversationId"] = wgcktjpn.id
        
                                                            
    
                                                
    cptenyne(wvbpnynx)
    
    phzdzhob.emit(lbudtaaf)

func wzljkdxx ():
    var hgthmsdv = ccsffibq.request(zenoipcs, izfajpxz(), HTTPClient.METHOD_GET)

func get_conversation (xhaseqmm : int):
    var ffboqoow = urjnpixg + str(xhaseqmm)
    var njcvwwir = khvsunpm.request(ffboqoow, izfajpxz(), HTTPClient.METHOD_GET)

func hxxtrced (etyuemfl : int):
    var yyrnxpar = urjnpixg + str(etyuemfl)
    var lparquxx = lqlymvhb.request(yyrnxpar, izfajpxz(), HTTPClient.METHOD_DELETE)

func heywgoox (vlzctiub : int):
    var bummcays = urjnpixg + str(vlzctiub) + "/toggle-favorite"
    var fxmasbgb = uigmfypt.request(bummcays, izfajpxz(), HTTPClient.METHOD_POST)

func wouktbyf(bwzmgjew: int, alnfzjow: int, vcunwuik: PackedStringArray, bccpaqoy: PackedByteArray):
                                
    if bwzmgjew != HTTPRequest.RESULT_SUCCESS:
        cfevtapb.emit(false, "Network error (Code: " + str(bwzmgjew) + ")")
        return
        
    var mpgfkwom = bkbyiliv(bccpaqoy)
    if not mpgfkwom is Dictionary:
        cfevtapb.emit(false, "Response error (Code: " + str(alnfzjow) + ")")
        return
        
    var csibgtoz = mpgfkwom.get("success", false)
    var bftfvcmh = mpgfkwom.get("error", "Response code: " + str(alnfzjow))
    
    cfevtapb.emit(csibgtoz, bftfvcmh)

                                                     
func uiudcohr(uczozvtd, heowakjr, gzpgkrub, tzuycbgb):
    
    if uczozvtd != HTTPRequest.RESULT_SUCCESS:
        xeogjddr.emit("Network error (Code: " + str(uczozvtd) + ")")
        return
        
    var oeyzudnf = bkbyiliv(tzuycbgb)
    if not oeyzudnf is Dictionary:
        xeogjddr.emit("Response error (Code: " + str(heowakjr) + ")")
        return
    
    if heowakjr == 201:
        var vfufghpo = oeyzudnf.get("content", "")
        var mqqwosee = int(oeyzudnf.get("conversationId", -1))
        putvmsfj.emit(vfufghpo, mqqwosee)
    else:
        xeogjddr.emit(oeyzudnf.get("error", "Response code: " + str(heowakjr)))

                                                                    
func zzdnasdg(aavzieiy, anffxeey, vhlwrfhg, cazpptaf):
    if aavzieiy != HTTPRequest.RESULT_SUCCESS:
        yvjilidk.emit("Network error (Code: " + str(aavzieiy) + ")")
        return
        
    var dscubfrx = bkbyiliv(cazpptaf)
    
    if anffxeey == 200:
        glqvlbel.emit(dscubfrx)
    else:
        if dscubfrx is Dictionary:
            yvjilidk.emit(dscubfrx.get("error", "Response code: " + str(anffxeey)))
        else:
            yvjilidk.emit("Response error (Code: " + str(anffxeey) + ")")

                                                                
func xrbprdwf(ydebcuaj, vkutuofn, qotqyjql, heyhfaxs):
    if ydebcuaj != HTTPRequest.RESULT_SUCCESS:
                                                              
        printerr("[GameDev Assistant] Get conversation network error (Code: " + str(ydebcuaj) + ")")
        return
        
    var xgbdmtiz = bkbyiliv(heyhfaxs)
    if not xgbdmtiz is Dictionary:
        printerr("[GameDev Assistant] Get conversation response error (Code: " + str(vkutuofn) + ")")
        return
        
    rtypqwfe.emit(xgbdmtiz)

                                                                                         
func xaejsrjn(olnkhwti, uzrqloai, zxbmnbkf, ojhfcggt):
    if olnkhwti != HTTPRequest.RESULT_SUCCESS:
                                                                          
        printerr("[GameDev Assistant] Delete conversation network error (Code: " + str(olnkhwti) + ")")
        return
        
    if uzrqloai == 204:
        kfatwmtm.emit()
    else:
        var yieslrai = bkbyiliv(ojhfcggt)
        var tleognuz = "[GameDev Assistant] Response code: " + str(uzrqloai)
        if yieslrai is Dictionary:
            tleognuz = yieslrai.get("error", tleognuz)
        nzvhtrya.emit(tleognuz)

                                                                                                       
func cndvqdbs(fpxmnlgm, kdwuhycg, wesshodj, tpdbhqqo):
    if fpxmnlgm != HTTPRequest.RESULT_SUCCESS:
                                                                      
        printerr("[GameDev Assistant] Toggle favorite network error (Code: " + str(fpxmnlgm) + ")")
        return
        
    if kdwuhycg == 200:
        eniataow.emit()
    else:
        var tpvliuhs = bkbyiliv(tpdbhqqo)
        var ccqtpbyl = "[GameDev Assistant] Response code: " + str(kdwuhycg)
        if tpvliuhs is Dictionary:
            ccqtpbyl = tpvliuhs.get("error", ccqtpbyl)
        bsawcvxy.emit(ccqtpbyl)

func bkbyiliv (zeedypuf):
    var vpepbymh = JSON.new()
    var ophoadts = vpepbymh.parse(zeedypuf.get_string_from_utf8())
    if ophoadts != OK:
        return null
    return vpepbymh.get_data()

func cptenyne(zrchzmuq: Dictionary) -> void:
    while buavrzoz:
        hxksqxar.poll()
        
        match hxksqxar.get_status():
            HTTPClient.STATUS_CONNECTION_ERROR:
                dgxhysku.emit("Connection error")
                rcftyuex()
                return
            HTTPClient.STATUS_DISCONNECTED:
                dgxhysku.emit("Disconnected")
                rcftyuex()
                return
            
            HTTPClient.STATUS_CONNECTED:
                xvhsqnwv(zrchzmuq)
                
            HTTPClient.STATUS_BODY:
                uuhuonbo()
        
        await get_tree().process_frame

func xvhsqnwv(hbtjfjzv: Dictionary) -> void:
    var jzrvuezc = JSON.new()
    var xfnbnpgp = jzrvuezc.stringify(hbtjfjzv)
    var dotqimnr = PackedStringArray([
        "Content-Type: application/json",
        "Authorization: Bearer " + nyivktjz
    ])
    
    var oxuwzfgz = hxksqxar.request(
        HTTPClient.METHOD_POST,
        rcklpvkn.replace(vruvvzem, ""),                                        
        dotqimnr,
        xfnbnpgp
    )
    
    if oxuwzfgz != OK:
        dgxhysku.emit("Failed to send request: " + str(oxuwzfgz))
        buavrzoz = false

func uuhuonbo() -> void:
    while hxksqxar.get_status() == HTTPClient.STATUS_BODY:
        var vnwucwwq = hxksqxar.read_response_body_chunk()
        if vnwucwwq.size() == 0:
            break
            
        mafqpisp += vnwucwwq.get_string_from_utf8()
        
        ipkqvjsc()

func ipkqvjsc() -> void:
    
    var vgaipbwj
    var mrzxdpcq
    var ifyfeite
    
    if hxksqxar.get_response_code() != 200:
        buavrzoz = false
        
        vgaipbwj = JSON.new()
        mrzxdpcq = vgaipbwj.parse(mafqpisp)
        
        if mrzxdpcq == OK:
            ifyfeite = vgaipbwj.get_data()
            if ifyfeite.has("error"):                
                dgxhysku.emit(ifyfeite["error"])
            elif ifyfeite.has("message"):                
                dgxhysku.emit(ifyfeite["message"])
            else:
                dgxhysku.emit("Unknown server error, please try again later")
        else: 
            dgxhysku.emit("Unknown server error")
    
    var rggesnzu = mafqpisp.split("\n\n")
    
                                                                                 
    for i in range(rggesnzu.size() - 1):
        var szomuxek: String = rggesnzu[i]
        if szomuxek.find("data:") != -1:
            var xsxacann = szomuxek.split("\n")
            for line in xsxacann:
                if line.begins_with("data:"):
                    var nyeapdpj = line.substr(5).strip_edges()
                                                               
                    
                    vgaipbwj = JSON.new()
                    mrzxdpcq = vgaipbwj.parse(nyeapdpj)
                    
                    if mrzxdpcq == OK:
                        ifyfeite = vgaipbwj.get_data()
                        
                        if ifyfeite is Dictionary:
                            if ifyfeite.has("error"):
                                printerr("Server error: ", ifyfeite["error"])
                                dgxhysku.emit(ifyfeite["error"])
                                rcftyuex()
                                return
                            
                            if ifyfeite.has("done") and ifyfeite["done"] == true:
                                buavrzoz = false
                                                                
                                fqozkuex.emit(
                                    int(ifyfeite.get("conversationId", -1)),
                                    int(ifyfeite.get("messageId", -1))
                                )
                                rcftyuex()
                                
                            elif ifyfeite.has("beforeActions"):
                                tdwqleai.emit(
                                    int(ifyfeite.get("conversationId", -1)),
                                    int(ifyfeite.get("messageId", -1))
                                )
                                
                            elif ifyfeite.has("content"):
                                
                                if (typeof(ifyfeite.get("messageId")) != TYPE_INT and typeof(ifyfeite.get("messageId")) != TYPE_FLOAT) or (typeof(ifyfeite.get("conversationId")) != TYPE_INT and typeof(ifyfeite.get("conversationId")) != TYPE_FLOAT):
                                    print(ifyfeite.get("messageId"))
                                    print(ifyfeite.get("conversationId"))
                                    
                                    dgxhysku.emit("Invalid data coming from the server")
                                    rcftyuex()
                                    return                                   
                            
                                zeekezpg.emit(
                                    str(ifyfeite["content"]),
                                    int(ifyfeite.get("conversationId", -1)),
                                    int(ifyfeite.get("messageId", -1))
                                )
                        
                                               
    mafqpisp = rggesnzu[rggesnzu.size() - 1]
    
func rcftyuex():  
    buavrzoz = false  
    hxksqxar.close()            

                                                                  
func fujscdyo(yyclqrlq: bool = false):
    var ikcllxyq = EditorInterface.get_editor_settings()       
    var zazzhvzv = ikcllxyq.get_setting("gamedev_assistant/version_identifier")
    
    var edkrpjio = {
        "releaseUniqueIdentifier": zazzhvzv,
        "isInit": yyclqrlq
    }
    var zgvdvdgk = JSON.new()
    var jgxpkyif = zgvdvdgk.stringify(edkrpjio)
    var djznikva = guzwzqae.request(bgxkogit, izfajpxz(), HTTPClient.METHOD_POST, jgxpkyif)

                                            
func bchuiyta(qiwtvayy, wbrlmdxy, rabbgbzb, qzbkoyvu):
    if qiwtvayy != HTTPRequest.RESULT_SUCCESS:
        jvmfmbnf.emit("[GameDev Assistant] Network error when checking for updates (Code: " + str(qiwtvayy) + ")")
        return
        
    var dqzbhire = bkbyiliv(qzbkoyvu)
    if not dqzbhire is Dictionary:
        jvmfmbnf.emit("[GameDev Assistant] Response error when checking for updates (Code: " + str(wbrlmdxy) + ")")
        return
    
    if wbrlmdxy == 200:
        var zygnynph = dqzbhire.get("updateAvailable", false)
        var tiirjudg = dqzbhire.get("latestVersion", "")
        
        qpkthrlg.emit(zygnynph, tiirjudg)
    else:
        jvmfmbnf.emit(dqzbhire.get("error", "Response code: " + str(wbrlmdxy)))

func xeeehlke(yqjdgjof: int, ywabwxyx: bool, vkoyrxwz: String):
    var ujfxzcot = {
        "messageId": yqjdgjof,
        "success": ywabwxyx,
        "action_type": vkoyrxwz
    }
    yenbknsp.append(ujfxzcot)
    shptirtm()

                             
func shptirtm():
    var client_status = eygtqkaa.get_http_client_status()
                                                                                      
    if (client_status == HTTPClient.STATUS_DISCONNECTED or 
        client_status == HTTPClient.STATUS_CANT_RESOLVE or 
        client_status == HTTPClient.STATUS_CANT_CONNECT or 
        client_status == HTTPClient.STATUS_CONNECTION_ERROR or 
        client_status == HTTPClient.STATUS_TLS_HANDSHAKE_ERROR) and yenbknsp.size() > 0:
        
        var nifgbaxj = yenbknsp.pop_front()
        var wrynrikd = JSON.new()
        var piymnchn = wrynrikd.stringify(nifgbaxj)
        var fclfbgiy = izfajpxz()
        var xznzuxob = eygtqkaa.request(ecobdoap, fclfbgiy, HTTPClient.METHOD_POST, piymnchn)
        if xznzuxob != OK:
            printerr("Failed to start track action request:", xznzuxob)
            shptirtm()                                  

func ryukjgvz(htftiszo, gkdbivep, stgkmezw, ygydxkda):
    shptirtm()                                      
    if htftiszo != HTTPRequest.RESULT_SUCCESS:
        printerr("[GameDev Assistant] Track action failed:", htftiszo)
        return
        
    var woxjwoox = bkbyiliv(ygydxkda)
    if not woxjwoox is Dictionary:
        printerr("[GameDev Assistant] Invalid track action response")

func yohgoxtk(ejupwhut: int, lfmtoqnj: int) -> void:
    var uprwlgqx = {
        "messageId": ejupwhut,
        "rating": lfmtoqnj
    }
    var fkcebiht = JSON.new()
    var exmajkrr = fkcebiht.stringify(uprwlgqx)
    var pxmdwlpr = izfajpxz()
    var yzobgrni = imhixyef.request(lcfbbzvf, pxmdwlpr, HTTPClient.METHOD_POST, exmajkrr)
    if yzobgrni != OK:
        printerr("[GameDev Assistant] Failed to track rating:", yzobgrni)

                                          
func xazgrsmq(knamsebr, btbnnjwh, szhbnhho, peyjsiqh):
    if knamsebr != HTTPRequest.RESULT_SUCCESS:
        printerr("[GameDev Assistant] Rating action failed:", knamsebr)
        return
        
    var wfkkjobv = bkbyiliv(peyjsiqh)
    if not wfkkjobv is Dictionary:
        printerr("[GameDev Assistant] Invalid rating response")
        return

func rhilegru():
    return buavrzoz

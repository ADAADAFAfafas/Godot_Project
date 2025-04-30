                                                       
@tool
extends GDAScreenBase

signal ndukqzjt

var qjfxzgaf : RichTextLabel = null

@onready var hcksgmji : TextEdit = $Footer/PromptInput
@onready var yddgfvtq : Button = $Footer/SendPromptButton
@onready var jcrvvbem : Control = $Footer
@onready var psmhxank : Control = $Body

@onready var mnilvpln = $"../APIManager"
@onready var oyzgxrsi = $"../ActionManager"

var idaiutew = preload("res://addons/gamedev_assistant/dock/scenes/chat/Chat_UserPrompt.tscn")
var wrljtbvb = preload("res://addons/gamedev_assistant/dock/scenes/chat/Chat_ServerResponse.tscn")
var mofwaeuk = preload("res://addons/gamedev_assistant/dock/scenes/chat/Chat_ErrorMessage.tscn")
const pnhkkoqi = preload("res://addons/gamedev_assistant/scripts/chat/markdown_to_bbcode.gd")
var gjjvsshu = preload("res://addons/gamedev_assistant/scripts/chat/message_tagger.gd").new()
var bdztoejw = preload("res://addons/gamedev_assistant/dock/scenes/chat/Chat_CodeBlockResponse.tscn")
var omstcrmi = preload("res://addons/gamedev_assistant/dock/scenes/chat/Chat_CodeBlockUser.tscn")
var tkkfqjbn = preload("res://addons/gamedev_assistant/dock/scenes/chat/Chat_Spacing.tscn")

var fsvlqjdl := false
var xtkisazf: String = ""

var llyjgqqj : String = ""
var dsxpobbx : String = ""
var jrvnflxp : int = -1

@onready var mzyxvtug = $Body/MessagesContainer
@onready var yanwzava = $Body/MessagesContainer/ThinkingLabel
@onready var chlphngd = $Bottom/AddContext
@onready var bpbuupho : CheckButton = $Bottom/ReasoningToggle
@onready var qfyzjdsj = $Body/MessagesContainer/RatingContainer

@onready var iflnjtfd = preload("res://addons/gamedev_assistant/dock/icons/stop.png")  
@onready var aotouewj = preload("res://addons/gamedev_assistant/dock/icons/arrowUp.png")  

var cnoxdxqk = [
    "",
    " @OpenScripts ",
    " @Output ",
    " @Docs ",
    " @GitDiff ",
]

@onready var mzfinqlu = $"../ConversationManager"

var waiting_nonthinking = "Thinking ⚡"
var waiting_thinking = "Reasoning ⌛ This could take multiple minutes"

var notice_actions_nonthinking = "Generating one-click actions ⌛ To skip, press ■"
var notice_actions_thinking = "Generating one-click actions ⌛ To skip, press ■"


func _ready ():
    mnilvpln.putvmsfj.connect(mcttzepr)
    mnilvpln.xeogjddr.connect(jefpfqiz)
    
    mzfinqlu.dzypgnos.connect(yeqcrvsl)
    hcksgmji.qcrcuejr.connect(hbeccbbv)
    
                       
    mnilvpln.zeekezpg.connect(rjpilmgf)
    mnilvpln.fqozkuex.connect(meaxvadw)
    mnilvpln.tdwqleai.connect(hxryxvhg)
    mnilvpln.dgxhysku.connect(iynuwhqd)

    chlphngd.item_selected.connect(ubricnmq)    
    yddgfvtq.pressed.connect(ayysairq)   
    
    qfyzjdsj.get_node("UpButton").pressed.connect(xpfqfifc)
    qfyzjdsj.get_node("DownButton").pressed.connect(veeinbdv)
    qfyzjdsj.visible = false 

func _on_open ():
    hcksgmji.text = ""
    yanwzava.visible = false
    qfyzjdsj.visible = false 
    nrfxzbad(false)
    ubjlxoto()
    chlphngd.selected = 0
    xtkisazf = ''
    

                                                            
func hpcuyyib ():
    fsvlqjdl = true
    nrfxzbad(true)
    jrvnflxp = -1
    qfyzjdsj.visible = false

func rjpilmgf(vinmanrx: String, lclmkgut: int, hgogxzbd: int) -> void:
    if qjfxzgaf == null:
        qjfxzgaf = wrljtbvb.instantiate()
        qjfxzgaf.bbcode_enabled = true
        mzyxvtug.add_child(qjfxzgaf)
        var rxgjiszw = tkkfqjbn.instantiate()
        mzyxvtug.add_child(rxgjiszw)
        yanwzava.visible = false
        xtkisazf = vinmanrx
        
        if hgogxzbd != -1:
            jrvnflxp = hgogxzbd
    else:
        xtkisazf += vinmanrx
        
                                                  
    qjfxzgaf.text = pnhkkoqi.qddmltuv(xtkisazf)
    
                                                                     
    if not qjfxzgaf.meta_clicked.is_connected(bvvqhzcz):  
        qjfxzgaf.meta_clicked.connect(bvvqhzcz)  
    
    if lclmkgut > 0:
        mzfinqlu.vbcevgtw(lclmkgut)

func hxryxvhg(gsspwusu: int, wbdbsrxy: int) -> void:
    if qjfxzgaf:
        qjfxzgaf.visible = false

                                                                
    kthjelth(xtkisazf, wrljtbvb, mzyxvtug, bdztoejw)
    
                              
    mzyxvtug.move_child(yanwzava, mzyxvtug.get_child_count() - 1)
    yanwzava.visible = true
    yanwzava.text = notice_actions_nonthinking

func meaxvadw(cqxhtdlg: int, lsrmtcoi: int) -> void:
                                         
    if qjfxzgaf:
        qjfxzgaf.queue_free()
        qjfxzgaf = null
        
    yanwzava.visible = false
    
                                                    
    mzyxvtug.move_child(qfyzjdsj, mzyxvtug.get_child_count() - 1)
    qfyzjdsj.visible = lsrmtcoi > 0
    
                          
    var lqfcfxgl = oyzgxrsi.velmuuls(xtkisazf, lsrmtcoi)
    oyzgxrsi.ejypvmzo(lqfcfxgl, mzyxvtug)

    xtkisazf = ""
    nrfxzbad(true)
    yanwzava.visible = false
    yddgfvtq.icon = aotouewj

func iynuwhqd(yuazionx: String):
    ypmffepi(yuazionx)
    nrfxzbad(true)
    yanwzava.visible = false
    qjfxzgaf = null
    yddgfvtq.icon = aotouewj

func ayysairq():  
    if mnilvpln.rhilegru():  
                                         
        mnilvpln.yzjcneoy.emit()  
        
                                             
        if qjfxzgaf:
            qjfxzgaf.queue_free()
            qjfxzgaf = null
        
        nrfxzbad(true)  
        yddgfvtq.icon = aotouewj  
        
        if not yanwzava.visible:
                                                                        
            kthjelth(xtkisazf, wrljtbvb, mzyxvtug, bdztoejw)
        
        yanwzava.visible = false  
        
                                                   
        mzyxvtug.move_child(qfyzjdsj, mzyxvtug.get_child_count() - 1)
        qfyzjdsj.visible = jrvnflxp > 0

    else:  
                                             
        whidaxyw()  

func whidaxyw():
                                                        
    oyzgxrsi.qvjtbmpw()
    
    qfyzjdsj.visible = false
    
    jrvnflxp = -1
    
    if len(hcksgmji.text) < 1:
        return
    
    var kplxshlo = hcksgmji.text

                                                        
    if taogicvz() or fsvlqjdl:
        kplxshlo += dsxpobbx
        llyjgqqj = dsxpobbx
    
    fsvlqjdl = false

    if Engine.is_editor_hint():
        var ubccznlo = Engine.get_singleton("EditorInterface")
        kplxshlo = gjjvsshu.qpccacki(kplxshlo, ubccznlo)
    
    var ksmwhnex = bpbuupho.button_pressed
    
    mnilvpln.viqagaii(kplxshlo, ksmwhnex)
    bhpjffgl(hcksgmji.text)                               
    nrfxzbad(false)
    hcksgmji.text = ""
    
    if ksmwhnex:
        yanwzava.text = waiting_thinking
    else:
        yanwzava.text = waiting_nonthinking
        
    yanwzava.visible = true
    mzyxvtug.move_child(yanwzava, mzyxvtug.get_child_count() - 1)
    
                                               
    ndukqzjt.emit()
    
func nrfxzbad (ozehzwps : bool):
    if ozehzwps:  
        yddgfvtq.icon = aotouewj  
    else:  
        yddgfvtq.icon = iflnjtfd  

func mcttzepr (kpcsytjy : String, mimfwmin : int):
    wquktmlr(kpcsytjy)
    nrfxzbad(true)
    yanwzava.visible = false

func jefpfqiz (wkknmuue : String):
    ypmffepi(wkknmuue)
    nrfxzbad(true)
    yanwzava.visible = false

func bhpjffgl(lazjntze: String):
                                                                               
    kthjelth(lazjntze, idaiutew, mzyxvtug, omstcrmi)
    
    var jfzvuelh = tkkfqjbn.instantiate()
    mzyxvtug.add_child(jfzvuelh)


func wquktmlr(tzxdkfpd: String):
                                                                                
    kthjelth(tzxdkfpd, wrljtbvb, mzyxvtug, bdztoejw)
    
    var plaxgcyj = tkkfqjbn.instantiate()
    mzyxvtug.add_child(plaxgcyj)

func ypmffepi (vupfsltc : String):
    var zyexnkvm = mofwaeuk.instantiate()
    mzyxvtug.add_child(zyexnkvm)
    zyexnkvm.text = vupfsltc

func ubjlxoto ():
    for node in mzyxvtug.get_children():
        if node == yanwzava or node == qfyzjdsj:
            continue
        node.queue_free()
    mzyxvtug.custom_minimum_size = Vector2.ZERO
    
    ndukqzjt.emit()

func yeqcrvsl ():
    var btphuisq = mzfinqlu.jnkhftsk()
    ubjlxoto()
    
    for msg in btphuisq.messages:
        if msg.role == "user":
            bhpjffgl(msg.content)
        elif msg.role == "assistant":
            wquktmlr(msg.content)
    
    nrfxzbad(true)

func ubricnmq(jiebgngx: int):
    if jiebgngx >= 0 and jiebgngx < cnoxdxqk.size():
        hcksgmji.text += " " + cnoxdxqk[jiebgngx]
        chlphngd.select(0)

func bvvqhzcz(caasatla):
    OS.shell_open(str(caasatla))

                                                
func biwsiien(duinnkod: String) -> String:
    
    var pxolxmav = RegEx.new()
                                 
    pxolxmav.compile("\\[gds_context\\](.|\\n)*?\\[/gds_context\\]")
    duinnkod = pxolxmav.sub(duinnkod, "", true)
    
                                       
    pxolxmav.compile("<internal_tool_use>(.|\\n)*?</internal_tool_use>")
    return pxolxmav.sub(duinnkod, "", true)
    
                                                
func iwksejay(erydjumt: String) -> String:
        
    var gadgdaup = RegEx.new()
    gadgdaup.compile("\\[gds_actions\\](.|\\n)*?\\[/gds_actions\\]")
    return gadgdaup.sub(erydjumt, "", true)

func qkeodbea(tcpeelta: String):
    tcpeelta = tcpeelta.replace(notice_actions_nonthinking, '').replace(notice_actions_thinking, '').strip_edges()
    return tcpeelta
    
func kthjelth(owxsemne: String, mwqduqrb: PackedScene, euwwbjxw: Node, kxrwbaya: PackedScene) -> void:
    
    owxsemne = owxsemne.strip_edges()
    owxsemne = biwsiien(owxsemne)
    
                       
    var dzsmamhv = pnhkkoqi.uoazrmmd(owxsemne)

    for block in dzsmamhv:
        if block["type"] == "text":
            var rsrnpfsz = mwqduqrb.instantiate()
            rsrnpfsz.bbcode_enabled = true
            euwwbjxw.add_child(rsrnpfsz)
            
            var rhivrrrj = block["content"]
            
                                                      
            rhivrrrj = pnhkkoqi.fyoanpkz(rhivrrrj)
            rhivrrrj = pnhkkoqi.pkkqukmo(rhivrrrj)
            rhivrrrj = rhivrrrj.strip_edges()
            
            rsrnpfsz.text = rhivrrrj

                                 
            if not rsrnpfsz.meta_clicked.is_connected(bvvqhzcz):
                rsrnpfsz.meta_clicked.connect(bvvqhzcz)

        elif block["type"] == "code":
            var ojnvpeol = kxrwbaya.instantiate()
            euwwbjxw.add_child(ojnvpeol)
            ojnvpeol.text = block["content"]

                           
func taogicvz() -> bool:
                                                           
    var mssorugi = Engine.get_singleton("EditorInterface") if Engine.is_editor_hint() else null
    var ojrolmhm = gjjvsshu.tekseuek("", mssorugi)
    var dwagytzr = gjjvsshu.gouvspzv("", mssorugi)
        
                                            
    dsxpobbx = "[gds_context]Current project context:[/gds_context]\n" + ojrolmhm + "\n" + dwagytzr
    
                                        
    return dsxpobbx != llyjgqqj

                               
func hbeccbbv() -> void:
    var ugxbspbg = not mnilvpln.rhilegru()
    if ugxbspbg:
        whidaxyw()
        
func xpfqfifc():
    if jrvnflxp > 0:
        mnilvpln.yohgoxtk(jrvnflxp, 5)
        qfyzjdsj.visible = false                     

func veeinbdv():
    if jrvnflxp > 0:
        mnilvpln.yohgoxtk(jrvnflxp, 1)
        qfyzjdsj.visible = false

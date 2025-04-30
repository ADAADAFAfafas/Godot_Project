                                         
@tool
extends Control

@onready var gzgdimvu = $Screen_Conversations
@onready var gsjjiptk = $Screen_Chat
@onready var stohuoqg = $Screen_Settings

@onready var ikfjnnag = $Header/HBoxContainer/ConversationsButton
@onready var iuemyvco = $Header/ChatButton
@onready var qxgqzdsb = $Header/HBoxContainer/SettingsButton
@onready var tfzjejeh = $Header/ScreenText

@onready var doaszqsq = $ConversationManager
@onready var scfhrwaj = $APIManager

                                          
var aqnltchs : bool = false

                                                    
var csnyazwe : bool = false

func _ready():
    mnffrgtc(false)
    
                                       
    scfhrwaj.qpkthrlg.connect(aijqeape)
    scfhrwaj.jvmfmbnf.connect(aijqeape)
    
                                   
    iuemyvco.pressed.connect(kiotrtck)
    qxgqzdsb.pressed.connect(owtfukvw)
    ikfjnnag.pressed.connect(oluohhgn)
    
    var ljlklrcn = EditorInterface.get_editor_settings()
    
                                        
    var mtkifvus = ljlklrcn.has_setting("gamedev_assistant/development_mode") and ljlklrcn.get_setting('gamedev_assistant/development_mode') == true    
    if mtkifvus:
        mmvwrxlc()
    
    if ljlklrcn.has_setting("gamedev_assistant/validated"):
        if ljlklrcn.get_setting("gamedev_assistant/validated") == true:
            kiotrtck()
            mnffrgtc(true)
                        
                                                             
            scfhrwaj.fujscdyo(true)
            return
                                          
    elif !ljlklrcn.has_setting("gamedev_assistant/onboarding_shown"):
        mmvwrxlc()
        ljlklrcn.set_setting("gamedev_assistant/onboarding_shown", true)
        
    ertlkggm(stohuoqg, "Settings")

func ertlkggm (imxynvae, gzlpfckl):
    gzgdimvu.visible = false
    gsjjiptk.visible = false
    stohuoqg.visible = false
    
    imxynvae.visible = true
    imxynvae._on_open()
    
    tfzjejeh.text = gzlpfckl
    
    csnyazwe = imxynvae == gsjjiptk
    
                       
    scfhrwaj.yzjcneoy.emit()
    
                                                                
                                                           
                                       

func oluohhgn():
    ertlkggm(gzgdimvu, "Conversations")

func kiotrtck():
    doaszqsq.imsfvmxg()
    ertlkggm(gsjjiptk, "New Chat")
    gsjjiptk.hpcuyyib()
    scfhrwaj.yzjcneoy.emit()

func owtfukvw():
    if stohuoqg.visible:
        return
    
    ertlkggm(stohuoqg, "Settings")

func kkwoukdj (lbizeker : Conversation):
    doaszqsq.nkdtepnr(lbizeker.id)
    ertlkggm(gsjjiptk, "Chat")

func mnffrgtc (rfausjxr : bool):
    aqnltchs = rfausjxr
    iuemyvco.disabled = !rfausjxr
    ikfjnnag.disabled = !rfausjxr
    
                                                               
func aijqeape(tyorjgvs, param2 = ""):
                                                                                       
                                                            
    
    var ojcyeldc = AcceptDialog.new()
    ojcyeldc.get_ok_button().text = "Close"
    
                                                                                 
    if tyorjgvs is bool:
                                                             
        var ekkubplx = tyorjgvs
        var rhwlzpoy = param2
        
                                                   
        if ekkubplx:
            ojcyeldc.title = "GameDev Assistant Update"
            ojcyeldc.dialog_text = "An update is available! Latest version: " + rhwlzpoy + ". Go to https://app.gamedevassistant.com to download it."
            add_child(ojcyeldc)
            ojcyeldc.popup_centered()
    else:
                                                           
        var tsopfpmk = tyorjgvs
        ojcyeldc.title = "GameDev Assistant Update"
        ojcyeldc.dialog_text = tsopfpmk
        add_child(ojcyeldc)
        ojcyeldc.popup_centered()

func mmvwrxlc():
    var qeqcqaxp = AcceptDialog.new()
    qeqcqaxp.title = "Welcome Aboard! 🚀"
    qeqcqaxp.dialog_text = "Welcome to GameDev Assistant by Zenva!\n\n🌟 To get started:\n1. Find the Assistant tab (next to Inspector, Node, etc, use arrows < > to find it)\n2. Enter your token in Settings\n3. Start a chat with the + button\n\n\nHappy gamedev! 🎮"
    qeqcqaxp.ok_button_text = "Close"
    qeqcqaxp.dialog_hide_on_ok = true
    add_child(qeqcqaxp)
    qeqcqaxp.popup_centered()

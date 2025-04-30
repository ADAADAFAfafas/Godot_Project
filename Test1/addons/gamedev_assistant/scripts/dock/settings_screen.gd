                                  
@tool
extends GDAScreenBase

var udkavhjg : Label
var zwparyfr : LineEdit
var xffgplfc : CheckButton
var emevqszt : Button
var ncvrukiv : RichTextLabel
var pwfqbojc : RichTextLabel
var ygywcfwy : RichTextLabel
var ugftoecc : Button
var xflcktyf : LineEdit
var zdyuowwg : Button
var mtcxiirv : Button
var uegszfuh : String

const mrybwthf : String = "gamedev_assistant/hide_token"
const suhsxfse : String = "gamedev_assistant/validated"

@onready var fqnikepn = $".."
@onready var uylmmgon = $"../APIManager"

var udgddgey : bool

func _ready ():
    uylmmgon.cfevtapb.connect(_on_validate_token_received)
    uylmmgon.qpkthrlg.connect(_on_check_updates_received)
    uylmmgon.jvmfmbnf.connect(acrxlvlc)
    
    rwdtvkds()
    
                                             
    xffgplfc.toggled.connect(fjuevioq)
    emevqszt.pressed.connect(swdbizgw)
    zdyuowwg.pressed.connect(hpjvvtxq)
    mtcxiirv.pressed.connect(zyiecbak)
    zwparyfr.text_changed.connect(oimwzsci)
    
    
    ncvrukiv.visible = false
    pwfqbojc.visible = false
    ygywcfwy.visible = false
    
    var tbiipplt = EditorInterface.get_editor_settings()       
    
    tbiipplt.set_setting("gamedev_assistant/version_identifier", "7M4D0P3J8y")
    
    udgddgey = tbiipplt.has_setting("gamedev_assistant/development_mode") and tbiipplt.get_setting('gamedev_assistant/development_mode') == true    
    if not udgddgey:
        tbiipplt.set_setting("gamedev_assistant/endpoint", "https://app.gamedevassistant.com")
        uegszfuh = "gamedev_assistant/token"
    else:
        tbiipplt.set_setting("gamedev_assistant/endpoint", "http://localhost:3000")
        uegszfuh = "gamedev_assistant/token_dev"
        print("Development mode")
        
    uylmmgon.swbofbcr()
    
                                                                         
                                                  
func rwdtvkds ():
    udkavhjg = $VBoxContainer/EnterTokenPrompt
    zwparyfr = $VBoxContainer/Token_Input
    xffgplfc = $VBoxContainer/HideToken
    emevqszt = $VBoxContainer/ValidateButton
    ncvrukiv = $VBoxContainer/TokenValidationSuccess
    pwfqbojc = $VBoxContainer/TokenValidationError
    ygywcfwy = $VBoxContainer/TokenValidationProgress
    zdyuowwg = $VBoxContainer/AccountButton
    mtcxiirv = $VBoxContainer/UpdatesButton

func fjuevioq (xacipqoo):
    zwparyfr.secret = xacipqoo
    
    var trjmtuer = EditorInterface.get_editor_settings()
    trjmtuer.set_setting(mrybwthf, xffgplfc.button_pressed)

func oimwzsci (fxjpsmzk):
    if len(zwparyfr.text) == 0:
        udkavhjg.visible = true
    else:
        udkavhjg.visible = false
    
    fqnikepn.mnffrgtc(false)
    
    ncvrukiv.visible = false
    pwfqbojc.visible = false
    ygywcfwy.visible = false
    
    var jutdnptn = EditorInterface.get_editor_settings()
    jutdnptn.set_setting(uegszfuh, zwparyfr.text)

func swdbizgw ():
    emevqszt.disabled = true
    ncvrukiv.visible = false
    pwfqbojc.visible = false
    ygywcfwy.visible = true
    uylmmgon.imsdkhdu()

                                                        
func _on_validate_token_received (ixnunuvq : bool, picifmgj : String):
    ygywcfwy.visible = false
    emevqszt.disabled = false
    
    if ixnunuvq:
        ncvrukiv.visible = true
        ncvrukiv.text = "Token has been validated!"
        
        var igklgwwp = EditorInterface.get_editor_settings()
        igklgwwp.set_setting(suhsxfse, true)
        
        fqnikepn.mnffrgtc(true)
    else:
        pwfqbojc.visible = true
        pwfqbojc.text = picifmgj

                                                  
                                                  
func _on_open ():
    rwdtvkds()
    var qavgfqoa = EditorInterface.get_editor_settings()
    
    if qavgfqoa.has_setting(uegszfuh):
        zwparyfr.text = qavgfqoa.get_setting(uegszfuh)
    
    if qavgfqoa.has_setting(mrybwthf):
        xffgplfc.button_pressed = qavgfqoa.get_setting(mrybwthf)
    
    zwparyfr.secret = xffgplfc.button_pressed
    
    if len(zwparyfr.text) == 0:
        udkavhjg.visible = true
    else:
        udkavhjg.visible = false

func hpjvvtxq():
    OS.shell_open("https://app.gamedevassistant.com/profile")
    
func zyiecbak():
    ncvrukiv.visible = false
    pwfqbojc.visible = false
    ygywcfwy.visible = true
    
    uylmmgon.fujscdyo()

func _on_check_updates_received(gvrpbqeb: bool, vfcwetki: String):
    ygywcfwy.visible = false
    
    if gvrpbqeb:
        ncvrukiv.visible = true
        ncvrukiv.text = "An update is available! Latest version: " + vfcwetki + ". Click 'Manage Account' to download it."
    else:
        ncvrukiv.visible = true
        ncvrukiv.text = "You are already in the latest version"

func acrxlvlc(okjhpmru: String):
    ygywcfwy.visible = false
    pwfqbojc.visible = true
    pwfqbojc.text = okjhpmru

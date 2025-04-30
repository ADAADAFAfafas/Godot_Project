                                                        
@tool                                                                                         
extends TextEdit                                                                              
                                                                                                
signal qcrcuejr    

const gsnjnixt = 50000                                                                    
                                                                                                
var zoblztrb : bool = false                                                              
var swjrbjxd : Control                                                                          
                         
                                                                                    
func _ready():                                                                                
                                                                                              
    swjrbjxd = get_parent()       
    
                       
    tooltip_text = "Type your message here (Enter to send, Shift+Enter for new line)\nTo include scripts you need to either paste the code here, use @OpenScripts,\n or select the code in the editor + right click for contextual menu \"Add to Chat\"\nThe file tree and open scene nodes are automatically included"
                                                                                                
                                                                                              
    connect("focus_entered", Callable(self, "gdyhtfbm"))                
    connect("text_changed", Callable(self, "ofdepeid")) 
    connect("focus_exited", Callable(self, "hcfxgclt"))            
    
    var lmqzkmwt = get_parent().get_parent()                                                    
    if lmqzkmwt.has_signal("ndukqzjt"):  
        lmqzkmwt.connect("ndukqzjt", Callable(self, "zzmoiyqd"))  
                
                                                                                                
func _input(kceurdhx):
    if has_focus():
        if kceurdhx is InputEventKey and kceurdhx.is_pressed():
            if kceurdhx.keycode == KEY_ENTER:
                if kceurdhx.shift_pressed:
                    insert_text_at_caret("\n")
                                                                
                    svrbfzlt(1)
                    get_viewport().set_input_as_handled()
                else:                                                                         
                                                                             
                    var isicystw = get_parent().get_node("SendPromptButton")  
                    if isicystw and isicystw.disabled == false:  
                        qcrcuejr.emit()                                                       
                        get_viewport().set_input_as_handled()
                        zzmoiyqd()    

func svrbfzlt(gfnvrwdu: int = 0):
    var sbpncyol = get_theme_font("font")
    var kibdzjvb = get_theme_font_size("font_size")
    var keykmygp = sbpncyol.get_char_size('W'.unicode_at(0), kibdzjvb).x * 0.6
    var sluduyvn = int(size.x / keykmygp)
    var ajfkyhul = sbpncyol.get_height(kibdzjvb) + 10
    var dlesatmq = ajfkyhul * 10        
    var tlfzorzp = ajfkyhul*2
    var aezrsavy = -tlfzorzp*2
    
    var janecnbv = 0
    for i in get_line_count():
        var vdipmuov = get_line(i)
        var akqodvny = vdipmuov.length()
        var hdbyfbax = ceili(float(akqodvny) / float(sluduyvn))
        janecnbv += max(hdbyfbax, 1)                         
        
                                             
    janecnbv += gfnvrwdu
    
    var lyrzfqzc = janecnbv * ajfkyhul + tlfzorzp
    lyrzfqzc = clamp(lyrzfqzc, tlfzorzp, dlesatmq)
    swjrbjxd.offset_top = -lyrzfqzc


func ovywkfcl():
    svrbfzlt()                                                                        
                                                                                                
func gdyhtfbm():                                                        
    ovywkfcl()                                                                     
                                                                                                
func ofdepeid():                                                         
    ovywkfcl()
    
                                                                                     
    if text.length() > gsnjnixt:                                               
        text = text.substr(0, gsnjnixt)                                        
        set_caret_column(gsnjnixt)                                                                                                        
                                                                                                
func zzmoiyqd():                                                                    
    ovywkfcl()

func hcfxgclt(): 
    if text.length() == 0:                                                        
        zzmoiyqd()

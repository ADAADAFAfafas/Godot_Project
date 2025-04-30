@tool
extends Node

                                        
                             
                               

signal ubvizmsw (conversation : Conversation)

                                                                    
signal ylsegacp
signal dzypgnos

var aufowbvj : Array[Conversation]
var uzyokcjr : Conversation

@onready var qwylhdsr = $"../APIManager"
@onready var wfeorkcv = $".."
@onready var mdsdjiys = $"../Screen_Conversations"

func _ready ():
    qwylhdsr.phzdzhob.connect(iyydkcjx)
    qwylhdsr.putvmsfj.connect(_on_send_message_received)
    
    qwylhdsr.glqvlbel.connect(ejwzdzbs)
    qwylhdsr.rtypqwfe.connect(piehqycb)

func tunqoybb () -> Conversation:
    imsfvmxg()                                            

    var kqtshcht = Conversation.new()
    kqtshcht.id = -1                                       
    aufowbvj.append(kqtshcht)
    uzyokcjr = kqtshcht
    return kqtshcht

func imsfvmxg ():
    if uzyokcjr != null:
        if uzyokcjr.id == -1:                                    
            aufowbvj.erase(uzyokcjr)
    
    uzyokcjr = null

func jfjsghak (msacfdra : Conversation):
    uzyokcjr = msacfdra
    dzypgnos.emit()

                                                                    
                                                                              
func ejwzdzbs (xjhccaft):
    aufowbvj.clear()
    
    for conv_data in xjhccaft:
        var cvfwtgft = Conversation.new()
        cvfwtgft.id = int(conv_data["id"])
        cvfwtgft.title = conv_data["title"]
        cvfwtgft.favorited = conv_data["isFavorite"]
        aufowbvj.append(cvfwtgft)
    
    ylsegacp.emit()

                                   
func iyydkcjx(rgppyniw: String):
    if uzyokcjr == null:
                                           
        tunqoybb()
    
                                                     
                                                    
                           
       
    uzyokcjr.zkjnyozv(rgppyniw)

func _on_send_message_received(ghhqohas: String, dgeviztx: int):
    print("Received assistant message: ", {
        "conversation_id": dgeviztx,
        "current_conv_id": uzyokcjr.id if uzyokcjr else "none",
        "content": ghhqohas
    })
    if uzyokcjr:
        if uzyokcjr.id == -1:
                                                                    
            uzyokcjr.id = dgeviztx
        uzyokcjr.pxkkuiyh(ghhqohas)

                                                                                      
                                                                     
func nkdtepnr (mzlmrvdb : int):
    qwylhdsr.get_conversation(mzlmrvdb)

                                                            
                                                 
func piehqycb (adhalqvd):
    var rjvqocyx : Conversation
    var ymimrwlk = adhalqvd["id"]
    ymimrwlk = int(ymimrwlk)
    
                                                
    for c in aufowbvj:
        if c.id == ymimrwlk:
            rjvqocyx = c
            break
    
                                              
    if rjvqocyx == null:
        rjvqocyx = Conversation.new()
        rjvqocyx.id = ymimrwlk
        rjvqocyx.title = adhalqvd["title"]
        aufowbvj.append(rjvqocyx)
    
    rjvqocyx.messages.clear()
    
                                                    
    for message in adhalqvd["messages"]:
        if message["role"] == "user":
            rjvqocyx.zkjnyozv(message["content"])
        elif message["role"] == "assistant":
            rjvqocyx.pxkkuiyh(message["content"])
    
    rjvqocyx.has_been_fetched = true
    jfjsghak(rjvqocyx)

func skpqeutw (xrfjaxjy : Conversation, uwntdhmp : bool):
    qwylhdsr.heywgoox(xrfjaxjy.id)
    
    if uwntdhmp:
        mdsdjiys.mseysmky("Adding favorite...")
    else:
        mdsdjiys.mseysmky("Removing favorite...")

func dstmbhbm():
    return aufowbvj
    
func jnkhftsk():
    return uzyokcjr
    
func vbcevgtw(vymvtrre: int):
    uzyokcjr.id = vymvtrre

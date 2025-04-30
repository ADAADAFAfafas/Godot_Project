@tool
extends GDAScreenBase

@onready var cwcveaxm : ConfirmationDialog = $DeleteConfirmation
@onready var hmetjwho = $ScrollContainer/VBoxContainer
@onready var ttpwpqhx = $"../ConversationManager"

@onready var vgpcfctv = $ScrollContainer/VBoxContainer/ErrorMessage
@onready var uqymtkqa = $ScrollContainer/VBoxContainer/ProcessMessage
@onready var dtpmrrtk = $ScrollContainer/VBoxContainer/AllConversationsHeader
@onready var mxygtwxk = $ScrollContainer/VBoxContainer/FavouritesHeader

var comxyhhe = preload("res://addons/gamedev_assistant/dock/scenes/ConversationSlot.tscn")

var bmdxvaqu
@onready var giilmzrj = $".."

@onready var cdpderss = $"../APIManager"

var qwqzxbgr : bool = false

func _ready ():
    ttpwpqhx.ylsegacp.connect(iwftvcum)
    cdpderss.yvjilidk.connect(uwthkxxi)
    cdpderss.kfatwmtm.connect(_on_delete_conversation_received)
    cdpderss.nzvhtrya.connect(uwthkxxi)
    cdpderss.bsawcvxy.connect(uwthkxxi)
    cdpderss.eniataow.connect(_on_toggle_favorite_received)
    cwcveaxm.confirmed.connect(rrpmekmk)
    
func _on_open ():
    vxoidutx()
    cdpderss.wzljkdxx()
    
                               
    
                                      
                                         
                                     

func vxoidutx ():
    for node in hmetjwho.get_children():
        if node is RichTextLabel:
            continue
        
        node.queue_free()
    
    vgpcfctv.visible = false
    uqymtkqa.visible = false

func iwftvcum ():
    vxoidutx()
    
    var cntixzhk = ttpwpqhx.dstmbhbm()
    
    var mslbjsox : Array[Conversation] = []
    var wvhkzhfy : Array[Conversation] = []
    
    for conv in cntixzhk:
        if conv.favorited:
            mslbjsox.append(conv)
        else:
            wvhkzhfy.append(conv)
    
    var dcmprrxq = 2
    hmetjwho.move_child(mxygtwxk, 1)
    
    for fav in mslbjsox:
        var qpvbzitr = owjwrfbm(fav, giilmzrj)
        hmetjwho.move_child(qpvbzitr, dcmprrxq)
        dcmprrxq += 1
    
    hmetjwho.move_child(dtpmrrtk, dcmprrxq)
    dcmprrxq += 1
    
    for other in wvhkzhfy:
        var qpvbzitr = owjwrfbm(other, giilmzrj)
        hmetjwho.move_child(qpvbzitr, dcmprrxq)
        dcmprrxq += 1

func owjwrfbm (pywlwfqf, mzljqtvt) -> Control:
    var ayumqmmy = comxyhhe.instantiate()
    hmetjwho.add_child(ayumqmmy)
    ayumqmmy.ihaycdhk(pywlwfqf, mzljqtvt)
    return ayumqmmy

                                            
                                        
func xlfmpsyi (bmfbmiks):
    bmdxvaqu = bmfbmiks
    cwcveaxm.popup()

                                                        
func rrpmekmk():
    if bmdxvaqu == null or bmdxvaqu.get_conversation() == null:
        return
    
    var tduhnkcu = bmdxvaqu.get_conversation()
    cdpderss.hxxtrced(tduhnkcu.id)
    
    mseysmky("Deleting conversation...")

func _on_toggle_favorite_received ():
    cdpderss.wzljkdxx()

func _on_delete_conversation_received ():
    cdpderss.wzljkdxx()

func mseysmky (sznbeaci : String):
    return
    
    hmetjwho.move_child(uqymtkqa, 1)
    vgpcfctv.visible = false
    uqymtkqa.visible = true
    uqymtkqa.text = sznbeaci

func uwthkxxi (mwklvpjg : String):
    hmetjwho.move_child(vgpcfctv, 0)
    uqymtkqa.visible = false
    vgpcfctv.visible = true
    vgpcfctv.text = mwklvpjg

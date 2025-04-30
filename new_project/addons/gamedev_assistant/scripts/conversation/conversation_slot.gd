@tool
extends Button

@onready var fulkaqch : Label = $PromptLabel
@onready var iacxdzth : TextureButton = $FavouriteButton
@onready var ooevthzl : Button = $DeleteButton

@export var non_favourite_color : Color
@export var favourite_color : Color

var rpoleqyg : Conversation
var pzbimbuy

func _ready():
    iacxdzth.modulate = non_favourite_color
    
                                
    pressed.connect(aqljfmup)
    ooevthzl.pressed.connect(unkzbbrl)
    iacxdzth.pressed.connect(knablvoo)

                                                 
func ihaycdhk (skjujvgi : Conversation, blcuavmc):
    rpoleqyg = skjujvgi
    pzbimbuy = blcuavmc
    fulkaqch.text = rpoleqyg.cihpjjur().replace("\n", "")                    
    ngkiurax()

                                                
func aqljfmup():
    pzbimbuy.kkwoukdj(rpoleqyg)

                              
                                    
func unkzbbrl():
    $"../../..".xlfmpsyi(self)

func knablvoo():
                                                          
    pzbimbuy.conversation_manager.skpqeutw(rpoleqyg, not rpoleqyg.favorited)
    ngkiurax()

func ngkiurax ():
    if rpoleqyg.favorited:
        iacxdzth.modulate = favourite_color
    else:
        iacxdzth.modulate = non_favourite_color

func get_conversation():
    return rpoleqyg

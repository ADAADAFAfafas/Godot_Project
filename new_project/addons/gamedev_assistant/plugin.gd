            
@tool
extends EditorPlugin

var gevxnunj
var avlnbsep = preload("res://addons/gamedev_assistant/scripts/code_editor/CodeContextMenuPlugin.gd")
var dohjraih:EditorContextMenuPlugin

func _enter_tree():
                                           
    gevxnunj = preload("res://addons/gamedev_assistant/dock/gamedev_assistant_dock.tscn").instantiate()
    add_control_to_dock(EditorPlugin.DOCK_SLOT_RIGHT_UL, gevxnunj)
    
                              
    dohjraih = avlnbsep.new(gevxnunj)        
    add_context_menu_plugin(EditorContextMenuPlugin.CONTEXT_SLOT_SCRIPT_EDITOR_CODE,dohjraih)

func _exit_tree():
                                
    remove_control_from_docks(gevxnunj)
    gevxnunj.queue_free()
    
    remove_context_menu_plugin(dohjraih)

                                                       
@tool
extends OptionButton

func _ready():
    fotfhehz()
    
func fotfhehz():
    clear()
    
    tooltip_text = "Add extra content to the chat. Your open scene nodes and file tree are automatically included"
    
    add_item("Add Context..")
    set_item_tooltip(0, "Add extra content to the chat. Your open scene nodes and file tree are automatically included")
    
    add_item("@OpenScripts") 
    set_item_tooltip(1, "Include the contents of all scripts that are currently open in the Godot code editor. Clipped at 50k characters")
    
    add_item("@Output")
    set_item_tooltip(2, "Add the contents of the Output panel. Note this does NOT include the Debugger panel")
    
    add_item("@Docs")
    set_item_tooltip(3, "Docs are already included automatically, but you can force it to look at a certain topic")
    
    add_item("@GitDiff")
    set_item_tooltip(4, "If you are using git, this will pass the contents of the `git diff` command")
    

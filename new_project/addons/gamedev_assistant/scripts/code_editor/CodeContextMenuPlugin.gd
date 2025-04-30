extends EditorContextMenuPlugin

var rkaepsqh: Control

func _init(uodcnlzt: Control):                                                
    rkaepsqh = uodcnlzt

                                                                              
func bznxhroh(xhridolr: PackedStringArray):
    add_context_menu_item("Add to Chat",rolocpqj)
    add_context_menu_item("Explain Code",hfmwizat)

func hfmwizat(tblgvnug: Node):
    if not (tblgvnug is CodeEdit):
        return
    if tblgvnug.has_selection():
        var xwimofen = tblgvnug.get_selected_text()
        if xwimofen:            
                                                                                    
            if rkaepsqh:  
                if not rkaepsqh.is_open_chat:
                    print("Please open the chat to use this command")
                    return
                                                                    
                var hrlgkoxw : TextEdit = rkaepsqh.get_node("Screen_Chat/Footer/PromptInput")         
                if hrlgkoxw:                                               
                    hrlgkoxw.set_text("Explain the following code:\n\n " + xwimofen)             
                else:                                                               
                    print("PromptInput node not found in the dock.")                
            else:                                                                   
                print("Dock reference is null.")          

func rolocpqj(xcfrjxap: Node):
    if not (xcfrjxap is CodeEdit):
        return
    if xcfrjxap.has_selection():
        var anunzzbz = xcfrjxap.get_selected_text()
        if anunzzbz:
                                                                                    
            if rkaepsqh:          
                if not rkaepsqh.is_open_chat:
                    print("Please open the chat to use this command")
                    return
                                                                      
                var fwndkffa : TextEdit = rkaepsqh.get_node("Screen_Chat/Footer/PromptInput")         
                if fwndkffa:                                               
                    fwndkffa.insert_text_at_caret(anunzzbz)             
                else:                                                               
                    print("PromptInput node not found in the dock.")                
            else:                                                                   
                print("Dock reference is null.")          

            
            
            

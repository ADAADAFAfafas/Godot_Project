@tool
class_name Conversation
extends Node

                                                                             

var messages : Array[Message] = []
var title : String
var id : int = -1
var favorited : bool = false
var has_been_fetched : bool = false

class Message:
    var role : String
    var content : String

                                           
                                                                    
func cihpjjur () -> String:
    if len(title) > 0:
        return title
    
    if len(messages) == 0:
        return "Empty chat..."
    
    return messages[0].content

func zkjnyozv (ttvlnagq : String):
    var cymtvdbv = Message.new()
    cymtvdbv.role = "user"
    cymtvdbv.content = ttvlnagq
    messages.append(cymtvdbv)

func pxkkuiyh (logjbprs : String):
    var xyzmuikh = Message.new()
    xyzmuikh.role = "assistant"
    xyzmuikh.content = logjbprs
    messages.append(xyzmuikh)

extends CanvasLayer

export (NodePath) var node_path:NodePath
# 要显示的节点路径
export (Array, String) var properties:Array   # 要显示的节点属性
export (bool) var enabled:bool setget _set_enabled  # 是否启用debug

var nodes:Dictionary = {}  # 存放所有需要输出的节点

class NodeDebugInfo:  
	var node:Node   # 节点
	var props:Array # 节点属性

func _ready(): 
	add_by_path(node_path, properties) 
	if enabled:
		$Label.show()
	else:
		$Label.hide()
	set_process(enabled)

func _process(_delta):
	debug()
 
func _set_enabled(val:bool):
	enabled = val 
	if val:
		set_process(true)
		$Label.show()
	else:
		set_process(false)
		$Label.hide() 
 
func add_by_node(node:Node, properties:Array) -> void:  
	if !is_instance_valid(node):
		return 
	if !nodes.get(node.get_path()) == null:  
		printerr("debug add duplicated node: ", node.get_path())  
		return 
	var debug_info = NodeDebugInfo.new()
	debug_info.node = node 
	for prop in properties:
		if not prop in node:
			printerr("no prop named '", prop, "' in ", node.get_path())
			properties.erase(prop)
			continue 
	debug_info.props = properties 
	nodes[node.get_path()] = debug_info
 
func add_by_path(path:NodePath, properties:Array) -> void:
	var node = get_node(path) 
	if is_instance_valid(node):
		add_by_node(node, properties)

func del_node(path:NodePath) -> void:
	nodes.erase(path) 
 
func debug() -> void: 
	var show_text:String = ""
	for node_key in nodes.keys():
		var info:NodeDebugInfo = nodes[node_key]
		if is_instance_valid(info.node):
			show_text += "%s:\n" % [info.node.get_path()]
			show_text += "%s\n" % [_get_properties_output(info)] 
			pass 
		else:
			nodes.erase(node_key) 
	$Label.text = show_text
 
func _get_properties_output(info:NodeDebugInfo) -> String:
	var out_str:String = ""
	for prop in info.props:
		out_str += "    %s : %s\n" % [prop, info.node[prop]]
	return out_str

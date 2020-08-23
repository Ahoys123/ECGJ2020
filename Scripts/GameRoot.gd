extends Node

# first %s - Levels or Menu
# second %s - Level or Menu Name
# third %s - Level or Menu number
# const LVL_PATH = "res://Scenes/%s/%s%s.tscn" 

var mainmenu


var lvl_name:String = "Level1"

func _ready():
	call_deferred("init")
	
func init():
	#If there are no children to the GameRoot node, then this is the intro scene, load main menu.
	if(get_tree().root.get_child(0).get_children() == []):
		load_level("Menu" ,"MainMenu")
		#connect game initialization to button press
		#todo: remove hardcode of mainmenu, as it's likely to break
		mainmenu = get_tree().root.get_child(1)
		print(mainmenu.connect("init_game_start", self, "on_init_game"))
	#Otherwise, load level (useful for testing)
	else:
		load_level("Level", "Level1")
	
func load_level(type:String ,name:String):
	#example level name - OVERWORLD_main.tscn
	#todo:check if the level to be loaded actually exists
	var root = get_tree().root
	
	#check to see if a level is already loaded. If so, remove it first
	#TODO - determine what to do with levels already loaded
	if root.has_node("Level"):    #might need to fix
		var level=root.get_node("Level")
		root.remove_child(level)
	if root.has_node("MainMenu"):
		var level=root.get_node("MainMenu")
		root.remove_child(level)
	
	var lvl_path_full
	#TODO - add code to select specific level
	#lvl_path_full = LVL_PATH %
	
	#temp
	if(type == "Menu"):
		lvl_path_full = "res://Scenes/Menus/%s.tscn" % [name]
	elif(type == "Level"):
		lvl_path_full = "res://Scenes/Levels/%s.tscn" % [name]
	elif(name == "Test"):
		lvl_path_full = "res://Scenes/Test.tscn"
	else:
		return
	
	print(lvl_path_full)	
	
	var lvl = load(lvl_path_full).instance()
	root.add_child(lvl)
	return true
	
#ToDo - Alter function to take into account load states
func on_init_game():
	print ("signal to start game received")
	load_level("Level","Level1")

extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var currentScene = null

func _ready():
	# 今のシーンを取得？
	#On load set the current scene to the last scene available
	currentScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() -1)
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Collection_pressed():
	var packed_scene = load("res://Collections.tscn")
	setScene(packed_scene)
	pass # replace with function body


func _on_Gacha_pressed():
	var packed_scene = load("res://lottery.tscn")
	setScene(packed_scene)
	pass # replace with function body

func setScene(scene):
   #clean up the current scene
   currentScene.queue_free()
   #load the file passed in as the param "scene"
   #var s = ResourceLoader.load(scene)
   #create an instance of our scene
   currentScene = scene.instance()
   # add scene to root
   get_tree().get_root().add_child(currentScene)

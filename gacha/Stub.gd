extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Collection_pressed():
	var packed_scene = load("res://path/to/scene.scn")
	T
	pass # replace with function body


func _on_Gacha_pressed():
	var packed_scene = load("res://path/to/lottery.scn")
	get_tree().change_scene_to(packed_scene)
	pass # replace with function body

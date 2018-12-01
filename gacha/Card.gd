extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	hide()
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func loadData(data):

	if !data.has_all(["id", "ename"]):
		hide()
		return
	
	var id = data["id"]
	var ename = data["ename"]

	$ID.text = id

	if data.has("jname"):	
		$Name.text = data["jname"]
	else:
		$Name.text = ename
	
	# ID + 英語名のPNGファイルを読み込む
	# ex:001Bulbasaur.png
	$Sprite.texture = load("res://data/img/" + id + ename + ".png")
	
	# 表示
	show()
	
	pass
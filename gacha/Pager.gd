extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export(int) var page = 1;
export(int) var pages = 1;

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	$Page.text = String(page)
	$Pages.text = String(pages)
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func updatePage(page, pages):
	$Page.text = String(page)
	$Pages.text = String(pages)
	
	pass

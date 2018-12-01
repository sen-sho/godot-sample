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


func _on_Button_pressed():
	
	$Button.hide()
	
	lottery()
	
	pass # replace with function body

# 抽選処理
func lottery():
	randomize()
	
	var rand = randi()
	print(rand)
	
	$Effect.visible = true
	$Effect.show(rand)
	
	pass

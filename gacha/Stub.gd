extends Node2D

func _ready():
	pass

func _on_Collection_pressed():
	Utils.setScene("res://Collections.tscn")
	pass # replace with function body


func _on_Gacha_pressed():
	Utils.setScene("res://lottery.tscn")
	pass # replace with function body

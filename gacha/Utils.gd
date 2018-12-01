##################################################
#
# 共通処理
#
##################################################
extends Node

# 現在のシーン保持
var currentScene = null

func _ready():
	# 現在のシーン取得	
	currentScene = get_tree().get_root().get_child(
		get_tree().get_root().get_child_count() -1)

	pass

# シーン切り替え処理
func setScene(scene):
	# 現在のシーンのクリーンアップ
	currentScene.queue_free()
	
	# 指定されたシーンのロード
	var s = ResourceLoader.load(scene)
	
	# 指定したシーンのインスタンス作成
	currentScene = s.instance()
	
	# シーンの設定
	get_tree().get_root().add_child(currentScene)

extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export (bool)var start = false;

var speed = 200
var showTime = 3
var oneSecScale = 0

var target = Vector2()
var velocity = Vector2()

var bound = false
var move = true
var show = false

enum EffectStatus { NONE, START, END }

var status = EffectStatus.NONE

func _ready():
	
	$Monster.hide()
	$OpenEffect.emitting = false
	# 現在のスケールから、１秒ごとのスケールアップ値を計算
	var diff = abs(1 - $Monster.scale.x)
	oneSecScale = diff / showTime
	
	# 入力イベント利用設定
	set_process_input(true)
	
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	if show :
		# 結果表示時は何もしない
		return
	
	if !move :
		showItem(delta)
	else:
		moveBall()

	pass

func moveBall():
	if (!start):
		return
	var target = $PositionOpen.position
	var currentPos = $Ball.position 
	velocity = (target - currentPos).normalized() * speed
	
	if (target - currentPos).length() > 5:
		$Ball.move_and_slide(velocity)
	else:
		move = false
		show = true
		$OpenEffect.emitting = true
		$TimerEffect.start()
	
	pass

func showItem(delta):
	
	var addValue = float(oneSecScale * delta)
	var current = float($Monster.scale.x + addValue)
	
	if 1 < current:
		current = 1
		$Monster.modulate = Color(1, 1, 1, 1)
		show = true
		status = EffectStatus.END
	else:
		$Monster.scale = Vector2(current, current)
	
	pass
	
func _on_TimerEffect_timeout():
	
	$Ball.hide()
	$OpenEffect.one_shot = true
	$Monster.show()
	show = false
	$Name.show()
	pass # replace with function body

func show(no):
	# 画像読み込み
	loadData(no)
	
	start = true
	status = EffectStatus.START
	
	pass

# JSONデータを読み込む
func loadData(no):
	var file = File.new()
	
	# リソースエリアから、ファイルを読取モードでオープンする。
	file.open("res://data/pokedex.json", file.READ)
	
	# テキストデータとしてファイルを読み込む。
	var text = file.get_as_text()
	
	# JSON形式の文字列をパースする。
	var jsonData = JSON.parse(text)
	
	file.close()
	
	var idx = no % jsonData.result.size()
	var data = jsonData.result[idx]
	var id = data["id"]
	var ename = data["ename"]
	
	$Name.text = data["jname"]
	
	# ID + 英語名のPNGファイルを読み込む
	# ex:001Bulbasaur.png
	$Monster.texture = load("res://data/img/" + id + ename + ".png")
	
	pass

func _input(event):
	if status == EffectStatus.NONE:
		return
	
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		# クリック時のイベント
		if status == EffectStatus.END:
			# 結果表示時の場合、上位画面に戻す。
			Utils.setScene("res://Stub.tscn")
		else:
			# エフェクト中の場合、スキップ
			$Monster.modulate = Color(1, 1, 1, 1)
			$Monster.scale = Vector2(1, 1)
			$Name.show()
			show = true
			status = EffectStatus.END
			$Monster.show()
			$Ball.hide()
			$OpenEffect.hide()
	pass


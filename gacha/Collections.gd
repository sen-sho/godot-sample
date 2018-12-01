extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

# Jsonデータ
var data = {}

var dataCount = 0
var page = 1
var pages = 1
var row = 6
var move = 5

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	loadData()
	
	calcDataCount()
	
	pageLoad()
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

# JSONデータを読み込む
func loadData():
	var file = File.new()
	
	# リソースエリアから、ファイルを読取モードでオープンする。
	file.open("res://data/pokedex.json", file.READ)
	
	# テキストデータとしてファイルを読み込む。
	var text = file.get_as_text()
	
	# JSON形式の文字列をパースする。
	var jsonData = JSON.parse(text)
	
	file.close()
	
	data = jsonData.result
	
	pass

# ポケモンデータの件数をカウントして、ページ等の設定を行う。
func calcDataCount():
	
	dataCount = data.size()
	
	pages =  ceil( dataCount / row )
	
	pass
	
func pageLoad():
	
	# ページの情報を取得
	var index = (page - 1) * row
	
	# カードホルダー１の読み込み
	$Card1.loadData(data[index])
	
	
	# カードホルダー2の読み込み
	index += 1
	$Card2.loadData(data[index])
	
	# カードホルダー3の読み込み
	index += 1
	$Card3.loadData(data[index])
	
	# カードホルダー4の読み込み
	index += 1
	$Card4.loadData(data[index])
	
	# カードホルダー5の読み込み
	index += 1
	$Card5.loadData(data[index])
	
	# カードホルダー6の読み込み
	index += 1
	$Card6.loadData(data[index])
	
	$Pager.updatePage(page, pages)
	
	pass

func movePage(value):
	
	var currentPage = page
	
	currentPage += value
	
	if currentPage < 1:
		currentPage = 1
		
	if pages < currentPage:
		currentPage = pages
		
	if page == currentPage:
		return
	
	page = currentPage
	
	pageLoad()
	
	pass

func _on_Prev_pressed():
	
	movePage(-1)
	
	pass # replace with function body


func _on_Next_pressed():
	
	movePage(1)
	
	pass # replace with function body


func _on_Prev2_pressed():
	
	movePage(move * -1)
	pass # replace with function body


func _on_Next2_pressed():
	movePage(move)
	
	pass # replace with function body

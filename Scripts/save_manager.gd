extends Node

const savepath = "user://save.ini"
var MusicVol = Global.MusicVol
var Border = Global.border
var BattleTheme = Global.BattleTheme
var Name = Global.PlayerName
var skipintro = Global.SetName


func _process(_delta: float) -> void:
	MusicVol = Global.MusicVol
	Border = Global.border
	BattleTheme = Global.BattleTheme
	Name = Global.PlayerName
	skipintro = Global.SetName


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("attempting to load")
	load_save()


func save():
	
	var settings = {
		"Name" = Name,
		"Volume" = MusicVol,
		"Border" = Border,
		"Theme" = BattleTheme,
		"SkipIntro" = skipintro,
		"Watched" = Global.watchedintro
	}
	
	var jsonsetting = JSON.stringify(settings)
	
	var save = FileAccess.open(savepath,FileAccess.WRITE)
	save.store_string(jsonsetting)
	save.close()
	print(jsonsetting)

func load_save():
	if FileAccess.file_exists(savepath):
		var save = FileAccess.open(savepath,FileAccess.READ)
		var loadsave = save.get_line()
		save.close()
		
		var json = JSON.new()
		
		var parsesave = json.parse(loadsave)
		if not parsesave == OK:
			print("error while parsing save")
			return
		
		var loadeddata = json.data
		
		if loadeddata.Border > Global.GlobalMaxBorder or loadeddata.Border < 0:
			loadeddata.Border = 0
		if loadeddata.Volume > 2:
			loadeddata.Volume = 2
		elif loadeddata.Volume < 0:
			loadeddata.Volume = 0
		#if loadedsettings.t > Global.MaxBattleTheme:
			#loadedsettings.t = Global.MaxBattleTheme
		var savetype = ["Volume","Border","Theme","Name","SkipIntro","Watched"]
		for i in savetype:
			if not loadeddata.has(i):
				return
		Global.MusicVol = loadeddata.Volume
		Global.border = loadeddata.Border
		Global.BattleTheme = loadeddata.Theme
		Global.PlayerName = loadeddata.Name
		Global.SetName = loadeddata.SkipIntro
		Global.watchedintro = loadeddata.Watched
	else:
		print("nosave")

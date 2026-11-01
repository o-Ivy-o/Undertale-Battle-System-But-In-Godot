extends Node

const savepath = "user://settings.dat"
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
		"SkipIntro" = skipintro
	}
	
	var save = FileAccess.open(savepath,FileAccess.WRITE)
	save.store_var(settings)
	save.close()
	print(settings)

func load_save():
	if FileAccess.file_exists(savepath):
		var save = FileAccess.open(savepath,FileAccess.READ)
		var loadedsettings = save.get_var()
		save.close()
		
		if loadedsettings.Border > Global.GlobalMaxBorder or loadedsettings.Border < 0:
			loadedsettings.Border = 0
		if loadedsettings.Volume > 2:
			loadedsettings.Volume = 2
		elif loadedsettings.Volume < 0:
			loadedsettings.Volume = 0
		#if loadedsettings.t > Global.MaxBattleTheme:
			#loadedsettings.t = Global.MaxBattleTheme
		Global.MusicVol = loadedsettings.Volume
		Global.border = loadedsettings.Border
		Global.BattleTheme = loadedsettings.Theme
		Global.PlayerName = loadedsettings.Name
		Global.SetName = loadedsettings.SkipIntro
		print(loadedsettings)
	else:
		print("nosave")

extends Control

var meni : int = 0
var hi : int = 2
var li : int = 0
var cnmi : bool = true
#@export var BattleSystem : PackedScene

#when scene gets created
func _ready() -> void:
	$LOADING.visible = false
	AudioHandler.menu.play()
	showmenu()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Down"):
		if meni != hi and cnmi:
			meni += 1
			
			AudioHandler.snd_menumove.play()
			#print(meni)
	elif Input.is_action_just_pressed("Up"):
		if meni != li and cnmi:
			meni -= 1
			AudioHandler.snd_menumove.play()
			#print(meni)
	if Input.is_action_just_pressed("Accept") and cnmi:
		match meni:
			0:
				AudioHandler.menu.stop()
				AudioHandler.snd_select.play()
				#print("not starting battle")
				$"../DogCheck/InukumaWip".play()
				$"../DogCheck".show()
				$".".hide()
				cnmi = false
				if OS.is_debug_build():
					get_tree().change_scene_to_file("res://Scenes/battle_system.tscn")
			1:
				AudioHandler.snd_select.play()
				hidemenu()
				showsettings()
				AudioHandler.checktime()
				AudioHandler.menu.stream_paused = true
				AudioHandler.mus_harpnoise.play()
				get_tree().create_timer(1).timeout.connect(AudioHandler.settingsmenu.play)
				cnmi = false
			2:
				AudioHandler.snd_select.play()
				cnmi = false
				await AudioHandler.snd_select.finished
				#print("closing game")
				get_tree().quit()
	#show selection for main menu
	match meni:
		0:
			$"Main Menu/Start".label_settings.font_color = Color(Color.YELLOW)
			$"Main Menu/Settings".label_settings.font_color = Color(Color.WHITE)
			$"Main Menu/Exit".label_settings.font_color = Color(Color.WHITE)
		1:
			$"Main Menu/Settings".label_settings.font_color = Color(Color.YELLOW)
			$"Main Menu/Start".label_settings.font_color = Color(Color.WHITE)
			$"Main Menu/Exit".label_settings.font_color = Color(Color.WHITE)
		2:
			$"Main Menu/Exit".label_settings.font_color = Color(Color.YELLOW)
			$"Main Menu/Start".label_settings.font_color = Color(Color.WHITE)
			$"Main Menu/Settings".label_settings.font_color = Color(Color.WHITE)



func showmenu():
	$"Main Menu".visible = true
func hidemenu():
	$"Main Menu".visible = false

func hidesettings():
	$"Settings Menu".visible = false
	$"Settings Menu".cmi = false
	
func showsettings():
	$"Settings Menu".visible = true
	await get_tree().create_timer(1).timeout
	$"Settings Menu".cmi = true
	

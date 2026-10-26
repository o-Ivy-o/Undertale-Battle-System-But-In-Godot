extends Control

var meni = 0
const maxmeni = 3
@export var cmi : bool
var adjst = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$Exit.label_settings.font_color = Color(Color.WHITE)
	$MusicVol.label_settings.font_color = Color(Color.WHITE)
	$Border.label_settings.font_color = Color(Color.WHITE)
	$BattleSong.label_settings.font_color = Color(Color.WHITE)
	$MusicVol.text = "Master Volume: " + str(Global.MusicVol)
	$Border.text = "Border: " + str(Global.BorderName)
	$BattleSong.text = "Battle Theme: " + str(Global.BattleThemeName)
	$AliceCredit.visible = false
	if Global.BattleTheme == 2:
		$AliceCredit.visible = true
	
	if Input.is_action_just_pressed("Down") and cmi and meni != maxmeni:
		meni += 1
		$"../AudioHandler/Sounds/SndMenumove".play()
		print(meni)
	elif Input.is_action_just_pressed("Up") and cmi and meni != 0:
		meni -= 1
		$"../AudioHandler/Sounds/SndMenumove".play()
		print(meni)
	elif Input.is_action_just_pressed("Accept") and cmi:
		match meni:
			0:
				SaveManager.save()
				cmi = false
				$"../AudioHandler/Sounds/SndSelect".play()
				hide()
				$"../Main Menu".show()
				$"..".cnmi = true
				$"../AudioHandler/Music/MusOptionsFall".stop()
				$"../AudioHandler/Music/Menu".stream_paused = false
			1:
				$"../AudioHandler/Sounds/SndSelect".play()
				cmi = false
				adjst = true
			2:
				$"../AudioHandler/Sounds/SndSelect".play()
				cmi = false
				adjst = true
			3:
				$"../AudioHandler/Sounds/SndSelect".play()
				cmi = false
				adjst = true
	elif Input.is_action_just_pressed("Left") and adjst:
		
		match meni:
			1:
				if Global.border != 0:
					Global.border -= 1
					$"../AudioHandler/Sounds/SndMenumove".play()
				else:
					$"../AudioHandler/Sounds/SndCantselect".play()
			2:
				if Global.MusicVol > 0.1:
					$"../AudioHandler/Sounds/SndMenumove".play()
					Global.MusicVol -= .1
				else:
					$"../AudioHandler/Sounds/SndCantselect".play()
			3:
				if Global.BattleTheme > 0:
					Global.BattleTheme -= 1
					$"../AudioHandler/Sounds/SndMenumove".play()
				else:
					$"../AudioHandler/Sounds/SndCantselect".play()
	elif Input.is_action_just_pressed("Right") and adjst:
		match meni:
			1:
				if Global.border < Global.GlobalMaxBorder:
					Global.border += 1
					$"../AudioHandler/Sounds/SndMenumove".play()
				else:
					$"../AudioHandler/Sounds/SndCantselect".play()
			2:
				if Global.MusicVol < 2:
					Global.MusicVol += .1
					$"../AudioHandler/Sounds/SndMenumove".play()
				else:
					$"../AudioHandler/Sounds/SndCantselect".play()
			3:
				if Global.BattleTheme < Global.MaxBattleTheme:
					Global.BattleTheme += 1
					$"../AudioHandler/Sounds/SndMenumove".play()
				else:
					$"../AudioHandler/Sounds/SndCantselect".play()
	elif Input.is_action_just_pressed("Back") and adjst:
		adjst = false
		cmi = true
		
	match meni:
		0:
			$Exit.label_settings.font_color = Color(Color.YELLOW)
		1:
			$Border.label_settings.font_color = Color(Color.YELLOW)
		2:
			$MusicVol.label_settings.font_color = Color(Color.YELLOW)
		3:
			$BattleSong.label_settings.font_color = Color(Color.YELLOW)
			

extends Control

var index = 0
const maxindex = 4
@export var cmi : bool
var adjst = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Quit") and cmi:
		Global.MusicVol = 1.0
		Global.border = 0
		Global.BattleTheme = 0
		Global.PlayerName = "CHARA"
		Global.SetName = false
		AudioHandler.settingsmenu.stop()
		await get_tree().create_timer(.1).timeout
		get_tree().change_scene_to_file("res://Scenes/intro.tscn")
		SaveManager.save()
	$Exit.label_settings.font_color = Color(Color.WHITE)
	$MusicVol.label_settings.font_color = Color(Color.WHITE)
	$Border.label_settings.font_color = Color(Color.WHITE)
	$BattleSong.label_settings.font_color = Color(Color.WHITE)
	$LOVE.label_settings.font_color = Color(Color.WHITE)
	$MusicVol.text = "Master Volume: " + str(Global.MusicVol)
	$Border.text = "Border: " + str(Global.BorderName)
	$BattleSong.text = "Battle Theme: " + str(Global.BattleThemeName)
	$LOVE.text = "LOVE: " + str(Global.PlayerLove)
	$Credit.visible = false
	if Global.BattleTheme == 2:
		$Credit.visible = true
		$Credit.text = "* Polite Buster by Alice:
https://soundcloud.com/aarctoid"
	elif Global.BattleTheme == 1:
		$Credit.visible = true
		$Credit.text = "* Enemy Imminent by Maisy"
	if Input.is_action_just_pressed("Down") and cmi and index != maxindex:
		index += 1
		
		AudioHandler.snd_menumove.play()
		#print(index)
	elif Input.is_action_just_pressed("Up") and cmi and index != 0:
		index -= 1
		AudioHandler.snd_menumove.play()
		#print(index)
	elif Input.is_action_just_pressed("Accept") and cmi:
		if index > 0:
			AudioHandler.snd_select.play()
			cmi = false
			adjst = true
		else:
			SaveManager.save()
			cmi = false
			AudioHandler.snd_select.play()
			hide()
			$"../Main Menu".show()
			$"..".cnmi = true
			AudioHandler.settingsmenu.stop()
			AudioHandler.menu.stream_paused = false
	elif Input.is_action_just_pressed("Left") and adjst:
		match index:
			1:
				if Global.border != 0:
					Global.border -= 1
					AudioHandler.snd_menumove.play()
				else:
					AudioHandler.snd_cantselect.play()
			2:
				if Global.MusicVol > 0.1:
					AudioHandler.snd_menumove.play()
					Global.MusicVol -= .1
				else:
					AudioHandler.snd_cantselect.play()
			3:
				if Global.BattleTheme > 0:
					Global.BattleTheme -= 1
					AudioHandler.snd_menumove.play()
				else:
					AudioHandler.snd_cantselect.play()
			4:
				if Global.PlayerLove > 1:
					Global.PlayerLove -= 1
					AudioHandler.snd_menumove.play()
				else:
					AudioHandler.snd_cantselect.play()
	elif Input.is_action_just_pressed("Right") and adjst:
		match index:
			1:
				if Global.border < Global.GlobalMaxBorder:
					Global.border += 1
					AudioHandler.snd_menumove.play()
				else:
					AudioHandler.snd_cantselect.play()
			2:
				if Global.MusicVol < 2:
					Global.MusicVol += .1
					AudioHandler.snd_menumove.play()
				else:
					AudioHandler.snd_cantselect.play()
			3:
				if Global.BattleTheme < Global.MaxBattleTheme:
					Global.BattleTheme += 1
					AudioHandler.snd_menumove.play()
				else:
					AudioHandler.snd_cantselect.play()
			4:
				if Global.PlayerLove < 20:
					Global.PlayerLove += 1
					AudioHandler.snd_menumove.play()
				else:
					AudioHandler.snd_cantselect.play()
	elif Input.is_action_just_pressed("Back") and adjst:
		adjst = false
		cmi = true
		
	match index:
		0:
			$Exit.label_settings.font_color = Color(Color.YELLOW)
		1:
			$Border.label_settings.font_color = Color(Color.YELLOW)
		2:
			$MusicVol.label_settings.font_color = Color(Color.YELLOW)
		3:
			$BattleSong.label_settings.font_color = Color(Color.YELLOW)
		4:
			$LOVE.label_settings.font_color = Color(Color.YELLOW)

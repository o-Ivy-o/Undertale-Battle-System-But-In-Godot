extends Control


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$SndBreak1.volume_linear = Global.MusicVol
	$SndBreak2.volume_linear = Global.MusicVol
	$MusGameover.volume_linear = Global.MusicVol
	
	if Input.is_action_just_pressed("Accept") and $MusGameover.playing:
		get_tree().change_scene_to_file("res://Scenes/Main.tscn")
		
		

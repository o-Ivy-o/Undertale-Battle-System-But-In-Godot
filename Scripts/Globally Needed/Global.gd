extends Node

var fs : bool = false
var border : int = 0
var GlobalMaxBorder : int = 0
var BorderName : String = ""
var BattleTheme : int = 0
var BattleThemeName : String = ""
var MaxBattleTheme : int = 0
var MusicVol = 1
var PlayerName : String = "CHARA"
var PlayerLove : int = 1
var SetName : bool = false



func _ready() -> void:
	var screensize = DisplayServer.window_get_size()
	DisplayServer.window_set_size(Vector2(screensize.x * 3.5,screensize.y * 3.5))
	get_window().move_to_center()
	ProjectSettings.set_setting("rendering/environment/defaults/default_clear_color",Color.BLACK)
	get_window().move_to_center()


func _unhandled_input(event: InputEvent) -> void:
	match event.get_class():
		"InputEventKey":
			if Input.is_action_just_pressed("fullscreen"):
				togglefullscreen()

func togglefullscreen():
	if fs == false:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
			fs = true
	else: 
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			get_window().move_to_center()
			fs = false

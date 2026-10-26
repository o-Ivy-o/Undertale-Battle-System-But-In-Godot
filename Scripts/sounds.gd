extends Node

@onready var BattleThemes : Array = $BattleThemes.get_children()
@onready var selectedBattleTheme : AudioStreamPlayer

@onready var snd_txtivy: AudioStreamPlayer = $Sounds/SndTxtivy
@onready var snd_break_1: AudioStreamPlayer2D = $Sounds/SndBreak1
@onready var snd_break_2: AudioStreamPlayer2D = $Sounds/SndBreak2
@onready var snd_cantselect: AudioStreamPlayer2D = $Sounds/SndCantselect
@onready var snd_defeatrun: AudioStreamPlayer2D = $Sounds/SndDefeatrun
@onready var snd_graze: AudioStreamPlayer2D = $Sounds/SndGraze
@onready var snd_hurt_1: AudioStreamPlayer2D = $Sounds/SndHurt1
@onready var snd_menumove: AudioStreamPlayer2D = $Sounds/SndMenumove
@onready var snd_power: AudioStreamPlayer2D = $Sounds/SndPower
@onready var snd_rudebuster_hit: AudioStreamPlayer2D = $Sounds/SndRudebusterHit
@onready var snd_rudebuster_swing: AudioStreamPlayer2D = $Sounds/SndRudebusterSwing
@onready var snd_select: AudioStreamPlayer2D = $Sounds/SndSelect
@onready var snd_spare: AudioStreamPlayer2D = $Sounds/SndSpare
@onready var snd_txtnoe: AudioStreamPlayer2D = $Sounds/SndTxtnoe
@onready var snd_weaponpull: AudioStreamPlayer2D = $Sounds/SndWeaponpull
@onready var audio_anotherhim: AudioStreamPlayer = $Music/AudioAnotherhim
@onready var inukuma_wip: AudioStreamPlayer = $Music/InukumaWip
@onready var mus_options_fall: AudioStreamPlayer = $Music/MusOptionsFall
@onready var mus_options_summer: AudioStreamPlayer = $Music/MusOptionsSummer
@onready var mus_options_winter: AudioStreamPlayer = $Music/MusOptionsWinter
@onready var menu: AudioStreamPlayer = $Music/Menu
@onready var battle: AudioStreamPlayer = $BattleThemes/Battle
@onready var mus_battle_1: AudioStreamPlayer = $BattleThemes/MusBattle1
@onready var polite_buster_by_alice: AudioStreamPlayer = $"BattleThemes/Polite Buster by Alice"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	for i in get_children():
		for s in i.get_children():
			s.volume_linear = Global.MusicVol
	
	Global.MaxBattleTheme = $BattleThemes.get_child_count() -1
	
	Global.BattleThemeName = BattleThemes.get(Global.BattleTheme).get_meta("ThemeName")
	
	
	selectedBattleTheme = BattleThemes.get(Global.BattleTheme)
	

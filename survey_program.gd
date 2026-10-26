extends Control

@onready var audio_handler: Node2D = $AudioHandler
@onready var nametxt = $NamingScreen/Name
var dialogue : Array
var curtxtp = 0
var mxtxtp = dialogue.size() -1
var caninteract = true
@export var mainscene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.SetName:
		gomenu()
		caninteract = false
	else:
		#audio_handler.Music.AudioAnotherhim.play()
		dialogue = ["       Hello Player.\n      Before we Begin.","  Please name the fallen\n          Human.","         Perfect.","      We Called Them:\n           "+nametxt.text      ]
		
		$AudioHandler/Music/AudioAnotherhim.play()
		$Text.text = dialogue[curtxtp]
		$Text.visible_characters = 0
		$Type.start()

func nextpage():
	$Text.text = dialogue[curtxtp]
	$Text.visible_characters = 0
	$Type.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	dialogue = ["       Hello Player.\n      Before we Begin.","  Please name the fallen\n          Human.","         Perfect.","      We Called Them:\n           "+nametxt.text,"   Excellent we shall now
		   BEGIN"]
	mxtxtp = dialogue.size() -1
	if Input.is_action_just_pressed("Accept"):
		if $Text.visible_ratio >= 1  and caninteract and curtxtp < mxtxtp and curtxtp != 1:
			curtxtp += 1
			$Text.text = dialogue[curtxtp]
			$Text.visible_characters = 0
			$Type.start()
		elif $Text.visible_ratio >= 1 and curtxtp == 1 and caninteract:
			$Transition.play("FriskAppear")
		elif $Text.visible_ratio >= 1  and caninteract and curtxtp == mxtxtp:
			$Transition.play("Transition")
			caninteract = false

func _on_type_timeout() -> void:
	var text = $Text.text
	var totalchar = $Text.get_total_character_count()
	
	while $Text.visible_characters < totalchar:
		var nchar = text.substr($Text.visible_characters,1)
		if nchar not in [" ","\n","\t","\r"]:
			break
		$Text.visible_characters += 1
		
	if $Text.visible_characters < totalchar:
		$Text.visible_characters += 1
		$AudioHandler/Sounds/SndTxtivy.pitch_scale = randf_range(0.85, 1.15)
		$AudioHandler/Sounds/SndTxtivy.play()
		
	if $Text.visible_characters >= totalchar:
		$Type.stop()


func gomenu():
	$AudioHandler/Music/AudioAnotherhim.stop()
	var main_menu = mainscene.instantiate()
	add_child(main_menu)
	$Text.visible = false
	#$NamingScreen.visible = false
	$WhiteTransition.visible = false
	$Light.visible = false
	$Soul.visible = false

func _on_transition_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Transition":
		$Transition.stop()
		gomenu()
		SaveManager.save()
	elif anim_name == "FriskAppear" and curtxtp == 1:
		$Transition.play("FriskIdle")
		$Text.visible = false
		caninteract = false
		$NamingScreen.visible = true
		$NamingScreen.cmi = true

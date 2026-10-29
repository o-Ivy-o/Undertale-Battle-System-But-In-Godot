extends Control

@onready var Letters : Array = $"Letters/Line 1".get_children() + $"Letters/Line 2".get_children()
var lidx = 0
var lidy = 0
@export var cmi : bool = false
var playedsound = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Name.text = Global.PlayerName


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	for i in Letters:
		i.modulate = Color(Color.WHITE)
		
	var slctl = Letters.get(lidx)
	slctl.modulate = Color(Color.YELLOW)
	if cmi:
		$"../Soul".position.x = slctl.position.x +6
		$"../Soul".position.y = slctl.position.y +13
	
	if Input.is_action_just_pressed("Right") and cmi:
		match lidy:
			0:
				if lidx < 13:
					lidx += 1
					$"../AudioHandler/Sounds/SndMenumove".play()
				else:
					lidx = 0
					$"../AudioHandler/Sounds/SndMenumove".play()
			1:
				if lidx < Letters.size()-1:
					lidx += 1
					$"../AudioHandler/Sounds/SndMenumove".play()
				else:
					lidx = 14
					$"../AudioHandler/Sounds/SndMenumove".play()
	elif Input.is_action_just_pressed("Left") and cmi:
		match lidy:
			0:
				if lidx > 0:
					lidx -= 1
					$"../AudioHandler/Sounds/SndMenumove".play()
				else:
					$"../AudioHandler/Sounds/SndMenumove".play()
					lidx = 13
			1:
				if lidx > 14:
					lidx -= 1
					$"../AudioHandler/Sounds/SndMenumove".play()
				else:
					$"../AudioHandler/Sounds/SndMenumove".play()
					lidx = 25
	elif Input.is_action_just_pressed("Down") and cmi:
		if lidy < 1:
			lidy += 1
			match lidx:
				3:
					lidx = 15
				4:
					lidx = 16
				5:
					lidx = 17
				6:
					lidx = 18
				7:
					lidx = 19
				8:
					lidx = 20
				9:
					lidx = 21
				10:
					lidx = 22
				11:
					lidx = 23
				12:
					lidx = 24
				13:
					lidx = 25
				14:
					lidx = 25
				_:
					lidx = 14
			$"../AudioHandler/Sounds/SndMenumove".play()
		else:
			$"../AudioHandler/Sounds/SndCantselect".play()
	elif Input.is_action_just_pressed("Up") and cmi:
		
		if lidy == 1:
			lidy -= 1
			match lidx:
				15:
					lidx = 3
				16:
					lidx = 4
				17:
					lidx = 5
				18:
					lidx = 6
				19:
					lidx = 7
				20:
					lidx = 8
				21:
					lidx = 9
				22:
					lidx = 10
				23:
					lidx = 11
				24:
					lidx = 12
				25:
					lidx = 13
				25:
					lidx = 14
				_:
					lidx = 0
			$"../AudioHandler/Sounds/SndMenumove".play()
		else:
			$"../AudioHandler/Sounds/SndCantselect".play()
	elif Input.is_action_just_pressed("Accept") and cmi:
		var Name = $Name.text
		var chars = $Name.get_total_character_count()
		if chars < 6:
			Name = Name + slctl.text
			$Name.text = Name
			$"../AudioHandler/Sounds/SndSelect".play()
		else:
			name = name.substr(0,5) + slctl.text
			$Name.text = Name
			$"../AudioHandler/Sounds/SndSelect".play()
	elif Input.is_action_just_pressed("Back") and cmi:
		var Name = $Name.text
		var chars = $Name.get_total_character_count()
		
		if chars > 0:
			Name = Name.substr(0, Name.length() - 1)
			$Name.text = Name
	elif Input.is_action_just_pressed("ConfirmName") and cmi:
		if $Name.text != "":
			$"../Soul".position = Vector2(239.96,202.88)
			$"../Soul".scale = Vector2(.75,.75)
			cmi = false
			$"../Transition".play_backwards("FriskAppear")
			$"../Text".visible = true
			$"../".caninteract = true
			$"../".curtxtp += 1
			$"../".nextpage()
			Global.PlayerName = $Name.text
			Global.SetName = true
			$".".visible = false
		else:
			$"../AudioHandler/Sounds/SndCantselect".play()
		
		

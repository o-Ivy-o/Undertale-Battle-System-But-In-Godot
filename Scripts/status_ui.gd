extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$PLRNAME.text = Global.PlayerName
	$PLRLOVE.text = "LV: "+str(Global.PlayerLove)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$PLRHP.text = str($"../BHellBox/BSoul".hp)+"/"+str(Stats.maxhp.get(Global.PlayerLove-1))

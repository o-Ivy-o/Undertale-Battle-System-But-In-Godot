extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Accept") and Global.watchedintro:
		get_tree().change_scene_to_file("res://Scenes/survey_program.tscn")


func _on_intro_animation_finished(anim_name: StringName) -> void:
	Global.watchedintro = true
	await get_tree().create_timer(.1).timeout
	get_tree().change_scene_to_file("res://Scenes/survey_program.tscn")

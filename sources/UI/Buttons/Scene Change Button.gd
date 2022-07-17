tool
extends Button

export(PackedScene) var next_scene



func _get_configuration_warning() -> String:
	return "next_scene must be set" if not next_scene else ""


func _on_Scene_Change_Button_pressed() -> void:
	get_tree().change_scene_to(next_scene)

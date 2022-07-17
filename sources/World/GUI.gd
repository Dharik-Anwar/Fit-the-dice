extends Control

onready var scene_tree = get_tree()
onready var pause_menu = $"Pause Menu"

var pause := false setget set_pause

func set_pause(value: bool):
	pause = value
	scene_tree.paused = pause
	pause_menu.visible = pause

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("PAUSE") and $Done.text == "":
		self.pause = not pause
		scene_tree.set_input_as_handled()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


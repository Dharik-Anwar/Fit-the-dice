extends Button


func _on_Retry_Button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	

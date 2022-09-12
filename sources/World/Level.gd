extends Node2D

var time = 0

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta: float) -> void:
	$GUI/Time.text = "\n \t \t \t Time: %s seconds" % time
	if $"GUI/Pause Menu".visible == false:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_Timer_timeout() -> void:
	time +=1

func _on_Player_match_pattern() -> void:
	$Timer.stop()
	get_tree().paused = true
	$"GUI/Pause Menu".visible = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$GUI/Done.text = "You finish the game\nin %s seconds" % (time)

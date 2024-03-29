extends KinematicBody2D

signal match_pattern

onready var anim_sprite = $AnimatedSprite

const direction_keys = {
	"LEFT": Vector2.LEFT,
	"DOWN": Vector2.DOWN,
	"UP": Vector2.UP,
	"RIGHT": Vector2.RIGHT
}

var face_pieces = {
	"BACK": 6,
	"BOTTOM": 4,
	"FRONT": 1,
	"LEFT": 2,
	"RIGHT": 5,
	"TOP": 3
}
var velocity = Vector2.ZERO
var collision

func _ready() -> void:
	anim_sprite.frame = face_pieces.TOP - 1
	

func _physics_process(_delta: float) -> void:
	var input_key = recive_input()
	if input_key == null:
		return
	move(input_key)

func move(input: String):
	velocity = direction_keys[input]*64
	collision = move_and_collide(velocity)
	faces(input, collision)

func faces(input, collision):
	if collision != null:
		return
	if input == "RIGHT":
		roll("TOP", "LEFT", "BOTTOM", "RIGHT")
	elif input == "LEFT":
		roll("TOP", "RIGHT", "BOTTOM", "LEFT")
	elif input == "UP":
		roll("TOP", "FRONT", "BOTTOM", "BACK")
	elif input == "DOWN":
		roll("TOP", "BACK", "BOTTOM", "FRONT")
	anim_sprite.frame = face_pieces.TOP - 1

func roll(A, B, C, D):
	var temp = face_pieces[A]
	face_pieces[A] = face_pieces[B]
	face_pieces[B] = face_pieces[C]
	face_pieces[C] = face_pieces[D]
	face_pieces[D] = temp

func recive_input() -> String:
	var keys = ["LEFT", "RIGHT", "UP", "DOWN"]
	var inputs = {
		"LEFT": Input.is_action_just_pressed("LEFT"),
		"DOWN": Input.is_action_just_pressed("DOWN"),
		"UP": Input.is_action_just_pressed("UP"),
		"RIGHT": Input.is_action_just_pressed("RIGHT")
	}
	var input
	for key in keys:
		if inputs[key] == true:
			input = key
	return input


func _on_TargetDetector_area_entered(area: Area2D) -> void:
	if face_pieces.hash() == area.pieces.hash():
		emit_signal("match_pattern")
	

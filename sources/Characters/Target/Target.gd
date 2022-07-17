extends Area2D

signal match_pattern

onready var target = $"."
onready var anim_sprite = $AnimatedSprite
onready var player = $".".get_parent().get_child(2)

var pieces

func _ready() -> void:
	pieces = {
	"BACK": 6,
	"BOTTOM": 4,
	"FRONT": 1,
	"LEFT": 2,
	"RIGHT": 5,
	"TOP": 3
	}
	initialize_face()
	anim_sprite.frame = pieces.TOP - 1

func initialize_face():
	randomize()
	var number_roll = randi() % 10
	for i in range(number_roll):
		var rand = randi() % 10 + 1
		if rand%2 == 0:
			roll("TOP", "LEFT", "BOTTOM", "RIGHT")
		else:
			roll("TOP", "FRONT", "BOTTOM", "BACK")

func roll(A, B, C, D):
	var temp = pieces[A]
	pieces[A] = pieces[B]
	pieces[B] = pieces[C]
	pieces[C] = pieces[D]
	pieces[D] = temp

func _on_Target_body_entered(body: Node) -> void:
	if body.face_pieces.hash() == pieces.hash():
		emit_signal("match_pattern")

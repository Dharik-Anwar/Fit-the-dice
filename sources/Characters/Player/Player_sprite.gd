extends Node2D

onready var sprite = $"."

onready var player = get_parent().get_child(2)

var keys
var faces

func _ready() -> void:
	faces = player.face_pieces
	keys = faces.keys()

func _process(delta: float) -> void:
	animate()

func animate():
	for key in keys:
		var face = sprite.find_node(key)
		face.frame = faces[key] - 1

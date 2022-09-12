extends Area2D


onready var anim_sprite = $AnimatedSprite


const keys = ["RIGHT", "DOWN", "UP", "LEFT"]
const direction_keys = {
	"LEFT": Vector2.LEFT,
	"DOWN": Vector2.DOWN,
	"UP": Vector2.UP,
	"RIGHT": Vector2.RIGHT
}

var pieces = {
	"BACK": 6,
	"BOTTOM": 4,
	"FRONT": 1,
	"LEFT": 2,
	"RIGHT": 5,
	"TOP": 3
}

func _ready() -> void:
	initialize_face()
	anim_sprite.frame = pieces["TOP"] - 1

func initialize_face():
	randomize()
	var number_roll = randi() % 10
	for i in range(number_roll):
		var rand = randi() % 10 + 1
		if rand%2 == 0:
			faces("RIGHT")
		else:
			faces("DOWN")

func faces(input):
	if input == "RIGHT":
		roll("TOP", "LEFT", "BOTTOM", "RIGHT")
	elif input == "LEFT":
		roll("TOP", "RIGHT", "BOTTOM", "LEFT")
	elif input == "UP":
		roll("TOP", "FRONT", "BOTTOM", "BACK")
	elif input == "DOWN":
		roll("TOP", "BACK", "BOTTOM", "FRONT")
	anim_sprite.frame = pieces.TOP - 1

func roll(A, B, C, D):
	var temp = pieces[A]
	pieces[A] = pieces[B]
	pieces[B] = pieces[C]
	pieces[C] = pieces[D]
	pieces[D] = temp

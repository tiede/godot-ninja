extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var AntalPointtekst = get_node("AntalPoint")
onready var AntalLivtekst = get_node("AntalLiv")

func set_antalpointtekst(point):
	$AntalPoint.text = str(point)

func set_antallivtekst(liv):
	$AntalLiv.text = str(liv)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	set_antalpointtekst(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

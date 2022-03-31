extends Area2D

export var Hastighed = 100
export var GaaTil = 100

onready var Monster = $AnimatedSprite
onready var startX = position.x
onready var targetX = startX + GaaTil

func _physics_process(delta):
	position.x = move_to(position.x, targetX, Hastighed*delta)
	
	if position.x == targetX:
		if targetX == startX:
			targetX = position.x + GaaTil
		else:
			targetX = startX
			
func move_to (current, to, step):
	var new = current
	
	if new < to:
		new += step
		Monster.flip_h = false
		Monster.play("Loeb")
		if new > to:
			new = to
	else:
		new -= step
		Monster.flip_h = true
		Monster.play("Loeb")
		if new < to:
			new = to
	
	return new

func _ready():
	pass


func _on_Monster_body_entered(body):
	#queue_free()
	if (body.name == "HeltenAnimated"):
		body.mistet_liv()
	

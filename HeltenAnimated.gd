extends KinematicBody2D

onready var	heltenAnimated = $AnimatedSprite
onready var HUD = get_node("/root/MainScene/CanvasLayer/HUD")

var point : int =  0
var liv : int = 3
var bevaegelse = Vector2(0,0)
var hastighed : int = 50
var tyngdekraft = 10
var hopstyrke = -400

func _physics_process(_delta):
	if Input.is_action_pressed("Flyt_Højre"):
		bevaegelse.x += hastighed
		heltenAnimated.flip_h = false
		heltenAnimated.play("Loeb")
				
	elif Input.is_action_pressed("Flyt_Venstre"):
		bevaegelse.x -= hastighed
		heltenAnimated.flip_h = true
		heltenAnimated.play("Loeb")
		
	elif not is_on_floor():
		heltenAnimated.play("Hop")	
	else:
		heltenAnimated.stop()
	
	bevaegelse.y += tyngdekraft
		
	if Input.is_action_just_pressed("Hop") and is_on_floor():
		bevaegelse.y += hopstyrke
					
	bevaegelse = move_and_slide(bevaegelse,Vector2.UP)
	bevaegelse.x = lerp(bevaegelse.x,0,0.2)
	
	HUD.set_antalpointtekst(point)
	HUD.set_antallivtekst(liv)

func tilfoej_point():
	point += 1
	print("Point : " + str(point))

func _on_Faldezone_body_entered(body):
	mistet_liv()
	
func mistet_liv():
	liv -= 1
	$Scream.play()
	set_position(Vector2(32,564))
	print_debug("Liv : " + str(liv))

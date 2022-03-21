extends KinematicBody2D

# variabler kan f.eks. være

var point : int =  0
var hastighed : int = 200
var tyngdekraft = 30 
var hopstyrke = -50

# Man har altid en variabel med Velocity = Dvs antal sprites der 
# flyttes pr. sekund - vi kalder den bevaegelse 

# Vi benytter en Vector - Den kan have 2 tal X og Y.
var bevaegelse : Vector2 = Vector2()

# Så skal vi bruge vore Grafik med Helten i. 
# Kan også skrives sådan her.
onready var helten : Sprite = get_node("Helt1")

# Vi skal have vores Helt til at bevæge sig.
func hent_tastaturtryk():
	bevaegelse = Vector2()
	
	if Input.is_action_pressed("Flyt_Venstre"):
		bevaegelse.x -= hastighed
		get_node( "Helt1" ).set_flip_h( true)
	if Input.is_action_pressed("Flyt_Højre"):
		bevaegelse.x += hastighed
		get_node( "Helt1" ).set_flip_h( false)
	if Input.is_action_pressed("Flyt_Ned"):
		bevaegelse.y += hastighed
		# get_node( "Helt1" ).set_flip_v(false)
	if Input.is_action_pressed("Flyt_Op"):
		bevaegelse.y -= hastighed
		# get_node( "Helt1" ).set_flip_v(true)
	
	#bevaegelse.y = bevaegelse.y + tyngdekraft
	
	#if Input.is_action_just_pressed("Hop"):	
	#	bevaegelse.y = hopstyrke
	
	bevaegelse = move_and_slide(bevaegelse)
	#bevaegelse.x = lerp(bevaegelse.x,0,0.2)
	#bevaegelse.y = bevaegelse.y + tyngdekraft
		
	#bevaegelse.y = bevaegelse.y + 10	
	#bevaegelse = bevaegelse.normalized() * hastighed	  

func _physics_process(_delta):
	hent_tastaturtryk()

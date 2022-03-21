extends Area2D


func _ready():
	pass

func _on_Moent_body_entered(body):
	queue_free()  #fjerner moenten
	body.tilfoej_point() #fortaeller body har taget en moent

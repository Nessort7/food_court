extends StaticBody2D
var entrar=false
func _input(event):
	if event.is_action_pressed("interact") and entrar == true:
		print("perdon, la tienda aun no esta disponible")

func _on_Area2D_body_entered(body):
	pass
	
	

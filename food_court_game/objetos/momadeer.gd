extends Area2D
var dead = false

func _ready():
	pass
	
func _process(delta):
	if dead == false:
		$AnimatedSprite2D.play("eldi")
		

extends CharacterBody2D

var startPos
var endPos
@export var speed: float

func _ready():
	startPos = position
	endPos = startPos + Vector2(0, 3*16)
	
func updVeloc():
	var movDir = (endPos - position)
	velocity = movDir.normalized()*speed
	
func _physics_process(delta):
	updVeloc()
	move_and_slide()

extends CharacterBody2D

@export var speed = 150
@export var limit = 0.5
@export var endpoint: Marker2D

@onready var animation = $AnimatedSprite2D

var startPosition
var endPosition

func _ready():
	startPosition = position
	endPosition = startPosition + Vector2(3*120, 3*120)

func changeDirection():
	var tempEnd = endPosition
	endPosition = startPosition
	startPosition = tempEnd
	
func updateVelocity():
	var moveDirection = (endPosition - position)
	if moveDirection.length() < limit:
		changeDirection()
		
	velocity = moveDirection.normalized()*speed
	
func updateAnimation():
	var animationstring = "walkup"
	if velocity.y > 0:
		animationstring = "walkdown"
		
		animation.play(animationstring)

func _physics_process(delta):
	updateVelocity()
	move_and_slide()
	updateAnimation()

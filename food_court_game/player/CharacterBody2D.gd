extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@export var mov_vel: float

func handleInput(): #Este pedo es para el movimiento del personaje en 4 direcciones
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down");
	velocity = direction * mov_vel

func _process(delta):
	if Input.is_action_pressed("move_up"):
		anim.play("up")
	elif Input.is_action_pressed("move_down"):
		anim.play("down")
	elif Input.is_action_pressed("move_left"):
		anim.play("left")
	elif Input.is_action_pressed("move_right"):
		anim.play("right")
	else:
		anim.stop()
		anim.frame = 0

func _physics_process(delta):
	
	move_and_slide()
	handleInput()

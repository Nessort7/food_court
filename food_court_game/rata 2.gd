extends CharacterBody2D

@export var speed = 50
@export var limit = 0.5
@export var endpoint: Marker2D

@onready var animation = $AnimatedSprite2D

var startPosition
var endPosition
var direction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	startPosition = position
	var angle = randf_range(-PI, PI);
	direction = Vector2.from_angle(angle)

func change_animation():
	var dir = direction.angle()
	if (dir < 0):
		dir += (PI * 2)
		
	var faces = ["right", "front", "left", "back", "right"]
	var curr_face = faces[floor((dir/(PI/2))+(PI/4))]
	animation.animation = curr_face
		
func randomize_dir():
	direction = -direction.rotated(randf_range(-1.2, 1.2))
	change_animation()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction*speed*delta
	animation.play()
	if (position.distance_to(startPosition) > 80):
		randomize_dir()

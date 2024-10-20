extends CharacterBody2D
@export var speed: int = 50.0
func _ready():
	$AnimatedSprite2D.play("idle")
	
func handleInput():

	var moveDirection := Input.get_vector("left", "right", "up", "down")
	var input := Vector2(moveDirection)
	
	velocity = input * speed
	
	if input == Vector2(1,0):
		$AnimatedSprite2D.play("walking")
		$AnimatedSprite2D.flip_h = true
	elif input == Vector2(-1,0):
		$AnimatedSprite2D.play("walking")
		$AnimatedSprite2D.flip_h = false
	elif input == Vector2(0,1):
		$AnimatedSprite2D.play("walking")
	elif input == Vector2(0,-1):
		$AnimatedSprite2D.play("walking")
	
	if input == Vector2(0,0):
		$AnimatedSprite2D.play("idle")

func _physics_process(delta) -> void:
	handleInput()
	move_and_slide()

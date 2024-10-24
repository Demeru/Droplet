extends CharacterBody2D

@export var minScore = 1
@onready var currentScore= 0:
	set = set_score
	
@onready var droplets_bar: HBoxContainer = $"../UI/DropletsBar"
@onready var resetScore = 0

@export var speed: int = 50.0
#var score: int = 0


func _ready():
	$AnimatedSprite2D.play("idle")
	

func handleInput():

	var moveDirection := Input.get_vector("left", "right", "up", "down")
	var input := Vector2(moveDirection)
	
	velocity = input * speed
	
	if input == Vector2(1,0):
		if resetScore == 0:
			$AnimatedSprite2D.play("walking")
			$AnimatedSprite2D.flip_h = true
		elif resetScore == 1:
			$AnimatedSprite2D.play("walking_big_tree")
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.offset = Vector2(0,-8)
	elif input == Vector2(-1,0):
		if resetScore == 0:
			$AnimatedSprite2D.play("walking")
			$AnimatedSprite2D.flip_h = false
		elif resetScore == 1:
			$AnimatedSprite2D.play("walking_big_tree")
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.offset = Vector2(0,-8)
	elif input == Vector2(0,1):
		if resetScore == 0:
			$AnimatedSprite2D.play("walking")
		elif resetScore == 1:
			$AnimatedSprite2D.play("walking_big_tree")
			$AnimatedSprite2D.offset = Vector2(0,-8)
	elif input == Vector2(0,-1):
		if resetScore == 0:
			$AnimatedSprite2D.play("walking")
		elif resetScore == 1:
			$AnimatedSprite2D.play("walking_big_tree")
			$AnimatedSprite2D.offset = Vector2(0,-8)
	if input == Vector2(0,0):
		if resetScore == 0:
			$AnimatedSprite2D.play("idle")
		if resetScore == 1:
			$AnimatedSprite2D.play("idle_big_tree")

func _physics_process(delta) -> void:
	handleInput()
	move_and_slide()

func set_score(value):
	currentScore = value
	droplets_bar.updateScore(currentScore)

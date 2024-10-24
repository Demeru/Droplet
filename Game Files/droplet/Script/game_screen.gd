extends Node2D

@onready var heartContainer = $UI
@onready var player = $Players

@onready var bars = $UI/DropletsBar

@export var minScore = 0
@onready var currentScore: int = minScore:
	set = set_score
	
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func set_score(value):
	currentScore = clamp(value, 0, 5)
	for bar in bars.get_children():
		bar.update_score(currentScore)

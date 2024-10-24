extends Area2D

@onready var pick_up: AudioStreamPlayer = $PickUp

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("WaterDroplet")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Players":
		body.currentScore += 1
		$PickUp.play()
		if body.currentScore > 5:
			body.currentScore = body.minScore
			body.resetScore += 1
		self.queue_free()

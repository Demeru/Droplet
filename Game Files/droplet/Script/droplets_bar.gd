extends HBoxContainer

var droplet_full = preload("res://Art/fullDroplet.png")
var droplet_empty = preload("res://Art/emptyDroplet.png")

func updateScore(value):
	for i in get_child_count():
		if value > i:
			get_child(i).texture = droplet_full
		else:
			get_child(i).texture = droplet_empty

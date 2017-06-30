extends Panel

onready var wizard_player = preload("res://wizard_player.xml")
onready var wizard = preload("res://wizard.xml")
onready var alien = preload("res://alien.xml")

var wizards = 1
var aliens = 69

func _ready():
	randomize()
	for i in range(69):
		var a = alien.instance()
		a.set_pos(Vector2(rand_range(-20000, 20000), rand_range(-20000, 20000)))
		add_child(a)
	var w = wizard_player.instance()
	w.set_pos(Vector2(11000, 14000))
	add_child(w)
extends Panel

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
	var w = wizard.instance()
	w.set_pos(Vector2(11000, 14000))
	add_child(w)

func _on_goto_scene_pressed():
        get_node("/root/global").goto_scene("res://gameover.xml")
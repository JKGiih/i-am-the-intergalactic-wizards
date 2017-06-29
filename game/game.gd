extends Panel

onready var wizard = preload("res://wizard.xml")
onready var alien = preload("res://alien.xml")

var wizards = 1
var aliens = 69

func _ready():
	var w = wizard.instance()
	var a = alien.instance()
	w.set_pos(Vector2(11000, 14000))
	a.set_pos(Vector2(11000, 15000))
	add_child(w)
	add_child(a)

func _on_goto_scene_pressed():
        get_node("/root/global").goto_scene("res://gameover.xml")
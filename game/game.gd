extends Panel

onready var wizard = preload("res://wizard.xml")
onready var alien = preload("res://alien.xml")

func _ready():
	var w = wizard.instance()
	var a = alien.instance()
	add_child(w)
	add_child(a)

func _on_goto_scene_pressed():
        get_node("/root/global").goto_scene("res://gameover.xml")
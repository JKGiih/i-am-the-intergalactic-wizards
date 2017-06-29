extends RigidBody2D

func die():
	get_parent().aliens -= 1
	get_parent().wizards += 1
	queue_free()

func transmorph():
    var wizard = load("res://wizard.xml")
    var w = wizard.instance()
    die()
    get_parent().add_child(w)
    w.set_pos(get_pos())

func _process(delta):
	pass

func _ready():
	set_process(true)
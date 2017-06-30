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
	if (get_pos().x < -22000):
		set_pos(Vector2(-22000, get_pos().y))
	elif (get_pos().x > 22000):
		set_pos(Vector2(22000, get_pos().y))
	if (get_pos().y < -22000):
		set_pos(Vector2(get_pos().x, -22000))
	elif (get_pos().y > 22000):
		set_pos(Vector2(get_pos().x, 22000))

func _ready():
	set_process(true)
extends RigidBody2D

onready var wizard = load("res://wizard.xml")
	
func die():
	get_parent().aliens -= 1
	get_parent().wizards += 1
	remove_from_group("aliens")
	self.queue_free()

func transmorph():
	var w = wizard.instance()
	get_parent().add_child(w)
	w.set_pos(get_pos())
	die()

func _process(delta):
	
	for b in get_colliding_bodies():
		if (b.is_in_group("missiles")):
			b.life = 0
			self.transmorph()
		elif (b.is_in_group("wizards")):
			b.transmorph()
			self.die()
		elif (b.is_in_group("wizard_players")):
			get_node("/root/global").goto_scene("res://gameover.xml")
	
	if (get_pos().x < -22000):
		set_pos(Vector2(-22000, get_pos().y))
	elif (get_pos().x > 22000):
		set_pos(Vector2(22000, get_pos().y))
	if (get_pos().y < -22000):
		set_pos(Vector2(get_pos().x, -22000))
	elif (get_pos().y > 22000):
		set_pos(Vector2(get_pos().x, 22000))

func _ready():
	set_contact_monitor(true)
	set_max_contacts_reported(1)
	add_to_group("aliens")
	set_process(true)	
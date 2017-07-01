extends RigidBody2D

var x_offset = 0;
var y_offset = 0;
var SPEED = 100;

func die():
	get_parent().wizards -= 1
	get_parent().aliens += 1
	remove_from_group("wizards")
	queue_free()

func transmorph():
	var a = get_parent().alien.instance()
	get_parent().add_child(a)
	a.set_pos(get_pos())
	die()    

func _process(delta):
	var left_pressed = Input.is_action_pressed("ui_left")
	var right_pressed = Input.is_action_pressed("ui_right")
	var up_pressed = Input.is_action_pressed("ui_up")
	var down_pressed =Input.is_action_pressed("ui_down")
		
	if (left_pressed):
		x_offset -= SPEED
	if (right_pressed):
		x_offset += SPEED
	if (up_pressed):
		y_offset -= SPEED
	if (down_pressed):
		y_offset += SPEED
		
	set_pos(Vector2(get_pos().x + x_offset * delta, get_pos().y + y_offset * delta))
	if (get_pos().x < -22000):
		set_pos(Vector2(-22000, get_pos().y))
	elif (get_pos().x > 22000):
		set_pos(Vector2(22000, get_pos().y))
	if (get_pos().y < -22000):
		set_pos(Vector2(get_pos().x, -22000))
	elif (get_pos().y > 22000):
		set_pos(Vector2(get_pos().x, 22000))

func _ready():
	add_to_group("wizards")
	get_node("wizard_sound").play("transformation")
	set_process(true)

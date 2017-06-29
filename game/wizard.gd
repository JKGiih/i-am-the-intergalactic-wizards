extends RigidBody2D

var x_offset = 0;
var y_offset = 0;
var SPEED = 100;
var cooldown = 0;

func die():
	get_parent().wizards -= 1
	get_parent().aliens += 1
	queue_free()

func transmorph():
    var alien = load("res://alien.xml")
    var a = alien.instance()
    die()
    get_parent().add_child(a)
    a.set_pos(get_pos())

func zoom_in(delta):
	var camera = get_node("wizard_camera")
	var zoom = camera.get_zoom().x
	if (zoom > 1):
		zoom -= delta
		camera.set_zoom(Vector2(zoom, zoom))

func zoom_out(delta):
	var camera = get_node("wizard_camera")
	var zoom = camera.get_zoom().x
	if (zoom < 20):
		zoom += 4 * delta
		camera.set_zoom(Vector2(zoom, zoom))

func _process(delta):
	var left_pressed = Input.is_action_pressed("ui_left")
	var right_pressed = Input.is_action_pressed("ui_right")
	var up_pressed = Input.is_action_pressed("ui_up")
	var down_pressed =Input.is_action_pressed("ui_down")
	var fire_pressed = Input.is_action_pressed("ui_accept")
	var fire_x = 0
	var fire_y = 0
	
	if (left_pressed or right_pressed or up_pressed or down_pressed or fire_pressed):
		zoom_in(delta)
	else:
		zoom_out(delta)
	
	if (left_pressed):
		x_offset -= SPEED
		fire_x =- 1
		zoom_in(delta)
	if (right_pressed):
		x_offset += SPEED
		fire_x += 1
		zoom_in(delta)
	if (up_pressed):
		y_offset -= SPEED
		fire_y -= 1
		zoom_in(delta)
	if (down_pressed):
		y_offset += SPEED
		fire_y += 1
		zoom_in(delta)
	if (fire_pressed and cooldown <= 0 and (left_pressed or right_pressed or up_pressed or down_pressed)):
		var missile = load("res://missile.xml")
		var m = missile.instance()
		m.set_pos(get_pos())
		m.x_dir = fire_x
		m.y_dir = fire_y
		get_parent().add_child(m)
		cooldown = .5
	cooldown -= delta
	if (cooldown < 0):
		cooldown = 0
		
	var this = get_node(".")
	this.set_pos(Vector2(this.get_pos().x + x_offset * delta, this.get_pos().y + y_offset * delta))
	if (this.get_pos().x < -22000):
		this.set_pos(Vector2(-22000, this.get_pos().y))
	elif (this.get_pos().x > 22000):
		this.set_pos(Vector2(22000, this.get_pos().y))
	if (this.get_pos().y < -22000):
		this.set_pos(Vector2(this.get_pos().x, -22000))
	elif (this.get_pos().y > 22000):
		this.set_pos(Vector2(this.get_pos().x, 22000))		

func _ready():
	set_process(true)

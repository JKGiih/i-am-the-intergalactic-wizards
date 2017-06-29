extends RigidBody2D

var x_offset = 0;
var y_offset = 0;
var SPEED = 100;

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
		zoom += delta
		camera.set_zoom(Vector2(zoom, zoom))

func _process(delta):
	var left_pressed = Input.is_action_pressed("ui_left")
	var right_pressed = Input.is_action_pressed("ui_right")
	
	if (left_pressed or right_pressed):
		zoom_in(delta)
	else:
		zoom_out(delta)
	
	if (left_pressed):
		x_offset -= SPEED
		zoom_in(delta)
	if (right_pressed):
		x_offset += SPEED
		zoom_in(delta)
	var this = get_node(".")
	this.set_pos(Vector2(this.get_pos().x + x_offset * delta, this.get_pos().y))
	if (this.get_pos().x < -22000):
		this.set_pos(Vector2(-22000, this.get_pos().y))
	elif (this.get_pos().x > 22000):
		this.set_pos(Vector2(22000, this.get_pos().y))

func _ready():
	set_process(true)

func _on_goto_scene_pressed():
	get_node("/root/global").goto_scene("res://gameover.xml")

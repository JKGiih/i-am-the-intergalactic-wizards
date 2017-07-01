extends RigidBody2D

var x_dir = 0
var y_dir = 0
var SPEED = 10000;
var life = 2

func _process(delta):
	
	life -= delta
	if (life <= 0):
		queue_free()
	set_pos(Vector2(get_pos().x + x_dir * SPEED * delta, get_pos().y + y_dir * SPEED * delta))

func _ready():
	add_to_group("missiles")
	get_node("missile_sound").play("missile")
	set_process(true)

##
##  I AM THE INTER-GALACTIC WIZARDS
##
##  Copyright 2017 Lasse Pouru
##
##  ====================================================================
##
##  This file is part of I Am Inter-Galactic Wizards.
##
##  I Am Inter-Galactic Wizards is free software: you can redistribute it
##  and/or modify it under the terms of the GNU General Public License as
##  published by the Free Software Foundation, either version 3 of the
##  License, or (at your option) any later version.
##
##  I Am Inter-Galactic Wizards is distributed in the hope that it will be
##  useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##  GNU General Public License for more details.
##
##  You should have received a copy of the GNU General Public License
##  along with I Am Inter-Galactic Wizards. If not, see
##  <http://www.gnu.org/licenses/>.

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
    var a = get_parent().alien.instance()
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
	add_to_group("wizard_players")
	set_process(true)

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

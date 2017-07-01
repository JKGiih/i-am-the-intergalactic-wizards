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

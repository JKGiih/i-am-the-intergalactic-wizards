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

extends Panel

onready var wizard_player = preload("res://wizard_player.xml")
onready var wizard = preload("res://wizard.xml")
onready var alien = preload("res://alien.xml")

var wizards = 1
var aliens = 69

func _ready():
	randomize()
	for i in range(aliens):
		var a = alien.instance()
		a.set_pos(Vector2(rand_range(-20000, 20000), rand_range(-20000, 20000)))
		add_child(a)
	var w = wizard_player.instance()
	w.set_pos(Vector2(11000, 14000))
	add_child(w)
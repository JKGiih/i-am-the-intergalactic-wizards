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

func _ready():
	pass

func _on_goto_game_pressed():
	get_node("/root/global").goto_scene("res://game.xml")
	queue_free()

func _on_goto_instructions_pressed():
	get_node("/root/global").goto_scene("res://instructions.xml")
	queue_free()
extends Panel

func _ready():
	pass

func _on_goto_game_pressed():
        get_node("/root/global").goto_scene("res://game.xml")

func _on_goto_instructions_pressed():
        get_node("/root/global").goto_scene("res://instructions.xml")
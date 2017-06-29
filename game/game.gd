extends Panel

func _ready():
	pass

func _on_goto_scene_pressed():
        get_node("/root/global").goto_scene("res://gameover.xml")
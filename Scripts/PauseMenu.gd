extends Control

# TODO: Fix bugs

func _on_resume_button_up():
	get_tree().paused = false;
	hide();


func _on_settings_button_up():
	pass # Replace with function body.


func _on_quit_to_menu_button_up():
	# get_tree().change_scene_to_file("res://Scenes/title.tscn")
	pass;

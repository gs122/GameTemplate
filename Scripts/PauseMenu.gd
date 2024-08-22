extends Control

var pauseLayer = get_parent()

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func _on_resume_button_up():
	get_tree().paused = false;
	pauseLayer.hide();


func _on_settings_button_up():
	pass # Replace with function body.


func _on_quit_to_menu_button_up():
	# get_tree().change_scene_to_file("res://Scenes/title.tscn")
	pass;

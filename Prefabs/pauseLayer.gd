extends CanvasLayer


func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	
func _process(delta):
	if Input.is_action_just_pressed("cancel"):
		if get_tree().paused == false:
			show()
			get_tree().paused = true
			return;
		if get_tree().paused == true:
			hide()
			get_tree().paused = false;
			return;

func _on_resume_button_up():
	get_tree().paused = false;
	hide();

func _on_quit_to_menu_button_up():
	GameManager.moveToScene("title");

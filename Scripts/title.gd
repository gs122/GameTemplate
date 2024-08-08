extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_button_up():
	GameManager.startGame();

func _on_settings_button_up():
	GameManager.moveToLevel("settings");

func _on_quit_button_up():
	get_tree().quit();

func _on_tutorial_button_up():
	GameManager.moveToLevel("tutorial");

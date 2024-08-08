extends Node2D

# TODO: Switch levels with a level array instead
var levels = [
	"level-1",
	"level-2",
	"level-3",
	"level-4",
	]
	#"level-5",
	#"level-6",
	#"level-7",
	#"level-8",
	#"level-9",
	#"level-10",
#]

var currLevelIndex = 0;
var playerHP = 3;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func moveToLevel(sceneName):
	var fullScenePath = "res://Scenes/Levels/" + sceneName + ".tscn";
	get_tree().change_scene_to_file(fullScenePath);
	
func moveToScene(sceneName):
	var fullScenePath = "res://Scenes/" + sceneName + ".tscn";
	get_tree().change_scene_to_file(fullScenePath);
	
func levelComplete(sceneName: String, winScreenLayer: CanvasLayer):
	# TODO: Play a Win Jingle
	get_tree().paused = true;
	winScreenLayer.process_mode = Node.PROCESS_MODE_ALWAYS;
	winScreenLayer.visible = true;
	winScreenLayer.checkPlayerInput();
	
func levelNext():
	Spawning.reset_bullets();
	if currLevelIndex+1 < levels.size():
		moveToLevel(levels[currLevelIndex+1]);
		currLevelIndex += 1;
	else:
		winGame();

	get_tree().paused = false;

func startGame():
	Spawning.reset_bullets();
	currLevelIndex = 0;
	GameManager.moveToLevel(GameManager.levels[0]);
	
func winGame():
	Spawning.reset_bullets();
	moveToScene("win")

func gameOver():
	Spawning.reset_bullets();
	GameManager.moveToScene("gameOver");

func drawHealth():
	for n in playerHP:
		print("drawing a heart");
		


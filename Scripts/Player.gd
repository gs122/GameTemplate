class_name Player;
extends Area2D

var speed: float = 200;
var vel := Vector2(0,0);
var hp: int = 10;
var wonLevel = false;

@onready var pause_menu = get_parent().get_node("PauseLayer/PauseMenu")
@onready var healthbar = get_parent().get_node("HealthBar");
@onready var mainCamera = get_parent().get_node("MainCamera");

func _ready():
	if (healthbar):
		print("got healthbar")
		healthbar.startHP(hp);
	pass;

func _physics_process(delta):
	var dirVec := Vector2(0, 0);
	
	if Input.is_action_pressed("left"):
		dirVec.x = -1;
	if Input.is_action_pressed("right"):
		dirVec.x = 1;
	if Input.is_action_pressed("up"):
		dirVec.y = -1;
	if Input.is_action_pressed("down"):
		dirVec.y = 1;

	vel = dirVec.normalized() * speed;
	position += vel * delta;
	
	position.x = clamp(position.x, 0, 500)
	position.y = clamp(position.y, 0, 500)
	
	#if Input.is_action_pressed("cancel"):
		#if get_tree().paused:
			#get_tree().paused = false
			#pause_menu.hide()
		#else:
			#get_tree().paused = true
			#pause_menu.show()

func findObjects():
	healthbar = get_parent().get_node("HealthBar");
	healthbar.updateHP(hp);

func _on_area_entered(area):
	if area is Exit:
		wonLevel = true;
		GameManager.levelComplete(getCurrentScene(), getLevelWinScreen());
	# if area is Bullet:
		# this is being handled in customFunctions.gd bullet collisons
		# check Player.hitByBullet()

func getCurrentScene():
	var currScenePath = get_tree().current_scene.get_scene_file_path();
	var pathArray = currScenePath.split("/", true, 0);
	var currScene = pathArray[pathArray.size()-1];
	return currScene;

func getLevelWinScreen():
	return get_parent().get_node("WinScreenLayer");

func hitByBullet():
	mainCamera.startShake();
	hp -= 1;
	healthbar.updateHP(hp);
	if hp <= 0:
		GameManager.gameOver();

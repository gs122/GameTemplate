extends Camera2D
class_name MainCamera

var originalXPos = 250;
var originalYPos = 250;

var shakeXRange = 10;
var shakeYRange = 10;
var shakeCount = 5;

@onready var shakeTimer = get_node("ShakeTimer");

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func startShake():
	print("shake the camera");
	shake();
	shakeTimer.start();

func shake():
	var randXPos = randf_range(originalXPos-shakeXRange, originalXPos+shakeXRange);
	var randYPos = randf_range(originalYPos-shakeYRange, originalYPos+shakeYRange);
	self.position.x = randXPos;
	self.position.y = randYPos;
	shakeCount -= 1;

func _on_shake_timer_timeout():
	if (shakeCount > 0):
		shake();
	else:
		shakeTimer.stop();
		shakeTimer.emit_signal("on_shake_timer_timeout()")
		self.position.x = originalXPos;
		self.position.y = originalYPos;
		



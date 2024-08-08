extends Control

var heart = load("res://Prefabs/heart.tscn")
 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func startHP(HP):
	# TODO: make amount of hearts equal to player HP
	for n in HP:
		var newHeart = heart.instantiate();
		newHeart.set_name("Heart");
		add_child(newHeart);
		newHeart.position.x = n*32;
	
	
func updateHP(newHP):
	for n in self.get_children():
		remove_child(n);
		n.queue_free();
	
	for n in newHP:
		var newHeart = heart.instantiate();
		newHeart.set_name("Heart");
		add_child(newHeart);
		newHeart.position.x = n*32;
	#TODO: This is a bad way to do it. Instead:
	#Create a bunch of hearts. Delete 1 on the right 
	#with every hit.
	
	#print(newHP)
	#for n in newHP:
		#var newHeart = heart.instantiate();
		#newHeart.set_name("Heart");
		#add_child(newHeart);
		#newHeart.position.x = n*32;

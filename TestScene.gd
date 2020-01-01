extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$DialogueBox.talk(["Krass", "Also... so irgendwie...", "Also... s234o irgendwie...", "A12432535646lso... so irgendwie..."])
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

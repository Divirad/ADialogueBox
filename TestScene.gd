extends Node2D

func _input(event):
	if Input.is_action_just_pressed("ui_down"):
		$DialogueBox.talk(["Lorem ipsum dolor sit amet,", 
		"consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,",
	 	"sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
		" Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. "])